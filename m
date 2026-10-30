Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8931.1793358196892239144
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fxPVAX0s;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so265359f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358195; x=1793962995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5MUGv0Udy14VX3G8TB09vFybb9GvT/ZGJjUoQpvtCU=;
        b=fxPVAX0sNUTo9efR7Wk4ilKpmKP7XCe0KV9aRZGKN2uNQtJlf2m0wH1PQhf2rzVOYg
         vu6UqdAzEeslnAGdMWKAPtKcqSSl8A+Yt3LQ5Kun2k/wY+PgEwNntdo7aWv8Ibls1jcX
         4xVKVU0ixloWKPbD+DoZNmBp75yXwDs3QR4h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358195; x=1793962995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5MUGv0Udy14VX3G8TB09vFybb9GvT/ZGJjUoQpvtCU=;
        b=w1Jp0pkeC4edlM24l3cTxwFHGglFqjKDH7KNrcPbfTeE408+1iWlZEvRGwwSNzco6d
         8k1hZzYMtYw8bNLIslHwGlePYHi7s6T1DFjaSE10nvgvmID194yGVZfJCF3dMHL64swm
         3K9oMCWe+6vdvIfBXkMsG7jcwsJeCqeyGdwmhyV37eOd6f9NO1ReahKCzVDuTYEbllDN
         lSVPnAL5RlnT79mVHs6v+VndDkk+CBU6YaRl1UrzC/c54s8gGlFyA+wq7h06TMocvxd+
         k7t84niWvqHSRZNw9XL85/p3t7N+2S2LjkC8dpBOlmNgNAUuU9S2GI4KN2ZSOAqiOfH3
         oRWg==
X-Gm-Message-State: AFq9FYKuafAH1Dhj8kZm04sgehhg0j0w4wDBLxI2EGlLsbgjyQBy0j11
	wsTFJwY31hmZoqGEKqnFcJXo1Lq8vzhK0Fy01ulAnHdXShIYaKcCIneI45wP5fgk9o4aWyP7KMv
	Jxw6v
X-Gm-Gg: AYBFou0jJv+S8S/lNGCAgAPgv6uF9xL9/GE7QPuVYtuMqSmh7BIKHIRcMWIK3eDQnwV
	8q3tBuF4cY2FIZWVkMscxhh2Rit8AS91CcxSPYrBy7MC0lHOSfrfdHRSgaLUBJ10oku1YsDpLM+
	gJFv/4xH/dwn4fVjiSi9uF2DHZ0MkvmfCU1pLiA/KNo17gxdSc0pvrWMm3A0SX8UF1hBuOmdYK1
	nejSTMzy/DzFIrm9T/jEoE2FO1a/9A0OmmA98zVrcy1PVbsPkTUH9UWSjWwOUsoJnJSqauXdBGE
	XoeQDl2pXSGh/Ph7vfB6iGvzAeuZDO97KMLHvFssfhf5LDUZOZe2y8DTnj8OFAtYRFa51lmiYny
	JbD8ATqSG+plCYBBeBhpNSxpekQ4+RxjYKu6/N+g/0iY3uk5uDtogLu62XX2t5HfIkzw/voLyEJ
	0yf5agCLi/AaQ39XvD3JikyWcJZU7UNcWWpB/zFRMsPqxRmVRApcvq7r2+R6fdkqU7J8UhhKM/K
	kAiY+5WuOdWg0y1obALTZL/wGt3J0NqYhEi3RcPce6uMVxgpcNSM6HS4tTNEXcSaLR1owwQMJrT
	Zt6L8fqnuAQYXdFwBiRIVpJP7FV+3fzbP0GlTSAZ+Kpvf0m2q9zKD3LtzezIezE3JZCaUNr+hlZ
	zt8hgn9x8HQ+6H3DAdLb4sLIVt9gcf5Miygy/giyfmdVXrT2Spou32/lkSfu4lL0hbSMygxIbIj
	ZI
X-Received: by 2002:a05:6000:29c9:b0:48d:ff06:c634 with SMTP id ffacd0b85a97d-48e6e5036ecmr2612581f8f.54.1793358194659;
        Fri, 30 Oct 2026 04:03:14 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/25] python3-cachetools: Upgrade 7.2.5 -> 7.2.7
Date: Fri, 30 Oct 2026 13:02:45 +0200
Message-ID: <20261030110309.1124614-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131683
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.7:

- Various performance improvements
- Minor unit test improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_7.2.5.bb => python3-cachetools_7.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.2.5.bb => python3-cachetools_7.2.7.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.2.5.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.2.7.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.2.5.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.2.7.bb
index ec6e612e42..4b564bc3f9 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.2.7.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "a2223b80de434291ddf4c105354e533bbaf4d29382f5d1bc3e4b9332cb31061e"
+SRC_URI[sha256sum] = "e2154c809ce9e1247120258c36821467597b5663d44c3255a9790785f23c2b1e"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

