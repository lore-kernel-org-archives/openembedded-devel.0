Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C068C982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:37:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42954.1789659452888948790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=F4yjuKBT;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5B561596
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02EB83F7B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789659452; bh=+8Q0ns7RKkKA8WZYFuuPKTEf8Izc3569i7Qf9HkSVkk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F4yjuKBTX2BZJKHiZD/k40FXVR0aPjRD+ThQRsH/+FEMoG7EuC28x5lBfNX/E8U/Z
	 Qj2L4i6tPQSAqcAMSkuBdcKxBfjJuaCJxDcgG5Hpmwb71uX7iRFvSnQqPA4mgrkKy2
	 1Sqg8gyn1RI7QZxC+nfaTbI6sh1NF5Q7C2+fOLg4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 2/8] python3-networkmanager: remove abandoned recipe
Date: Thu, 17 Sep 2026 16:37:19 +0100
Message-ID: <20260917153727.3057505-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917153727.3057505-1-ross.burton@arm.com>
References: <20260917153727.3057505-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 15:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130099

python-networkmanager was abandoned upstream in 2023:

  =E2=9A=A0=EF=B8=8F This project is no longer maintained. =E2=9A=A0=EF=B8=
=8F
  If you are looking for an alternative, please try
  https://github.com/python-sdbus/python-sdbus-networkmanager

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-networkmanager_2.2.bb                   | 13 -------------
 .../packagegroups/packagegroup-meta-networking.bb   |  1 -
 2 files changed, 14 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/python-networkma=
nager/python3-networkmanager_2.2.bb

diff --git a/meta-networking/recipes-connectivity/python-networkmanager/p=
ython3-networkmanager_2.2.bb b/meta-networking/recipes-connectivity/pytho=
n-networkmanager/python3-networkmanager_2.2.bb
deleted file mode 100644
index 60cf3c2525d..00000000000
--- a/meta-networking/recipes-connectivity/python-networkmanager/python3-=
networkmanager_2.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY =3D "Easy communication with NetworkManager from Python"
-HOMEPAGE =3D "https://github.com/seveas/python-networkmanager"
-LICENSE =3D "Zlib"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9f8a5b5844f027357ab19ef3e3c6a=
956"
-
-SRC_URI[md5sum] =3D "7e05d3ca40a4fa50222ba93cda3d0d02"
-SRC_URI[sha256sum] =3D "de6eb921d94aba7549f428ed2b3aa482a5d543ecb6965cba=
a0fbb555ab31b9d5"
-
-PYPI_PACKAGE =3D "python-networkmanager"
-inherit pypi setuptools3
-
-RDEPENDS:${PN} =3D "networkmanager python3-dbus python3-six"
diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta=
-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-=
meta-networking.bb
index 06cf5a70837..085aebd4559 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networ=
king.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networ=
king.bb
@@ -57,7 +57,6 @@ RDEPENDS:packagegroup-meta-networking-connectivity =3D =
"\
     networkmanager-openvpn \
     networkmanager \
     openconnect \
-    python3-networkmanager \
     rdate \
     rdist \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
--=20
2.43.0


