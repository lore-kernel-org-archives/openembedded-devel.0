Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D002D59F65
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 03:05:24 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1869.1765595120490573419
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 19:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=czkoTbGt;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-787e7aa1631so24214377b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 19:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765595119; x=1766199919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8TTB3pnE3IxRDIM6e77z77sa0GqoNFBD9mt78c1U8rE=;
        b=czkoTbGtnFXQqkEohpca7OJ4ads8p1QAhYIkzqoyCsTFO/Njw75/tuvyOMQ3R96sOA
         IOdLCo4j+RSgnBiFJGw9JZOSEI1KYpDfMrS9wLk4WLdLPsgoseFldAn8gUhy2YYhbcB0
         U7jSyemYKV3T3PLO3qRmaLtZdn2AGPMQhQFusBYohqkdi35adIRoZYB1f1hBYdYEf80p
         SNH6suglBeEyuxH5zYvFCNtehreAzBdpfMS+b/VBNgw4mQnvbuw2cBj24AYG6ruFIeYE
         5wU/SPuV+RuMADTMlA/L8qP+bnzAfwhQqnOi+qeDbVozaCDMyHbrpu3LP5twn5t7Bnq3
         gmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765595119; x=1766199919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TTB3pnE3IxRDIM6e77z77sa0GqoNFBD9mt78c1U8rE=;
        b=EDAmvAxZj+9oA3Tt+p/GaCDklwabA3xaWRDPNjTJ0XALZKHy5E4QLM1Xso5nuNTnuv
         9rwMomEI1eXPJQZGIt0CPKYqD7v+RQHclQfDYUAOO3R5+JkEiy+SotZ604kHKB8RPnN3
         Q1QuHWsZw00BfplllOyNTuU7IXMrbZgM0Nq9UOYNsXA5jz5qSLTuAHHuBEUpuGvqg47S
         RJa3OWOqMXiywY1J04XGVIBzoqIFQuTku1ZwZdQX2haDvZNO4lP9F31ulKJiEQ1tZZR5
         HeNzlSYuA05jm17EKhHilDRC7qBMBe1E3TjsF1mNPWT8zAg5WxdCHtF+ztiQOyqXYVKa
         ESTg==
X-Gm-Message-State: AOJu0YwwJ701iA+Juvkmj+6Iz6zahHOzSN7Dp4J37OWDJCXhHN0pI7v9
	WM5H662Bzhd0UlBmkZLXKO5mhR/JolbLHHM+vPg+hBbnCMs6KmpDGBGa8k6nppZ9
X-Gm-Gg: AY/fxX5kbLnudIgV2TkwqJZd/FuSiWtVXfrlP5NKqkj6nYaT/KA3b8ebbVS1G1JPhhz
	Q6Wd1dkQTuGNZMD0M+tGS94tUMUdAnPM8xvF5VsqWKw8f3Avvua3xWt2TG2TmrM3JVvwuK3fMJr
	Ze9bn854dAKqxpmbcMeGMGCQkUyg1KqvOPugFAfUOdCjISgPlCHZ9FxWrTVWY5vjxeISo8jLxXF
	y2HxMTyd/mrzcydC8YEoMTR6nbHl/UrbWbos3EP4khiOjH7rYdzC25yPACyE74R6G4UVz4Vu+fn
	pVxUCE8y1FwGubz+W8ld8kS0vxE/gFaWQtUakrkVe9mNdl4cB0TEb9Nuvzsubiybq/2NI4a6Zbm
	DLimaR4nr4sa+Scf2hACcZQWQ1ABFYVHQv7n4mzFkdHI76SA3shBs3/zkmZmCpItFrOpk/7OF0H
	tjuVJzCosMoji5n7wStYZnSudug+t0ew+W7Ar23Zui9SMbD9liXQVnminbrkACiNJwnsttHMTKr
	061UawtfKZCbA1/18NmGkH1vl6Ra8M36oJQ1KLiWz+cwIGsyFahJD5UV5NaNrhwkY26aEqY4qsv
X-Google-Smtp-Source: AGHT+IF6aR/ZDqsSaBYjTZxvwWy4mAXaNyPtZlaeOqa1h0P7Wcuj1Ro7F7+V+ccOlcUoGkM9osyiKA==
X-Received: by 2002:a05:690e:418d:b0:644:7ad3:6528 with SMTP id 956f58d0204a3-645551df890mr2654237d50.41.1765595119147;
        Fri, 12 Dec 2025 19:05:19 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477d39b01sm3325755d50.1.2025.12.12.19.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:05:18 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.34.5 -> 1.34.6
Date: Fri, 12 Dec 2025 22:04:30 -0500
Message-ID: <20251213030430.350068-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 03:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122627

Drop memory leak patch which has already been included in this new version.

The new version also includes a fix for CVE 2025-62408.

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/0001-ares_uri-memory-leak.patch    | 21 -------------------
 .../{c-ares_1.34.5.bb => c-ares_1.34.6.bb}    |  3 +--
 2 files changed, 1 insertion(+), 23 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.5.bb => c-ares_1.34.6.bb} (87%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
deleted file mode 100644
index 4d08651be1..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-fix memory leak in ares_uri (#1012)
-Dynamic memory, referenced by 'outpath', is allocated at ares_uri.c:527
-by calling function 'ares_buf_create' and lost at ares_uri.c:536.
-
-Signed-off-by: Felix The Cat (@F3lixTheCat)
-
---
-
-Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/ee2a1c3eff3c8164b09123005f4b49c571788b59]
-
---- a/src/lib/util/ares_uri.c	2025-08-10 15:59:17.501710307 -0400
-+++ b/src/lib/util/ares_uri.c	2025-08-10 16:00:35.867494819 -0400
-@@ -533,7 +533,7 @@
-   status = ares_buf_split_str_array(inpath, (const unsigned char *)"/", 1,
-                                     ARES_BUF_SPLIT_TRIM, 0, &arr);
-   if (status != ARES_SUCCESS) {
--    return NULL;
-+    goto done;
-   }
- 
-   for (i = 0; i < (ares_ssize_t)ares_array_len(arr); i++) {
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
similarity index 87%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
index b434886311..c9c54a9fa0 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
@@ -6,9 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
-           file://0001-ares_uri-memory-leak.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346"
+SRC_URI[sha256sum] = "912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


