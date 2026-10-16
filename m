Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28AFCCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:08:05 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14397.1792123681433679900
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DOGATS/z;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e98798cbddso1053475ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123681; x=1792728481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3QTJ7Mwa3HoekfTliZpB02JYKvJA7GGqDMRvYUNuG4=;
        b=DOGATS/z6ELYiygk7L5AHVP55GvC1+5tVcywqLggh1S/I+D8S71NcDF29QalqcKOJU
         X89yaon4gp7FgzAYv8/ucjAPFoQns1i21EIX33m/yTn7u94lwd2IkqWNVMVdRI+KXfVt
         F5s+ELlhFEXEMuplmujZXKSWs98wo66evTVatbTOL4RuHOgpJ+LFWDKiQ7SANm/AYL0K
         dG4WRfv45WAn+Io4HcSRNHIZg4HD+58bVGnDKXX2rO7pM68Vvc3W9jUs0FLF9Nk0et77
         R87ykpHGLxfe2eS9ZOnGqTZchCddcRx9cvequ3wB5Z2oSaRwiLmJG7VVVMlgyYOhnUh0
         gQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123681; x=1792728481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3QTJ7Mwa3HoekfTliZpB02JYKvJA7GGqDMRvYUNuG4=;
        b=EKKQaeCVJhdH4I6BcMOcFEIPHGaCoEVAOtAEzdQsCR8JiPJnN6tHs/7+stwuILWoaJ
         f4UWt6Bshh2Pe8xzvE4W7TuLhwgz9WBqSCLQ1VyeJdTA7enPOkSMnj+unxgt0Nswux8Z
         2UCTJU2OEuP8pFfsk4dE71a3I6fvl+UeA9GNHBAPE42cPPlaWIMfWlRUV7SlbAQBhpRQ
         x2oWJ3PTLQ7rDOcrgYE7+Q0zUDOw9V5V7YYhJcRFVWQctaHSFrTE+49Efm2qUDqnq272
         RMP5/x7A6tXfDwaOdCtkb4+US8k/UqQTp7CrASJQjTsIcSbFXRBvH8bd/aQlFXjWym1L
         As1Q==
X-Gm-Message-State: AFq9FYKFE8W2Lx02zEJiOVH9EzjC5U/HevNJGCxDQSz5G3zkKeSdNeRe
	JPDXlCtMFDS1ovWsosq9DKq9GO3u5Y9MqxILhh0xsiS+ZmI8seadkTirqNPe3w==
X-Gm-Gg: AYBFou0Zt0XROKvSImRyIO6mca7dyZPrTzsAOyo7lEkChViPQ7wXADoNJiW5UpoVDmU
	s791WUyGlGsAmn/eDjpW87UmJO2V+I0F2GjcfIHOAd22+5/rBHNLVZbJ3H0R1zHCU/IdRuYh/rb
	sK6s8EL9C9Yu8vn5NQTE6+HGUw2hcFiF02CGQ910Br8wRVmEK0RT4biUYmqK9fI/kfGL9J3E5qj
	llKe2gJ1IRend7rwlH6ORQt6slP4HpTRVHVPCIYEzdIvn49UbsZZ+vOJK/nDHNc1InarAwFwjEI
	ROeh/QPc7X3fT+0DWNnIS/dmxmlz6NEklsPfsm0OP8K6zHMwhwTQRogcgEo37EXM6/3eFkCUOw3
	xmNQ06lB75udIlcBqJLxintd9mKmGu3wjGP6sSL7W9YQR+rlTpTZ9BxW78bGgMtvfxkpJaSu7l7
	RspAgZDVivIMP66A+iBPNKLgP+Yxx/gm1pHa99BmIh5StJq6YKWmrTrCDNZ5CAo7ESX5himEbEP
	SN2M+YGAt+fN6EI6KVKAdaSsLSs8Kld5LJL9G4=
X-Received: by 2002:a17:903:244d:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2e8429a7c65mr175197375ad.20.1792123680335;
        Thu, 15 Oct 2026 21:08:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:08:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 9/10] python3-setproctitle: upgrade 1.3.7 -> 1.3.8
Date: Fri, 16 Oct 2026 17:07:33 +1300
Message-ID: <20261016040734.1499287-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131045

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/dvarrazzo/py-setproctitle/releases/tag/version-1.3.8

PTEST pass:

root@qemux86-64:~# ptest-runner python3-setproctitle
START: ptest-runner
2026-10-16T03:19
BEGIN: /usr/lib/python3-setproctitle/ptest
...
...
Testsuite summary
# TOTAL: 27
# PASS: 24
# SKIP: 3
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 40
END: /usr/lib/python3-setproctitle/ptest
2026-10-16T03:20
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hon3-setproctitle_1.3.7.bb => python3-setproctitle_1.3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setproctitle_1.3.7.bb => python3-setproctitle_1.3.8.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.7.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.8.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-setproctitle_1.3.7.bb
rename to meta-python/recipes-devtools/python/python3-setproctitle_1.3.8.bb
index 6abfcf8502..a38203819c 100644
--- a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a9efff04c3ae658687dd38e20398a20d"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "bc2bc917691c1537d5b9bca1468437176809c7e11e5694ca79a9ca12345dcb9e"
+SRC_URI[sha256sum] = "cafe209d064a6efb88cb45a03e97981ff8832802b2b5d009dde0197a3b7b41c8"
 
 SRC_URI += " \
     file://run-ptest \

