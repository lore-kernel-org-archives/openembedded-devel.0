Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C401CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33245.1792043034223334817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kc+kYp9a;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5d0ee1951so30924215ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043034; x=1792647834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ldsrTWYH8JsDyaVrLoMeS/cvXlUmeSUdPNqx7OyA+w=;
        b=Kc+kYp9ar0RF04j+1cK5DQwnrtKDr2f7rvcmZtIsNpgKvneByiRvgYZxc9U0JFT7UR
         nGC0dZfPy9yL+DK3LPxBU/UO6agWQDdnDAa/YmKfBCfh3fne/xWiBTYypdpl7nGT5Kqr
         E02quHNuS0MOhIu+Lj+6zv07K9G/cTthWG7vrLsUN13jbiJNUaqXqEw4/11jhmyeDbie
         ecIzigFADpag/SkDHbhIxqmGgijnPBj9sib/0kSKfwYtGA6Dxb+Bp83trnGYYwJx8ygY
         7FPWVxS4o7PTPlZ/y7XRvDMnIzF0QcRFVHz1wdDSwkLn70FjcTpn41fRgeptQ+rkRGnb
         c7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043034; x=1792647834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7ldsrTWYH8JsDyaVrLoMeS/cvXlUmeSUdPNqx7OyA+w=;
        b=BKDZYArVac3XJGmvotzn+g+m0XYtMr0kM/E4FvR2Kh0D72QKQl9nzzJjE4I1mhAkXN
         GtvhPoCE7foUt76EL6muXzIpI31qiMYqLSVhgREMkGIB+w8JHnOowqAwPc3pvZhcenW0
         PIrX3PyXHTBTdZ+tSlxiDdJqtcaK+OYB5wir1K2qu0xBY0snlmr7CAKBH9Cieaw37jkL
         qtMdl1jE2geEkN/L8hWbnRZe7bYBUsMon7S6iAQPJY9vkQxTrnH40OmsO1kwI+/LG+dA
         D1NxynL4EKauG+fl619wUYGSdCjuHl0kPTcFZKcTB8PxQ6f6dcjfLYHa7OCY4UVmogvm
         VI8Q==
X-Gm-Message-State: AFq9FYIC0QTJaxm2ctU69Nja/37ejLeSVeE8Uzq+ffh2cQfagw7bla+e
	9FK1+R5OC8HYfc2AZtSDxMsZFYUsi8E+mn4mupN2A5OVFMIbVm1bhWC2zp5IuQ==
X-Gm-Gg: AYBFou1D8AsmbnOv4ml7sK/WN9dr/4PXqeSUhnssr2fTylzkpiIkxAP33PNHjS34GdD
	ZP/ZFHPV8fyv3mANc2yirYFprbFVViWF9I3EcnYNYllGFE88s2r26efIaOGzlmiyeKBXf5hoNxx
	awyHgWD5mzG9SkuPzxbTk1EmytmzKynrXhykHOMwU0vpLIRXt0gfaDU5VpyIxS7m1fZ50zrFYt9
	YWE5jhYgFfeyUE21esl/ORgyt4yPD1HEFL3J4OZQqPbvbhocqvj4Y0/jAhiHuOzgahdX115yvsR
	CA4Luvs/bi+Xvo3nCV88MZBHGHMNEWPUtzi4HHJusVtBhUcjdk1cl1ObquLpeTYkwAYhc6Pqrc9
	2tzp8fALnAmWbcRcecr4aPoSDkarJhh/h8kZLVL/MWlcjI1XHrqKvUz1p2NqGT0gnSkDKmU5zSF
	ZCOWzA6iqp/gWarLk2o6yq+hrn3QOg0+XHh+igmy8Kx5mPPepo5qZgNLHegDNJJ+GAXdSPYsIwn
	DJePmZoF4yv7D/G9z/l+A4IITJr5tZ/lA==
X-Received: by 2002:a17:902:d512:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2e842cdc302mr159608305ad.42.1792043033584;
        Wed, 14 Oct 2026 22:43:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 30/82] jq: ignore already fixed CVEs
Date: Thu, 15 Oct 2026 18:41:18 +1300
Message-ID: <1dac3dca9d4006115ce33b0e8a3caf1cbdc3a300.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130950

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

All these CVEs are already fixed in the recipe version[1].

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-33948
https://nvd.nist.gov/vuln/detail/cve-2026-39979
https://nvd.nist.gov/vuln/detail/cve-2026-40164
https://nvd.nist.gov/vuln/detail/cve-2026-44777

[1]https://github.com/jqlang/jq/releases/tag/jq-1.8.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq_1.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
index 0bbe6e009f..9f586eb18d 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
@@ -48,3 +48,7 @@ do_install_ptest() {
 RDEPENDS:${PN}-ptest += "tzdata"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_ALREADY"
+CVE_STATUS_FIXED_ALREADY[status] = "fixed-version: The issue is fixed in v1.8.2"
+CVE_STATUS_FIXED_ALREADY = "CVE-2026-33948 CVE-2026-39979 CVE-2026-40164 CVE-2026-44777"

