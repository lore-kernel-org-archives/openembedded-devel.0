Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFA8C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 21:02:21 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.17420.1711227734852637490
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 14:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cMtRiuER;
 spf=pass (domain: konsulko.com, ip: 209.85.216.49, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29e0a1fd9a7so2101527a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711227733; x=1711832533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWk40W/mtaK9U7sBAEH7TSbRTK111+p/9b+5kWPLN1o=;
        b=cMtRiuER/TpWuOMpUWdHTa5rBhKfi7hnmhDZ+YcpiqsfVj1KbAl9CNiFkz6aJvhCna
         kGfRRrVVkomeWVNDf2aUVAgOGBuQCxDoMeyEsJzPcnQZhsB1DBylat/vOSdw/0I5naV/
         gMPKsB6AbGQ0xxLBnKlvxr6FX/ZpTul3tNjrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711227733; x=1711832533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWk40W/mtaK9U7sBAEH7TSbRTK111+p/9b+5kWPLN1o=;
        b=o0MJDk7Xt70K7xYKkAXANSqJX90yujWaWUG+FMGVXmLBcQBSjYizVWmwWalTSqo91k
         LlSkxBHYC1ifsadGznxQLfPTtVVsN9jPuvsLnj2U5j3NGSY31d2OwX/XdrWHW07Swgxm
         EyY4dhqUNPmbfs16yR2c6qKNTth4zDQsM6kidG2cjJwXWo4Ur8TQ2wNzMz8gifm7UVSG
         MZSOJDwaR7g9RuhL2lDf6RAm4uzimfHXLoM1iGDopGFFzmSBkz6CxMxGOOES/25Jd+vQ
         j7ydeOJKx1XofJlzR59xAHseLSHsLWNsNCd5g2uP36mucbtpZRhzCsIGcEUspzWe3NaW
         Cchw==
X-Gm-Message-State: AOJu0YyRxYYiX4CeIlQ23AnKn3eL0gO/f77Nyf+9wLx9a+TPLS38Qj1Z
	fmB0pb5qnEia2yLeXG1tC0IzLmKZeo/UHgwRvZ8t3QmOPhDYMsheFmFBGvmPEYLL4Jk3JRRXpZe
	3sCGKyQ==
X-Google-Smtp-Source: AGHT+IH7vLEx0OPqUmzkcZ5xhv1qkxadbRaCWGFK51Gj7dfpRR/6o3lT8CFAe6nRGVFLD98C5lJxWQ==
X-Received: by 2002:a17:90a:e147:b0:29c:e2b:ace8 with SMTP id ez7-20020a17090ae14700b0029c0e2bace8mr2511627pjb.35.1711227733426;
        Sat, 23 Mar 2024 14:02:13 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:7342:474:f6f9:78a6])
        by smtp.gmail.com with ESMTPSA id p14-20020a17090ad30e00b0029debaffd64sm7565966pju.21.2024.03.23.14.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 14:02:12 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-java][PATCH] oeqa/runtime/javac: Add package check for javac
Date: Sat, 23 Mar 2024 14:01:28 -0700
Message-Id: <20240323210127.2966853-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 21:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109553

Before testing whether javac exists, check to see if one of the jdk
packages is installed on the target. Otherwise, the test will fail.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 lib/oeqa/runtime/cases/javac.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/oeqa/runtime/cases/javac.py b/lib/oeqa/runtime/cases/javac.py
index 39ae298..3f11511 100644
--- a/lib/oeqa/runtime/cases/javac.py
+++ b/lib/oeqa/runtime/cases/javac.py
@@ -18,12 +18,16 @@ class JavacTest(OERuntimeTestCase):
         dst = '/tmp/test.java /tmp/test.class'
         cls.tc.target.run('rm %s' % dst)
 
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["openjdk-7", "openjdk-8"])
     @OETestDepends(['java.JavaTest.test_java_exists'])
     def test_javac_exists(self):
         status, output = self.target.run('which javac')
         msg = 'javac binary not in PATH or not on target.'
         self.assertEqual(status, 0, msg=msg)
 
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["openjdk-7", "openjdk-8"])
     @OETestDepends(['javac.JavacTest.test_javac_exists'])
     def test_javac_works(self):
         status, output = self.target.run('javac /tmp/test.java')
-- 
2.34.1


