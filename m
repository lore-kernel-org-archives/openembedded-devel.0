Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.17480.1604079100123692877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 10:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nr9S/OsW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id f21so3283107plr.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Im6A71Knc2eodZkMSr1sVLEOuk/UBBSBNTtRIQGGBPw=;
        b=nr9S/OsWgaQVuhnt7OvnvtilEyukgX91qQEE0XGFZR16COcuYYyTPYXldGTjYFuCLs
         VhI0PAlcPDPg9sYjpioS1HOTVE+1/7pJXY0MfQ+SdUywgMARCv24lHX/V7/b7VeGlbfa
         QcHrepbpik8A0M+MwofKwb0tpQKcxhzARtmNEiAEpFaPdMZJZ6NnPBsfPdcACDrRg8Jg
         n349adDJQkuRCiCoEcmlW2G5+97h+D8uj2RA3i2yi6f6jJwMXg1bRZzr5rMcw/ytpAg5
         fiHVwK0N8zcWMSef3jJxRVWtnXtBZkzt5CF3t0PAhMl5KXwBbYlmCZIxjaBqIYPCAoh9
         33vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Im6A71Knc2eodZkMSr1sVLEOuk/UBBSBNTtRIQGGBPw=;
        b=b2UB+eGjXC4nLsMo0oiSeBU4fE2enPcKRWvD8W6zmpGRU9xsg/8PF0PsKB2oUc74Rg
         udc90D1jp5yyw72d+VU3XwEeaPItOwvIKXQod1O01rVGFNyun7oVjCegwG0OXHAy9IoU
         eC2ToKTdtyFwBW2oliPiA/KmrPp+gYDw2n1pnNlwCfa9rTiczuJN8X7z7IruWFeDmXZU
         /zaATAsutPSZdP6Ra+odVOCL0LuY6E8XwT2V3ceUQfq8xLm5PRhll+qCUj2RVr4oGOXt
         7jYaOF2g+U2JruMeXKmjnN3mfYT+ml0ppPpxBDBUoM3nEwvIcgnVeVo3SAkCsQDT+AVa
         tIXQ==
X-Gm-Message-State: AOAM530w6v8BkjdUDiEs2TknRFxJui2ndzjl24rScKr29vmj5ITlLXHs
	oiFtY6xxAo1lwlOT3Nw3ZKMLqgC2fcaBSQ==
X-Google-Smtp-Source: ABdhPJzOI6MbQHv7x75qJdk7aOGz7pfPw1AgPUU3UOEhLqSPYP+a50ahBVdhx9l2L7hTQ5GvOpPRnw==
X-Received: by 2002:a17:902:6803:b029:d2:42a6:312 with SMTP id h3-20020a1709026803b02900d242a60312mr9702176plk.24.1604079099304;
        Fri, 30 Oct 2020 10:31:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id mp13sm3985025pjb.36.2020.10.30.10.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 10:31:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] nodejs: Update to 12.19.0
Date: Fri, 30 Oct 2020 10:31:35 -0700
Message-Id: <20201030173135.800026-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201030173135.800026-1-raj.khem@gmail.com>
References: <20201030173135.800026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This perhaps is last release in 12.x LTS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/{nodejs_12.18.3.bb => nodejs_12.19.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.18.3.bb => nodejs_12.19.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
index 7d8fd1db94..9d15586238 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "71158026579487422fd13cc2553b34cddb76519098aa6030faab52f88c6e0d0e"
+SRC_URI[sha256sum] = "3b671c45c493f96d7e018c15110cdbafa4478e5e5cfc9e6eec83cea9e6b551e1"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.29.2

