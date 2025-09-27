Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D85ACAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:32:36 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.6895.1758954749708669198
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GcbOkA7z;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-42576a07eeeso26221825ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954749; x=1759559549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDEvBwVahe9ouMH+ltW8eECIiulKTELP1/iipQBUIn8=;
        b=GcbOkA7zs8oiUqyeB5XCoAPVQvtSkRAEwxcMN3W0TMPmR11xaVHXWPjCVDk+34+uqF
         r6Gb8EDbJ2DhdOEIf7yhSDarpVkyuxXsFk9l7uccitLQYK3d+OU+nm//HOssLCM75bn9
         SdOv6M6TIRdz8zQbzT7IyO932b97+9J0hBIh/xaJdG16j1AsrT28bPJAXf1WWhBF9/26
         gUP3GEU847TTMpB6ygR/0FVBqZsfbyXDXIyhlCF4ExwNW3U4h0eYNkvbvVuYMyo1L8Qy
         16LW2Uxo7hX06ghw/E7W74/m20b034GRfAtOCEXf2N9krA3Mw9auVelSpG5B99aR856q
         +tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954749; x=1759559549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDEvBwVahe9ouMH+ltW8eECIiulKTELP1/iipQBUIn8=;
        b=geJuRbx+nRVcQOVj5tN3lpdmv1GDdpJ2FEX5zB16+TAAeORvQkogfO4rvTKfjOdEib
         Rlrxy/Isine+cXCg23Bc/Ij4P7iQHiJj5HuktSr40bAcL99vdCv8pyPBf+igxjNy01re
         fpTc8E8HZAlUDenNyKNYDhz8p7iDmxU1nWFg8DKozEEP957h7ziPjyO2/3/8zAGFh2C6
         0Qz+dtp8mXIz/ikuNFTrpHhzJ9o7prPM0K06xvqihNvSoxkZNx4qddBwYFsq718fXLzZ
         MCDtBM76rMbPfGOVTiC5jrJSvAb3nqNUK0QtqWiKMbEwKZJvFvAZlGewNO4VTTHedcte
         drlA==
X-Gm-Message-State: AOJu0YxoQUx8Tf2FVU8sq6yiqrqskYq8sprKPKEhjijTH6WXdnRXYREz
	20YBNqMbax0j5XMjUGvMkQW8vd1R6uM3Ju+BIrZVWhfjUTuRSHUUWI1UhbEumg==
X-Gm-Gg: ASbGnct//kHsSBP8VNjhbuGQYwHtxACTaxJ0bACG6xZMvKSUVRxdjGwq8miGTedKstU
	KX2pEE+sBThc2UBpCDAhZ7i5sG2Ds3RxeE/TDYDBR7SNovrCKQovJtO61QLZKxenBz7LU8CeSOk
	7Xh+1qbkyIj5gc8vkIMyjm5UKZFMIkprVmdnOM4J8N5gS3h7Kgod1W7Wtk2qgCVxL/14ycnDvl9
	kCpbTapi5yIn5hf5hMHTEwYAOBdpam/qllIqLJutfMzyfaPOF0IaaHRUaob9DtWVGwItEfF1WDy
	vuPnJnoENfzOdI23EKyxlhbh0banGxKBh1ACn7giavwuMm6Z+30kQaFmOHplHuQqw73lHKwQCi6
	1k+8XUYgPmOHhGRsZ73YeIaKNlH9CJySssPMo9RJ/onSRaQTKY4Q=
X-Google-Smtp-Source: AGHT+IGyYTQ0Je8ooigxdwIsOnVi8O6e6DyYC2VbJxU5/3h2JBFvMZevp9IBbIeEspe0eQ2zCqNZJw==
X-Received: by 2002:a05:6e02:b4f:b0:424:40c:2426 with SMTP id e9e14a558f8ab-4259562f632mr146234875ab.16.1758954748724;
        Fri, 26 Sep 2025 23:32:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:28 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 02/21] hostapd: enable 802.11be, SAE-PK, OWE, SuiteB, ACS, and MBO support
Date: Sat, 27 Sep 2025 18:31:57 +1200
Message-ID: <20250927063216.1865627-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119956

From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

hostapd has supported IEEE 802.11be (Wi-Fi 7) for over three years. Given
the growing market demand for Wi-Fi 7, it is now an appropriate time to
enable support for IEEE 802.11be Extremely High Throughput (EHT). Note
that CONFIG_IEEE80211AX is a mandatory prerequisite for setting
CONFIG_IEEE80211BE.

This patch also enables the following build-time options in defconfig,
all of which have no runtime impact:
SAE Public Key (SAE_PK)
Opportunistic Wireless Encryption (OWE)
Suite B and Suite B 192
Automatic Channel Selection (ACS)
Multiband Operation (MBO)

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e44b0f25756d40974a1850d10e88074f66b150f0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hostapd/hostapd/defconfig                 | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
index a62bec4034..b8745024d9 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
@@ -142,7 +142,35 @@ CONFIG_IEEE80211N=y
 # IEEE 802.11ac (Very High Throughput) support
 CONFIG_IEEE80211AC=y
 
+# IEEE 802.11be EHT support
+# CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
+CONFIG_IEEE80211BE=y
+
+# Simultaneous Authentication of Equals (SAE), WPA3-Personal
+CONFIG_SAE=y
+
+# SAE Public Key, WPA3-Personal
+CONFIG_SAE_PK=y
+
 # Remove debugging code that is printing out debug messages to stdout.
 # This can be used to reduce the size of the hostapd considerably if debugging
 # code is not needed.
 #CONFIG_NO_STDOUT_DEBUG=y
+
+# Automatic Channel Selection
+# This will allow hostapd to pick the channel automatically when channel is set
+# to "acs_survey" or "0". Eventually, other ACS algorithms can be added in
+# similar way.
+CONFIG_ACS=y
+
+# Multiband Operation support
+# These extensions facilitate efficient use of multiple frequency bands
+# available to the AP and the devices that may associate with it.
+CONFIG_MBO=y
+
+# Opportunistic Wireless Encryption (OWE)
+CONFIG_OWE=y
+
+# Enable support for SuiteB
+CONFIG_SUITEB=y
+CONFIG_SUITEB192=y

