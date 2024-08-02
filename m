Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA1DC52D70
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:30:44 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.95647.1722612643773893604
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UpXShrp4;
 spf=pass (domain: konsulko.com, ip: 209.85.208.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa7bso9470766a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722612642; x=1723217442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5HoheAbdYgHOctaP3tgNwrMvno6TIRfDwS+HI84i4A=;
        b=UpXShrp48mgK9/Gsmk3TJR9eslRn0xEqZEg/hMpuCA7fG7WbEGcmGDOrWCVShYH5S4
         8mzCJM9ApXOHx69cVS4Ny6I4c5J3/x7Ozx2x26pDm50/9KKMDVJNPFqkj6PErzhDnSt+
         aDGEBucbXNBNUr1R9LjPQiaz8CAFO00MHb7N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612642; x=1723217442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5HoheAbdYgHOctaP3tgNwrMvno6TIRfDwS+HI84i4A=;
        b=TKpt74ZJK9BmKjCdH97I/6KVa5ybOWUn1IXjSHC614mU6OG45yPwmYSv0qCSc3VGs0
         AuKkFinquR6w8zYv0xDmVVtSIS2bkLAI3bUGwNa1I6MgjUZYUienvQJ3f/NaAT0X0FWf
         AAqrpNHB6I2FmaNjKNDFpqy9H0i5lI2bofONeefPIQXGiV7JWjHApzm3wbq6L7JDZ3DS
         VN0x7JSqSSA+miqwz809hPleHsNXiVspXMtOGC6kpofQ+z2ISr9iR04Vb5ZMuFutLGoO
         v79CDOOkJygl7cYWQ8mRa4pV3GQ6ybdZn+HZVmlE//6UGGo0FQEL5h/5mmk6qAWX5eYl
         NKiA==
X-Gm-Message-State: AOJu0YxDn3Em53wlQy0EZ9kh7arFRwN3SXNbiT3XGYoOTtwK5Aajjw0j
	VBYGuSSVDklbL89VVSVlCBussMYaM8hMCy1E1O/0jEDAK2kisr0R56lSwzjPIsDTK385A2RKQms
	6
X-Google-Smtp-Source: AGHT+IGNiTilKPzxfFUwn83WQOGHt0Q2YCfnW863HZYf6ApNtIQQBCegc6fCbNNSYMEjMLfr7wLcXw==
X-Received: by 2002:a05:6402:284:b0:5af:51d6:d8e with SMTP id 4fb4d7f45d1cf-5b7f419f7f8mr2870643a12.20.1722612641915;
        Fri, 02 Aug 2024 08:30:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839719fdesm1246863a12.8.2024.08.02.08.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:30:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-multidict: switch to PEP-517 build backend
Date: Fri,  2 Aug 2024 18:30:35 +0300
Message-Id: <20240802153036.2649396-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802153036.2649396-1-leon.anavi@konsulko.com>
References: <20240802153036.2649396-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111500

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-multidict-6.0.5+git-r0 do_check_backend:
QA Issue: inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
index b12e180d0..6346152ae 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b4fef6e4b0828c2401fb983363985b39"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 PV .= "+git"
 
-- 
2.39.2


