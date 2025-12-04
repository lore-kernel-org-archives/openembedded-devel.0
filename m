Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98A2D1D88F
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:53 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38236.1764835004012527616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDh4coP2;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso246909f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835002; x=1765439802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R23h95RdGrZru0NMwEqQXkaE2T6Md0tVX1np6hBs6Mk=;
        b=MDh4coP2VPiVoMM1XMbEBViEXv8jIto/YX5i0zi9u73UstcEuAAYkZ4raq2qYoUEsM
         WG72I9mrAxDax/k7yMipCnOqzf+29Wh9GnlsjHCfroik5GMcFOwstejJik+yHwXnNhwD
         ZlRtYw0rufdt0NsG9odFcRHS2cXCgz74R0SwCbptimVUWpPXxcJA64e06ov9uovaVgxQ
         eWaCtFKRy6Qzbk+vy8IXrBPYxVHsKsH07VeS7PS4S18BYzrKpf9EPbVlMUz/uBWsEuhs
         nDcbHDCWKk/DMz/mTL9sAELPjQBaLGPzh2VRyOIZFg2j0SmjmHIls5bmnxuraRtjZpXY
         fkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835002; x=1765439802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R23h95RdGrZru0NMwEqQXkaE2T6Md0tVX1np6hBs6Mk=;
        b=Cz7dzJ0djDUwRgX3YB0eO5JBJ1BaEWF4pJlK3p0LH+S3iY06pN7UW46dm0KVvpUwv2
         G02hvozxRiJrzKZzQnpYv4creI2QF4CJmG2GHcCsCSu54gMFC97cyCbAyXv3AH5HUFZS
         N5u7IQfBGjxaBPmSfxLU+agvOIzXadQrnMAT8aMfINeTE7SaRUICvyn5M6Gq7/pOsRNq
         TIpM7t0NkS1sRW0hBZyZDa7JCZvUKEa1qNPcrWsfV9rCTNSFkSzx+g6YCI8fe0FWmiUO
         VqrA5XTRWDw+izLEZM5sMskz9zzR3suWR9lDaJVxx4rwE6rgdpHeUE0Et7UDkWkDdn3A
         h/oA==
X-Gm-Message-State: AOJu0YwqT8nf7sGaxQ5jLv2FtoA8bBad/Lq8qpOZAjZyL8pI4Bwz3w5s
	fLA8BXrzYnGEtynvYGIAUrMwvY+TfJpUeWG88DU7RDKJbcYJQkBdkoVB5/0N/g==
X-Gm-Gg: ASbGnct80NXBwYv7UMSgKGcWf2XGBPG6TkL4ITgUfhspcIX27Ynl7QcIeAkvSA4NUnG
	Sx5IBd77SuTTwUAe5mochUv9GOx4WvVLAQXXKFIaBr6a2PTHk7dqkJzEkX7stW2b8Zm5Wr9UMyb
	WppjxTa2tz4LRjEUotAampqp9QrVvjaZ33RS8NJbrCADNjVg4cgh92JeBTroYpxvs0q/hRaE+uP
	E4d7Kc6FazVSUEO4FWSyBei+igWObWAYig0ybgx2wAW8cgk4utvxmuHPucJxvPIkVyJwNxx9HXI
	+1Ejd6hiPvcMnhztqVU4SSJoA12o8alrt1R4TikdGxkQq9sfk2bbKgtlOuNeOmo0zrzieKNhfp/
	IYhOHu+cNaeDoFm10x+KgSIxZf7AK/Lpjd8bMY49/GM1PwDDwfFHDOqIuLvVkS1gHiB8LMyQGR2
	7ueS6srsn4
X-Google-Smtp-Source: AGHT+IE7k/wjgsSDRRKleSJgyGzQ4D3XjDiyKLJFcoBTkVc6aNjhDJychuqLzEtKjAtaK9jFKR1VJQ==
X-Received: by 2002:a05:6000:2384:b0:42b:36f4:cd23 with SMTP id ffacd0b85a97d-42f7317d52amr5723815f8f.19.1764835002329;
        Wed, 03 Dec 2025 23:56:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 10/12] xrdp: patch CVE-2022-23493
Date: Thu,  4 Dec 2025 08:56:33 +0100
Message-ID: <20251204075635.1088007-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122312

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23493

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

 .../xrdp/xrdp/CVE-2022-23493.patch            | 33 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
new file mode 100644
index 0000000000..de3f7a42f3
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
@@ -0,0 +1,33 @@
+From 030db5524be7616967ae9e7d26b3d4477cf6082d Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:49:06 +0000
+Subject: [PATCH] CVE-2022-23493
+
+Check chansrv channel ID on a channel close
+
+Prevent OOB read if an invalid channel ID is sent.
+
+CVE: CVE-2022-23493
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/030db5524be7616967ae9e7d26b3d4477cf6082d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..068424885e 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -1435,6 +1435,12 @@ xrdp_mm_trans_process_drdynvc_channel_close(struct xrdp_mm *self,
+         return 1;
+     }
+     in_uint32_le(s, chansrv_chan_id);
++    if (chansrv_chan_id < 0 || chansrv_chan_id > 255)
++    {
++        LOG(LOG_LEVEL_ERROR, "Attempting to close invalid chansrv channel %d",
++            chansrv_chan_id);
++        return 1;
++    }
+     chan_id = self->cs2xr_cid_map[chansrv_chan_id];
+     /* close dynamic channel */
+     error = libxrdp_drdynvc_close(self->wm->session, chan_id);
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index a9107a0e26..f3d11522ac 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23482.patch \
            file://CVE-2022-23483.patch \
            file://CVE-2022-23484.patch \
+           file://CVE-2022-23493.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

