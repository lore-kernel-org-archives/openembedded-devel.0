Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12E9F8E498
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 23:38:34 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29859.1776382704815909399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 16:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d01g9Dnj;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c565dd3a7so253990c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 16:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776382704; x=1776987504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq8xF3f7omVmICYLoZeYgdcJkqRFIPd7BQN5Y4vx02w=;
        b=d01g9DnjrWT2W/B/P8retio6hpURHTAQiMEQDfBw+jjh7QPVusPnUqv0AdTUXcldwp
         MO2YAgrh+OgWkLm83HJvSeKLUOt9hOqLedePZTFejJ9UmqO0jC2Qx5qnyslalaIsimbX
         BWPikW3q6QVyhi1ourQiLJx9+1qVyQLVppq0EYgOWL4Jgi1EF7SV4PB4SHD66l+h6jf8
         L2ej21gH2XmM9R9tbhE5dInFmfMQ+JWHvLG35I1gWXCOYc27XSXfwIwkuWkMTuw73qdt
         CSldfw1TveokUjVdPlWNqHnFVJNDo3IEsA2D49nmoL43QXxHFA8cB8b47tSxSqfwt9Il
         CLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776382704; x=1776987504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gq8xF3f7omVmICYLoZeYgdcJkqRFIPd7BQN5Y4vx02w=;
        b=JZsmXMzu+0W5GFZ1xt32Xt9uEvpjn1b2n+BSgfGtjfBSvbZBi7slGeXk3w00blGaJX
         Nqmsnsxiw3V5gPkJKVw/D+hEqL39aNPQDizGHUb50u7Lp2G5xg5HC56dIcFKhsPt9+S6
         gQmcSFT67KpScYd8vSmZ+pC2WgyL0i4rbH+hgsG1G6Rp9Lpo4a4op/Gz8rSAJIM/zncC
         otukvin9qvSCksBnedhiLQtKbSz9J2GRBuzOSMkIVtPm05ANU9JXDeKWqWwLvXuS4EuD
         ty03SQraNBxTtr3lzhenieFuz56PFzZp4/0RcwJLRoiEZsil5Hh6dScyDRGq08gJLaqM
         jC/g==
X-Gm-Message-State: AOJu0YyMF1Lf/SoMyDHaY5FVUcf/L1H9CDx55VgoswVj0ERGfiu9Ivmd
	InkPSMIKCGpDnGhtW8/1WizImzLCHtSRRQBJJLGyECr/LRz44A2019ASzLKpVtZl
X-Gm-Gg: AeBDietHWmmxf74mar0XIAIsbmXue+9MDzjC6uGDQK56mi3pfkiK97eWlK9C7wbgN2a
	Dsd/5DYcPKpGzZ9LAsOSfoNoyNUShpa5gcNSUWOXzcKswt6VgC+LSjj4AccQRDpaf7zDmfp1wR0
	nIUYIavPxOD1tyFVJH9vijyczgvP6N4KjLQXycRto1p9SRaHIqxIwX3QnYwIvWyOv33AimpOiln
	Td2u6832/i5XLFQZJOUpBfdcyxZ9+afktSCEMGXNqpA/WU7Xuy5NLWCK+5gk9lN9zhQ1+jxAh6m
	a2rKl+Vagbh+EGqPq+OyagbWJDAHKOeMP/SoFvlwvj83kA30b/dFIotzzKC970OOMvBPEYLooFM
	ByXKs1IcZU2WMmLhPICAoPLV/2JOdrXGXI39O2xzOs7DN6zo88AKG8/o0sn3LDvUmC4V1+QTzc+
	Jo0lMwkaoQ/SyGhWvnV4wiLKjKXvp2d3rrjEoCHMF2v05iEb6Pl+Htia9EEYdBhf7sYRPy0NoPz
	dgO2CFC6aDpI1mm4TYNqfg4FiHBSiMmuVHRfBVpdKOCgAibWUi0ILV204H2y+U5hBCWT+viKwW9
	hksv3PiJkGA7JyMOwqK+lJgDmthYFdusvz5KxzRosW1AHq05ObM=
X-Received: by 2002:a05:7300:dc05:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-2e46519e36dmr216884eec.6.1776382703894;
        Thu, 16 Apr 2026 16:38:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e4c3f4fe72sm247993eec.3.2026.04.16.16.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 16:38:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/4] libtoml11: Fix build with C23 and clang
Date: Thu, 16 Apr 2026 16:38:18 -0700
Message-ID: <20260416233818.3790619-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416233818.3790619-1-khem.raj@oss.qualcomm.com>
References: <20260416233818.3790619-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 23:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126423

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...move-more-whitespaces-after-operator.patch | 34 +++++++++++++++++++
 .../libtoml11/libtoml11_4.4.0.bb              |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch

diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
new file mode 100644
index 0000000000..5bff81eaf6
--- /dev/null
+++ b/meta-oe/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-operator.patch
@@ -0,0 +1,34 @@
+From 6af7de3d5eaae59c53c42aab8eca1e1e9a365da5 Mon Sep 17 00:00:00 2001
+From: Steffen Winter <steffen.winter@proton.me>
+Date: Thu, 25 Dec 2025 20:48:02 +0100
+Subject: [PATCH] Remove more whitespaces after operator""
+
+Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/306]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ include/toml11/fwd/literal_fwd.hpp   | 4 ++--
+ include/toml11/impl/literal_impl.hpp | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+--- a/include/toml11/fwd/literal_fwd.hpp
++++ b/include/toml11/fwd/literal_fwd.hpp
+@@ -24,7 +24,7 @@ inline namespace toml_literals
+ #if defined(TOML11_HAS_CHAR8_T)
+ // value of u8"" literal has been changed from char to char8_t and char8_t is
+ // NOT compatible to char
+-::toml::value operator"" _toml(const char8_t* str, std::size_t len);
++::toml::value operator""_toml(const char8_t* str, std::size_t len);
+ #endif
+
+ } // toml_literals
+--- a/include/toml11/impl/literal_impl.hpp
++++ b/include/toml11/impl/literal_impl.hpp
+@@ -146,7 +146,7 @@ operator""_toml(const char* str, std::si
+ // value of u8"" literal has been changed from char to char8_t and char8_t is
+ // NOT compatible to char
+ TOML11_INLINE ::toml::value
+-operator"" _toml(const char8_t* str, std::size_t len)
++operator""_toml(const char8_t* str, std::size_t len)
+ {
+     if(len == 0)
+     {
diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 7e097e4612..c0a550b910 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -16,12 +16,15 @@ PE = "1"
 SRC_URI = "\
     gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main;tag=v${PV} \
     file://0001-Remove-whitespace-in-operator.patch \
+    file://0001-Remove-more-whitespaces-after-operator.patch \
     file://run-ptest \
 "
 SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"

 inherit cmake ptest

+CXXFLAGS += "-Wno-error=c2y-extensions"
+
 EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
                   -DTOML11_BUILD_TESTS=${@bb.utils.contains("PTEST_ENABLED", "1", "ON", "OFF", d)} \
 "

