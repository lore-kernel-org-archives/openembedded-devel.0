Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E80C197BF
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 00:22:25 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.5117.1740702143283757457
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 16:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eSeKvL/3;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4721325e3b5so12293981cf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 16:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740702142; x=1741306942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=65Z3/BP2/tzUcdP2iJhr9IOpos6D/nn726kaXX5GxS4=;
        b=eSeKvL/3va/Kfa98C0yLpElmyokDWhx14hRCVJH+ZqBNcDd7N0jqMpkOTPp8p9x+Bc
         ZVPZFf0fKo5xU0xQ8E2vFtOqBNkX2zOZqvwFzAYZQ/KHmyG7Duf6QU/Fn/9/QFfpggUF
         iOm3IsicbasbejNdD7itsb0q0dj1Gc1wpA1MHaQsGVLfJoSdssQRA+v362VoERy72z0h
         Fiao5nwY2qstb74UFOI2b3D7kQNViXPH/uIUv+/wrUviW41Vk/NrWb94Vl/eCDKVreMZ
         wocQDV9lT3etIn37U+Fw+UZXgIcJjuZYdEfsg1SwfYN4XTGFt2XLNBeYcItb5TWqfHTF
         22tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740702142; x=1741306942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65Z3/BP2/tzUcdP2iJhr9IOpos6D/nn726kaXX5GxS4=;
        b=B5mSLSQWjSSbAt5WjctexR40bcGaOa6O+5slaYHw+fl0vN/h1fnCbWY+fRX34GIHq4
         zkf/ANMq6zpAXZNxKA9I44uOAB3+OkKBy5Ljd00g5RQhwfkQNoS/eAArV9Q5nrjdSHvY
         HaIuoWjSFen5449GFjAvnXZBoPO65537dAegIPfrUIbydTYCn9eLK+K5y+Ai7jiy5FIj
         2c/v/XeqGrkaETEdwhGH5+Qhg7z02EiOxQPnAtLmf4oDd9BxLgdj3bXokYXHuPuJ/MDL
         Ws/BfY/bLAr3Ztk5QDDuPaT49llLFrrClffteKf734Bqq5NFQ30OEgDstkTlAQZR4gvA
         gu5A==
X-Gm-Message-State: AOJu0Yym0Z28LU1fI/Xzas9aiAzEsxd1XcqdyDSs6qhu1Q3o6HdpNYIL
	Sm7HCqwdJ3rJnkIFylvlLby1bz6z+GrBKq2nF3EKaWco/Vg/YdRraewLOjLj
X-Gm-Gg: ASbGncthukMFEGpyLyV9hcUgMlzdNaweoqsBC6aMZpzs1w8RpWUdvI8g50IVXSCmGEI
	L7CEsBmFhR4zf6J3hbTFCKZLqlweAS6rsFukhiE5W2+rA5Qh8BWqYjQh1UR6usA1jj/1vG8+twM
	5OL3BI7mmvbHEzlhTncejTy6AZX9wc7M+GD0GfZb/yZonaXjfnXVzMtEmB15v5KBp1p9W8tKwZ/
	bcQqbEABJ2SzBw626PQyY5Eon/LEBfa7WyOM+Vn02hjPCfUyaFpT+r5L4Y5UVBgGQV0OB/lCxWM
	Zctgmif+YeouXXPZxoR3hXFF60WFgqXklf3hm7V2CfqMhRhBm82ZfFwzWlpGMLrqkLBXrg==
X-Google-Smtp-Source: AGHT+IGH2jUPx2rf9QjRwHa3A2hKiuNx9ZKEVDklFaxNZ1fRNZQf4MzP1RtZR5r4515oKyOw/vZrSA==
X-Received: by 2002:a05:622a:2288:b0:474:bdfa:161e with SMTP id d75a77b69052e-474bdfa16demr5997031cf.44.1740702141527;
        Thu, 27 Feb 2025 16:22:21 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474721bfc1esm17860921cf.40.2025.02.27.16.22.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:22:20 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iperf3: throughput fix
Date: Thu, 27 Feb 2025 19:20:24 -0500
Message-ID: <20250228002024.34500-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 00:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115704

This is a backport of a fix to iperf3. The author saw a 40% improvement in
their network throughput, we've seen around a 55% improvement in our tests.

Link: https://github.com/esnet/iperf/pull/1708/commits/ac6b9f7fd335ddebc5212eed40083ef4cd3cb86d
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...-not-listen-to-old-udp-prot-listener.patch | 30 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.17.1.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
new file mode 100644
index 000000000000..da1664ddcf67
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
@@ -0,0 +1,30 @@
+From ac6b9f7fd335ddebc5212eed40083ef4cd3cb86d Mon Sep 17 00:00:00 2001
+From: David Bar-On <david.cdb004@gmail.com>
+Date: Sun, 2 Jun 2024 11:52:03 +0300
+Subject: [PATCH] Do not listen to old pro_listener
+
+Clear old UDP prot_listener from read_set, as currently the server's select()
+always return when data (that is relevant only to the worker thread) is
+received. This makes the main thread consume a lot of unnecessary CPU, which
+reduces the total throughput - especially when only one stream is used.
+
+In my single machine environment, with the this fix the throughput is
+increased by about 40% for one stream test.
+---
+Upstream-Status: Backport [3.18]
+
+ src/iperf_udp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/iperf_udp.c b/src/iperf_udp.c
+index a603236df..40f2b1ca7 100644
+--- a/src/iperf_udp.c
++++ b/src/iperf_udp.c
+@@ -446,6 +446,7 @@ iperf_udp_accept(struct iperf_test *test)
+     /*
+      * Create a new "listening" socket to replace the one we were using before.
+      */
++    FD_CLR(test->prot_listener, &test->read_set); // No control messages from old listener
+     test->prot_listener = netannounce(test->settings->domain, Pudp, test->bind_address, test->bind_dev, test->server_port);
+     if (test->prot_listener < 0) {
+         i_errno = IESTREAMLISTEN;
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
index 44fae0255f1c..2a93109b9c10 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9873a72f714e240530e759e103ac7b2"
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
+           file://do-not-listen-to-old-udp-prot-listener.patch \
            "
 
 SRCREV = "2acfcfe94e928e74542c9f107e02aa6dd4748a79"
-- 
2.44.0.501.g19981daefd7c


