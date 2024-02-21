Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A2AC54788
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 23:25:43 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.1091.1708557940516882572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 15:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e125818649so581802a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 15:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708557939; x=1709162739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etKhCGeTz/S68iIoweJrfdeM42lHZ2/NqESNh/sAX1k=;
        b=xIejCIsaQjcZMhhTwRC/rxwNVRVU9P9mJbvJyMgOUxWEuDbKPeKPh/1H+HgecUQi/D
         rGSF+xomkKn/lJD58Kn/cNR7Ak2pWPj0PmLQbY+LmW2MdsZEE+0QAsdj9xZ2oRydeiO6
         YMQclQVD3HgQq+zufv8zUJlzFQycdMGS0EHLlkkQmVlUOaZM0A6kUWXmbAx74CokHiYI
         jVl2/bkH1h/vRRjbR5UqE7UeBqIVyXXyvEH7sRTIUL+T4Xb02AtZBlutHYJPQyZ09U6t
         T1DBwEF37VuIQ19L3fY0X69TuVoI6q76C73UKIT+eQ7R2145PfId6bNWJ70ZYKIytuF3
         BQEA==
X-Gm-Message-State: AOJu0YyoOPG6kMObox6vr+Xax5gx3WlAoqdV6b3p6mFKAtYQCtRO5znC
	3BexEC1clfdIgqgcBsb1G3GT0AScjvK6jlgftxDBlq+vmCaMEbl72a/y4RY2R0E=
X-Google-Smtp-Source: AGHT+IEb1DcM3yMnR3q4kDCvCSeMPEf/3lH44UzarscAtB4ve+/jUf/n9Sk7r4AmIqRIxchaiNfdsQ==
X-Received: by 2002:a05:6870:d8d:b0:21e:53c3:331e with SMTP id mj13-20020a0568700d8d00b0021e53c3331emr21650194oab.4.1708557939332;
        Wed, 21 Feb 2024 15:25:39 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id oh25-20020a0568702c9900b0021e7c192093sm2600909oab.27.2024.02.21.15.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 15:25:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2 3/3] python3-parse: re-add functional ptests
Date: Wed, 21 Feb 2024 23:25:21 +0000
Message-Id: <20240221232521.2196633-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221232521.2196633-1-derek@asterius.io>
References: <20240221232521.2196633-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 23:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108975

Verified tests pass with via the test image execution
(bitbake meta-python-image-ptest-python3-parse -c testimage

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 meta-python/recipes-devtools/python/python3-parse/run-ptest | 3 ++-
 meta-python/recipes-devtools/python/python3-parse_1.20.1.bb | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index b3ceb457d..c899166a7 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -29,6 +29,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-jsmin \
     python3-msgpack \
     python3-multidict \
+    python3-parse \
     python3-parse-type \
     python3-platformdirs \
     python3-polyline \
@@ -77,7 +78,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-gpiod \
     python3-jsmin \
     python3-ordered-set \
-    python3-parse \
     python3-pillow \
     python3-pint \
     python3-pyzmq \
diff --git a/meta-python/recipes-devtools/python/python3-parse/run-ptest b/meta-python/recipes-devtools/python/python3-parse/run-ptest
index 40c284799..8d2017d39 100644
--- a/meta-python/recipes-devtools/python/python3-parse/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-parse/run-ptest
@@ -1,2 +1,3 @@
 #!/bin/sh
-pytest
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb b/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
index 610a966d4..d2b91b3f3 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
@@ -19,6 +19,7 @@ RDEPENDS:${PN} += "\
 
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


