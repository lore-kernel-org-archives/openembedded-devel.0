Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F433CD1292
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 02:07:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2168.1712282830690675644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 19:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ng4Zv6PU;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2a28b11db68so1076592a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 19:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712282830; x=1712887630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/iI+HEeZGcZXZUaURSyXdfTy75Q7ZBc/DYpYsXeQ0w=;
        b=Ng4Zv6PUrBfKfOnFBqmWczsLwB4n5goPdW0OVvviRN8Xxb80IknBB5HICZYxuwZNgy
         2vI6Upu2K0WCM1EuSUr+SVPmfU6hXPAXa6Hz8j/qK+9HGlrVhFijGeGLinrThyS8CBF5
         GqevStRrPA1u4nZfDYGYWHAvSo1nVqJqCKb0Jmx2bu4LBIS7eGq1I+ybPbNGRxXPIaMe
         YV5fGp8hzsLMTpICVfZL+G3rg++7EoM4fViEyedMKs5Gg10uahyGNzPikqs4TMpPQLtw
         DaG8h7TZB5QSspvF4qE6Jwh0bOjrPI4ZIQSi8Cqre0fUjuuTEPnBHKO4QEP8qMS2eItS
         WVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712282830; x=1712887630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/iI+HEeZGcZXZUaURSyXdfTy75Q7ZBc/DYpYsXeQ0w=;
        b=Ix92NUSXSsofZ91S7NzJxUTcK2lXHnkbur01iGoXY+s3t1FVOQ2O2g0XluTj6HtbjK
         hNdpzynI81qquLnNITdXsQN2sOPA0a0qpdYXROWem3oL+M485KqYEWJaC6IYp/XgGcFl
         S+3nDLpWOy3NfIDKFiaIpA1huLcanPt/O3HfZQerOzS0NjSbgkkbYwwNEyuKTAXvz/b8
         hLsUOFB1D5gl02lWaoP8Lnz/0r7MFeLh+gjJQCAfary6+Ft531qfzjtkVMas1DsYWvTI
         eSEBrOV6nF9bBouetsINtwmjphuVcTKYcaI5CsuMi1ymGvIw8G/nU2f946af307gEC0n
         efaw==
X-Gm-Message-State: AOJu0YyLnHXpXnv4aok88JVmljfHm/aC4Sz8ApFBTXgH0Zic7lpSfGUR
	ER+Bm241PtrCWCYDYBdkmYbLnK8INenDT8k8hEGOUPWkRcs/25MT8W7/HG9G
X-Google-Smtp-Source: AGHT+IH6BND3ce1uUBv9nrjbUGPfB2QtfHyuPFz+Td9Fc++fDc8pfM6jdGbEKmL125Rmb4XEOSCSCA==
X-Received: by 2002:a17:90b:3c10:b0:29f:f1f0:88c2 with SMTP id pb16-20020a17090b3c1000b0029ff1f088c2mr151947pjb.4.1712282829745;
        Thu, 04 Apr 2024 19:07:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5077])
        by smtp.gmail.com with ESMTPSA id v12-20020a17090a898c00b0029df9355e79sm367672pjn.13.2024.04.04.19.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 19:07:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-whoosh: Fix an intermittent ptest
Date: Thu,  4 Apr 2024 19:07:07 -0700
Message-ID: <20240405020707.424596-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 02:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109810

It fails sometimes when system is under stress

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nstic-test_minimize_dfa-test-as-XFAI.patch | 29 +++++++++++++++++++
 .../python/python3-whoosh_2.7.4.bb            |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch

diff --git a/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch b/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
new file mode 100644
index 0000000000..91fea24524
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
@@ -0,0 +1,29 @@
+From ede95a4f4487b4fc3cad8452ae388376966fca0e Mon Sep 17 00:00:00 2001
+From: Chris Lamb <lamby@debian.org>
+Date: Fri, 5 Apr 2019 15:48:23 +0200
+Subject: [PATCH] Mark non-determinstic test_minimize_dfa test as XFAIL
+
+Sourced from Debian [1]
+[1] https://sources.debian.org/src/python-whoosh/2.7.4%2Bgit6-g9134ad92-8/debian/patches/0003-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch/
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_automata.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/test_automata.py b/tests/test_automata.py
+index daab96c..7031dc3 100644
+--- a/tests/test_automata.py
++++ b/tests/test_automata.py
+@@ -327,6 +327,7 @@ def test_regular():
+     assert not ex.accept("bc")
+ 
+ 
++@pytest.mark.xfail(strict=False)
+ def test_minimize_dfa():
+     # Example from www.cs.odu.edu/~toida/nerzic/390teched/regular/fa/min-fa.html
+ 
+-- 
+2.44.0
+
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index 38d3e1cecd..406de2e525 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -7,6 +7,8 @@ Whoosh works can be extended or replaced to meet your needs exactly."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
 
+SRC_URI += "file://0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch"
+
 SRC_URI[md5sum] = "893433e9c0525ac043df33e6e04caab2"
 SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b45375dda69"
 
-- 
2.44.0


