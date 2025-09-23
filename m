Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A30ACAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:52:52 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.4090.1758649964123972050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C55mn1Rt;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b2e0513433bso329054066b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649962; x=1759254762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+9T55eBKF5IimVfu6j9zgt2XY1AvATxCxoVyYQ04R4=;
        b=C55mn1RtHfIoq22NmP/JSenehy/h3SjNbuV31piAhgItFoiR//2IzkcPs35pGjYqMY
         qMk4BxCS3TLaUvby/6GqKmy/+V2qZsvKp4k/PqHqEqKrhfb1fbRoclNSQGiLuVBRPG0U
         w2apuKEwWRermlAKA1MnwTuSNwYHVvI1iH8HieNUtvbemqzovnC52t8jMK64iKxybO3N
         utbYp6k7SrMWBNeAA1oj7AAyeOJS5TpKqXwiQHUpmh76BCnatYkAD+w+EuBBaflyp1dS
         puKWLwjiC7k7X44GdiKh62f17KZeClGvlNu4gl3ZhRa/gZE/lsLhY672WtJSZJkfD3ed
         FVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649962; x=1759254762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+9T55eBKF5IimVfu6j9zgt2XY1AvATxCxoVyYQ04R4=;
        b=pMMimNM/fwiJ2OOgAioZ02WpE+SOyGmuKtVdBuLPc8PmynycJDMPrKSthNr3aiRi7O
         n0LCC3SqPl7d0VuyxWGF4LhPIlnT8OQ0aodTQpiZRgDq7MHo0KmQH/35DkRf6nlR89Rh
         nisZdktHOm+8nZzYb63oX8Y0rI0OkU7j6tpWq2axSR8uYOZqmXccgGMUyBLO9IAEfXI4
         W3u+xxf1RmgOCavm9JKXhop693pK1ysikUZLp/kW8lRuas5fyPLbJWKY6wD2z65qXykU
         1om8z4G7bgMfkG3oRz4/qevwV2odRQ3s7HP/T15s9Ly0raO6VgB8Q8lKbUkWSC5/kV9r
         6Sdg==
X-Gm-Message-State: AOJu0YzYJaSpnLpIFz//wYyopza4ELkWiV3aMWwV+IWNs5qM1FopIZFB
	v8mo3jzSV3ACtSa8UQHy+Ar/Jc9Cc8U102MbYe72UhydKpJNFlF9yuKk55VRw7/v
X-Gm-Gg: ASbGnctD+VaYLXMt80dvq4PCH4jgYb3LaOhabsYHXc/LUn6uE/d9mcdlqu1ExAYlbzf
	D0b2dYmtKVrpbcyEakiwid80bccIgbuYxUapPg9vHRlhvFn9uZn2+j46KQqyrTlsZxlIuTcSsWr
	QSqq03UwAOuloKX3W2L12pasBSFQhfhj9fQub/PdZ/6QuDvMGPll8GwzH4nZ6/qAckG5zQH0Dwv
	RkvEHr+1iU1Xpsl8E9+h11Gqa2VGPiRtV+rPf5eE3NFpgVExvOS0andB/GAEzbx3pbYDKt3TpEe
	3+5PtJ9bwSNwkKya0V4MVo+BW/AFZ/Ob2cWLD0y9wgZ6p1dreYFwwowRo6EYWGggbD924bjTiSu
	5ETN/X4PrBLBgt10win/E
X-Google-Smtp-Source: AGHT+IErNQajULI6o0ZPU3i8d+gQblXVECnQXyBeTR7tigvtUQEkCWAL0MhgPxAqz+mCBMnvi2w9sA==
X-Received: by 2002:a17:907:72c9:b0:b07:883c:e3e2 with SMTP id a640c23a62f3a-b3028dd104fmr325391066b.29.1758649962253;
        Tue, 23 Sep 2025 10:52:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a660738dcsm704959166b.84.2025.09.23.10.52.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:52:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/2] tokyocabinet: switch to working SRC_URI
Date: Tue, 23 Sep 2025 19:52:40 +0200
Message-ID: <20250923175241.2293216-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119727

The original source seems to be long gone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index ae00ff4e55..9e91eff4b1 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://remove-hard-coded-include-and-lib-paths.patch \
            file://0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch \
 "

