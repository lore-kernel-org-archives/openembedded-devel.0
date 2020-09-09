Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.9262.1599640973961688556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=K01CG8/X;
 spf=pass (domain: blade-group.com, ip: 209.85.221.65, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f65.google.com with SMTP id s12so1971483wrw.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ONU4gmLB8SWDx3MAOF2kaLSghK96ewLBq2/7tBrJWrg=;
        b=K01CG8/XrSkrWsIcv6t1ERc0aAwH7LPcTvU6SE1YCC221Al1VoQwunL0bvieQfqshp
         Scn2vnehiG1kO/vQ8AJd9KlymUrDOVyjjPFqMSvDnsAvRhCyOeWxGb1LWTIj6WzJqUY3
         Udq0kZhkq8dFDw11RN+/BUvY5o8UzRnwEJN6K+gCj4WJHqL7Kap5XFo1UDelJC6epqYr
         C3EiQVzpmsZqsjkfJM9ImUhIkGqCw2Oz2SuewXZjyCklPe/EOZopKQkciWBcxuLsGCpk
         5viP+Y3c+IIXtd+e0euKPiuNCY8IWa9q+/HKKRmtxBPVNiZ2VCRRx4FVT501ZO/uY928
         Ak4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ONU4gmLB8SWDx3MAOF2kaLSghK96ewLBq2/7tBrJWrg=;
        b=lArbPKzaMQYP+SrIOpZjDbT+zWhDfATxVThwrWAw6uKkCe2c7VHbbTTqfbWx2ppyKM
         7dM6P8/cm8wZCWK5Ibc1oLXT/4YrW4UP+Ix4d+0QNgGTpCZhKnOIbmdSIYhfT/FEy4Xn
         EsqhZ9XCB9eUS20rAiymvRyc9FJ2TzppUcBH81TEoMoS2hubaeuxIgjBPpwJuWu6/UIy
         CtKhttV9dppMZM5XDF3cZkvyr6C40TTwKYKHlRwv8nq/MoZd9+VKJ8ZhNfYafMgngl1P
         3VYNgPZTp2LBpEpW0WIIVUjvn1iITFJFGVpSZrC9VoPgAeUwhlofXgLXcHnN1SRtC7Bq
         AfaA==
X-Gm-Message-State: AOAM533xHcWDjtMRPWxhDl01gDgqJxRdkG3gzwn/gc4YwTy0S7HmMcNP
	8bBKF570TaCGu9zthz3Nh7MVT2H9bOGqQVTm
X-Google-Smtp-Source: ABdhPJwbRk+tkF25ph+ka/yWPvC8HLmMe1MLSJmAihx7a/g5wUUaB2AhQz5Sy6IcM6A4uysDvqI5Rw==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr2717573wrj.94.1599640972044;
        Wed, 09 Sep 2020 01:42:52 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id o4sm3027825wrv.86.2020.09.09.01.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:42:51 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 2/4] libcec: build with Linux CEC API
Date: Wed,  9 Sep 2020 10:41:52 +0200
Message-Id: <20200909084154.178795-3-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909084154.178795-1-yann@blade-group.com>
References: <20200909084154.178795-1-yann@blade-group.com>
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

