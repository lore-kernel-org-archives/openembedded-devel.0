Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C20BC4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 22:19:53 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.69716.1701037193135676326
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Nov 2023 14:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dvfrq5Jp;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cfc3f50504so3771755ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 14:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701037192; x=1701641992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dvEiud8Hztov7AqHVuISAupWkCVCRzzNAHnq9B9KOvM=;
        b=Dvfrq5JpyTXlzI1KZEyulKVj6dB+kjOXscRMFDGXhmrWjolCRLGAa327/VXUfo+y6s
         sRLzqcyB6wUlcjgfgS1M6R4jPzpid5wTpdOJfpxBi7SAs1NeKGrwsECPpJMCgHDSM1GT
         PyKvPpRXBd7W+kePJBcjZZvFIv4pUNR1yHZ4U3SFNx6ItUQYTZnQYryJTQ/Ub6Zo1wf+
         z+89i68oAQeWuSK74kmMhq9SEZwptUKqPg271oorhimHe3g5FrNuiGVodoLOm4+H6JfZ
         1QWFWnrWLQOwWreRAji4WaOEtA7yIVsBSn4KM31u6IlI+Dt1ptyi0FMtbNRZjOxvWwGW
         83pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701037192; x=1701641992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvEiud8Hztov7AqHVuISAupWkCVCRzzNAHnq9B9KOvM=;
        b=ebpmm8bSHahjclihZlkrekb2OAY9+eBmgiM8eIQKkW1hOYWk53wK8C3lmuFfpfjwch
         /jfyhKZht1kZBFpU+Regh6da8DvBBAVzHyMZBL8oAysLC2zwpR4ViCIh+rhIl/U/zMQl
         NIDqKUqAJ9ts4gtoHpTJZbJfwhbnJFF1nSux4/48i+N03bYkUTWU0UvRLmygRbGPBVX7
         EbJylxAcGJexBORefiGvaOfaM01AIQwh2Nba49L44jvYe1HhdAAeARfCIxJ0AmN8poIp
         fGMdnrlnIVaoAsbLebj0FcCNtdz45xZGU2zOqK2MP9hXW+kgX4v62fkmyLYaa6G7tteZ
         5ZEQ==
X-Gm-Message-State: AOJu0YyHNC4o469lGrYpGabw6vAhs+73NRHl1mzonFNj8l7IqRsfA5i/
	VyufL+Nvy/Dyg3TYL0rmg60sp45krNDXeQ==
X-Google-Smtp-Source: AGHT+IHWmV4G7a2OwS3tVhgWk4kCgyPZvsM8ms/GLAP68OjH1RZG4IYqYWLzafysmXX3a1btMsnefA==
X-Received: by 2002:a17:90b:4c4d:b0:285:90df:1781 with SMTP id np13-20020a17090b4c4d00b0028590df1781mr7454867pjb.0.1701037192143;
        Sun, 26 Nov 2023 14:19:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00285994cf711sm3577952pjw.33.2023.11.26.14.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 14:19:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nlohmann-json: Fix SRCREV_FORMAT and do not package git metadata into ptests
Date: Sun, 26 Nov 2023 14:19:48 -0800
Message-ID: <20231126221948.3343737-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 22:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107055

SRCREV_FORMAT should append to default for considering both git
repositories.

the git hook scripts require shell to be installed on target and
it may want it from /usr/bin/sh and distro may not provide /usr/bin/sh
since its not having usrmerge distro feature.

Fixes
ERROR: nlohmann-json-3.11.2-r0 do_package_qa: QA Issue: /usr/lib/nlohmann-json/ptest/json_test_data/.git/hooks/update.sample contained in package nlohmann-json-ptest requires /usr/bin/sh, but no providers found in RDEPENDS:nlohmann-json-ptest? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 694d632cb1..350932388c 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
 SRCREV = "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
 SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
 
-SRCREV_FORMAT = "json-test-data"
+SRCREV_FORMAT .= "_json-test-data"
 
 S = "${WORKDIR}/git"
 
@@ -36,6 +36,7 @@ do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -r ${S}/json_test_data/ ${D}${PTEST_PATH}/
     cp -r ${B}/tests/test-* ${D}${PTEST_PATH}/tests
+    rm -rf ${D}${PTEST_PATH}/json_test_data/.git
 }
 
 
-- 
2.43.0


