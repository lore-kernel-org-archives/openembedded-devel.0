Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284FBCDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 10:22:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39803.1782123772525662695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 03:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JT7fbrIC;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-462cdb88d01so2775685f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782123771; x=1782728571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tr30oKPwp5zydqW8OiweLrfjTnZDR4J+nSU5qYRlIeE=;
        b=JT7fbrICx+vu7WcBxB8MOVyl1/lYoDZcq9rmN+P9bZsRdSRdOhsK+Ym5vZEGDrakUN
         tK3QtP+XBaYj3lbuNOheOc7dxIL8vjAo7c8xRq1cY/fUunZ5t+ARL6jz6bxR4IKnTztQ
         78G6P/v/mx6rirqH4+TipV6bwXR3RrngMdQ8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123771; x=1782728571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr30oKPwp5zydqW8OiweLrfjTnZDR4J+nSU5qYRlIeE=;
        b=gs6fXQBw5/MBstaLsVRfecMKAjtot4KAN7BrN0gEajDRqJh3qsUCmGwG0bYSP/PTRz
         L2ADOiLmFewYZUAMDJ1a4dlqzNEChFw1IZVkzPV+J88aDTLV7FY9TG/w2GLeiI4Pu6wf
         IlTlaDeC8b9XeToj0bK5srj1rbCSEpczUTmdatkHmkFxMoSTCPGllILCZgrOCJpaX3rf
         vcLwxjPVJ1wM3v16r3vfz2S+fxA1WXi8erKJUpBc5wMgXw6prDpyHN0kjHBxBHqtFNBI
         paw+FCviOv2FbG9R5JHey2KliIe+si4EjTz9siVtFYmlVfTFi/NcLrAOHDcKXEPY55ua
         CLzg==
X-Gm-Message-State: AOJu0YxYzKIwWP6z7zi+tVUSdjDc8sftP3SXuF52yPkMg1Y5ZZS2+rMI
	zavfrTvAu6AkykqHWmrpFgojFiXuVPPsc4osu9ZOXxb323gopfW+a4tvdj6jlyKrTQeFvdhCzHB
	mY16K
X-Gm-Gg: AfdE7ck17vNeqRR2tRYf5Y5hbuT92ekHh8G74i7I57ciXCUTTC/MIKu6uwLnHhSgk3N
	xURH/iXPX6GUhqJXjj8ezK3qSgdgFBSrNHERfYxblL9p7R6sM6M78mlh5LGnt/sehirHBi+lL97
	9/UuTlfQ3VzFHWb+xP26LOSN4ZO7sEoj/azxwkfpzWT5O8IcmHJTQlPZULIf8t48fuMuOTWs66U
	fQ36omcPsj4Ism+nLfwao+HDFywb7JnFLvUsopEkBS+OIq12G/I2nWU2bYqPMDwrOfJVU36q6TG
	UDYdDnZSlJH0yGCLU0eXiIQGwCgdX3vMPMhuNNFTGSDYzVX4Vj/8U+jQEkRUvv16Jx87jdHCweV
	YSw8jmlN4raf5i/A7SJ7Q8LYR146E15iBl2xKiJHqXzt3l7mUinfImHpZ184Py3qPyAjcc3qO6s
	xhqE8d3Qnr8OSac7DATizvrWPYIA==
X-Received: by 2002:a05:6000:2001:b0:460:6a3d:a114 with SMTP id ffacd0b85a97d-4651e7b5ab1mr18353692f8f.30.1782123770576;
        Mon, 22 Jun 2026 03:22:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666712cceesm24397077f8f.35.2026.06.22.03.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:22:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-zeroconf: Upgrade 0.149.16 -> 0.149.17
Date: Mon, 22 Jun 2026 13:22:46 +0300
Message-ID: <20260622102247.3370957-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 10:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127690

- Precompute address hash instead of per-instance lru_cache
- Add benchmarks for cache mark-to-expire path
- Add benchmarks for ipaddress object creation and hashing
- Synchronise test_integration on browser first-query

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-zeroconf_0.149.16.bb => python3-zeroconf_0.149.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.149.16.bb => python3-zeroconf_0.149.17.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.149.16.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.149.16.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
index 0a10048400..165ea63dda 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.149.16.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "5e6b5a3b153c2cc2a8d9e6f6f189ec5638f7d9c86fc3e88a6c53eb6863761a5e"
+SRC_URI[sha256sum] = "f10e58071bc5e749176b8dc8d7e7ed4d2e6b507dde20fd8169b760cf4f7f4c5a"
 
 inherit pypi python_poetry_core cython
 
-- 
2.47.3


