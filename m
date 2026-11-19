Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1872.1795113416038851507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NKktMCoW;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05b210703so84200b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113415; x=1795718215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKo2PqI0oKWBjpF4hAGroR7qnkIp+g5s7sUH7KzS4ZE=;
        b=NKktMCoWqKJCHAkWISjlxNUkEuMhdxbuj5c93BdyrVFEi5vDEMxUdlX8OHFcUw4mle
         QpksjIQB5DazOYO7D1gzTuUDeLgO9sTHVDV2RTPUz9tvnX859uaUf+91PATpSGy6KYF0
         TeFM8CrFV+XFkb9cnVwa1PhfFAtEUjp27Pq5Wc4TeBlMgjGS/FPShDr1hodWBsQ0z3xS
         9VreHTwW6yo/zAItqvWEVP8hPowJSESg09Tv9kaYnpbrpuRWaCx50W5wSDFkOemBsGRo
         ntgfhP3nk76+/hnUuu/fLm0UFcW/1mPJERyYjCsx4/A2XgSI+xtyhZqr0aWUJmI2KS/Q
         H1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113415; x=1795718215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKo2PqI0oKWBjpF4hAGroR7qnkIp+g5s7sUH7KzS4ZE=;
        b=steWfBL6cpVcPF082wuDL3E3/C1OCO8VjAXtCy87REiKp0YTEqSNGY2c28XM6NVmH8
         iWVvoCdGlwVCSdOpTSAEc4idxfzx1WBDSIn0r45mIlD8u8bFRfIwqauCQTyU7zPTtXRT
         yDXGtaw1UvjAjWB/P10yH3g/yTunYUWMUisPkOFpYxSHki3l6RRacN/AUQvN2P3uwOcq
         Wlv1YrCRG2aqOQWtPssz7oK8FMeDNvLFgynSV2uUGRdrHx0IIvepbDQLeODwxSfB7jv8
         dr3ScQVU7h50ul/p8AcIyWwnEH8mBcXOKWlU895ZsQML6Eb59jZk4MuoMVn7v8OlQZxV
         Nfsg==
X-Gm-Message-State: APuU4Z+FejJKIvY1KlCWd9SCr21oc2ybhbW/B1sRGavBhHi672LIcXAE
	CfgOvAfvDFotWXdXoKXyBwq17aLUiE4WJxWhFnjRWQyiIhREAM3yl86/qBa2QA==
X-Gm-Gg: AYBFou2+F8Q4o7l2SIP2p82+BBnB8o2ZE/AJDJ9+IM6T5LS/9Ft6KE3bTonlvpnhXXk
	54aI/eL2AI/52xl3Zu4kIAtiuB9lT+vIB5j+OROvVSzrTYWH/VjbKGi0CoUn5OIt1Ofpm041l2A
	/4mBfA4cvPb3AUyB8Y1BP42qmJlkYMC7PkGUXBafGyxPTRknZtUe/M5QeafyMx39+3S4JT2+Ywh
	BEYzXh1WefpqvaoFq2dlgD3xVVAYSY1OS+iz/OHR5xpWIdGDiU/gc90ZedVQzXHG10sgzkiiv2R
	PskEANkjMVEUcQ/Qq18hHmNyuji1mpIe5Jc6dGF4jOPMBx6WJhdJS475Iz6iNOVpo5wMjObvGQ5
	1lnLRDDpjqlbCF8ncwBGgaXfW3C7sZ/tw+6tURA/GEPVZn3Ld1pWcfGhvgl3nrx3F3Qx1YeRluH
	fWN8gXf0ayTsZVCBXO2vP6NL3idu04YFz2yGnIpdfFOFkgKA50QmZzXzOqldkVi0BFVuqztfS2h
	hbimNhWxilTtF9m7L5lf3KUVnGy1zVqASYML80GOngy9pCIzzUErAUuigdB9BbzAT+wWSdk/IwX
	CxZXZIUgbt0kLfqJuV2Ll6qkmlrrLzPgo/HKtRIDkBb0wDxREaMNtzjcTrI8bg==
X-Received: by 2002:a05:6a00:1388:b0:89f:7ac5:9d54 with SMTP id d2e1a72fcca58-8c87b9cf650mr507463b3a.17.1795113415322;
        Thu, 19 Nov 2026 10:36:55 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 23/64] hdf5: patch CVE-2026-120689
Date: Fri, 20 Nov 2026 07:32:51 +1300
Message-ID: <049b93d6ee8aeba8dae887339aa0d9741496b0d0.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132713
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
index 9d300b210a..57a62ff9d0 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-19025.patch \
            file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
            file://CVE-2026-19023-CVE-2026-19024.patch \
+           file://CVE-2026-120689.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
