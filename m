Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB4ACC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 01:28:08 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29959.1792027686888211457
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 18:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NtfsvE3v;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8fe8e343fso18254495ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 18:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792027686; x=1792632486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQHctWdtSHtNoicnbSUbRG3xGgW7mfr8L4h6I/eG6aA=;
        b=NtfsvE3vL5ym/UPC1pejCJ0QybnxPQgU+T0Av4mjahBfv6ohMuCaEZMdWNgG4uavHw
         ii0AqBtCV7Po76E2o8308tGZodbUwJ1UUpxLCifkg/F4WeNI86qntk6JrbTP3Xi3o36C
         CFSoQDe2u2j2HE/kVHuGXs/b0crLywQkGKPzrXcuLCRltSKRhr6p/+TXvRRphUOK+uU+
         IobQnYDAmR063RnJMAI58H9kE2A7YadWGghqv+TqOoBV56qKAKaugss3hhaRdsqukQR9
         Yd8QSF7BNs4b8nkpOYR8QtZ0PoWMA6oYSxS8zKl0yEztt+cqjBIgyHHEGcX18pTFa9VA
         t1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027686; x=1792632486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQHctWdtSHtNoicnbSUbRG3xGgW7mfr8L4h6I/eG6aA=;
        b=qYMEWXKDPf1HWbXvgNMv6SOBFExIMTBUUZA1Wfm+swZqMAMewpN9UMAUeB2Qlybwkq
         FJmcJMklaQghhAJC86vkmk/fwwZQyxPIoCxetOljX/VPX5/vzuK2pihI7XC/ljsJKx9v
         iPIe2g7LAH3UyW0HdibO4w3zTKRaJJGhKxc9QYgVI9lyv/rXvpOxN0Sph8q9kW1/PBiP
         j3dFCiaxjnXcNCF4nGhYtkws3QWBJzZ2wQjDS3e9Upz8hH8TMepEvJqDmJQtfBdaw6tp
         CDyczNQFAea3bO64Q6JarFFvGypb9dJ5U56sFq7yrJZnRuiYEVnrT5nGrGp26OaQTDKB
         Gh9Q==
X-Gm-Message-State: AFq9FYIGpfwhD5QibiPH8bmTl1jHdN+q1UKcNZvJJfb+/3DigFBtm5bd
	ag4BRq4lDDpu6MrMmfSRIqq2vKAhgKmvtwfpa+QagMMIGohvJ2liSjH/y/m4+w==
X-Gm-Gg: AYBFou08b3mAyAbFuORDlUDYnFi92IhfND3bL5ohNUPWzd8BA+ZUsTvG+i6PG3Aynk/
	lL3u7crRZe3ioYfYeCChhYgORWSm6wZ58Pcg5jaTnbjNvX5PCT/1xapWD+Zh7XzyuTq2jwo5SMf
	OL/SXhK58fQx4GlnNvB3h12Jd4CPW1lU/GYk8OFljotA+6ejsd9Kfa++KsShbZqHwUXNsmIcF1I
	LlbfhO6KbwdKUJ4b6eGahqcObJtOuhRCxbEXgyTruIm4YP2vpi87n4LYYcA73JXUC4GXOQwYB6I
	QBU6/RxnABgCS6Ew6Y2tUoJBCIdbN2QSGCfQqnJ8epNvOCqv/o198r2uvtY43K4eirL0D9UZn4V
	x/DiR8y1DiyZezmGVwDgrQhKMxQFQli8F+7Zk9Ea6hRW4I9F13Gt979xiUafb1A4btsrrIm+Mjo
	zx5IEYDd0fOD4cN0Zx+wtxV9fwLg1CemOMyK2DoA9NyISMWx25v43gMehIolfbmft4W9kDjlbFQ
	PtErvECax32BPrr+xEr/EJ7LNRaA6BvqrA/Z48=
X-Received: by 2002:a17:903:1c7:b0:2e6:c39:b250 with SMTP id d9443c01a7336-2e842ab6808mr146713835ad.25.1792027686095;
        Wed, 14 Oct 2026 18:28:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm74429495ad.0.2026.10.14.18.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:28:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/6] boot-time-analysis-tools: upgrade 0.7.1 -> 0.7.2
Date: Thu, 15 Oct 2026 14:27:49 +1300
Message-ID: <20261015012752.1650544-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
References: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 01:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130903

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...nalysis-tools_0.7.1.bb => boot-time-analysis-tools_0.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/{boot-time-analysis-tools_0.7.1.bb => boot-time-analysis-tools_0.7.2.bb} (93%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb
similarity index 93%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb
index 2a65e7e463..31530eb609 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.2.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2e0cc0dec0b709fe547806b55737b0"
 
 SRC_URI = "git://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "2409ce37e7389d8079bdb8740cb6a44b505fb8d4"
+SRCREV = "f55dc0c2fa826e80fed6fd32254697a91cabe61c"
 
 inherit setuptools3 features_check
 

