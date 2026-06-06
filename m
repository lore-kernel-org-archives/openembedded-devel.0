Return-Path: <mk@mkio.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C252BCD8C8E
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 11:12:55 +0000 (UTC)
Received: from mail-relay.contabo.net (mail-relay.contabo.net [207.180.195.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14091.1780744367318372284
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2026 04:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mkio.de header.s=default header.b=ffhGBEsh;
 spf=pass (domain: mkio.de, ip: 207.180.195.6, mailfrom: mk@mkio.de)
Received: from pxmg2.contabo.net (localhost.localdomain [127.0.0.1])
	by mail-relay.contabo.net (Proxmox) with ESMTP id 49DD07C2125
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jun 2026 13:12:45 +0200 (CEST)
Received: from m2731.contabo.net (m2731.contabo.net [193.34.145.203])
	by mail-relay.contabo.net (Proxmox) with ESMTPS id 2257D7C2107
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jun 2026 13:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mkio.de;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LRQrukY4PDj2Y6dczARLxavWc6jHOxIueb4sVL1fl28=; b=ffhGBEshqVtXhNrZL8SvZd5dAx
	lXWbGVeRa9nu88cg7lW6YjLKauQN4gdXPpnJnQSNvif77zkVqJ2DxNZr8TJ9B09Z42KRBhRt6fTwR
	pvxgSS8W4mh3jxtjcM50CdGBcr20E53o0z1UT1fAxMCjmBGeP4pG/jousD+6VMxs5o5YLpdLIYg/L
	a+HYyOBKDk6MMHyapSA47jb11FIhG2pk2y5E7XiOLzbx4c7GVO+73iQuF5+uWO4NSwpye307vRuwR
	teZ+pq8L/sHdOBgz9qWpu4gDiy8SF5w5YFGZyP2kxwMxeNIYbH59kQXaa1ms9IQvZUGp96oOpYGf8
	Vg+iueLg==;
Received: from ip-078-042-120-089.um17.pools.vodafone-ip.de ([78.42.120.89]:62808 helo=p14s.fritz.box)
	by m2731.contabo.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <mk@mkio.de>)
	id 1wVoxJ-00000000mu7-2B6h;
	Sat, 06 Jun 2026 13:12:44 +0200
From: Markus Klotzbuecher <mk@mkio.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH] libpwquality: make python bindings optional via PACKAGECONFIG
Date: Sat,  6 Jun 2026 13:12:17 +0200
Message-ID: <20260606111217.3730093-1-mk@mkio.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - m2731.contabo.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - mkio.de
X-Get-Message-Sender-Via: m2731.contabo.net: authenticated_id: mk@mkio.de
X-Authenticated-Sender: m2731.contabo.net: mk@mkio.de
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2026 11:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127407

The python bindings are built unconditionally, so using libpwquality
drags libpython3 and python3-core onto the image even when only the C
library or pam_pwquality is needed.

Add a "python3" PACKAGECONFIG for the bindings, enabled by default to
keep the current behaviour. The setuptools3-base inherit is deferred
and conditional on it. With python3 disabled, the package depends only
on cracklib and libc.

Signed-off-by: Markus Klotzbuecher <mk@mkio.de>
---
 .../libpwquality/libpwquality_1.4.5.bb              | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb =
b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index 7ec01ecd3f..b7c673be52 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel/lib"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde676=
fc2"
=20
-DEPENDS =3D "cracklib python3-setuptools-native"
+DEPENDS =3D "cracklib"
=20
 SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;=
protocol=3Dhttps \
     file://0001-Use-setuptools-instead-of-distutils.patch \
@@ -14,7 +14,8 @@ SRC_URI =3D "git://github.com/libpwquality/libpwquality=
;branch=3Dmaster;protocol=3Dhtt
 SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
=20
=20
-inherit autotools-brokensep gettext setuptools3-base
+inherit autotools-brokensep gettext
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'setuptoo=
ls3-base', '', d)}
=20
 do_configure:prepend() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
@@ -24,15 +25,13 @@ export PYTHON_DIR
 export BUILD_SYS
 export HOST_SYS
=20
-EXTRA_OECONF +=3D "--with-python-rev=3D${PYTHON_BASEVERSION} \
-                 --with-python-binary=3D${STAGING_BINDIR_NATIVE}/python3=
-native/python3 \
-                 --with-pythonsitedir=3D${PYTHON_SITEPACKAGES_DIR} \
-                 --libdir=3D${libdir} \
+EXTRA_OECONF +=3D "--libdir=3D${libdir} \
                  --with-securedir=3D${base_libdir}/security \
 "
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)} python3"
 PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[python3] =3D "--enable-python-bindings --with-python-rev=3D=
${PYTHON_BASEVERSION} --with-python-binary=3D${STAGING_BINDIR_NATIVE}/pyt=
hon3-native/python3 --with-pythonsitedir=3D${PYTHON_SITEPACKAGES_DIR},--d=
isable-python-bindings,python3-setuptools-native"
=20
 FILES:${PN} +=3D "${base_libdir}/security/pam_pwquality.so"
 FILES:${PN}-dbg +=3D "${base_libdir}/security/.debug"
--=20
2.53.0



