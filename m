Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88138C44503
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:46:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146583.1783331195324583095
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EmrejWMm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ba701891so22158695e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783331193; x=1783935993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkI4YUrpu4AA+cE9X3l2sma1esUKklpPaen0aOnZUYs=;
        b=EmrejWMmmYFfjlzdtitEG9NnPmpwX66nctda1PzG9HW/9Xc+8Kt/PPNPNJKA749VUP
         WziSjundK0GcfW8HBZlfE9ICS4N06uxTQyetdGMhDm1FJMilyw7V6aNRmr+gOJaxioKh
         pJ9Xh8B0g9NCCu9XjEfbk+j3Vc7YJs5ZiUJro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331193; x=1783935993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkI4YUrpu4AA+cE9X3l2sma1esUKklpPaen0aOnZUYs=;
        b=RDEp7jtsQr7AEVsTpdQHneJQVUjrUFd13xJ66ZZ6H5Xi6b/MgI2M96BdiCRgmJZi23
         GtG0HK6KoLET/67sEw9u5pebYjwSdSTY5k0hlTZ4/UUAlilkEKd5hp+gkHtqEA2HfDmL
         u0D98ypDfAne0vOkoI0mEgvXkZ13VNh/7o6vCCmkW3hxzVS8+4Jr+6GMUpBK2z52N1TI
         NTMLgdFZUN8exaAbzv/7jyWv+D/YEXq80Gnu3pxppPu3IXzj9fR+cuxHujfc0I17y9hc
         CNA5/wTtwMjENsastIwj756Zzs8zc+TDavoaKxfZceJ8V1Ra3/J6y2FmfLqVX6EdoquB
         4Khw==
X-Gm-Message-State: AOJu0YyN/QYi04AgMC+49B56QYtHgdXMOrWAoaq6xwrE88G1Xymb5xY/
	TZYcjpkLL86bIjt/ydvUx6UZdv5qJ6ReKu8I0lrPXPHvwpGNzsAQSWU0IpUBhrZZ79/RnLioI5e
	Br8XW
X-Gm-Gg: AfdE7cmoe3ebRSbJXhaMlmVT/wUknSa6rA8QqWSEyZTVKvrAhuJ1n4QmTq/pqEIzo1X
	TMWfBkzDrDXc1zvJrjQ2ytH4Muk8JVbPrn+F3Ebima34y7eaj/BvHMqSvuIgIVrsn5CBGMlhXf6
	S5u2K1g0oiQ32lsRyerzcJjf1hlU5CehgJI1WNREQNx6UKUzZpisoHLYajRyhdWi6vNioqGcZVA
	PwSiexejKbGgJLnXRdNTlYFTXiXaFpZUlGc5dniy6Q8Z5/wdWkJ8SXSqvGNcJlJpq8gvKcKg2ub
	4w/PaJnbUgssLOROcL41id8e/M4SFN6TWH9NeCQet26Y1GHmldOeHsKA4xexqjVW3qbnHsSVxMP
	VOBSBPrTasJh4pjkIsioZ/lR3Niy7rUzVeYR/8iW8TM18jqIwJn9Bg3l7x2GAZQNU2Hfzcaxm1T
	niZ+/DwySHmx9PracEFbS0WRkXiNyNUISLRjPXg672/I/fKdk4zSUMJGlYmbs1tBkOFT2W
X-Received: by 2002:a05:600c:154c:b0:493:b55f:bca4 with SMTP id 5b1f17b1804b1-493d11fab2bmr120478485e9.29.1783331193601;
        Mon, 06 Jul 2026 02:46:33 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm22638978f8f.14.2026.07.06.02.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:46:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-genson: Enable tests
Date: Mon,  6 Jul 2026 12:46:27 +0300
Message-ID: <20260706094627.1254799-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706094627.1254799-1-leon.anavi@konsulko.com>
References: <20260706094627.1254799-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128041

Inherit ptest and include tests for genson. The PyPI package
omits files for testing so use the GitHub source instead.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-genson/run-ptest           |  3 +++
 .../python/python3-genson_1.4.0.bb            | 24 +++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-genson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-genson/run-ptest b/meta-python/recipes-devtools/python/python3-genson/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-genson/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb b/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
index fca391c9a7..51b9c90f31 100644
--- a/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-genson_1.4.0.bb
@@ -2,8 +2,28 @@ DESCRIPTION = "GenSON is a powerful, user-friendly JSON Schema generator built i
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6c30d55dbfb3a28d420d918534adf6b"
 
-SRC_URI[sha256sum] = "bc7f1c1bae87a21ca44d81149aec95a3f4468d676de9b8b08caa064f3c50b3da"
+# The PyPI package omits files for testing
+# so use the GitHub source instead.
+SRCREV = "f305b73f08998891d2f7804b84c8e3c29ca96209"
+SRC_URI = " \
+    git://github.com/wolverdude/GenSON;branch=master;protocol=https \
+    file://run-ptest \
+"
 
-inherit pypi python_setuptools_build_meta
+inherit python_setuptools_build_meta ptest
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-coverage \
+    python3-jsonschema \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/tests/
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


