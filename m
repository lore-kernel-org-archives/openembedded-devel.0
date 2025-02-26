Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE11C1B087
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8947.1740585038465080690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 170801516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C17053F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 19/23] monit: fix autoreconf
Date: Wed, 26 Feb 2025 15:50:16 +0000
Message-ID: <20250226155022.1989209-19-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115671

autoreconf needs to be told where to find macros as the Makefile.am does
not do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/monit/monit_5.34.4.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/monit/monit_5.34.4.bb b/meta-oe/reci=
pes-support/monit/monit_5.34.4.bb
index 349548e31e..c0f1d1fd7c 100644
--- a/meta-oe/recipes-support/monit/monit_5.34.4.bb
+++ b/meta-oe/recipes-support/monit/monit_5.34.4.bb
@@ -20,6 +20,9 @@ SRC_URI[sha256sum] =3D "ef607cfaabfd3767d40b9b9e32032f7=
48beebc4d686831f6111e0e68fb
 DEPENDS =3D "zlib bison-native libnsl2 flex-native openssl virtual/crypt=
"
=20
 inherit autotools-brokensep systemd update-rc.d
+# brokensep because | ../../monit-5.34.4/libmonit/src/util/Str.c:26:10: =
fatal error: Config.h: No such file or directory
+
+EXTRA_AUTORECONF +=3D "-I config"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
@@ -38,10 +41,6 @@ INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME:${PN} =3D "monit"
 INITSCRIPT_PARAMS:${PN} =3D "defaults 89"
=20
-do_configure:prepend() {
-    rm -rf ${S}/m4/*
-}
-
 do_install:append() {
=20
     # Configuration file
--=20
2.43.0


