Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFD3CCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:07:55 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14393.1792123671328455131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QDEf7vdS;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8fe8e343fso25665965ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123671; x=1792728471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HOihMnDMJkcXyygoOReELhms2F3rzLvYN/eIk1Nou4=;
        b=QDEf7vdSV991Tb0C3g4DOxrklHwsqJJQwkTJf00/LFOoBUrUGlG/27VN0pLC9RlZBi
         jTG2df2gkaEe3CToUAn/+cGntR3I2fOwUXPQZrxThijF3TTMKPrE8fCcvDGLpq/lmMyh
         wwRcou0S6ZIfCjTTqPeEzn2Kxus1rbqq2o2f0RNHY5DL804fQMRl3mM2I+AAPQR0+EHy
         EPKoQzcnM5WPCApOSXVHrdgVbXlFvixlAiAylf6OlHV2Up/22h4oqZIL/Ashiblp9nyK
         iudKtM35g3Li39NzTeMuieek9LwFXS/3Ozs+QC8Yu3/OeluNkXmNEMjdtdS+ogHNaQpt
         udqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123671; x=1792728471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HOihMnDMJkcXyygoOReELhms2F3rzLvYN/eIk1Nou4=;
        b=vw3jVntZbREfOAZBmuTd1nJLt1VbOoOoNy2SpZdsJpqLOXIicbMOmHRxm3sVzY6c3u
         mGqP8yxoVC/pW9MGT8JzCrE/vqjj8gOO7vzvJhDSUgw6uLP5Xn+BHnduwwkTIHVbhQeM
         WW8JfDLS6SA5j6NeweYl4r91jGc5wpjuvBYrepbNxHa5ObyuuWmj4fZORvBnT5baM79f
         qf6wHrCwL8pae5HI6MGa9dSbDQecCja9qviI8yBXP1w/ivfmHgs0digWTMbc35RtOZ09
         G7i7NSUVLTXrDkyEuAomffkcsqmwD+RDHqrFs4G7W0B42GEfUGUuUzl/RyXN5nW7JyrP
         ifhQ==
X-Gm-Message-State: AFq9FYKkynQ7LFkdjLfmN3JPay8xEjH1a4010GPvk3XsonIU8M8I+VL1
	ETHJ61aPy5QlqKYmobwhz92rYVTn6Os4XH1gmdc1Ckj6kSVzzBKee0A6noK8OQ==
X-Gm-Gg: AYBFou3IVk82A34QKap7JXFpzJ2Jedrgd+m8CpnKueWpLWXQnBcV7kDMoaYF6FRHMsm
	9QIdDGHaoW4EGk0gdWen9omzU/dD++oAbEawJ/MTm1zYqVGiRCbl4XL5NLtY0xL+bFCgu+Ys9OK
	OvqEETltNPFXtp1adxI4fsRYfJsuHhxnr/ote3BJ4/GZTuwbi5EFJo/Z6XYaB1zlEOV5Ep/UJW5
	Abua/AWp9eMs9gybjdjIpHImckWyOHuABFGgf8+WvuuPsvdf44DSOLfAtUhAx3oyet8m8HQeEHd
	45E6Ejr7v2gBiIgsPnyH8xKGPFRZXzagYJAck43Nb3oueOqP0Hc+5q/r5Sdq1jPXKXPbOttAPs3
	Syg87SspoZs7hyiFZ0toynfOV9d5u4AP1LoNY5A+9t3AtgPOx3WDcDFbHUzUBjBrnz/k68sVM39
	o9TJFMcSeO6YSd91oWPDdRhe17YLGU5R4yBgT8BMNCBBlsr/hclwzgkVPnnETDSbC6F77XHmqpP
	g4/vGuSViyp6W5LWkjy9X4pUKd8nqDD/Lu7pW0=
X-Received: by 2002:a17:903:26c3:b0:2e2:df9c:ff71 with SMTP id d9443c01a7336-2e842ce8010mr183024005ad.49.1792123670636;
        Thu, 15 Oct 2026 21:07:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 4/10] python3-cbor2: upgrade 6.1.4 -> 6.1.5
Date: Fri, 16 Oct 2026 17:07:28 +1300
Message-ID: <20261016040734.1499287-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131040

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/agronholm/cbor2/releases/tag/6.1.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
index 6a894848d6..94d3f30dbb 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "01ecc79a28f33d17331943ce508fc1e21f4b06553c73f874f4c77120d72b2ef9"
+SRC_URI[sha256sum] = "6eb06160c42315ac0c4ded461c7d84d92fa18c69d13d17fc1dfc1fae96580c95"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 

