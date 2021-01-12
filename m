Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web09.16725.1610486999804452573
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4DFkHn2gBHz1s46W;
	Tue, 12 Jan 2021 22:29:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4DFkHn24z8z1qql5;
	Tue, 12 Jan 2021 22:29:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id woGEmlavies0; Tue, 12 Jan 2021 22:29:56 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 12 Jan 2021 22:29:56 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id A63A04540908;
	Tue, 12 Jan 2021 22:29:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msefdJf2XtHX; Tue, 12 Jan 2021 22:29:52 +0100 (CET)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.64])
	by babic.homelinux.org (Postfix) with ESMTP id CD1094540829;
	Tue, 12 Jan 2021 22:29:52 +0100 (CET)
From: "Stefano Babic" <sbabic@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: stefan@herbrechtsmeier.net,
	Stefano Babic <sbabic@denx.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libconfig: split package for C++
Date: Tue, 12 Jan 2021 22:29:43 +0100
Message-Id: <20210112212943.373595-1-sbabic@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is current just one package for libconfig and libconfig++ library.
In case footprint matters as an image in initramfs, the C++ binding if
not required adds additional dependencies (libstdc++).

This split the packages to let include just what is needed.

Signed-off-by: Stefano Babic <sbabic@denx.de>
Suggested-by : Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Reported-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb b/meta=
-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
index 148e85ce1..70ea82eb9 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
@@ -13,3 +13,7 @@ inherit autotools-brokensep pkgconfig
=20
 SRC_URI[md5sum] =3D "6bd98ee3a6e6b9126c82c916d7a9e690"
 SRC_URI[sha256sum] =3D "7c3c7a9c73ff3302084386e96f903eb62ce06953bb166623=
5fac74363a16fad9"
+
+PACKAGE_BEFORE_PN =3D "${PN}++"
+FILES_${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
+
--=20
2.25.1

