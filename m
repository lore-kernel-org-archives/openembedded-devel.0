Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEFAC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:36:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.86434.1677490560289214507
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: denx.de, ip: 212.18.0.9, mailfrom: sbabic@denx.de)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4PQFjn338yz1r1ff;
	Mon, 27 Feb 2023 10:35:57 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4PQFjn2mYwz1qqlR;
	Mon, 27 Feb 2023 10:35:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id MTndyvYyR__q; Mon, 27 Feb 2023 10:35:56 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Mon, 27 Feb 2023 10:35:55 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 4884A45408A0;
	Mon, 27 Feb 2023 10:35:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id n5Vt69QSmj33; Mon, 27 Feb 2023 10:35:52 +0100 (CET)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id 63301454075E;
	Mon, 27 Feb 2023 10:35:52 +0100 (CET)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH] zchunk: upgrade 1.2.4 -> 1.3.0
Date: Mon, 27 Feb 2023 10:35:50 +0100
Message-Id: <20230227093550.1131959-1-sbabic@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101294

Release zchunk 1.3.0 with the following changes:
 * meson: Use global function in argp check
 * Add ZCK_NO_WRITE option to disable writing to a file

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 .../recipes-support/zchunk/files/clang.patch  | 35 -------------------
 .../{zchunk_1.2.4.bb =3D> zchunk_1.3.0.bb}      |  5 ++-
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-support/zchunk/files/clang.patch
 rename meta-oe/recipes-support/zchunk/{zchunk_1.2.4.bb =3D> zchunk_1.3.0=
.bb} (88%)

diff --git a/meta-oe/recipes-support/zchunk/files/clang.patch b/meta-oe/r=
ecipes-support/zchunk/files/clang.patch
deleted file mode 100644
index 86faf4aac..000000000
--- a/meta-oe/recipes-support/zchunk/files/clang.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e69d907c3fe8765ce50ce1258648ebc8283ef8a7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Feb 2023 14:55:07 -0800
-Subject: [PATCH] meson: Use global function in argp check
-
-clang is optimizing away parse_opt() since its marked static and not
-used in main(), make life a bit harder for clang :)
-removing static now emits the global symbols to be resolved during link
-and when libargp is missing the error is thrown rightly
-
-riscv64-yoe-linux-musl-ld: /tmp/a-5ba039.o: in function `.Lpcrel_hi0':
-a.c:(.text+0x44): undefined reference to `argp_state_help'
-clang-16: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/92/]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 3b92d58..ab54abd 100644
---- a/meson.build
-+++ b/meson.build
-@@ -57,7 +57,7 @@ if host_machine.system() =3D=3D 'windows'
- endif
-=20
- # argp-standalone dependency (if required)
--if build_machine.system() =3D=3D 'windows' or build_machine.system() =3D=
=3D 'darwin' or build_machine.system() =3D=3D 'freebsd' or not cc.links('=
#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct a=
rgp_state *state) { argp_usage(state); return 0; }; void main() {}')
-+if build_machine.system() =3D=3D 'windows' or build_machine.system() =3D=
=3D 'darwin' or build_machine.system() =3D=3D 'freebsd' or not cc.links('=
#include <argp.h>\nerror_t parse_opt (int key, char *arg, struct argp_sta=
te *state) { argp_usage(state); return 0; }; void main() {}')
-     argplib =3D cc.find_library('argp', has_headers : ['argp.h'], requi=
red: false)
-     if not argplib.found()
-         argplib =3D dependency('argp-standalone')
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb b/meta-oe/rec=
ipes-support/zchunk/zchunk_1.3.0.bb
similarity index 88%
rename from meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.3.0.bb
index b4fd02760..07ab28375 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.3.0.bb
@@ -4,10 +4,9 @@ AUTHOR =3D "Jonathan Dieter"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf6e68539f564601a5a5869c31e5=
242"
=20
-SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3D=
main \
-           file://clang.patch"
+SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3D=
main"
=20
-SRCREV =3D "0bed8496262a71beadccd4e562bdac093ef6e06f"
+SRCREV =3D "1d8f14484b4e0b507487abe6c294fb2059b7b72f"
 S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "zstd"
--=20
2.34.1


