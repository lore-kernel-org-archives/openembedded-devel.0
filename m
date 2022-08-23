Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E80C32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 16:51:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.290.1661273486499390811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qhi1IKC3;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id f21so14529775pjt.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jf92/Wj+99q9N62qtsjUys+ArdnU4uFjtsvRM76Wkkg=;
        b=qhi1IKC3/UasGuvamhNB+mBk3CszrdSR+lbN3pUiil+g+crSUzW7AvGudhC5bVnfkh
         nBhriPXDBJ2bsz0N2tIq5kMLrrW0ORXtqgWNb98TMmANLWRhQkQ6pzO7lqjTTzNIiKL/
         invQ8EI8Y6Twye9ONynWrgLxBaeCrPBoUyD3ke3OqPbcGgkHNmXRboW7NhzOb2oPRWHu
         mX1/SKdg803XoOSI4XPGiESOBuYzeyj2MY/l/OICYMJypxDK9vRf8jDuD8976YCUFJh2
         KSB3ZfAerjhoaDdsHEMUEIcKjwdT4tlH6mYSqbCV27YpH5Aw5BDjsoX9jDobZJfYheFw
         Hbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jf92/Wj+99q9N62qtsjUys+ArdnU4uFjtsvRM76Wkkg=;
        b=0gnefWZ9TgEIueh8XuQ7kLSIvle6Fu/Ah5NO+iJVJFJOnzb10IpQBFt54coDtBpxE5
         vNIuEoBD4mOYP4nN3zl48nx0TvLWVNHR2cqRBTrUrZCYMOQNzE0n81/ST+A0kWs5Dvnq
         o+GjB8q1gEgzy2a6a3amoUO01tqIn/7X3gZiqG/eVnttf9ZFLknsSXvlRfnjiFGkKKUi
         DXTrWPuXIRzKLcn1nF3MIJxRkTDhiEUd+vR27nqWI2nhyE7eraQeTOXruIHNKLU4sVjO
         BrY0YPQvloi/6V6Mn4IDqMCzkJQGQnT/fwp/efJlJzaoaLvsUj8hzm6FsMbpe9G9iS8p
         blAA==
X-Gm-Message-State: ACgBeo1P2Ai5euFy3uGv0xrp76aVMSPh2JO9eEUN41fpHnef4ieUrIFJ
	fVjk6yz26HW7c5oIcEX6ZxR95BIldexbIg==
X-Google-Smtp-Source: 
 AA6agR66KEFmBlfjbZ/9lOFKZfNcA8jKcQWYFshUkpO9lYqiltS1VFeMuhRBGayc+sbJM5XgiaRRHw==
X-Received: by 2002:a17:903:41c1:b0:16f:68c:28 with SMTP id
 u1-20020a17090341c100b0016f068c0028mr24809928ple.74.1661273485638;
        Tue, 23 Aug 2022 09:51:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a170902f35200b0016be834d54asm10596856ple.306.2022.08.23.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 09:51:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] gd: Fix build with clang-15
Date: Tue, 23 Aug 2022 09:51:20 -0700
Message-Id: <20220823165122.3248107-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823165122.3248107-1-raj.khem@gmail.com>
References: <20220823165122.3248107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 16:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98394

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.37.2


