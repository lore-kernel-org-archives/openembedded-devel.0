Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.9302.1599641158915917284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Vs5PusIw;
 spf=pass (domain: blade-group.com, ip: 209.85.128.65, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f65.google.com with SMTP id l9so1492862wme.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ONU4gmLB8SWDx3MAOF2kaLSghK96ewLBq2/7tBrJWrg=;
        b=Vs5PusIwjn+D4VmmtKOieR1tsp5OdubXxiIUFYQs+H9M8Yt1eKgWTpYnoxYR8ZP9SE
         Ml+vjJuXeAWjQ9/IbLg1UrYHD48jgHdisrYq+Z31dhfBak35O8m2wFGJa//wqqAZs7Z9
         VPn4TfHVn1woFDmnrd3Jj+3R5R2mZXeEDAvRYoIPjlAZYlcT2LDaO6jDdsnf4UKN+EGR
         AihECOm9b8arNtM+shNjoZFGxj1iNxNiA2Wyl/LLlh8d0oYLeTIENgwy9VQTWlPmHzdi
         AtOgDm95NTIW5ZonvPlWqDhSDjwRguNYqAyVR55qN00c040/dtcLrAOpCY2ULE66LvbT
         YCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ONU4gmLB8SWDx3MAOF2kaLSghK96ewLBq2/7tBrJWrg=;
        b=FkJ+MK01TistqCGWPHUlgc6fh9YmcvlAPZH79Zc7q+RF0dO5FIxKliSBlDtKOTCf8b
         h+HMgbNh8Kbw09EyZbjkRJ3y678X+cZeGprg21vlr90Q2D5vThtqBsxsgOYlbwKAAngU
         SMsbbSgSoK+mJfMLj8bhmqON9OFcPK5+VyWSOTwbvps8jHhHfnEY4pdV5YaPryzLmO7Z
         AeAQ58wiEk+/iONwE9EoARbRevDk7MRjJMmmZRCalBL1HKJV7n6UH9+P0Xqi3ksT0WXu
         YufOyBpVotqTnoB1minI6e122tQOHqhLADPxLCbRCYTqqVqo/HRtypbc9osAe4YaG21V
         i+GA==
X-Gm-Message-State: AOAM533DGGdaFVnAikWUPoaFcHj9P+QZEiWUKrtPBWFh2oeJ+h/8PKIm
	vnsOwwuG5z0pJhTZXliplJmxtft8noD5UTsi
X-Google-Smtp-Source: ABdhPJz2KqKChiWm7XQO+tuwqMpKSK7b0nDUQU7oL6Hya7hGt+3mhaZyfvm1LadPa0FyEAdBsJr5aQ==
X-Received: by 2002:a1c:98c4:: with SMTP id a187mr2435159wme.178.1599641157046;
        Wed, 09 Sep 2020 01:45:57 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id y1sm2816452wmi.36.2020.09.09.01.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:45:56 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 2/4] libcec: build with Linux CEC API
Date: Wed,  9 Sep 2020 10:45:38 +0200
Message-Id: <20200909084540.178949-2-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909084540.178949-1-yann@blade-group.com>
References: <20200909084540.178949-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

The Linux CEC API is available in linux-kernel-headers 4.10 and newer,
and supported since libcec 5.0.0, though they still default to the
legacy Raspberry Pi API.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index c4aeb8c55..94d967f4c 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -20,6 +20,10 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
+# default config is for RaspberryPi API, use the Linux 4.10+ API by default
+PLATFORM_CMAKE_FLAGS ?= "-DHAVE_LINUX_API=1 -DHAVE_RPI_API=0"
+EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
+
 # Put client tools into a separate package
 PACKAGE_BEFORE_PN += "${PN}-tools"
 FILES_${PN}-tools = "${bindir}"
-- 
2.28.0

