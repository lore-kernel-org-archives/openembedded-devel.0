Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5295EC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:37:49 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.38812.1737535067331138406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 00:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sg2/ansA;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso45914685e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 00:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1737535065; x=1738139865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCTo478PGYAGG5hp+AUam6LiFmBtOuO3+Ew+zLrGxyY=;
        b=sg2/ansAkNUYh5wLcidumOstUbuTRQyp0GxPA9nFfG93/m+KZJ5dQYcBp0eKGljJiK
         ITKOgT0Cya3v3QfWfb3nrHJeSLAd6slrkKy/+Sam+bc8QFwLeGeSITxqd/I0ThiVcxhj
         9eYSe4vjTBPYarF9q2+jt/iGf/K6Ylufm/0Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737535065; x=1738139865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCTo478PGYAGG5hp+AUam6LiFmBtOuO3+Ew+zLrGxyY=;
        b=UzUW8uvQCSOISk6FOwelpu1tQlEANBeqIWGQsmge6M9P5DY6TfbcqlUPnwwqj7sGer
         iadqNMEIODrtJx4yAb1Pc5s38aV8dpPa8RYca9aBVIFBPgk2Oa9BXNZyoiIoMjSz1Uhv
         mSL7O36r4uGTww46+WysoAqUaAkVRKkkoL60r7ec1jVckXfKT11+ykv2vvqW7qpo8eb8
         tNMOWZR87V9RqFZTL53alvDNxCOUQFgOcvBOlwOPReMV0OUT6kyIOfkcOQaugRGLYmwU
         FshyL5TDpE9iZCw54p7NW9vC669oXVbOlLnw/w5OVpJeRiaopD6pEwGd9QOQIW80PDS7
         fWSg==
X-Gm-Message-State: AOJu0YzsBX6cXM/AciHNOuYN6LTg4VyTOoP7G7wagPqrHHwrsvpFB/u8
	DTESpV5asWbkAzTVt6zdXsYIfN0PnSiSpVWE6VNvMuB0LwMbfYZZe9pwGxesAqfimZwExnt8ep+
	BjicQ7g==
X-Gm-Gg: ASbGncvFZJc4QOAeQwciyCA0rPgDgaH89yNhVQvPlWpTrxANPSyg2UELN6/Vm2+xeXZ
	oYsSbA5aSmZR7ZmVkI1wPfOeSiqi4kCF2reXvSGgG56tS7uXkFaokF4UD7kBubS21Gl/geLf/jR
	bzgBHo33+bF7oJSSWq6pvgWFYdnaS+p6GwPy0dSXNQ9fCtT/Kds5MZyPegEdJsM9Y//zCMFUfNi
	W9buVaYKvbbm30xX4/xYovSqPD/b0Dq6d9XYi7gvceGdSj9h2eCQyOfL7QiUJ8NFOX1R0/UOiCQ
	vBs/PE9W3JTWLl2Sj+06An+EeYU7+epoVGOeIOICnQcztrZtCwff4SXa6VqUe12l1HjpwX41xjH
	UUA==
X-Google-Smtp-Source: AGHT+IHvPbUpBOOVhVI/mDNn3i8oVVeqvg34EuYMwNpzS8jSwY4nBBz7gMWX4eajIvSe8P7ZsDL79w==
X-Received: by 2002:a05:600c:1f86:b0:436:faeb:2a1b with SMTP id 5b1f17b1804b1-438913db2cfmr180166445e9.13.1737535065349;
        Wed, 22 Jan 2025 00:37:45 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b3189ba8sm15848035e9.5.2025.01.22.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 00:37:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][scarthgap][PATCH] mdio-tools: fix mdio-netlink kernel module reproducibility
Date: Wed, 22 Jan 2025 09:37:20 +0100
Message-Id: <20250122083720.1449084-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 08:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115013

From: Yoann Congal <yoann.congal@smile.fr>

mdio-netlink source make reference to ${S}/.. which breaks
-fdebug-prefix-map and results in the full TMPDIR path being present in
the -dbg package and, also, change a related CRC in the main package.

This changes ${S} to enclose the whole SRC_URI repo and adapt relative paths to
build (MODULES_MODULE_SYMVERS_LOCATION)

This make mdio-netlink reproducible and fixes this warning:
WARNING: mdio-netlink-1.3.1-r0 do_package_qa: QA Issue: File /lib/modules/6.6.29-yocto-standard/updates/.debug/mdio-netlink.ko in package mdio-netlink-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d161de0b00b91cd0c286fbbc1190f87cf20fe088)
---
 meta-networking/conf/include/non-repro-meta-networking.inc   | 2 --
 .../recipes-support/mdio-tools/mdio-netlink_1.3.1.bb         | 5 +++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index e0f448fe31..45eed5398e 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -15,7 +15,6 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     htpdate-doc \
     keepalived \
     keepalived-dbg \
-    kernel-module-mdio-netlink-6.6.17-yocto-standard \
     libbearssl-staticdev \
     libfko3 \
     libfko-client \
@@ -25,7 +24,6 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     libowfat-staticdev \
     libruli-staticdev \
     libsamba-util0 \
-    mdio-netlink-dbg \
     mosquitto \
     mosquitto-dbg \
     ncftp \
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
index b50d33f908..3867b89052 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
@@ -3,11 +3,12 @@ require mdio-tools.inc
 DEPENDS += "virtual/kernel libmnl"
 # This module requires Linux 5.6 higher
 
-S = "${WORKDIR}/git/kernel"
+S = "${WORKDIR}/git"
 
 inherit module
 
-EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
+EXTRA_OEMAKE = "-C kernel/ KDIR=${STAGING_KERNEL_DIR}"
+MODULES_MODULE_SYMVERS_LOCATION="kernel"
 MODULES_INSTALL_TARGET = "install"
 
 RPROVIDES:${PN} += "kernel-module-mdio-netlink"

