Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434AFE9DE48
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:42 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127033.1775718572873144793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EAkSmgiw;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso247384a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718572; x=1776323372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNhfEp/frKJFcYz8MorKDdaj7HGRbwTXiRPZTvQBXHw=;
        b=EAkSmgiwGgZZc4fLDHA2p3vZ6/PXHxrwa+L9X+NdiJhlur2xEPRcgZaflawtE7FEw3
         tLYRJIfhhVV8XRJXN5YBKYnIWZ6pgKwVv9Sfup/H4qVgrMMQORAWTrOhYL3dRjUz1rrS
         tv2yRVQ4ZB7R0Oq05EvAThu5wvw4na5P1ZMlQmFHd0S46m2j84JFoTfSbFWV5P9kQHnD
         VFbwAdvn4OC48jYm51XD/t+qDFTG8nlhVxIIJMHuraQsvh/pXG9jAlqxYq2ZqkZblVz6
         3hrcMsfnKQeHsJ4mtk2LTC+l+IS+IQLMjvj3SNvSecqWKqfEh+dGHuFwB5e/MOAvgWA+
         n9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718572; x=1776323372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNhfEp/frKJFcYz8MorKDdaj7HGRbwTXiRPZTvQBXHw=;
        b=Xjj++/EzvViS9zwCJtpWNURnr5XOfPxqq3usg41ktmU/chdIAu6aiesq4OwPek/MZE
         bJWuYtj5GzYViGOkPymAxIkoqG0cMs+fFFqIfiiV6BwOOQJ3GbJdHLGDLEM6tnTOw0av
         /K4RRbJluCkVg3rdu62j7vRbisXk6HjBBUZ6VwmJI0A6o5ig0F8blqFhyQnlnYZ9tEYq
         lD1x1v1dvxaiQT+wyZM+0i5xuZ1VS9OCsrUZ1QOIM/KXg0nYpRRqBVq2Y1zbxztLBUqX
         D17LzEt/6s1r3b4FCux4tAI4oT/27Aqnj4BEvclJdI1M99GNPAGpq5gVI71CEhFQqzY8
         TLVQ==
X-Gm-Message-State: AOJu0YwzIp/hLKlTUwtP2FPGBngYKSei9TjzXek/o3o1YpB1g11ILPWK
	ol7ecZpvWGtxAcID1C4PvtwyM0Xu2fjrVHGayVAbQRVxA8JEjiMDFcxT2NJ6ow==
X-Gm-Gg: AeBDiesUs5csnehbHoOJfxqiBJoi3HzMXtSku9t1YU0Xx4J2AO/jBv036xJzxQVfOIj
	GuII+BYCOLBQAtrG3Hnw28jUr/zzUt8zNRV2QTYCEjb5bDtqsxtzhMQXaI8rhGQczL3wNUx/YpV
	wqIhJa+SWZb8Te4wVJRY5weX4RbDtLOf+YyB4Mo1uXCCQoWt2qABZ+9ycnjymCq9es7eS4QOkpV
	9RGK5GyJNmjACMTkeyTiyFD6nBptD0OKZclz5fnTV6yqdkcW7eadOeEX9hx/dJQB9j/XdIsW33P
	m/LyVBx8ghN9ZsyC6Wf5q/gqSvzyxaQCQQO75gca3ZQI/9kovnVRAMUYUULIAeckRYRIEjLhTrm
	czvFxkCCKqhKbtxK2R02u/XruQhqLpAUDhleqmAwpUxzlJOYwGle53c3rrUo8fzUoz3YVgbT0nO
	MWowpqPckM9cIklfR3yohy3RvzSajE3txOyY4=
X-Received: by 2002:a05:6a21:6d9f:b0:398:6bb5:54c4 with SMTP id adf61e73a8af0-39f2ef774a3mr24502792637.5.1775718571857;
        Thu, 09 Apr 2026 00:09:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/22] freerdp3: fix CVE-2026-25941
Date: Thu,  9 Apr 2026 19:08:59 +1200
Message-ID: <20260409070919.3968586-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126124

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25941

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-25941.patch     | 28 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-25941.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-25941.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-25941.patch
new file mode 100644
index 0000000000..8a072b9359
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-25941.patch
@@ -0,0 +1,28 @@
+From 52f2ae7b2377efc80abb742e452a8565372fd29e Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Mon, 9 Feb 2026 13:18:51 +0100
+Subject: [PATCH] [channels,rdpgfx] check available stream length
+
+(cherry picked from commit 2e3b77e28ac6a398897d28ba464dcc5dfab9c9e2)
+
+CVE: CVE-2026-25941
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2e3b77e28ac6a398897d28ba464dcc5dfab9c9e2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/rdpgfx/client/rdpgfx_main.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/channels/rdpgfx/client/rdpgfx_main.c b/channels/rdpgfx/client/rdpgfx_main.c
+index dd59c8b23..c08436b40 100644
+--- a/channels/rdpgfx/client/rdpgfx_main.c
++++ b/channels/rdpgfx/client/rdpgfx_main.c
+@@ -1371,7 +1371,8 @@ static UINT rdpgfx_recv_wire_to_surface_2_pdu(GENERIC_CHANNEL_CALLBACK* callback
+ 	Stream_Read_UINT8(s, pdu.pixelFormat);       /* pixelFormat (1 byte) */
+ 	Stream_Read_UINT32(s, pdu.bitmapDataLength); /* bitmapDataLength (4 bytes) */
+ 	pdu.bitmapData = Stream_Pointer(s);
+-	Stream_Seek(s, pdu.bitmapDataLength);
++	if (!Stream_SafeSeek(s, pdu.bitmapDataLength))
++		return ERROR_INVALID_DATA;
+ 
+ 	DEBUG_RDPGFX(gfx->log,
+ 	             "RecvWireToSurface2Pdu: surfaceId: %" PRIu16 " codecId: %s (0x%04" PRIX16 ") "
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 55cb356be2..f9e6f64e2f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32661.patch \
            file://CVE-2024-32662.patch \
            file://CVE-2025-4478.patch \
+           file://CVE-2026-25941.patch \
            "
 
 S = "${WORKDIR}/git"

