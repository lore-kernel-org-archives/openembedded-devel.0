Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83142C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24521.1786747612049175750
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G7y2bkfH;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf50c6f235so19294435ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747611; x=1787352411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkarN/OHk6tiIn8dpW4w573TgLHMAGxKMQ5+vhnXRzg=;
        b=G7y2bkfHE4sLAP8Wuyc8/+h2wLqLD51xDyQNmj5mEoDNUqAq0ALfttGmB3BhkwanrH
         WTvdwu6pkSBlBarbPpEgiJo2jghAFrKrmNe6edSY+ovhZmIvkYBoPIhPm3EhE1tWeuMX
         6L2FcF6cztSIXC65NN/SEBIaJ3GPiFp6x1ftZFsq1wME9AZnaYN4EG56tq1cxYRY8DRk
         DfMkxguKHOOJapluBORlC8pHtwXYYnmYnGL6Pr9k3YC9wpfNAe0kYSLK0VEUFQ7dU7jL
         R7WABP8LbWbBsW3bxOXeaKDDgiHgM35KTAbDk7FZS8HwtKutHO/KTYP0dQxvWhCh02Sy
         fBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747611; x=1787352411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkarN/OHk6tiIn8dpW4w573TgLHMAGxKMQ5+vhnXRzg=;
        b=HaHzge+I5OIQXK3C2UpNlx/icIe/SI+vwHbgLzP1nfHhs78uWcyGua49edPFN4wzAz
         84QqnN6sWU3oO/OjmnpJJP9vhRUa8x+/+93Cr/Kg4e0v9zGg5Ver7QAo08zG4op7li1k
         CzipHedhCWoJiIoqaiHKfHY4YMgLU5/i8wclICZ/KapXvgjhSUMph1m1FD7r6n/JXjf7
         1eA3S2itpheRK42wifxu4VG3kjFkmDUHcprJkkusump1F5T7h8KBD9tnXmKxI+NaFW6n
         zrHjcIOGGTSWOWofnKPK+sl6Vvc0y87vObj0Um6w4iUZgDvsw6qE0gqw0Wih7wCixep6
         2O5w==
X-Gm-Message-State: AOJu0YwRECRzINMva/HBThQryNm+0Kx0+5lcFyT6tDx024omEDQHCUXS
	UkAM5KhybMSTN8gHh4hrVHw27S266ZC+DoOBet1JFj7fAtf1HfxP8IdcM0KFyKXQ
X-Gm-Gg: AR+sD12o/1SIjlNAE271wMc/OB1lcXQ9XF3uUlirs38GCrmGSLFIiOqGVRoR40VGyI5
	wIgv/BZE4g7sfTlKs9wxItWHTktO+GQpFVFpImULwSXOPp1fi7uvZEDuH4deBiw2yPtYJBle0+D
	tX2oSg3Ia7Dkq1fxUbByugXygRfzg6TAQ+PDReU543MQvQkcb1ybTJyrFykg0qcy1iKVrpEobMF
	e+iKJXZid+/SyczQeRxkemWQ4l0ilB8kGCl+sC5mDgDWx2Ngqi2lGwAE6rQzzkh6bv1zfkNc2LQ
	vVUAKnHxHlxNcLBU04VadfMoj49Ys4CbWzbzLn7iGM9oRqubLN+9S9wLjg93KNk0YD4BR/yTsSz
	tAuwCRBPQFSzvp8/n8NlQKscTXlf3xWPyuZdPjjPkG9B06iAqavsy4jggNrnkjjiLjXUWfkRr++
	v7sFIiLyOcC+d4p11l/K6cQIDMLwZx4o/RhoT4gYz2pzjJcxaTf+3Kl/Tz44ZNl/BJRYrAzA5SO
	EB68HdBe1C2QhbfbyLxYGGmxkBVT1t5jGBKxGXN08yOIFHDLOoObgugvZbZy6VqMooFxGImobOQ
	6UBcSCc1XTIDn+Sfhf6IQnlbuSjVi7u2kDZoRAV7RKW9LRmyPZQdW3Xw+e0EudX9NYE3iFAky2N
	Y5F6laEp1cKZb9DcR1xU5RYA8fzSEU3SdCwqrl3zQO0B5xr1FYa7ZEG81
X-Received: by 2002:a05:6a21:6012:b0:3c4:397a:69aa with SMTP id adf61e73a8af0-3cc71e0ba59mr11706578637.31.1786747611436;
        Fri, 14 Aug 2026 15:46:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 062/109] sanlock: upgrade 5.1.0 -> 5.1.1
Date: Fri, 14 Aug 2026 15:44:48 -0700
Message-ID: <20260814224539.1523174-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129126

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../sanlock/{sanlock_5.1.0.bb => sanlock_5.1.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_5.1.0.bb => sanlock_5.1.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_5.1.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_5.1.1.bb
index e5fadd63f2..4b37008e71 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_5.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://codeberg.org/sanlock/sanlock.git;protocol=https;branch=master;t
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "995685ac3ad8909cb7562e74dd13e3b450833d9c"
+SRCREV = "4d185bd9ab97c9e94f661b3436e4bfe749720f13"
 
 CVE_STATUS[CVE-2012-5638] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 

