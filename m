Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA644C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:03:57 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.8990.1647950636770870748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 05:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NChOTPId;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id u22so6579271pfg.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=nHHka5iNvlp4H7ZSCJnmffuOAS/FHiOwL0v+Nr/HF6k=;
        b=NChOTPIdOeWo6BVU2Rt/hXMkbgZuy6w2WVs5Hv1LLQq6ovBXfoyOtcTNp7r59nIg9V
         gXO23ydgR1e4xKQOwsqxsP/AY+IgCBivqsECp47l4iALWsv3zE/TxXXR+a5uuPtVxG7z
         AFxblH3f9DzzYXpQfLjC7wJ+wwyW1dMZsRe0y/P+zxeVc4B2FjDa9DbWSRLqVhHMaHO6
         wyhzxwnrnjI/3lTdeeSYtaAFVZuysyuC3hUF24NwlwYLGyOlqvvuNDt5rOQMuKOc45hY
         5rF3v/8XHwe/BfW/H9nc4PRa7GY8EhbvUjl2dKdXGh88aeJEYZYJP7L0Qkr6kCNBK1yo
         EQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nHHka5iNvlp4H7ZSCJnmffuOAS/FHiOwL0v+Nr/HF6k=;
        b=qEN/Uk7qyNtyAyZ4amEGxEHnpu4yl4dAZkLBRV//RGI56TF0J0sNCQlOf5wmAcQqmS
         oWioKAcDvcGcvytTJzaEIRS4OB7xyBLndQVuLSkiMbFsok+E/RHzVGQYkJkGAMJiuXZL
         l1EOr8QuK/O0Z4/vbNrhV5s3Uxh9BKuxUdpLzjyn0BGonu1P2xx0+CtMffXUXkSZCTE/
         AKmjf7B6rrozSihD1vOxGw6PbNTRinV9OUsKMri07Xrv27UkK3/o7YUZ8v0NpO1erz0z
         tVCqDH2a/CYXIvJe+6A147sV0D5WfX0dOSsjcbaTAwOzCqFv/bYIO+4N04Ji/pZZ4Qv4
         on7Q==
X-Gm-Message-State: AOAM532xK5rERxQCXTv3+E9EURB3cMYFfA358QlrcNYaVhY/lFF9glwG
	3wA6NUmfFSWbWYelxVNPJ5+RZ1xDMz3bgQ==
X-Google-Smtp-Source: 
 ABdhPJyxKo8hPU0f8z3fSZdtL/HoMXMOD1qH9TPGDmtLa3UTbd6QBFtSLgqdGXQpVPWJy4OYjxNZ7Q==
X-Received: by 2002:a63:1243:0:b0:381:6713:241b with SMTP id
 3-20020a631243000000b003816713241bmr21359856pgs.76.1647950634946;
        Tue, 22 Mar 2022 05:03:54 -0700 (PDT)
Received: from localhost.localdomain ([103.115.128.22])
        by smtp.gmail.com with ESMTPSA id
 j18-20020a056a00235200b004faabd8d2f2sm6034779pfj.192.2022.03.22.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 05:03:54 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-oe][dunfell][PATCH] openjpeg: Fix multiple CVE
Date: Tue, 22 Mar 2022 17:33:24 +0530
Message-Id: <20220322120324.25032-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 12:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96140

Add patch to fix below CVE:
CVE-2019-12973
CVE-2020-15389
CVE-2020-27814
CVE-2020-27823
CVE-2020-27824
CVE-2020-27841
CVE-2020-27842
CVE-2020-27843
CVE-2020-27845

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../openjpeg/openjpeg/CVE-2019-12973-1.patch  |  72 ++++++
 .../openjpeg/openjpeg/CVE-2019-12973-2.patch  |  86 +++++++
 .../openjpeg/openjpeg/CVE-2020-15389.patch    |  43 ++++
 .../openjpeg/openjpeg/CVE-2020-27814-1.patch  |  29 +++
 .../openjpeg/openjpeg/CVE-2020-27814-2.patch  |  27 ++
 .../openjpeg/openjpeg/CVE-2020-27814-3.patch  |  30 +++
 .../openjpeg/openjpeg/CVE-2020-27814-4.patch  |  27 ++
 .../openjpeg/openjpeg/CVE-2020-27823.patch    |  29 +++
 .../openjpeg/openjpeg/CVE-2020-27824.patch    |  24 ++
 .../openjpeg/openjpeg/CVE-2020-27841.patch    | 238 ++++++++++++++++++
 .../openjpeg/openjpeg/CVE-2020-27842.patch    |  31 +++
 .../openjpeg/openjpeg/CVE-2020-27843.patch    |  31 +++
 .../openjpeg/openjpeg/CVE-2020-27845.patch    |  74 ++++++
 .../openjpeg/openjpeg_2.3.1.bb                |  13 +
 14 files changed, 754 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-1.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-2.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-1.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-2.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-3.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-4.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27823.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27824.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27841.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27842.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27843.patch
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27845.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-1.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-1.patch
new file mode 100644
index 0000000000..98988e686e
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-1.patch
@@ -0,0 +1,72 @@
+From 21399f6b7d318fcdf4406d5e88723c4922202aa3 Mon Sep 17 00:00:00 2001
+From: Young Xiao <YangX92@hotmail.com>
+Date: Sat, 16 Mar 2019 19:57:27 +0800
+Subject: [PATCH] convertbmp: detect invalid file dimensions early
+
+width/length dimensions read from bmp headers are not necessarily
+valid. For instance they may have been maliciously set to very large
+values with the intention to cause DoS (large memory allocation, stack
+overflow). In these cases we want to detect the invalid size as early
+as possible.
+
+This commit introduces a counter which verifies that the number of
+written bytes corresponds to the advertized width/length.
+
+See commit 8ee335227bbc for details.
+
+Signed-off-by: Young Xiao <YangX92@hotmail.com>
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2019-12973
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/bin/jp2/convertbmp.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
+index 0af52f816..ec34f535b 100644
+--- a/src/bin/jp2/convertbmp.c
++++ b/src/bin/jp2/convertbmp.c
+@@ -622,13 +622,13 @@ static OPJ_BOOL bmp_read_rle8_data(FILE* IN, OPJ_UINT8* pData,
+ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                                    OPJ_UINT32 stride, OPJ_UINT32 width, OPJ_UINT32 height)
+ {
+-    OPJ_UINT32 x, y;
++    OPJ_UINT32 x, y, written;
+     OPJ_UINT8 *pix;
+     const OPJ_UINT8 *beyond;
+ 
+     beyond = pData + stride * height;
+     pix = pData;
+-    x = y = 0U;
++    x = y = written = 0U;
+     while (y < height) {
+         int c = getc(IN);
+         if (c == EOF) {
+@@ -642,6 +642,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+             for (j = 0; (j < c) && (x < width) &&
+                     ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
+                 *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
++                written++;
+             }
+         } else { /* absolute mode */
+             c = getc(IN);
+@@ -671,6 +672,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                         c1 = (OPJ_UINT8)getc(IN);
+                     }
+                     *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
++                    written++;
+                 }
+                 if (((c & 3) == 1) || ((c & 3) == 2)) { /* skip padding byte */
+                     getc(IN);
+@@ -678,6 +680,10 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+             }
+         }
+     }  /* while(y < height) */
++    if (written != width * height) {
++        fprintf(stderr, "warning, image's actual size does not match advertized one\n");
++        return OPJ_FALSE;
++    }
+     return OPJ_TRUE;
+ }
+ 
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-2.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-2.patch
new file mode 100644
index 0000000000..2177bfdbdb
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2019-12973-2.patch
@@ -0,0 +1,86 @@
+From 3aef207f90e937d4931daf6d411e092f76d82e66 Mon Sep 17 00:00:00 2001
+From: Young Xiao <YangX92@hotmail.com>
+Date: Sat, 16 Mar 2019 20:09:59 +0800
+Subject: [PATCH] bmp_read_rle4_data(): avoid potential infinite loop
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2019-12973
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/bin/jp2/convertbmp.c | 32 ++++++++++++++++++++++++++------
+ 1 file changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
+index ec34f535b..2fc4e9bc4 100644
+--- a/src/bin/jp2/convertbmp.c
++++ b/src/bin/jp2/convertbmp.c
+@@ -632,12 +632,18 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+     while (y < height) {
+         int c = getc(IN);
+         if (c == EOF) {
+-            break;
++            return OPJ_FALSE;
+         }
+ 
+         if (c) { /* encoded mode */
+-            int j;
+-            OPJ_UINT8 c1 = (OPJ_UINT8)getc(IN);
++            int j, c1_int;
++            OPJ_UINT8 c1;
++
++            c1_int = getc(IN);
++            if (c1_int == EOF) {
++                return OPJ_FALSE;
++            }
++            c1 = (OPJ_UINT8)c1_int;
+ 
+             for (j = 0; (j < c) && (x < width) &&
+                     ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
+@@ -647,7 +653,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+         } else { /* absolute mode */
+             c = getc(IN);
+             if (c == EOF) {
+-                break;
++                return OPJ_FALSE;
+             }
+ 
+             if (c == 0x00) { /* EOL */
+@@ -658,8 +664,14 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                 break;
+             } else if (c == 0x02) { /* MOVE by dxdy */
+                 c = getc(IN);
++                if (c == EOF) {
++                    return OPJ_FALSE;
++                }
+                 x += (OPJ_UINT32)c;
+                 c = getc(IN);
++                if (c == EOF) {
++                    return OPJ_FALSE;
++                }
+                 y += (OPJ_UINT32)c;
+                 pix = pData + y * stride + x;
+             } else { /* 03 .. 255 : absolute mode */
+@@ -669,13 +681,21 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                 for (j = 0; (j < c) && (x < width) &&
+                         ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
+                     if ((j & 1) == 0) {
+-                        c1 = (OPJ_UINT8)getc(IN);
++                        int c1_int;
++                        c1_int = getc(IN);
++                        if (c1_int == EOF) {
++                            return OPJ_FALSE;
++                        }
++                        c1 = (OPJ_UINT8)c1_int;
+                     }
+                     *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
+                     written++;
+                 }
+                 if (((c & 3) == 1) || ((c & 3) == 2)) { /* skip padding byte */
+-                    getc(IN);
++                    c = getc(IN);
++                    if (c == EOF) {
++                        return OPJ_FALSE;
++                    }
+                 }
+             }
+         }
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
new file mode 100644
index 0000000000..f22e153b52
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-15389.patch
@@ -0,0 +1,43 @@
+From e8e258ab049240c2dd1f1051b4e773b21e2d3dc0 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 28 Jun 2020 14:19:59 +0200
+Subject: [PATCH] opj_decompress: fix double-free on input directory with mix
+ of valid and invalid images (CVE-2020-15389)
+
+Fixes #1261
+
+Credits to @Ruia-ruia for reporting and analysis.
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-15389
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/bin/jp2/opj_decompress.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
+index 7eeb0952f..2634907f0 100644
+--- a/src/bin/jp2/opj_decompress.c
++++ b/src/bin/jp2/opj_decompress.c
+@@ -1316,10 +1316,6 @@ static opj_image_t* upsample_image_components(opj_image_t* original)
+ int main(int argc, char **argv)
+ {
+     opj_decompress_parameters parameters;           /* decompression parameters */
+-    opj_image_t* image = NULL;
+-    opj_stream_t *l_stream = NULL;              /* Stream */
+-    opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
+-    opj_codestream_index_t* cstr_index = NULL;
+ 
+     OPJ_INT32 num_images, imageno;
+     img_fol_t img_fol;
+@@ -1393,6 +1389,10 @@ int main(int argc, char **argv)
+ 
+     /*Decoding image one by one*/
+     for (imageno = 0; imageno < num_images ; imageno++)  {
++        opj_image_t* image = NULL;
++        opj_stream_t *l_stream = NULL;              /* Stream */
++        opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
++        opj_codestream_index_t* cstr_index = NULL;
+ 
+         if (!parameters.quiet) {
+             fprintf(stderr, "\n");
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-1.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-1.patch
new file mode 100644
index 0000000000..da06db6db7
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-1.patch
@@ -0,0 +1,29 @@
+From eaa098b59b346cb88e4d10d505061f669d7134fc Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 23 Nov 2020 13:49:05 +0100
+Subject: [PATCH] Encoder: grow buffer size in
+ opj_tcd_code_block_enc_allocate_data() to avoid write heap buffer overflow in
+ opj_mqc_flush (fixes #1283)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27814
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/tcd.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/src/lib/openjp2/tcd.c
++++ b/src/lib/openjp2/tcd.c
+@@ -1235,9 +1235,11 @@ static OPJ_BOOL opj_tcd_code_block_enc_a
+ 
+     /* +1 is needed for https://github.com/uclouvain/openjpeg/issues/835 */
+     /* and actually +2 required for https://github.com/uclouvain/openjpeg/issues/982 */
++    /* and +7 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 3) */
++    /* and +26 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 7) */
+     /* TODO: is there a theoretical upper-bound for the compressed code */
+     /* block size ? */
+-    l_data_size = 2 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
++    l_data_size = 26 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
+                                    (p_code_block->y1 - p_code_block->y0) * (OPJ_INT32)sizeof(OPJ_UINT32));
+ 
+     if (l_data_size > p_code_block->data_size) {
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-2.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-2.patch
new file mode 100644
index 0000000000..9c5894c720
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-2.patch
@@ -0,0 +1,27 @@
+From 15cf3d95814dc931ca0ecb132f81cb152e051bae Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 23 Nov 2020 18:14:02 +0100
+Subject: [PATCH] Encoder: grow again buffer size in
+ opj_tcd_code_block_enc_allocate_data() (fixes #1283)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27814
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/tcd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/src/lib/openjp2/tcd.c
++++ b/src/lib/openjp2/tcd.c
+@@ -1237,9 +1237,10 @@ static OPJ_BOOL opj_tcd_code_block_enc_a
+     /* and actually +2 required for https://github.com/uclouvain/openjpeg/issues/982 */
+     /* and +7 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 3) */
+     /* and +26 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 7) */
++    /* and +28 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 44) */
+     /* TODO: is there a theoretical upper-bound for the compressed code */
+     /* block size ? */
+-    l_data_size = 26 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
++    l_data_size = 28 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
+                                    (p_code_block->y1 - p_code_block->y0) * (OPJ_INT32)sizeof(OPJ_UINT32));
+ 
+     if (l_data_size > p_code_block->data_size) {
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-3.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-3.patch
new file mode 100644
index 0000000000..1eb030af46
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-3.patch
@@ -0,0 +1,30 @@
+From 649298dcf84b2f20cfe458d887c1591db47372a6 Mon Sep 17 00:00:00 2001
+From: yuan <zodf0055980@gmail.com>
+Date: Wed, 25 Nov 2020 20:41:39 +0800
+Subject: [PATCH] Encoder: grow again buffer size in
+ opj_tcd_code_block_enc_allocate_data() (fixes #1283)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27814
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/tcd.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+--- a/src/lib/openjp2/tcd.c
++++ b/src/lib/openjp2/tcd.c
+@@ -1238,10 +1238,12 @@ static OPJ_BOOL opj_tcd_code_block_enc_a
+     /* and +7 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 3) */
+     /* and +26 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 7) */
+     /* and +28 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 44) */
++    /* and +33 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 4) */
++    /* and +63 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 4 -IMF 2K) */
+     /* TODO: is there a theoretical upper-bound for the compressed code */
+     /* block size ? */
+-    l_data_size = 28 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
+-                                   (p_code_block->y1 - p_code_block->y0) * (OPJ_INT32)sizeof(OPJ_UINT32));
++    l_data_size = 63 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
++                                    (p_code_block->y1 - p_code_block->y0) * (OPJ_INT32)sizeof(OPJ_UINT32));
+ 
+     if (l_data_size > p_code_block->data_size) {
+         if (p_code_block->data) {
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-4.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-4.patch
new file mode 100644
index 0000000000..1c267c313b
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27814-4.patch
@@ -0,0 +1,27 @@
+From 4ce7d285a55d29b79880d0566d4b010fe1907aa9 Mon Sep 17 00:00:00 2001
+From: yuan <zodf0055980@gmail.com>
+Date: Fri, 4 Dec 2020 19:00:22 +0800
+Subject: [PATCH] Encoder: grow again buffer size in
+ opj_tcd_code_block_enc_allocate_data() (fixes #1283)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27814
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/tcd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/src/lib/openjp2/tcd.c
++++ b/src/lib/openjp2/tcd.c
+@@ -1240,9 +1240,10 @@ static OPJ_BOOL opj_tcd_code_block_enc_a
+     /* and +28 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 44) */
+     /* and +33 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 4) */
+     /* and +63 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 4 -IMF 2K) */
++    /* and +74 for https://github.com/uclouvain/openjpeg/issues/1283 (-M 4 -n 8 -s 7,7 -I) */
+     /* TODO: is there a theoretical upper-bound for the compressed code */
+     /* block size ? */
+-    l_data_size = 63 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
++    l_data_size = 74 + (OPJ_UINT32)((p_code_block->x1 - p_code_block->x0) *
+                                     (p_code_block->y1 - p_code_block->y0) * (OPJ_INT32)sizeof(OPJ_UINT32));
+ 
+     if (l_data_size > p_code_block->data_size) {
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27823.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27823.patch
new file mode 100644
index 0000000000..e4373d0d32
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27823.patch
@@ -0,0 +1,29 @@
+From b2072402b7e14d22bba6fb8cde2a1e9996e9a919 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 30 Nov 2020 22:31:51 +0100
+Subject: [PATCH] pngtoimage(): fix wrong computation of x1,y1 if -d option is
+ used, that would result in a heap buffer overflow (fixes #1284)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27823
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/bin/jp2/convertpng.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/bin/jp2/convertpng.c b/src/bin/jp2/convertpng.c
+index 328c91beb..00f596e27 100644
+--- a/src/bin/jp2/convertpng.c
++++ b/src/bin/jp2/convertpng.c
+@@ -223,9 +223,9 @@ opj_image_t *pngtoimage(const char *read_idf, opj_cparameters_t * params)
+     image->x0 = (OPJ_UINT32)params->image_offset_x0;
+     image->y0 = (OPJ_UINT32)params->image_offset_y0;
+     image->x1 = (OPJ_UINT32)(image->x0 + (width  - 1) * (OPJ_UINT32)
+-                             params->subsampling_dx + 1 + image->x0);
++                             params->subsampling_dx + 1);
+     image->y1 = (OPJ_UINT32)(image->y0 + (height - 1) * (OPJ_UINT32)
+-                             params->subsampling_dy + 1 + image->y0);
++                             params->subsampling_dy + 1);
+ 
+     row32s = (OPJ_INT32 *)malloc((size_t)width * nr_comp * sizeof(OPJ_INT32));
+     if (row32s == NULL) {
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27824.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27824.patch
new file mode 100644
index 0000000000..5f3deb4dda
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27824.patch
@@ -0,0 +1,24 @@
+From 6daf5f3e1ec6eff03b7982889874a3de6617db8d Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 30 Nov 2020 22:37:07 +0100
+Subject: [PATCH] Encoder: avoid global buffer overflow on irreversible
+ conversion when too many decomposition levels are specified (fixes #1286)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27824
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/dwt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/src/lib/openjp2/dwt.c
++++ b/src/lib/openjp2/dwt.c
+@@ -1293,7 +1293,7 @@ void opj_dwt_calc_explicit_stepsizes(opj
+         if (tccp->qntsty == J2K_CCP_QNTSTY_NOQNT) {
+             stepsize = 1.0;
+         } else {
+-            OPJ_FLOAT64 norm = opj_dwt_norms_real[orient][level];
++            OPJ_FLOAT64 norm = opj_dwt_getnorm_real(level, orient);
+             stepsize = (1 << (gain)) / norm;
+         }
+         opj_dwt_encode_stepsize((OPJ_INT32) floor(stepsize * 8192.0),
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27841.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27841.patch
new file mode 100644
index 0000000000..db6d12dc2c
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27841.patch
@@ -0,0 +1,238 @@
+From 00383e162ae2f8fc951f5745bf1011771acb8dce Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Wed, 2 Dec 2020 14:02:17 +0100
+Subject: [PATCH] pi.c: avoid out of bounds access with POC (refs
+ https://github.com/uclouvain/openjpeg/issues/1293#issuecomment-737122836)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27841
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/pi.c | 49 +++++++++++++++++++++++++++++---------------
+ src/lib/openjp2/pi.h | 10 +++++++--
+ src/lib/openjp2/t2.c |  4 ++--
+ 3 files changed, 42 insertions(+), 21 deletions(-)
+
+--- a/src/lib/openjp2/pi.c
++++ b/src/lib/openjp2/pi.c
+@@ -192,10 +192,12 @@ static void opj_get_all_encoding_paramet
+  * @param   p_image     the image used to initialize the packet iterator (in fact only the number of components is relevant.
+  * @param   p_cp        the coding parameters.
+  * @param   tileno  the index of the tile from which creating the packet iterator.
++ * @param   manager Event manager
+  */
+ static opj_pi_iterator_t * opj_pi_create(const opj_image_t *p_image,
+         const opj_cp_t *p_cp,
+-        OPJ_UINT32 tileno);
++        OPJ_UINT32 tileno,
++        opj_event_mgr_t* manager);
+ /**
+  * FIXME DOC
+  */
+@@ -230,12 +232,6 @@ static OPJ_BOOL opj_pi_check_next_level(
+ ==========================================================
+ */
+ 
+-static void opj_pi_emit_error(opj_pi_iterator_t * pi, const char* msg)
+-{
+-    (void)pi;
+-    (void)msg;
+-}
+-
+ static OPJ_BOOL opj_pi_next_lrcp(opj_pi_iterator_t * pi)
+ {
+     opj_pi_comp_t *comp = NULL;
+@@ -272,7 +268,7 @@ static OPJ_BOOL opj_pi_next_lrcp(opj_pi_
+                     /* include should be resized when a POC arises, or */
+                     /* the POC should be rejected */
+                     if (index >= pi->include_size) {
+-                        opj_pi_emit_error(pi, "Invalid access to pi->include");
++                        opj_event_msg(pi->manager, EVT_ERROR, "Invalid access to pi->include");
+                         return OPJ_FALSE;
+                     }
+                     if (!pi->include[index]) {
+@@ -318,7 +314,7 @@ static OPJ_BOOL opj_pi_next_rlcp(opj_pi_
+                     index = pi->layno * pi->step_l + pi->resno * pi->step_r + pi->compno *
+                             pi->step_c + pi->precno * pi->step_p;
+                     if (index >= pi->include_size) {
+-                        opj_pi_emit_error(pi, "Invalid access to pi->include");
++                        opj_event_msg(pi->manager, EVT_ERROR, "Invalid access to pi->include");
+                         return OPJ_FALSE;
+                     }
+                     if (!pi->include[index]) {
+@@ -449,7 +445,7 @@ static OPJ_BOOL opj_pi_next_rpcl(opj_pi_
+                         index = pi->layno * pi->step_l + pi->resno * pi->step_r + pi->compno *
+                                 pi->step_c + pi->precno * pi->step_p;
+                         if (index >= pi->include_size) {
+-                            opj_pi_emit_error(pi, "Invalid access to pi->include");
++                            opj_event_msg(pi->manager, EVT_ERROR, "Invalid access to pi->include");
+                             return OPJ_FALSE;
+                         }
+                         if (!pi->include[index]) {
+@@ -473,6 +469,13 @@ static OPJ_BOOL opj_pi_next_pcrl(opj_pi_
+     opj_pi_resolution_t *res = NULL;
+     OPJ_UINT32 index = 0;
+ 
++    if (pi->poc.compno0 >= pi->numcomps ||
++            pi->poc.compno1 >= pi->numcomps + 1) {
++        opj_event_msg(pi->manager, EVT_ERROR,
++                      "opj_pi_next_pcrl(): invalid compno0/compno1");
++        return OPJ_FALSE;
++    }
++
+     if (!pi->first) {
+         comp = &pi->comps[pi->compno];
+         goto LABEL_SKIP;
+@@ -580,7 +583,7 @@ static OPJ_BOOL opj_pi_next_pcrl(opj_pi_
+                         index = pi->layno * pi->step_l + pi->resno * pi->step_r + pi->compno *
+                                 pi->step_c + pi->precno * pi->step_p;
+                         if (index >= pi->include_size) {
+-                            opj_pi_emit_error(pi, "Invalid access to pi->include");
++                            opj_event_msg(pi->manager, EVT_ERROR, "Invalid access to pi->include");
+                             return OPJ_FALSE;
+                         }
+                         if (!pi->include[index]) {
+@@ -604,6 +607,13 @@ static OPJ_BOOL opj_pi_next_cprl(opj_pi_
+     opj_pi_resolution_t *res = NULL;
+     OPJ_UINT32 index = 0;
+ 
++    if (pi->poc.compno0 >= pi->numcomps ||
++            pi->poc.compno1 >= pi->numcomps + 1) {
++        opj_event_msg(pi->manager, EVT_ERROR,
++                      "opj_pi_next_cprl(): invalid compno0/compno1");
++        return OPJ_FALSE;
++    }
++
+     if (!pi->first) {
+         comp = &pi->comps[pi->compno];
+         goto LABEL_SKIP;
+@@ -708,7 +718,7 @@ static OPJ_BOOL opj_pi_next_cprl(opj_pi_
+                         index = pi->layno * pi->step_l + pi->resno * pi->step_r + pi->compno *
+                                 pi->step_c + pi->precno * pi->step_p;
+                         if (index >= pi->include_size) {
+-                            opj_pi_emit_error(pi, "Invalid access to pi->include");
++                            opj_event_msg(pi->manager, EVT_ERROR, "Invalid access to pi->include");
+                             return OPJ_FALSE;
+                         }
+                         if (!pi->include[index]) {
+@@ -981,7 +991,8 @@ static void opj_get_all_encoding_paramet
+ 
+ static opj_pi_iterator_t * opj_pi_create(const opj_image_t *image,
+         const opj_cp_t *cp,
+-        OPJ_UINT32 tileno)
++        OPJ_UINT32 tileno,
++        opj_event_mgr_t* manager)
+ {
+     /* loop*/
+     OPJ_UINT32 pino, compno;
+@@ -1015,6 +1026,8 @@ static opj_pi_iterator_t * opj_pi_create
+     l_current_pi = l_pi;
+     for (pino = 0; pino < l_poc_bound ; ++pino) {
+ 
++        l_current_pi->manager = manager;
++
+         l_current_pi->comps = (opj_pi_comp_t*) opj_calloc(image->numcomps,
+                               sizeof(opj_pi_comp_t));
+         if (! l_current_pi->comps) {
+@@ -1352,7 +1365,8 @@ static OPJ_BOOL opj_pi_check_next_level(
+ */
+ opj_pi_iterator_t *opj_pi_create_decode(opj_image_t *p_image,
+                                         opj_cp_t *p_cp,
+-                                        OPJ_UINT32 p_tile_no)
++                                        OPJ_UINT32 p_tile_no,
++                                        opj_event_mgr_t* manager)
+ {
+     OPJ_UINT32 numcomps = p_image->numcomps;
+ 
+@@ -1407,7 +1421,7 @@ opj_pi_iterator_t *opj_pi_create_decode(
+     }
+ 
+     /* memory allocation for pi */
+-    l_pi = opj_pi_create(p_image, p_cp, p_tile_no);
++    l_pi = opj_pi_create(p_image, p_cp, p_tile_no, manager);
+     if (!l_pi) {
+         opj_free(l_tmp_data);
+         opj_free(l_tmp_ptr);
+@@ -1552,7 +1566,8 @@ opj_pi_iterator_t *opj_pi_create_decode(
+ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *p_image,
+         opj_cp_t *p_cp,
+         OPJ_UINT32 p_tile_no,
+-        J2K_T2_MODE p_t2_mode)
++        J2K_T2_MODE p_t2_mode,
++        opj_event_mgr_t* manager)
+ {
+     OPJ_UINT32 numcomps = p_image->numcomps;
+ 
+@@ -1606,7 +1621,7 @@ opj_pi_iterator_t *opj_pi_initialise_enc
+     }
+ 
+     /* memory allocation for pi*/
+-    l_pi = opj_pi_create(p_image, p_cp, p_tile_no);
++    l_pi = opj_pi_create(p_image, p_cp, p_tile_no, manager);
+     if (!l_pi) {
+         opj_free(l_tmp_data);
+         opj_free(l_tmp_ptr);
+--- a/src/lib/openjp2/pi.h
++++ b/src/lib/openjp2/pi.h
+@@ -107,6 +107,8 @@ typedef struct opj_pi_iterator {
+     OPJ_INT32 x, y;
+     /** FIXME DOC*/
+     OPJ_UINT32 dx, dy;
++    /** event manager */
++    opj_event_mgr_t* manager;
+ } opj_pi_iterator_t;
+ 
+ /** @name Exported functions */
+@@ -119,13 +121,15 @@ typedef struct opj_pi_iterator {
+  * @param   cp      the coding parameters.
+  * @param   tileno  index of the tile being encoded.
+  * @param   t2_mode the type of pass for generating the packet iterator
++ * @param   manager Event manager
+  *
+  * @return  a list of packet iterator that points to the first packet of the tile (not true).
+ */
+ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *image,
+         opj_cp_t *cp,
+         OPJ_UINT32 tileno,
+-        J2K_T2_MODE t2_mode);
++        J2K_T2_MODE t2_mode,
++        opj_event_mgr_t* manager);
+ 
+ /**
+  * Updates the encoding parameters of the codec.
+@@ -161,12 +165,14 @@ Create a packet iterator for Decoder
+ @param image Raw image for which the packets will be listed
+ @param cp Coding parameters
+ @param tileno Number that identifies the tile for which to list the packets
++@param manager Event manager
+ @return Returns a packet iterator that points to the first packet of the tile
+ @see opj_pi_destroy
+ */
+ opj_pi_iterator_t *opj_pi_create_decode(opj_image_t * image,
+                                         opj_cp_t * cp,
+-                                        OPJ_UINT32 tileno);
++                                        OPJ_UINT32 tileno,
++                                        opj_event_mgr_t* manager);
+ /**
+  * Destroys a packet iterator array.
+  *
+--- a/src/lib/openjp2/t2.c
++++ b/src/lib/openjp2/t2.c
+@@ -244,7 +244,7 @@ OPJ_BOOL opj_t2_encode_packets(opj_t2_t*
+                             l_image->numcomps : 1;
+     OPJ_UINT32 l_nb_pocs = l_tcp->numpocs + 1;
+ 
+-    l_pi = opj_pi_initialise_encode(l_image, l_cp, p_tile_no, p_t2_mode);
++    l_pi = opj_pi_initialise_encode(l_image, l_cp, p_tile_no, p_t2_mode, p_manager);
+     if (!l_pi) {
+         return OPJ_FALSE;
+     }
+@@ -405,7 +405,7 @@ OPJ_BOOL opj_t2_decode_packets(opj_tcd_t
+ #endif
+ 
+     /* create a packet iterator */
+-    l_pi = opj_pi_create_decode(l_image, l_cp, p_tile_no);
++    l_pi = opj_pi_create_decode(l_image, l_cp, p_tile_no, p_manager);
+     if (!l_pi) {
+         return OPJ_FALSE;
+     }
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27842.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27842.patch
new file mode 100644
index 0000000000..6984aa8602
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27842.patch
@@ -0,0 +1,31 @@
+From fbd30b064f8f9607d500437b6fedc41431fd6cdc Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 1 Dec 2020 19:51:35 +0100
+Subject: [PATCH] opj_t2_encode_packet(): avoid out of bound access of #1294,
+ but likely not the proper fix
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27842
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/t2.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+--- a/src/lib/openjp2/t2.c
++++ b/src/lib/openjp2/t2.c
+@@ -711,6 +711,15 @@ static OPJ_BOOL opj_t2_encode_packet(OPJ
+                 continue;
+             }
+ 
++            /* Avoid out of bounds access of https://github.com/uclouvain/openjpeg/issues/1294 */
++            /* but likely not a proper fix. */
++            if (precno >= res->pw * res->ph) {
++                opj_event_msg(p_manager, EVT_ERROR,
++                              "opj_t2_encode_packet(): accessing precno=%u >= %u\n",
++                              precno, res->pw * res->ph);
++                return OPJ_FALSE;
++            }
++
+             prc = &band->precincts[precno];
+             opj_tgt_reset(prc->incltree);
+             opj_tgt_reset(prc->imsbtree);
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27843.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27843.patch
new file mode 100644
index 0000000000..53c86ea5e4
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27843.patch
@@ -0,0 +1,31 @@
+From 38d661a3897052c7ff0b39b30c29cb067e130121 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Wed, 2 Dec 2020 13:13:26 +0100
+Subject: [PATCH] opj_t2_encode_packet(): avoid out of bound access of #1297,
+ but likely not the proper fix
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27843
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/t2.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+--- a/src/lib/openjp2/t2.c
++++ b/src/lib/openjp2/t2.c
+@@ -787,6 +787,15 @@ static OPJ_BOOL opj_t2_encode_packet(OPJ
+             continue;
+         }
+ 
++        /* Avoid out of bounds access of https://github.com/uclouvain/openjpeg/issues/1297 */
++        /* but likely not a proper fix. */
++        if (precno >= res->pw * res->ph) {
++            opj_event_msg(p_manager, EVT_ERROR,
++                          "opj_t2_encode_packet(): accessing precno=%u >= %u\n",
++                          precno, res->pw * res->ph);
++            return OPJ_FALSE;
++        }
++
+         prc = &band->precincts[precno];
+         l_nb_blocks = prc->cw * prc->ch;
+         cblk = prc->cblks.enc;
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27845.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27845.patch
new file mode 100644
index 0000000000..a1aa49a217
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-27845.patch
@@ -0,0 +1,74 @@
+From 8f5aff1dff510a964d3901d0fba281abec98ab63 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Fri, 4 Dec 2020 20:45:25 +0100
+Subject: [PATCH] pi.c: avoid out of bounds access with POC (fixes #1302)
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/openjpeg2/2.3.1-1ubuntu4.20.04.1/openjpeg2_2.3.1-1ubuntu4.20.04.1.debian.tar.xz]
+CVE: CVE-2020-27845
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ src/lib/openjp2/pi.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+--- a/src/lib/openjp2/pi.c
++++ b/src/lib/openjp2/pi.c
+@@ -238,6 +238,13 @@ static OPJ_BOOL opj_pi_next_lrcp(opj_pi_
+     opj_pi_resolution_t *res = NULL;
+     OPJ_UINT32 index = 0;
+ 
++    if (pi->poc.compno0 >= pi->numcomps ||
++            pi->poc.compno1 >= pi->numcomps + 1) {
++        opj_event_msg(pi->manager, EVT_ERROR,
++                      "opj_pi_next_lrcp(): invalid compno0/compno1\n");
++        return OPJ_FALSE;
++    }
++
+     if (!pi->first) {
+         comp = &pi->comps[pi->compno];
+         res = &comp->resolutions[pi->resno];
+@@ -291,6 +298,13 @@ static OPJ_BOOL opj_pi_next_rlcp(opj_pi_
+     opj_pi_resolution_t *res = NULL;
+     OPJ_UINT32 index = 0;
+ 
++    if (pi->poc.compno0 >= pi->numcomps ||
++            pi->poc.compno1 >= pi->numcomps + 1) {
++        opj_event_msg(pi->manager, EVT_ERROR,
++                      "opj_pi_next_rlcp(): invalid compno0/compno1\n");
++        return OPJ_FALSE;
++    }
++
+     if (!pi->first) {
+         comp = &pi->comps[pi->compno];
+         res = &comp->resolutions[pi->resno];
+@@ -337,6 +351,13 @@ static OPJ_BOOL opj_pi_next_rpcl(opj_pi_
+     opj_pi_resolution_t *res = NULL;
+     OPJ_UINT32 index = 0;
+ 
++    if (pi->poc.compno0 >= pi->numcomps ||
++            pi->poc.compno1 >= pi->numcomps + 1) {
++        opj_event_msg(pi->manager, EVT_ERROR,
++                      "opj_pi_next_rpcl(): invalid compno0/compno1\n");
++        return OPJ_FALSE;
++    }
++
+     if (!pi->first) {
+         goto LABEL_SKIP;
+     } else {
+@@ -472,7 +493,7 @@ static OPJ_BOOL opj_pi_next_pcrl(opj_pi_
+     if (pi->poc.compno0 >= pi->numcomps ||
+             pi->poc.compno1 >= pi->numcomps + 1) {
+         opj_event_msg(pi->manager, EVT_ERROR,
+-                      "opj_pi_next_pcrl(): invalid compno0/compno1");
++                      "opj_pi_next_pcrl(): invalid compno0/compno1\n");
+         return OPJ_FALSE;
+     }
+ 
+@@ -610,7 +631,7 @@ static OPJ_BOOL opj_pi_next_cprl(opj_pi_
+     if (pi->poc.compno0 >= pi->numcomps ||
+             pi->poc.compno1 >= pi->numcomps + 1) {
+         opj_event_msg(pi->manager, EVT_ERROR,
+-                      "opj_pi_next_cprl(): invalid compno0/compno1");
++                      "opj_pi_next_cprl(): invalid compno0/compno1\n");
+         return OPJ_FALSE;
+     }
+ 
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
index 2fdcec0ec2..218dc911fe 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
@@ -8,8 +8,21 @@ DEPENDS = "libpng tiff lcms zlib"
 SRC_URI = " \
     git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+    file://CVE-2019-12973-1.patch \
+    file://CVE-2019-12973-2.patch \
     file://CVE-2020-6851.patch \
     file://CVE-2020-8112.patch \
+    file://CVE-2020-15389.patch \
+    file://CVE-2020-27814-1.patch \
+    file://CVE-2020-27814-2.patch \
+    file://CVE-2020-27814-3.patch \
+    file://CVE-2020-27814-4.patch \
+    file://CVE-2020-27823.patch \
+    file://CVE-2020-27824.patch \
+    file://CVE-2020-27841.patch \
+    file://CVE-2020-27842.patch \
+    file://CVE-2020-27843.patch \
+    file://CVE-2020-27845.patch \
 "
 SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
 S = "${WORKDIR}/git"
-- 
2.17.1


