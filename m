Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F40C5B543
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 23:40:32 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.9375.1748475623791350522
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 May 2025 16:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpstdcAC;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742caef5896so208399b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 16:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748475623; x=1749080423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCsxDRT0krHo9SaXxY87AFIiG8krnyOdI6JpFP/a1x4=;
        b=dpstdcACo6kNtHCDLy0WnPYZhiGjHqKTcjkMf6kTnkO+e7HE+tBmSd8BFMlcWHqbtU
         hpo3LB8k6kiMoRBA95n6V5GW9CkZ2T1XPOgJz8IabjFKWi9ZVEy3Xbvea3VNRYPSirzA
         o3B9CM0WYNir9miQGz3ClPeHo+V6QyrViTazAEolqQQzRVVOLysTYpad9a4S8ymZ9Yzg
         FhkVtf6mCFa2fGE8QCzQNdYnWqx9LGssyic24IVlCAlfanyY8mEiZOjLGsIqeIR0/KU3
         F1TdxrroBQ4QpVdXSOAqAxQ+xLWDbnw4R/tF3Bnfcc+whk2uBYXoc1MrCbZaYcQ4aW8A
         ifvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748475623; x=1749080423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCsxDRT0krHo9SaXxY87AFIiG8krnyOdI6JpFP/a1x4=;
        b=TBpEIc7BQQOx/T/R0rOsVQJAE+qXryKvgRUKoql1cL3dJs0QJHkj847IYQaWZYW+Rp
         U4XG9E1FWJtmjtiBnQxI0nDpgalA+/Ba/LJFPRPRdyxybg1Y40KmyPJ63IfRY6vM8m5B
         zCGnW3cL3Sy476xKMrqmfOuol/mjI0vK1xB+Tic9gnBCuIZPAvtiKRdkoBrW9ouai4k6
         AZvDjUg0a3ISRPaUFpugmUUSOjRIDyEGy9fEeueGPb8y9lC25O0AaqPV3T9zj0d276cy
         dqySs/ePfjXX3BsaCLHqHf74Mv6iVTwoDRjvvARv+qgisBhb7m9vKJ9EJVboZcUdFqDC
         kMeA==
X-Gm-Message-State: AOJu0YycjTywe07Jre5cmv5+CodqfU7cUnchbrqyg9ujuFvm7KBGcgSN
	hbuv89XPSGlzk9wB/WoTcDUvcVzYpxSrdMPVbGPHgcEanT7ICl0i06FYk5ysCON0
X-Gm-Gg: ASbGnctt9EgdRIK4bMJIeqcvVgp8EoJnVRQ/0JaLfJ0YEuZi2LVEj/K60yDvWbe9LHx
	D1IzISv6Dt/9oQ21bXUk/TmrFjWyac443gFazzM6PQh8mPgCuBz51pkLFHus2Haw9azbbVfXzoq
	FfQskDmXUg8/R+pPL8v7+YWZpl/lu+YEEAd1yqN0OrX4sKzOjlLYOGyyLKNRhV2mzzXzTp0Efk5
	JFiBm7mSOivNs+tqSkLFgAKezjZKpiEPUk/qJH9kOSMNV10IjTD0VXB1w/TkjeaMNfc7geoglOC
	+e7Kb7ZTIGuGGrzdL4itiiHpFdDOlUrxWREiuHDoXOw=
X-Google-Smtp-Source: AGHT+IG4E5kpzB6OC0zNvdGPlaidADLLQY11cP1rCC2wEGFcebuOriwK0gQaojv0YaSkvRNbdM15aw==
X-Received: by 2002:a05:6a20:4388:b0:1f5:7b6f:f8e8 with SMTP id adf61e73a8af0-21acba1015bmr63312637.6.1748475622935;
        Wed, 28 May 2025 16:40:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe966c7sm156446b3a.8.2025.05.28.16.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:40:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH v2] wolfssl: Upgrade to 5.8.0
Date: Wed, 28 May 2025 16:40:14 -0700
Message-ID: <20250528234014.3625637-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528234014.3625637-1-raj.khem@gmail.com>
References: <20250528234014.3625637-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 23:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117652

Define relative path for certs

Fixes
WARNING: wolfssl-5.8.0-r0 do_package_qa: QA Issue: File /usr/lib/wolfssl/ptest/test/.libs/unit.test in package wolfssl-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix buildpaths in test binaries

 .../wolfssl/{wolfssl_5.7.2.bb => wolfssl_5.8.0.bb}            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.7.2.bb => wolfssl_5.8.0.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index b7ff23e719..5454b7c7c2 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
+SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"
 
 S = "${WORKDIR}/git"
 
@@ -28,6 +28,8 @@ PACKAGECONFIG ?= "reproducible-build"
 PACKAGECONFIG[reproducible-build] = "--enable-reproducible-build,--disable-reproducible-build,"
 BBCLASSEXTEND += "native nativesdk"
 
+CFLAGS += '-DCERT_REL_PREFIX=\\"./\\"'
+
 RDEPENDS:${PN}-ptest += " bash"
 
 do_install_ptest() {

