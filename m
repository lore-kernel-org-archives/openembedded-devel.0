Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEFED339A8
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35.1764954700387914465
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VN4Mgw9q;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so30060565e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954699; x=1765559499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnV+UTQmjKKm1MEqVX3Dx7vruytg6Xgvbsa/48G0dT8=;
        b=VN4Mgw9qDm7RJ+zEfp3Vv0DnM7fobrV+JvTgm2LKWT6wAeynP7on2LB1aRxnYvBYlH
         ZunKon+MK1auyzcOgCLQoWwqpRVkihw3384qQD/mEcDCHXCCxG0t560r3PkzWcrr4tmL
         dnkuTv0B5XH5xa8c3scz8L7++30QqqXNs/DZ2T3xD6vZnwDWZD9NniTCqUaPCYczQGbD
         f2sLIHl8p1t/r1e9fo5AIYXgmp9ApR8Db1+MYQ9Pweb7BNXWncA8zKU0HUDeiuRkemjD
         YONVsulwAXaSanH6dcxxwb9q42FW9NHXkpGdInsLKybiRCQIjQ9CF0Yk0f+PFebpgMBO
         LB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954699; x=1765559499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnV+UTQmjKKm1MEqVX3Dx7vruytg6Xgvbsa/48G0dT8=;
        b=jjMQw7Nf/uf63Ju8ZxEQ35+v6Qm/+cVrCZleu76wMqZ2J7jP/whfDVT3umkKuNaO91
         0rq4RAuLOgPSpuxzEuLL4wRZ4OnVQn++CHCFMx6TgzBUks1u+lI8HTX1iHK9lZ1KnFwk
         O/jiNC2G2mVMFIcfj6oTVTCOwyTmJ2jW9CRxlEmaJH0H91nh4B2lDucUXZCWjN/APLz7
         NId6Tv2nPGlkJc3ySuK+zCpyu2qI6j/9cTPN/ZV5VFq65lQLmNSXcBEh1MZxG4Jvt7a0
         NmFNbDkjYj92SlPRbqaUZzBi8IM1nba9IL/HvcDbUz01ZtZwPQ7iiuyBB+vTGxg7mldf
         dIRQ==
X-Gm-Message-State: AOJu0YxMiBHmKkHhBqh9/k/LVAxpS4uYBffzZNAQPBZunT55Xfvlg86P
	6hlZEygs1SHyoKx9ta7J7NLXRyjW3Zmx8qmZ2bbo0bbFw+NLQWgc5HvNx/cZqQ==
X-Gm-Gg: ASbGncsDoumrjzVbH6Fmugv5p0ryYcOaq2IEGj/GBlbRqFilifjMDf8zuqg1LzOcfSc
	NY+hNFuMBmcHwVMgMB7LS2oica6FUYjm7W32XozcJHOlvavSEFtP7rg5LmIaMZtXSuWD8EfuhSZ
	WlN+bI58z6AInjTou/NZ9+hkmjN9LAXL7sgEqUKPRdNSJPBH793JELoV92ux0DxLVNed/8JYXx/
	U/t912mOldDKSiY37zfjpnBBFz+FH+5wTZE3HkLHyiLDBrVb8h6G1mMuXcb/jnciXRk+0lFNwBH
	RY1AedCpOgpb0IGMI9kPe8B6CGKWF0QcD0LVEraDT5aToGT+AHbz6Wxyi8gkOgQw97PMNJZ4F7M
	rUzprLMPAZSmrTUsPYD9JaJsT4pqJciHPBWB/fmPU93Wd2YBHtlOxzN/Vc/uEGhjF3L8m9tL0OG
	1fRYbAJ9NL
X-Google-Smtp-Source: AGHT+IEB6PevQkFNjIHFaqLXDcgsdeTDJAMBRIyc7vzfHbg0Cpp1g/R/zZIOWRdAmHQBe0/dsRcp1g==
X-Received: by 2002:a05:600c:1381:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-47939df15eemr344385e9.2.1764954698632;
        Fri, 05 Dec 2025 09:11:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/10] xrdp: patch CVE-2022-23479
Date: Fri,  5 Dec 2025 18:11:29 +0100
Message-ID: <20251205171134.1346494-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122351

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23479

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23479.patch            | 83 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
new file mode 100644
index 0000000000..6940ce8f17
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
@@ -0,0 +1,83 @@
+From 60864014b733c10881c078048560858067fe5d0f Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 09:44:56 +0000
+Subject: [PATCH] CVE-2022-23479
+
+Detect attempts to overflow input buffer
+
+If application code hasn't properly sanitised the header_size
+for a transport, it is possible for read requests to be issued
+which overflow the input buffer. This change detects this
+at a low level and bounces the read request.
+
+CVE: CVE-2022-23479
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/60864014b733c10881c078048560858067fe5d0f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ common/trans.c | 19 +++++++++++++++----
+ common/trans.h |  2 +-
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/common/trans.c b/common/trans.c
+index 55d2a63812..1d2d3e68ae 100644
+--- a/common/trans.c
++++ b/common/trans.c
+@@ -297,8 +297,8 @@ trans_check_wait_objs(struct trans *self)
+     tbus in_sck = (tbus) 0;
+     struct trans *in_trans = (struct trans *) NULL;
+     int read_bytes = 0;
+-    int to_read = 0;
+-    int read_so_far = 0;
++    unsigned int to_read = 0;
++    unsigned int read_so_far = 0;
+     int rv = 0;
+     enum xrdp_source cur_source;
+ 
+@@ -369,13 +369,24 @@ trans_check_wait_objs(struct trans *self)
+         }
+         else if (self->trans_can_recv(self, self->sck, 0))
+         {
++            /* CVE-2022-23479 - check a malicious caller hasn't managed
++             * to set the header_size to an unreasonable value */
++            if (self->header_size > (unsigned int)self->in_s->size)
++            {
++                LOG(LOG_LEVEL_ERROR,
++                    "trans_check_wait_objs: Reading %u bytes beyond buffer",
++                    self->header_size - (unsigned int)self->in_s->size);
++                self->status = TRANS_STATUS_DOWN;
++                return 1;
++            }
++
+             cur_source = XRDP_SOURCE_NONE;
+             if (self->si != 0)
+             {
+                 cur_source = self->si->cur_source;
+                 self->si->cur_source = self->my_source;
+             }
+-            read_so_far = (int) (self->in_s->end - self->in_s->data);
++            read_so_far = self->in_s->end - self->in_s->data;
+             to_read = self->header_size - read_so_far;
+ 
+             if (to_read > 0)
+@@ -415,7 +426,7 @@ trans_check_wait_objs(struct trans *self)
+                 }
+             }
+ 
+-            read_so_far = (int) (self->in_s->end - self->in_s->data);
++            read_so_far = self->in_s->end - self->in_s->data;
+ 
+             if (read_so_far == self->header_size)
+             {
+diff --git a/common/trans.h b/common/trans.h
+index 1cd89fdac2..313c543b60 100644
+--- a/common/trans.h
++++ b/common/trans.h
+@@ -98,7 +98,7 @@ struct trans
+     ttrans_data_in trans_data_in;
+     ttrans_conn_in trans_conn_in;
+     void *callback_data;
+-    int header_size;
++    unsigned int header_size;
+     struct stream *in_s;
+     struct stream *out_s;
+     char *listen_filename;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 12918e1a1d..45023b9529 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23468.patch \
            file://CVE-2022-23477.patch \
            file://CVE-2022-23478.patch \
+           file://CVE-2022-23479.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

