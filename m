Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA84D1D897
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38232.1764835000012503771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SvpPuT15;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso2701305e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834998; x=1765439798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DK3TgY9prtERIlp+j/qFMzSTVWh4M5Ff+/yhWIT1eCQ=;
        b=SvpPuT15J3pgfys/S762Bnt/v4xS+FQtm0PNMeNHHZBSUbXd1U0l7qMOmje/xwoIEN
         2DzFkbTuoiyJOfFoA5Xb8vxa3O8GJFDLetml+u3WeEvarGyx1+QN3V+TkofOQlZatIqe
         xJOZHO3yadWi36shHkmiOaJX4dZ29wCJJaq6GT6IrT+YY41Rt2ZYV8DXtfXeIvuC8qyc
         3EpnxGmkRm+iZznh0y/Fxcri9Ub0XmRjkg5//3Qmo3ep6LP+yuHRT8JywRVITCdWLwaO
         3UsMS+prV+bj3O9jJT6Fa9cIMQrPJaP1UcOV4j1C/9zQQEfQ6gDPXxCo/9aVmZTYLitE
         a4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834998; x=1765439798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DK3TgY9prtERIlp+j/qFMzSTVWh4M5Ff+/yhWIT1eCQ=;
        b=HJdwYSEf5Stu6YmmU4Vs2RYcY4sXIQARqtgWIAk96SN8/szr+1vtD8YqKpbjcB+e08
         IpMWPDq6voSnTzBfdKwjHZBRbHqNWDgtW0XGubi9vQP2mHT5x3dzXOtCYuQDv+KENToT
         m7hgw5EXWA6Lck9NvJQhJPUbkvT7iVN8ADXsqNPnof49nvJPktFctzCXuXW6RMQigsTl
         kYBnC4Pk41FWwU24Zg+/iMwliOu1BG1NglhHdtkDPN4MBzb4nkPs52gaENEtcDOA34qf
         g6cX0aMIvdSVfsNgFn0oYBLZ9tTYKAZ/Ya4DvDpGCh3Grv4cUJuug9yFADRRN2V59z4f
         oKTg==
X-Gm-Message-State: AOJu0YwysHYRKjU0xNQHPrF1Sz9AFWmgSnLaDSj7xsjHHMZBgecAdn+r
	oo8IHVggzBRR4sa7i4GepEj8EvINKKX8xbt8hHcb1G0j0sQo9e5E/Js5/RwBTg==
X-Gm-Gg: ASbGncsN9J8SdmGXwIwk28aIBYmCWSdc4r9olKqQW7dchAOEXnIMnwTLqRiPKFqTEJt
	KV+eu0ru6+do4DGu5fEUKdsCZV+rLX/DTHBEcexnI8Bzy0oY9VTXVFAak8SnUuk7R7Zdu+T0WYn
	k9+OAD2JBNPjls4Xx9mFitxEW7CMFzJXQm4yqCOSp9c+obEudMuazDxudPCKHqDyeAUfz4zrzKg
	bFaA7xqQq/sc8wfhXh39I26N04zXN185S7fAaU6Rm4NsPMc+KeB88kYFdAkH/Y4U8nqmVriGFhU
	a5g1xHzQL4NiowXu2jPJSK9y4jDf1PxIjhOurZIoheMMJ4aZ6JMWorwZ+d+4fW4qMLCFnSvn4WN
	MNpcHXxnsg4SiEiIgvWBqDgtmkaIek5E2Giu5QPEHsnLCR++uEmpiBiEHtuHcHASCgvJzSNB0c4
	1J3m+Mnd28
X-Google-Smtp-Source: AGHT+IHy8fRg9PdYOaVzHRCqPggXX+FgqFL1NRtp0118eq1jfAPLXo4GFWbWu+6umh5cWaNgTDQg5A==
X-Received: by 2002:a05:600c:198a:b0:477:9fa0:74ed with SMTP id 5b1f17b1804b1-4792af3def9mr50417805e9.26.1764834998233;
        Wed, 03 Dec 2025 23:56:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 04/12] xrdp: patch CVE-2022-23479
Date: Thu,  4 Dec 2025 08:56:27 +0100
Message-ID: <20251204075635.1088007-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122306

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23479

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

 .../xrdp/xrdp/CVE-2022-23479.patch            | 83 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
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
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index e28f457e87..1900b1e842 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23468.patch \
            file://CVE-2022-23477.patch \
            file://CVE-2022-23478.patch \
+           file://CVE-2022-23479.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

