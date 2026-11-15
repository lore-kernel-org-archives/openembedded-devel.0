Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10678.1794762012874608640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YuLppzN9;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so190451c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762012; x=1795366812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWNMDiHfO66TCqGG6nuTy10aZWC8oIUgxJj4d/AiWDo=;
        b=YuLppzN9St2/EdEn1z5BV8XYdJSZPrJcU+fndPNle04IW9oTROI3sEyxoRdAYYjlZQ
         cAqr4sL8DZR7MfTEvlYv6ytZEKz1VBLc4utZwt1tGFwvVdNYWCUU5eSkfMKeEQne/tfS
         Fb3lDRffx93B2vfniqz+koKcsOFVRiALJwFnQt/OiKpm1MB2gJExqAsXHbAqw+++a49H
         Vip7V9fts6kf/ZiZJn/JdmwEjQtyz+dbSAkWjePazPFZAD8vFPrvsshyps+WKQ78AR0x
         IyaNUNqSZETZ9qUYEkNtT5rpN6EtfuihYaLNEcmiSI2WBAirrbRfvWSuN0Cnrx9h4QMS
         Tsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762012; x=1795366812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWNMDiHfO66TCqGG6nuTy10aZWC8oIUgxJj4d/AiWDo=;
        b=2Kf8ww+o3jtvcvysmF7tvgJl0CHWBBpGdUpgTsYXKC0ngGiQxk2jjiM7NHJH3XD0lh
         ktVwZiN9DMWcyTCa1dHJ3gy4mqLCQGc53Ipmx3rONeq0QPC31RWrtITnyS7Uo+NpOM4q
         nMLJ3OuDsVezfCQZEO1J7I5eOTNyVl05VF89odpP5YAamFdoII3BWOR+k/uzK8h2Adf/
         HoHRT6WbUhGIvn3pkUK4yoRBm2IRkoQox9YmJEhgtC+0i0bQw9Mhq9gbRAhBbGdm3b26
         4TKWmUoLbuXO0Ng0qVkKf/6sD0HOMXpdzi4Q08dTckEbkukIM0nOwVrh7RqXY5P/wBVr
         QsmA==
X-Gm-Message-State: APuU4Z+Du8ppG7iHRbXHaK/gi9kevoSwH3ePVihVUdtVuL6igM6JELnt
	QQq3XtB62R1j8B1LSxEDwMg/EUmJaLJ9LxQJ0VgFrT9QQ7Ce3M9icp7dCfPQCrZQ
X-Gm-Gg: AYBFou2vuP0uTRPcfyMnsFnVl1UtvwMWar4XJe/Me4F+JtOjAkIedNDt9jQxZmJYCy6
	2bFBSXUHOgw0Vv9yViD3cOLuC9LrNLhcC0UEKQe746Eb3+yoCC+9AxNCFtOlWHExakaqEUFYLy+
	H7oijreNlkl1kmYEqRwwbh4k4DNhpfM6P9mCM93o2ouAgnfV4UHThXFTae4SBI7/cT3T6eA0gqD
	rcg2Jkf1sJNvHn9ov505VQXmwvkqdqNIa0+G07TVmJ2E/egHGMJYHueOdtvLfvpAaD/MrAYZVZO
	8kidSbKoSQ2d6c9CH8CkqwSigFP2RoW+B/KFKfMUPSuW0izAfDdBeG4yjOr4e4nPmKRj9xSiZJG
	9JHirNeR5PLFyp9l+3y4UiKE2n/5ZciWaBwh7gbOFVHAROTGGow9WqmliQ3mtCVd+MAmN2vQdUK
	4jNDTimfpetcTmILzkrmIt/2+1sncz6o4sFCWG7B5q9UhPULboqeBnE5baU0LLUaPCrOeA29bcg
	e+vc3SwdruRWr7+31ht2vQpGsA/Uzeqw++LXLTj1hop1elJA3cHaGKxvUCEt38v1BH+23xZqGr4
	nRSunJSUNex702itUV03ehcR2nEaRRu4/8TYf7qrLfRD+NG4nXktNM8bqr+YEqs4X5JyzkQsrNC
	8dRAmQH/+r7dmX3oyfR5wQYIOL+VJUxgIqSGmBttQq5dWGN8gzAFvfOd9F0YE+1xJHEdxtB3bUq
	b0z0NbWYgw2tmmYtkDv5AIgMYdFjjkwBcKASPOTur8QJFPFKQgY/S0Fjc8ueChU87xRVH7PurG0
	P+5MBeGDzuHjPqTayVjciNGhqZ5CtPHCrd9mYBgz8sD9gC2AZPkPloP8XOqLO0fKIMybnJjLIOb
	L4sp
X-Received: by 2002:a05:701b:21c3:b0:196:e2d0:129 with SMTP id a92af1059eb24-1b50308b464mr7570609c88.2.1794762010633;
        Sun, 15 Nov 2026 09:00:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 08/15] libde265: upgrade 1.0.19 -> 1.1.3
Date: Sun, 15 Nov 2026 08:59:47 -0800
Message-ID: <20261115165955.3485789-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132375
Content-Type: text/plain; charset="utf-8"

Drop the CVE patches, they are part of 1.1.x.

1.1.x adds AVX2 and AVX-512 kernels selected at runtime using
__builtin_cpu_supports(), which fails to link libde265.so with clang
and lld (R_X86_64_PC32 against __cpu_model). Add a patch to use CPUID
directly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...AVX-512-with-CPUID-instead-of-__buil.patch | 105 +++++
 .../libde265/libde265/CVE-2026-49295.patch    |  41 --
 .../libde265/libde265/CVE-2026-49337.patch    |  53 ---
 .../libde265/libde265/CVE-2026-49346.patch    | 102 -----
 .../CVE-2026-54240-CVE-2026-54241.patch       | 426 ------------------
 .../{libde265_1.0.19.bb => libde265_1.1.3.bb} |   9 +-
 6 files changed, 108 insertions(+), 628 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/0001-x86-detect-AVX2-AVX-512-with-CPUID-instead-of-__buil.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2026-54241.patch
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.19.bb => libde265_1.1.3.bb} (77%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/0001-x86-detect-AVX2-AVX-512-with-CPUID-instead-of-__buil.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/0001-x86-detect-AVX2-AVX-512-with-CPUID-instead-of-__buil.patch
new file mode 100644
index 0000000000..8d63b9f6da
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/0001-x86-detect-AVX2-AVX-512-with-CPUID-instead-of-__buil.patch
@@ -0,0 +1,105 @@
+From 7b8bae1208159df9549773766775dcf4efd9ac02 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 15 Nov 2026 00:22:52 -0800
+Subject: [PATCH] x86: detect AVX2/AVX-512 with CPUID instead of
+ __builtin_cpu_supports
+
+__builtin_cpu_supports() lowers to a PC-relative reference to the
+__cpu_model global from libgcc/compiler-rt. With clang and lld, linking
+libde265.so fails when __cpu_model resolves to the copy exported by
+libgcc_s.so:
+
+  ld.lld: error: relocation R_X86_64_PC32 cannot be used against symbol
+  '__cpu_model'; recompile with -fPIC
+
+Query CPUID and XCR0 directly, including the OS support checks for the
+YMM and ZMM state that __builtin_cpu_supports() performs.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ libde265/x86/sse.cc | 54 ++++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 46 insertions(+), 8 deletions(-)
+
+diff --git a/libde265/x86/sse.cc b/libde265/x86/sse.cc
+index 735fd530..9055c10b 100644
+--- a/libde265/x86/sse.cc
++++ b/libde265/x86/sse.cc
+@@ -41,6 +41,42 @@
+
+ #if defined(__GNUC__) && !defined(__EMSCRIPTEN__)
+ #include <cpuid.h>
++
++#if HAVE_AVX2 || HAVE_AVX512
++// Query CPUID and XCR0 directly instead of using __builtin_cpu_supports().
++// The builtin references the __cpu_model global from libgcc/compiler-rt,
++// which cannot be linked into a shared library with clang+lld when
++// __cpu_model resolves to the copy exported by libgcc_s.so.
++static void get_avx_support(bool* avx2, bool* avx512)
++{
++  unsigned int eax, ebx, ecx, edx;
++
++  *avx2 = false;
++  *avx512 = false;
++
++  if (!__get_cpuid(1, &eax, &ebx, &ecx, &edx) ||
++      !(ecx & bit_OSXSAVE) || !(ecx & bit_AVX)) {
++    return;
++  }
++
++  // the OS must save the XMM and YMM state
++  unsigned int xcr0_lo, xcr0_hi;
++  __asm__ ("xgetbv" : "=a"(xcr0_lo), "=d"(xcr0_hi) : "c"(0));
++  if ((xcr0_lo & 0x06) != 0x06) {
++    return;
++  }
++
++  if (!__get_cpuid_count(7, 0, &eax, &ebx, &ecx, &edx)) {
++    return;
++  }
++
++  *avx2 = (ebx & bit_AVX2) != 0;
++
++  // AVX-512 additionally needs the opmask and ZMM state
++  *avx512 = (xcr0_lo & 0xe6) == 0xe6 &&
++            (ebx & bit_AVX512F) && (ebx & bit_AVX512BW);
++}
++#endif
+ #endif
+
+ void init_acceleration_functions_sse(struct acceleration_functions* accel)
+@@ -138,12 +174,13 @@ void init_acceleration_functions_sse(struct acceleration_functions* accel)
+ void init_acceleration_functions_avx2(struct acceleration_functions* accel)
+ {
+ #if HAVE_AVX2
+-  // __builtin_cpu_supports("avx2") handles the OSXSAVE / XGETBV (YMM-enabled)
+-  // checks internally, so this is safe to call on any CPU. This TU is *not*
+-  // compiled with -mavx2, so reaching here never executes an AVX2 instruction.
++  // get_avx_support() handles the OSXSAVE / XGETBV (YMM-enabled) checks, so
++  // this is safe to call on any CPU. This TU is *not* compiled with -mavx2,
++  // so reaching here never executes an AVX2 instruction.
+ #if defined(__GNUC__) && !defined(__EMSCRIPTEN__)
+-  __builtin_cpu_init();
+-  if (__builtin_cpu_supports("avx2")) {
++  bool avx2, avx512;
++  get_avx_support(&avx2, &avx512);
++  if (avx2) {
+     accel->transform_add_8[2] = transform_16x16_add_8_avx2;
+     accel->transform_add_8[3] = transform_32x32_add_8_avx2;
+     // NB: dequant intentionally stays on the SSE version. An AVX2 variant was
+@@ -160,10 +197,11 @@ void init_acceleration_functions_avx512(struct acceleration_functions* accel)
+ {
+ #if HAVE_AVX512
+ #if defined(__GNUC__) && !defined(__EMSCRIPTEN__)
+-  __builtin_cpu_init();
+-  // need AVX-512F + AVX-512BW (16-bit ops). __builtin_cpu_supports handles the
++  // need AVX-512F + AVX-512BW (16-bit ops). get_avx_support() handles the
+   // OS (XCR0/ZMM-enabled) check. This TU is not compiled with -mavx512*.
+-  if (__builtin_cpu_supports("avx512f") && __builtin_cpu_supports("avx512bw")) {
++  bool avx2, avx512;
++  get_avx_support(&avx2, &avx512);
++  if (avx512) {
+     accel->transform_add_8[3] = transform_32x32_add_8_avx512;
+   }
+ #endif
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
deleted file mode 100644
index 189d330b9a..0000000000
--- a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7d5e48dbf9324691ba3ce4cd8ffa089d735b0b70 Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Mon, 25 May 2026 20:14:07 +0200
-Subject: [PATCH] bound aggregate short-term RPS size (GHSA-g2rg-wj66-w594)
-
-(cherry picked from commit 691f3a3c55b3d32478c4a49895dee061a282652b)
-
-CVE: CVE-2026-49295
-Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/691f3a3c55b3d32478c4a49895dee061a282652]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- libde265/refpic.cc | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/libde265/refpic.cc b/libde265/refpic.cc
-index ea4db4b0..dcd2b214 100644
---- a/libde265/refpic.cc
-+++ b/libde265/refpic.cc
-@@ -322,6 +322,22 @@ bool read_short_term_ref_pic_set(error_queue* errqueue,
-
-   out_set->compute_derived_values();
-
-+  // The unused short-term references are all collected into a single PocStFoll array
-+  // of MAX_NUM_REF_PICS entries (see decoder_context::process_reference_picture_set).
-+  // While each individual list is bounded above, the predicted-RPS construction can
-+  // append the current-picture delta to an already-full source set, pushing the
-+  // combined count past MAX_NUM_REF_PICS. Reject such sets to avoid an out-of-bounds
-+  // write when filling PocStFoll.
-+  if (out_set->NumDeltaPocs > MAX_NUM_REF_PICS) {
-+    out_set->NumNegativePics = 0;
-+    out_set->NumPositivePics = 0;
-+    out_set->NumDeltaPocs = 0;
-+    out_set->NumPocTotalCurr_shortterm_only = 0;
-+
-+    errqueue->add_warning(DE265_WARNING_MAX_NUM_REF_PICS_EXCEEDED, false);
-+    return false;
-+  }
-+
-   return true;
- }
-
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
deleted file mode 100644
index 88e0e32949..0000000000
--- a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2f0c53241cb9bf2f5acded53c25f1b74db536de7 Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Mon, 25 May 2026 20:29:40 +0200
-Subject: [PATCH] free orphaned slice header when no active image unit
- (GHSA-g5hj-rf9f-7vxm)
-
-(cherry picked from commit 683cb9fa603e35840642f98765ab95cdb71cadf9)
-
-CVE: CVE-2026-49337
-Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/683cb9fa603e35840642f98765ab95cdb71cadf9]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- libde265/decctx.cc | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/libde265/decctx.cc b/libde265/decctx.cc
-index fbb3baa1..5deddc37 100644
---- a/libde265/decctx.cc
-+++ b/libde265/decctx.cc
-@@ -478,10 +478,6 @@ de265_error decoder_context::read_slice_NAL(bitreader& reader, NAL_unit* nal, na
-     shdr->entry_point_offset[i] -= skipped;
-   }
-
--  this->img->add_slice_segment_header(shdr);
--
--
--
-   // --- start a new image if this is the first slice ---
-
-   if (shdr->first_slice_segment_in_pic_flag) {
-@@ -495,6 +491,13 @@ de265_error decoder_context::read_slice_NAL(bitreader& reader, NAL_unit* nal, na
-
-   if ( ! image_units.empty() ) {
-
-+    // Hand the slice header to the picture (which takes ownership and frees it
-+    // on release). Only do this when there is an active image unit to decode
-+    // the slice; otherwise the header would be retained on img->slices forever,
-+    // which a crafted stream of non-first slice NALs can exploit to grow memory
-+    // without bound.
-+    this->img->add_slice_segment_header(shdr);
-+
-     slice_unit* sliceunit = new slice_unit(this);
-     sliceunit->nal = nal;
-     sliceunit->shdr = shdr;
-@@ -507,6 +510,7 @@ de265_error decoder_context::read_slice_NAL(bitreader& reader, NAL_unit* nal, na
-   }
-   else {
-     nal_parser.free_NAL_unit(nal);
-+    delete shdr;
-   }
-
-   bool did_work;
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
deleted file mode 100644
index 288295b08a..0000000000
--- a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 1667c33f2778a04f08ba4f7d6c1c16508350a779 Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Tue, 26 May 2026 00:59:08 +0200
-Subject: [PATCH] fix integer overflow in image plane allocation size
- (GHSA-vv8h-932h-7r86)
-
-(cherry picked from commit 8a1b5cf212f78e1c77cb46eb5d56e492a9336eb8)
-
-CVE: CVE-2026-49346
-Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/8a1b5cf212f78e1c77cb46eb5d56e492a9336eb8]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- libde265/image.cc | 46 +++++++++++++++++++++++++++-------------------
- 1 file changed, 27 insertions(+), 19 deletions(-)
-
-diff --git a/libde265/image.cc b/libde265/image.cc
-index 0b6071ba..94f3c974 100644
---- a/libde265/image.cc
-+++ b/libde265/image.cc
-@@ -70,10 +70,11 @@ LIBDE265_API void* de265_alloc_image_plane(struct de265_image* img, int cIdx,
-                                            void* inputdata, int inputstride, void *userdata)
- {
-   int alignment = STANDARD_ALIGNMENT;
--  int stride = (img->get_width(cIdx) + alignment-1) / alignment * alignment;
--  int height = img->get_height(cIdx);
-+  uint32_t stride = (img->get_width(cIdx) + alignment-1) / alignment * alignment;
-+  uint32_t height = img->get_height(cIdx);
-
--  uint8_t* p = static_cast<uint8_t*>(ALLOC_ALIGNED_16(stride * height + MEMORY_PADDING));
-+  // size computed in size_t: stride*height can exceed UINT32_MAX for large planes
-+  uint8_t* p = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(stride) * height + MEMORY_PADDING));
-
-   if (p==nullptr) { return nullptr; }
-
-@@ -82,12 +83,14 @@ LIBDE265_API void* de265_alloc_image_plane(struct de265_image* img, int cIdx,
-   // copy input data if provided
-
-   if (inputdata != nullptr) {
--    if (inputstride == stride) {
--      memcpy(p, inputdata, stride*height);
-+    if (inputstride == static_cast<int>(stride)) {
-+      memcpy(p, inputdata, static_cast<size_t>(stride) * height);
-     }
-     else {
--      for (int y=0;y<height;y++) {
--        memcpy(p+y*stride, static_cast<char*>(inputdata) + inputstride*y, inputstride);
-+      for (uint32_t y=0;y<height;y++) {
-+        memcpy(p + static_cast<size_t>(y) * stride,
-+               static_cast<char*>(inputdata) + static_cast<size_t>(inputstride) * y,
-+               inputstride);
-       }
-     }
-   }
-@@ -107,30 +110,35 @@ LIBDE265_API void de265_free_image_plane(struct de265_image* img, int cIdx)
- static int  de265_image_get_buffer(de265_decoder_context* ctx,
-                                    de265_image_spec* spec, de265_image* img, void* userdata)
- {
--  const int rawChromaWidth  = spec->width  / img->SubWidthC;
--  const int rawChromaHeight = spec->height / img->SubHeightC;
-+  const uint32_t rawChromaWidth  = spec->width  / img->SubWidthC;
-+  const uint32_t rawChromaHeight = spec->height / img->SubHeightC;
-
--  int luma_stride   = (spec->width    + spec->alignment-1) / spec->alignment * spec->alignment;
--  int chroma_stride = (rawChromaWidth + spec->alignment-1) / spec->alignment * spec->alignment;
-+  uint32_t luma_stride   = (spec->width    + spec->alignment-1) / spec->alignment * spec->alignment;
-+  uint32_t chroma_stride = (rawChromaWidth + spec->alignment-1) / spec->alignment * spec->alignment;
-
-   assert(img->BitDepth_Y >= 8 && img->BitDepth_Y <= 16);
-   assert(img->BitDepth_C >= 8 && img->BitDepth_C <= 16);
-
--  int luma_bpl   = luma_stride   * ((img->BitDepth_Y+7)/8);
--  int chroma_bpl = chroma_stride * ((img->BitDepth_C+7)/8);
-+  uint32_t luma_bpl   = luma_stride   * ((img->BitDepth_Y+7)/8);
-+  uint32_t chroma_bpl = chroma_stride * ((img->BitDepth_C+7)/8);
-
--  int luma_height   = spec->height;
--  int chroma_height = rawChromaHeight;
-+  uint32_t luma_height   = spec->height;
-+  uint32_t chroma_height = rawChromaHeight;
-
-   bool alloc_failed = false;
-
--  uint8_t* p[3] = { 0,0,0 };
--  p[0] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(luma_height   * luma_bpl   + MEMORY_PADDING));
-+  // Compute the plane sizes in size_t. Each operand fits in uint32_t, but the
-+  // height * bytes-per-line product can exceed UINT32_MAX for large frames, so
-+  // the multiplication must be done in 64 bits. Computing it in 32 bits wraps
-+  // the allocation size to a small value while fill_image() later writes the
-+  // real (size_t) size -> heap buffer overflow (GHSA-vv8h-932h-7r86).
-+  uint8_t* p[3] = { nullptr,nullptr,nullptr };
-+  p[0] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(luma_height) * luma_bpl + MEMORY_PADDING));
-   if (p[0]==nullptr) { alloc_failed=true; }
-
-   if (img->get_chroma_format() != de265_chroma_mono) {
--    p[1] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(chroma_height * chroma_bpl + MEMORY_PADDING));
--    p[2] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(chroma_height * chroma_bpl + MEMORY_PADDING));
-+    p[1] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(chroma_height) * chroma_bpl + MEMORY_PADDING));
-+    p[2] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(chroma_height) * chroma_bpl + MEMORY_PADDING));
-
-     if (p[1]==nullptr || p[2]==nullptr) { alloc_failed=true; }
-   }
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2026-54241.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2026-54241.patch
deleted file mode 100644
index 6f5c526f17..0000000000
--- a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2026-54241.patch
+++ /dev/null
@@ -1,426 +0,0 @@
-From 3986aba8dec43bc539e5f7c349826cea902f9ee3 Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Wed, 3 Jun 2026 16:44:32 +0200
-Subject: [PATCH] fix pixel-accessor integer overflow on large frames
- (GHSA-ccfw-29x7-rrx3)
-
-The de265_image::get_image_plane_at_pos*() accessors computed the pixel
-offset `xpos + ypos*stride` in signed 32-bit int. For frames where
-width*height exceeds INT32_MAX (e.g. 46344x46344, both within the existing
-<=65535 limit), ypos*stride wraps negative and the returned pointer lands
-~2 GB before the buffer -> heap out-of-bounds read/write. This is independent
-of the earlier allocation fix (GHSA-vv8h-932h-7r86), which only widened the
-buffer size, not the offset arithmetic.
-
-Widen the image stride to ptrdiff_t (members, get_image_stride/get_luma_stride/
-get_chroma_stride, set_image_plane) so all pixel-offset math is evaluated in
-64 bits. The public C API (de265_get/set_image_plane) keeps int for ABI; the
-narrowing at that boundary is safe (stride <= ~65552).
-
-The same 32-bit-stride / absolute-coordinate pattern existed in several scalar
-paths that the accessors don't cover; widen those too:
-  - sao.cc: SAO offset indexing, and the inputCopy allocation+memcpy size
-    (an int size_t under-allocation -> heap write)
-  - motion.cc: mc_luma/mc_chroma reference-plane access (ref_stride, src_stride)
-  - intrapred.h: intra reference-border fill
-  - sei.cc: decoded-picture-hash MD5/CRC/checksum
-  - image-io.cc: YUV plane read and write
-The deblock kernels, SIMD layer (acceleration.h) and per-block code already
-use ptrdiff_t or only small block-local offsets and need no change.
-
-Also store pic_width/height_in_luma_samples as uint16_t (the value is
-provably <= MAX_PICTURE_WIDTH = 65535 after validation) so PicSizeInSamplesY
-needs only a single uint32_t cast instead of int*int (which was signed-overflow
-UB on the same trigger); add static_asserts tying the limits to the storage.
-
-Verified: girlshy bit-exact single- and multi-threaded; ASan+UBSan PoC against
-the get_image_plane_at_pos sink crashes pre-fix (UBSan signed-overflow at the
-accessor + ASan wild write) and is clean post-fix.
-
-(cherry picked from commit bdca87569b9c63c2a7054d90ae4462dbb78d159a)
-
-CVE: CVE-2026-54240 CVE-2026-54241
-Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/bdca87569b9c63c2a7054d90ae4462dbb78d159a]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- libde265/de265.cc    |  2 +-
- libde265/image-io.cc |  4 ++--
- libde265/image.cc    |  2 +-
- libde265/image.h     | 21 +++++++++++----------
- libde265/intrapred.h |  2 +-
- libde265/motion.cc   |  8 ++++----
- libde265/sao.cc      | 18 +++++++++---------
- libde265/sei.cc      | 18 ++++++++++--------
- libde265/sps.cc      |  4 ++--
- libde265/sps.h       | 11 +++++++++--
- 10 files changed, 50 insertions(+), 40 deletions(-)
-
-diff --git a/libde265/de265.cc b/libde265/de265.cc
-index 48e38a01..02b2d5fd 100644
---- a/libde265/de265.cc
-+++ b/libde265/de265.cc
-@@ -678,7 +678,7 @@ LIBDE265_API const uint8_t* de265_get_image_plane(const de265_image* img, int ch
-
-   uint8_t* data = img->pixels_confwin[channel];
-
--  if (stride) *stride = img->get_image_stride(channel) * ((de265_get_bits_per_pixel(img, channel)+7) / 8);
-+  if (stride) *stride = static_cast<int>(img->get_image_stride(channel) * ((de265_get_bits_per_pixel(img, channel)+7) / 8));
-
-   return data;
- }
-diff --git a/libde265/image-io.cc b/libde265/image-io.cc
-index f15234b6..14ca95f0 100644
---- a/libde265/image-io.cc
-+++ b/libde265/image-io.cc
-@@ -76,7 +76,7 @@ de265_image* ImageSource_YUV::read_next_image()
-   // --- load image ---
-
-   uint8_t* p;
--  int stride;
-+  ptrdiff_t stride;
-
-   p = img->get_image_plane(0);  stride = img->get_image_stride(0);
-   for (uint32_t y=0;y<height;y++) {
-@@ -174,7 +174,7 @@ void ImageSink_YUV::send_image(const de265_image* img)
-   // --- write image ---
-
-   const uint8_t* p;
--  int stride;
-+  ptrdiff_t stride;
-
-   int width = img->get_width();
-   int height= img->get_height();
-diff --git a/libde265/image.cc b/libde265/image.cc
-index 94f3c974..59a19184 100644
---- a/libde265/image.cc
-+++ b/libde265/image.cc
-@@ -184,7 +184,7 @@ de265_image_allocation de265_image::default_image_allocation = {
- };
-
-
--void de265_image::set_image_plane(int cIdx, uint8_t* mem, int stride, void *userdata)
-+void de265_image::set_image_plane(int cIdx, uint8_t* mem, ptrdiff_t stride, void *userdata)
- {
-   pixels[cIdx] = mem;
-   plane_user_data[cIdx] = userdata;
-diff --git a/libde265/image.h b/libde265/image.h
-index e0f1db24..114f41e4 100644
---- a/libde265/image.h
-+++ b/libde265/image.h
-@@ -26,6 +26,7 @@
- #endif
-
- #include <assert.h>
-+#include <stddef.h>
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -235,11 +236,11 @@ struct de265_image {
-   /* */ uint8_t* get_image_plane(int cIdx)       { return pixels[cIdx]; }
-   const uint8_t* get_image_plane(int cIdx) const { return pixels[cIdx]; }
-
--  void set_image_plane(int cIdx, uint8_t* mem, int stride, void *userdata);
-+  void set_image_plane(int cIdx, uint8_t* mem, ptrdiff_t stride, void *userdata);
-
-   uint8_t* get_image_plane_at_pos(int cIdx, int xpos,int ypos)
-   {
--    int stride = get_image_stride(cIdx);
-+    ptrdiff_t stride = get_image_stride(cIdx);
-     return pixels[cIdx] + xpos + ypos*stride;
-   }
-
-@@ -248,38 +249,38 @@ struct de265_image {
-   template <class pixel_t>
-   pixel_t* get_image_plane_at_pos_NEW(int cIdx, int xpos,int ypos)
-   {
--    int stride = get_image_stride(cIdx);
-+    ptrdiff_t stride = get_image_stride(cIdx);
-     return (pixel_t*)(pixels[cIdx] + (xpos + ypos*stride)*sizeof(pixel_t));
-   }
-
-   const uint8_t* get_image_plane_at_pos(int cIdx, int xpos,int ypos) const
-   {
--    int stride = get_image_stride(cIdx);
-+    ptrdiff_t stride = get_image_stride(cIdx);
-     return pixels[cIdx] + xpos + ypos*stride;
-   }
-
-   void* get_image_plane_at_pos_any_depth(int cIdx, int xpos,int ypos)
-   {
--    int stride = get_image_stride(cIdx);
-+    ptrdiff_t stride = get_image_stride(cIdx);
-     return pixels[cIdx] + ((xpos + ypos*stride) << bpp_shift[cIdx]);
-   }
-
-   const void* get_image_plane_at_pos_any_depth(int cIdx, int xpos,int ypos) const
-   {
--    int stride = get_image_stride(cIdx);
-+    ptrdiff_t stride = get_image_stride(cIdx);
-     return pixels[cIdx] + ((xpos + ypos*stride) << bpp_shift[cIdx]);
-   }
-
-   /* Number of pixels in one row (not number of bytes).
-    */
--  int get_image_stride(int cIdx) const
-+  ptrdiff_t get_image_stride(int cIdx) const
-   {
-     if (cIdx==0) return stride;
-     else         return chroma_stride;
-   }
-
--  int get_luma_stride() const { return stride; }
--  int get_chroma_stride() const { return chroma_stride; }
-+  ptrdiff_t get_luma_stride() const { return stride; }
-+  ptrdiff_t get_chroma_stride() const { return chroma_stride; }
-
-   int get_width (int cIdx=0) const { return cIdx==0 ? width  : chroma_width;  }
-   int get_height(int cIdx=0) const { return cIdx==0 ? height : chroma_height; }
-@@ -333,7 +334,7 @@ private:
-   int width = 0, height = 0;  // size in luma pixels
-
-   int chroma_width = 0, chroma_height = 0;
--  int stride = 0, chroma_stride = 0;
-+  ptrdiff_t stride = 0, chroma_stride = 0;
-
- public:
-   uint8_t BitDepth_Y = 0, BitDepth_C = 0;
-diff --git a/libde265/intrapred.h b/libde265/intrapred.h
-index 9b17f75b..a256cb3a 100644
---- a/libde265/intrapred.h
-+++ b/libde265/intrapred.h
-@@ -533,7 +533,7 @@ void intra_border_computer<pixel_t>::fill_from_image()
-   assert(nT<=32);
-
-   pixel_t* image;
--  int stride;
-+  ptrdiff_t stride;
-   image  = (pixel_t*)img->get_image_plane(cIdx);
-   stride = img->get_image_stride(cIdx);
-
-diff --git a/libde265/motion.cc b/libde265/motion.cc
-index c62c24c3..14e920e1 100644
---- a/libde265/motion.cc
-+++ b/libde265/motion.cc
-@@ -50,7 +50,7 @@ void mc_luma(const base_context* ctx,
-              const seq_parameter_set* sps, int mv_x, int mv_y,
-              int xP,int yP,
-              int16_t* out, int out_stride,
--             const pixel_t* ref, int ref_stride,
-+             const pixel_t* ref, ptrdiff_t ref_stride,
-              int nPbW, int nPbH, int bitDepth_L)
- {
-   int xFracL = mv_x & 3;
-@@ -129,7 +129,7 @@ void mc_luma(const base_context* ctx,
-     pixel_t padbuf[(MAX_CU_SIZE+16)*(MAX_CU_SIZE+7)];
-
-     const pixel_t* src_ptr;
--    int src_stride;
-+    ptrdiff_t src_stride;
-
-     if (-extra_left + xIntOffsL >= 0 &&
-         -extra_top  + yIntOffsL >= 0 &&
-@@ -181,7 +181,7 @@ void mc_chroma(const base_context* ctx,
-                int mv_x, int mv_y,
-                int xP,int yP,
-                int16_t* out, int out_stride,
--               const pixel_t* ref, int ref_stride,
-+               const pixel_t* ref, ptrdiff_t ref_stride,
-                int nPbWC, int nPbHC, int bit_depth_C)
- {
-   // chroma sample interpolation process (8.5.3.2.2.2)
-@@ -227,7 +227,7 @@ void mc_chroma(const base_context* ctx,
-     pixel_t padbuf[(MAX_CU_SIZE+16)*(MAX_CU_SIZE+3)];
-
-     const pixel_t* src_ptr;
--    int src_stride;
-+    ptrdiff_t src_stride;
-
-     int extra_top  = 1;
-     int extra_left = 1;
-diff --git a/libde265/sao.cc b/libde265/sao.cc
-index a0db84b2..579dcef2 100644
---- a/libde265/sao.cc
-+++ b/libde265/sao.cc
-@@ -28,8 +28,8 @@
- template <class pixel_t>
- void apply_sao_internal(de265_image* img, int xCtb,int yCtb,
-                         const slice_segment_header* shdr, int cIdx, int nSW,int nSH,
--                        const pixel_t* in_img,  int in_stride,
--                        /* */ pixel_t* out_img, int out_stride)
-+                        const pixel_t* in_img,  ptrdiff_t in_stride,
-+                        /* */ pixel_t* out_img, ptrdiff_t out_stride)
- {
-   const sao_info* saoinfo = img->get_sao_info(xCtb,yCtb);
-
-@@ -77,7 +77,7 @@ void apply_sao_internal(de265_image* img, int xCtb,int yCtb,
-
-   if (SaoTypeIdx==2) {
-     int hPos[2], vPos[2];
--    int vPosStride[2]; // vPos[] multiplied by image stride
-+    ptrdiff_t vPosStride[2]; // vPos[] multiplied by image stride
-     int SaoEoClass = (saoinfo->SaoEoClass >> (2*cIdx)) & 0x3;
-
-     switch (SaoEoClass) {
-@@ -266,8 +266,8 @@ void apply_sao_internal(de265_image* img, int xCtb,int yCtb,
- template <class pixel_t>
- void apply_sao(de265_image* img, int xCtb,int yCtb,
-                const slice_segment_header* shdr, int cIdx, int nSW,int nSH,
--               const pixel_t* in_img,  int in_stride,
--               /* */ pixel_t* out_img, int out_stride)
-+               const pixel_t* in_img,  ptrdiff_t in_stride,
-+               /* */ pixel_t* out_img, ptrdiff_t out_stride)
- {
-   if (img->high_bit_depth(cIdx)) {
-     apply_sao_internal<uint16_t>(img,xCtb,yCtb, shdr,cIdx,nSW,nSH,
-@@ -332,8 +332,8 @@ void apply_sample_adaptive_offset_sequential(de265_image* img)
-     return;
-   }
-
--  int lumaImageSize   = img->get_image_stride(0) * img->get_height(0) * img->get_bytes_per_pixel(0);
--  int chromaImageSize = img->get_image_stride(1) * img->get_height(1) * img->get_bytes_per_pixel(1);
-+  size_t lumaImageSize   = static_cast<size_t>(img->get_image_stride(0)) * img->get_height(0) * img->get_bytes_per_pixel(0);
-+  size_t chromaImageSize = static_cast<size_t>(img->get_image_stride(1)) * img->get_height(1) * img->get_bytes_per_pixel(1);
-
-   uint8_t* inputCopy = new uint8_t[ libde265_max(lumaImageSize, chromaImageSize) ];
-   if (inputCopy == nullptr) {
-@@ -347,10 +347,10 @@ void apply_sample_adaptive_offset_sequential(de265_image* img)
-
-   for (int cIdx=0;cIdx<nChannels;cIdx++) {
-
--    int stride = img->get_image_stride(cIdx);
-+    ptrdiff_t stride = img->get_image_stride(cIdx);
-     int height = img->get_height(cIdx);
-
--    memcpy(inputCopy, img->get_image_plane(cIdx), stride * height * img->get_bytes_per_pixel(cIdx));
-+    memcpy(inputCopy, img->get_image_plane(cIdx), static_cast<size_t>(stride) * height * img->get_bytes_per_pixel(cIdx));
-
-     for (int yCtb=0; yCtb<sps.PicHeightInCtbsY; yCtb++)
-       for (int xCtb=0; xCtb<sps.PicWidthInCtbsY; xCtb++)
-diff --git a/libde265/sei.cc b/libde265/sei.cc
-index 17b7f8b5..8a3d80a7 100644
---- a/libde265/sei.cc
-+++ b/libde265/sei.cc
-@@ -99,7 +99,7 @@ static void dump_sei_decoded_picture_hash(const sei_message* sei,
- class raw_hash_data
- {
- public:
--  raw_hash_data(int w, int stride);
-+  raw_hash_data(int w, ptrdiff_t stride);
-   ~raw_hash_data();
-
-   struct data_chunk {
-@@ -111,13 +111,14 @@ public:
-   data_chunk prepare_16bit(const uint8_t* data,int y);
-
- private:
--  int mWidth, mStride;
-+  int mWidth;
-+  ptrdiff_t mStride;
-
-   uint8_t* mMem;
- };
-
-
--raw_hash_data::raw_hash_data(int w, int stride)
-+raw_hash_data::raw_hash_data(int w, ptrdiff_t stride)
- {
-   mWidth=w;
-   mStride=stride;
-@@ -157,7 +158,7 @@ raw_hash_data::data_chunk raw_hash_data::prepare_16bit(const uint8_t* data,int y
- }
-
-
--static uint32_t compute_checksum(uint8_t* data,int w,int h,int stride, int bit_depth)
-+static uint32_t compute_checksum(uint8_t* data,int w,int h,ptrdiff_t stride, int bit_depth)
- {
-   uint32_t sum = 0;
-
-@@ -170,7 +171,7 @@ static uint32_t compute_checksum(uint8_t* data,int w,int h,int stride, int bit_d
-   }
-   else {
-     auto* data16 = reinterpret_cast<uint16_t*>(data);
--    int stride16 = stride / 2;
-+    ptrdiff_t stride16 = stride / 2;
-     for (int y=0; y<h; y++)
-       for(int x=0; x<w; x++) {
-         uint8_t xorMask = ( x & 0xFF ) ^ ( y & 0xFF ) ^ ( x  >>  8 ) ^ ( y  >>  8 );
-@@ -224,7 +225,7 @@ static inline uint16_t crc_process_byte_parallel(uint16_t crc, uint8_t byte)
- 	   (t << 12)) & 0xFFFF;
- }
-
--static uint32_t compute_CRC_8bit_fast(const uint8_t* data,int w,int h,int stride, int bit_depth)
-+static uint32_t compute_CRC_8bit_fast(const uint8_t* data,int w,int h,ptrdiff_t stride, int bit_depth)
- {
-   raw_hash_data raw_data(w,stride);
-
-@@ -250,7 +251,7 @@ static uint32_t compute_CRC_8bit_fast(const uint8_t* data,int w,int h,int stride
- }
-
-
--static void compute_MD5(uint8_t* data,int w,int h,int stride, uint8_t* result, int bit_depth)
-+static void compute_MD5(uint8_t* data,int w,int h,ptrdiff_t stride, uint8_t* result, int bit_depth)
- {
-   MD5_CTX md5;
-   MD5_Init(&md5);
-@@ -289,7 +290,8 @@ static de265_error process_sei_decoded_picture_hash(const sei_message* sei, de26
-   int nHashes = img->get_sps().chroma_format_idc==0 ? 1 : 3;
-   for (int i=0;i<nHashes;i++) {
-     uint8_t* data;
--    int w,h,stride;
-+    int w,h;
-+    ptrdiff_t stride;
-
-     w = img->get_width(i);
-     h = img->get_height(i);
-diff --git a/libde265/sps.cc b/libde265/sps.cc
-index aa871a09..a29a3c0a 100644
---- a/libde265/sps.cc
-+++ b/libde265/sps.cc
-@@ -570,7 +570,7 @@ de265_error seq_parameter_set::compute_derived_values(bool sanitize_values)
-   PicHeightInCtbsY   = ceil_div(pic_height_in_luma_samples,CtbSizeY);
-   PicSizeInMinCbsY   = PicWidthInMinCbsY * PicHeightInMinCbsY;
-   PicSizeInCtbsY = PicWidthInCtbsY * PicHeightInCtbsY;
--  PicSizeInSamplesY = pic_width_in_luma_samples * pic_height_in_luma_samples;
-+  PicSizeInSamplesY = static_cast<uint32_t>(pic_width_in_luma_samples) * pic_height_in_luma_samples;
-
-   if (chroma_format_idc==0 || separate_colour_plane_flag) {
-     CtbWidthC  = 0;
-@@ -1325,7 +1325,7 @@ de265_error seq_parameter_set::write(error_queue* errqueue, CABAC_encoder& out)
-   PicHeightInCtbsY   = ceil_div(pic_height_in_luma_samples,CtbSizeY);
-   PicSizeInMinCbsY   = PicWidthInMinCbsY * PicHeightInMinCbsY;
-   PicSizeInCtbsY = PicWidthInCtbsY * PicHeightInCtbsY;
--  PicSizeInSamplesY = pic_width_in_luma_samples * pic_height_in_luma_samples;
-+  PicSizeInSamplesY = static_cast<uint32_t>(pic_width_in_luma_samples) * pic_height_in_luma_samples;
-   if (chroma_format_idc==0 || separate_colour_plane_flag) {
-     CtbWidthC  = 0;
-     CtbHeightC = 0;
-diff --git a/libde265/sps.h b/libde265/sps.h
-index c8be9788..5cb0b46c 100644
---- a/libde265/sps.h
-+++ b/libde265/sps.h
-@@ -39,6 +39,13 @@ constexpr int MAX_NUM_LT_REF_PICS_SPS = 32;
- constexpr int MAX_PICTURE_WIDTH  = 65535;
- constexpr int MAX_PICTURE_HEIGHT = 65535;
-
-+// pic_width/height_in_luma_samples are stored as uint16_t and PicSizeInSamplesY as uint32_t,
-+// so these limits must keep width/height in 16 bits and their product in 32 bits.
-+static_assert(MAX_PICTURE_WIDTH  <= 0xFFFF, "picture width must fit in uint16_t");
-+static_assert(MAX_PICTURE_HEIGHT <= 0xFFFF, "picture height must fit in uint16_t");
-+static_assert((uint64_t)MAX_PICTURE_WIDTH * MAX_PICTURE_HEIGHT <= 0xFFFFFFFFu,
-+              "total luma sample count must fit in uint32_t");
-+
- enum {
-   CHROMA_MONO = 0,
-   CHROMA_420 = 1,
-@@ -111,8 +118,8 @@ public:
-   uint8_t chroma_format_idc;          // [0;3]
-
-   bool separate_colour_plane_flag;
--  int  pic_width_in_luma_samples;
--  int  pic_height_in_luma_samples;
-+  uint16_t pic_width_in_luma_samples;   // <= MAX_PICTURE_WIDTH  (validated on parse)
-+  uint16_t pic_height_in_luma_samples;  // <= MAX_PICTURE_HEIGHT (validated on parse)
-   bool conformance_window_flag;
-
-   int conf_win_left_offset;
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.1.3.bb
similarity index 77%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.1.3.bb
index 8e145cf8dd..f8e3f598a3 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.1.3.bb
@@ -9,12 +9,9 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"

 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
-           file://CVE-2026-49295.patch \
-           file://CVE-2026-49337.patch \
-           file://CVE-2026-49346.patch \
-           file://CVE-2026-54240-CVE-2026-54241.patch \
-"
-SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
+           file://0001-x86-detect-AVX2-AVX-512-with-CPUID-instead-of-__buil.patch \
+           "
+SRCREV = "ba62bf4cfb3242f3bf0a45617ff09e35236e4d82"


 inherit cmake pkgconfig
