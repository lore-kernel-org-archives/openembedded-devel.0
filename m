Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA4CA100C
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 22:42:53 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.64706.1756766571434614038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 15:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmNKX8/h;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7720f23123dso4451721b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766570; x=1757371370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=398Uv6OE9TUnATTYZqPT+rdD+rKb3U62w+LjtFOHBMo=;
        b=lmNKX8/hqWu7+XsYbktzx5TXrNELPFfDkTyLJemcs2JWl747Dc8VwRrnqgJ9H/ji5o
         uSWxLJsKX0e4iseBk7QzUG2Rm6IrIZGN0WN8LGEic1gZB6F7YPVD5pD1bxztG4uGpOz0
         LLrcEQyhTRlESFnUmbDjnKLQN7QlBEtgV3Tby+KNbVb/ya2hBK3Fb0FCcBzg6o1G9JA1
         s6fB2uXdud5JDNySCvSuHDIUzI8Y1kzddmGzJgs+QvooLKuj7Oh8O+mnMN05huyUPBxR
         X421jsWzZ5K9HU3kGdSGcwwYyozAWQDl70FmjGAzg88gvmG/f84/Rn2b7rdVWwgGaUsV
         ryqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766570; x=1757371370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=398Uv6OE9TUnATTYZqPT+rdD+rKb3U62w+LjtFOHBMo=;
        b=qvP+wKDoJGJ23DE3uzO0EQudnIIOmuWcE8O8fffxMXHAMNKDu2bWGqwivb6vo58mFM
         bgKTM0/ra0yTzlan1cmGdINBWgwAjueugeNNyIzRIOX4vS8emzY6xjQ4yv+HFvcENIdQ
         pEptsiPNSWZG0dPJeVPzC1VrQezrgIu+53kuj+7Y+BunkHKcTwGIriXs6KnX9Q/MkHfG
         RNQeWPvijs3KSvf2OMGIHcNfZUMec84qf3utfqaUdjYGiYbFRlVRVQe/M/NxnMBXamrz
         eM6Blhout+eo8hnaw3GerjmuV2eGAfsP2beM6NFWY7lAbbS29f9rpXjkGv24NPc1n2cF
         wdpQ==
X-Gm-Message-State: AOJu0YxEo9GrcsVrGbUwHJYypF/RJLr5KEP7xNNN7n0m/FdWZUQScsk2
	aQCbVRl+vafe19DQVHhnUNcoNvbjwL1aJmJkueyKl3uBBGWTMCR1ftce20qIhEVp
X-Gm-Gg: ASbGncs+SRII8kcMN3zw9FJs9QBxNFkfEzuBCQvS6Bdt1GoWRGr8Zb/D917MWOV8JLc
	vdoo9YLez5fs2HDaCs+Kap9z99ftJo3pgXOIXQtbsSVkRgGT0uqyVC2lGAxqY8o6bPJkcK1mxkz
	9aXb++lJbufYnts3Jr1tjg+G8u14J3T/O8q09vjq1yLUbOiD2M/R3TlYs0qCDjXnlz84SmVgGGf
	nlp7NFWwY9q6QKbRlPtvXZsN0hr6gkScNubK8ztMMBs0s0D9QBbyF1ktJu0sT9KHe66YvJd07Mk
	vIVhYOYx1lG/M7tnND5SzImi2IH7uhlX9XQgGD56Pds8jcKr4MuPnbjf/cHbAvknFn5XgR4JAA1
	HW15Y/Nfy6HRYu/gA/Ms377fR22Bl9b6sC4aIGmysodrWVH5NJDJSTbmw0zeCTi4I0jij0ngFyg
	bCtDzOLKtdMLv7oCX8KORbynHW+UYkK/tN8VaFO5E5
X-Google-Smtp-Source: AGHT+IHMDrmdp3AFP9YTH48gB0s0J1/HWdKEjtSfhqFxdoGhg+43cEOzv62L+x5lnV6dp96w7e7tfA==
X-Received: by 2002:a05:6a00:198f:b0:772:6493:7e67 with SMTP id d2e1a72fcca58-77264938010mr3051841b3a.3.1756766570502;
        Mon, 01 Sep 2025 15:42:50 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb72sm11648240b3a.61.2025.09.01.15.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:42:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] libjxl: Upgrade to 0.11.1
Date: Mon,  1 Sep 2025 15:42:41 -0700
Message-ID: <20250901224244.1913647-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224244.1913647-1-raj.khem@gmail.com>
References: <20250901224244.1913647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 22:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119164

Use -fno-integrated-as with clang on arm architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libjxl/{libjxl_0.10.3.bb => libjxl_0.11.1.bb}           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.10.3.bb => libjxl_0.11.1.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
rename to meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
index 2405126e5c..7b0a6db9fb 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.3.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "gitsm://github.com/libjxl/libjxl.git;protocol=https;nobranch=1 \
            file://0001-cmake-Do-not-use-mrelax-all-with-clang-on-RISCV64.patch \
            "
 
-SRCREV = "4a3b22d2600f92d8706fb72d85d52bfee2acbd54"
+SRCREV = "794a5dcf0d54f9f0b20d288a12e87afb91d20dfc"
 
 EXTRA_OECMAKE = " \
 	-DCMAKE_BUILD_TYPE=Release \
@@ -43,4 +43,8 @@ PACKAGECONFIG[gimp] = "-DJPEGXL_ENABLE_PLUGIN_GIMP210=ON,-DJPEGXL_ENABLE_PLUGIN_
 PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIME=OFF"
 PACKAGECONFIG[sizeless-vectors] = "-DJPEGXL_ENABLE_SIZELESS_VECTORS=ON,-DJPEGXL_ENABLE_SIZELESS_VECTORS=OFF"
 
+# lcms/src/cmsps2.c
+# error: out of range pc-relative fixup value
+CFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
+
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"

