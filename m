Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A10E7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 22:32:02 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.4063.1736548314071384546
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 14:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844e161a957so187737339f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736548312; x=1737153112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zMQG/hfLYVlR5H81YRXkyWyU//TA8wKzlBxPDbw+6I=;
        b=QwH7RomV8D0YfSrIz44MHBP9oZ06ReO/KyYz42V/Rq/c4Mpm50KaqkC7zywn81kL4D
         YWTVYgxXRJQizFs3s9nIKJnm6D3BRloBb6ZIqYHQR2JIJdN1uRoam1323rjucJRd80lK
         aSwpaGxjFJ669VSbmbPoI1DMYPJlyzIU4Vo8EjwRPGY8I1rI9XMHlEy25kTrxogj+DFA
         GNSJUN6VA1UAjlkMjMQR3HGsedZz1W+6fKoV+JFzomC9pdcUWBhc/BUhlCmchrBVwMVD
         6q+ealRjwUIeEJ4UpgchzqGcOm81+3imlBFCql66sBG5XhaBRtKZ2baE4s1hYn3/3XzC
         WLUw==
X-Gm-Message-State: AOJu0YxIQq8Ui1joEQmnVS5mNk0YtCSfh0cr+8RxlWQS+C7Lgtx2tvGC
	r0lNJGjnXAeibJ8gOze9doo/GIjwTEoiRlVfQ+sQZFxa71ZIh3SgKcUgZg==
X-Gm-Gg: ASbGncsPWiu3LyBaRVYAbqz1RpZkyOvxTD0P1Sbs7CqKBwt3VL5o2KDR8eQXsr5k0GM
	IeXzCW/euccPBf+Igb+8uTo052cfkzKS7+9h5gK2e5gz2bAcsKKtnRoBnSIPDY8SBcOyk7ht+Dh
	AiaAZgmj+29Z9IZ3IHAGWkVt7E9EdKeZcyyAvxMr4xDWeEKP51pZ1dBbtyWxVoKCLeXa3ioVyLF
	C/TNU6dWqgf0uZ1wOQqmusfRbjQrBpZgHlgtNrkRtDt4snndzs+j4QhQmlhskiYYRDhaiRGQDDN
	LbnJQhU5/M4sivGoWptTxVijEg==
X-Google-Smtp-Source: AGHT+IFVGecUlMR/3vEhxdr5v8bUcqvRgI8cAD1Lo8V10+qbdTiEYlv8xbUOEsvgXZmqq+G+1j47tw==
X-Received: by 2002:a05:6602:721b:b0:843:ec18:82e2 with SMTP id ca18e2360f4ac-84ce00ef7e8mr1174464239f.8.1736548312412;
        Fri, 10 Jan 2025 14:31:52 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b614781sm1120035173.44.2025.01.10.14.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 14:31:51 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/5] python3-simpleeval: update recipe to use the ptest-python-pytest class
Date: Fri, 10 Jan 2025 22:31:31 +0000
Message-Id: <20250110223134.4177993-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110223134.4177993-1-derek@asterius.io>
References: <20250110223134.4177993-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 22:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114811

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-simpleeval/run-ptest               |  3 ---
 .../python/python3-simpleeval_1.0.3.bb                | 11 ++---------
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-simpleeval/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest b/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest
deleted file mode 100644
index 8d2017d39..000000000
--- a/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
index 4537645c7..b4dc82bfb 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
@@ -5,21 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=83843c8f0f3beb18af2f282faecbdebe"
 
 SRC_URI[sha256sum] = "67bbf246040ac3b57c29cf048657b9cf31d4e7b9d6659684daa08ca8f1e45829"
 
-inherit pypi python_setuptools_build_meta python_hatchling ptest
+inherit pypi python_setuptools_build_meta python_hatchling ptest-python-pytest
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += "file://run-ptest"
-
 RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
+do_install_ptest:append() {
 	cp -f ${S}/test_simpleeval.py ${D}${PTEST_PATH}/
 }
-- 
2.34.1


