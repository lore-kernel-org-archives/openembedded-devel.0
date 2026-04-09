Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998FDE9DE4F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:02 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127039.1775718595005545796
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gCY5yH2w;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cf83bf375so295209b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718594; x=1776323394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax1BqT016sUeHoYihXxLmHXEtjpt7cDvSpuscu5nBqo=;
        b=gCY5yH2wfbTMfFcNdwuxilYY5qR0tAqZEDPlvpPQcNB1TeHT4OkhvAngRK5J+N3zmk
         M/IZYfSRZGR22deISbZNgrfQYW2o5HwIgJA+QjTpO/aLYT8Dk/nhnlBy+TNQIyBqc52y
         Z/Qj4XxYIucIJbXu+cepqSCATZ0WO4VZTbwnsmjwFdiEOTieq3L8vURTYPKuRZ+97kCW
         9rDdcRprB2ZVU//Ynu3GTjTXainHGMwwHm+gHMsoutQoZ5KpRj9wQazGOPIBsB8qdK45
         5Fdnk/425TIz+BGyKoA+wiGonzq131c4Lfwf9S7Gug3Th36aMS/m5pkW8ViL6MdExn6G
         Lnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718594; x=1776323394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ax1BqT016sUeHoYihXxLmHXEtjpt7cDvSpuscu5nBqo=;
        b=q0GdnBn3PXkXxim3SkItgR9qV7NDLF2Gx6Xj4UqUzjCp6Jo8qU5ZhoNcUMhB+4pU5Y
         ZDynp3Ck8iEpkiKHBAkdngEyO57c2dZKquhOPSTxkdJfIvi4p61YEg/xlFgIc2i0D6n2
         2G4+wVJmA0qKpsGA7SFQP/vbab9rRquJB/pvpSWS0TY+JSvTNJEP1djTcujt0w5O8LC1
         nCyYLTaxEnABYPq5SVrvxju5MKmdaH7QSvog1DgQI1/J+YD5wrPUUL2ZroUtdAIVa/EY
         DfyFashtzAeL873DiEcT/VN5sIwBmlSBkoCwkoH5l+YS4kXD7on8lHbp9Iva4iXCDQ2B
         sivw==
X-Gm-Message-State: AOJu0YyLp6VY6ZZbMMj7X0aWbb0+7HCkDIIL/R9aoNo4SYV5EtcsWgK8
	nMIJNcRXVKb2tVuuhwtfS9YCCy1H4JJykCavuhq95Xl/55L/kz7eNz1ZTuarjA==
X-Gm-Gg: AeBDietu22Pj8Z1yh73/TIchsCMh8aGjqpM71CqV9DVmZM6YPccvrzKkiMuzhm1h752
	5uYWwFSKFXFdjHVZqy5v71uQzoV/etxW7ZFsRPd10DedRhabKDyWz1bPimPCi2uOMFqlJPFzNZE
	sxIqP1eZmiIJlGYMsMg5rdsDpThPaci5hClb0CGlqe9SzA+rUDwfvlkgBsS2opSEw67ScxyhZxm
	YJYoE8u49/3xG3NjWCZA6nz/huk/mfcDX9ycRqdTyOYaBhGWa8M/IsJ+QiK+rXPnShV1fBWzFnO
	KKtJJF+o8NlEp49C6nZxbD++G3y5jXLvq38/JM+FvV8ISHk5sfSDC2eEJ01jH8qtc9X671NP+28
	ywWbJ7NtdkteJkRcSn4m2Bah3N6UXvQhrRCnqbFGlG9Yvq/Jwm/Kax/VPJ7JN3StyoeKj2TjJh5
	hJFvuoH3Z48ivOBYn7p9oixTYNliDWdTONmGE=
X-Received: by 2002:a05:6a00:1303:b0:827:441a:c970 with SMTP id d2e1a72fcca58-82d0da33e83mr22374710b3a.6.1775718594209;
        Thu, 09 Apr 2026 00:09:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 11/22] freerdp3: fix CVE-2026-24681
Date: Thu,  9 Apr 2026 19:09:08 +1200
Message-ID: <20260409070919.3968586-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126133

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24681

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-24681.patch     | 26 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24681.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24681.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24681.patch
new file mode 100644
index 0000000000..5718543fc5
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24681.patch
@@ -0,0 +1,26 @@
+From 00579b7be58db6dc7bf70db4a005cfe9a9e73131 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 11:07:25 +0100
+Subject: [PATCH] [channels,urbdrc] cancel all usb transfers on channel close
+
+(cherry picked from commit 414f701464929c217f2509bcbd6d2c1f00f7ed73)
+
+CVE: CVE-2026-24681
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/414f701464929c217f2509bcbd6d2c1f00f7ed73]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/urbdrc/client/libusb/libusb_udevice.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/channels/urbdrc/client/libusb/libusb_udevice.c b/channels/urbdrc/client/libusb/libusb_udevice.c
+index ea12e55e0..0d0f54f0a 100644
+--- a/channels/urbdrc/client/libusb/libusb_udevice.c
++++ b/channels/urbdrc/client/libusb/libusb_udevice.c
+@@ -1125,6 +1125,7 @@ static void libusb_udev_mark_channel_closed(IUDEVICE* idev)
+ 		const uint8_t devNr = idev->get_dev_number(idev);
+ 
+ 		pdev->status |= URBDRC_DEVICE_CHANNEL_CLOSED;
++		pdev->iface.cancel_all_transfer_request(&pdev->iface);
+ 		urbdrc->udevman->unregister_udevice(urbdrc->udevman, busNr, devNr);
+ 	}
+ }
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 08b1fb25e4..43aabf797f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24676.patch \
            file://CVE-2026-24679.patch \
            file://CVE-2026-24680_CVE-2026-27950.patch \
+           file://CVE-2026-24681.patch \
            "
 
 S = "${WORKDIR}/git"

