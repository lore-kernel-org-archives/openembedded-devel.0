Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6743.1793913782027256365
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UCLGbyR5;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so68553c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913781; x=1794518581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PA6XKl9SqBXYy9VJi5794gwNgSMxB6x5+2LDcHdpgNQ=;
        b=UCLGbyR5C2O33Nx0DzQDFtPHjQgUail7KaRnpnDzkFc2yEDXl9pJWCHzrlLbn5Khmu
         jwLu2Q2dqPzhKzeG89vG7k7htLhSb3p/H9zyE5S+gMn6yUkQ9jwB8w4DOLeWBE1MMXKi
         zIT6hBDeLwmgchCiEZd9lLI9KmjLQABNP/iNR/qYrqP9c4wgLAhHIOpL8MnDGBNP9gw0
         jdBatVd+BoGM4St6ETRUbLh4f5PzMIeF2i+9iGWu4UFPoiOlW/nEyL5peYaTUJmEis0V
         4EcqMH4FEKUekb0Przwqe39je18QEYJEFjhDPVTftR+YkFNmhXnriRepU+vPQTlXqAPF
         dUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913781; x=1794518581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PA6XKl9SqBXYy9VJi5794gwNgSMxB6x5+2LDcHdpgNQ=;
        b=AX53k9SJcg9gNeXMJC615i5IalF/+e1ofU7GjkKDf82r94miMTKUM5u5PPVIdAqCe9
         nGubmiDx2lesM+M1g9oFQA8FBX6XNx10NAa0BRFsGHqA3ifIHLx9OalT6QeAVuS80T2H
         Tq6zalhPwqkYQuI1LqqDLcgxuLl8q0ip3eL7wKTgNYlBiVmuob04leeu3zAq71xnGy0Q
         IZGCBiKgmcCT4cTdV17Sm6tUdw7vWEw9eNFkzeYIat+0twsiWVIciWkW4PDCkmx1IGPq
         9KFWRNwqB1DJkv+CNqP1hoHoOQPbXS4VQ2+bojJkoXrX3Fw1fsQDqrSTe34ZydvwcVIF
         wD8Q==
X-Gm-Message-State: APuU4Z8CbY/HY6Rt8QGjd1mr5QN3P2DDhN7LuS3LpjwvpA6CcmDOY6x2
	Ae2g2UPwLb4r2yI92MS7jXRzco/fEbywgmCdAK86tJbHudYz5fwHzmP2t71Lrw==
X-Gm-Gg: AYBFou3ut5hx0ZIpRsKFIqDrVLts5nfFx8E7mSkVsuvncZL1se+e803ENeBISWAB/Y3
	x3IUIDMcr7h+L1Is+byBaT3OtZnbKMVGZN3NIbKJ8e2LfLjuh5FcMRu0Pn2B5CtT8QeC0Yn7jYb
	EBed/qbyihR1SF/3mfD2upJNF0of4AuGMzW32TeV6diPMjY4RkUnSrCa6Dq7A+1U6DpWFGEVA0l
	HMfucz6iYwH0NybpeXoLQjiz6I+R4DrT0KLqavMoE0/3xhK/FJ33vsLAf9AlOnhjtVHLfRzvBmC
	JugkRO9mRYqfifxW4OmnjIl4rOuuXAmPWZ4/x5w0OEU4XAp2KhZsNW6WRrK56iAd/Yhhd8lo/lD
	UhXfhO46qX2oGwPY8vU8nX4veNyNi1IcNsAEONE/RXTUyO6UCm7EjPW+TBExkSOepbpIsHL8N30
	1Hfo9w7aqDR1fbQY00oLe6hEf7RJvGofC5d9LJVDb6IjrXq48nHOtyZN5SkQjkiiGxHmYXykDJQ
	fb807GPrl+m4MrLEMBRBOd+egVHSrVpsmd/8xtN9Pn9XVHtIRrSkoYtRNxVCuR500SbQSZoV+/r
	a/3ccabHmnmWmIufpbvOUi9tmQhcSHk39ev2FUpNimhaE58G/hWrRrPvlSja4A==
X-Received: by 2002:a05:701b:2050:20b0:166:5552:780a with SMTP id a92af1059eb24-1b25d31e5a2mr315437c88.8.1793913781066;
        Thu, 05 Nov 2026 13:23:01 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/14] hdf5: patch CVE-2026-120689
Date: Fri,  6 Nov 2026 10:22:39 +1300
Message-ID: <20261105212250.490188-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131940
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120689

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-120689.patch          | 60 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
new file mode 100644
index 0000000000..dd9e9374ac
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
@@ -0,0 +1,60 @@
+From 0472315404dc03d0e89eec4513eb80930f9b176e Mon Sep 17 00:00:00 2001
+From: PGZXB <420254146@qq.com>
+Date: Fri, 9 Oct 2026 02:52:55 +0800
+Subject: [PATCH] Fix StackOverflow when calling `H5Gget_info` (#6685)
+
+Verify B-tree node level when an expected level value is provided
+
+(cherry picked from commit 5933130b610c7bd6e66fe93c2798b97e3f3188c8)
+
+CVE: CVE-2026-120689
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/5933130b610c7bd6e66fe93c2798b97e3f3188c8]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ release_docs/CHANGELOG.md |  6 ++++++
+ src/H5B.c                 | 14 ++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/release_docs/CHANGELOG.md b/release_docs/CHANGELOG.md
+index c181f174bbb..b5c99cd4b16 100644
+--- a/release_docs/CHANGELOG.md
++++ b/release_docs/CHANGELOG.md
+@@ -778,6 +778,12 @@ Added Fortran wrapper `h5fdsubfiling_get_file_mapping_f()` for the subfiling fil
+ 
+    A malformed HDF5 file could have an attribute with a recorded name length of zero.This would lead to an overflow and an invalid memory access. An integrity check has been added to detect this case and safely stop file decoding.
+ 
++### Fixed a stack overflow when iterating a corrupted B-tree
++
++   `H5B__iterate_helper()` now verifies that a B-tree node it has just protected has the level the traversal expects, when the expected level is known. The equivalent check in `H5B__cache_deserialize()` only runs when a node is first loaded into the metadata cache, so a corrupted B-tree whose child pointer revisits a node that is already cached (for example, a node that points to itself) could bypass that check and recurse without bound until the stack was exhausted. Such a file is now rejected with an error instead of crashing. This was observed through `H5Gget_info()`.
++
++   Fixes GitHub issue #6403
++
+ ## Java Library
+ 
+ ### Renamed the Callbacks.java file to H5Callbacks.java
+diff --git a/src/H5B.c b/src/H5B.c
+index c9571708b73..4c6b1a55480 100644
+--- a/src/H5B.c
++++ b/src/H5B.c
+@@ -1140,6 +1140,20 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_lev
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5_ITER_ERROR, "unable to load B-tree node");
+ 
++    /* Check for a corrupted B-tree node.  If the caller has told us what
++     * level to expect, verify that the node we just protected actually has
++     * that level.  This check must be performed here rather than relying
++     * solely on the equivalent check in H5B__cache_deserialize, because
++     * that deserialize callback only runs when a node is first loaded into
++     * the metadata cache.  A corrupted B-tree whose child pointer revisits
++     * a node that is already cached (e.g. a node that points to itself)
++     * bypasses the deserialize callback entirely, so without this check the
++     * recursion below would never terminate and would overflow the stack.
++     */
++    if (exp_level != H5B_UNKNOWN_NODELEVEL && bt->level != (unsigned)exp_level)
++        HGOTO_ERROR(H5E_BTREE, H5E_BADVALUE, H5_ITER_ERROR,
++                    "B-tree node level is not as expected, possibly corrupted");
++
+     /* Iterate over node's children */
+     for (u = 0; u < bt->nchildren && ret_value == H5_ITER_CONT; u++) {
+         if (bt->level > 0)
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 31a56bce3c..ea2ce9747c 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-19025.patch \
            file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
            file://CVE-2026-19023-CVE-2026-19024.patch \
+           file://CVE-2026-120689.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
