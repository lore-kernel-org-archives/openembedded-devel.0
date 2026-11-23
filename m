Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48510.1795411824298852457
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FHCgf8Mu;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so3977514c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411824; x=1796016624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWk6l0t2uBOnwSqjePxxMwmDVcRmHZwyyi0Qg7BwSws=;
        b=FHCgf8MuRkbuC2HYN0pPA3KnaPR5w7OZjXUWdUweF7W9KtIq8kWr90Ni+/dL7z2dRR
         xDSCPJz3SXzammcM0618iZ5SIXFtNtt1QzK7qBnZsqsuI0yhZ9EqA5VzFzUVnWXDcoX+
         xZogr5juhklmtE9CxielD+fVjFFq5CzltzBHc58C4a4snDwd5Lvho9N+QYwHfIVIgp7O
         ufMXYLFUy24JMjiawYSiJyIio8rlQJU87J6cLY8aUY2gh5OlkFGUb4i1yHpdADtPLXuW
         TS035EBcSx0OBJfFBsH8u4WDD9TIAIrf+Fo8ms66Q9znFOC+hJobWnWvhgGqHqIMr+/B
         QnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411824; x=1796016624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWk6l0t2uBOnwSqjePxxMwmDVcRmHZwyyi0Qg7BwSws=;
        b=KGBOF59hLRxp3qAG2kcCuR/35rsKHG/3lGTRqn8kZbUfITc0EQ0hzQxFXQlLa+o8E7
         6bXbHq43xTncvLXhwys+zWwiyD3qDdIeO/Ux2LW8gCk6ZOz0SRClutkfJA4p02jzOi6J
         2mHu0aSWtEJQIz1jqHUC8uoMCpa1V6lpBg29Eb158KR2i2pmRLu9D3QplND9LIujjo5l
         V63Y/WP3r1QyjJ8DZkH2l5KcpRggJZcMh7Z8pYlh9O4hPMnQMJ/Cftdc6TIrpM2W0dRy
         5XY71wLI9OYfXDeEClnLrSzX0p1mnI+PlNct6QbM55BTEJDD9VvghdHjzKeyfLpEPII6
         j01Q==
X-Gm-Message-State: APuU4Z9NUB9lPF0ljx/gpE3dh5LNFsecZ/aGkO/VFP0tDEK1wO0lp2gk
	K8Nvzt09mmPgpuLCn1L4dc8Bid+bH3RCVhN8xFIs0fPsRpxqVKevfopTqmzi4ZgylzQ=
X-Gm-Gg: AZFdTZfgolPHBjnw1VKcuYOcrYYPsOjp8Pvh0BQJR/ZKa2gtZ7v+WBi8ixRyR1+AuCl
	+WSkC+FvfW+9URu0QsgKbfZPEztsO+0e/VbnBoFhUmqCIyBGSbShJEMH8VKJrXKbsxr9+vjyQr+
	ufN5vVHYRuaWLwArsGBIwBAZLZ2+AOODfP5YSOyvkA9YER6wjocrm+R7SouVaHx+bKn/vURiE+g
	FjaOkFvE5PVJcKXvpUZvB40TVl2g9MmvmLloZ/pVvYIvXW1B4QrRjyTg4mAQQqXA8sulLpdvbbF
	vHIhh1fcRCc/3aAfDekA0apY+diW0cTAW3RBE1C/QCGPEeBidM3ymvY8wx2FPh6n3G5yITQawXb
	g5Sn+baLM4crkTQTfktMh7XxF/J/1xvseBPIOSqW403mDGdNn1mOX2GLOlea3PehZguyLDW60im
	aCmpYSYZ9HAFKYPEJY61ZnJagb7dCry0trc9i1vAvRbqWUy6kZOoMS0lDE9WaIvk8bs29K5xZY1
	yKAET/JP52tKdYSwBp8vhkyXghnyDz09B+9AY95k8VxHn8eZMgvh/dhpag+ij3UwY5Ekyaf1IYK
	nijmG4ANPGHVRV0q8QXDFob+9gYafBhFKw/Ap58tag7oYXV2nZhMG4ZiKlk6YeMeKy1hEpEq2rj
	C9K2mHmJvK4W9wN0jte2VBL3YqFEaqeDaP5AwZicUpX6RMmurnAP+bCvA7cOSW/o9cWiAc1gmjS
	smlCnDnQPPHnJxUinc7mbodqZBPIlSFTIEHJ2wMa77aJunFOoiULgQ6KzUmWdmKHG8gjvhDPdp/
	62KGUQ47SI4uviyjAitv3s8ttBlEdfICdrJCURCfK9m/H8ZnM2Au4KouMu7YNPWnN10vSWAcsZO
	m1Lk
X-Received: by 2002:a05:701b:4513:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1b5568cf65bmr10765726c88.32.1795411823603;
        Sun, 22 Nov 2026 21:30:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 4/9] ettercap: upgrade 0.8.5.1 -> 0.8.5.2
Date: Sun, 22 Nov 2026 21:28:38 -0800
Message-ID: <20261123052953.3658549-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132809
Content-Type: text/plain; charset="utf-8"

- Fix heap out-of-bounds reads in the SOCKS5, mountd, SSHv1, MySQL
  and VNC dissectors (CVE-2026-129431, CVE-2026-129432,
  CVE-2026-131853..CVE-2026-131855)
- Fix crashes in the GTK GUI and in daemon mode
- Fix packet lengths/checksums when filters split or rewrite packets
- Filter language: DATA.len/DECODED.len, manual checksum override,
  mod()/random() and a --no-filters option

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ettercap/{ettercap_0.8.5.1.bb => ettercap_0.8.5.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ettercap/{ettercap_0.8.5.1.bb => ettercap_0.8.5.2.bb} (96%)

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.5.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.5.2.bb
similarity index 96%
rename from meta-networking/recipes-support/ettercap/ettercap_0.8.5.1.bb
rename to meta-networking/recipes-support/ettercap/ettercap_0.8.5.2.bb
index 8ec930d39c..ead1bcc737 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.5.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.5.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag
            file://0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch \
            "
 
-SRCREV = "832524f3c4c215f1007fe9f190dbf052ee965b55"
+SRCREV = "330ed56a23b6fcac6c6139e2d87352a6fa71646e"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_SKIP_RPATH=TRUE \
