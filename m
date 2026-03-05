Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5229F47CCE
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:18:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53707.1772741878424425310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 12:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFXLSMc5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48336a6e932so53335045e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 12:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772741877; x=1773346677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpgLKxsbdx1rd6oFO1f5qhLmQCb5h8+Kaf9YwK+wmdE=;
        b=XFXLSMc5srjCK9m3qq0A1/uMVv5lj0Oean5+fZW04uGRnusWzUj7LWEptYmZ5Em130
         5sl2ukIF46SlfIPxJIMBmcOvd6ZOq9apdQfmolCqXW2tHrrpW+R4l33nXhzh0iZQRhAC
         T102n1qQuNt7q336+o5RX2sAEnYqyfU7CUb60fNNq9PQiC/N/bjYOMHIywb8eWZbYaRJ
         EW3xEMLdNrRrnxD1H887LsGxPvtyMCLnVePRBC3Og7IUb3mI/GejlBnjcG59cYOmBBV5
         gbCs3RdMXES7X0AlPu4wUKLsxImPYoMxg2a1guuhcutfZthypwpGMy8eXmTqFfXkclMm
         Tzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772741877; x=1773346677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpgLKxsbdx1rd6oFO1f5qhLmQCb5h8+Kaf9YwK+wmdE=;
        b=MQhkbFJWvEpy4FlJzgUiFXpmP/vxQ6rV7RWhLKVuAqjnVsOwef4pFX32K1XwzWhDyI
         VLH+xZfEL42w/TtC8PkLNyBLQucFXuZOEaP7Re4esjnWnpUJ9Zi6HghukjF6a9q78/TM
         7ZOM+MQeSa+Q9iZ5kffp0Yfww+M+dN4wDtJ64E/+AFUP0uIQA1zq7yv0yUWAHZgBqpkQ
         X91FEijr58iRktazytXuOlx/SpF1t/awz/vwjKWgcPo4jraksAjF5TINpjcy8qH7hanf
         9joNWUxFPELX7615cKDuUCmhB7BKa2dVRBoXmalqox2qFQ0nwuHbGxtRRn06eu7rWQ1b
         6Gbw==
X-Gm-Message-State: AOJu0YwGoVRN4R9amNVOggvoFV9NgJWxAvI+jOlcQ15Y/WzyC8BxMx7o
	YQ+qCfDm7ov5l/xpH2HjuWT8oKuV5e1InVV1H8J+lw/2U2U3oi7N0KSl5vUV9w==
X-Gm-Gg: ATEYQzxZubY3KpHm7FWsIIfmYP4nj+I8Zw76S1yWv2C6gAvoU4G5A/+1e7yU/8naNZE
	+PG6hpztMywNaiAYyNWoLEAXzt5ZsGx4Hr8yTQzQqhkfDgavdcjio9UUW1eykQoYiDYe7XjOxRc
	w2M9tbJMRS1N3Rmamh9znowe6McYk3XLth1DMWB+ag/Yp5u4mTNlUrUoniGNqSSXg89EkJs+Ztb
	udWYCQ1qNK4/yyFhMFLHGPq9zu+HD3fVLtCPBjRMrzBcG8IA/JfC2Z4A+nJWHnTseJkpfEO860m
	7jzy+XGDxsBi2xYCo1BM22rJbw4ZAJgp0lsbtUIN5a59NBZDsUuTYa0+Zls0BkZbjxm65X4o8ce
	BTItVk0dmYiEJPyawA+x6+aFxfEIK0HWlkrjORPLOQQyV7ybSF10ye65TH7cnRYX91JtmBbFxr9
	lWYthbKqBrzX9DPKaNQhVY
X-Received: by 2002:a05:600c:c84:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-4851985df94mr137779055e9.15.1772741876752;
        Thu, 05 Mar 2026 12:17:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm120009585e9.9.2026.03.05.12.17.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 12:17:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] nghttp3: add recipe
Date: Thu,  5 Mar 2026 21:17:49 +0100
Message-ID: <20260305201754.151603-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 20:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124894

HTTP/3 library written in C

A new dependency for Samba recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nghttp3/nghttp3_1.15.0.bb                 | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/nghttp3/nghttp3_1.15.0.bb

diff --git a/meta-networking/recipes-protocols/nghttp3/nghttp3_1.15.0.bb b/meta-networking/recipes-protocols/nghttp3/nghttp3_1.15.0.bb
new file mode 100644
index 0000000000..2539939bb1
--- /dev/null
+++ b/meta-networking/recipes-protocols/nghttp3/nghttp3_1.15.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "HTTP/3 library written in C"
+HOMEPAGE = "https://nghttp2.org/nghttp3"
+BUGTRACKER = "https://github.com/ngtcp2/nghttp3/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2005b8c7595329cc8ab211085467600a"
+
+SRC_URI = "git://github.com/ngtcp2/nghttp3;protocol=https;branch=main;tag=v${PV};name=nghttp3 \
+           git://github.com/ngtcp2/munit;protocol=https;branch=main;name=munit;subdir=${S}/tests/munit \
+           git://github.com/ngtcp2/sfparse;protocol=https;branch=main;name=sfparse;subdir=${S}/lib/sfparse \
+"
+
+SRCREV_nghttp3 = "d326f4c1eb3f6a780d77793b30e16756c498f913"
+SRCREV_munit = "11e8e3466b2d6a8bdfd4b05a3d1ee7805c5d3442"
+SRCREV_sfparse = "ff7f230e7df2844afef7dc49631cda03a30455f3"
+
+SRCREV_FORMAT = "nghttp3"
+
+inherit cmake
+
+PACKAGECONFIG ?= "shared"
+
+PACKAGECONFIG[static] = "-DENABLE_STATIC=ON, -DENABLE_STATIC=OFF"
+PACKAGECONFIG[shared] = "-DENABLE_SHARED=ON, -DENABLE_SHARED=OFF"
+PACKAGECONFIG[build-lib-only] = "-DENABLE_LIB_ONLY=ON, -DENABLE_LIB_ONLY=OFF"

