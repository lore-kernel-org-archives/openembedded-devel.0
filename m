Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7533.1792574953295444025
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IOWakGsX;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16079d54c17so995637c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574953; x=1793179753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlkOVDlMpahwpojKxINx/myU6vsCVLw5aqsNGwAyzhA=;
        b=IOWakGsXu1UjS0w4ZAqgrhHnvlkq3qI0RFSRkPmLD6OSJ5qLVAagCsB8cKdavJQ14M
         F3dcOTWxhv7PsInD/+1N0BrIM+mgaSdZBj0Tmyu0busrIe47YnAgLXJb7zSxPQtvkila
         BSmE2o3GKn4zWh/lYD6QUOY3PZaN6so1iQP7TQA5L6evvvQ2L46iz8D6jYOOD81XlOw+
         wWgpYfbf90bD0DpjvoXExBoRIYXYyczBmnfUFBN7deKrR/BKE+QSzfji3zB6OHiAC2Ks
         stEgWlupmKssA0TEnsHYb2Cb2wuqfjlxcvyUnfvilxIoi+8FLfIXwIxoOYEWKgRQHrDd
         bBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574953; x=1793179753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlkOVDlMpahwpojKxINx/myU6vsCVLw5aqsNGwAyzhA=;
        b=Rm5CSF6Q/hQJRFrpg8pfKByJJLTtoCxc8A56nQ5klMC6+KTKcnwtcCM72N59nM14EL
         6Z28oI2i9ltbr3XjBXySoWSxd2+uTj590d7fvaVwky6kwfGEveXXoAYjcihDBnBHEoIF
         vZO53ZqSCkC5OJgezpxkyevpKI60fbBHXpMYj+cXOEHFwG0AYzpeeXBh7Izd/GYrZA/d
         j/Wct+MTJkTkaCG4PvwVIgAYj91sbXxGnIgLhFY23cnDlfGlM1SUYvR/S1enXV3QS0cC
         Xk2ge91fGvkqNG9NvMkFDeH5R3cN5/lrfv3/48AO4stpG+dng3kTg4Rb9oz9iHHbGxnY
         fNfw==
X-Gm-Message-State: AFq9FYIJPcB3l2EB5xbE3n11Xxe4rtov/IJTqfR6+tDUFCqMdnc0jcg4
	yTxun0Zl32fZwVl1WoynENH3nKfbYjUCwy0xS7d/+jmBEETr30FPu8hp9C75ew==
X-Gm-Gg: AYBFou3BLoBG8Y0HnmdyDb32m+SAhPtjUTe7mpMTKvHg4ys8iBh4D/YzjNMNCdjaiyQ
	0KIvGjwxMPvyv6U/v1kp/v5SIkbzBwxipIwNzMo/bA+Spd6o1/cNuL+lYiBRcTe7Hz/GfRyPxTy
	rVe4GikJC04cbvIxjGUXzmMBtP9pFrWuKQu7cdTtwlQWPNG1CQSpp3803mADNA71zY6Vo1o68UF
	T2nTFDHwrHC1eKuzepKpyuNaDKbsyS5vQ/tX+VR2wN3hE9c8fKzYmRdsmKGvoxLMhhNlsyiI1xq
	z1DXfe1Fzs5a/S+3lK5dtO3u1F8iwnsc4DAIdpA/m/gFx+//ejGIKGjHHOOf7/v+3O5iqSFyM/l
	H0fDgA2rt2PvvkjNkD2ilsnLkJjBjy4r/o6U3Um2OSdYG6ILndO3691pA0zvF3e+iRHP/85IL7B
	3zoA7ZsmFIsKalBSX2heCrMAgK8x0YW/xWDDq4cIGYGKFEc73LUa6xpgGt2MbMhKrnyohh51Tqq
	PnnLXOq6bhjh27a3RMcZJWcDWkzF6mWAdBFpJYMk+q7CX4lUrcUz928eRf32q22rZqCCkwUhiBF
	wtPjUKobUCwgflfTqdwCuIYRm6zu/l0=
X-Received: by 2002:a05:7022:3f09:b0:14c:6eab:3f65 with SMTP id a92af1059eb24-190a6add120mr2522731c88.31.1792574952564;
        Wed, 21 Oct 2026 02:29:12 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 4/44] tinyproxy: patch CVE-2026-54388
Date: Wed, 21 Oct 2026 22:28:17 +1300
Message-ID: <20261021092857.3585453-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131191
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54388

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-54388.patch  | 32 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
new file mode 100644
index 0000000000..4dc7f88310
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
@@ -0,0 +1,32 @@
+From 2639058707dd9d199196b167823ba1865a60ea08 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 7 May 2026 16:39:48 +0000
+Subject: [PATCH] reqs: prevent multiple content-lengths getting emitted
+
+addressing point 2 of #609
+
+(cherry picked from commit 364cdb67e0ea00a8e4a7037e2693e0711e816adb)
+
+CVE: CVE-2026-54388
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/364cdb67e0ea00a8e4a7037e2693e0711e816adb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index d5037cf..117d755 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -681,6 +681,11 @@ add_header_to_connection (pseudomap *hashofheaders, char *header, size_t len)
+         /* Calculate the new length of just the data */
+         len -= sep - header - 1;
+ 
++        /* prevent multiple content-length headers from being inserted */
++        if (!strcasecmp(header, "content-length") &&
++            pseudomap_find (hashofheaders, "content-length"))
++                return 0;
++
+         return pseudomap_append (hashofheaders, header, sep);
+ }
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 25df44301b..46d3a4d7c6 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-31842.patch \
            file://CVE-2026-54387.patch \
            file://CVE-2026-55202.patch \
+           file://CVE-2026-54388.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"
