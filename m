Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEE4CD1297
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:07 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13704.1762853882472776702
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FfiUEZiL;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ba507fe592dso2447090a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853882; x=1763458682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dosnjtnHYU/2OQEDQqOy6XGNqpTZQsA0p/Eze1rw09g=;
        b=FfiUEZiLJmGMM/baleacJPp3tndmmX+nchFMC19SCPtRHdDfD4S9rCT+T2GNzcdxNb
         a+tNr+4r692hcTLn4LXq+VmxbXGDE0eB0OFnNWIn4N7EOhIeCLDa/rlfqEa0bwb8dsmM
         XSehLWhcbXkYO6BE6956VtLBgVQjFShZLmvr4vPhn3T/0BE7GcIwipqpMaFkcI1MW+e2
         1lS1KctvuYuaeUS3mXXQbVnl8wVZ+5Fwujedr61+g49AU3nUIp2nNAZhUATTcH83XEOt
         pCbnqjHKaNT0SahAkUK4pJNN5Po6Okp565k4DVfKgwsxngVG3iZknw9IJZJlGWZQQfyW
         d+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853882; x=1763458682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dosnjtnHYU/2OQEDQqOy6XGNqpTZQsA0p/Eze1rw09g=;
        b=DEHLop9dRhNmLWN3RtunQv7XjzeAI2iR8cKAP47HJfqVvzkIO5r6Kmtj4nY9AwJC4n
         SL+eD7ExrvQ70fAHhkYv5nCV+V6fhxe7BgQYxbi0S/21Zt5hBKOvSnYCspG8NQlc6JBo
         vdANhYjsy2gGOSjRZ8qbe9KmrN0LfAHTrmbtpiHH0FddQXH6ALqRL1Xitiu1v5xvgtqj
         ZjF8tvnmj4rEAvatd0+fpKgBeRYYSvXHc1QB1sNTCMkprG68INOVEFJ0gOnoLCc3Sm1L
         UUr69K9pYz29E1K4G6fVLgZVi1RJAeC/w+EB/BZ/oB6gSfkAnQcigrLxCVipGCAHzOvv
         gUwA==
X-Gm-Message-State: AOJu0Yy1MabGS4YPd1uuNvQntlZhVrHifBH9L0YVAEj495yZfXKCrf1v
	vdubSNC0dqm8QVqh2yfvP0VFskZw91aOa2cXzDOLOVIjGWC4EVQnmMKjcjX2bI2+q+M=
X-Gm-Gg: ASbGncvOnMoEbM2kRr/HaIcdHFr/sSA7gPxBKhND9BMcRejXl1vZ01Vbj2yWFkekqKA
	yDQGFVk6yI/QbkdG1eH5bR1DGuIwysqo+3dMeDx7xTwGzAgDCwRnsULILdH8IwhQsuc8PoP4m36
	g/vamFwKBLsY1tCCpvaV4yMtBVzOJuWjXJzNnGTx5QAqun1Bofj0hdHw0OYpM9agLNo7hxc/lrb
	lP+BQc2kQA7q2wLu6h4ffN/xAT6dHXWJQ7D3ql3IO2Xaovwt204Up/br3mGNp5+9GDcybPFEBsm
	ztueMmofa+tkDLtKe2hX6YxwG4mWuptmynvu3N6iReMIWM/7FUVkL/wnCH0YQE1Tuc1iFfoAN1X
	uhrwpPvwnK2K7cwd6gSindAqlT/axWg7b+wm8RBuEPDYuCo4CjU0E84gJLOatyUYY0IVsPYEVz+
	DwCI+LGguNg3dfhyxgMmbyphwA
X-Google-Smtp-Source: AGHT+IH15GvEAXtn1Cc+BW1xnjMuI3XyWdnGWz+g2x3QI3zyV1TsCivprcr2Z1uwLRFywUPhImsCJw==
X-Received: by 2002:a17:903:988:b0:297:dde4:8024 with SMTP id d9443c01a7336-297e56622c0mr136137515ad.23.1762853881608;
        Tue, 11 Nov 2025 01:38:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 08/18] squid: upgrade 6.12 -> 6.14
Date: Tue, 11 Nov 2025 22:37:23 +1300
Message-ID: <20251111093733.1393568-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121511

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: copyright years updated

Changelog:
https://github.com/squid-cache/squid/releases/tag/SQUID_6_13
https://github.com/squid-cache/squid/releases/tag/SQUID_6_14

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-daemons/squid/{squid_6.12.bb => squid_6.14.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_6.12.bb => squid_6.14.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.12.bb b/meta-networking/recipes-daemons/squid/squid_6.14.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_6.12.bb
rename to meta-networking/recipes-daemons/squid/squid_6.14.bb
index ba5ca3a698..e6841719cc 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.12.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.14.bb
@@ -23,10 +23,10 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://CVE-2025-59362.patch \
            "
 
-SRC_URI[sha256sum] = "f3df3abb2603a513266f24a5d4699a9f0d76b9f554d1848b67f9c51cd3b3cb50"
+SRC_URI[sha256sum] = "9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=6fbb6a2adc362e206da7b4f42846cdec \
+                    file://errors/COPYRIGHT;md5=c2a0e15750d3a9743af9109fecc05622 \
                     "
 
 UPSTREAM_CHECK_URI = "https://github.com/squid-cache/${BPN}/releases/"

