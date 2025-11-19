Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED1CCF6483
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:58:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18970.1763589488701916424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 13:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMyL14CW;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29845b06dd2so2506895ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 13:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763589488; x=1764194288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qm87TP1zn6Fzc28f/ZDSdZ6MzrZwO9A9BeqYqMxoeoU=;
        b=UMyL14CWwAp9fXpAEAiAhgoLLrm2uyPQ4SGKA5ApvIwUFr284Euv9ww2hUPUtEYvm5
         su7kFYnak2zMQXpuTimPMtn2+zv+nug/PZo+zFS4ZevB3dIwBqUH1wF0yRsdV10WBliQ
         0VjWVBfQ5l1QsxAnl4581UbvhYaU6tuZxAPQgK4NCrzd2Uq3wfkrj9nR1/N39CSCJh7u
         OQlZU/RRqyS1SSp0DR/E00AKDyOg6UHzgBU/MCD8aZiR17i8wGscH2Qr+M83q1Yq1fxm
         ihJI22ROH7Q452v23P7jxOTPvR56P0emdhLJ/3RRzLMRnibjB5lr7Cdc1pxbrBLEpQQg
         l10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763589488; x=1764194288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qm87TP1zn6Fzc28f/ZDSdZ6MzrZwO9A9BeqYqMxoeoU=;
        b=LG1IYjMRBsK/RfihZ73pTMQvsQpvw93tumP3gjZDwAHUEYjIreC3j0maVASS2s9VY3
         NUDqX40MvyH+wkkuYChjNag4iRsw5F6Uly73+yNQx+ha9Hf2EwVXUrdHg5D6a84y8z4x
         H6IPwORsKoU1MhCq4G77BkA0kqqI8mWXifqS3n4USmBJ+3S9PxkzO//TTD9Oq8My7llH
         dWA9RWTqyc91JqXKRK+oCMfwYlggriymXbVvITvXdGXJiyYZ1MvSUNb0bEL3ZjNl1br1
         aZ4N/b8mfhI2OMD++5ePC/mb5j1ThpMfNM+7zf/yQkcZ3o1PmwnWnZZF5jKy3DtMDTqN
         hipQ==
X-Gm-Message-State: AOJu0Yzt/ZlOw6+1bQinhsAEPJtbUDB4eTvJnkXD67OETl18uTNPTHPe
	Mb8/iZbarFU9fuLzgCiiOI3j0AZ+SPotlCAzDZmNXmwO3vF5Iq38fJrBP+W5POOrNv8=
X-Gm-Gg: ASbGncsr+a3NcIyGp+O0+/N7DJA67fsIQjUZGeZy1lNoQWVjQo5M/jSaNkiufpXjCtm
	v5zHe5sUxsPUTPbbYIJTRbwYZnGm1HdJ58Voi8mycAb0Pau0jyAIyB4XIDpfnYhwnroxLk+Xzui
	f2R2jT5Btn4NCYRQmzUE3ZvTXI3p5BqBsbXmwPjNsx/uBvLba0fBq8Omd4YARD87AD8yeIZgWSb
	u/2CHhnMQY0sVJjhCZYznVA5ZEsH94aEn/yt5+M/75NRohRy5ize0Dvf+S1DmyAlfoCuQ8hbQVk
	WEOnIIo2NG1FUxB2Z21IGIOXm8Ekm6gVz2LE+jLAbCUJTebeSVagXRt/+Oknti9kImv8RxwGFXV
	twO1SJ8swUrNAanjm/kXksZxeKRkWYLlb/FB0Pa1+dVu1SpCES/bGNN2AJzaTdA0XuwBU1rBQyg
	+mAd2Mzjl5xUyF/DaIymVv3kZekhdbo5aruqPUhWlkb3qiv6rUYdOfwB20EDRz6n/EZCti2ZdwY
	eqI2FLPPLUqOS+OwrBz/6fe3gR5AMZX8o7/z1q9VFg=
X-Google-Smtp-Source: AGHT+IHkj7s8tlr9AkNzvONBcDalj1qblCqgUDCCCszwF1OEB1l9sSOv87GWUb51GGP0Eo+2ZLhY+w==
X-Received: by 2002:a05:7300:3254:b0:2a4:4324:7d2d with SMTP id 5a478bee46e88-2a6fd121094mr378881eec.22.1763589487640;
        Wed, 19 Nov 2025 13:58:07 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc4f6671sm2759109eec.3.2025.11.19.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 13:58:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-parsimonious: Add ptest support
Date: Wed, 19 Nov 2025 13:58:04 -0800
Message-ID: <20251119215804.256151-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119215804.256151-1-raj.khem@gmail.com>
References: <20251119215804.256151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 21:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121917

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc        | 1 +
 .../recipes-devtools/python/python3-parsimonious_0.11.0.bb | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 1b7e14b9b6..ad179ccf56 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -54,6 +54,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-outcome \
     python3-parse \
     python3-parse-type \
+    python3-parsimonious \
     python3-platformdirs \
     python3-polyline \
     python3-portalocker \
diff --git a/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb b/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
index e9da557967..0376b5066a 100644
--- a/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parsimonious_0.11.0.bb
@@ -8,6 +8,11 @@ SRC_URI[sha256sum] = "e080377d98957beec053580d38ae54fcdf7c470fb78670ba4bf8b5f9d5

 DEPENDS += "python3-setuptools-scm-native"

-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PTEST_PYTEST_DIR = "parsimonious/tests"

 RDEPENDS:${PN} += "python3-regex"
+
+# ModuleNotFoundError: No module named 'timeit'
+RDEPENDS:${PN}-ptest += "python3-misc"

