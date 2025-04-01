Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8229BC36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 06:51:40 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.13192.1743490293367360584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 23:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout06.t-online.de (Postfix) with SMTP id CAC53817
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Apr 2025 08:51:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.183]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tzVSn-0xKiHZ0; Tue, 1 Apr 2025 08:51:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mpv: disable lua for arm
Date: Tue,  1 Apr 2025 08:51:48 +0200
Message-ID: <20250401065148.1388290-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743490269-8D7F9927-65422849/0/0 CLEAN NORMAL
X-TOI-MSGID: 8c91192f-5716-47f9-bc59-09b730f69a50
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 06:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116464

luajit currently fails for arm:
e -c -o lj_vmmath_dyn.o lj_vmmath.c
| In file included from /usr/include/sys/cdefs.h:731,
|                  from /usr/include/features.h:524,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_asm.c:6:
| /usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32=
.h: No such file or directory
|    23 | #include <bits/long-double-32.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| In file included from /usr/include/sys/cdefs.h:731,
|                  from /usr/include/features.h:524,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_lib.c:6:
| /usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32=
.h: No such file or directory
|    23 | #include <bits/long-double-32.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| In file included from /usr/include/sys/cdefs.h:731,
|                  from /usr/include/features.h:524,
|                  from /usr/include/bits/libc-header-start.h:33,
|                  from /usr/include/limits.h:26,
|                  from /usr/lib/gcc/x86_64-poky-linux/14.2.0/include/lim=
its.h:210,
|                  from /usr/lib/gcc/x86_64-poky-linux/14.2.0/include/sys=
limits.h:7,
|                  from /usr/lib/gcc/x86_64-poky-linux/14.2.0/include/lim=
its.h:34,
|                  from host/minilua.c:33:
| /usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32=
.h: No such file or directory
|    23 | #include <bits/long-double-32.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.40.0.bb
index 3d54bbb341..55da637227 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
@@ -25,6 +25,7 @@ inherit meson pkgconfig mime-xdg
 LDFLAGS:append:riscv64 =3D " -latomic"
=20
 LUA ?=3D "lua"
+LUA:arm =3D ""
 LUA:mips64  =3D ""
 LUA:powerpc64  =3D ""
 LUA:powerpc64le  =3D ""
--=20
2.49.0


