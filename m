Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B252C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 19:07:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.21848.1708628822320484710
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 11:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kO9P8xq1;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dbb47852cdso19838715ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 11:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708628821; x=1709233621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/UKhjaYuTEM5fn8qYHqKu7wGg5PMC44d16h05zJqOw=;
        b=kO9P8xq1M84uCnRtOPyddtATapJkkGT/Cg+K/CYILMz9ijzV24cfNwOXe91wOtjI6V
         OYwueMUCFBuv6NF9wjNmUggv0SKMGZOK2tqT7zgrJN82VEmXaj+j1SZv2A7LPKp9yxtZ
         S9yqJEeEQ0JplXD5a7IA4ebswHUi9BrWz2pHIh8BWN3dreuSY5hTuvEaJ6ZO8ksmMuA/
         fC3acBZLPMzPXA5wWe5f1HUBbEpXukHnJWap56R50a7P61NbGJM44WDXVxSzxDKmcVs8
         1irDSjyA+69mkPTSAEEgT52aNLE1HnY5uoJkSBulKAXcSRmaePissbNpyctr7I0/9Y9a
         vMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708628821; x=1709233621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/UKhjaYuTEM5fn8qYHqKu7wGg5PMC44d16h05zJqOw=;
        b=Jm1MC8om6jzfEkgw3+xZy8VnEP8TjG/rCmV833eqSPrVyZbiMgKjp+UJBmD3AII+6q
         cEy1eyvgHzWfCafEYNTZAs5hADTrWAiJc+yQnioRgS2rHZ1XU0RmQjE+ksbmUYwfu7D+
         XKGzMxSDpLeEZDPHjA0ZrS5lfmkp9dHhDXqZH7MsqnN/6CHSHom4C87C/M2TS7akjZpj
         Rv0FB1ypjjwZm57dimr3aTv4SEiIRmXZ3pvTNUu9H46pjXxCtjUm/ud6OYy2sTssXUnj
         VYy3QNxCg5Fb3ETCPXJtqvTolqMUPPwIlK9O2q014tvRShycJDXRnPPTpXCitgnsniWo
         tegA==
X-Gm-Message-State: AOJu0YwfY5lpPMpTubowyYHyG9Kdehut2i6WdN6OryP/3oT6YRP+AHuG
	0RurJFjny8EMj9YaK79WWif2wy33peaX+mWkR/9EasWuX3EsAN+GIn6auTgceew=
X-Google-Smtp-Source: AGHT+IHKZ5rqtzBNgJ4Lm/j2JoK4uhaZreSMrYqvjnDYgLx541euUygkTF4DHkFmBY8c3yt6qIBZxw==
X-Received: by 2002:a17:902:ce83:b0:1db:f392:e993 with SMTP id f3-20020a170902ce8300b001dbf392e993mr15378679plg.52.1708628821439;
        Thu, 22 Feb 2024 11:07:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7619])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090282c400b001da2924e576sm10186379plz.204.2024.02.22.11.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 11:07:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-ordered-set: Use automake formatter for ptest output
Date: Thu, 22 Feb 2024 11:06:58 -0800
Message-ID: <20240222190658.2483441-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 19:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108993

Move the test to PTESTS_FAST_META_PYTHON

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc     | 2 +-
 .../recipes-devtools/python/python3-ordered-set/run-ptest       | 2 +-
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb        | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 790d5b019d..6903157cec 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -29,6 +29,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-jsmin \
     python3-msgpack \
     python3-multidict \
+    python3-ordered-set \
     python3-parse \
     python3-parse-type \
     python3-platformdirs \
@@ -76,7 +77,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-dnspython \
     python3-fastjsonschema \
     python3-gpiod \
-    python3-ordered-set \
     python3-pillow \
     python3-pint \
     python3-pyzmq \
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest b/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
index c27a6c3c57..64799ba008 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ordered-set/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest test_ordered_set.py
+pytest --automake test_ordered_set.py
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index a391036a73..64637b858d 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.43.2


