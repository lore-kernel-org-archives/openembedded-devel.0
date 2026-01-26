Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CD2D13C0D
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19487.1769432713520489103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjRTkVVx;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43591b55727so4336145f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432712; x=1770037512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABkfWZB9/uQgguQ3Qx8ZzzksVXGhimak7R+HN9AUogA=;
        b=WjRTkVVxT4Hrlvg3gmbshC7Xhl3J4bnuNYGfByf/12vwiULNg8akGSymf5tj8NB95N
         RAZ3IzhpVMYkVgSmWKN3UL4xMDTm6oQ95GjK/sK3GOSP2oHDGdkNd3qfWs6Bx7zIT1d2
         800XCnBFNEOWchkMQuOETPw2q0QZuaxKunWp9cCXnHtXYO0CQsCr+cuAq3/Jm3cW/y2Z
         iJL3Yju5jFpzneNpND3Ji6/KzD303TUp43ieW6ZQNsrAeFco/Nlep3MuTzjFbTa3o4kf
         DGbnDo4jCbkU/dXt+DdP1P5GvbzR5tCmUszOaEzy1fDXm4GLSF3tMnyicnRI7Qf6l4D5
         FvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432712; x=1770037512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABkfWZB9/uQgguQ3Qx8ZzzksVXGhimak7R+HN9AUogA=;
        b=EOD5qTW5F/C95nRMGqJL7dT5kmHJx2NEUVOEo/ZEtf/hQdwtkyXx1I1GKuSXqe/PKZ
         Ec5KhTW1nQPSoykNUeHHa9u0YNYjIzBOmFq8MlywtDvB/hvKTb/0QXTI6o9FfXlanBPe
         etFTSNOcvv2stt4/mPJnAtDorKjoUcKOGh+EwV1YkeD5KWOG/W5vfeEdRf9uiNxPme/R
         LhatyMdYHyqq2i2ffea7n802Ibcrje4itOOHIeP8zqq4C+AB2Q5lPzMyFWTvH6I+bAWE
         jnrKjD2VsiwK6DsOR6SkRROVFalgk4EeQgDWZTfYmr3YcZfk7yOXC0mQWjzGeSCwyhM3
         fjTQ==
X-Gm-Message-State: AOJu0Yx5+YeFJ3ZjybqFXK4o6SkZjS+JJSEFY841T+u6+fSuH5Td/A7b
	oenGLOg6Fo5ouedpXAF3xxLsHyBrknZU/hOYkRMtP57N6ZpZwokYYpCEnT0vGg==
X-Gm-Gg: AZuq6aLUtlUviafPytauCISfH9anv/yXbeVeuw0XKKelnWk9M/tOgGQ8madujY0V0I8
	Wi8bj98HLWVUZ1fhniytnnMq0PzNyuH6SpJlGrcZg0/Hb64C+Be/r2eZnqtCoZXG++IBoEetGX3
	w6pc45DSgo/8QYFwgYN+U5SSsFXALy7/zmJYpxECb8xqd6qhCYlMwVdqaj63RHV46uem/r5y7fs
	6i5e6ofYi/RSrUm7+mS+ggfjMmwhXmWYPKC2chiaAY6WccL+vsznxsWh3rqYt2bHP0zskm8JBIc
	t+6ddE3nXRCBCTqKAg/I1KuBHUrQTtpLvPeqqMPQG7c0/ddfLXSZEODsFFtSpwEiirm22YAZHJH
	Oj+JszSUn5OkBh7zp6EYOKEcboIpp4+YZKZiSD5qzE88M7tIXPRfgT6ok3bYUhClYCK4tRNEeBe
	LULue7STABHPtqu3HuiTQ=
X-Received: by 2002:a5d:6e0e:0:b0:435:ae97:b31 with SMTP id ffacd0b85a97d-435ca125bc2mr5260677f8f.2.1769432711807;
        Mon, 26 Jan 2026 05:05:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 06/11] sox: patch CVE-2017-15372
Date: Mon, 26 Jan 2026 14:05:00 +0100
Message-ID: <20260126130506.82699-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123883

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-15372

Pick the patch that was indeitified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-15372

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-15372.patch              | 100 ++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15372.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15372.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15372.patch
new file mode 100644
index 0000000000..168fded39f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15372.patch
@@ -0,0 +1,100 @@
+From 13086aa971f5a0a5a644323456a90a9fa96e03c3 Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Wed, 8 Nov 2017 00:27:46 +0000
+Subject: [PATCH] adpcm: fix stack overflow with >4 channels (CVE-2017-15372)
+
+CVE: CVE-2017-15372
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/001c337552912d286ba68086ac378f6fdc1e8b50]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/adpcm.c | 8 +++++++-
+ src/adpcm.h | 3 +++
+ src/wav.c   | 5 ++++-
+ 3 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/adpcm.c b/src/adpcm.c
+index 2e13867..f64b7d5 100644
+--- a/src/adpcm.c
++++ b/src/adpcm.c
+@@ -71,6 +71,11 @@ const short lsx_ms_adpcm_i_coef[7][2] = {
+                         { 392,-232}
+ };
+ 
++extern void *lsx_ms_adpcm_alloc(unsigned chans)
++{
++        return lsx_malloc(chans * sizeof(MsState_t));
++}
++
+ static inline sox_sample_t AdpcmDecode(sox_sample_t c, MsState_t *state,
+                                sox_sample_t sample1, sox_sample_t sample2)
+ {
+@@ -102,6 +107,7 @@ static inline sox_sample_t AdpcmDecode(sox_sample_t c, MsState_t *state,
+ 
+ /* lsx_ms_adpcm_block_expand_i() outputs interleaved samples into one output buffer */
+ const char *lsx_ms_adpcm_block_expand_i(
++        void *priv,
+         unsigned chans,          /* total channels             */
+         int nCoef,
+         const short *coef,
+@@ -113,7 +119,7 @@ const char *lsx_ms_adpcm_block_expand_i(
+   const unsigned char *ip;
+   unsigned ch;
+   const char *errmsg = NULL;
+-  MsState_t state[4];  /* One decompressor state for each channel */
++  MsState_t *state = priv;  /* One decompressor state for each channel */
+ 
+   /* Read the four-byte header for each channel */
+   ip = ibuff;
+diff --git a/src/adpcm.h b/src/adpcm.h
+index af4d6f0..db5cc61 100644
+--- a/src/adpcm.h
++++ b/src/adpcm.h
+@@ -29,8 +29,11 @@
+ /* default coef sets */
+ extern const short lsx_ms_adpcm_i_coef[7][2];
+ 
++extern void *lsx_ms_adpcm_alloc(unsigned chans);
++
+ /* lsx_ms_adpcm_block_expand_i() outputs interleaved samples into one output buffer */
+ extern const char *lsx_ms_adpcm_block_expand_i(
++	void *priv,
+ 	unsigned chans,          /* total channels             */
+ 	int nCoef,
+ 	const short *coef,
+diff --git a/src/wav.c b/src/wav.c
+index fad334c..066be6d 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -82,6 +82,7 @@ typedef struct {
+     /* following used by *ADPCM wav files */
+     unsigned short nCoefs;          /* ADPCM: number of coef sets */
+     short         *lsx_ms_adpcm_i_coefs;          /* ADPCM: coef sets           */
++    void          *ms_adpcm_data;   /* Private data of adpcm decoder */
+     unsigned char *packet;          /* Temporary buffer for packets */
+     short         *samples;         /* interleaved samples buffer */
+     short         *samplePtr;       /* Pointer to current sample  */
+@@ -175,7 +176,7 @@ static unsigned short  AdpcmReadBlock(sox_format_t * ft)
+         }
+     }
+ 
+-    errmsg = lsx_ms_adpcm_block_expand_i(ft->signal.channels, wav->nCoefs, wav->lsx_ms_adpcm_i_coefs, wav->packet, wav->samples, samplesThisBlock);
++    errmsg = lsx_ms_adpcm_block_expand_i(wav->ms_adpcm_data, ft->signal.channels, wav->nCoefs, wav->lsx_ms_adpcm_i_coefs, wav->packet, wav->samples, samplesThisBlock);
+ 
+     if (errmsg)
+         lsx_warn("%s", errmsg);
+@@ -791,6 +792,7 @@ static int startread(sox_format_t * ft)
+ 
+         /* nCoefs, lsx_ms_adpcm_i_coefs used by adpcm.c */
+         wav->lsx_ms_adpcm_i_coefs = lsx_malloc(wav->nCoefs * 2 * sizeof(short));
++        wav->ms_adpcm_data = lsx_ms_adpcm_alloc(wChannels);
+         {
+             int i, errct=0;
+             for (i=0; len>=2 && i < 2*wav->nCoefs; i++) {
+@@ -1216,6 +1218,7 @@ static int stopread(sox_format_t * ft)
+     free(wav->packet);
+     free(wav->samples);
+     free(wav->lsx_ms_adpcm_i_coefs);
++    free(wav->ms_adpcm_data);
+     free(wav->comment);
+     wav->comment = NULL;
+ 
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 4c5452427e..96d0543520 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-11359.patch \
            file://CVE-2017-15370.patch \
            file://CVE-2017-15371.patch \
+           file://CVE-2017-15372.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

