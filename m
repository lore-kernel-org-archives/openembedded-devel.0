Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB7DC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 12:53:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6188.1705064023314461766
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 04:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7B202F4
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:54:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 281A33F73F
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:53:42 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] libuser: remove obsolete GTKDOC_DOCDIR assignment
Date: Fri, 12 Jan 2024 12:53:38 +0000
Message-Id: <20240112125340.495067-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112125340.495067-1-ross.burton@arm.com>
References: <20240112125340.495067-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 12:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108237

From: Ross Burton <ross.burton@arm.com>

Now that autotools uses autopoint to call gtkdocize, this variable is no
longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-support/libuser/libuser_0.64.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-gnome/recipes-support/libuser/libuser_0.64.bb b/meta-gn=
ome/recipes-support/libuser/libuser_0.64.bb
index 973159c792..6d3bce8a1c 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.64.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -27,11 +27,6 @@ REQUIRED_DISTRO_FEATURES =3D "pam"
=20
 EXTRA_OEMAKE =3D "PYTHON_CPPFLAGS=3D-I${STAGING_INCDIR}/${PYTHON_DIR}${P=
YTHON_ABI}"
=20
-GTKDOC_DOCDIR =3D "${S}/docs/reference"
-
-# run autopoint since it needs ABOUT-NLS and admin/config.rpath from get=
text
-#EXTRA_AUTORECONF:remove =3D "--exclude=3Dautopoint"
-
 do_configure:prepend() {
     install -d ${S}/admin -d ${S}/m4
     touch ${S}/ABOUT-NLS ${S}/admin/config.rpath
--=20
2.34.1


