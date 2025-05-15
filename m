Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956D5C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 20:37:46 +0000 (UTC)
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
 by mx.groups.io with SMTP id smtpd.web10.1528.1747341302989114085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 May 2025 13:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=ThO3kAgi;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.11, mailfrom: jeroen@myspectrum.nl)
Received: from submission9.mail.transip.nl (unknown [10.103.8.160])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4Zz25J3fwPzTPPPx;
	Thu, 15 May 2025 22:35:00 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission9.mail.transip.nl (Postfix) with ESMTPSA id 4Zz25H2q9Bz2npd8f;
	Thu, 15 May 2025 22:34:59 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 3934720071;
	Thu, 15 May 2025 20:34:56 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Thu, 15 May 2025 22:34:55 +0200
From: jeroen@myspectrum.nl
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH] nodejs: backport a patch to prevent brotli crashing nodejs
Date: Thu, 15 May 2025 22:34:32 +0200
Message-ID: <20250515203437.3975843-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission9.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747341299; h=from:subject:to:cc:date:
 mime-version:content-type;
 bh=Zg3rSVqeVLs/LGKUFTXypSi/Ln1uVPLppMNZRPefgJ4=;
 b=ThO3kAgi/kwiwkxiWRBZ0D6lfPZ6Kz2K6faSxMiyty4YxU8Ey/qjdVfGkUXpuAZRMbd0fb
 O7LqyUqVyKbrw56bPSu5lVirg9X5xLtYacIuNbcgHc8oqg73uFidutez1rZ0fISTe2n6Dn
 7BmVhRa1Lx5mzyIh5ZA75p3H1P2pOk7hrc8tf8uGgBzIT7F9Xk2Y3OPF3MRkTcJ62DNrOr
 N9zn8HKOyly0kA6ZF5AkIsvY0DjMQYSNyO1B7Xwxx0TjZ4OA7y6uky0TZ0bbiGTddeu9Do
 vHJ1NMHjx2FZxu0Y05jttrWu6r51cXiORsi7fHvs1XR6wmdL1KHrch7LqehQUw==
X-Report-Abuse-To: abuse@transip.nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 May 2025 20:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117424

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Brotli can crash nodejs (on ARM), because the memory allocated for
brotli wasn't properly aligned.

https://github.com/google/brotli/issues/1159
https://github.com/nodejs/node/commit/dc035bbc9b310ff8067bc0dad2223097848=
9c061

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 64760af3c38c00d40ba2782b9c4a4ec544e232f4)
---
 .../nodejs/zlib-fix-pointer-alignment.patch   | 64 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_22.14.0.bb |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-point=
er-alignment.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alig=
nment.patch b/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-ali=
gnment.patch
new file mode 100644
index 0000000000..e372911193
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.p=
atch
@@ -0,0 +1,64 @@
+From dc035bbc9b310ff8067bc0dad22230978489c061 Mon Sep 17 00:00:00 2001
+From: jhofstee <jeroen@myspectrum.nl>
+Date: Wed, 9 Apr 2025 12:24:13 +0200
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
+index 0b7c47b326c7c5..7e6b38ecd1aa36 100644
+--- a/src/node_zlib.cc
++++ b/src/node_zlib.cc
+@@ -608,7 +608,8 @@ class CompressionStream : public AsyncWrap, public T=
hreadPoolWork {
+   }
+=20
+   static void* AllocForBrotli(void* data, size_t size) {
+-    size +=3D sizeof(size_t);
++    constexpr size_t offset =3D std::max(sizeof(size_t), alignof(max_al=
ign_t));
++    size +=3D offset;
+     CompressionStream* ctx =3D static_cast<CompressionStream*>(data);
+     char* memory =3D UncheckedMalloc(size);
+     if (memory =3D=3D nullptr) [[unlikely]] {
+@@ -617,7 +618,7 @@ class CompressionStream : public AsyncWrap, public T=
hreadPoolWork {
+     *reinterpret_cast<size_t*>(memory) =3D size;
+     ctx->unreported_allocations_.fetch_add(size,
+                                            std::memory_order_relaxed);
+-    return memory + sizeof(size_t);
++    return memory + offset;
+   }
+=20
+   static void FreeForZlib(void* data, void* pointer) {
+@@ -625,7 +626,8 @@ class CompressionStream : public AsyncWrap, public T=
hreadPoolWork {
+       return;
+     }
+     CompressionStream* ctx =3D static_cast<CompressionStream*>(data);
+-    char* real_pointer =3D static_cast<char*>(pointer) - sizeof(size_t)=
;
++    constexpr size_t offset =3D std::max(sizeof(size_t), alignof(max_al=
ign_t));
++    char* real_pointer =3D static_cast<char*>(pointer) - offset;
+     size_t real_size =3D *reinterpret_cast<size_t*>(real_pointer);
+     ctx->unreported_allocations_.fetch_sub(real_size,
+                                            std::memory_order_relaxed);
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.14.0.bb
index dee4c9df4f..627fd7ad24 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
+           file://zlib-fix-pointer-alignment.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target =3D " \
--=20
2.43.0


