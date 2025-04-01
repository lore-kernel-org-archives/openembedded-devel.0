Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D9DC36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 06:55:50 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.13238.1743490544627370098
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 23:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 52762954
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Apr 2025 08:55:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.183]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tzVX4-3rvik50; Tue, 1 Apr 2025 08:55:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gimp: disable lua for arm
Date: Tue,  1 Apr 2025 08:56:22 +0200
Message-ID: <20250401065622.1503632-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743490535-6F7FDACD-2B681DC3/0/0 CLEAN NORMAL
X-TOI-MSGID: b508e9fd-6c98-4b03-8a46-96a606b1cfdd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 06:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116465

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
|	|          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| In file included from /usr/include/sys/cdefs.h:731,
|                  from /usr/include/features.h:524,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_lib.c:6:
| /usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32=
.h: No such file or directory
|    23 | #include <bits/long-double-32.h>
|	|          ^~~~~~~~~~~~~~~~~~~~~~~
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
|	|          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.2.bb
index f56c12c89b..b110e3ae02 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -100,6 +100,7 @@ PACKAGECONFIG ?=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcursor', '', d)=
} \
 "
=20
+PACKAGECONFIG:remove:arm =3D "lua"
 PACKAGECONFIG:remove:riscv32 =3D "lua"
 PACKAGECONFIG:remove:riscv64 =3D "lua"
 PACKAGECONFIG:remove:powerpc64 =3D "lua"
--=20
2.49.0


