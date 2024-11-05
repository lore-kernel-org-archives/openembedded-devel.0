Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAD1D2C126
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.19634.1730817430016241362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/zu0vOL;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e3c3da5bcdso50807657b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817429; x=1731422229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UDapWj42UVKYQwesOR/8hdyCfsRGSxnv81x7qXAf9E=;
        b=c/zu0vOLW1Nmstsa/mLu7ZRoeApTn3LhJW6MhTvhhO1ZnSk0JG7GpJO1SzLM9LfA55
         50jk8+DpGPsOyPwW/Rg4WFT67Vw5YbcmKij5DQ1pnqPDdN7dUkqEz8t8QzezSfRuZYTy
         kLTBUW/y+MP46Y/nYScWUbx4Tbnaa1W5iOVwr9zhmG7Z6gTeaTUnjaWdHcpy2VpFBkTx
         AzIj3aWZqWKyuPsnSUEHWHrvaAKRxIB/+A/ybYbc1T/2kESq6iXX0hcmbxLEGUsyluh/
         NBRd6fn5ZBxvvdFeUoT5uE04MLFRxZNZXbBukKyQDFD4XPmyE/9DDFfClnSqG/pHy9p4
         pdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817429; x=1731422229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UDapWj42UVKYQwesOR/8hdyCfsRGSxnv81x7qXAf9E=;
        b=NbWhvD9wzF0L0O2FOaojn6xCSp5GPWCDgjpla20iU5/kXXus91pVGfhE2UwrumVzTN
         FP7QZxD6foHW4FAAXacSzc8t+apQV+n4oY0/X6Y0DczyhodgNPUbgXjekWRXVuPMeiK8
         gWKk8fJVbMZMvVknFLWoEVz8Qqo9umRS2MdTnAW3m3S9UbIoHMRQ08q0QxCfKUklJuVX
         aerKFhgKAG2tz+/2pLwlABnJRqH4NsxUPKpEnUuR+Dn3Qet8C1ZxCO6vITV7tiSSfMcS
         dT0bvQchALx0YYie6rWy4pSd0PUWDgXY+lHa+kEad0RIBu1uXHAnhoMkdcFNovN1eABe
         E4Gw==
X-Gm-Message-State: AOJu0YwlI6ImWzelOPAjSOhJqMG4dZEOnv5EhpN56BS0rooDc0AknWbz
	g7QJx3Q+IyhG7SvHIrGAd60Jj5Ldg+hhYejHTNfl2jPr9fUCU/X2Ei8nLA==
X-Google-Smtp-Source: AGHT+IGk8L/vp3B9/TQDZYCv340bBqgzTic80Dn3vlpm1BX0KYhHUKwjZfInHXR4aHM0iV+7vr+X7g==
X-Received: by 2002:a05:690c:883:b0:6ea:8132:4081 with SMTP id 00721157ae682-6ea81324270mr109773347b3.3.1730817429072;
        Tue, 05 Nov 2024 06:37:09 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 64/90] python3-reedsolo: switch to PEP-517 build backend
Date: Tue,  5 Nov 2024 09:35:29 -0500
Message-ID: <20241105143638.2301245-65-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113482

From: alperak <alperyasinak1@gmail.com>

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-reedsolo-2.1.0b1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9a5f017a0159e26b9217c8748da74a5ce3c94c2c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python3-reedsolo/python3-reedsolo_2.1.0b1.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
index bd2b59d369..6884e908a7 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
 SRC_URI[sha256sum] = "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa9eddb44527ad8ece"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-cython-native"
 RDEPENDS:${PN} += "python3-core"
-- 
2.43.0


