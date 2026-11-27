Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10283.1795753062898051434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xzTG7GgJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4168044c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753062; x=1796357862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtbyZliOPyYxmV2ozQHJZnI9eIXS/zefG/XHum2d9bw=;
        b=xzTG7GgJGXXu5OMkd62MRpSI+WynmHNKQP+C1gSy5ykNGQGR4lDAq7a7SLMkUsjbej
         2mfRlhDNNfJ2K+SXTA1cOZMqR/mukmi4734zXiIchPG0+aGoa9abSPNMcGBYf9+ENtfb
         h7NzNAyNM51vS/NROvdYifYqO4q/7WXszfni7x2mWUXKh0cJpHYLOkNPEFw1pRVwTXCB
         Ei3Y8o1LK4I0l2HX9Duo1PmEvc4J9sZwKkm1PP9VDIp7Em9es1/wEiaOCRkYbonss2No
         qkrpA7HevFbB8zAk41YwUs7HBra9PAIFcwnAgP7kMo9RAl6Q/+/hbYDvjy7FsghDJzP8
         WRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753062; x=1796357862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtbyZliOPyYxmV2ozQHJZnI9eIXS/zefG/XHum2d9bw=;
        b=hITljR+u013/tFIHZQQzFXmJfw22Je0diaOINxopoyNB00+zDK8B59dKxCxABn2K6h
         CPiDksDtkh/VeVpAZ9v8+3R0ABUrPG7cl0b2y74eOYnITm0xF2qXJlq75LLnaiX+Obbh
         LjDs7lr69TYvN/5nwhJ84ZiFfo/dPqdMHcrWpL2Im6xCMhW8yAatdBkUWdpBXA6hymoT
         aLv6XyNUJTbXrBzJJwa3S3eJQYIGCkFC3PphBwLgh/MmdPoNLlQngvQw0C3wXTOVay5h
         r288vRNcoHrYxhhOSchxtPLUV4a1Cq4LX0/eo/DD+tPYUBQLB2vVkbAc8AcAvWi8Oh1R
         xZyQ==
X-Gm-Message-State: APuU4Z8JLZ5QMiOoFv92IrCQcnmJtWvlHU0mVBvBdhfFUmLeBr3Ao9ZJ
	YL6YjZIzlvf8XhjSgfJJ/8v63D861dbUgEtrreivD3FXuN57nYFmniPFE/8HZnp3
X-Gm-Gg: AZFdTZcS2Pdr5fN+ntmRs0mC/JwctGK4lt4pnbUafdgaD0wdQsSFePbW0MSju40/PpB
	SbWrRxTRASopSxyqLLyqrW9uuPU6zcens7tD4NJv6GpiDjQrfd0WDI4W1hAetCXJH1Iw3ZCUMR2
	lQ4stgeR0GI8WvFCeyFfjDpaGPE5HvItHUBMXxvSinJj3IYH3U0CjROLw0cFGbS/5eg29NPI5iY
	+ZQTmTxNHhg4itQUVAGiVQddEtBG4dFvMM4qyer9wwUhArkh33u1ik2m6waZ4Lyy2oX/GIaSVUs
	rUsAfV3p+UgMKUiaq0VGgMokD55ueP9+sZhImq9Za6GqyRtUgHWTC7gOdpMIPRAEeLDmel4f3jp
	3PaCl1QDRkUcSm/Qyd+JwNOGRsx5jbLpnQpk1OCbgvpFgfIjizrcfqGyEC+hH4o0xkw83lN70Hp
	Pf9hBnfyzOu0FKMn20FJs0hKXHD2HswHREK62hpIA1SvrGBwaOEH4GNbnetzdqmjeaBdnvzdwxH
	UsIbS6rMpCPYE2/S2nvJnqTi5ZgE3N/sA9ZtRNUX08itb8+vQS0oiN3uBfnEifsv3wDPMd/gK6z
	Dg+UzZdC3YbEcQpUkYnLOm3VvO6Vu6itVdBLEEAdW95AVT6/uyt9BrgN16TL17Hwv9KHdrq5Hlx
	ROiF/y68eVYsgV5+JgNPvNPOET2RdM7PQ/tRHS8sAyKDteuCOiOHwEsLO7OBBENPO4aRUfo0gWW
	BVXp39mVQiA0MscnUy2V0+TcYpzjcK3saqs9VHm3gLM2AjFhAoV/1BFU5BSrSQyqHaYXrzkUe3t
	LKQI7YBmyj446hiSfhimIrRfSRtbzY1SYuvVCATOwphY9j85UZkzN81CUD9Ep/uslUG9hbwIqX2
	7ZID
X-Received: by 2002:a05:701a:8459:20b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1b5524b0f73mr22394645c88.11.1795753062290;
        Thu, 26 Nov 2026 20:17:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 22/35] xl2tpd: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:02 -0800
Message-ID: <20261127041715.1776485-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133274
Content-Type: text/plain; charset="utf-8"

UPSTREAM_CHECK_URI is ignored for git recipes, and the default tag regex
picked the ancient v1.04 tag. Only match vX.Y.Z tags, which also skips
the dev and rc tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
index e1638bfa19..a1723124d8 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/xelerance/xl2tpd.git;branch=master;protocol=https \
 "
 SRCREV = "1ef2a025981223c1e16fc833bef226c86ff8c295"
 
-UPSTREAM_CHECK_URI = "https://github.com/xelerance/xl2tpd/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+\.\d+)$"
 
 
 inherit update-rc.d
