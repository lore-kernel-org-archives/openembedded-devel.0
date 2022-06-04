Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B405FC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 16:53:11 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web12.11985.1654361587949929246
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jun 2022 09:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id 1D73E16769
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  4 Jun 2022 18:53:06 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxX1H-0Unkf30; Sat, 4 Jun 2022 18:52:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-mingw][PATCH] libsdl2: disable gles2 support for
 class-nativesdk
Date: Sat,  4 Jun 2022 18:52:51 +0200
Message-Id: <20220604165251.369796-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654361579-01439E5E-00C349DB/0/0 CLEAN NORMAL
X-TOI-MSGID: 287a78fa-04af-4594-affa-00d2efe892f9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jun 2022 16:53:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97411

this fixes:
| Has header "sys/select.h" : NO
| Checking whether type "fd_set" has member "fds_bits" : NO
| Checking whether type "fd_set" has member "__fds_bits" : NO
|
| ../xorgproto-2022.1/include/X11/meson.build:19:4: ERROR: Problem encoun=
tered: Your fd_set is too weird.
|
| A full log can be found at /home/flk/build/poky/build/tmp/work/x86_64-n=
ativesdk-mingw32-w64-mingw32/nativesdk-xorgproto/2022.1-r0/build/meson-lo=
gs/meson-log.txt

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-graphics/libsdl2/libsdl2_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-graphics/libsdl2/libsdl2_%.bbappend b/recipes-graphi=
cs/libsdl2/libsdl2_%.bbappend
index 89532d6..4f9cde1 100644
--- a/recipes-graphics/libsdl2/libsdl2_%.bbappend
+++ b/recipes-graphics/libsdl2/libsdl2_%.bbappend
@@ -1,7 +1,7 @@
 # Need to disable X11 explictly as nativesdk-libxdmcp fails:
 # .libs/Fill.o:Fill.c:(.text+0x48): undefined reference to `_imp__recvfr=
om@24'
 # .libs/Flush.o:Flush.c:(.text+0x36): undefined reference to `_imp__send=
to@24'
-PACKAGECONFIG:remove:mingw32:class-nativesdk =3D "x11 opengl"
+PACKAGECONFIG:remove:mingw32:class-nativesdk =3D "x11 opengl gles2"
=20
 # libtool doesn't think it can link windres output (COFF) with libtool o=
bjects
 # (COFF) , but it can.  This might be because file misidentifies version=
.o:
--=20
2.25.1


