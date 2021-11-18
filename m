Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5D5C4332F
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3702.1637251904514145144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1661B11D4
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B40053F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/19] xmlrpc-c: clean up PACKAGECONFIG
Date: Thu, 18 Nov 2021 16:11:23 +0000
Message-Id: <20211118161138.663375-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94029

Remove spurious commas and redundant RDEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta=
-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
index 4edfbd8c60..ef73455d74 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -30,9 +30,9 @@ EXTRA_OECONF +=3D "--disable-libwww-client --disable-wi=
ninet-client"
=20
 PACKAGECONFIG ??=3D "curl cplusplus"
=20
-PACKAGECONFIG[abyss] =3D "--enable-abyss-server --enable-abyss-threads -=
-enable-abyss-openssl,--disable-abyss-server --disable-abyss-threads --di=
sable-abyss-openssl,openssl,"
-PACKAGECONFIG[cplusplus] =3D "--enable-cplusplus,--disable-cplusplus,,"
-PACKAGECONFIG[curl] =3D "--enable-curl-client,--disable-curl-client,curl=
,curl"
+PACKAGECONFIG[abyss] =3D "--enable-abyss-server --enable-abyss-threads -=
-enable-abyss-openssl,--disable-abyss-server --disable-abyss-threads --di=
sable-abyss-openssl,openssl"
+PACKAGECONFIG[cplusplus] =3D "--enable-cplusplus,--disable-cplusplus"
+PACKAGECONFIG[curl] =3D "--enable-curl-client,--disable-curl-client,curl=
"
=20
 do_configure() {
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gues=
s ${S}
--=20
2.25.1


