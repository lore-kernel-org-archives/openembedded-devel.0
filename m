Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D53CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5109.1791839471951151256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cv93X+5r;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso1050977a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839471; x=1792444271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xV4YHzzW3lTKxDoYgiY6VmQkddjLDpwlCyUrR1waM5w=;
        b=cv93X+5reWoUonmc3MJdE0XlQkCWYBHrHWRNnDCcZunMLCpvWVsZTJ3eVXIE0bW3G/
         iBLsKJkM6yWeX+H/AJI6N5avYhSUiIsxNNiKRUcPKImS6UeuDiI/tunRgp8F5vrEXgfg
         jMYZmOUjmAh0xegKI2oraEfw493GzMn+R+y6pm9EMWM14kwkgLE8mQTQbwgQMSfGaZ6k
         pZbm0eBUtZ3XwA9/hO7ldEDnDGvlmGuO5oL3QY7aKQNrK6Q1qVRYz9pyi+Q+TJgmKSla
         pyTin5WyIqSOOq49fdigm1sRZgCSYBzCMmRa6oBUVNC17mk51yoOGpAkCTMM9FxZsTQy
         rh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839471; x=1792444271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xV4YHzzW3lTKxDoYgiY6VmQkddjLDpwlCyUrR1waM5w=;
        b=Kxj74jH8ceLZ4aeneQux5VgVFUAsO91xgRoUobPIbd6CXoI+5skN6qE/hlvpz42Usy
         JTv98L0hEUStUglKxKJZnxA+A9G39YyKvpWiqa6KmHra/Hoc+/BAPgTB1FbVTXN6QCrI
         zAsOBZubW20fgGPvDu+BdN0P7JGGuX5vp7dGx8PfzsJJFTthI2S6r3b94lEoGQ5jb3qn
         CUC8Ok6AI8xqsXfs7hAqFyNPlocMixFzz8OO0m/Rq0qee7gbxe09wROxYRELpxrGgTfa
         O6dJ0ERiZ/OcesINJQL7fscDbnm7H/WeTfSFRUYB6JyYInpqah6TLZbLpgHZySIyfWr6
         v8cQ==
X-Gm-Message-State: AFq9FYIR1EsO3gbG23YtO0ub90+tQpWy/ChYh6mYukfUBzT1048FVSSU
	CbJPUnHzmrqXWvsi7lb4ToEIs6Lk97racVVTt5GrDI5yiHafIMCVWxxsEAolGg==
X-Gm-Gg: AYBFou35nuTrp7hnXCjflPmMHMOrVn39HaCqGT1hZhyHaM1wKFEVsnPgffds3OOfyQ0
	Xe92UH+v1MWmwotylYZ+dfwsW8rzDtz16tqCD52x/HFFFgDpGaK0DfQ/moFa+uolQigWfmTIaDa
	HaCXA+EcIF0pT1pRyWc4J/zve6c+qE9BShXLaYa9otcN5xjK5dGMBQErvg599lAMp8nKLg8ipwF
	jMg9FYXBnw/sf5UN25AjX0epfSIxpIWvJjsZ1rMZtH5Bge1p1V8MuchGRvvNI0ivdSlsVbqNYPN
	g6epW4V8NBsE/W3GLRxNN1OHe7ifg13oPs1izTiJUkhhi1rNn8Xr3TmkvqsfBU3haRlKfMiAj98
	kpLpzXN9lAN15UBohyrC19owGMc5xHO3rTDhdIZiyFYiHHQa5XmpKNrUp2WBm7YXtGbggJjRRli
	ueb69f2uw9I7VW+Ci1rehnqe4FvnBuvM9ZB5ZVpykdSp+N/2Fgh9DLbXJmly/sAeiMWcUNfyvMY
	fWaiYxPgHymsxXdmjHxs7pbmGILaIt0Drh7FoI=
X-Received: by 2002:a17:90b:5444:b0:3aa:f2c4:12df with SMTP id 98e67ed59e1d1-3ab3a236ca5mr8447933a91.9.1791839471320;
        Mon, 12 Oct 2026 14:11:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 21/43] jq: ignore already fixed CVEs
Date: Tue, 13 Oct 2026 10:09:45 +1300
Message-ID: <20261012211009.3352822-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130791

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
index 0bbe6e009fe..9f586eb18d3 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
@@ -48,3 +48,7 @@ do_install_ptest() {
 RDEPENDS:${PN}-ptest += "tzdata"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_ALREADY"
+CVE_STATUS_FIXED_ALREADY[status] = "fixed-version: The issue is fixed in v1.8.2"
+CVE_STATUS_FIXED_ALREADY = "CVE-2026-33948 CVE-2026-39979 CVE-2026-40164 CVE-2026-44777"

