Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC257C6FA94
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.19283.1663590829132195734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WzET+CXy;
 spf=pass (domain: gmail.com, ip: 209.85.219.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id w4so21706242qvp.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=P4207C2xLmXt8gwzLdj6+WYqW3OMMiVxzBmbgRIZYaE=;
        b=WzET+CXywQutZS/BIVkOtu7mKFEmxJdX/pKGwWGyLWbo3ctLkYJnQpDDh1YEcgER6X
         1XToL96oE/u+j0ePmvLx70qJmV00nqBQq8cv/AS01mZH0LThnxv3l+BL4M0eMAr7kODO
         JhEKDT/1z4eE/j9uajWio9U1hEEs75JcQtlgg9BtwnHsuCvwM6FCbN3qpYgFazW3uutC
         1JEAISVM/dDvO4z/ZE9UM8B1JQrnuqYGIsPAItWI242zhIqKtG3l7mxxxTBUQ7iZPjnv
         /pVvbQbvIuey59kgUkRd/kpoG5Fo3nM1Xadze2C9kRJIMdLUE+d8QmGu165w3aWkOTsP
         hHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=P4207C2xLmXt8gwzLdj6+WYqW3OMMiVxzBmbgRIZYaE=;
        b=PlAcrmjNY3y75SHUnb5RUyVSRnf4gNSDWtqHKSu7R9u+MGWpAfA1AA1R0leuOIDdS4
         r7JrXhML8vgTUyZwiqpbdanxoCAyTdTNG8SedsFeZdOLCK0HFJ7eGIQOWHZulMtsj17i
         hgXXIqxr2PQGeWoVNilt3JUCwwmz1CadXfe06X9wJ6AZ/8o7YFHdkKH1sWI8HNxr4ZMR
         Hf4bXoGcA993TgZEuLqWlT4XPz7JiYD/BqpaSdZk4oN+SWUyvlP3PsRT3zZnM4n8eLFl
         rMifTjOCQ8zNJrMCBqZqsad7p4J25MpgS/jRWLPI/TNg/Lztc9QBA7lmFfm/c9BRrhzs
         WybA==
X-Gm-Message-State: ACrzQf3KUkRxUMzPzHyulf4qvx85efHTCkeaqlwd2Kqjv88jZ18/0FlN
	auDH8npG/F5PxtWP/qafxVL3dfEsuXo=
X-Google-Smtp-Source: 
 AMsMyM7Pr6BzZ+j8kAFLkQ1VPbEhnZS3k0Pxb8nSCslmL8MCE9FNSRc84/AXKxr+UgayfC+9hkwlFw==
X-Received: by 2002:a05:6214:21eb:b0:4ac:7ac8:345 with SMTP id
 p11-20020a05621421eb00b004ac7ac80345mr14592879qvj.90.1663590827882;
        Mon, 19 Sep 2022 05:33:47 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 05/11] gd: Fix build with clang-15
Date: Mon, 19 Sep 2022 08:33:32 -0400
Message-Id: 
 <09acaf6b08477144c5f64202614884f4a94916d9.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98856

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1e889bae41529770cb800aba3bfd1189e4ac39d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-Fix-deprecared-function-prototypes.patch | 115 ++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.3.bb        |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-Fix-deprecared-function-prototypes.patch

diff --git a/meta-oe/recipes-support/gd/gd/0001-Fix-deprecared-function-prototypes.patch b/meta-oe/recipes-support/gd/gd/0001-Fix-deprecared-function-prototypes.patch
new file mode 100644
index 0000000000..5ac5170721
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/0001-Fix-deprecared-function-prototypes.patch
@@ -0,0 +1,115 @@
+From 6379331cd0647fc6f149f55e4505a9a92e4f159f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Aug 2022 22:43:26 -0700
+Subject: [PATCH] Fix deprecared function prototypes
+
+Fixes following errors:
+error: a function definition without a prototype is deprecated in all versions of C and is not supported in C2x [-Werror,-Wdeprecated-non-prototype]
+
+Upstream-Status: Submitted [https://github.com/libgd/libgd/pull/835]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gd_nnquant.c | 32 +++++++-------------------------
+ src/gd_tiff.c    |  4 +---
+ 2 files changed, 8 insertions(+), 28 deletions(-)
+
+diff --git a/src/gd_nnquant.c b/src/gd_nnquant.c
+index 8b9aa794..013f7160 100644
+--- a/src/gd_nnquant.c
++++ b/src/gd_nnquant.c
+@@ -112,12 +112,7 @@ typedef struct {
+ 
+ /* Initialise network in range (0,0,0,0) to (255,255,255,255) and set parameters
+    ----------------------------------------------------------------------- */
+-static void initnet(nnq, thepic, len, sample, colours)
+-nn_quant *nnq;
+-unsigned char *thepic;
+-int len;
+-int sample;
+-int colours;
++static void initnet(nn_quant *nnq, unsigned char *thepic, int len, int sample, int colours)
+ {
+ 	register int i;
+ 	register int *p;
+@@ -163,9 +158,7 @@ static void unbiasnet(nn_quant *nnq)
+ }
+ 
+ /* Output colormap to unsigned char ptr in RGBA format */
+-static void getcolormap(nnq, map)
+-nn_quant *nnq;
+-unsigned char *map;
++static void getcolormap(nn_quant *nnq, unsigned char *map)
+ {
+ 	int i,j;
+ 	for(j=0; j < nnq->netsize; j++) {
+@@ -232,9 +225,7 @@ static void inxbuild(nn_quant *nnq)
+ 
+ /* Search for ABGR values 0..255 (after net is unbiased) and return colour index
+ 	 ---------------------------------------------------------------------------- */
+-static unsigned int inxsearch(nnq, al,b,g,r)
+-nn_quant *nnq;
+-register int al, b, g, r;
++static unsigned int inxsearch(nn_quant *nnq, int al, int b, int g, int r)
+ {
+ 	register int i, j, dist, a, bestd;
+ 	register int *p;
+@@ -306,9 +297,7 @@ register int al, b, g, r;
+ 
+ /* Search for biased ABGR values
+    ---------------------------- */
+-static int contest(nnq, al,b,g,r)
+-nn_quant *nnq;
+-register int al,b,g,r;
++static int contest(nn_quant *nnq, int al, int b, int g, int r)
+ {
+ 	/* finds closest neuron (min dist) and updates freq */
+ 	/* finds best neuron (min dist-bias) and returns position */
+@@ -362,9 +351,7 @@ register int al,b,g,r;
+ /* Move neuron i towards biased (a,b,g,r) by factor alpha
+ 	 ---------------------------------------------------- */
+ 
+-static void altersingle(nnq, alpha,i,al,b,g,r)
+-nn_quant *nnq;
+-register int alpha,i,al,b,g,r;
++static void altersingle(nn_quant *nnq, int alpha, int i,int al, int b, int g, int r)
+ {
+ 	register int *n;
+ 
+@@ -382,10 +369,7 @@ register int alpha,i,al,b,g,r;
+ /* Move adjacent neurons by precomputed alpha*(1-((i-j)^2/[r]^2)) in radpower[|i-j|]
+ 	 --------------------------------------------------------------------------------- */
+ 
+-static void alterneigh(nnq, rad,i,al,b,g,r)
+-nn_quant *nnq;
+-int rad,i;
+-register int al,b,g,r;
++static void alterneigh(nn_quant *nnq, int rad, int i, int al,int b,int g, int r)
+ {
+ 	register int j,k,lo,hi,a;
+ 	register int *p, *q;
+@@ -429,9 +413,7 @@ register int al,b,g,r;
+ /* Main Learning Loop
+    ------------------ */
+ 
+-static void learn(nnq, verbose) /* Stu: N.B. added parameter so that main() could control verbosity. */
+-nn_quant *nnq;
+-int verbose;
++static void learn(nn_quant *nnq, int verbose) /* Stu: N.B. added parameter so that main() could control verbosity. */
+ {
+ 	register int i,j,al,b,g,r;
+ 	int radius,rad,alpha,step,delta,samplepixels;
+diff --git a/src/gd_tiff.c b/src/gd_tiff.c
+index 7f72b610..3d90e61a 100644
+--- a/src/gd_tiff.c
++++ b/src/gd_tiff.c
+@@ -446,9 +446,7 @@ BGD_DECLARE(void) gdImageTiffCtx(gdImagePtr image, gdIOCtx *out)
+ }
+ 
+ /* Check if we are really in 8bit mode */
+-static int checkColorMap(n, r, g, b)
+-int n;
+-uint16_t *r, *g, *b;
++static int checkColorMap(int n, uint16_t *r, uint16_t *g, uint16_t *b)
+ {
+ 	while (n-- > 0)
+ 		if (*r++ >= 256 || *g++ >= 256 || *b++ >= 256)
diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
index 9d4ee1fe4b..cc2c1571e6 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ace63adfdac78400fc30fa22ee9c1bb1"
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1;protocol=https \
+           file://0001-Fix-deprecared-function-prototypes.patch \
            "
 
 SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
-- 
2.25.1


