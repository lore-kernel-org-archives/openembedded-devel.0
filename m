Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33C4C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 16:10:59 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.512.1783613450383871788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 09:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UtqpFam5;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c89636920a3so8683a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783613450; x=1784218250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4iJZjymySH3nONVvldgwpujFAGhGXVa+dBu4bIIJgw=;
        b=UtqpFam5PvQO6yrR8HC/HXiOjpHjvwikSixbY+20IN8azse6y2N1sfGWqZRvLNXJvN
         g0I5YhEzkfIJWozpmea4ClV8cVrPVkVh4iBCvBhKFS0Ccg2vN02jSgyQhgKNwSz0ra2E
         psBmVrcaAwn89wD6YDkwM0t6gFu45rRWNWSipZ57hrJqfs0ZLxFfmG8S/vpn4awn6kWU
         zDJ8+TcLgv/nB6/EhDHbJyNwC+g2RDgZhtSyAj1vHX62fah3mwl6lks/an6vhLEtHPxj
         iBUUIcrvWKZjErDLhcAlY9UFJd+Fm5ndj535lLWn53cJl+H7El9R3mzYEWIKuKttUP20
         2Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613450; x=1784218250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4iJZjymySH3nONVvldgwpujFAGhGXVa+dBu4bIIJgw=;
        b=QlljI3BaYP56Yrv5wfyjItKZHWtmirfbqTO2/aNVMYUUV9Oq89H/Rh4IPmTCFdz+hX
         5qsz9oQXzoJpVMRtBBKgGH7mqQqNcPx+HpTALBx3UHTCiqaI6v7PJ1+PlxV1KTIgN9H1
         qzTVZNKTeiHOyh1ls70CmLNivnOr9CMBnq9hJ6HdgipxExCfjII4bnNCqxD0+t1JQ4sh
         3ItwzGci7x9ZZL+dxoekw2e4t/718rauZ1INrFldGqltoKhr2LplY9fpeC7bd26oEVWj
         NXnb3sHXoVU9+CeFxVljr+ZFlRDXGNo9WxQItI9Nrdn8rOQ2UUlezSA376Jdg9lNecLD
         zX4w==
X-Gm-Message-State: AOJu0YxHcMK3YPZQIUZBdYGpb6rChXoSs3fCJFCxLyEZFz4VrQ8tABJk
	p+GlaEVCveRnQ6xEt7uZ7IUuaNwaRqWX7PUt3RcIALAyguSmns8BOTumAJuEuEu2U2k=
X-Gm-Gg: AfdE7cmW665dz5cOUnDvdbzCVwhyGrZQt3IQpS3BN0vt8R2JDKCwTB+d2AhN1v8J/3D
	WxeMQR5L5qotAS3fYiqHNJ+RkTVQs98GU/Jm/p+uutoY4+kBcOj3DZuLxjE8AcIvHeyUgBrXSAx
	zS5Ds1bCjGuUUzopBAc+oMPixp3zwMprWa8sFBdy6mbNeT6Mp9d38QvXok/flxEBuvd1AvKVuMe
	vy4hBryjkCXvcpBxIXKJh/NUezP3qdYJme2egqcZVT5edU4CX+UTTUIJpoGQt4R20F9DR+svbrI
	74jVgIJyIn+nwAx+W3mdc9NcnDjxbuf5oSJT8936CwOZEqBTK79SdnlLbEaVzEqHZY46444SBVj
	qAkNp6n8t+rztsvzdIvsCm0lIpQKwVV1Hm5Fec9ieaspcEc61TPQQkKtpZ5RCiQfDjCwbiTUuYc
	kM3qRPR83900iq6yEOyh2ZW1fHfRgcNaUom8PRaRNUFwGNdlU1ZURO8mpiM6N4O7x1k+QP/V1kv
	tVJNB3m0ck1hNZEQKktFynr5yMgTv94aC524xjll3LwFSKnpgXSnD2wnnUayt/Lu0nkFzwR+uHW
	9n7zZfoHy0MnwrphhgSZNllbvG3MwQ==
X-Received: by 2002:a05:6a20:4308:b0:3bf:b49f:53fd with SMTP id adf61e73a8af0-3c0bc8a59ffmr7963365637.3.1783613449405;
        Thu, 09 Jul 2026 09:10:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm34085726eec.27.2026.07.09.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:10:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] fex: Upgrade to FEX-2607 release
Date: Thu,  9 Jul 2026 09:10:45 -0700
Message-ID: <20260709161045.3794831-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 16:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128126

Bump the FEX srcrev to the FEX-2607 tag and resync the vendored externals
to that release's submodule pointers: drop jemalloc (non-glibc) and
robin-map, which upstream replaced with rpmalloc and unordered_dense.

Additional build fixes required by this release:

- Disable FEX's internal ccache (-DENABLE_CCACHE=OFF); it collides with
  OE's ccache class and double-wraps the compiler.
- Build fmt from the bundled External/fmt submodule instead of the system
  copy. FEX-2607 formats std::byte spans via fmt::join, which its pinned
  fmt 12.1.0 supports but oe-core's newer fmt 12.2.0 rejects.
- Stop FEX from stripping binaries at link time so OE can split out debug
  information and the already-stripped QA check passes.

Built for qemuarm64.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...C-Do-not-strip-binaries-at-link-time.patch | 28 +++++++++++++++++++
 .../fex/{fex_2601.bb => fex_2607.bb}          | 18 ++++++++----
 2 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/fex/fex/0001-LinkerGC-Do-not-strip-binaries-at-link-time.patch
 rename meta-oe/recipes-devtools/fex/{fex_2601.bb => fex_2607.bb} (73%)

diff --git a/meta-oe/recipes-devtools/fex/fex/0001-LinkerGC-Do-not-strip-binaries-at-link-time.patch b/meta-oe/recipes-devtools/fex/fex/0001-LinkerGC-Do-not-strip-binaries-at-link-time.patch
new file mode 100644
index 0000000000..6c8faefdb9
--- /dev/null
+++ b/meta-oe/recipes-devtools/fex/fex/0001-LinkerGC-Do-not-strip-binaries-at-link-time.patch
@@ -0,0 +1,28 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 9 Jul 2026 00:00:00 +0000
+Subject: [PATCH] LinkerGC: Do not strip binaries at link time
+
+FEX links Release binaries with --strip-all, which discards the symbol
+table before OE gets a chance to split out debug information. This makes
+the build fail the OE already-stripped QA check and prevents shipping
+-dbg packages. Let OE handle stripping instead.
+
+Upstream-Status: Inappropriate [OE handles stripping and debug packaging]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Data/CMake/LinkerGC.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Data/CMake/LinkerGC.cmake b/Data/CMake/LinkerGC.cmake
+index 1111111..2222222 100644
+--- a/Data/CMake/LinkerGC.cmake
++++ b/Data/CMake/LinkerGC.cmake
+@@ -9,7 +9,6 @@ macro(LinkerGC target)
+   if (CMAKE_BUILD_TYPE MATCHES "RELEASE")
+     target_link_options(${target} PRIVATE
+       "LINKER:--gc-sections"
+-      "LINKER:--strip-all"
+       "LINKER:--as-needed")
+   endif()
+ endmacro()
diff --git a/meta-oe/recipes-devtools/fex/fex_2601.bb b/meta-oe/recipes-devtools/fex/fex_2607.bb
similarity index 73%
rename from meta-oe/recipes-devtools/fex/fex_2601.bb
rename to meta-oe/recipes-devtools/fex/fex_2607.bb
index 7d7824d08a..4737c9fd0e 100644
--- a/meta-oe/recipes-devtools/fex/fex_2601.bb
+++ b/meta-oe/recipes-devtools/fex/fex_2607.bb
@@ -13,25 +13,30 @@ SRC_URI = " \
 	git://github.com/Sonicadvance1/cpp-optparse.git;name=cpp-optparse;subdir=${S}/Source/Common/cpp-optparse;protocol=https;nobranch=1 \
 	git://github.com/FEX-Emu/drm-headers.git;name=fex-drm;subdir=${S}/External/drm-headers;protocol=https;nobranch=1 \
 	git://github.com/Cyan4973/xxHash.git;name=xxhash;subdir=${S}/External/xxhash;protocol=https;nobranch=1 \
-	git://github.com/FEX-Emu/jemalloc.git;name=jemalloc;subdir=${S}/External/jemalloc;protocol=https;nobranch=1 \
+	git://github.com/fmtlib/fmt.git;name=fmt;subdir=${S}/External/fmt;protocol=https;nobranch=1 \
 	git://github.com/FEX-Emu/jemalloc.git;name=jemalloc-glibc;subdir=${S}/External/jemalloc_glibc;protocol=https;nobranch=1 \
 	git://github.com/ericniebler/range-v3.git;name=range-v3;subdir=${S}/External/range-v3;protocol=https;nobranch=1 \
-	git://github.com/FEX-Emu/robin-map.git;name=robin-map;subdir=${S}/External/robin-map;protocol=https;nobranch=1 \
+	git://github.com/FEX-Emu/rpmalloc.git;name=rpmalloc;subdir=${S}/External/rpmalloc;protocol=https;nobranch=1 \
+	git://github.com/martinus/unordered_dense.git;name=unordered-dense;subdir=${S}/External/unordered_dense;protocol=https;nobranch=1 \
+	file://0001-LinkerGC-Do-not-strip-binaries-at-link-time.patch \
 "

 SRCREV_FORMAT = "fex"
-SRCREV_fex = "1188c90c10569ca800d7a99c11e59cfeab5e2cc9"
+SRCREV_fex = "1cc4b93e7a71c883ec021b71359f136394dc1f3c"
 SRCREV_cpp-optparse = "9f94388a339fcbb0bc95c17768eb786c85988f6e"
 SRCREV_fex-drm = "3e49836995c1dcb3df709440ad2f270b569c6a5f"
 SRCREV_xxhash = "e626a72bc2321cd320e953a0ccf1584cad60f363"
-SRCREV_jemalloc = "97d986993dc735a2022856e7e9fdfa1180e8527a"
+SRCREV_fmt = "407c905e45ad75fc29bf0f9bb7c5c2fd3475976f"
 SRCREV_jemalloc-glibc = "8436195ad5e1bc347d9b39743af3d29abee59f06"
-SRCREV_robin-map = "d5683d9f1891e5b04e3e3b2192b5349dc8d814ea"
+SRCREV_rpmalloc = "1d85c246cd827ead6865f4f880d4fef53f2b1864"
+SRCREV_unordered-dense = "3234af2c03549bc85656bfd3a86993bf1cd8aef1"
 SRCREV_range-v3 = "ca1388fb9da8e69314dda222dc7b139ca84e092f"

+# fmt is built from the bundled External/fmt submodule rather than the system
+# copy: FEX-2607 formats std::byte spans via fmt::join, which its pinned fmt
+# 12.1.0 supports but oe-core's newer fmt (12.2.0) rejects.
 DEPENDS = " \
     catch2 \
-    fmt \
     libdrm  \
     nasm-native \
     vulkan-headers \
@@ -42,6 +47,7 @@ PACKAGECONFIG[qt] = "-DBUILD_FEXCONFIG=ON,-DBUILD_FEXCONFIG=OFF,qtbase qttools-n

 EXTRA_OECMAKE += " \
 	-DBUILD_TESTING=OFF \
+	-DENABLE_CCACHE=OFF \
 	-DENABLE_VIXL_DISASSEMBLER=OFF \
 	-DENABLE_VIXL_SIMULATOR=OFF \
 	-DDATA_DIRECTORY=${datadir} \

