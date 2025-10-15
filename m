Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EB2CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:05:51 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.10583.1760515547620607616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hlNyam6e;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso10278470a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 01:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760515545; x=1761120345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duOblNSDCRvMopvY0ieI0NxioWwO/MIdWh38JISorCg=;
        b=hlNyam6eoR08OQuFw/+d8s+Dz8vCSicpYltrubKSqzLbsdx+WPqdk4qllcEQKwceOI
         xFXiRAi5OBsEuOiAmna6JYru8qxxNSqTILKx3hcv2SmIt//aeBM/sf0o8O+LShfNTe1z
         72iDzxvOesI0ToPxl86866KSoBW8Sby8u4VOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760515545; x=1761120345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duOblNSDCRvMopvY0ieI0NxioWwO/MIdWh38JISorCg=;
        b=mBK8ASiKly3MNditt/Q4PGzbZ7yFUTitzw9VHCUhpfzNcCIdER2GMhOO3r9Uiyn437
         mpIumPEkMIqorLsCHGqzWqpyOkDZL0sMnQRaRckC+fQy5YM0S8ipI3Na3J7boCj0SLZV
         mvTyGgMWj5Os+C44NLKB1a7GPKWFzYkU4lPSs1xVenBilwU54V3x4ejk7599stqt4aLg
         vJborbhhs0txD3xtCrU0cPrYnAxQoYSMkfyEWQoHTkAx2ErxgwDJcWTaT9UahJYr0SXj
         Mz/ThPMgGDrYJRnnhUm7L8QAleNR3NVDBNUGzy5Why0ShjbanNXpySGX/ciRNqEluWkD
         NN1g==
X-Gm-Message-State: AOJu0YwJthiaZ6VNJffB9YM99UzAOffo38jYmWjhvGr//X8A9YF2z8Ns
	9if2r8dNePKc0Or9konjsjPRL+xfQAT7Y+cPzMRkvkVSqwGxMXJVfP1o1jBVzlecsPnOIv77j4/
	4Ky84
X-Gm-Gg: ASbGncuroRYgvw8gV9LTzGOLE2womTq4/M2+XaoPc9r2U/QekRE7Ua0+AM0Evj7UJz/
	lNyape8fUbSXNWk0e0+aWh7p0MMcE6jK3CPHHfLEMaJzDRPO9fenBzs/nDn/iYRBVWyIgFoB/BC
	jzEIFuctLb2Pp9ly6l6Tm+3kqxaO2vLHwmAUqZC5OB2C9Bru4EAXfh+Fj2r+/OWix7WhWTbAv52
	d+ss62oWEw+bhF4kCM7X5FdaXXg+6OxLKv1X80wIO/H9C2S9wl/ew9z6lKnF9aBZ1r/aPKNyGWa
	gvTGVM7m4uPuGy7TP9wmt9oiVdhdH6lSDsDTEf0r/4D8jN6rY610j4/7v70mAZK80NAvT17TxS2
	a4Jsm0BXqe3IjFT2wMYfOF8OWKYSLqE32unX/KT3QrviY96dTNR4OLK0q4H5ssNjNxw==
X-Google-Smtp-Source: AGHT+IF5zn/eDtZZEVilD79FW78Rhgu89pvM4QwZd1YBRVafU540YPYAeelAIVd8+DarsNAnW/fvqA==
X-Received: by 2002:a05:6402:510e:b0:634:7224:c6b5 with SMTP id 4fb4d7f45d1cf-639d5c593d5mr26168403a12.28.1760515545218;
        Wed, 15 Oct 2025 01:05:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1d644sm12977027a12.17.2025.10.15.01.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 01:05:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-configargparse: Upgrade 1.7 -> 1.7.1
Date: Wed, 15 Oct 2025 11:05:40 +0300
Message-ID: <20251015080542.3607193-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 08:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120696

Upgrade to release 1.7.1:

- Fix the package metadata on supported python versions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-configargparse_1.7.bb => python3-configargparse_1.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.7.bb => python3-configargparse_1.7.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.7.1.bb
index 4d18b6392d..c056109c5a 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.1.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "e7067471884de5478c58a511e529f0f9bd1c66bfef1dea90935438d6c23306d1"
+SRC_URI[sha256sum] = "79c2ddae836a1e5914b71d58e4b9adbd9f7779d4e6351a637b7d2d9b6c46d3d9"
 
-PYPI_PACKAGE = "ConfigArgParse"
+PYPI_PACKAGE = "configargparse"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
-- 
2.47.3


