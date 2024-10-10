Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A6FCF07B8
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 07:02:37 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.37642.1728543752839247884
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 00:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout02.t-online.de (Postfix) with SMTP id 4245C26998
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 09:02:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.43.30]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1synBN-1TSxcH0; Thu, 10 Oct 2024 09:01:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cryptsetup: fix udev PACKAGECONFIG
Date: Thu, 10 Oct 2024 09:03:54 +0200
Message-ID: <20241010070354.938649-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1728543718-9F7FC40F-D824CF6A/0/0 CLEAN NORMAL
X-TOI-MSGID: a78a9ba7-ca27-4386-a247-018eaad4e74a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 07:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112760

This commit removed the lvm2-udevrules package.
[https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&i=
d=3Dc37c867e1adddd6fa39cf3f3d4c6688ea6dc825a]

Align accordingly to avoid error at do_rootfs

Error:
 Problem 1: package udisks2-2.10.1-r0.corei7_64 from oe-repo requires lib=
blockdev.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libbd_utils=
.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev=
 >=3D 3.2.0, but none of the providers can be installed
  - package gvfs-1.56.0-r0.corei7_64 from oe-repo requires udisks2, but n=
one of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12()(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.0)(64bit), but none of the providers can be inst=
alled
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.4)(64bit), but none of the providers can be inst=
alled
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.7)(64bit), but none of the providers can be inst=
alled
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires cryptset=
up >=3D 2.7.5, but none of the providers can be installed
  - conflicting requests
  - nothing provides lvm2-udevrules needed by cryptsetup-2.7.5-r0.corei7_=
64 from oe-repo
 Problem 2: package gvfs-1.56.0-r0.corei7_64 from oe-repo requires udisks=
2, but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev=
.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libbd_utils=
.so.3()(64bit), but none of the providers can be installed
  - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev=
 >=3D 3.2.0, but none of the providers can be installed
  - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires libgvfs=
common.so()(64bit), but none of the providers can be installed
  - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires libgvfs=
daemon.so()(64bit), but none of the providers can be installed
  - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires gvfs >=3D=
 1.56.0, but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12()(64bit), but none of the providers can be installed
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.0)(64bit), but none of the providers can be inst=
alled
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.4)(64bit), but none of the providers can be inst=
alled
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.7)(64bit), but none of the providers can be inst=
alled
  - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires cryptset=
up >=3D 2.7.5, but none of the providers can be installed
  - conflicting requests
  - nothing provides lvm2-udevrules needed by cryptsetup-2.7.5-r0.corei7_=
64 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
index 54b47ea3f..60bf501eb 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
@@ -53,7 +53,7 @@ PACKAGECONFIG[veritysetup] =3D "--enable-veritysetup,--=
disable-veritysetup"
 PACKAGECONFIG[luks2-reencryption] =3D "--enable-luks2-reencryption,--dis=
able-luks2-reencryption"
 PACKAGECONFIG[integritysetup] =3D "--enable-integritysetup,--disable-int=
egritysetup"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,,udev lvm2-udevrul=
es"
+PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,,udev lvm2"
 PACKAGECONFIG[kernel_crypto] =3D "--enable-kernel_crypto,--disable-kerne=
l_crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=3Dgcrypt or the flag isn'=
t
 # recognized.
--=20
2.46.1


