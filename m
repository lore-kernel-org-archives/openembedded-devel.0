Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE39C3271E
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 23:16:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.29434.1720221394388159791
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jul 2024 16:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GcQDp8zJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so13879645e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jul 2024 16:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1720221392; x=1720826192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvE5MNmZTjqAEsf7cXEBb41LDCddpX9Wm7IxOjPwOSI=;
        b=GcQDp8zJ0EyIIYWSdnEmbdiOrOfI76Qrp7h8WK/8m9EAVuHq8nmW1ci4cUSUHh/rYx
         Gy+rCnu5JMYVou8GuEHRRsCg222yeTaUs2NXS3q/W/hWpdQFBUkvrB6P9JiHdYH1ghw2
         mZdU6znMnpmR7yP83FRNdMK3Qc2F9R9/qmBYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720221392; x=1720826192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvE5MNmZTjqAEsf7cXEBb41LDCddpX9Wm7IxOjPwOSI=;
        b=Oow5+81Nec+b9eTz7U3ngG9qiKMMWjnoksHPn0kUgChd1OEv+pG51N9VZJm69xB4jV
         nsTZGFHoHIwTcDmg6ZVCd9QtYjJysKMpPCXl7c64h8ih3p0UZiFP/M/xQil69tMoGQW9
         2jkaAzL4NjJMEEvcs8UOnfTnWaaVshk6tvrxKxUSB9WhancqnzVGQnDCg3dgB7aexFUh
         yQEX2SlNbAyZea2U+VSPdG2WuEcwPqqXvt0MdLEC6kh1fQ/ZsncfY9Ns95GBs2ATOcnY
         syMa2pO74Sk8k2Nbq2HEMtR7qr39L2+kI1bdGy080gVEYUGTH//8DFpOa3GylwpVFkJM
         07OA==
X-Gm-Message-State: AOJu0YwMlimwyT5m59vnrDSMd6+LeykGRUQVNIcXnSJ6Nsl5bbXqZjCY
	lwzpqzujnhWyts+8hij66hgHCsHGXN0Ns2YmGhDEvqsh1XJ/6purkvtqCYU7pPXb6MLZ2ZtcuMd
	+
X-Google-Smtp-Source: AGHT+IGNqvPzNqNTIqhgSdNIeZzZCvvtI8mAWAzknKqKBhbvWz/eN5B6hXbDWPspN+c5ZXJebT6Rew==
X-Received: by 2002:a05:600c:1d01:b0:424:a823:51d7 with SMTP id 5b1f17b1804b1-4264a3d98edmr37530875e9.5.1720221392122;
        Fri, 05 Jul 2024 16:16:32 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a31e1e7asm3768896f8f.113.2024.07.05.16.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 16:16:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Romain Naour <romain.naour@smile.fr>,
	"Yann E . MORIN" <yann.morin.1998@free.fr>
Subject: [meta-networking][PATCH] daq: fix SRC_URI to point to the real 2.0.7 release
Date: Sat,  6 Jul 2024 01:16:00 +0200
Message-Id: <20240705231600.3675208-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jul 2024 23:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111259

From: Yoann Congal <yoann.congal@smile.fr>

The previous fossies.org archive contained a 2.0.6 release.
(The included "configure" script contained PACKAGE_VERSION='2.0.6')

Switch to the upstream archive hosted on snort.org which look like a
real 2.0.7 version (configure contains PACKAGE_VERSION='2.0.7')

Diff of the before vs after archive includes:
* configure script :
  * New option : -runstatedir
  * PACKAGE_VERSION='2.0.6' -> '2.0.7' (+ other related variables)
* New copyright year (2014-2021 Cisco) on some files

Use a custom downloadfilename to avoid conflicts with the "wrong" 2.0.7
archive.

CC: Romain Naour <romain.naour@smile.fr>
CC: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
Tested by starting snort with --daq option and logging some frames.
Problem was sent to the snort-devel ML but the mail is stuck in
moderation limbo.

This was first noticed by Yann, then reported to me by Romain. Thanks!
---
 meta-networking/recipes-connectivity/daq/daq_2.0.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
index 8cb4c04fa3..a686ef5840 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
@@ -8,12 +8,12 @@ PARALLEL_MAKE = ""
 
 DEPENDS = "libpcap libpcre libdnet bison-native libnetfilter-queue"
 
-SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
+SRC_URI = "https://www.snort.org/downloads/snort/${BPN}-${PV}.tar.gz;downloadfilename=${BPN}-${PV}_snort_org.tar.gz \
            file://disable-run-test-program-while-cross-compiling.patch \
            file://0001-correct-the-location-of-unistd.h.patch \
            file://daq-fix-incompatible-pointer-type-error.patch \
            "
-SRC_URI[sha256sum] = "bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e"
+SRC_URI[sha256sum] = "d1f6709bc5dbddee3fdf170cdc1e49fb926e2031d4869ecf367a8c47efc87279"
 # these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
 # this error from test-dependencies script:
 # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink

