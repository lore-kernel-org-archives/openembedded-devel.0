Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D29F53D77
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:50:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55576.1773679833149468322
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 09:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DtABRPwj;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so42871525e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773679831; x=1774284631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kenV/1k3h6w7B4d905wJ/Ea2pp0quDjdxDyHJA43dcc=;
        b=DtABRPwjJVl5ESnXJ4AHWcTWCoTKhhtMQ5cq/gl5q8fTuolE317FCp3sh2U/7R2oIY
         gTMssW+aOL1MVLI4qsQENJHxNVt0ndtEcF98X0Zc5XeVcudFS7JpNgaWDhXl/yWuS10F
         g1r8vzc9shDkMVZ2SUV/SkNzatGMeFeX/kI/bh+upZMwX5oZTRnR+zEYRNaktkQeWdMy
         JYA2NnbShwGuEoSHG9URqGgIZzvW1+DcD2QtxH5Eo28C1MYnp08L0qWvZIoG8FvLABQy
         AjD5xtEVA3pdPX0POetvut77B8IAX6lAsnAM0+Gn1T63oFmQOkLY+lVukfkdCkwArQ6F
         XG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773679831; x=1774284631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kenV/1k3h6w7B4d905wJ/Ea2pp0quDjdxDyHJA43dcc=;
        b=WkYTuoR4HHL6IgwdIgJVGX6d3MmZ+Bw1kiDpxRDvf6OtJVOQqbC2mEybrzzbwMJGat
         eF0+JiUgbnwkIPvC4Vrc8AkC9qCKgEopgvZ3DMlUeukPeRbn/kT4zIVMlTuClPZcTcUl
         MeGdBEkzJMP0rtF4NBv6zC1Ouz3i1m/+6qSooRWEOXF7ZfD5Isup0Pd00cPtrWvWIJcD
         viIqn2j7S7vtPcNVD6okyIxeIkWWIuHYzLDzLmR8hBpBGbMfsc7btsQ/t6/wAk41LKxI
         RQl+kltNEAAjJjvRsnMTNli326/OGuCMjYL/W+UEyiV6PG0fj4cCaU0jHWlBjq7zE/AW
         rbtA==
X-Gm-Message-State: AOJu0YwtajYRB73TzR0qjGDekF9mCEOsKBqBzV08Pr99I7QNlYpLnghD
	TSux8/NdVRubWCABxihKJ5rr2j1Os6oowBOhIs6WhVYKDHHPKaqwYYQLx/y30A==
X-Gm-Gg: ATEYQzxs14r4ey9OmLsyf/FVplURSpNR4c7lgtCBQi5NN/mMJGWHrD9QsaHtOrHsjFh
	al1ZulqSEYs+qP2XBUqIRDWphrP/t+90fxgBNQC90jFcRUhXK0DMz4kgtABTWacb5xq5HS7jiUe
	pp7Sl5KSwO+p15m8FX6daSq4T9j2h4LTc/y5tG/o22N4RhcUGQBes5nql/CcCbaGrSEiTBvkKnQ
	iij/GUrWBfirbCGid5yaYFKsV/b3RpgnwAlqm5Tsg21FY4gorYFOPi4TA1rcIlXE3OcNi/v5xwx
	lvaKcXxu8B8URluMAH+3mc22hO+Nocg44ziwJsKMv/oLKQ9ZzOGDtuSK4jdvbb8FP8WR0l2XpF1
	v5TDetZWUIbIiP81fjmy64Zmu9EJIyCzZjVZYahRgz4hZpY7xvGMDeJVDseBzu7J22JRu4TqaZB
	AEFgNV5LJgO1b5uirMJOHz
X-Received: by 2002:a05:600c:3b91:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-4855670282bmr236559085e9.17.1773679831327;
        Mon, 16 Mar 2026 09:50:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm3120725e9.10.2026.03.16.09.50.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:50:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-nltk: mark CVE-2026-0846 patched
Date: Mon, 16 Mar 2026 17:50:29 +0100
Message-ID: <20260316165029.1418409-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 16:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125280

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0846

It has been fixed in version 3.9.3, however NVD tracks it
without CPE/version info.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
index 8953b75b28..d9f661b262 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
@@ -8,6 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 CVE_PRODUCT = "nltk"
+CVE_STATUS[CVE-2026-0846] = "fixed-version: fixed in 3.9.3"
 
 RDEPENDS:${PN} = "\
     python3-click \

