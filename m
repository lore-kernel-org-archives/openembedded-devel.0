Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E0ACC6B04
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:17 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5108.1791839469704187255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fhgPrnMx;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so2639421a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839469; x=1792444269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvesF0Vep8chKF3Hj+95VrPPTpeej9DI7y0P/dY8fYQ=;
        b=fhgPrnMxBsat/LW0jUSIszYq3xJUAUdTu0aJmGpuoTRXqLWndddwaORDB19daL7ECn
         hFNxnWJxgr5ORf40Gj4tEmC0d2S0YJOqDFK/yT+8oKnVV55g60/B7b1IVrOFBckOMfgC
         GTb5GB1//V2N1OTShv60pAEp1Yci56PJhWviIH7x95U8LA8HuLfCIpX1Mir3Gd06Xq/f
         V+QoZRzTexw12ZYoIb6AJGcjsF05zkf9iNtgekhZzlHvfPny74CydTJYSzOiaE4lz/Oc
         5ZIw5TvM/A4IwpcKVrquBQl7Iyxp/AXhcuPYMYeHDkkjAYzHB4MZ9yL8zYoN9ifGtbei
         7Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839469; x=1792444269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvesF0Vep8chKF3Hj+95VrPPTpeej9DI7y0P/dY8fYQ=;
        b=04LsM13u/jVn0jbqp0M3vVYf65kz5ACk6pRCoEG18nNBCch8WBgzB65sFU8L0ukci7
         4atQBPmotdqttG8GEp/3mJ5IIonkBe/60pNPK23GxlpPJohTfOPC2fQEKxQ1e3mf7Bxo
         IsMgFV61R/9iWRtoQfJJb+KpwbykEXw+9Qek6icmv0JmOic+CLsbgku/FJOJ7d77cdep
         LZWTgHteD+Mdzu/k12YYXrf1n1i0hleT7ukSGr6Hn1iKe7d/GwhjpGrxytVDP9RBu2JE
         ibyepnVhtzyD7fff/iiQEtQ/AsIFruc66/atNQUn020U2e99YenI47N7v5UEgapfQzKo
         vE2A==
X-Gm-Message-State: AFq9FYKJS50kDBqERTq0V8CKinIUAEt6kybfBaY3ZlcfRtGVWLuiCv73
	B7XEG0eoMAsZ9tz72VlKjxWFYc6qsIu/Kv6FyonSQH42CUxMjcA2SxH/Vu/N1Q==
X-Gm-Gg: AYBFou1AHGf7ckX4E9B8VScXxbM8ZmQhPHr9PpdJYwtYHW3AFFsDzpFGricR/rBM1/V
	Oto8IqZrebMeapgVYPsHw/6Tk8ThOu2o9Pj/3XwKhkM9w9lDCNH2fCPXiTVP3wZ4dFgodm3Ah8U
	87J/e1dS7MwJKcILdCpbZ3Ub6ZNxh8OxCMbJEf0D42Mgc9bTmvzZ/xy0x5yhWrls71MUmPp4G+7
	LG5EFkoUuLDNUOjGDcPSET8xIldoFVMWBdWo0XQZzgCJd6Q8SfL78umtgUTqYYkMtQVYMVYj99u
	tmc2NgeahdcA+MnJbweCKVc+Sgqnl55eZlsUnQu20ipuOllxHg3abbENG6md+3lYdjZdxEdxjAi
	nMkwSVcilAycd6pGFXFXexV/ibuDEjDZ/Sz1G1LrocHk9UdFHUGWP0st2dzY9KG+4A5i5Ls+kgH
	8oX0k2e8oSIAZcwzgBVr1b6/VqOgEmGXjP6I+lAIR/6ujmXmw3a5yAiRvvtaL2v0g2cndRT5oOX
	pT1jKJ+WJCGp9MvA0gIhMlKDFrE3JT59zPeL+8=
X-Received: by 2002:a17:90a:617:b0:3ab:be66:ddd4 with SMTP id 98e67ed59e1d1-3abbe66df49mr3044030a91.19.1791839469156;
        Mon, 12 Oct 2026 14:11:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 20/43] iniparser: mark CVE-2025-0633 pached
Date: Tue, 13 Oct 2026 10:09:44 +1300
Message-ID: <20261012211009.3352822-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130790

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also mentioned in the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-0633

[1] https://gitlab.com/iniparser/iniparser/-/releases/v4.2.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 86fba2b5805f6c8ff0a5f936106a9be630bc54d9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
index 9ab713ee92e..5958ecb9c6c 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
@@ -15,3 +15,5 @@ EXTRA_OECMAKE = " \
 	"
 
 FILES_${PN}-staticdev += "${libdir}/cmake/iniparser/iniparser-staticTargets*.cmake"
+
+CVE_STATUS[CVE-2025-0633] = "fixed-version: fixed in v4.2.6"

