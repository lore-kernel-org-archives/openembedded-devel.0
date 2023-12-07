Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB61AC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:24:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.113090.1701991478384421756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XeSKmPyi;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ceb93fb381so777974b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991477; x=1702596277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHnPkPRXriCDZCeZ6Wj3sz6iuBttUS+ioa0gHxs/7F8=;
        b=XeSKmPyiDrHgPXLQWJskjEXgCH9yOeBUAOeKqx+DP2G0t0XNP95cX0GV39GQ1+4AUi
         n25wILRmSRYFzKoZyo1N/l0wAV/mraAYHCfXWpigQcIoSZqDPfSdnsCynmv8Zu168jaC
         KionutP3q4kyjrA0aLsSx8cpdeUU6q0etXbnUcRPpdqrqpIRHY4yaDiXslUA+3Oh1+I4
         0mpxo9HiSLLwPgvFA5DBycOAMeO1C6D8wkzvZvur10IAGRF0E5CeOwdTW91lIYz0l9aH
         +5jyCGgE5h2eq+V2nbT+HazTs8rzDobjGrmX3ri5rmfEonSi5zg5DaeOvBnt1V54DOvw
         pykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991477; x=1702596277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHnPkPRXriCDZCeZ6Wj3sz6iuBttUS+ioa0gHxs/7F8=;
        b=KRAll0juPY5q3isXpbb18XsD0Q3g+OAdv60s/SbgFp/ZgF6Ca6EnwXzSlsF1yAbhTt
         ZFBnb79tzGtpIHXSOhtyU4GyKc6qeJVWoIl1j8iT3Lp15eC/udDLJa+41Q1E1pWGRTBk
         qgC25vxNNn9zjHZmdaYgAd26mcFcVslxdNodUf1gt0gk4FH+PIc9aQgYMvnSlaRUzDeV
         0v9CvmW31bZ7/1g7ayC9ftFMkq67k8Rd6cxb4m2hlvuD/B/b2qV4JAZAGwUNz6iC6EHn
         4aTwvRcpCxSTPLCnJItIyZvxsNveijdA7nSWdyhnxLmEkErBPr7i9/hJ3Ltf/NiE6Yxu
         4yVA==
X-Gm-Message-State: AOJu0Yzs7zpBnuL+VRZ/rTpf96baqslRxNlHe0pEbq/5BZ6qf6D3aNr/
	Kfkuqit24v9iNZ6N0wbWJGMJMO32cSw=
X-Google-Smtp-Source: AGHT+IE2Ir7XrRPEn3K3WC21qxUWD4g6SViBM7FRmDvF1ecD9MSRG7wOD5yZsHMbUqJoYVgYIoHsCQ==
X-Received: by 2002:a05:6a00:cc9:b0:6ce:2731:47b4 with SMTP id b9-20020a056a000cc900b006ce273147b4mr3539pfv.20.1701991477251;
        Thu, 07 Dec 2023 15:24:37 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce742b6b1fsm324266pfb.63.2023.12.07.15.24.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:24:36 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/7] python3-pydantic: enable ptest
Date: Thu,  7 Dec 2023 15:23:57 -0800
Message-Id: <7d6f92c65d843ad7f4db15a43be065759fe8e7eb.1701991044.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701991044.git.ticotimo@gmail.com>
References: <cover.1701991044.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107299

* Add to ptest-packelists-meta-python.inc "FAST" under 30 s

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-pydantic/run-ptest         |  3 +++
 .../python/python3-pydantic_2.5.2.bb          | 22 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 13dcb621d..f6ae86a1f 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -27,6 +27,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-polyline \
     python3-precise-runner \
     python3-prettytable \
+    python3-pydantic \
     python3-pydantic-core \
     python3-pylint \
     python3-ptyprocess \
diff --git a/meta-python/recipes-devtools/python/python3-pydantic/run-ptest b/meta-python/recipes-devtools/python/python3-pydantic/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
index 226c58e87..8fc59aa93 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
@@ -29,3 +29,25 @@ RDEPENDS:${PN} += "\
     python3-pydantic-core \
     python3-typing-extensions \
 "
+
+inherit ptest
+SRC_URI += "file://run-ptest"
+RDEPENDS:${PN}-ptest += "\
+    python3-cloudpickle \
+    python3-dirty-equals \
+    python3-pytest \
+    python3-pytest-mock \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+    # Requires 'ruff' (python3-ruff) which we cannot build
+    # until we have Rust 1.71+ in oe-core
+    rm -f ${D}${PTEST_PATH}/tests/test_docs.py
+    # We are not trying to support mypy
+    rm -f ${D}${PTEST_PATH}/tests/test_mypy.py
+    # We are not trying to run benchmarks
+    rm -rf ${D}${PTEST_PATH}/tests/benchmarks
+}
+
-- 
2.34.1


