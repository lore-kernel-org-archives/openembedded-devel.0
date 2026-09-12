Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B99C88E53
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:51:51 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16568.1789257105775887830
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F7F8F87E;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so566596a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257105; x=1789861905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIlSg1sDcIyfJJfNlVA453Qun8wNaJXnSQcrDz/QXlM=;
        b=F7F8F87ECrAKyrneiHgnrNYtQeQ8r5dFk3Mnn4EWIfwqxlZ3cmIdeGRiOmvQm3mWaF
         RLN1qTIyly4ek6wrJv8tVWZLecMRcG/T84Uv3idtX8oRbm33PSl+6jQbjiCCWTogwP34
         3IT9A2WqM+S61U5Zy4yPIFC6L1rZTaSMA+jorvuWcHK+NRhAv1Bi47WUWZooASoXEhRj
         vlOtkyHMyNsD2xUGrfIioSi9ZNDuMNCosck4t+aRevBZZLUxSmCszI2K4TU+o1Igl371
         cyoZgYauJBopmdIpMHNvCP6CCN3RRnuk5NHoaxY9JyCq5Y/G5teZYZETAeX4xTJxMbxN
         fm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257105; x=1789861905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIlSg1sDcIyfJJfNlVA453Qun8wNaJXnSQcrDz/QXlM=;
        b=sTu8j0mfur4MLVo8cP+bgPRR9KB2+rUeGzrtBOGoPGohbvhb7+NE9rJmuvabKykgTJ
         rF8IBChDT7MDe757ycUIWdHxHOfOKfZayErrBYTqp0Scn69kR73QZr+VjxUNykf/urJb
         niIijzojqDQWZbXmx/3fR7KxguJs9WR2rT5gmuv+pyQ6drFcd3ywTxkPQPftE14my7aF
         DhleW3yHOaWAoj5bS2GfvF30x+SgzI4RvsEWZGU6k7P8kQf4drG/yhn+Yb4+twquJ64c
         4u/9zdinnVZQOqGRcRWgvC4e469+j4acZ+AkoVn6jdsePKEOFEDNWVtB44Rio9HOWevw
         ty/A==
X-Gm-Message-State: AFuF++ndotp4E7VcOQ1aN0otBklojAcLnchc+9JpHSChQJ51qAIemsY5
	kf0fyioFAkTXZGdUgYnlN9INx9J70fgEFpoWsEH6NqRFWn+GlCnqPGtqnzPkkw==
X-Gm-Gg: AYBFou2gttH2DqA9SfoswQGwQ1+Bv2sj/CocM5guJK+k2xW3uWMgqDYkUDrdTBDpwZS
	IfltD+u2JS5aeJH7ka2aGIe8+ITbDPblaoxm7cyXScXAHtn2+ijmPPVIUFmk0EJZCPEQctXsxke
	L+ANCwWqFy661H0aGY54vFVjIgiJvrIQ87CoqaFSXOFkA5BxbU7lJ9ywpc5+PQrtM5IOprUuUaL
	axWdwdShl7DC5HdwwBLiqLUS9OwTENkv5wfunk39s/WO7zMeDgAZCC+pNAdeipb0cizhRymoi8L
	JBVgs/NYeCsYpSL/pUVREfl+kBBze6MgyyHY3OxfHbd/emrcs1CSTtlfitYlTuJRi5DxuMpyH1a
	OLG6M+YlE35TANeNOKMuzq0EWngEkJ/STVLi4Ry9ndDmfPxltq3FyIduTKpR2eoO8wGVKJ4RYFj
	ohh8OwZhkrR7PtGqeUViUZXQprbZ+Z5yKN7/Ot5zbE6hw9swpI3/b/OdKA5GGL4k0VpsZ122hPx
	YsFo9wz1yEsquqlhNEqS/+AGVq04btAcYfCQgU0AbPbYGs+rgGAFkpruHr6mhDmsbkYLdjJZ3GJ
	YD1cLD75VFqVSACfLEdwUgb3nGkc6uxbaJObywlY7fCtH4Jacdh8GH3yQz7/9EkHpccNAgGdhoE
	e5xQdJiJ4KPOupFTL8CXsseILC3MVqRk8O3VnfEDQHm6L9uMZicVlu6mK
X-Received: by 2002:a17:90b:2c90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39dbc1d2546mr8646168a91.10.1789257104838;
        Sat, 12 Sep 2026 16:51:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm16093307eec.6.2026.09.12.16.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:51:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/5] python3-betamax: skip the live-network hook tests in ptest
Date: Sat, 12 Sep 2026 16:51:36 -0700
Message-ID: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129981

tests/integration/test_hooks.py records live https://httpbin.org
requests (no cassettes are shipped for them), so the ptest fails
whenever the service resets the connection, e.g.:

  FAIL: tests/integration/test_hooks.py:TestHooks.test_post_start_hook
  requests.exceptions.ConnectionError: ('Connection aborted.',
    ConnectionResetError(104, 'Connection reset by peer'))

The same tests pass when the service behaves (3 out of 3 runs in a
qemux86-64 VM), so they are flaky rather than broken. Leave them out
of the ptest run.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-betamax/run-ptest        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-betamax/run-ptest b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
index 531af4d015..0acad79f97 100644
--- a/meta-python/recipes-devtools/python/python3-betamax/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
@@ -8,4 +8,7 @@ if ! nslookup httpbin.org >/dev/null 2>&1 ; then
     echo "nameserver 8.8.8.8" > /etc/resolv.conf
 fi
 
-pytest --automake
+# tests/integration/test_hooks.py records live https://httpbin.org requests
+# (no cassettes are shipped for it) and fails whenever the service resets
+# the connection, so leave it out.
+pytest --automake --ignore=tests/integration/test_hooks.py

