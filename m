Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0921EC77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 12:29:39 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.106002.1683548973762926315
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 05:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NLI6QVOM;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-55b7630a736so66494917b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 05:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683548973; x=1686140973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P8DhBRTB8T+8DF+9pmc3tpRlPf4MPuimKafvktyOXVw=;
        b=NLI6QVOM8y10QXhdtF/0+K/hoHSV9HOmYwT0e5mUlvY10SH91RvYKDQLwadvuedNR1
         wjI9kUiVlkUi4B6UIzOkEE7wqOlzU/ZtxZZc8qOmbmgMVE6WY5yGQjFS7/lsJu3tSdeD
         INW6S+EXhyNIs5zyUS7CJQYMZj+fI6Rem2mh4j3RV62BIhSJwv4dvPs7ykT6g1CZm13w
         /DoDCNRX65z7JldxSmrSKv/0AT72bBWWy11j/xCZr115eFWPwqK1/qCm2mv4ANxCn1mK
         s4KqtE0ONLmCwv8J+vYJJNGo7UdoyHoP0P1eLdxqM2/jHiyb9xBarR+pWGQBT2OEOcKh
         apOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683548973; x=1686140973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8DhBRTB8T+8DF+9pmc3tpRlPf4MPuimKafvktyOXVw=;
        b=PJRvSt86SZFszhI/9uGDcwGUvWsExco6GCcF4l3HygCMVLXfBTOP5l9oFT9cm6a+i/
         pAOk7hgSZgxW4u76NzPTbvwEna/D9g6+rRy12xzVscmHWCo03JUtg5K0pG+EeDx5QfRV
         4GlrzyDmC7+3dBFfywveehKm1llLlpF0FDMktbFpgdDp06Nug0S8/rNyg9yrI3EbRWfQ
         HD/d26UeeNSJyLGOG9owxk4pK8BBGZ1QEqYmhzB6DMQpaHzvrChIFdw70dNmLIFWLdSy
         TQ3rkpb/LY7DN+mcyAbT1gh+IRohKkEIg9ICuAu2PxKhw0NYZxMve287bjv8RKXkyYb0
         Qq3Q==
X-Gm-Message-State: AC+VfDzosSITi4HOSf119fCDP1yo50C84yVsspwni6csjh+wmCxjLYoq
	sBZzC/9iHZl4nrZjlCdPmSSvK67OYPM=
X-Google-Smtp-Source: ACHHUZ7CZJOHIKWQX+6O0unUfS0nfYspHm2ceqxERTU3gvNsoT8mYpuYD9taH2eowCyb4r5ZhO1Lvw==
X-Received: by 2002:a0d:e808:0:b0:55a:4ff4:f97d with SMTP id r8-20020a0de808000000b0055a4ff4f97dmr10807138ywe.48.1683548972683;
        Mon, 08 May 2023 05:29:32 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id c64-20020a0df343000000b0055aafcef659sm2488467ywf.5.2023.05.08.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:29:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Arsalan H. Awan" <arsalan.awan@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH] meta-networking/licenses/netperf: remove unused license
Date: Mon,  8 May 2023 08:29:30 -0400
Message-Id: <20230508122930.3272580-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 12:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102438

From: "Arsalan H. Awan" <arsalan.awan@siemens.com>

This removes the old unused license for netperf as upstream
moved to using the MIT license for netperf.

See: meta-openembedded commit 587fe5877790b6c2e1d337c351b8f50603ad4db9

Signed-off-by: Arsalan H. Awan <arsalan.awan@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 27bdecd1bcf1fa86bf4ebbc527fceb455efe2970)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/licenses/netperf | 43 --------------------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta-networking/licenses/netperf

diff --git a/meta-networking/licenses/netperf b/meta-networking/licenses/netperf
deleted file mode 100644
index 3f3ceb2fc2..0000000000
--- a/meta-networking/licenses/netperf
+++ /dev/null
@@ -1,43 +0,0 @@
-
- 
-              Copyright (C) 1993 Hewlett-Packard Company
-                         ALL RIGHTS RESERVED.
- 
-  The enclosed software and documentation includes copyrighted works
-  of Hewlett-Packard Co. For as long as you comply with the following
-  limitations, you are hereby authorized to (i) use, reproduce, and
-  modify the software and documentation, and to (ii) distribute the
-  software and documentation, including modifications, for
-  non-commercial purposes only.
-      
-  1.  The enclosed software and documentation is made available at no
-      charge in order to advance the general development of
-      high-performance networking products.
- 
-  2.  You may not delete any copyright notices contained in the
-      software or documentation. All hard copies, and copies in
-      source code or object code form, of the software or
-      documentation (including modifications) must contain at least
-      one of the copyright notices.
- 
-  3.  The enclosed software and documentation has not been subjected
-      to testing and quality control and is not a Hewlett-Packard Co.
-      product. At a future time, Hewlett-Packard Co. may or may not
-      offer a version of the software and documentation as a product.
-  
-  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
-      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
-      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
-      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
-      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
-      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
-      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
-      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
-      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
-  
-  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
-      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
-      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
-      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
- 
-
-- 
2.25.1


