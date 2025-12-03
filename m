Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4D8D1BDF5
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27326.1764797393580082757
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOMOWkb+;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso8475165e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797392; x=1765402192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4VR/8bfNzcGWp06NlP6lVIOwy6DDULCS8l06CsilrI=;
        b=dOMOWkb+0Vs3g/atb4qjVUfcmvQxZrWe6lX98gw68Vhe3fhwki/NGVh2zU7x2o0GKc
         uZnUG0x4KV4Nz8R1xDcdr967T8FD4r1EQTkJk2jebBkSFJ8Q85vPSwwgh1dTR50A+pmQ
         IyRALVcG65bxlWdP/yJ1shNARx4MFF8X9Id9X/AEri3ZfmwqqUM912s8K3cNpW6TcjhR
         Or1ZtGSIuBOCTjFq42jsEZWmvf30TUumEYzeIIZD9u2WDGNCvJT19c/2GbWGOMlUO+SD
         0aX4uDmS0ijhkZE6TCyopAYpJpZeTI7VjfIfG6HX0NzLWqtDzId5jXQkOvGOx/jzlh8n
         CZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797392; x=1765402192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w4VR/8bfNzcGWp06NlP6lVIOwy6DDULCS8l06CsilrI=;
        b=L+jKqCHDLOLOA+b5EXwZVAEvYMnIwz7QtZ4X2HIbI6D1jZOIjfTf7V1XehUJ41gvf3
         dYQRP92Tz1zg7NYootKBEO6jBMJidZQVOEd4+jKj3cWLK8JMnFdPBioE9DNV80eN5gNz
         krw7IG6Vc8//Dr/fywhYFouHrSrMKLvrjCXFjuXZxzMXI6pxyd/84nMCqfa97Hs8LxyS
         C2ThZ6kfHsZIQI8qxcEdHVKyDY6aciqgdUmM4G6X4dgkTp37b2WN7rxamzWvhMjTBxY8
         qbSwmIS8zPIzlyAdCBqTqKCdRPu8TzVkmBlvlP7mhSkLquxo27J8OPxyDZi+AhqT1S5I
         B7tg==
X-Gm-Message-State: AOJu0Yzm/H0X0scEvXsiN7+ygRMnASMQAywIH6ddm81TzZo1eQUPfkVu
	uPsUuM3ZrSlp66gEYYyjHzP9jxQ8h6sPBuRixmTwOgzBvTl6sH9R2iyk56pXnQ==
X-Gm-Gg: ASbGncvEh5vwwdkilWSSGYlXRJQrdc3gAl4F6jupaTHhl3V3oCi21I5vJ+TjJSZpe/j
	D1ovxz24Wfu7LbbaMREMuwjEI+Ij7GrmMppRBAmyQ4T6iCHJg6ytPNTzRJUe5XSNsIq3G3lxUVR
	DpCzBawCIO/2lLsPtX+D1QYFNEYXW/q8sxK2F93SXoEkXzxoplNsA3ybstLeH744mer6fmismm4
	uDEUTEbaZ6hyyFYa8lN0kBJTvz2zACsJLgr46E7e9X1BRzYBo7S7dw28UFVxsxOPnY2o78TkINR
	YPgJcrD0SiN4q1gei8RwLMLjs9RxnCvpmWBDLvXitd9/bq1T0lteKF0V5CD075CfuahTc/AZ0r4
	t0P/oSrd8+wGO4RoBu21nVcfLv8+2D7LA6OiR+LYjzxzj9q1Nc4pqYlXu3bKukZj2UFLEmu8mYg
	DKkKFqTUvvgct11HFhqDM=
X-Google-Smtp-Source: AGHT+IHnL3iggyamvRSFnhSgGUlhE+MgV/VLWqUrXfha6ksISpF3VOw+7VKvOJWqqk2gUVcfBfZVjA==
X-Received: by 2002:a5d:51cc:0:b0:429:ca7f:8d6f with SMTP id ffacd0b85a97d-42f78772702mr721357f8f.15.1764797391892;
        Wed, 03 Dec 2025 13:29:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 03/12] xrdp: patch CVE-2022-23478
Date: Wed,  3 Dec 2025 22:29:40 +0100
Message-ID: <20251203212949.4046524-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122281

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23478

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23478.patch            | 85 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
new file mode 100644
index 0000000000..9aaa7a4a7d
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
@@ -0,0 +1,85 @@
+From 6cb54a1c26b53617e1c79a0abc96d03c4add1eb8 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 11:12:42 +0000
+Subject: [PATCH] CVE-2022-23478
+
+Fix potential OOB write if invalid chansrv channel opened
+
+Also removed an unnecessary dynamic memory allocation
+
+CVE: CVE-2022-23478
+Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/6cb54a1c26b53617e1c79a0abc96d03c4add1eb8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..c91e03ab56 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -1360,7 +1360,7 @@ xrdp_mm_trans_process_drdynvc_channel_open(struct xrdp_mm *self,
+     int error;
+     int chan_id;
+     int chansrv_chan_id;
+-    char *name;
++    char name[1024 + 1];
+     struct xrdp_drdynvc_procs procs;
+ 
+     if (!s_check_rem(s, 2))
+@@ -1368,33 +1368,32 @@ xrdp_mm_trans_process_drdynvc_channel_open(struct xrdp_mm *self,
+         return 1;
+     }
+     in_uint32_le(s, name_bytes);
+-    if ((name_bytes < 1) || (name_bytes > 1024))
+-    {
+-        return 1;
+-    }
+-    name = g_new(char, name_bytes + 1);
+-    if (name == NULL)
++    if ((name_bytes < 1) || (name_bytes > (int)(sizeof(name) - 1)))
+     {
+         return 1;
+     }
+     if (!s_check_rem(s, name_bytes))
+     {
+-        g_free(name);
+         return 1;
+     }
+     in_uint8a(s, name, name_bytes);
+     name[name_bytes] = 0;
+     if (!s_check_rem(s, 8))
+     {
+-        g_free(name);
+         return 1;
+     }
+     in_uint32_le(s, flags);
+     in_uint32_le(s, chansrv_chan_id);
++    if (chansrv_chan_id < 0 || chansrv_chan_id > 255)
++    {
++        LOG(LOG_LEVEL_ERROR, "Attempting to open invalid chansrv channel %d",
++            chansrv_chan_id);
++        return 1;
++    }
++
+     if (flags == 0)
+     {
+         /* open static channel, not supported */
+-        g_free(name);
+         return 1;
+     }
+     else
+@@ -1410,13 +1409,11 @@ xrdp_mm_trans_process_drdynvc_channel_open(struct xrdp_mm *self,
+                                      &chan_id);
+         if (error != 0)
+         {
+-            g_free(name);
+             return 1;
+         }
+         self->xr2cr_cid_map[chan_id] = chansrv_chan_id;
+         self->cs2xr_cid_map[chansrv_chan_id] = chan_id;
+     }
+-    g_free(name);
+     return 0;
+ }
+ 
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 91d4134789..e28f457e87 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-mark-count-with-unused-attribute.patch \
            file://CVE-2022-23468.patch \
            file://CVE-2022-23477.patch \
+           file://CVE-2022-23478.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

