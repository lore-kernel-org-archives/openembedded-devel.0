Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D1BC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 17:39:10 +0000 (UTC)
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
 by mx.groups.io with SMTP id smtpd.web11.53348.1745859114055161983
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 09:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=huUCBv4Q;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.18, mailfrom: jeroen@myspectrum.nl)
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4ZmTxg5MmGzkQNKq;
	Mon, 28 Apr 2025 18:51:51 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission10.mail.transip.nl (Postfix) with ESMTPSA id 4ZmTxf3tTZz2nC0ck;
	Mon, 28 Apr 2025 18:51:50 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 866F6200DB;
	Mon, 28 Apr 2025 16:51:47 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Mon, 28 Apr 2025 18:51:46 +0200
From: jeroen@myspectrum.nl
To: openembedded-devel@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [meta-oe][scarthgap][PATCH] nodejs: backport a patch to prevent brotli crashing nodejs
Date: Mon, 28 Apr 2025 18:51:36 +0200
Message-ID: <20250428165138.328991-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1745859110; h=from:subject:to:cc:date:
 mime-version:content-type;
 bh=ZgTHKDLUEdv8MJwcqJqHmjMtBSHCb9ZxwkiQoIXuiy4=;
 b=huUCBv4Qx+25lXKUGD3NpkcvAME7LJN0cxwSufmct6qxrzPfsFkAy8ktkvSJzweJxvRt0W
 qJEdBvR1kvEgqsRg/Bm0Y6UlfefrLlGMzAobFbMuQbTHB33JnNDYgEGFNncwCd0Uh/ZKem
 8i6URGKCs03PjGVpELI8WyeivxCjun6K58hSITgDoFGhGEPeXTyAZJn1AMsMac8qCnDgjz
 i0nJl139/T5MKJxpWZwZtRCzOHGDi66r+zufRnNIq6i1X8Wu7Z+HHzDPl9P3uchTZGhrau
 y/hKF8mP0Z/0PN+jE1RK1uchtGpVjncpoRwEvXkJ9CLFGttIoVASowDwJkUfhg==
X-Report-Abuse-To: abuse@transip.nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 17:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117199

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Brotli can crash nodejs (on ARM), because the memory allocated for
brotli wasn't properly aligned.

https://github.com/google/brotli/issues/1159
https://github.com/nodejs/node/commit/dc035bbc9b310ff8067bc0dad2223097848=
9c061

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../nodejs/zlib-fix-pointer-alignment.patch   | 64 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-point=
er-alignment.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alig=
nment.patch b/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-ali=
gnment.patch
new file mode 100644
index 0000000000..824ff678c6
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.p=
atch
@@ -0,0 +1,64 @@
+From bbcd1f33161fd9874e8a61999d2739b177f99723 Mon Sep 17 00:00:00 2001
+From: Jeroen Hofstee <jhofstee@victronenergy.com>
+Date: Mon, 28 Apr 2025 14:21:44 +0000
+Subject: [PATCH] zlib: fix pointer alignment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The function AllocForBrotli prefixes the allocated memory with its
+size, and returns a pointer to the region after it. This pointer can
+however no longer be suitably aligned. Correct this by allocating
+the maximum of the the size of the size_t and the max alignment.
+
+On Arm 32bits the size_t is 4 bytes long, but the alignment is 8 for
+some NEON instructions. When Brotli is compiled with optimizations
+enabled newer GCC versions will use the NEON instructions and trigger
+a bus error killing node.
+
+see https://github.com/google/brotli/issues/1159
+
+PR-URL: https://github.com/nodejs/node/pull/57727
+Reviewed-By: Shelley Vohr <shelley.vohr@gmail.com>
+Reviewed-By: Tobias Nie=C3=9Fen <tniessen@tnie.de>
+Reviewed-By: Daniel Lemire <daniel@lemire.me>
+Reviewed-By: Gerhard St=C3=B6bich <deb2001-github@yahoo.de>
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/dc035bb=
c9b310ff8067bc0dad22230978489c061]
+---
+ src/node_zlib.cc | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/node_zlib.cc b/src/node_zlib.cc
+index 66370e41..a537e766 100644
+--- a/src/node_zlib.cc
++++ b/src/node_zlib.cc
+@@ -493,20 +493,22 @@ class CompressionStream : public AsyncWrap, public=
 ThreadPoolWork {
+   }
+=20
+   static void* AllocForBrotli(void* data, size_t size) {
+-    size +=3D sizeof(size_t);
++    constexpr size_t offset =3D std::max(sizeof(size_t), alignof(max_al=
ign_t));
++    size +=3D offset;
+     CompressionStream* ctx =3D static_cast<CompressionStream*>(data);
+     char* memory =3D UncheckedMalloc(size);
+     if (UNLIKELY(memory =3D=3D nullptr)) return nullptr;
+     *reinterpret_cast<size_t*>(memory) =3D size;
+     ctx->unreported_allocations_.fetch_add(size,
+                                            std::memory_order_relaxed);
+-    return memory + sizeof(size_t);
++    return memory + offset;
+   }
+=20
+   static void FreeForZlib(void* data, void* pointer) {
+     if (UNLIKELY(pointer =3D=3D nullptr)) return;
+     CompressionStream* ctx =3D static_cast<CompressionStream*>(data);
+-    char* real_pointer =3D static_cast<char*>(pointer) - sizeof(size_t)=
;
++    constexpr size_t offset =3D std::max(sizeof(size_t), alignof(max_al=
ign_t));
++    char* real_pointer =3D static_cast<char*>(pointer) - offset;
+     size_t real_size =3D *reinterpret_cast<size_t*>(real_pointer);
+     ctx->unreported_allocations_.fetch_sub(real_size,
+                                            std::memory_order_relaxed);
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.18.2.bb
index 1f45c3ec66..bef62f88eb 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://libatomic.patch \
            file://182d9c05e78.patch \
+           file://zlib-fix-pointer-alignment.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target =3D " \
--=20
2.43.0


