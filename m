Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2264DC55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 15:52:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25420.1785685932632113766
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 08:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J6lhV7Yu;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: iwanicki92@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso4595685e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785685931; x=1786290731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g0A/5XrF2IuRby+eCHVLDolhB6j3qgsHFd36PUvrNHA=;
        b=J6lhV7YuG6wwI/HJxROiBHAXN0ZJKHiOuBmYm9JO7nXXPuTR2yot063XgD9H4YwyCj
         dEingB0FGoOMK4tIaNraeTUKVpoN72530oUEKVvec2sCnQJijQdzteG488ZlfX6JpKIC
         uJHOZTITqvf1R7RoTbd8Kl5JXyahcA1uL85vpNwUhNzhLrSgTbgNYWPZyDnSydQU0th9
         2Q9ppr6GXPRs52M8e6u8n1cQIGyASgIKaaomqmfTgKsRovXy3+m9Hio98rbzak8/GmhN
         wdncF5iQM0j9Tiz8Wrzv81Y3XlgnaWV20NI/JIRd3z7Sc+TnrprOohHmCsnbXvwqBBvg
         mQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685931; x=1786290731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g0A/5XrF2IuRby+eCHVLDolhB6j3qgsHFd36PUvrNHA=;
        b=CCmgetLAI4Vwt7o8kChPBJhHFmoC4TyrEKKMXcw31/3NBAuPWHqhqLzjvEoPZaxoKL
         uH66cH5tdcvI5SCMc7LNTl7WCE0ZVV4cSWsv6uhphPuNIP6fpKVQ1gGPobK9gbvo6s3S
         MzfSl3wdIeVNMwztQ1+B7bMF3ugFhvzpUY8Rxk2Suu64tkBpNoKQQCSymfOP68tBNMV+
         GNlLB7kmjqDbQMlsn0l0oUY7EwoAYbVQvmplyiKGLyAp0wD6FiTgP9iovyjQiYtTRI7k
         hwgu3YNCmGHgHwR8/X/H3/GOTT0aqIpfNlH8xgatvZT2LI2kSheFCbvJVzR/77xX+Sqc
         DY7g==
X-Gm-Message-State: AOJu0Yxvv0/rIgnLBPR1jvXR1hSqeFk4P6QsxS77Vlba8EHMp+hNxj1g
	RirKUhyuTJOIJMSOrtSSVoJQkLm8bgCqpBL6yTM0O+snkuZXaDTiqC19qghL7AgP
X-Gm-Gg: AR+sD10RlwHmqcsx5T7nJdBQL/M+Sv5Rmd8FYm/F8spY9VKHtZZOstlLwTIF0FwfCLX
	T0ARoX2+MjNFCQNcXYc13HjecROMEXmfvUB50+36BBczqwcaMvc6gd6i/QnURb4IlmNVKCRLvXI
	AeuXyHmw+lfscf5iZc/4lnFacEDK8xSlbS8PD3XLGSMq0PWGfctanuSLIMTJDZjyQljfvgWdKz3
	iNqB518L3nIelMlFYrGQrY9QH8CZRK3GgxueEzne8rekRKRhfyBJLVa1JsiGwEayISziwHb/TDs
	kAZZp+vLu0U/RkOgCYhdoBnA3nDBpZOEfcOpIRJULZqwqfwhY1hcZN6KXhZVuh8u8CzZZSKPHNL
	TUzA1QtUxh7yoS/SKp3hMZdIzrBBF+xN98QKvlsLKY6xRg0VWqX26v7a9nbSSUicRFJRFCDMexI
	wQ1A5DgyE8BLN/DT+ybZ2pY9GiKmld10rvXDnZrfZU7BqVNyINBcLZiquX5mk4DtkOqcAuxwuUn
	uL8F/BSNygX4yqUz3NBYCrqOTHT0HY=
X-Received: by 2002:a05:600c:a42:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4980eba0a6fmr133751495e9.8.1785685930845;
        Sun, 02 Aug 2026 08:52:10 -0700 (PDT)
Received: from iwans-fedora.play.pl (89-73-147-156.dynamic.play.pl. [89.73.147.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm143350235e9.4.2026.08.02.08.52.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 08:52:10 -0700 (PDT)
From: iwanicki92 <iwanicki92@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-rich: add missing runtime dependencies
Date: Sun,  2 Aug 2026 17:51:38 +0200
Message-ID: <20260802155139.4128822-2-iwanicki92@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802155139.4128822-1-iwanicki92@gmail.com>
References: <20260802155139.4128822-1-iwanicki92@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 15:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128668

`python3-markdown-it-py` was missing along with some python3 modules.
I went through the code and added everything imported that I noticed,
except modules imported on Windows.

Signed-off-by: iwanicki92 <iwanicki92@gmail.com>
---
 .../python-rich/python3-rich_15.0.0.bb        | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_15.0.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_15.0.0.bb
index 2ab3b2fdbc24..e15e84253548 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_15.0.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_15.0.0.bb
@@ -12,10 +12,21 @@ SRC_URI[sha256sum] = "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b
 
 inherit pypi python_poetry_core
 
-RDEPENDS:${PN} = "python3-html \
-                  python3-image \
-                  python3-pygments \
-                  python3-unixadmin \
-                  "
+RDEPENDS:${PN} = " \
+    python3-datetime \
+    python3-html \
+    python3-image \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-markdown-it-py \
+    python3-math \
+    python3-mmap \
+    python3-numbers \
+    python3-pickle \
+    python3-pygments \
+    python3-threading \
+    python3-unixadmin \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


