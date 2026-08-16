Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CCEC5DF70
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:13 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19637.1786922649471341410
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MLQPpMI/;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso25364485ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922649; x=1787527449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqyJat7mMUpbjy7O01kRQgk72vvBq6xLwfRlQPVKgTc=;
        b=MLQPpMI/X7Wuinxvxu9c2znPJbPs02ULsCD89EU35cw+E+n/sxKRpyd3S/rmpRtSKK
         gJmx62UjfKICuhMT8m2qWL4E0jlLqJmUTol9QhcK9lpGy/1h3f4rRo1l5uf60B1hvpZL
         OYJV+B/a5zjpZu9oPJMd3qStAUnOfet71IPudXrgD9HfrR5F9Pwp9TsnpzH0zT3mMt/z
         nSqHIc++nbyMu4CH9YUg22IbsEDLEcaISf9jx9idr9SzOruhG/kG4Xf+E8293r0YJP8C
         84jYqFr1AO/MBpmuqFtJ9o1oGnma2EGpr7APE1arKIN0jvvz+V/JpRlNdxB3tsSgk19A
         nzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922649; x=1787527449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqyJat7mMUpbjy7O01kRQgk72vvBq6xLwfRlQPVKgTc=;
        b=pc0Xb9j6P5h6tu63xIcobk2G/ODyZOHCBa7W2joD3HzTb2Lb1HjzIMmFazcl8HZoVX
         kBaTGr4zqjUvGGX+9Q/HcjFPpTyso37pySYkGZ8djvQnLQDCObEV5+Cdtb70tEJm3anM
         Typwvjst9fNwt/m07nlKZTj8X11KL7j61fidSQtGZMel4xeUn+Zmw45fLVtDhKykMQiU
         r99wJTMyDL8/ZnFv8YP7Kvx3m8tAm3vA2G6aqHf3iK0L3LwymqlvmzPyvNvfn1rl8rJJ
         LNTLroK6J76WSH7T2DwCMXL1ImPw08XC2HuHolSWhwJIhPFgHR8XZWBvDQpHcH3USdlp
         Rxwg==
X-Gm-Message-State: AOJu0Yye536iyEuHDeLHKdqoZZKAk4FGtZym6ZXXATICG8Sp3xh+pcSy
	hgGLnItfkX0orOjiXWy+rGglQQ2NFae5nDc3XtMKtuFW1n0I7tt8EAM8fyvUAlZD
X-Gm-Gg: AR+sD13897e24124cM/ZRU1bXQuGX0m156ZKTMJm52wbX4fr3Ize/3iT0JbGLeMi57d
	hE7BEj3wOSExzQeD4E9Hsz3/fB++dsEiFwJR3hcuTggDKwr46KDpSu3QPC5IZ3ASI9tQ/71fFXA
	pvEkhmbEFgSNiE4kUfsoJZxXZvVuzCYHJso5/ZVaUM2rYZ+MmKnKmfP77mFEWAtQIpBReSAQcm2
	VhaqwD98Sr+OGspBjaFKiDWdS2D4uOY/Gf0WY+e4FbSHvslK3f9l1bTUEiS3Vj+z6VKDK4jFJ2t
	tXjNhIqh/Bt+1yMx6PsWynVYmD3iibHdmuqgtUfdzz3rN54hYkEK5bnBH4hX3udI1q372QDGGyt
	ZfYd7GTskvr35t8R7JKfSN7tAOOMpwoAaDW7SNDuloac3Fbcz4Kw6XVci9x762k1PYySGKHzG7C
	sKTzP2XrK5OLSPEvECNmfbUPQwDWTFoKCKouX85tVznbj2t6ta/f/dudOL60j871aZd72Ca2ppT
	hqb91pXakDQJgQaEeetyx2ksczFY0Mn8Ug5EH0OCs1BDP3sZMrZolWPQbKOFyyTEhi9DyRLx8/m
	49Iiuep462ZndW9pmF5rKIRUCrJJ7ItqjEG7D/Uph3IG3uLV8d19aIvqHeZkYHPPyNHf7r8/4gp
	i6op4xo38r+0wVgczM+/MYcIkwqqeCUmCrSAqdJOY7ycq6A==
X-Received: by 2002:a17:902:cf09:b0:2ca:d151:383a with SMTP id d9443c01a7336-2d3b0cde910mr252388225ad.20.1786922648728;
        Sun, 16 Aug 2026 16:24:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 05/12] python3-glances: fix ptest args being consumed by GlancesMain's argv slicing
Date: Sun, 16 Aug 2026 16:23:51 -0700
Message-ID: <20260816232358.1947922-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129182

From: Khem Raj <raj.khem@gmail.com>

tests/test_core.py does GlancesMain(args_begin_at=2) at module import
time, slicing the real process sys.argv. Passing --automake on the
pytest command line (rather than via PYTEST_ADDOPTS) shifted that
slice and broke it; set it via PYTEST_ADDOPTS instead.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-glances/run-ptest        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-glances/run-ptest b/meta-python/recipes-devtools/python/python3-glances/run-ptest
index f56ca03dca..5903768942 100644
--- a/meta-python/recipes-devtools/python/python3-glances/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-glances/run-ptest
@@ -1,3 +1,6 @@
 #!/bin/sh
 
-pytest tests/test_core.py
+# test_core.py does `GlancesMain(args_begin_at=2)` at module import time,
+# slicing the real process sys.argv; passing --automake on the command line
+# (rather than via PYTEST_ADDOPTS) shifts that slice and breaks it.
+PYTEST_ADDOPTS="--automake" pytest tests/test_core.py

