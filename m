Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A119C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 14:39:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1472.1742567947325722338
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 07:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC03F106F
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 07:39:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D894D3F673
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 07:39:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fbgrab: append to do_configure
Date: Fri, 21 Mar 2025 14:39:02 +0000
Message-ID: <20250321143902.3563402-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 14:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116189

This allows the default do_configure to run, which will run "make clean"
if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb b/meta-oe/reci=
pes-graphics/fbgrab/fbgrab_1.5.bb
index e17992ee4f..efcf5a9ea6 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/GunnarMonell/fbgrab.git;pro=
tocol=3Dhttps;branch=3Dmaster
 SRCREV =3D "f43ce6d5ce48fb01360eaa7c4a92c2573a1d02f8"
 S =3D "${WORKDIR}/git"
=20
-do_configure() {
+do_configure:prepend() {
     sed \
         -e 's|$(DESTDIR)/usr/bin/|$(DESTDIR)${bindir}/|g' \
         -e 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' \
--=20
2.43.0


