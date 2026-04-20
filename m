Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63F5F36C38
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13764.1776666475336530866
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XDoDw1cv;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso4549525e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666474; x=1777271274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3So1Pd5pLJgdWfwTf6LXciKf6sgpa2Ua1hb3NKgJ3E=;
        b=XDoDw1cvHGiaH328OPCBFVUki5rP+0h4CPxPX8M75BAyFxRHvFq8We+h5sXplipoX+
         X+vfNHEFFLJJHJiLpTQdi6OP5wW+Cdr/GBCYcunZaFavzUJ4fcRf5EvhzQMw84S5zIt5
         kphwFttIDga3K3kgu1FLta9C2+UJksSfSBcbHb4qThvBX6KasQODwCCYLUMZr0xpBAol
         twYcBS7BLE+RI3wfXcfpulIvsvlBPShMOAITgvlsmZoVJSO51pfnJs8EMMzGvF7Yfy0N
         KnG1OfntuWkiixJ8Im8iI+s0vXIjRUEqQN1UcWk+emTty48gDvF/imGDf2KHJroGd9UX
         KMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666474; x=1777271274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3So1Pd5pLJgdWfwTf6LXciKf6sgpa2Ua1hb3NKgJ3E=;
        b=cV6ttaM5M0gzt5Sp1UG0D1BrLbv+lxxIyWVGHJ4OrtATHh0asyATNcaDAv1o5Ae3CB
         HjSCnaKmeHQp+i9h8uIJeusHsjRM03dDV0gVzkimffba1MQMXl7Q9um0rT14S/8Q9w4k
         jEphRckC3Bx5NktmddsVSbooZ04hBbZUwTx35rqmkD0qdQwU5snfsDuSfu9gztzN9Wpz
         RVpE+Ip/0OGcoARJPIpuEc6Qaep536cHo0dZZah3daSwJYAEqynS/G3KO6Mt7KTj0r8b
         YNy4oEHndU98hiRik+RPy3keXonZ699kvZY3+LkJCuZocN6rpln33OwiopUOS+BzQPMV
         QIRg==
X-Gm-Message-State: AOJu0YzKEgDWXo/6qjK7jx0x2hMo1SUNRy1Eau7k1AEBkVzmhjlhQoeY
	zH1uS4++CtDQ+FFKWX7nu9DZko7PpaDrpE1o4NiCF6O5V3Qm4uaK/UAOe4F3Qg==
X-Gm-Gg: AeBDietJgQEQm8GQFazv07x431N4aE86Puwn+MetO2cXHK73Y0L93j4KXymH8O74lex
	498Ozo+R2BY/PQRkT0YheuFSKp1HSj9NUwhKhdcr+btn0y/0aEZNlMI48U306IR7XRgEINAUSmd
	+lVjmb3isl3nl4yeSfdNsrNtuzL5Vp6ByckT+cQa3PXhBTLAhMZZ+QIIcxLRJiDIvxu3AcCP6VG
	0JT8rt6i5sfxN35PeM4VxbYFMMMi0PFDW3wcAqNaJxYhl17FamvMr4U1Yx2eLU8u8YBovlmAegD
	7dCvsCiJiz+5hV2gQBp8f3Ir33ih0NVnpDFjxayq71PWWfDHHjxadp6YSxCqkSN9VgWRsUoF9gR
	bSdTw3jsUQOQgvzG+DRfo6gUA36pS5kgTCbtMAEX163URctc6wwtJmVLU+Etp1s/szYwJ0N6Epj
	lvPZZrm3uAL399SlJzUaFBatLc7z1EZXE=
X-Received: by 2002:a05:600c:1554:b0:485:439b:683f with SMTP id 5b1f17b1804b1-488fb775fd5mr166888775e9.20.1776666473540;
        Sun, 19 Apr 2026 23:27:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 03/17] jq: patch CVE-2026-33947
Date: Mon, 20 Apr 2026 08:27:35 +0200
Message-ID: <20260420062750.3795917-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126467

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33947

Backport the patch that is referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

