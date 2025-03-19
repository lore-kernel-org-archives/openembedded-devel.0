Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF5EC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:42:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1069.1742406122380366632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DFF0113E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B4673F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:42:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 12/12] fbgrab: don't inherit autotools
Date: Wed, 19 Mar 2025 17:41:52 +0000
Message-ID: <20250319174152.706861-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319174152.706861-1-ross.burton@arm.com>
References: <20250319174152.706861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 17:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116097

This upstream does not in fact use autotools, so remove the inherit and
implement the required do_install.

Also fix the hardcoded /usr/bin to use ${bindir}.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb b/meta-oe/reci=
pes-graphics/fbgrab/fbgrab_1.5.bb
index 7b52ead909..efcf5a9ea6 100644
--- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
@@ -9,8 +9,13 @@ SRC_URI =3D "git://github.com/GunnarMonell/fbgrab.git;pr=
otocol=3Dhttps;branch=3Dmaster
 SRCREV =3D "f43ce6d5ce48fb01360eaa7c4a92c2573a1d02f8"
 S =3D "${WORKDIR}/git"
=20
-inherit autotools-brokensep
-
 do_configure:prepend() {
-    sed -i 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' ${S}/Makefile
+    sed \
+        -e 's|$(DESTDIR)/usr/bin/|$(DESTDIR)${bindir}/|g' \
+        -e 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' \
+        -i ${S}/Makefile
+}
+
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install
 }
--=20
2.43.0


