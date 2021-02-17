Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.285.1613596270499914252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 13:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DGwjTPJC;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: wesley.lindauer@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id c3so23173qkj.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 13:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mZbPu3Hjt34v9sxUGKHvumbyw7L/0L61/E3jCac9dhY=;
        b=DGwjTPJCTV9kgcJ8I2MF4GF2SRTZXsIDsKCAR69rGgAJd4Reb3cpJkuAeCEqDjiAMs
         YzptRXPSCGFWXw8GyPRlUzwFq44Z4TjuuNhRtf3CR8Vi8a7gYS+VuEAngEGssOYW4ABH
         RXNeZcz8Q7Ub+hyy/SOEhEaICbuBConQ6x4arvUjGN4eIngEIkG3TUTY83wRBwjulXZB
         aKtvB2dm6wn3qFnm2JDwsVrsnNGlbCRjwZcfRIX6PyrQv/dRlJd7uRLWpiNhCrNrQwDO
         SerVgFvF7E3UPJauyRN9IoVoHOtecZqHIMOoWfwMFsPKjWWmz5CFAuWzglF9Zb4ROU0X
         7grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mZbPu3Hjt34v9sxUGKHvumbyw7L/0L61/E3jCac9dhY=;
        b=ZYgwh0kxON30ofmdY7tQUe4sv6nCCEZNMWexa0k9K/2RtyQ8FZbNgGSoldPv1zlYDa
         ZhEbfttzuQFnxa9lldq/RVRbJfJFGlCQoEUlEnkPRb2jeqU41E0oD8tcaf1Yos8EUjz5
         YAMCn79xb7Lu3863heSW16GAtQqWP5X9WXqUzmx1ROLWuyKMlQQHzV6r2krZsWq30KFf
         B2qE9wQJuRTrpWxZd9p0NkIr/UI1mo9tH0uwMv9KB28As73rkSuZV479LUdvK6/wqg19
         9yKPCpepr0481cP4cb0JCoo2Wwu7b7++eOKrmsPkzUv1yXuzxnMhoUFOUfEcyxeyzUZe
         3eAw==
X-Gm-Message-State: AOAM530TF2gIVC77FKffG/A54wcakNS1B94X5IPQs3gwPoJXZMzxt02h
	KSz3wO11fxKXcHJrU7nPZxmJ6gvPDOs=
X-Google-Smtp-Source: ABdhPJzYjD0Yx0S+qjavx9TChvegsHxpbio6NtsIhtY3cqOH1Gl+Zl3rIscwC7urmuBQhkETZfDjiw==
X-Received: by 2002:a37:a395:: with SMTP id m143mr1144150qke.439.1613596269602;
        Wed, 17 Feb 2021 13:11:09 -0800 (PST)
Return-Path: <wesley.lindauer@gmail.com>
Received: from nova.caas.local (cpe-65-24-166-29.columbus.res.rr.com. [65.24.166.29])
        by smtp.gmail.com with ESMTPSA id 16sm1947886qtz.17.2021.02.17.13.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:11:09 -0800 (PST)
From: "Wes Lindauer" <wesley.lindauer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wes Lindauer <wesley.lindauer@gmail.com>
Subject: [meta-java][PATCH] oeqa: runtime: java: Add package check for java
Date: Wed, 17 Feb 2021 16:11:00 -0500
Message-Id: <20210217211100.11491-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Wes Lindauer <wesley.lindauer@gmail.com>

Before testing whether java exists, check to see if one of the java
packages is installed on the target. Otherwise, the test will fail.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 lib/oeqa/runtime/cases/java.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
index c1e1498..d366d61 100644
--- a/lib/oeqa/runtime/cases/java.py
+++ b/lib/oeqa/runtime/cases/java.py
@@ -20,6 +20,7 @@ class JavaTest(OERuntimeTestCase):
         cls.tc.target.run('rm %s' % dst)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["openjdk-7-jre", "openjdk-7", "openjre-8", "openjdk-8"])
     def test_java_exists(self):
         status, output = self.target.run('which java')
         msg = 'java binary not in PATH or not on target.'
-- 
2.21.3

