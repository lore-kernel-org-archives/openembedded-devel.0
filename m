Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16F2C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:49 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24384.1786747603927585985
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RMFbeBJc;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca88130e09aso892556a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747603; x=1787352403; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XkFbjI3OZ7WqANs0+gvUaU3yMpYDxlfX8Yx9PImt994=;
        b=RMFbeBJcR0qiSz0FRVKnNUB2xa4e7kIOTFnH82FgKs5AK9e4icDNQBD/XB6UPuxSsZ
         qRN40ZwH5GQu7jrcVgYAjvYxvP4JuY+to0Nok5PLw5vE+azNRCK+OAqXDBkZ8+NJ5RRZ
         hZOxhAH21w2V76BnsfWyW0i6uvg2nXybUff8pm3YfN8Pu84UpQedW9gQwjMEqSvnuv83
         KeaNuisicnYvzwRaoHDtbTe76I5Ce1jAEAFSkw44tw5puKqg1fdl+2RB+AwH0X2qaFEf
         Clbr6yjCDoqvd0Wp5oNd4/r7XEZMblI1UjPJZ4Qc1/XLIxfukIzRiwqkKWnXxb9Ci30r
         Wdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747603; x=1787352403;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkFbjI3OZ7WqANs0+gvUaU3yMpYDxlfX8Yx9PImt994=;
        b=ZCikuuPrbg2wibsOJpZXp/B0WaA5kgiEQNvyy3o6uPeX9OwFn3B5xSSmEGU/XEX/s3
         q6C3WZGVrEnyh/2fyA98k1xuClE+PFAhoY+DG8cq/eYWbcVhE3XgOOgUU+a4DQfT7NIj
         E1OrjAFhv8F8jnUhmbv0UUF1A9OnlCqtD+tloXDzOfom5vTxFjtWNYe3KAJwTUmDzzZ4
         UDknBZrgFRzuEf7P2mzhyqefYM/qGlJPpf5bsjciX3bbEI6sHs52D9PlFjBRt5qNoWpQ
         otCAKfVmSxqYkn45wWDocLJX0C6ydW9Twexwj0ZfvOmAxnMku4pLPf0Yak3p8HsRQlgb
         thJw==
X-Gm-Message-State: AOJu0YzMVIkEvnoptVd+kUW3/aOWRAVzAKGzLQsn4HR8zsk2R+4ukMtM
	1oM309bFLWlLTZ1dnTV83EZY2twts2+spetacczlp0aVRGX367hYHN9yRlbWKj+a
X-Gm-Gg: AR+sD11HZGFOvF1aAgTPRFI1Mq73+Fz3JsIQCdRszJum6xeQfhiFGL2Jge18vMeQSGy
	4zhiFxdeXowyzFP7i5B97nxdlaL+PMGQvyKH9eebc6UddflIhnn9qI69hbRAFCJvnd/jewOovLx
	XL1jqY0BnskhRIM2kdiaslC0Rv5GF42kI6zurKjr2s34elVV0hnAVgpCEvi63zV1SPEKI72WxKR
	RKW48B6FN+3hihjlsl1xj6Oku+Qb6rXPm9DVdStGzrmxJPotIVoJW/ZJCjOH8z97CHOdAaHrqpO
	ycwSSlmV2YN8ozjn/BlP8hD7bR9+R6T4ToRpzjik1ih5DE1uE4Pc44h3oxZESv8eV5lDhJZl4oL
	l+dtRVE1LUb3xKO24L8EGhpdmpQfY3EHUgNIagp6yqOU6hBUcW58X2AS6pCiLH07yZ2Jj1d8Ryx
	zT0OElApFaSHHkHrFxspUh0zbh9O7KpUXm/pZAmqCro1hjDH8CgLXAwNRstD0jDLjMkNiCegJT2
	/74Wk3fluOwRL95o6csBDhbb15FhYPu64MMjJHbPMdbciZzk7j782VFefg4xsYojb2vWpjWNMkp
	0rpM++KqUB1j2pAE+9r0g0SpQFT2N4wZuEzuYxyay5qJnHRr9itdFb+pX6DEK2DXYoUd4IbTz7o
	XKNAHPsyofCQjuL+BSJBU6dT29tsWgSwgiO/GZhihj2uOtQ==
X-Received: by 2002:a05:6a21:6b12:b0:3c3:b57b:6459 with SMTP id adf61e73a8af0-3cc719931b7mr10232132637.7.1786747603128;
        Fri, 14 Aug 2026 15:46:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 054/109] poppler: upgrade 26.07.0 -> 26.08.0
Date: Fri, 14 Aug 2026 15:44:40 -0700
Message-ID: <20260814224539.1523174-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129118

Minor release; see upstream release notes for details.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Do-not-overwrite-all-our-build-flags.patch | 13 ++++++-------
 .../{poppler_26.07.0.bb => poppler_26.08.0.bb}      |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_26.07.0.bb => poppler_26.08.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
index e07da387b2..65231df4f7 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
@@ -14,10 +14,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/cmake/modules/PopplerMacros.cmake b/cmake/modules/PopplerMacros.cmake
-index 2aed028..3c30f3f 100644
+index df03671..895ac19 100644
 --- a/cmake/modules/PopplerMacros.cmake
 +++ b/cmake/modules/PopplerMacros.cmake
-@@ -117,13 +117,13 @@ if(CMAKE_COMPILER_IS_GNUCXX)
+@@ -116,13 +116,13 @@ if(CMAKE_COMPILER_IS_GNUCXX)
    set(DEFAULT_COMPILE_WARNINGS "${_warn}")
    set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
  
@@ -33,12 +33,12 @@ index 2aed028..3c30f3f 100644
    set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g")
    set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG")
    set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline")
-@@ -161,14 +161,14 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
-   set(DEFAULT_COMPILE_WARNINGS "${_warn}")
+@@ -160,14 +160,14 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
  
--  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE")
-+  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
+   add_compile_options("-fno-check-new")
+-  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-common -D_DEFAULT_SOURCE")
++  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
    set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG")
    # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
@@ -52,4 +52,3 @@ index 2aed028..3c30f3f 100644
    # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
 -- 
 2.25.1
-
diff --git a/meta-oe/recipes-support/poppler/poppler_26.07.0.bb b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_26.07.0.bb
rename to meta-oe/recipes-support/poppler/poppler_26.08.0.bb
index ab1275e1a2..8b0783d001 100644
--- a/meta-oe/recipes-support/poppler/poppler_26.07.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
            "
-SRC_URI[sha256sum] = "304832f48f8a47fdca90c6b6d1f684e68f37c10c9a0726f345f4ca9df4ca01e2"
+SRC_URI[sha256sum] = "dc906e68cea698109706ac6aa3d2c9d4512fcfcac42d90b8afcda486d1b9abd0"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 

