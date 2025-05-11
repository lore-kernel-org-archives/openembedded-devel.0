Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0990C3ABC3
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 19:46:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.35120.1746992813611995543
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 May 2025 12:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAjmLqys;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2031387f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 12:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746992812; x=1747597612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9F8kQXowXi230kqm6ofQ6M97umaeNghF0XT4VpvGmw=;
        b=hAjmLqysDoEWcKp0b/SANGpU29yKPnlroWhvW2bPpvRPg2irRXbul3Ufm7PwMmyKtu
         ovhf0H7jCyJLpMTCrfFtrxmOGpVT0+K1CdgLq9v3XU3BXk7SwH5Dwk7kDbiP2RNoNRvT
         rj6PpjRq7JeZsyuhybHl+4+mQ3j0ez8PM5d0Z2dExAXI7rROfPHg1CNH5GadhgtCEYVZ
         oBSi+O3Jp9O7cdykSec1qq12ZI3tUjmObDAzERaW9lc+5IKE2+ESAiW6/0tdd2tdxp6r
         CE5VDQ+9VV8thkwv7RubsiEW/Cp948jjDQCIryOFfSHS6ummyfTlt47sK7TJkFMMI/Qo
         E3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746992812; x=1747597612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9F8kQXowXi230kqm6ofQ6M97umaeNghF0XT4VpvGmw=;
        b=vPZ7Rn44v95jPjnkivsAOcWPgsPA7cmWeLsA4cJx3jM3wCUjBBaz8+GR/MUw6tm6hM
         rTAvPgfNFTtELOJ3wYbxPHwn9OelKGu2A8o7RA+vdNtN2VXEFmliLKtWSoYCUB0LWujK
         3UQsXWYYen8zwQgLGNwOIYbWAkwxiDR/0k2lQceizUHD/S/o45bVVdnr0feaMiUM/Q0z
         PPw/c4MmFp7L9koI6prU9rZML2hDODsTlAlLrffjyKOOY9QtPT9W8tVTGgaM1kkB2OVQ
         5hVR+MSvEGSdzVmt/AjHwvyfgtLCcS3jAjKdHA30VBzV4r/Di07eo9UZi1mPi8PHmJlb
         2mDQ==
X-Gm-Message-State: AOJu0Yzw/2va8xKP9nEDrRB1S00HjE1JN1b4wxZc8V4SEIUwtOY3j4yn
	uOscOI+rten5A0tOtjAkpCcn7mX4E7pVqKcrWYfNY3kd35DtsmZY5KlMbA==
X-Gm-Gg: ASbGnctQs4Rvak8obFk1F2Jq+BNPzGhVyrWu7i7jTxWvyDsSReseF1twIr9cL1FyMtb
	heL1wr+6UliYGBuTz59e5gxh55fcKP9TiyNXck22WadLLonRUHtxQpjSpwDiShmVk58NwyKEhNe
	jYNB62K9p7mfVuKdn6wHFSQTeCAF4rh064BRH1hbXg6m5s6BRQT++VQEIbSqpwLrmmwZCwMX8Af
	daxKI27myBc4+FkK1wig1RKDntHQRCvplpoARNkg2N6rfrceN57I3mepmUU1rXWT8vaMigAzOuN
	cLIDhGLoCxhUupeX/sNItv6wUFvnQLAeIqbmxootftS7TVikHoIjMjTc6D86E/oxXtxCfMIYGiJ
	MtjE7wRU+
X-Google-Smtp-Source: AGHT+IE6sGu8esAALOaX5R2pKMvi/ECbHqElqeO6Ucsw4AcnT+DAraLjzfYqz9nop7QCVOBuTQulsA==
X-Received: by 2002:a5d:6604:0:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a1f67e3861mr7250452f8f.0.1746992811801;
        Sun, 11 May 2025 12:46:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58f2f65sm10277158f8f.55.2025.05.11.12.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 12:46:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] xfstests: upgrade to 2025.04.27
Date: Sun, 11 May 2025 21:46:43 +0200
Message-ID: <20250511194643.2449801-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 19:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117385

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../xfstests/{xfstests_2025.03.30.bb => xfstests_2025.04.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2025.03.30.bb => xfstests_2025.04.27.bb} (98%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
similarity index 98%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
index 55b509549a..2afa752b78 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
@@ -2,7 +2,7 @@ SUMMARY = "File system QA test suite"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
 
-SRCREV = "b59671d2b894040bd355ddbf1ff03285607de16f"
+SRCREV = "92c428db1fe3fa4f7bd2593788bc9b71403d59ae"
 SRCREV_unionmount = "c6ab621ac19f2b96d34cd98f244e611750e2bb23"
 SRCREV_FORMAT = "default_unionmount"
 

