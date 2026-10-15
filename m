Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4646ECC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33258.1792043067768056750
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ovtuaEPZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e915887d9dso17337705ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043067; x=1792647867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qeQ9QHwlxiDJ3Gh9W72GUq9UkqWYiO2+mQlb9VZTTfY=;
        b=ovtuaEPZk8t2GBLfCNVfH36uuI0eXHg6t4+NnA+lGada1hPbp2Q5fhGVLJRiQg5zm7
         5W5WqO9VKv96wpf9JlJdCIp08hX/LhK3CgEwrlr7aDz2SSfASdjlqmuIon4BmyGaJC6S
         n76EZeHN0Snu4pgo34m3IlzeikdAlkh9pIKintynL/TIRjOsIKffQIVfLEhi04XB2N/r
         WV0LFZuUP30HOQXpapemK3RMA7O/XlPsvGEHzXjWgkYQarIkXnGHLsW2kvZt5Z+0tlMT
         6pr+ZJr91G/YsFGW2vWBAwgN1t33ztMfF3nO1OhpcmRuPy6X8By2u9O21Iu+RnvX2hOz
         L1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043067; x=1792647867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qeQ9QHwlxiDJ3Gh9W72GUq9UkqWYiO2+mQlb9VZTTfY=;
        b=tlxWaTCR9+LxEd82wEYDhThgTwErxvWU2dee0T7Ac92NnfoqWD8j4tjHQmBw/tXSRh
         ywufm6nx6m2dLLMfVHHs4cskS8Kdbj2+Zup9/aEpNa88pl3/gWmgoCunl5RbvsN90eoN
         /FKyrM0w7QJb1IQ0rnoyjyO579LE8FGPcedKvRnWPkJAolpadFlG7huTLb8bCLEszhAq
         7QjqhwR/frArCN3+u1vNMRp7e+3X6TbXNQysJaL57oRalqdS4hHV4/+h/KruU5i7Bwfd
         etjMZe6IE1wPr4K0n7KvtsJmOmpUAgfg3qbzCkFDogt7DcWHg0Km1GKOSLN3KsXMzQ93
         uQ2A==
X-Gm-Message-State: AFq9FYIGto/CCz5ZwIH/Rd2gQrgzbFjJRdPwARD1Aqv347cSi/P2Mtwz
	XT7ZqWlTDtDbzZqUK8/jI3uuZLsZ8NUC6YLQyRGvTAM5lT9COzhpUIY8oPFi3w==
X-Gm-Gg: AYBFou0ITnymNIWPPQppFoOzrqX+I51JBs1yIuGhI7gy+9++DYGdV5A5Usq/DG7pI0C
	SsQRoUIZze/hslB9kSENZ/+83cYCxW8sKrC00ouu0cDaRIiKy3ZbT+mPNmCCto/cq28gx4Yy1/V
	5excHsMpwYX6AXzGV4c66HTLjqz+z1g04He3oH+SifZjFiIYnzImfzHUsRqbAiZkrKybGDPqkeV
	FOsZEFWCYpVofChVydAUP1qjct1INeKK2aNRdVuB+Nu+2FfGWTwnNj8pgQiBy+wCBzIhvAHExpO
	vxpylp5PsrAiqbR1oVT+vFKDKD0oD6vdP7tYOirpU21kdo3iGrLMrZJHA14uHJUmupO9eSAccNk
	ol95m5yN6VeMvDljn9xh8tfVdOyYRX8/CRdYoyBKlf7Gezh1i2j+zlIbe9KvrkGCuvWv/g2b4q6
	ZoAtfeoUAOVaiUkz7FFgTKEV5//YzEhst3spyyQ91QpbB2RHBcho0m/M/4+mIqxVt+5o1qaFmMF
	3Dhv8+3Ifc6dCWou4cyjIs=
X-Received: by 2002:a17:902:e744:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2e842ab6aaamr151172295ad.24.1792043067149;
        Wed, 14 Oct 2026 22:44:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 45/82] smarty: upgrade 5.8.4 -> 5.8.5
Date: Thu, 15 Oct 2026 18:41:33 +1300
Message-ID: <9c7e3a2ba9d9107a3132218512497a33b292b4ab.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130965

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/smarty-php/smarty/releases/tag/v5.8.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3fe4c2247419cbe376ad010e2e56536bec3faab0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.4.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.5.bb
index dcb7c85a80..83f428d388 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "94a27cbbc7820198d7adc17a2be8d457fb267753"
+SRCREV = "0ae663525dcbc9e996feb2a867e43bc85f960938"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

