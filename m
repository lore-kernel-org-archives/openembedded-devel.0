Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255EBF589B7
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:05 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18655.1776948539142715257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G3R72jLr;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so4404167a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948538; x=1777553338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XILb0gPHX3WMMKyOhtIuAxPRcHZcIVDDFsSk8zYP0k=;
        b=G3R72jLrc4X90WAN9Xi5g5Hxp4//U7eUMEsC9IqbEN8cEsJrudipyO4VeIqfuEVNAe
         dKrqZSHbqa7egz1a+q5QFpxjDOTg7/sMHF89kSo5I1Ue34SEc/8ixamFetzqEPUA+2du
         mEq+zLWmRNtJdr/cBdJjSjUhsh/5q/vCjO2nH/k/cV/Yl/n1zeNNwWYozynwSGwFBDwG
         B2eebke11dRtqIhI8fh+WO9q7PI0aWz6c6J6gh7mQqPVXOrJKa2lcxzrHt5Mu1PLX4ws
         s0pAZob1KLBi2QC/+ZcXcqWZeFXChn7Mk0IWp5t0K668bvkNEaHgPGTJ0pLnVC3J8Paz
         D7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948538; x=1777553338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4XILb0gPHX3WMMKyOhtIuAxPRcHZcIVDDFsSk8zYP0k=;
        b=nZQd9rYrkcKKjgWqq6wmu3YfR2UK5UPvxxTPtyCbvl1rA3U0d/hP8kyl4cFg7on5YP
         RW5SYBq+rfD+3Q6AbgKp3qXe3a4ccmtyDMObn5VlGCjESpn0qNH6Wq4blm3Hj7o2ul8n
         3hxYZXu8L9DYlzw+ggITNCvedQK1GBsObd1KryFylleKGg8lw736Lv+DpvWOqLyL9KB1
         NL8FaZXSL3dkSvNhxeO6D2zOX7oWzwzctqfsxbLHOiGmCv/4i8uFHruCRDGe7a2bykec
         JUXfCroXGbhRxI0c4uzQEnMm1niHp/DYKnu7ibw2EEmpwJS3xrRtNbGYiS77mP/dD5kH
         g2ow==
X-Gm-Message-State: AOJu0YxlDIYAlOBYrX0+eNDVuW9Bamjy1pp8qlsCVfgjZnyGYWKeg7XQ
	q4jVpFpsoZaR+vtLtHCsKrjDQ+WkXoJSWQoWskRZIyyIu76XOgpehxMwAoD7hcm3
X-Gm-Gg: AeBDies7+1y7UDuZR7MO1cojPLT+wXO1rgWEJzRFGlXERNdwKr130tRhW0zRxcq/c3B
	wPFLPAnHV/ZJJi4jfPY9SsntfdDskxsOEVgeZ3CWco/xby31ytYJ5nHYaKMG/4kOEIVKCl/RP9s
	SRN/P/lpjjUv4o4FBGlfS3Qv+i8jkoG7qErB4YgZwJaVeTH/EoH2r71ttj5w8C1yCMCj4I0Cd4H
	nI18AN0F83d9FatwUk8jRe2pPN746YtXOuguNx3cMqsSf1AhVeVBtVw2eXAv/D85tq2/aP7MTN/
	G71IpupZ4axCA1LXLWncbWi5r+f3gg8YuY2zIfvkac6FqqAMEU259cRH5vIjTz+Grgbr9yl1R+N
	a5RitoVa3OXby94n9IRf9C6bwXVnDC70sSR/YOmJRe36L19VkxuwRoUOwIJA03gKJC/PPEP6LSX
	1nr/nR+rg0pWGt1uflhQ7rj3jcrRRQOhg0Xm+++vRYaUX9dEKIzNPP4OE6yg==
X-Received: by 2002:a17:903:1ac8:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b5f9eaeba2mr280291865ad.13.1776948538325;
        Thu, 23 Apr 2026 05:48:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:48:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 3/19] jq: patch CVE-2026-33947
Date: Fri, 24 Apr 2026 00:48:01 +1200
Message-ID: <20260423124823.1983261-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126579

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33947

Backport the patch that is referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 525e18ce214213193d9a280de3bfd2deb847110e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jq/jq/CVE-2026-33947.patch                | 104 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
new file mode 100644
index 0000000000..69a8381f06
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
@@ -0,0 +1,104 @@
+From 5fd935884a6f5b3d8ecdcacfc5d3982140f3a478 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 11:23:40 +0900
+Subject: [PATCH] Limit path depth to prevent stack overflow
+
+Deeply nested path arrays can cause unbounded recursion in
+`jv_setpath`, `jv_getpath`, and `jv_delpaths`, leading to
+stack overflow. Add a depth limit of 10000 to match the
+existing `tojson` depth limit. This fixes CVE-2026-33947.
+
+CVE: CVE-2026-33947
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/fb59f1491058d58bdc3e8dd28f1773d1ac690a1f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/jv_aux.c  | 21 +++++++++++++++++++++
+ tests/jq.test | 25 +++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index bc1405f..594a21f 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -375,6 +375,10 @@ static jv jv_dels(jv t, jv keys) {
+   return t;
+ }
+ 
++#ifndef MAX_PATH_DEPTH
++#define MAX_PATH_DEPTH (10000)
++#endif
++
+ jv jv_setpath(jv root, jv path, jv value) {
+   if (jv_get_kind(path) != JV_KIND_ARRAY) {
+     jv_free(value);
+@@ -382,6 +386,12 @@ jv jv_setpath(jv root, jv path, jv value) {
+     jv_free(path);
+     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
+   }
++  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
++    jv_free(value);
++    jv_free(root);
++    jv_free(path);
++    return jv_invalid_with_msg(jv_string("Path too deep"));
++  }
+   if (!jv_is_valid(root)){
+     jv_free(value);
+     jv_free(path);
+@@ -434,6 +444,11 @@ jv jv_getpath(jv root, jv path) {
+     jv_free(path);
+     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
+   }
++  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
++    jv_free(root);
++    jv_free(path);
++    return jv_invalid_with_msg(jv_string("Path too deep"));
++  }
+   if (!jv_is_valid(root)) {
+     jv_free(path);
+     return root;
+@@ -511,6 +526,12 @@ jv jv_delpaths(jv object, jv paths) {
+       jv_free(elem);
+       return err;
+     }
++    if (jv_array_length(jv_copy(elem)) > MAX_PATH_DEPTH) {
++      jv_free(object);
++      jv_free(paths);
++      jv_free(elem);
++      return jv_invalid_with_msg(jv_string("Path too deep"));
++    }
+     jv_free(elem);
+   }
+   if (jv_array_length(jv_copy(paths)) == 0) {
+diff --git a/tests/jq.test b/tests/jq.test
+index 4ecf72f..6186d8b 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2507,3 +2507,28 @@ strflocaltime("" | ., @uri)
+ 0
+ ""
+ ""
++
++# regression test for CVE-2026-33947
++setpath([range(10000) | 0]; 0) | flatten
++null
++[0]
++
++try setpath([range(10001) | 0]; 0) catch .
++null
++"Path too deep"
++
++getpath([range(10000) | 0])
++null
++null
++
++try getpath([range(10001) | 0]) catch .
++null
++"Path too deep"
++
++delpaths([[range(10000) | 0]])
++null
++null
++
++try delpaths([[range(10001) | 0]]) catch .
++null
++"Path too deep"
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 71d7387bf8..6df1d46f48 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://run-ptest \
            file://0001-Support-building-with-disable-maintainer-mode-and-so.patch \
            file://CVE-2026-32316.patch \
+           file://CVE-2026-33947.patch \
            "
 
 inherit autotools ptest

