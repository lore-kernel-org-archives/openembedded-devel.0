Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666F3C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 00:27:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6612.1785803256019660066
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 17:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rZmVo+Je;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caf228a910so29425375ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 17:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785803255; x=1786408055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5ye3UtyH2Na/pQ5RUTNAlXtTlQ1HMai0zQ3tPeQyvQ=;
        b=rZmVo+JeHX+KE5vF8sqFPcnzQuFF2ShAHomOdcExAcH7L5v31gl/rJWj7K8fwmb1dC
         eybjRX/G1vs7GMtV5X5ryfAov9p5r2xTFhfWAIm0yR5TtFR2qKCTxCbzXJg57NwAEQnw
         RkfibP0lxKEF4Mb0BlAQI4/3CBL7a/yUMBRq/aXqSfgbjdo9v1NCRObO47Fy4YVOGwaR
         iuTh0uv2VE51bPljIGZPFI9RXEDxK7N/NZypDh2Un2UZv2okOMzqhc3kg0cEUst71ckB
         x4q3wFh0FqCpZx7Zzcom3CeRQDZMQHsd3Z2XGO1jmNoZX3TGsSzzfnhMFQFeO19OgQCM
         pJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785803255; x=1786408055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5ye3UtyH2Na/pQ5RUTNAlXtTlQ1HMai0zQ3tPeQyvQ=;
        b=TdGuJhLFx0yFn43rsfKFaq//BFiQXdqfcVfA0Sw2bWZjMD1oeCYStuc0TJ/7VxVUt5
         pGvjjnVBtJVB0pcj/v3cOqauBS17yoZfqlMTi7WB6cV35QVxtWBMCQeW6Znm9R7x0qxY
         COMyNE/nFr08pHu+FASD/H65KfdbS0JVqDPM3UWunCdLkoL0Zof3oLE4k6+Mp9lhm7tK
         1rgkDvtUpREMcRKcPuD3mbPld3XHfRCj7Zt3sLvRb+5keKaPXJQY0+N0KrseohXyj8r9
         BtZdJ/9JbZJO+ex3iS1XINMbg97JmeN75//5zLd9UhyAGfrWotdR/T5sXbynJO3K1KrA
         t/Bw==
X-Gm-Message-State: AOJu0YzChz+tlTJYdr7bjQngN+CYYTk1M71FbfPhFO3nGtT1T6auB8/K
	2oTfbNF5bFjTMlhamUchNSheCUZ+c2Pga185CedEqIMxqTS8yYcDMbWYCGlAgZU7
X-Gm-Gg: AR+sD12T7vvcF/TtKPowNu9CEFjyVtei61WEWKmEluvGs+kavkOVPYIDlQlFapG7zYK
	lCQFVEPNiQIu2Sp6nbCQEG//NBHCnxWWoyQkn2m4k5ceFlI4QnA0Mh7pGkObPMoc//ga3vKfUXR
	wp041UW1NJGPS5NxC0w04LJgv/bsmksK91fUfZjpUXvtQ1UjHBpnY3fFVQgGPqz75TGHJyVq4yY
	+LNazL08GOg/i2jFiZvC7biF8K6rVORfWrZSiM/3NZCppedwnwzf7hjm7Ra2GakJACwoGk+oMvU
	deHbfN6dnAf1sSITlrSyOIHF64L/z6VIImvReJ8B3o0qXzI18onTWP2EsUUoA2nmVMut7hY1Max
	Ad+DLxQhN69o9cMtsRLix0RAywMGdU2OwykG0MBsCMTd9yS6x9f2XhWDdds4mWRiunp+IdnfB52
	80sduduH0A9O/0NWbjDmIUXuY6/qePcgdwLNoT4J4NWCkKFsBMn6NKYo9HA1cHUqWvjEqF5rFcY
	g==
X-Received: by 2002:a17:903:2287:b0:2c9:97a7:3278 with SMTP id d9443c01a7336-2d0523f215dmr121853515ad.41.1785803255012;
        Mon, 03 Aug 2026 17:27:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b1591eesm44385825ad.72.2026.08.03.17.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 17:27:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 1/1] gtkwave: upgrade 3.3.127 -> 3.3.128
Date: Tue,  4 Aug 2026 12:27:27 +1200
Message-ID: <20260804002727.586577-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128701

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: update md5sum as address was replaced with FSF url

Changelog:
- Hurd compile fix.
- Update lz4 to 1.10.0.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gtkwave/{gtkwave_3.3.127.bb => gtkwave_3.3.128.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.127.bb => gtkwave_3.3.128.bb} (89%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
similarity index 89%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
index 774a30e1a4..62ffafe08d 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "gtkwave is a viewer for VCD (Value Change Dump) files which are u
 HOMEPAGE = "http://gtkwave.sourceforge.net/"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5b1819073ecce49dec65a690b638c48"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f19da2db43b27bbcc669725843451945a68c3a4ce232562e341d6f63b80b55e4"
+SRC_URI[sha256sum] = "817e197fc1808f8aac3543c2c2f9683cb01368c91192b8eae5af58070ef1d1f8"
 S = "${UNPACKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \

