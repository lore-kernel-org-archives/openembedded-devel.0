Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D23C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:27 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4192.1790160146578185144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rYOF+jBk;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86212a185dcso578711b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160146; x=1790764946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oODtCWMSTJpLAE1P86XTxOTwW0ptBmn7n8wUDl3Jj8=;
        b=rYOF+jBkh1du7N8i8elem2dZYyUCXh4ModH+FVJJ9TvLRZr7+qNVXE8I6pjQgUXRTt
         HjphKrN572GQe+wtrYe1vw0racgDo3d3p5xGPFkLAE9tpzAfY+o/Sij6oG4g9+Yy3xhZ
         h4CkLFG0GNdcf7nLSoCpcgBdgUe8sAYYeMPJR7q4HcEMBr0nG1Oy+gozrDN6quTXmEsZ
         j+Bm55TYdgGpMV7zcPqjDo77GUQZgr5Np5in61RVa6nAd1ps5b6PXnk9Q81dBUyCX/cp
         6srXicSg191lnvy38kPi3+SU2TEs3AkdEhcL9uPp4NyJSqLY78Vx7txzUV43zhcqCT69
         3GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160146; x=1790764946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oODtCWMSTJpLAE1P86XTxOTwW0ptBmn7n8wUDl3Jj8=;
        b=FNY34Dd3GZ0VqxJFsruU1VV7an+o7gmLsiwCuCPp32Pql7Rs8Yk2VkQB/cXW+kssDs
         MVCMtEiv4zoKHt7ql3/DIlAeVKQP9aXyFt5hb/ab+a7g92y62FEhmKwqxDvNFRtHJy0P
         kWnTjUCK8eTCshv9ex04Qk5M88GP6MOKBlyBP/YIjaAE3pJ3qzxuobc2mIErl8EyF7cH
         oJ3S+coSo2KXBHSFcQi/oWtpvEwoanucy0Y+bD4WZZFJT10/Q+7Amq8wh6h8N88S6d4H
         1PrV/V/GVIyCuvC60A7uCzzhzwSEfVxXRItEyQ8aQ5onamTxCe8YROVQkgRj3k0CvPyW
         re9Q==
X-Gm-Message-State: AFuF++nXkXS+KWhvE6fXPMnqbTmytE/4YVIXc29FbOLQ69sSS5aoozbb
	b2PPiiBv8ylf7cnImcIAQmeey0CD0H9vs7lnOq4XX2iGzGx8i74q2G08WPg4pg==
X-Gm-Gg: AYBFou225qLtZVw28Wh74BKWdHpKQJIyFHv9/o+Pb74G03AE4QxYnW1pcC1Rz6xbzZD
	NNFaHoafBaE2uVDnzojXP0bigi9bjxhburzuL0xEq34Q2fo09hrLNanQT8/dcEbojQwP+mW55mB
	0jKSZ7NQjcTL4dM3LH/NP7IyyYCg9MuOVkHxpS3I3R649Sq+kW2h0YJpjyOz1/Aie/VNrkHkMe0
	m9Ds8BMaqFg1HStnT6bGhoYEekZMxd7izTDVfup4N7zbtqTcE1QoB/eADfDqe3RDeX+NVfeccHa
	0jz+IXkamjBZkURRGgO1Ls6uFn4LcEiKAywysRkukhTsi3M25EiuRABNZ4im+hMAV2uUfH1hEi0
	HIe95r9g1HyL1EdeugBQNYdBh+eTBTC82gJnXUgioyCWARqE7/rOrn52blNvJ3v35b50Siqs+0W
	rmcYAHPVuzst8Wug32nnWQXG7n/7FM0a5vJD6qxzVi5svhetoUlZI+eQlFmrEJdnMSQBpJa2UCb
	CQVaV6U465ys2YFBFaPyB8=
X-Received: by 2002:a05:6a00:3919:b0:86b:922d:6aa with SMTP id d2e1a72fcca58-87d1a5ad93cmr1757574b3a.1.1790160146001;
        Wed, 23 Sep 2026 03:42:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 39/42] python3-flask: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:53 +1200
Message-ID: <20260923104056.457360-39-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130226

From: Devansh Patel <devanshp@cisco.com>

The current "flask" mapping emits the wildcard-vendor *:flask CPE
instead of the exact NVD identity for the packaged pallets/flask
source.

Use "palletsprojects:flask", which is both an NVD dictionary CPE and
an NVD configuration identity. CNA affected data uses "pallets:flask"
and "The Pallets Project:Flask", which remain covered by scanner
aliases. With sbom-cve-check 1.3.3 and the pinned 2026-08-12 data, the
generated identity changes but the current CVE report does not.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6cbb85db1a06202d3e2422d51f6c31dae7bbc881)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask_3.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
index 559f781e7e..1e3890e7f5 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
 SRC_URI[sha256sum] = "0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb"
 
-CVE_PRODUCT = "flask"
+CVE_PRODUCT = "palletsprojects:flask"
 
 inherit pypi python_flit_core ptest-python-pytest
 

