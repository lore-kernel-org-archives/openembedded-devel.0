Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3447D1D892
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38411.1764834999330772997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MOxxRTcp;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4572585e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834998; x=1765439798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDogIqOuwpIMy+QciMpEoV0InpE/y9Ake6vJ9VGiYgg=;
        b=MOxxRTcphkC10uD2BAs6TzON4xEQnfgtOWaFADSC9wAO20a7K4FcJACnGXtQgsc5dK
         aUi2TIZVvo39dJ8PhDY7vzHyG+apF8m/O/hk1lDxdysYKW9oDYGuJ2N7U0GcWEBqLlDa
         9POzicUXxl7J3HU5bjlcBS1nQfCrY1oF6aj/QrDB1f6TGbDNuBHshY6ol547RivNFDPQ
         wcscWkqHpuV1wG8lbyzNoHOylInd5G6KYDSGpZceeQ3I4oC6YrChCv4UygQ/QSzkZy6R
         +7Lei9A6BzZHXrIXrdXvuZ9b/rrSxrPE+cWGEkMZFSmM9tl1QZOnTFRfKbZN/XReNSRk
         GWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834998; x=1765439798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDogIqOuwpIMy+QciMpEoV0InpE/y9Ake6vJ9VGiYgg=;
        b=bFoRjcbISZAxH68CCxBDyqthscn2xxkg+oSVkxfSdjg+HyztYkvhqaav2kGXHSxUVV
         Tj6FHRLjc7utuusjsdFCyP0GZoHnMrZT238B4UrbXvpIBkf+gJl9NkTYZavVgNzXpXkx
         8jdwqAI1HqEv8aQVJfa9U+QDwKathNbZP/8kkpjgUpR/KiSp5N/C2cuDHYUGs1QjW/hG
         VRR1ryk0GN1jTqy7Hes4a6c7dE9e5boN6IxciC9QEK1JJhEHveWTf10wqTnSwHsbK2kb
         J47yiO+XTjGkwfhNFlv4ZYijvIoHcG9h5yU9ZKu87VmSUjOePPOQkGLhMHAxTzmjDuNW
         3MQQ==
X-Gm-Message-State: AOJu0YzWY0sFJ5ejnSYI5XSeoDm+my40H9UkP6h6hyRZthsMwLzGEc9g
	KNa6Xv+GVbBcDsh+8mFSJ13Yni7IewR5dClnaNX/m4LQ8ZYoFkJQroFTuB6ARQ==
X-Gm-Gg: ASbGnctZF3TZRIp6r0r1OIc/AZ4NOq/bLxXGlJn991rJfDMmRtwMGHP0XIMUwikxOZh
	WYUxq3a98s41DMy9s+zvArFRe7yCxDeEB6+h1nVxCkqvHIg3PHM0wI6eKx0DqK7H0BbYjl7LBiA
	RjE8lCIEcqP/tGNP2iWa9r5aZRJ60W90iRDYyNvy8t5/tpsOxbcpc3Zze6R7fJWEEx3/FpPUVzh
	TBjZy3NwZSDH/yZYfp4RT8hG5XXmpUg964ILjvw+vpFgbGco3WgvVkv9Hy5/1Mk3TYvAtaGXDIM
	9Xk5AdvyM8Z7yDSocjhSd7iLrXhuXm0Ae0vLSTKYdYJql2nrU35xfk3EpfCbRtsc5+RsSUWhX0a
	0sdCwsfp3d2CVmP7Th/ThLq7kzAHH2jFFk9K4tdbIVwPH79VGrIO6FL0VyBgt7xdlV2D6lGdjsT
	jEZOToCkQB
X-Google-Smtp-Source: AGHT+IFjUmcDD680eqE0Jk7r7tOQ3YcTUqT96tmUmkXeSrNN5OdT2x/nlQ6I6SYRmqXiKCotebdBeg==
X-Received: by 2002:a05:600c:1986:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4792eb1238bmr20644025e9.1.1764834997540;
        Wed, 03 Dec 2025 23:56:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 03/12] xrdp: patch CVE-2022-23478
Date: Thu,  4 Dec 2025 08:56:26 +0100
Message-ID: <20251204075635.1088007-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122305

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23478

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

 .../xrdp/xrdp/CVE-2022-23478.patch            | 85 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
new file mode 100644
index 0000000000..de4f773332
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
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/6cb54a1c26b53617e1c79a0abc96d03c4add1eb8]
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

