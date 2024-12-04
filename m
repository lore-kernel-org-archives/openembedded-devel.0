Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8406EE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 11:44:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12026.1733312685129757920
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Dec 2024 03:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEA14FEC
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Dec 2024 03:45:12 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36B733F71E
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Dec 2024 03:44:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] classes/gpe: remove obsolete class
Date: Wed,  4 Dec 2024 11:44:41 +0000
Message-Id: <20241204114441.1323741-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204114441.1323741-1-ross.burton@arm.com>
References: <20241204114441.1323741-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 11:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114198

xserver-common was the last recipe to use this, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/classes/gpe.bbclass | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-oe/classes/gpe.bbclass

diff --git a/meta-oe/classes/gpe.bbclass b/meta-oe/classes/gpe.bbclass
deleted file mode 100644
index a9b1cd5a90..0000000000
--- a/meta-oe/classes/gpe.bbclass
+++ /dev/null
@@ -1,17 +0,0 @@
-DEPENDS:prepend =3D "virtual/libintl intltool-native "
-GPE_TARBALL_SUFFIX ?=3D "gz"
-SRC_URI =3D "${GPE_MIRROR}/${BP}.tar.${GPE_TARBALL_SUFFIX}"
-FILES:${PN} +=3D "${datadir}/gpe ${datadir}/application-registry"
-SECTION ?=3D "gpe"
-
-inherit gettext
-
-gpe_do_compile() {
-    oe_runmake PREFIX=3D${prefix}
-}
-
-gpe_do_install() {
-    oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
-}
-
-EXPORT_FUNCTIONS do_compile do_install
--=20
2.34.1


