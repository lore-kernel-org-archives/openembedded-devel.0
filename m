Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C74DC531D0
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:26 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11426.1784859259603466274
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CWcHjyVr;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1235345a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859259; x=1785464059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZB53SDtoOT0AGqa2T97TAnxR3jmhaUaIFvWIXk4hxs=;
        b=CWcHjyVrhyuHP33CkLNcQh/fY/hG2hOYJZKMTvjQIo/HqXmTdv3XPbzx9o1kz6BP7N
         QkTatRC/ciAzNeTo/CC/A7WIMdMWaEGUG9Xcubz3MXSdQ+WD4aZ33ijL19zMPNXgUvun
         S6XCDzIEK5nTmgrGuwUNKakd/69fShRZ2bfIbAtB/GNERDhJcckmo3Y3iXTWncbAHYFN
         iVeP1SDjOMw0hoHvHZsHN9edD62SHctSJSQpqbSZyY0qAxIQUw3rt0p5Qd/dXwSKDlqV
         hpFtWYxBz9arpQBITMqzHIB3CIL/A3UTHQ0cXIFfdFeBkvs8gcTEwACc8hFO153dwkqX
         w9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859259; x=1785464059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZB53SDtoOT0AGqa2T97TAnxR3jmhaUaIFvWIXk4hxs=;
        b=W4zRuBU4AufrSRNxq/+talF4gJjGOYL1LaR2A6wlf1lF03L2842taZKVYRv1LBRgVl
         VLG3yZQJs191uRabuv3DQ4Ior27NO4Xb1WUM1FUOf16kCCz7Uf+xF2F0cbb4IPdilatI
         17Y1c1VCKfShpone5LolCObdLAxF4rN3oY+8R1+ixSmGa/CWsIocdpygt90qemI82Sqi
         r5dGAxu0P2i+Ns47Cml4VEVAUYsKXV1nIoBTHCjzw5VDpY8gHhNkbuQL93zmpiBFwmpr
         gGWY4AQImYpGxV4kEt3QDSRZjhbrnI/5/wQZ87qmLtYfWFxpQjQKn3k9kl6Lr++0twXo
         Z42A==
X-Gm-Message-State: AOJu0YzweRHZDPlBDmv6zSDlTmqPJ7aZsllcrU4Cofza4NonQBDl2s41
	KT/1w8HkcrRQBpB7gTLRggZcFJqiNcswXQZNiSpH5qNjaHSNeLqNRyMk6nhp8JR3
X-Gm-Gg: AR+sD12K44HCLoVI0c/WSXfhvSQU+fAzHzFA0sps0vVPcODdYthUdmZqO3pz8UlrJRL
	WXPH2Ij5FeF2j+8OX4wqDOf3k0Wfbcek+AAJWCTmVOHedgjXevchjdMmhFtGejgK5kyyv0eQtpl
	tVnI4+E9IrpMSd1zA9Dv3e4dDuwuifQdiu8FdSNtbbYjGsD1m4gMSUHimKp/Vv+WMWrWMVzpMHJ
	ajNL6RHIQSuv9sU6nJapnjexJ0SPjR1yCN6qggxpvUftVlHbQQg6N2SiYlHIncnwKh1zT8t7TC+
	xS7PNl83rjxN/YKy/pwbus2B5lNK8z9/E+lInb8+nntLE5YNqyy1fby9NiauXTWbW+H9fl3/8+Z
	zhzfOU7AgE/m2Cn93lDrywrrnXbEdJLsxe+nayURVL085lfpLMilj/ypI8hF48laN/Nc+7egY4Q
	oY9cHnTum5vcg5Tg1GvwUuqklPbQ==
X-Received: by 2002:a17:90b:58eb:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38ec6a7a678mr5317962a91.35.1784859258881;
        Thu, 23 Jul 2026 19:14:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/13] iozone3: upgrade 508 -> 510
Date: Fri, 24 Jul 2026 14:13:56 +1200
Message-ID: <20260724021407.2840261-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128424

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../iozone3/{iozone3_508.bb => iozone3_510.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_508.bb => iozone3_510.bb} (98%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_510.bb
similarity index 98%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_510.bb
index 8e67a095a6..79e4846f8c 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_508.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_510.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
     file://copyright.txt \
 "
-SRC_URI[sha256sum] = "ee55af310a65ec97e1db214aebd75ee87f458b529cea3da37081a63974e8ace3"
+SRC_URI[sha256sum] = "9284601c4665a1bb171307e8b9e1d62360d6598e4b0e7a5641320966d9a6a5f7"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 

