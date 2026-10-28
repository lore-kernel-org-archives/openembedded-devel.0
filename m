Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36217.1793161551307412028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GzEwpRx+;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so457365a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161551; x=1793766351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRmWPLXpTjUvZ/R6YXZXwRgJPUBZlIjpRkbSr1takPA=;
        b=GzEwpRx+RBpLdxv+drjwjoQjASWgBY2cSRaqWbf3R4zu8IpN/J+jd9vbwhQdjeEMV1
         GklR4bGR5yZ+bDi6YSTyY5Yb4C/QHzmqDkXgB1fZ1lpXBan7v58woo2CfqMAo6mheAG0
         N6mamPfURpk2aAc0i/0mGRYufuT+DM38NRzdWvsdLszDsG7mYoxC4lp9XqaahFBzdMoh
         eki4kYTkCtMAMv8XHcHHBJ+pydKBQTu0rRXdZ2BehgROTP8tvHrCFQtHg/Dj0wh4LfpE
         OPCPqHLfOhwI+YZfdKGcMC8g4ieIToJ2Is8+hMIYwVZHAuTWzeauyLu+0viWEIl0Q5LY
         /ElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161551; x=1793766351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRmWPLXpTjUvZ/R6YXZXwRgJPUBZlIjpRkbSr1takPA=;
        b=iHW3Xr4CZ5EtVhKNmEeVtLItVyu/OUVDbeR3yr5n8i0e59FOA4M2v65WY3GGZ3sfKe
         AM/bwgeq/wsm4yZqNbgmGg7zSWMOPloTx95ky4I6DaXnWKwlgEre7wX3GyPrDKiAxqyp
         k6a1aKH8IqQIujUxFcHFnAfCF2cBR92uNPyIvMi70DwxvpHN4poGtwGKihSbKiB8jkdo
         w3aQ4xGK1dfWMfLX9M0+N/TZSaWWLYSP5Cpg7izkJEFn0iuIDshV2MqvaHfOgitzSOgv
         zcfbvuqj7EhPlcL1F2NsjjF6SFQP+PoK41nP/IVP6RSzkAHXERDo2N03ISE3FIBroqQP
         Xzlw==
X-Gm-Message-State: AFq9FYI2i68GzT9/DboyJq+MP2ePFk9eXmUAHf5bl0hsEIX66M19ohgJ
	vxUbxbSLmhQ/hc52SsEDmiT7wPZ8g1DnjdIMOaCy6fcMtoXWJ1YurmdLObd5pg==
X-Gm-Gg: AYBFou0duKLwcv8tXw12niqGWUwfg+4DE9FwCe6NUJ7EpnMu6XBe1EZjIzfnDGjN0SG
	7tB/Uc691smrNJqriyYCBqeN4PHQGWhFwZoDCkDwqwrPC0OR9SrFQecdI+HxIumIuN06dF1k9sO
	zgwn10zYud6Hri3nAZDYEPjUeUitm75gerd2fq3KcwFKNwkOQOZfmYSxTqYtthwSQ/BeYBDIHmw
	oLsoWO4GqEgIbg2RnA6QOhtVS7KpcJp6LzbAO+oG4Tl2Rwyy3kEnerTzPJgGziLY7bL05ZSZtDE
	Pn4p19qz0TEblrnQPaUWIuM/j4MdRsl2mVrwNfRIovEmeocT62+sGl9qKCzbFTeJAI0E5O/8PtX
	Xu591s5CtnMC0KIiGuj54PnMjaz8giBYbsQ4U0EQki9qb09y7294vSQuRo6Mb2Iok4rJ3fWUefe
	/4RZMT6Pa8WzWHZRIc5BGm0llpK8m6GTfAWeEBklWHSBEx0PJOYdnmzoavMJhjHhIuy/80LgIlQ
	l2yPSj73kb+713FKI7BQzp8yqflWaWeBrsw+pGgSfdnoqzgIl/hdXxqpY5ET/iVSDDW5KD8nu2a
	kVWu58VD9tqLgcvoa5ORZl6T5Wj+KNeT3ad+3Ceh1F+lCh278qTzCW6qz6QOOg==
X-Received: by 2002:a17:90b:1647:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3ae5822b42bmr949982a91.35.1793161550706;
        Tue, 27 Oct 2026 21:25:50 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 44/60] swagger-ui: upgrade 5.33.2 -> 5.33.3
Date: Wed, 28 Oct 2026 17:23:42 +1300
Message-ID: <a07cefff6a945c9374a8a4302ff5001cf59d8cd4.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131596
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 67b4387a4d9f2fbc111b52ec6cd3b7620116c6d1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.2.bb => swagger-ui_5.33.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.2.bb => swagger-ui_5.33.3.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
index aeee9e4da6..6f69070033 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "e89a91f13cdee432d97ca9d3d1ac1969ff797036"
+SRCREV = "38ca10e1867a66525751590d8d51011973107ad1"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
