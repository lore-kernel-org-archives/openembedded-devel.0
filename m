Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7CEE9DE48
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:52 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127037.1775718590258334735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AhrYtGmt;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c757a9251faso204559a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718589; x=1776323389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlee/D/wmjGjCtI9cEJ2MFriOKi/fP/ROquV5V6NsWo=;
        b=AhrYtGmteXfaMVvn7b1efcPNxiXQTz7WK0o79YKwqeGtpdUr+72T1OLtoNcVgg7YNj
         Ua7B2IepR2CrHeiuGhIVIWC+7y5ShIAXLWCCjotM2ev83py4x0K+TE3pu3GJ7fYrOKnh
         zWbRcIIUPCkYJhiP2hei5jgDaqjvzmjxoUpOoL7j79ckl6fa8yYiSHQp+ZVKKvaQCmVl
         I7OyDvWvulw9PPrhGRS1Xv2wn248ukLRnG51jOGhFsJbM6Ys++3jwaD0MxgPUivHAujC
         bPfdbQswP2eawgleLn9U9QZVf5QSMoHjUWgPiuMfrU3oxkLRK1rwNzLToedGciN2MRdC
         6lOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718589; x=1776323389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mlee/D/wmjGjCtI9cEJ2MFriOKi/fP/ROquV5V6NsWo=;
        b=BF1TsFDNarofxayOvVactY1UONi+wnbLB08R/PjWsXQCK8Q15ytZrL2JSS2lPmNz7d
         kNohzmk/6a4TIPxM+BmtfwWXi6EbKMjmVK7vi30tRG3w4kGcLhltkaTKbFTdnkuv3Dsl
         MhOaZUgyOEYLGuh2s84lASd8mtM2Llfm/J7wKfMF/njxvTU5NwsW6dbA4ln0C5ZnYMz6
         sq9aKyTXO7RhI31i3eCZnaONpv1IKT0nJr111JwKf/BAkoZoF3T5Ls7LvuoRB7T3rtnx
         2l7W2wCQId7yc1QrKwVBZbl6vVU0Pin/AMwAe3jEwFSGOWy1H+KhLmNxdpK1Ic3SMB7t
         ft3w==
X-Gm-Message-State: AOJu0YyvGJH2S+MBfDGoU+s4tOvgQEqeGFQeBvDXpaUWZ16hHQAOom74
	JqhCY1DGAK0hjJ5vNmpAg4QO6n4Ges2QyBYwdDmE78IZEwv1b5W86eVBMoz03A==
X-Gm-Gg: AeBDieuMldHrWN5aJ+Dst3uKgfaRw/aqtSuWq6I8Q/BuNbRYCOMjLG/WaElaDfTZv4u
	KOoMSFAnLYesmrAp/4Zwc8WgGP3OZAQdAD0I90Ig8PlTmYSND9ZeAtPvPasT1PQQTd3IoeS+jEo
	UQ7KlyILgZPkhBoi/bt+9YcU8NEULXtyWiadDlrOjDrW8TZ5GaujoQejVM29IlbDV/EV6r0W1LT
	A03uDv/IMGs6RfCYMwJaRaXqmQHi8Q5aLbGmyUaNwjsY5vRBfAstzaTJOsig+e7wUgpPKySLmhq
	Tbd6dREEF08ECr58r9DaXju2rHPLOIOEnIRNJGxmVehpnJpjtBq3UNFdqeUb3M4cSpr3Jmp4RPZ
	JZwWgbGqtSbfDi9GpgbunqhRIIQivQ2h8tlVIyRoLPwfPSkLufaPGDKGjxuEL1tyPclzXNrFCY8
	/oQLeoIEb264Wu67AQ5hunKwOhlghyhFImpEU=
X-Received: by 2002:a05:6a20:7353:b0:39b:e837:5565 with SMTP id adf61e73a8af0-39fc82e878bmr3050833637.28.1775718589384;
        Thu, 09 Apr 2026 00:09:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 9/22] freerdp3: fix CVE-2026-24679
Date: Thu,  9 Apr 2026 19:09:06 +1200
Message-ID: <20260409070919.3968586-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126131

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24679

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-24679.patch     | 44 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24679.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24679.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24679.patch
new file mode 100644
index 0000000000..7829a63f03
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24679.patch
@@ -0,0 +1,44 @@
+From d128bdb4131634a7f877500da9fee4fee99bf019 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:59:39 +0100
+Subject: [PATCH] [channels,urbdrc] ensure InterfaceNumber is within range
+
+(cherry picked from commit 2d563a50be17c1b407ca448b1321378c0726dd31)
+
+CVE: CVE-2026-24679
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2d563a50be17c1b407ca448b1321378c0726dd31]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/urbdrc/client/libusb/libusb_udevice.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/channels/urbdrc/client/libusb/libusb_udevice.c b/channels/urbdrc/client/libusb/libusb_udevice.c
+index c226eb806..ea12e55e0 100644
+--- a/channels/urbdrc/client/libusb/libusb_udevice.c
++++ b/channels/urbdrc/client/libusb/libusb_udevice.c
+@@ -532,19 +532,19 @@ static int libusb_udev_select_interface(IUDEVICE* idev, BYTE InterfaceNumber, BY
+ 	int error = 0;
+ 	int diff = 0;
+ 	UDEVICE* pdev = (UDEVICE*)idev;
+-	URBDRC_PLUGIN* urbdrc = NULL;
+-	MSUSB_CONFIG_DESCRIPTOR* MsConfig = NULL;
+-	MSUSB_INTERFACE_DESCRIPTOR** MsInterfaces = NULL;
+ 
+ 	if (!pdev || !pdev->urbdrc)
+ 		return -1;
+ 
+-	urbdrc = pdev->urbdrc;
+-	MsConfig = pdev->MsConfig;
++	URBDRC_PLUGIN* urbdrc = pdev->urbdrc;
++	MSUSB_CONFIG_DESCRIPTOR* MsConfig = pdev->MsConfig;
+ 
+ 	if (MsConfig)
+ 	{
+-		MsInterfaces = MsConfig->MsInterfaces;
++		if (InterfaceNumber >= MsConfig->NumInterfaces)
++			return -2;
++
++		MSUSB_INTERFACE_DESCRIPTOR** MsInterfaces = MsConfig->MsInterfaces;
+ 		if (MsInterfaces)
+ 		{
+ 			WLog_Print(urbdrc->log, WLOG_INFO,
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 82b926f430..031cb4a665 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24491.patch \
            file://CVE-2026-24675.patch \
            file://CVE-2026-24676.patch \
+           file://CVE-2026-24679.patch \
            "
 
 S = "${WORKDIR}/git"

