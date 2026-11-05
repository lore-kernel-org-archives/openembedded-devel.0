Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5192.1793909163948705966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kQW37bJK;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so3844139c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 12:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909163; x=1794513963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXbGcajQXmz39fGjtvzWrGNUZE7Num+wRUH1I+JpF6M=;
        b=kQW37bJKKgefHObuW3EMGv6lJqRT+cTFl/U7tLXSZ741f508X/d2g+bpgkESCBQT5y
         HUGRGT3t1JVGNwzCsv5lj10DCyEjkCLlxNsBHe3+VaMzjNHuzVpN5lLB9nBnHDpKVp2X
         5eSmLt3V4ziCeNrzDgnMOl+wTOy1hAg+SzQ1ojTKgJCN6Sg8f5VFLYFeo7By0NOzKaZv
         b7Om08i2iabP+Q63VVEWsVR3FOieZhZtwvHNwTkuEwPj/sSsznQoS+s6nQ/JC50l5wlm
         c2mXoD9iYEhQ0rxLTqkMGQyWsdidgsivK4Ep4bVqDDHAaEJI9OKtDgXvjTQuncl4DMSw
         3jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909163; x=1794513963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aXbGcajQXmz39fGjtvzWrGNUZE7Num+wRUH1I+JpF6M=;
        b=yZOI0PIMmOPcY44LyezddxIv8q4uxnNFuNAMusu3n+NZ6Qqedw46L5aJmw+Wyj0prv
         BJ+yandYZPJeJiVHyEHTUO2M32o6sluSDNbRBa0fRbieBdLXOMGCqLhg9Y/7T9ve0gZf
         UsUqsoXjAGR9nWRpljrfkXspYoQFu8wbeJaWq+oVtvqncrev0uGzVQnSkbla1//63nno
         9iBYTSuPp408xuqk1uTKTm1oPINKsktVuVu2NTogFxgiS9UY9n/OZBhR2Zqosy0agdYg
         ECJEi81994WcgMFmZNBlJuOqxy4K98aR3mugCs9Ouwrgs4WBoByKRzgOz7gjGRfJXOi5
         9tdw==
X-Gm-Message-State: APuU4Z+GYgnEwvO9Ti1u2nPGebON5Y34gMzd1TXtMdvfpjdd0UYO8nSd
	1cm7yJBJUFVzsMW1+RhQLBTlin5v6x4gVG2+RF3jSpG+5QlL0vq/mo/WeUc1GQ==
X-Gm-Gg: AYBFou2e6y3JaTF84+5sBSgIhCK65Sfr4uRw9uU0iBRTc8n1YsYkq+o0AGfGlkv2vbV
	MwsiK/YP38bfbW0jEJkzuG3EDM0fg4P5GMRnw+K1bDumQKj9LkUHHXG17iB0W0ygL3JoUAcf8GM
	lb6wiHn0Vf62P0G7mb+u90+v8ZTk+F0ggHvffNICkDEAlQxqJgl46ic254h0eX2swOPXvEtVvmh
	e5hQgiICJjkj5Q2BHAQ2BooigPEiOtaGRA09EXmxyKFyehswRR+2FP2Hs3R+D8da6K0eWib4Wcl
	bYH9tAN8kMIieOqVeIHu4plTv8JIg+8BJxU0nijt+2XDmAG0S0LXpp/sQMHebKgycddiOk+pCrk
	IFwE7StNSOYIklizVUvlnaveTJzHW33k1/ge4pE8DYnbZGC+RE5M3V0dcFcKUbJ74RlV7k9bGqG
	eNxnC8a2F9rM3kDpzFXuz6H7A6i8/aiV46MrvGEimhjLJvJdxEoLeZ6AARrR5OvGQZ4eVuduvBi
	9l4wz+jnR1amiMJX3p4vTLMPHmsqnkURW8nf4U9BTR723DevBcoELyQ2KGg+RyjT3iqlHhu31Rd
	Zaj3YrAAJcXFVy8tofnzKi8n1IJkDpYM08A5CHuL8eLKv3NcpP8sh6SdfNbM8A==
X-Received: by 2002:a05:7022:eac9:b0:1b2:3bdb:35cb with SMTP id a92af1059eb24-1b25d2f73b8mr101254c88.11.1793909163076;
        Thu, 05 Nov 2026 12:06:03 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm21837691c88.22.2026.11.05.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:06:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/9] hdf5: patch CVE-2026-120689
Date: Fri,  6 Nov 2026 09:05:46 +1300
Message-ID: <20261105200552.81303-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
References: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 20:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131931
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
index b8e5101e41..99f1eebec2 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-19025.patch \
            file://CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch \
            file://CVE-2026-19023-CVE-2026-19024.patch \
+           file://CVE-2026-120689.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
