Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3A5C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:17 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.1125.1708379297003890774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bba0ac2e88so3571948b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379295; x=1708984095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZfo/xLmW0JC5V61MVDNoRCFGcVHQv9nHOO9zlIrZJ8=;
        b=CCXgobdB5A+0E+txDb0CYi3ssoA/fCYhBnmDDD1dF9z6y+jx2B3UXfXcIzy27iCxaf
         zkAQHQlCgABcp7SxBX5cF9sUWjJQsUpjUFgXsBqE5UwRYxqUg1wdR8QaZyWD3/HCSGQN
         zQnfCQcPaZi5oLq6cZsLCV4TiK8s6RCmei2SgSU0ppzr2Xxs/56G/ik17h6ecC5UEXsi
         9/guGB/lfMHlakITYVacoBmGxJJ9lGZ69ZQ2HAu1w2a+JK0EkN3KDiPe80066Vd2WZdu
         nRsOW7jctFfANlOlE4Gi4rj3bIBM6O5ElHfEWjYRhuLzsphk6MPiaTzQhHAkchdMCTvx
         AWRQ==
X-Gm-Message-State: AOJu0YzDKiItKajwo0mn8+NcV+d5QGR57y01JeQJzl/3fAfBWJiHkSq7
	ZCSwqIfJ5ZjJje1qk9uEou8PQjvy5i6qJc04lALIvNSN1Bka402Y7j3oJx2Opnw=
X-Google-Smtp-Source: AGHT+IGcu3S9a6nbI8BEx4ObmW+NVGbtYIhy62/Wzx0f+0oaf0qeKKy2Fh2w4Bg4oQdGVekfwYAf9g==
X-Received: by 2002:a05:6808:238a:b0:3c1:5d21:275 with SMTP id bp10-20020a056808238a00b003c15d210275mr1269435oib.14.1708379295401;
        Mon, 19 Feb 2024 13:48:15 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/8] python3-jsmin: re-add functional ptests
Date: Mon, 19 Feb 2024 21:47:56 +0000
Message-Id: <20240219214801.1514843-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219214801.1514843-1-derek@asterius.io>
References: <20240219214801.1514843-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108888

Supress warnings about syntax for the tests

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 meta-python/recipes-devtools/python/python3-jsmin/run-ptest | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 09fd7eb25..98ebdd07a 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-intervals \
     python3-ipy \
     python3-iso3166 \
+    python3-jsmin \
     python3-msgpack \
     python3-multidict \
     python3-parse-type \
@@ -74,7 +75,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-gunicorn \
     python3-inotify \
     python3-jdcal \
-    python3-jsmin \
     python3-license-expression \
     python3-ordered-set \
     python3-parse \
diff --git a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
index cbcfffda5..2f04130b9 100644
--- a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 test.py
+python3 -W ignore test.py
-- 
2.34.1


