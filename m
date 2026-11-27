Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8236.1795739785426795999
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LgmAcH3r;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f07a960666so52344455ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739785; x=1796344585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/nSTQqYULzZV4ec+03NMsxZDTGmKK0zLsslwNcOpuQ=;
        b=LgmAcH3rvjGXtCv2pz7FWzHfmqconwgBCcUKC6ItPO0hgcMAJ+V3OppL1Qz7Y8HPpt
         98HZzik0js9vPscy0W4+4GsXhbXQp1X8r9mmx1drQyrQClvR1hiL+Bdk+zmCJ9TkanDM
         xh9VV9IiNtKpLuObXUS6r9hZO9QWri+HSyp7kbMKUC04byFQAiDtVi2NJpmwhQ0sq+yN
         z81rMO0LaNqRBHNZQrqXSen9a1Sn6l91oWDykZDWANz4pLuxcG/hM8Il62EOi5yvjt4G
         eOGvzZKyApVKsVyiv/xBDW2rfwRf8Fa9zTa2FbHvDr5BNF1yKa88oynWieupre38RauW
         OUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739785; x=1796344585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/nSTQqYULzZV4ec+03NMsxZDTGmKK0zLsslwNcOpuQ=;
        b=KR9kUgncVsaerkRUPiCMJN75hi/aCjOlEge2xrxGxlXvZ8eCtgejyKoF8vwCb70jWn
         MH8xSuw0enp7pv4h6qkm2L7RPnvbGOlevLPeedns5WCZ13HrOUx5xWnxh9L9UDYkYJKZ
         IPOkw+/yYG78KVjpg1zHG5elsMRCxo4ibhszwIJnYJt445uMR8VHCemkNdzdkurWMUg6
         qzY+1tLEE1BIaz88yXGH5opO7jbg88ua1eP41U2oHHqjRDsOw3X4j6F2jpJTDmIiQFfV
         O5snjSfEJZm0JJAOZhZMDbtenOJnPwLqNoBz2eEJu860gywjNspJMqX8EWrWmmvQrtuA
         d1zw==
X-Gm-Message-State: APuU4Z/UlngEDDNQNiQilGi1q+qC94VK+CAXG2/03S104yqKjmkL+sux
	VYVZ8PVsFZ575SBj0NsWzPUW5WTvsKzPH+KXhyaFJW1Y3RBvNAiR5Uu2mwswYmng
X-Gm-Gg: AZFdTZdIZ0DVO2DU9ZfJzHyqmgvPucMHB+OYXuINjV0AvQXCRWIvB5YYe/Vjt+LWnqS
	yohcbxzQCiSeDqzYqru5uWhTyteNdvfVRx9jlMXEnzxypLTk97dvP89nZwq901gBNGir5zNq3Ek
	MI+U8RefI+ByLjI5dBCGhN+Ehc5pZCj04n62JV77MfoNrShTKDYe6QnBRCgIiYZfPSXopihWiWW
	6wZ89kuhcU4Y5jHH1OjvEuNWeNFpXV9AEZPsdyDmp2j3BxarRFHTePWIIWK+yjY610v8sInfAxu
	kuHjq2cVmsk+U3JhIlNm2b1bu+ndmOr4NTy3AFEu5YBxZ1d4L3Tcmq4OIZxRHLKh5v01IdRjBC5
	eyZnFGYxL3gRKUVc8Bj0TafMJ6vMXKf0KSSMMu2tNx2oeAoEyLqr77SbM5wXBeGQrISuxEkPLnR
	j6qnXSe/gBEfuaPFe7mswAvLrmiApmE6CdhyVRvo+xurbXS6PVAu4oH0XGKVWXtIHC5KKyjPPrB
	k+PkX1jdWf+t8xlZ/Dk63YxDhpEku3SvrGHfw7x6AX949kHJHpIa/ghPXWuFcpAaxCZHbK7pw0k
	AgsUDq8XXSRFAQuXD8AfrvcFzOmXiNIlOeZUD2Gmhb7Bp1CKCNdlJ7Z31WmOX+G7mKcZtRJU/ne
	xjkT/+D1iRuCGQ8bx4OyNTg6seknvuk9CWli40zHDAgibeT1xK/QzjfHKwTsHpvhr+s5k6mC33W
	FRWIo2gaEXvbURyfHAEepRmPBl3ZNguP1EzXW4G8ydF+mSb+MOysHgknl4kSZYqlEaM7hKtZKdg
	gX/wvhchXMHFyleHR32O8mfwySIHHkIQjQZNhgohNaw/C/vuXFA1Q156ldSGfOr9rpHhEBMHILZ
	k7H6
X-Received: by 2002:a17:902:ec8b:b0:2ea:33eb:7375 with SMTP id d9443c01a7336-2f03f16ac73mr227135025ad.45.1795739783870;
        Thu, 26 Nov 2026 16:36:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/39] hdf5: upgrade 2.2.0 -> 2.3.0
Date: Thu, 26 Nov 2026 16:35:20 -0800
Message-ID: <20261127003543.2167775-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133186
Content-Type: text/plain; charset="utf-8"

- Add internally concurrent multithreaded reads of chunked datasets and
  a new H5Z_class3_t filter class structure with feature flags.
- ROS3 VFD can read an alternate endpoint URL from the AWS config file.
- Installed CMake package: new linkage-agnostic hdf5:: targets; a
  find_package() requesting both shared and static components now
  fails and the shared libraries are preferred when none is requested.
- The static library now links the threads library in default builds.
- Many security fixes, including the CVE-2026-19023..19028 and
  CVE-2026-120689/120754..120758 patches carried so far.

Drop the eight CVE patches, they are all included in 2.3.0 (the
fletcher32 and chunk rank checks are implemented slightly differently
upstream). Refresh 0001-cmake-remove-build-flags.patch for the changed
libhdf5.settings.in and 0002-Remove-suffix-shared-from-shared-library-name
for line offsets.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../files/0001-cmake-remove-build-flags.patch |  19 +-
 ...ffix-shared-from-shared-library-name.patch |   7 +-
 .../hdf5/files/CVE-2026-120689.patch          |  60 --
 .../CVE-2026-120754-CVE-2026-120755.patch     | 172 ------
 .../hdf5/files/CVE-2026-120756.patch          |  45 --
 .../hdf5/files/CVE-2026-120757.patch          |  63 --
 .../hdf5/files/CVE-2026-120758.patch          | 143 -----
 .../files/CVE-2026-19023-CVE-2026-19024.patch | 176 ------
 .../hdf5/files/CVE-2026-19025.patch           | 112 ----
 ...-19026-CVE-2026-19027-CVE-2026-19028.patch | 579 ------------------
 .../hdf5/{hdf5_2.2.0.bb => hdf5_2.3.0.bb}     |  10 +-
 11 files changed, 10 insertions(+), 1376 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
 delete mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch
 rename meta-oe/recipes-support/hdf5/{hdf5_2.2.0.bb => hdf5_2.3.0.bb} (83%)

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index 8ccf4a3a13..173618524a 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -12,13 +12,8 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 Updated for v2.0.0
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-
 ---
- src/libhdf5.settings.cmake.in | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
 diff --git a/src/libhdf5.settings.in b/src/libhdf5.settings.in
-index deb07ed..6f255c4 100644
 --- a/src/libhdf5.settings.in
 +++ b/src/libhdf5.settings.in
 @@ -4,7 +4,7 @@
@@ -30,7 +25,7 @@ index deb07ed..6f255c4 100644
                    Configured by: @CMAKE_GENERATOR@
                      Host system: @CMAKE_HOST_SYSTEM@
                Uname information: @CMAKE_SYSTEM_NAME@
-@@ -34,12 +34,12 @@
+@@ -34,12 +34,12 @@ Linking Options:
  Languages:
  ----------
                                C: YES
@@ -47,17 +42,17 @@ index deb07ed..6f255c4 100644
                        AM_CFLAGS: @AM_CFLAGS@
                 Shared C Library: @H5_ENABLE_SHARED_LIB@
                 Static C Library: @H5_ENABLE_STATIC_LIB@
-@@ -51,11 +51,11 @@
+@@ -51,11 +51,11 @@ Languages:
                 AM Fortran Flags: @AM_FCFLAGS@
-          Shared Fortran Library: @H5_ENABLE_SHARED_LIB@
-          Static Fortran Library: @H5_ENABLE_STATIC_LIB@
--               Module Directory: @CMAKE_Fortran_MODULE_DIRECTORY@
+          Shared Fortran Library: @H5_FORTRAN_SHARED_LIB@
+          Static Fortran Library: @H5_FORTRAN_STATIC_LIB@
+-               Module Directory: @H5_FORTRAN_MODULE_DIR@
 +               Module Directory:
  
                              C++: @HDF5_BUILD_CPP_LIB@
-                    C++ Compiler: @CMAKE_CXX_COMPILER@ @CMAKE_CXX_COMPILER_VERSION@
+                    C++ Compiler: @H5_CPP_COMPILER@
 -                      C++ Flags: @CMAKE_CXX_FLAGS@ @HDF5_BUILD_MODE_CXX_FLAGS@
 +                      C++ Flags:
                     H5 C++ Flags: @HDF5_CMAKE_CXX_FLAGS@
                     AM C++ Flags: @AM_CXXFLAGS@
-              Shared C++ Library: @H5_ENABLE_SHARED_LIB@
+              Shared C++ Library: @H5_CPP_SHARED_LIB@
diff --git a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
index 33ba78042a..dfe86012a4 100644
--- a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
+++ b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
@@ -9,14 +9,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Adapted to v2.0.0
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-
 ---
- CMakeLists.txt | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
+diff --git a/CMakeLists.txt b/CMakeLists.txt
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -278,20 +278,20 @@
+@@ -256,20 +256,20 @@ set (HDF5_F90_TEST_LIB_TARGET     "${HDF5_F90_TEST_LIB_CORENAME}-static")
  set (HDF5_F90_C_TEST_LIB_TARGET   "${HDF5_F90_C_TEST_LIB_CORENAME}-static")
  set (HDF5_HL_F90_LIB_TARGET       "${HDF5_HL_F90_LIB_CORENAME}-static")
  set (HDF5_HL_F90_C_LIB_TARGET     "${HDF5_HL_F90_C_LIB_CORENAME}-static")
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
deleted file mode 100644
index bddffa8c17..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0472315404dc03d0e89eec4513eb80930f9b176e Mon Sep 17 00:00:00 2001
-From: PGZXB <420254146@qq.com>
-Date: Fri, 9 Oct 2026 02:52:55 +0800
-Subject: [PATCH] Fix StackOverflow when calling `H5Gget_info` (#6685)
-
-Verify B-tree node level when an expected level value is provided
-
-(cherry picked from commit 5933130b610c7bd6e66fe93c2798b97e3f3188c8)
-
-CVE: CVE-2026-120689
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/5933130b610c7bd6e66fe93c2798b97e3f3188c8]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- release_docs/CHANGELOG.md |  6 ++++++
- src/H5B.c                 | 14 ++++++++++++++
- 2 files changed, 20 insertions(+)
-
-diff --git a/release_docs/CHANGELOG.md b/release_docs/CHANGELOG.md
-index d547b36..f8aacb0 100644
---- a/release_docs/CHANGELOG.md
-+++ b/release_docs/CHANGELOG.md
-@@ -232,6 +232,12 @@ The `h5repack` tool now obtains its default low and high library version bounds
- 
-    `H5S_select_deserialize()` and the per-selection-type deserialize callbacks (all, hyperslab, none, and point) previously computed the pointer to the last valid buffer byte as `buffer + size - 1` without first checking the buffer size. A buffer shorter than the 4-byte selection-type header, or a zero-length selection-info buffer, would underflow this computation and produce an out-of-bounds end pointer, defeating subsequent overflow checks. The deserialize routines now reject a buffer that is too small to hold the selection type, and they reject an empty selection-info buffer before deriving the end pointer. Hyperslab decoding additionally now rejects a serialized rank of 0 or greater than `H5S_MAX_RANK`. As a companion fix, `H5S__hyper_serialize()` now returns an error when asked to serialize a hyperslab selection on a rank-0 (scalar or null) dataspace, a state that can arise when a dataspace extent is collapsed to a scalar after a hyperslab selection has already been made.
- 
-+### Fixed a stack overflow when iterating a corrupted B-tree
-+
-+   `H5B__iterate_helper()` now verifies that a B-tree node it has just protected has the level the traversal expects, when the expected level is known. The equivalent check in `H5B__cache_deserialize()` only runs when a node is first loaded into the metadata cache, so a corrupted B-tree whose child pointer revisits a node that is already cached (for example, a node that points to itself) could bypass that check and recurse without bound until the stack was exhausted. Such a file is now rejected with an error instead of crashing. This was observed through `H5Gget_info()`.
-+
-+   Fixes GitHub issue #6403
-+
- ## Java Library
- 
- ### Fixed a datatype ID leak when reading or writing array/vlen datatypes
-diff --git a/src/H5B.c b/src/H5B.c
-index c957170..4c6b1a5 100644
---- a/src/H5B.c
-+++ b/src/H5B.c
-@@ -1140,6 +1140,20 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_lev
-     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
-         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5_ITER_ERROR, "unable to load B-tree node");
- 
-+    /* Check for a corrupted B-tree node.  If the caller has told us what
-+     * level to expect, verify that the node we just protected actually has
-+     * that level.  This check must be performed here rather than relying
-+     * solely on the equivalent check in H5B__cache_deserialize, because
-+     * that deserialize callback only runs when a node is first loaded into
-+     * the metadata cache.  A corrupted B-tree whose child pointer revisits
-+     * a node that is already cached (e.g. a node that points to itself)
-+     * bypasses the deserialize callback entirely, so without this check the
-+     * recursion below would never terminate and would overflow the stack.
-+     */
-+    if (exp_level != H5B_UNKNOWN_NODELEVEL && bt->level != (unsigned)exp_level)
-+        HGOTO_ERROR(H5E_BTREE, H5E_BADVALUE, H5_ITER_ERROR,
-+                    "B-tree node level is not as expected, possibly corrupted");
-+
-     /* Iterate over node's children */
-     for (u = 0; u < bt->nchildren && ret_value == H5_ITER_CONT; u++) {
-         if (bt->level > 0)
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
deleted file mode 100644
index 3f0a8d69d5..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From 78672660618de8cca7c804f465886af02a89e79b Mon Sep 17 00:00:00 2001
-From: Matt L <124107509+mattjala@users.noreply.github.com>
-Date: Wed, 21 Oct 2026 13:52:39 -0500
-Subject: [PATCH] Bound filter header reads to the stored chunk length (#6585)
-
-* bound scaleoffset and fletcher32 reads to the chunk buffer
-
-* Bound filter header reads to the stored chunk length
-
-This PR is an expansion of #6579.
-
-The scaleoffset bounds checks measured against *buf_size, the size of the
-chunk buffer, rather than nbytes, the number of bytes the pipeline read from
-the file. H5D__chunk_lock() sizes a filtered chunk buffer to MAX(stored size,
-unfiltered size) so filters have room to expand into, and fills only the
-stored bytes, so the buffer is routinely longer than the data in it. A
-truncated chunk therefore passed the header check and decompressed out of the
-uninitialized remainder of the allocation, returning unrelated heap contents
-as dataset data. Because the reads stay inside the allocation, the address
-sanitizer does not see them.
-
-This PR switches every read-side check in H5Z__filter_scaleoffset()
-to bound against nbytes and pass the stored length to
-H5Z__scaleoffset_decompress().
-
-Similar short-chunk checks are added to szip and fletcher32.
-
-The direct chunk test has been extended to cover a chunk whose unfiltered size is
-larger than the bytes stored for it, and to cover szip.
-
-* Correct potential invalid pointer usage
-
-* update CHANGELOG
-
-* Update CHANGELOG comment
-
-* Guard scaleoffset output size against multiplication overflow
-
----------
-
-Co-authored-by: Nayyar <nayyar@bugqore.com>
-Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
-
-CVE: CVE-2026-120754 CVE-2026-120755
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/cdb13c4de9c7edbbae180f384e2e610a3b3cf185]
-
-Dropped changes to the test and CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Zfletcher32.c  | 13 +++++++------
- src/H5Zscaleoffset.c | 15 +++++++++++----
- src/H5Zszip.c        | 18 ++++++++++++++----
- 3 files changed, 32 insertions(+), 14 deletions(-)
-
-diff --git a/src/H5Zfletcher32.c b/src/H5Zfletcher32.c
-index b89724ad0a3..5ef3b04cbcf 100644
---- a/src/H5Zfletcher32.c
-+++ b/src/H5Zfletcher32.c
-@@ -62,13 +62,14 @@ H5Z__filter_fletcher32(unsigned flags, size_t H5_ATTR_UNUSED cd_nelmts,
-     assert(sizeof(uint32_t) >= 4);
- 
-     if (flags & H5Z_FLAG_REVERSE) { /* Read */
--        /* A Fletcher32-filtered buffer must contain at least the trailing
--         * checksum.  Reject anything smaller to avoid a size_t underflow
--         * when computing the data length.
-+        /* The checksum is stored at the end of the chunk, so anything shorter
-+         * than the checksum itself makes the length arithmetic below wrap.  A
-+         * chunk of exactly FLETCHER_LEN bytes holds no data and would return a
-+         * filtered size of zero, which the pipeline reports as a filter failure,
-+         * so reject it here where the reason can be stated.
-          */
--        if (nbytes < FLETCHER_LEN)
--            HGOTO_ERROR(H5E_STORAGE, H5E_OVERFLOW, 0,
--                        "fletcher32 filter input buffer too small to contain checksum");
-+        if (nbytes <= FLETCHER_LEN)
-+            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
- 
-         /* Do checksum if it's enabled for read; otherwise skip it
-          * to save performance. */
-diff --git a/src/H5Zscaleoffset.c b/src/H5Zscaleoffset.c
-index d39b4f40403..d506e5203a0 100644
---- a/src/H5Zscaleoffset.c
-+++ b/src/H5Zscaleoffset.c
-@@ -1205,10 +1205,18 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
-         unsigned long long minval_mask  = 0;
-         unsigned           minval_size  = 0;
- 
--        minbits = 0;
--        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5, (unsigned char *)*buf + *buf_size - 1))
-+        /* Bound every read below by nbytes rather than *buf_size.  The caller may
-+         * provide a buffer larger than the data it holds, so restrict the read
-+         * to the valid nbytes.
-+         */
-+        /* The minbits and minval-size fields are the first five bytes of the
-+         * stream, so validate that length before deriving an end-of-buffer
-+         * pointer from nbytes
-+         */
-+        if (nbytes < 5)
-             HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
- 
-+        minbits = 0;
-         for (i = 0; i < 4; i++) {
-             minbits_mask = ((unsigned char *)*buf)[i];
-             minbits_mask <<= i * 8;
-@@ -1224,8 +1232,7 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
-         minval_size = sizeof(unsigned long long) <= ((unsigned char *)*buf)[4] ? sizeof(unsigned long long)
-                                                                                : ((unsigned char *)*buf)[4];
-         minval      = 0;
--        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5 + minval_size,
--                                  (unsigned char *)*buf + *buf_size - 1))
-+        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5 + minval_size, (unsigned char *)*buf + nbytes - 1))
-             HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
-         for (i = 0; i < minval_size; i++) {
-             minval_mask = ((unsigned char *)*buf)[5 + i];
-diff --git a/src/H5Zszip.c b/src/H5Zszip.c
-index 9b37035374f..dd6c3619873 100644
---- a/src/H5Zszip.c
-+++ b/src/H5Zszip.c
-@@ -28,6 +28,9 @@
- #include "szlib.h"
- #endif
- 
-+/* Size of the uncompressed-length header stored in front of the szip stream */
-+#define SZIP_HEADER_LEN 4
-+
- /* Local function prototypes */
- static htri_t H5Z__can_apply_szip(hid_t dcpl_id, hid_t type_id, hid_t space_id);
- static herr_t H5Z__set_local_szip(hid_t dcpl_id, hid_t type_id, hid_t space_id);
-@@ -284,6 +287,13 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
-         uint32_t stored_nalloc; /* Number of bytes the compressed block will expand into */
-         size_t   nalloc;        /* Number of bytes the compressed block will expand into */
- 
-+        /* The uncompressed length is stored in front of the compressed stream, so
-+         * a chunk shorter than that header makes the length arithmetic below wrap.
-+         * A chunk of exactly SZIP_HEADER_LEN bytes holds no compressed data.
-+         */
-+        if (nbytes <= SZIP_HEADER_LEN)
-+            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
-+
-         /* Get the size of the uncompressed buffer */
-         newbuf = (unsigned char *)(*buf);
-         UINT32DECODE(newbuf, stored_nalloc);
-@@ -295,7 +305,7 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
- 
-         /* Decompress the buffer */
-         size_out = nalloc;
--        if (SZ_BufftoBuffDecompress(outbuf, &size_out, newbuf, nbytes - 4, &sz_param) != SZ_OK)
-+        if (SZ_BufftoBuffDecompress(outbuf, &size_out, newbuf, nbytes - SZIP_HEADER_LEN, &sz_param) != SZ_OK)
-             HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, 0, "szip_filter: decompression failed");
-         assert(size_out == nalloc);
- 
-@@ -313,7 +323,7 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
-         unsigned char *dst = NULL; /* Temporary pointer to new output buffer */
- 
-         /* Allocate space for the compressed buffer & header (assume data won't get bigger) */
--        if (NULL == (dst = outbuf = (unsigned char *)H5MM_malloc(nbytes + 4)))
-+        if (NULL == (dst = outbuf = (unsigned char *)H5MM_malloc(nbytes + SZIP_HEADER_LEN)))
-             HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, 0, "unable to allocate szip destination buffer");
- 
-         /* Encode the uncompressed length */
-@@ -332,8 +342,8 @@ H5Z__filter_szip(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
-         /* Set return values */
-         *buf      = outbuf;
-         outbuf    = NULL;
--        *buf_size = nbytes + 4;
--        ret_value = size_out + 4;
-+        *buf_size = nbytes + SZIP_HEADER_LEN;
-+        ret_value = size_out + SZIP_HEADER_LEN;
-     }
- 
- done:
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
deleted file mode 100644
index 28bd658598..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 43855883c1ea10a072b7e7cf2dbc5a29ab411a8f Mon Sep 17 00:00:00 2001
-From: Nayyar <nayyar@bugqore.com>
-Date: Sat, 12 Sep 2026 16:37:49 +0530
-Subject: [PATCH] check object header message size after decoding its header
- (#6589)
-
-(cherry picked from commit 10f1af5528168c5a71a58eba0b486e0677f3aaa3)
-
-CVE: CVE-2026-120756
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/10f1af5528168c5a71a58eba0b486e0677f3aaa3]
-
-Dropped changes to the test and CHANGELOG file.
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Ocache.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/H5Ocache.c b/src/H5Ocache.c
-index 8f0928f290e..9dc6a2e21bb 100644
---- a/src/H5Ocache.c
-+++ b/src/H5Ocache.c
-@@ -1270,9 +1270,6 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
-         if (mesg_size != H5O_ALIGN_OH(oh, mesg_size))
-             HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL, "message not aligned");
- 
--        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
--            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
--
-         /* Message flags */
-         if (H5_IS_BUFFER_OVERFLOW(chunk_image, 1, p_end))
-             HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, FAIL, "ran off end of input buffer while decoding");
-@@ -1305,6 +1302,13 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
-             }
-         }
- 
-+        /* The message body starts after the message header, so its size can
-+         * only be checked against the buffer once the whole header has been
-+         * decoded
-+         */
-+        if (H5_IS_BUFFER_OVERFLOW(chunk_image, mesg_size, p_end))
-+            HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, FAIL, "message size exceeds buffer end");
-+
-         /* Increment count of null messages */
-         if (H5O_NULL_ID == id)
-             nullcnt++;
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
deleted file mode 100644
index 886d6d946b..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From fa4c737d41c1c86638525a290b5576c8966090d0 Mon Sep 17 00:00:00 2001
-From: Nayyar <nayyar@bugqore.com>
-Date: Thu, 8 Oct 2026 18:57:14 +0530
-Subject: [PATCH] reject malformed external link data in H5L__extern_traverse
- (#6708)
-
-* validate external link data before parsing in traversal
-
-(cherry picked from commit 8117f4c75fdfb5e759ad73ce62d7ef4584130acd)
-
-CVE: CVE-2026-120757
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/8117f4c75fdfb5e759ad73ce62d7ef4584130acd]
-
-Dropped changes to the test and CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Lexternal.c | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/src/H5Lexternal.c b/src/H5Lexternal.c
-index 793825d1c3d..5f874d53177 100644
---- a/src/H5Lexternal.c
-+++ b/src/H5Lexternal.c
-@@ -93,7 +93,7 @@ static const H5L_class_t H5L_EXTERN_LINK_CLASS[1] = {{
-  */
- static hid_t
- H5L__extern_traverse(const char H5_ATTR_UNUSED *link_name, hid_t cur_group, const void *_udata,
--                     size_t H5_ATTR_UNUSED udata_size, hid_t lapl_id, hid_t H5_ATTR_UNUSED dxpl_id)
-+                     size_t udata_size, hid_t lapl_id, hid_t H5_ATTR_UNUSED dxpl_id)
- {
-     H5P_genplist_t    *plist;                              /* Property list pointer */
-     H5G_loc_t          root_loc;                           /* Location of root group in external file */
-@@ -121,6 +121,18 @@ H5L__extern_traverse(const char H5_ATTR_UNUSED *link_name, hid_t cur_group, cons
-     /* Sanity checks */
-     assert(p);
- 
-+    /* The udata holds a version/flags byte followed by two NULL-terminated
-+     * strings (file name and object path).  The strings are located below with
-+     * strlen(), so validate the buffer against udata_size first: it must have
-+     * room for both strings and end on a NULL terminator.  A malformed link
-+     * from a corrupted file would otherwise read past the udata buffer.  This
-+     * matches the checks in H5Lunpack_elink_val().
-+     */
-+    if (udata_size <= 2)
-+        HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "external link data too small");
-+    if (p[udata_size - 1] != '\0')
-+        HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "external link data is not NULL-terminated");
-+
-     /* Check external link version & flags */
-     if (((*p >> 4) & 0x0F) > H5L_EXT_VERSION)
-         HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "bad version number for external link");
-@@ -131,7 +143,9 @@ H5L__extern_traverse(const char H5_ATTR_UNUSED *link_name, hid_t cur_group, cons
-     /* Gather some information from the external link's user data */
-     file_name = (const char *)p;
-     fname_len = strlen(file_name);
--    obj_name  = (const char *)p + fname_len + 1;
-+    if ((fname_len + 1) >= (udata_size - 1))
-+        HGOTO_ERROR(H5E_LINK, H5E_CANTDECODE, H5I_INVALID_HID, "external link data has no object path");
-+    obj_name = (const char *)p + fname_len + 1;
- 
-     /* Get the plist structure */
-     if (NULL == (plist = H5P_object_verify(lapl_id, H5P_LINK_ACCESS, true)))
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
deleted file mode 100644
index a8fb5f72ff..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From 277a6bbfdb8e852b7bbd08ae002907fc559e0194 Mon Sep 17 00:00:00 2001
-From: tbeu <tbeu@users.noreply.github.com>
-Date: Sat, 3 Oct 2026 07:43:53 +0200
-Subject: [PATCH] Fix NULL pointer dereferences in H5HL_protect and
- H5HL_unprotect (#6377)
-
-* Fix NULL pointer dereferences in H5HL_protect and H5HL_unprotect
-
-When reading corrupted HDF5 files, H5HL_protect can encounter a heap
-where prfx->heap is NULL or heap->dblk_image is NULL. Similarly,
-H5HL_unprotect can encounter a heap where heap->prfx or heap->dblk has
-been set to NULL by H5HL__prfx_dest during cache eviction of corrupted
-entries. In both cases, the code proceeded to dereference NULL pointers,
-causing a segfault (found by OSS-Fuzz via matio).
-
-Replace the assert in H5HL_unprotect with proper NULL checks and
-HGOTO_ERROR, and add equivalent guards in H5HL_protect, so corrupted
-files are rejected gracefully instead of crashing.
-
-* Address review: drop speculative H5HL_protect NULL checks, add regression test + changelog
-
-- Remove the NULL checks in H5HL_protect for prfx->heap and heap->dblk_image.
-  prfx->heap is set in H5HL__prfx_new and only cleared in H5HL__prfx_dest (which
-  frees the prefix in the same call), so the check is unreachable and could leak
-  prfx via the done block. heap->dblk_image is NULL by design whenever the data
-  block is not contiguous with the prefix, so that check was a false positive.
-- Keep the H5HL_unprotect NULL checks for heap->prfx and heap->dblk, which are the
-  actual fix for the reported crash (OSS-Fuzz 504827191).
-- Add a regression test (corrupt_heap_unprotect) in test/lheap.c using the
-  minimized fuzzer file heap_corrupt_prfx.h5, asserting the corrupted file fails
-  gracefully instead of crashing in H5HL_unprotect.
-- Document the fix in release_docs/CHANGELOG.md.
-
-* Improve lheap regression test for H5HL_unprotect NULL deref
-
-Replace the file-based traversal (which does not deterministically reach
-the cache-eviction path that nulls heap->prfx) with a white-box check that
-protects a local heap, simulates the corrupted/evicted condition by nulling
-the heap's prfx/dblk pointers, and verifies H5HL_unprotect() returns an
-error instead of dereferencing NULL. Keep a best-effort open/traverse of the
-OSS-Fuzz minimized file (issue 504827191) as a smoke test.
-
-Verified: without the fix the test aborts (H5AC_unpin_entry(NULL)); with the
-fix it passes.
-
-* Improve lheap regression test to consider review comments
-
-* Fix formatting
-
-* test: improve lheap regression test for reviewer comments
-
-- Use H5L_info2_t in visitor (matches H5L_iterate2_t signature)
-- Use H5O_info2_t with H5Oget_info_by_name3
-- Replicate matio's exact traversal: H5Literate2 + H5Gopen2/H5Dopen2 +
-  H5Lvisit2 recursion, H5Aiterate2 attribute reads, skip #refs#/#subsystem#
-- Keep white-box deterministic NULL-pointer guard (fuzzer file does not
-  deterministically crash via public API alone; original crash required
-  matio fuzzer's specific cache-pressure environment)
-- Add CORRUPT_HEAP_TESTFILE define back for white-box test
-
-* Fix formatting
-
-* Reject a local heap unprotect when its pinned cache entry is gone
-
-H5HL_unprotect() now reports an error instead of dereferencing NULL when the
-cache entry that H5HL_protect() pinned is no longer linked to the heap, and it
-checks for that before decrementing the protect count so a rejected call leaves
-the heap unchanged. The regression test as written couldn't fail, since its cleanup
-label was after passed and every failure path still returned 0 (success).
-It also only ever built single-cache-object heaps, and didn't reach the branch the crash
-came from. It now grows a heap into a separate data block to cover both
-branches and uses the standard error reporting.
-
----------
-
-Co-authored-by: Matthew Larson <mlarson@hdfgroup.org>
-Co-authored-by: Matt L <124107509+mattjala@users.noreply.github.com>
-Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
-
-CVE: CVE-2026-120758
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/91fc37c3325264e67699408e3a190fe4f329bf85]
-
-Dropped changes to the test and CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5HL.c | 34 +++++++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/src/H5HL.c b/src/H5HL.c
-index b55b3690617..838426406a9 100644
---- a/src/H5HL.c
-+++ b/src/H5HL.c
-@@ -416,28 +416,36 @@ H5HL_unprotect(H5HL_t *heap)
-     /* Check arguments */
-     assert(heap);
- 
--    /* Decrement # of times heap is protected */
--    heap->prots--;
--
-     /* Check for last unprotection of heap */
--    if (heap->prots == 0) {
--        /* Check for separate heap data block */
-+    if (heap->prots == 1) {
-+        void *pin_obj; /* Pointer to local heap object to unpin */
-+
-+        /* Get the object that H5HL_protect() pinned.  It is unlinked from the
-+         * heap when the cache destroys it, which a damaged file can provoke,
-+         * so check for it before the protect count is decremented.
-+         */
-         if (heap->single_cache_obj) {
--            /* Mark local heap prefix as evictable again */
--            if (FAIL == H5AC_unpin_entry(heap->prfx))
--                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "unable to unpin local heap data block");
-+            if (NULL == heap->prfx)
-+                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "local heap prefix is not in the cache");
-+
-+            pin_obj = heap->prfx;
-         }
-         else {
--            /* Sanity check */
--            assert(heap->dblk);
-+            if (NULL == heap->dblk)
-+                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "local heap data block is not in the cache");
- 
--            /* Mark local heap data block as evictable again */
-             /* (data block still pins prefix) */
--            if (FAIL == H5AC_unpin_entry(heap->dblk))
--                HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "unable to unpin local heap data block");
-+            pin_obj = heap->dblk;
-         }
-+
-+        /* Mark local heap object as evictable again */
-+        if (FAIL == H5AC_unpin_entry(pin_obj))
-+            HGOTO_ERROR(H5E_HEAP, H5E_CANTUNPIN, FAIL, "unable to unpin local heap object");
-     }
- 
-+    /* Decrement # of times heap is protected */
-+    heap->prots--;
-+
- done:
-     FUNC_LEAVE_NOAPI(ret_value)
- } /* end H5HL_unprotect() */
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
deleted file mode 100644
index acf3817ea1..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From e7e85949865b771b2b0b73ac1edaf54ce14cd894 Mon Sep 17 00:00:00 2001
-From: Matt L <124107509+mattjala@users.noreply.github.com>
-Date: Wed, 7 Oct 2026 11:03:55 -0500
-Subject: [PATCH] Fix CVEs related to vlen binary output and malformed fill
- values in h5dump (#6507)
-
-* Fix h5dump SIGSEGVs on vlen binary output and malformed fill value
-
-Fixes two crafted-file crashes in h5dump (GitHub issues #6486 and #6487).
-A third report (#6488) is the Fletcher32 checksum-length underflow already
-fixed for h5ls in PR #6497, so it is not addressed again here.
-
-Issue #6486 (tools) - render_bin_output() SIGSEGV with "-b" on a
-variable-length string dataset. The H5T_STRING branch reused the local
-"size" variable both as the per-element stride and as the string length
-returned by strlen(), so after the first element the stride became that
-string's length and subsequent elements were read from misaligned
-addresses, dereferencing a garbage pointer. This affected any multi-element
-vlen-string dataset, not just crafted files. A separate str_len variable is
-now used for the write length so "size" stays the datatype stride. As this
-is a tools bug, the regression test is a tools test: tools/test/h5dump adds
-the tbinvlstr case (binary dump of a vlen-string dataset, file
-tbinvlstr.h5, generated by h5dumpgentest.c/gent_binvlstr), which crashes on
-develop and passes with the fix.
-
-Issue #6487 (library) - H5Pget_fill_value() SIGSEGV via H5T_path_find().
-A crafted version-1/2 fill value message can have "fill defined" set with a
-negative size field; H5O_fill_old_decode() leaves fill.size negative and
-fill.buf/type NULL instead of normalizing to the "undefined" sentinel.
-That value is neither 0 nor -1, so H5P_get_fill_value() fell through to
-H5T_path_find() with a NULL source type and crashed. H5P_get_fill_value()
-now rejects a NULL fill datatype and returns an error, keeping the dataset
-itself readable. h5dump's XML fill-value renderer (xml_dump_fill_value) is
-also hardened: it checks the buffer allocation and the H5Pget_fill_value()
-return value and emits an empty fill value element instead of dereferencing
-an unallocated or unretrievable buffer.
-
-Regression test (library): test/fillval.c test_bad_fill_value() reads a
-crafted file (generated by test/gen_bad_fill.c, committed as
-test/testfiles/bad_fill_value.h5) and verifies that the dataset data is
-still readable while H5Pget_fill_value() fails cleanly instead of crashing.
-
-Verified: both PoCs exit cleanly with the fix (SIGSEGV without it); the
-committed fixtures crash the pre-fix library/tools and pass post-fix; the
-fillval suite, the new tbinvlstr h5dump test, and the non-XML h5dump suite
-pass.
-
-Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
-
-* Update CHANGELOG to list CVEs/GH issues
-
-* Renumber tbinvlstr.h5 generator macro to FILE114
-
----------
-
-Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
-Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
-
-CVE: CVE-2026-19023 CVE-2026-19024
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/cfcd7fe7421cc94e0527d043f2d1b271986e7b09]
-
-Dropped changes to the test and CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Pdcpl.c                 |  7 +++++++
- tools/lib/h5tools.c           |  9 ++++++---
- tools/src/h5dump/h5dump_xml.c | 33 ++++++++++++++++++++++++++++-----
- 3 files changed, 41 insertions(+), 8 deletions(-)
-
-diff --git a/src/H5Pdcpl.c b/src/H5Pdcpl.c
-index 2317c317f73..a1a33d52c7b 100644
---- a/src/H5Pdcpl.c
-+++ b/src/H5Pdcpl.c
-@@ -3207,6 +3207,13 @@ H5P_get_fill_value(H5P_genplist_t *plist, const H5T_t *type, void *value /*out*/
-         HGOTO_DONE(SUCCEED);
-     } /* end if */
- 
-+    /*
-+     * A fill value with a nonzero size must have an associated datatype in
-+     * order to be converted to the destination type.
-+     */
-+    if (NULL == fill.type)
-+        HGOTO_ERROR(H5E_PLIST, H5E_CANTGET, FAIL, "fill value has no datatype");
-+
-     /*
-      * Can we convert between the source and destination datatypes?
-      */
-diff --git a/tools/lib/h5tools.c b/tools/lib/h5tools.c
-index b1a2aa0de4c..3e028504f7c 100644
---- a/tools/lib/h5tools.c
-+++ b/tools/lib/h5tools.c
-@@ -1825,24 +1825,27 @@ render_bin_output(FILE *stream, hid_t container, hid_t tid, void *_mem, hsize_t
-             H5T_str_t     pad;
-             char         *s = NULL;
-             unsigned char tempuchar;
-+            size_t        str_len; /* # of bytes to write for this element */
- 
-             H5TOOLS_DEBUG("H5T_STRING");
-             pad = H5Tget_strpad(tid);
- 
-             for (block_index = 0; block_index < block_nelmts; block_index++) {
-+                /* Advance by the datatype size */
-                 mem = ((unsigned char *)_mem) + block_index * size;
- 
-                 if (H5Tis_variable_str(tid)) {
-                     s = *(char **)((void *)mem);
-                     if (s != NULL)
--                        size = strlen(s);
-+                        str_len = strlen(s);
-                     else
-                         H5TOOLS_THROW((-1), "NULL string");
-                 }
-                 else {
--                    s = (char *)mem;
-+                    s       = (char *)mem;
-+                    str_len = size;
-                 }
--                for (i = 0; i < size && (s[i] || pad != H5T_STR_NULLTERM); i++) {
-+                for (i = 0; i < str_len && (s[i] || pad != H5T_STR_NULLTERM); i++) {
-                     memcpy(&tempuchar, &s[i], sizeof(unsigned char));
-                     if (1 != fwrite(&tempuchar, sizeof(unsigned char), 1, stream))
-                         H5TOOLS_THROW((-1), "fwrite failed");
-diff --git a/tools/src/h5dump/h5dump_xml.c b/tools/src/h5dump/h5dump_xml.c
-index f1a34870f4a..6f3e00a27df 100644
---- a/tools/src/h5dump/h5dump_xml.c
-+++ b/tools/src/h5dump/h5dump_xml.c
-@@ -3534,8 +3534,9 @@ xml_dump_fill_value(hid_t dcpl, hid_t type)
-     hid_t             n_type = H5I_INVALID_HID;
-     void             *buf;
-     char             *name;
--    h5tools_str_t     buffer; /* string into which to render   */
--    h5tools_context_t ctx;    /* print context  */
-+    herr_t            fill_ret = FAIL; /* status of retrieving the fill value */
-+    h5tools_str_t     buffer;          /* string into which to render   */
-+    h5tools_context_t ctx;             /* print context  */
-     h5tool_format_t  *outputformat = &xml_dataformat;
-     h5tool_format_t   string_dataformat;
-     hsize_t           curr_pos = 0; /* total data element position   */
-@@ -3593,11 +3594,33 @@ xml_dump_fill_value(hid_t dcpl, hid_t type)
-         n_type = type;
- 
-     space = H5Tget_size(n_type);
--    buf   = malloc((size_t)space);
-+    /* Zero-initialize so a partially-filled buffer never contains
-+     * uninitialized memory for the rendering code below. */
-+    buf = calloc((size_t)space, 1);
-+
-+    /* Retrieve the fill value.  This can fail on a corrupted or crafted file
-+     * whose fill value has no datatype. Any errors are suppressed and handled
-+     * later. */
-+    if (buf != NULL) {
-+        H5E_BEGIN_TRY
-+        {
-+            fill_ret = H5Pget_fill_value(dcpl, n_type, buf);
-+        }
-+        H5E_END_TRY
-+    }
- 
--    H5Pget_fill_value(dcpl, n_type, buf);
-+    if (buf == NULL || fill_ret < 0) {
-+        /* No usable fill value: emit an empty element rather than
-+         * dereferencing an unallocated or unretrievable buffer. */
-+        ctx.need_prefix = true;
- 
--    if (H5Tget_class(n_type) == H5T_REFERENCE) {
-+        /* Render the element */
-+        h5tools_str_reset(&buffer);
-+        h5tools_str_append(&buffer, "<%sNoData />", xmlnsprefix);
-+        h5tools_render_element(rawoutstream, outputformat, &ctx, &buffer, &curr_pos,
-+                               (size_t)outputformat->line_ncols, (hsize_t)0, (hsize_t)0);
-+    }
-+    else if (H5Tget_class(n_type) == H5T_REFERENCE) {
-         const char *path = lookup_ref_path(*(H5R_ref_t *)buf);
- 
-         ctx.need_prefix = true;
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
deleted file mode 100644
index 075bcf7653..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-19025.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 0cb26cd769d1da3f2ad2c3836dc1732309f935a7 Mon Sep 17 00:00:00 2001
-From: Matt L <124107509+mattjala@users.noreply.github.com>
-Date: Fri, 28 Aug 2026 13:49:02 -0500
-Subject: [PATCH] Fix CVE-2026-19025 (Reject chunked datasets with mismatched
- chunk/dspace rank at open time) (#6508)
-
-* Reject chunked datasets with mismatched chunk/dspace rank
-
-H5D__chunk_construct() validates that the chunk layout dimensionality
-matches the dataspace rank, but that runs only at dataset creation time.
-When an existing dataset is opened, H5D__chunk_init() didn't repeat the
-check, so a file whose stored chunk rank disagreed with its dataspace rank
-was accepted. During chunk I/O the memory-selection rank (from the
-dataspace) and the file-selection rank (chunk ndims - 1) then differ, which
-produces a zero stride that causes a divide-by-zero in
-H5S__hyper_iter_get_seq_list().
-
-H5D__chunk_init() now performs the same dimensionality check on open (the
-stored chunk rank includes the extra element-size dimension, so it must be
-exactly one greater than the dataspace rank) and rejects a mismatch with an
-error.
-
-Added test_chunk_dims_mismatch() as a regression test in test/dsets.c
-
-Fixes #6491
-
-* Fix typo
-
-Co-authored-by: Copilot Autofix powered by AI <175728472+Copilot@users.noreply.github.com>
-
-* Clarify element-vs-byte wording
-
-* Validate chunk/dataspace rank at layout decode time
-
-Move the stored-chunk-rank vs dataspace-rank consistency check out of
-H5D__chunk_init() and into H5O__layout_decode(), so a malformed chunked
-layout is rejected as the message is decoded (mirroring the fill/datatype
-size check in the fill message decode).
-
-* Update release_docs/CHANGELOG.md
-
-Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
-
-* Update CHANGELOG
-
-* Pin format version bounds in bad chunk layout generator
-
----------
-
-Co-authored-by: Copilot Autofix powered by AI <175728472+Copilot@users.noreply.github.com>
-Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
-
-CVE: CVE-2026-19025
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/b7b85e7abf9aa9b1dd9693523defa35217684eb2]
-
-Dropped changes to the test and CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Olayout.c                   |  32 ++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/src/H5Olayout.c b/src/H5Olayout.c
-index d230feb992..5dce35e916 100644
---- a/src/H5Olayout.c
-+++ b/src/H5Olayout.c
-@@ -23,6 +23,7 @@
- #include "H5FLprivate.h" /* Free Lists                               */
- #include "H5MMprivate.h" /* Memory management                        */
- #include "H5Opkg.h"      /* Object headers                           */
-+#include "H5Sprivate.h"  /* Dataspaces                               */
- 
- /* Local macros */
- 
-@@ -561,6 +562,37 @@ H5O__layout_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *open_oh, unsigned H5_ATTR_UNU
-         }
-     }
- 
-+    /* For a chunked layout, the stored dimensionality includes an extra
-+     * element-size dimension, so it must be exactly one greater than the
-+     * dataspace rank.  Validate that here
-+     * to reject malformed files before the inconsistent
-+     * ranks can cause problems during chunk I/O.
-+     */
-+    if (mesg->type == H5D_CHUNKED && open_oh != NULL) {
-+        htri_t space_exists; /* Whether the dataspace message exists */
-+
-+        if ((space_exists = H5O_msg_exists_oh(open_oh, H5O_SDSPACE_ID)) < 0)
-+            HGOTO_ERROR(H5E_OHDR, H5E_CANTGET, NULL, "can't check for dataspace message");
-+        if (space_exists) {
-+            H5S_extent_t *extent; /* Dataspace extent from the sibling message */
-+            int           rank;   /* Dataspace rank */
-+
-+            if (NULL == (extent = (H5S_extent_t *)H5O_msg_read_oh(f, open_oh, H5O_SDSPACE_ID, NULL)))
-+                HGOTO_ERROR(H5E_OHDR, H5E_CANTGET, NULL, "can't read dataspace message");
-+
-+            rank = H5S_extent_get_dims(extent, NULL, NULL);
-+
-+            /* Done with the sibling dataspace message */
-+            H5O_msg_free(H5O_SDSPACE_ID, extent);
-+
-+            if (rank < 0)
-+                HGOTO_ERROR(H5E_OHDR, H5E_CANTGET, NULL, "can't get dataspace rank");
-+            if (mesg->u.chunk.ndims != (unsigned)rank + 1)
-+                HGOTO_ERROR(H5E_OHDR, H5E_BADVALUE, NULL,
-+                            "dimensionality of chunks doesn't match the dataspace");
-+        }
-+    }
-+
-     /* Set return value */
-     ret_value = mesg;
- 
\ No newline at end of file
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch
deleted file mode 100644
index 8187612342..0000000000
--- a/meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch
+++ /dev/null
@@ -1,579 +0,0 @@
-From 8623863e172662af94d30842e1f735219b682852 Mon Sep 17 00:00:00 2001
-From: Matt L <124107509+mattjala@users.noreply.github.com>
-Date: Fri, 25 Sep 2026 17:15:06 -0500
-Subject: [PATCH] Fix CVE issues related to Nbit/Fletcher32 decode paths
- (#6497)
-
-* Fix h5ls SIGSEGVs in Nbit and Fletcher32 filter decode paths
-
-This PR fixes three related issues which could cause crashes when
-crafted files were provided to h5ls. As it happens, all three are reachable from
-any reader via H5Z_pipeline() during a chunked H5Dread(), so the root issues
-affect the library itself.
-
-1. Nbit NULL/short parameter array (#6489, "Null_Pointer")
-
-   H5Z__filter_nbit() dereferenced cd_values[0] before validating the
-   parameter array. A file storing the filter with zero client-data
-   values produced cd_values=NULL / cd_nelmts=0 and a NULL dereference.
-
-   Fix is to reject a NULL cd_values or a cd_nelmts < 5 (the header at indices
-   0..4 is always read) before any access.
-
-2. Nbit compressed-input buffer over-read (#6489, "Heap_Corruption_1")
-
-   The H5Z__nbit_decompress* family walked the compressed input via
-   index *j with no bound against the input size, and nbytes was never
-   even passed in. Malformed parameters (e.g. d_nelmts=67108876 over a
-   31-byte chunk) drove *j past the end, reading out of bounds in
-   H5Z__nbit_decompress_one_byte().
-
-   Fix is thread the input size through the whole decompress call chain,
-   convert the void helpers (_one_byte, _one_nooptype, _one_atomic)
-   to return herr_t, and bounds-check *j against buffer_size before every
-   buffer[*j] read, propagating a filter error up the stack.
-
-3. Fletcher32 checksum length underflow (#6490, "Heap_Corruption_2")
-
-   The read path computed `src_nbytes = nbytes - FLETCHER_LEN` with no
-   lower-bound check. A corrupt 0-byte chunk underflowed src_nbytes to
-   SIZE_MAX-3, which was passed straight to H5_checksum_fletcher32(),
-   causing an out-of-bounds read.
-
-   Fix is to reject nbytes<FLETCHER_LEN up
-   front, since a valid Fletcher32 buffer must contain at least the
-   trailing 4-byte checksum.
-
-All three now fail gracefully with an error instead of crashing.
-
-Fixes #6489
-Fixes #6490
-
-* Add regression tests for Nbit/Fletcher32 filter decode crashes
-
-Added regression tests for the core library to guard against
-the patched issues.
-
-These files were produced with the new generator test/gen_bad_filters.c,
-which writes each dataset via the public API (using earliest library
-version bounds so the pipeline message lands in a version-1,
-un-checksummed object header) and then patches the specific bytes.
-
-* Committing clang-format changes
-
-* Address PR #6497 review: nbit size guard, comment, CHANGELOG
-
-* Bound the nbit filter's walk through its own parameters
-
-H5Z__nbit_decompress() and the array and compound helpers previously read the
-parameter list at offsets taken from the datatype description held in
-that same list, advancing a running index as they recursed, and never
-compared the index against the number of parameters they were given.  A
-list that stopped short of the datatype it described left the walk
-reading past the end of it.  H5O__pline_decode() allocates the list at
-exactly the stored count once it exceeds H5Z_COMMON_CD_VALUES, so past
-the end is past the allocation.
-
-This commit threads the parameter count through decompression and checks it before
-each step of the walk.  The check has to sit at each step rather than
-being measured once up front, because how far the walk runs is itself
-read out of the parameters.
-
-Only the read path is bounded.  The write path walks the same
-parameters, but they are built by H5Z__set_local_nbit() rather than read
-from a file.
-
-* Update CHANGELOG
-
-* Correct bad CHANGELOG merge
-
----------
-
-Co-authored-by: github-actions <41898282+github-actions[bot]@users.noreply.github.com>
-Co-authored-by: H. Joe Lee <hyoklee@hdfgroup.org>
-
-CVE: CVE-2026-19026 CVE-2026-19027 CVE-2026-19028
-Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/a3cf1ea82cc7a66e50029a688121e1b105a7ce88]
-
-Dropped changes to the test and CHANGELOG file.
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/H5Zfletcher32.c |   8 ++
- src/H5Znbit.c       | 211 +++++++++++++++++++++++++++++++++-----------
- 2 files changed, 166 insertions(+), 53 deletions(-)
-
-diff --git a/src/H5Zfletcher32.c b/src/H5Zfletcher32.c
-index c3ec5f7ccb0..b89724ad0a3 100644
---- a/src/H5Zfletcher32.c
-+++ b/src/H5Zfletcher32.c
-@@ -62,6 +62,14 @@ H5Z__filter_fletcher32(unsigned flags, size_t H5_ATTR_UNUSED cd_nelmts,
-     assert(sizeof(uint32_t) >= 4);
- 
-     if (flags & H5Z_FLAG_REVERSE) { /* Read */
-+        /* A Fletcher32-filtered buffer must contain at least the trailing
-+         * checksum.  Reject anything smaller to avoid a size_t underflow
-+         * when computing the data length.
-+         */
-+        if (nbytes < FLETCHER_LEN)
-+            HGOTO_ERROR(H5E_STORAGE, H5E_OVERFLOW, 0,
-+                        "fletcher32 filter input buffer too small to contain checksum");
-+
-         /* Do checksum if it's enabled for read; otherwise skip it
-          * to save performance. */
-         if (!(flags & H5Z_FLAG_SKIP_EDC)) {
-diff --git a/src/H5Znbit.c b/src/H5Znbit.c
-index fed86a1a3bd..ce8c726370a 100644
---- a/src/H5Znbit.c
-+++ b/src/H5Znbit.c
-@@ -51,26 +51,29 @@ static herr_t H5Z__set_parms_compound(const H5T_t *type, unsigned *cd_values_ind
-                                       bool *need_not_compress);
- 
- static void   H5Z__nbit_next_byte(size_t *j, size_t *buf_len);
--static void   H5Z__nbit_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k,
-+static herr_t H5Z__nbit_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k,
-                                             unsigned begin_i, unsigned end_i, const unsigned char *buffer,
--                                            size_t *j, size_t *buf_len, const parms_atomic *p,
--                                            size_t datatype_len);
-+                                            size_t buffer_size, size_t *j, size_t *buf_len,
-+                                            const parms_atomic *p, size_t datatype_len);
- static void   H5Z__nbit_compress_one_byte(const unsigned char *data, size_t data_offset, unsigned k,
-                                           unsigned begin_i, unsigned end_i, unsigned char *buffer, size_t *j,
-                                           size_t *buf_len, const parms_atomic *p, size_t datatype_len);
--static void   H5Z__nbit_decompress_one_nooptype(unsigned char *data, size_t data_offset,
--                                                const unsigned char *buffer, size_t *j, size_t *buf_len,
--                                                unsigned size);
--static void   H5Z__nbit_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer,
--                                              size_t *j, size_t *buf_len, const parms_atomic *p);
-+static herr_t H5Z__nbit_decompress_one_nooptype(unsigned char *data, size_t data_offset,
-+                                                const unsigned char *buffer, size_t buffer_size, size_t *j,
-+                                                size_t *buf_len, unsigned size);
-+static herr_t H5Z__nbit_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer,
-+                                              size_t buffer_size, size_t *j, size_t *buf_len,
-+                                              const parms_atomic *p);
- static herr_t H5Z__nbit_decompress_one_array(unsigned char *data, size_t data_offset, unsigned char *buffer,
--                                             size_t *j, size_t *buf_len, const unsigned parms[],
-+                                             size_t buffer_size, size_t *j, size_t *buf_len,
-+                                             const unsigned parms[], size_t parms_nelmts,
-                                              unsigned *parms_index);
- static herr_t H5Z__nbit_decompress_one_compound(unsigned char *data, size_t data_offset,
--                                                unsigned char *buffer, size_t *j, size_t *buf_len,
--                                                const unsigned parms[], unsigned *parms_index);
-+                                                unsigned char *buffer, size_t buffer_size, size_t *j,
-+                                                size_t *buf_len, const unsigned parms[], size_t parms_nelmts,
-+                                                unsigned *parms_index);
- static herr_t H5Z__nbit_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer,
--                                   const unsigned parms[]);
-+                                   size_t buffer_size, const unsigned parms[], size_t parms_nelmts);
- static void   H5Z__nbit_compress_one_nooptype(const unsigned char *data, size_t data_offset,
-                                               unsigned char *buffer, size_t *j, size_t *buf_len, unsigned size);
- static void   H5Z__nbit_compress_one_array(unsigned char *data, size_t data_offset, unsigned char *buffer,
-@@ -100,8 +103,15 @@ H5Z_class2_t H5Z_NBIT[1] = {{
- #define H5Z_NBIT_COMPOUND   3    /* Compound datatype class */
- #define H5Z_NBIT_NOOPTYPE   4    /* Other datatype class: nbit does no compression */
- #define H5Z_NBIT_MAX_NPARMS 4096 /* Max number of parameters for filter */
--#define H5Z_NBIT_ORDER_LE   0    /* Little endian for datatype byte order */
--#define H5Z_NBIT_ORDER_BE   1    /* Big endian for datatype byte order */
-+
-+/* Whether the parameter list holds N more values starting at IDX.  The
-+ * datatype description that drives the walk through the parameters is held in
-+ * those same parameters, so a list that stops short of the datatype it
-+ * describes has to be caught at each step rather than measured up front.
-+ */
-+#define H5Z_NBIT_PARMS_AVAIL(idx, n, nelmts) (((nelmts) >= (n)) && ((size_t)(idx) <= (nelmts) - (n)))
-+#define H5Z_NBIT_ORDER_LE                    0 /* Little endian for datatype byte order */
-+#define H5Z_NBIT_ORDER_BE                    1 /* Big endian for datatype byte order */
- 
- /* Local variables */
- 
-@@ -931,7 +941,16 @@ H5Z__filter_nbit(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
- 
-     /* check arguments
-      * cd_values[0] stores actual number of parameters in cd_values[]
-+     *
-+     * The filter header always occupies cd_values[0..4] (number of
-+     * parameters, no-compression flag, number of elements, datatype class
-+     * and datatype size), all of which are read unconditionally below.
-+     * Reject a NULL array or one shorter than that to avoid a bad
-+     * dereference.
-      */
-+    if (cd_values == NULL || cd_nelmts < 5)
-+        HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "invalid nbit parameters");
-+
-     if (cd_nelmts != cd_values[0])
-         HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "invalid nbit aggression level");
- 
-@@ -944,6 +963,18 @@ H5Z__filter_nbit(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
-     /* copy a filter parameter to d_nelmts */
-     d_nelmts = cd_values[2];
- 
-+    /* cd_values[4] stores the datatype size, which is used together with
-+     * d_nelmts to size the (de)compression buffer.  A zero size is invalid,
-+     * and a d_nelmts * size product that overflows size_t would produce an
-+     * undersized allocation and out-of-bounds accesses (this matters on
-+     * platforms with a 32-bit size_t).  Reject both, as they can only arise
-+     * from a corrupted or crafted file.
-+     */
-+    if (cd_values[4] == 0)
-+        HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "invalid nbit datatype size");
-+    if (d_nelmts != 0 && (size_t)cd_values[4] > SIZE_MAX / d_nelmts)
-+        HGOTO_ERROR(H5E_ARGS, H5E_OVERFLOW, 0, "nbit (de)compression buffer size overflow");
-+
-     /* input; decompress */
-     if (flags & H5Z_FLAG_REVERSE) {
-         size_out = d_nelmts * (size_t)cd_values[4]; /* cd_values[4] stores datatype size */
-@@ -953,7 +984,7 @@ H5Z__filter_nbit(unsigned flags, size_t cd_nelmts, const unsigned cd_values[], s
-             HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, 0, "memory allocation failed for nbit decompression");
- 
-         /* decompress the buffer */
--        if (H5Z__nbit_decompress(outbuf, d_nelmts, (unsigned char *)*buf, cd_values) < 0) {
-+        if (H5Z__nbit_decompress(outbuf, d_nelmts, (unsigned char *)*buf, nbytes, cd_values, cd_nelmts) < 0) {
-             H5MM_xfree(outbuf);
-             HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, 0, "can't decompress buffer");
-         }
-@@ -999,15 +1030,19 @@ H5Z__nbit_next_byte(size_t *j, size_t *buf_len)
-     *buf_len = 8 * sizeof(unsigned char);
- }
- 
--static void
-+static herr_t
- H5Z__nbit_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k, unsigned begin_i,
--                              unsigned end_i, const unsigned char *buffer, size_t *j, size_t *buf_len,
--                              const parms_atomic *p, size_t datatype_len)
-+                              unsigned end_i, const unsigned char *buffer, size_t buffer_size, size_t *j,
-+                              size_t *buf_len, const parms_atomic *p, size_t datatype_len)
- {
-     size_t        dat_len; /* dat_len is the number of bits to be copied in each data byte */
-     size_t        dat_offset;
-     unsigned char val; /* value to be copied in each data byte */
- 
-+    /* Ensure the byte to be read is within the bounds of the compressed buffer */
-+    if (*j >= buffer_size)
-+        return FAIL;
-+
-     /* initialize value and bits of unsigned char to be copied */
-     val        = buffer[*j];
-     dat_offset = 0;
-@@ -1039,25 +1074,33 @@ H5Z__nbit_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned
-         dat_len -= *buf_len;
-         H5Z__nbit_next_byte(j, buf_len);
-         if (dat_len == 0)
--            return;
-+            return SUCCEED;
- 
-+        if (*j >= buffer_size)
-+            return FAIL;
-         val = buffer[*j];
-         data[data_offset + k] |= (unsigned char)(((unsigned)(val >> (*buf_len - dat_len)) &
-                                                   (unsigned)(~((unsigned)(~0) << dat_len)))
-                                                  << dat_offset);
-         *buf_len -= dat_len;
-     }
-+
-+    return SUCCEED;
- }
- 
--static void
-+static herr_t
- H5Z__nbit_decompress_one_nooptype(unsigned char *data, size_t data_offset, const unsigned char *buffer,
--                                  size_t *j, size_t *buf_len, unsigned size)
-+                                  size_t buffer_size, size_t *j, size_t *buf_len, unsigned size)
- {
-     unsigned      i;       /* index */
-     size_t        dat_len; /* dat_len is the number of bits to be copied in each data byte */
-     unsigned char val;     /* value to be copied in each data byte */
- 
-     for (i = 0; i < size; i++) {
-+        /* Ensure the byte to be read is within the bounds of the compressed buffer */
-+        if (*j >= buffer_size)
-+            return FAIL;
-+
-         /* initialize value and bits of unsigned char to be copied */
-         val     = buffer[*j];
-         dat_len = sizeof(unsigned char) * 8;
-@@ -1069,16 +1112,20 @@ H5Z__nbit_decompress_one_nooptype(unsigned char *data, size_t data_offset, const
-         if (dat_len == 0)
-             continue;
- 
-+        if (*j >= buffer_size)
-+            return FAIL;
-         val = buffer[*j];
-         data[data_offset + i] |= (unsigned char)((unsigned)(val >> (*buf_len - dat_len)) &
-                                                  (unsigned)(~((unsigned)(~0) << dat_len)));
-         *buf_len -= dat_len;
-     }
-+
-+    return SUCCEED;
- }
- 
--static void
--H5Z__nbit_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer, size_t *j,
--                                size_t *buf_len, const parms_atomic *p)
-+static herr_t
-+H5Z__nbit_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer,
-+                                size_t buffer_size, size_t *j, size_t *buf_len, const parms_atomic *p)
- {
-     /* begin_i: the index of byte having first significant bit
-        end_i: the index of byte having last significant bit */
-@@ -1097,8 +1144,9 @@ H5Z__nbit_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigne
-         end_i = p->offset / 8;
- 
-         for (k = (int)begin_i; k >= (int)end_i; k--)
--            H5Z__nbit_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, end_i, buffer, j, buf_len,
--                                          p, datatype_len);
-+            if (H5Z__nbit_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, end_i, buffer,
-+                                              buffer_size, j, buf_len, p, datatype_len) < 0)
-+                return FAIL;
-     }
-     else { /* big endian */
-         /* Sanity check */
-@@ -1112,14 +1160,18 @@ H5Z__nbit_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigne
-             end_i = ((unsigned)datatype_len - p->offset) / 8 - 1;
- 
-         for (k = (int)begin_i; k <= (int)end_i; k++)
--            H5Z__nbit_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, end_i, buffer, j, buf_len,
--                                          p, datatype_len);
-+            if (H5Z__nbit_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, end_i, buffer,
-+                                              buffer_size, j, buf_len, p, datatype_len) < 0)
-+                return FAIL;
-     }
-+
-+    return SUCCEED;
- }
- 
- static herr_t
--H5Z__nbit_decompress_one_array(unsigned char *data, size_t data_offset, unsigned char *buffer, size_t *j,
--                               size_t *buf_len, const unsigned parms[], unsigned *parms_index)
-+H5Z__nbit_decompress_one_array(unsigned char *data, size_t data_offset, unsigned char *buffer,
-+                               size_t buffer_size, size_t *j, size_t *buf_len, const unsigned parms[],
-+                               size_t parms_nelmts, unsigned *parms_index)
- {
-     unsigned     i, total_size, base_class, base_size, n, begin_index;
-     parms_atomic p;
-@@ -1127,11 +1179,19 @@ H5Z__nbit_decompress_one_array(unsigned char *data, size_t data_offset, unsigned
- 
-     FUNC_ENTER_PACKAGE
- 
-+    if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 2, parms_nelmts))
-+        HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                    "parameter list is shorter than the datatype it describes");
-+
-     total_size = parms[(*parms_index)++];
-     base_class = parms[(*parms_index)++];
- 
-     switch (base_class) {
-         case H5Z_NBIT_ATOMIC:
-+            if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 4, parms_nelmts))
-+                HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                            "parameter list is shorter than the datatype it describes");
-+
-             p.size      = parms[(*parms_index)++];
-             p.order     = parms[(*parms_index)++];
-             p.precision = parms[(*parms_index)++];
-@@ -1143,37 +1203,54 @@ H5Z__nbit_decompress_one_array(unsigned char *data, size_t data_offset, unsigned
- 
-             n = total_size / p.size;
-             for (i = 0; i < n; i++)
--                H5Z__nbit_decompress_one_atomic(data, data_offset + i * (size_t)p.size, buffer, j, buf_len,
--                                                &p);
-+                if (H5Z__nbit_decompress_one_atomic(data, data_offset + i * (size_t)p.size, buffer,
-+                                                    buffer_size, j, buf_len, &p) < 0)
-+                    HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress atomic");
-             break;
- 
-         case H5Z_NBIT_ARRAY:
-+            if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 1, parms_nelmts))
-+                HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                            "parameter list is shorter than the datatype it describes");
-+
-             base_size   = parms[*parms_index];    /* read in advance */
-             n           = total_size / base_size; /* number of base_type elements inside the array datatype */
-             begin_index = *parms_index;
-             for (i = 0; i < n; i++) {
--                if (H5Z__nbit_decompress_one_array(data, data_offset + i * (size_t)base_size, buffer, j,
--                                                   buf_len, parms, parms_index) < 0)
-+                if (H5Z__nbit_decompress_one_array(data, data_offset + i * (size_t)base_size, buffer,
-+                                                   buffer_size, j, buf_len, parms, parms_nelmts,
-+                                                   parms_index) < 0)
-                     HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress array");
-                 *parms_index = begin_index;
-             }
-             break;
- 
-         case H5Z_NBIT_COMPOUND:
-+            if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 1, parms_nelmts))
-+                HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                            "parameter list is shorter than the datatype it describes");
-+
-             base_size   = parms[*parms_index];    /* read in advance */
-             n           = total_size / base_size; /* number of base_type elements inside the array datatype */
-             begin_index = *parms_index;
-             for (i = 0; i < n; i++) {
--                if (H5Z__nbit_decompress_one_compound(data, data_offset + i * (size_t)base_size, buffer, j,
--                                                      buf_len, parms, parms_index) < 0)
-+                if (H5Z__nbit_decompress_one_compound(data, data_offset + i * (size_t)base_size, buffer,
-+                                                      buffer_size, j, buf_len, parms, parms_nelmts,
-+                                                      parms_index) < 0)
-                     HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress compound");
-                 *parms_index = begin_index;
-             }
-             break;
- 
-         case H5Z_NBIT_NOOPTYPE:
-+            if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 1, parms_nelmts))
-+                HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                            "parameter list is shorter than the datatype it describes");
-+
-             (*parms_index)++; /* skip size of no-op type */
--            H5Z__nbit_decompress_one_nooptype(data, data_offset, buffer, j, buf_len, total_size);
-+            if (H5Z__nbit_decompress_one_nooptype(data, data_offset, buffer, buffer_size, j, buf_len,
-+                                                  total_size) < 0)
-+                HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress no-op type");
-             break;
- 
-         default:
-@@ -1185,8 +1262,9 @@ done:
- }
- 
- static herr_t
--H5Z__nbit_decompress_one_compound(unsigned char *data, size_t data_offset, unsigned char *buffer, size_t *j,
--                                  size_t *buf_len, const unsigned parms[], unsigned *parms_index)
-+H5Z__nbit_decompress_one_compound(unsigned char *data, size_t data_offset, unsigned char *buffer,
-+                                  size_t buffer_size, size_t *j, size_t *buf_len, const unsigned parms[],
-+                                  size_t parms_nelmts, unsigned *parms_index)
- {
-     unsigned     i, nmembers, member_offset, member_class, member_size, used_size = 0, prev_used_size, size;
-     parms_atomic p;
-@@ -1194,10 +1272,18 @@ H5Z__nbit_decompress_one_compound(unsigned char *data, size_t data_offset, unsig
- 
-     FUNC_ENTER_PACKAGE
- 
-+    if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 2, parms_nelmts))
-+        HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                    "parameter list is shorter than the datatype it describes");
-+
-     size     = parms[(*parms_index)++];
-     nmembers = parms[(*parms_index)++];
- 
-     for (i = 0; i < nmembers; i++) {
-+        if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 3, parms_nelmts))
-+            HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                        "parameter list is shorter than the datatype it describes");
-+
-         member_offset = parms[(*parms_index)++];
-         member_class  = parms[(*parms_index)++];
- 
-@@ -1213,6 +1299,10 @@ H5Z__nbit_decompress_one_compound(unsigned char *data, size_t data_offset, unsig
-             HGOTO_ERROR(H5E_PLINE, H5E_BADRANGE, FAIL, "compound member offset overflowed compound size");
-         switch (member_class) {
-             case H5Z_NBIT_ATOMIC:
-+                if (!H5Z_NBIT_PARMS_AVAIL(*parms_index, 4, parms_nelmts))
-+                    HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                                "parameter list is shorter than the datatype it describes");
-+
-                 p.size = member_size;
-                 /* Advance past member size */
-                 (*parms_index)++;
-@@ -1224,26 +1314,29 @@ H5Z__nbit_decompress_one_compound(unsigned char *data, size_t data_offset, unsig
-                 if (p.precision > p.size * 8 || (p.precision + p.offset) > p.size * 8)
-                     HGOTO_ERROR(H5E_PLINE, H5E_BADTYPE, FAIL, "invalid datatype precision/offset");
- 
--                H5Z__nbit_decompress_one_atomic(data, data_offset + member_offset, buffer, j, buf_len, &p);
-+                if (H5Z__nbit_decompress_one_atomic(data, data_offset + member_offset, buffer, buffer_size, j,
-+                                                    buf_len, &p) < 0)
-+                    HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress atomic");
-                 break;
- 
-             case H5Z_NBIT_ARRAY:
--                if (H5Z__nbit_decompress_one_array(data, data_offset + member_offset, buffer, j, buf_len,
--                                                   parms, parms_index) < 0)
-+                if (H5Z__nbit_decompress_one_array(data, data_offset + member_offset, buffer, buffer_size, j,
-+                                                   buf_len, parms, parms_nelmts, parms_index) < 0)
-                     HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress array");
-                 break;
- 
-             case H5Z_NBIT_COMPOUND:
--                if (H5Z__nbit_decompress_one_compound(data, data_offset + member_offset, buffer, j, buf_len,
--                                                      parms, parms_index) < 0)
-+                if (H5Z__nbit_decompress_one_compound(data, data_offset + member_offset, buffer, buffer_size,
-+                                                      j, buf_len, parms, parms_nelmts, parms_index) < 0)
-                     HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress compound");
-                 break;
- 
-             case H5Z_NBIT_NOOPTYPE:
--                /* Advance past member size */
-+                /* Advance past member size (already checked above) */
-                 (*parms_index)++;
--                H5Z__nbit_decompress_one_nooptype(data, data_offset + member_offset, buffer, j, buf_len,
--                                                  member_size);
-+                if (H5Z__nbit_decompress_one_nooptype(data, data_offset + member_offset, buffer, buffer_size,
-+                                                      j, buf_len, member_size) < 0)
-+                    HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress no-op type");
-                 break;
- 
-             default:
-@@ -1256,7 +1349,8 @@ done:
- }
- 
- static herr_t
--H5Z__nbit_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer, const unsigned parms[])
-+H5Z__nbit_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer, size_t buffer_size,
-+                     const unsigned parms[], size_t parms_nelmts)
- {
-     /* i: index of data, j: index of buffer,
-        buf_len: number of bits to be filled in current byte */
-@@ -1269,6 +1363,11 @@ H5Z__nbit_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buff
- 
-     FUNC_ENTER_PACKAGE
- 
-+    /* The datatype class and its size are read before the walk begins */
-+    if (!H5Z_NBIT_PARMS_AVAIL(0, 5, parms_nelmts))
-+        HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                    "parameter list is shorter than the datatype it describes");
-+
-     /* may not have to initialize to zeros */
-     memset(data, 0, d_nelmts * (size_t)parms[4]);
- 
-@@ -1278,6 +1377,10 @@ H5Z__nbit_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buff
- 
-     switch (parms[3]) {
-         case H5Z_NBIT_ATOMIC:
-+            if (!H5Z_NBIT_PARMS_AVAIL(0, 8, parms_nelmts))
-+                HGOTO_ERROR(H5E_PLINE, H5E_OVERFLOW, FAIL,
-+                            "parameter list is shorter than the datatype it describes");
-+
-             p.size      = parms[4];
-             p.order     = parms[5];
-             p.precision = parms[6];
-@@ -1288,15 +1391,17 @@ H5Z__nbit_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buff
-                 HGOTO_ERROR(H5E_PLINE, H5E_BADTYPE, FAIL, "invalid datatype precision/offset");
- 
-             for (i = 0; i < d_nelmts; i++)
--                H5Z__nbit_decompress_one_atomic(data, i * (size_t)p.size, buffer, &j, &buf_len, &p);
-+                if (H5Z__nbit_decompress_one_atomic(data, i * (size_t)p.size, buffer, buffer_size, &j,
-+                                                    &buf_len, &p) < 0)
-+                    HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress atomic");
-             break;
- 
-         case H5Z_NBIT_ARRAY:
-             size        = parms[4];
-             parms_index = 4; /* set the index before goto function call */
-             for (i = 0; i < d_nelmts; i++) {
--                if (H5Z__nbit_decompress_one_array(data, i * size, buffer, &j, &buf_len, parms,
--                                                   &parms_index) < 0)
-+                if (H5Z__nbit_decompress_one_array(data, i * size, buffer, buffer_size, &j, &buf_len, parms,
-+                                                   parms_nelmts, &parms_index) < 0)
-                     HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress array");
-                 parms_index = 4;
-             }
-@@ -1306,8 +1411,8 @@ H5Z__nbit_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buff
-             size        = parms[4];
-             parms_index = 4; /* set the index before goto function call */
-             for (i = 0; i < d_nelmts; i++) {
--                if (H5Z__nbit_decompress_one_compound(data, i * size, buffer, &j, &buf_len, parms,
--                                                      &parms_index) < 0)
-+                if (H5Z__nbit_decompress_one_compound(data, i * size, buffer, buffer_size, &j, &buf_len,
-+                                                      parms, parms_nelmts, &parms_index) < 0)
-                     HGOTO_ERROR(H5E_PLINE, H5E_CANTFILTER, FAIL, "can't decompress compound");
-                 parms_index = 4;
-             }
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.3.0.bb
similarity index 83%
rename from meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
rename to meta-oe/recipes-support/hdf5/hdf5_2.3.0.bb
index eee039e8c7..6ed91d2c06 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.2.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.3.0.bb
@@ -14,16 +14,8 @@ DEPENDS += "qemu-native zlib"
 SRC_URI = "https://github.com/HDFGroup/hdf5/releases/download/${PV}/${BPN}-${PV}.tar.gz \
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
-           file://CVE-2026-19025.patch \
-           file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
-           file://CVE-2026-19023-CVE-2026-19024.patch \
-           file://CVE-2026-120689.patch \
-           file://CVE-2026-120754-CVE-2026-120755.patch \
-           file://CVE-2026-120756.patch \
-           file://CVE-2026-120757.patch \
-           file://CVE-2026-120758.patch \
            "
-SRC_URI[sha256sum] = "1a1ab8209b35586fbc1aa279ba76d102130b95badcb20ca329587219112d8c16"
+SRC_URI[sha256sum] = "cd462ef0578927ae75f9e010a806b0dd28f19152db2abf6919cb94f9d5b9b8b0"
 
 UPSTREAM_CHECK_URI = "https://github.com/HDFGroup/hdf5/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
