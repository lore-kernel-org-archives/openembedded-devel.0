Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC4AC7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 17:01:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2924.1684861272378756978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 10:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F025E11FB;
	Tue, 23 May 2023 10:01:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79C143F67D;
	Tue, 23 May 2023 10:01:11 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] gutenprint: match ownership on /etc/cups
Date: Tue, 23 May 2023 18:01:09 +0100
Message-Id: <20230523170109.2326481-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 17:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102741

From: Ross Burton <ross.burton@arm.com>

This recipe currently uses DIRFILES to work around the fact that both
cups and gutenprint ship /etc/cups but with different ownership.

Instead of having mismatching ownership, we can simply match the
ownership in gutenprint.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-printing/gutenprint/gutenprint_git.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb b/meta=
-oe/recipes-printing/gutenprint/gutenprint_git.bb
index abdd3d5e40..17522590d9 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
@@ -51,6 +51,8 @@ do_configure() {
 do_install:append() {
     # This file contains build paths and isn't very useful, remove it
     rm -f ${D}${libdir}/gutenprint/*/config.summary
+    # Match ownership to cups
+    chgrp lp ${D}${sysconfdir}/cups
 }
=20
 do_compile:class-native() {
@@ -65,8 +67,8 @@ do_install:class-native() {
 FILES:${PN} +=3D "${datadir}/cups/*"
 RDEPENDS:${PN} =3D "perl"
=20
-# Install in /etc/cups when RPM needs DIRFILES to not conflict
-# https://stackoverflow.com/questions/44762430/why-do-i-get-etc-cups-con=
flicts-between-attempted-installs-in-yocto
-DIRFILES =3D "1"
-
 BBCLASSEXTEND =3D "native"
+
+# Pull in base-passwd for the lp user
+DEPENDS:append:class-target =3D "base-passwd"
+PACKAGE_WRITE_DEPS +=3D "base-passwd"
--=20
2.34.1


