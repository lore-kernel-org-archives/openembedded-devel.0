Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D46CD4849
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 21:02:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8330.1762981371342233733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 13:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF24F1595
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:02:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECFDF3F66E
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:02:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] gnome-tweaks: remove .pyc files with buildpaths embedded
Date: Wed, 12 Nov 2025 21:02:44 +0000
Message-ID: <20251112210245.1851637-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 21:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121583

The python "optimised" .pyc files contain buildpaths. Delete those and
leave the "unoptimised" .pyc files. The difference is very minor, mainly
that optimised bytecode doesn't contain any assert statements.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b=
/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
index a8d6a2ad69..498d392e89 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
@@ -25,6 +25,12 @@ SRC_URI +=3D " \
=20
 EXTRA_OEMESON =3D "-Dpython_site_dir=3D${PYTHON_SITEPACKAGES_DIR}"
=20
+# The optimised .pyc files contain buildpaths, delete them and leave the
+# normal ones to be packaged.
+do_install:append() {
+    find ${D}${PYTHON_SITEPACKAGES_DIR} -name *.opt*.pyc -delete
+}
+
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
     ${PYTHON_SITEPACKAGES_DIR} \
--=20
2.43.0


