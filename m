Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92809C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 09:18:13 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7063.1783934285418216765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 02:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=tGDh2U06;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout02.t-online.de (Postfix) with SMTP id 94980E01D
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 11:18:02 +0200 (CEST)
Received: from fedora.fritz.box ([84.163.43.133]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wjCna-29WLM90; Mon, 13 Jul 2026 11:18:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libcamera: add libdrm dependency
Date: Mon, 13 Jul 2026 11:17:56 +0200
Message-ID: <20260713091756.66416-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TOI-EXPURGATEID: 150726::1783934282-DDFF8873-B5EF19E9/0/0 CLEAN NORMAL
X-TOI-MSGID: fee1d93e-aa62-48ec-b193-68163d206a81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1783934282; i=f_l_k@t-online.de;
	bh=vpKOLcdHZ9bkeUEffjC/3WRkLXOkX0JOhEf1ntMHl3s=;
	h=From:To:Subject:Date;
	b=tGDh2U06sg2BqMgMQ9iVrUPUNogbeMPRJQY1xgHdn7wjud5pFxkcSmlgDkPogEi/m
	 rB1h5MUnup/Sp4jsy8aqZmGYHVSUp6UW0qkLq3I+G0Ou/pWh98nuLf9FBs7YthTU1f
	 Nh/VE2s6JZ+C4pid7/kU9VJAJUcmMfxuocz578y8KYOUa+J3gucAl6Cz8UgzkY4OJL
	 ZB5NQmhmKDveYG9vjcWlQNfz8O3ZpiWauZGYc+qdQJDZB/WfPD0xdDG4Kk3duIRKrt
	 jGgp1JFowgupmi+aoRR9aQmqKNUQ+cZ7zS6bZasZg/sNFV4ULG1mLCkyK2CJU7KPT6
	 RL0Lcwi1BEsbg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 09:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128152

This fixes an issue seeen if 'glvnd' is in DISTRO_FEATURES:
| FAILED: [code=3D1] src/libcamera/libcamera.so.0.7.1.p/egl.cpp.o
| x86_64-oe-linux-g++ -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse=
 -msse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wfor=
mat-security -Werror=3Dformat-security --sysroot=3D/home/flk/bitbake/bitbak=
e-builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/recipe-sysroo=
t -Isrc/libcamera/libcamera.so.0.7.1.p -Isrc/libcamera -I../sources/libcame=
ra-0.7.1/src/libcamera -Iinclude -I../sources/libcamera-0.7.1/include -Iinc=
lude/libcamera -Iinclude/libcamera/ipa -Iinclude/libcamera/internal -Isrc/l=
ibcamera/proxy -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-=
64-oe-linux/libcamera/0.7.1/recipe-sysroot/usr/include/p11-kit-1 -fdiagnost=
ics-color=3Dalways -D_GLIBCXX_ASSERTIONS=3D1 -D_FILE_OFFSET_BITS=3D64 -Wall=
 -Winvalid-pch -Wextra -Werror -std=3Dc++20 -Wnon-virtual-dtor -Wno-redunda=
nt-move -Wmissing-declarations -Wshadow -include /home/flk/bitbake/bitbake-=
builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/build/config.h =
-O2 -g -fcanon-prefix-map -ffile-prefix-map=3D/home/flk/bitbake/bitbake-bui=
lds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/sources/libcamera-=
0.7.1=3D/usr/src/debug/libcamera/0.7.1 -ffile-prefix-map=3D/home/flk/bitbak=
e/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/build=
=3D/usr/src/debug/libcamera/0.7.1 -ffile-prefix-map=3D/home/flk/bitbake/bit=
bake-builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/recipe-sys=
root=3D -ffile-prefix-map=3D/home/flk/bitbake/bitbake-builds/oe/build/tmp/w=
ork/corei7-64-oe-linux/libcamera/0.7.1/recipe-sysroot-native=3D -pipe -fvis=
ibility-inlines-hidden -Wno-error=3Darray-bounds -fPIC -DLIBCAMERA_BASE_PRI=
VATE -MD -MQ src/libcamera/libcamera.so.0.7.1.p/egl.cpp.o -MF src/libcamera=
/libcamera.so.0.7.1.p/egl.cpp.o.d -o src/libcamera/libcamera.so.0.7.1.p/egl=
.cpp.o -c ../sources/libcamera-0.7.1/src/libcamera/egl.cpp
| ../sources/libcamera-0.7.1/src/libcamera/egl.cpp:22:10: fatal error: libd=
rm/drm_fourcc.h: No such file or directory
|    22 | #include <libdrm/drm_fourcc.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.b=
b b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
index 2b351a39be..68b2c6648c 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
@@ -17,7 +17,7 @@ SRCREV =3D "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
=20
 PE =3D "1"
=20
-DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nativ=
e python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
+DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nativ=
e python3-jinja2-native udev gnutls chrpath-native libevent libyaml libdrm"
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase=
-native', '', d)}"
=20
 PACKAGES =3D+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
--=20
2.55.0


