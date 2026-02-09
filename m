Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79407EE6B75
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45789.1770637150782971353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZYE1WgD;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso41308445e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637149; x=1771241949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3quIq54SWlsHcRze8iVgWm29nZx60j4FIFT9PZv3RXo=;
        b=iZYE1WgD+TzV1+gDpw1YNMWRLE59qm8rJUW7u3jeVxYhxJH9WQZRFvoS1GJyXDOc9t
         EOzh0e0NvbWjxkbr1ONJmZkadVCxZcXxzHcnsNLhURQMOriTqEqK03BbEMjOAoP+MLIv
         iJ0+O8gguN8lzINhGeSsTIyL2Bu/wgzTypC1gymIGH5FM9W/yJV4cs/Id/7ju8r7xstU
         s7ooGzx81CYu9BsQF4BSoOZ0TstiMgQ1wSwgCqh+0fuqac8ld5/usqPzTxpIjngW386P
         VLXJeMKug0kxAzI1HSTrI2gxDdSNtTBY6b0rv3YzsI9e0KpEr70n/oqmGuFL07vgppub
         gFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637149; x=1771241949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3quIq54SWlsHcRze8iVgWm29nZx60j4FIFT9PZv3RXo=;
        b=gGD5dX1gQxbXNSKRey1I5WeFt4IUl2yDRaLopvvWq8gdziOQ4/9BSLPDJjaDq0RD1B
         W2LPSCdXtShKvmvAwx8+Ui7ryEndIVZn9Ikc7C9qNZqrSVUpg/bpNv4OxT2k91r/m003
         TjFpEdnlcIu+CdB3TGz6ivDijbczMWorRYHGSTgjWzW0ri4je8rrV78gUNAdDl/6ZfuL
         M+iJM2WN7ELvwJphkAGYMFPcP7rltAPGFsNulHHscI/ly/dERDJdQsSDH/SvcqkmVxDi
         Vsj456MJeyDOxJ4/x8wtd54L1yYLIhYFQTROpBg5Y6VhRJRVL+s7gVTDK3ODDm2kuzUu
         wmFw==
X-Gm-Message-State: AOJu0YxLXoOaYtV+jDhrFdkuOtn0Cm6AWXUpjbr40swaMJNbTE52ctnh
	0JO5rFWg97rxlDUJcBp0yyfeXKpdOWFMYkP+jQZcobMBYJezi4mH1K67zR29ng==
X-Gm-Gg: AZuq6aKYaLabxeAeuT06m322nulmM87jn/xgXwAcvNAuZ7xHYAUn/UaBd3oXhYo/EwQ
	PaAmzQYIRtXaF7Mr9qh/AXcuMlcggwSKsGvVoCxusN68uYaOh5OHygsrKXjBRzI5G6+AqInv4Py
	FEWMg536nlXd2Gvs+rSMxmYUSvteNsTFDIGgze8mYM/QUm0ym5AqBkTD2kRPTp1hgW1r9Kp47OO
	tczBmLOO+243SCvZAaKCJVNhvI3Ue9/zggaqEowePfC90cOGFAkkcPhitg7Awj55Xty1HjlzLC5
	EPWOKLcup6bUYm9i0o9i9vJ3wRt50m7JEY/BbP5ejre5MomGwKH7OXEv62v2U9z1k2LkM/KNv5s
	sagnRsAfmdhD7fFyyzAFaVSACHc1Lyx+C6wqsw8CtBxVI2RM+IZFDAiakZUqFMII2W5eeGvdfQh
	Z0xAxWGC14
X-Received: by 2002:a7b:c3d5:0:b0:47e:e38b:a83 with SMTP id 5b1f17b1804b1-483178ebf8emr137320715e9.7.1770637148972;
        Mon, 09 Feb 2026 03:39:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 06/16] sox: patch CVE-2017-15372
Date: Mon,  9 Feb 2026 12:38:53 +0100
Message-ID: <20260209113904.3442496-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124301

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
index a03b346211..b721d84332 100644
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

