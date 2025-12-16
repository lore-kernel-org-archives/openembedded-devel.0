Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541A8D609D8
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 17:58:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.239.1765907923483176109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 09:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVbtIrag;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so29294305e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765907922; x=1766512722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=njs9RHw9BXmzEgeE08DveadWfMSEgx9Mr2ajkZavSfU=;
        b=UVbtIragsjftRgm9u7rl7x+e8Yqv6la5hJohjsA6tINvAO2rrIIqIohEADzR4mXfom
         qKlcLiuR19MKnLPtRHuxNISDxny2aMNCNB/py8kOV+HP1r+R14U4+PtlQ54HSS6GC5sW
         EWzhpWITl9bBF9goXYFKa4bd9wx9920O7B5ZkgqOmNzhfN9udZ6ieGTMIUkV95IK2m2M
         bqSRw22OFCw1F1HUSsSzTq2yag2M2PhUujkBMGScWcXJf6O70Hx8zFWlf90qGLBv1VfE
         qtWDXXUAHAkRGNzEE4IbWh5Jc9FH1udig+MuyQfFU+RljO+ADkq7SKZP+IuiaBP1ef98
         NchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907922; x=1766512722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njs9RHw9BXmzEgeE08DveadWfMSEgx9Mr2ajkZavSfU=;
        b=dScDA7i9LXX46/5IG2rWmzYrHr2V1d0f4MpcnYsOQvwhZu8U7q1ynWH4vkh8LO+PUJ
         cbYfxeZ8UdE2r8hFc2WYxICsVaUdmTIW6YOpZ6h5az0+yIWdhyhpokqPgef+MkfrEVuW
         POOxBfIjgAnNAQiJIiaIbhDsQqlkFjvQZJOvYVgWx26Xgj0SgZF5Rq0GtGN/Xn2zTEiW
         nJ9bChfaUSp4BEoamfQ+YGHNhDzgZN09xxv9qeH51gDiyRUCsl23FSFkfc6lypqwriam
         piB5XX+NgiV4oPxljYy9fAnYeZCScFTp+IDjXMoCtamgb/PGYR8MZRQSnMaBxWdeTzqH
         KmYw==
X-Gm-Message-State: AOJu0Yw9revOLd+TN/amTSu9TLH8zU859QPtbWgkzTyuHn4HnicenSwC
	PcqoLAtUpfsvrXWl7Ejbkxn2YoNDxwb/48/ww5om4dh/W9OqVofuBJz5dTyHOQ==
X-Gm-Gg: AY/fxX54GDJbiFuu3Wrg7nuxiiGsrL6L/b6AcAbOMmd796rE2P66pbkexIGSW6q0GSO
	3mMMF5CBCgKnLlChtZSGzb/yQxpRUYRcje8iHJb3Z85764WsMcjE1IhBbAR98XNjbLUVzk+lxPG
	u59/9+Zzhu2FMJYJso+2FyRinHqZvuNJMIEi6A4dM0IyAmvb0ERsPMRehumYZIGkePv9gco+ngW
	s7ruEQSIAwXVy4xWy0hhYUm35mf9x8u5yc8kjYnOGkb0oJkdFdXFTD0n3EPyhNxBHAx0bZU/Btk
	UteO4GvntlFDhWxVfTICMYK0P5VJI15ctyJIDcx5IsWXya3ypeQKf4i3uzeeAEol8rJxoz4PaV8
	YAsayVA8bNCF3qde1Es90GCjuDER+Bnq5zEt+cnVkpB9/Z9t5PIV3BlhR8Ro3t8NyjEkekgbWF/
	BFBkvuqgNX
X-Google-Smtp-Source: AGHT+IGKt86HNpdYPGK/6rTauqRR7X4nG0rDxc6MnyDNYhD2asZ/XGX0FP1uzZO8a02NrtZvOy2Fig==
X-Received: by 2002:a05:600c:190c:b0:479:33be:b23e with SMTP id 5b1f17b1804b1-47a8f907d4cmr177300145e9.17.1765907921602;
        Tue, 16 Dec 2025 09:58:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd992ad0csm13714525e9.9.2025.12.16.09.58.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:58:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/7] python3-h2: add ptest support
Date: Tue, 16 Dec 2025 18:58:34 +0100
Message-ID: <20251216175840.2939403-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122700

It takes around 10s to execute the suite.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-16T15:36
BEGIN: /usr/lib/python3-h2/ptest
PASS: tests/test_basic_logic.py:TestBasicClient.test_begin_connection
PASS: tests/test_basic_logic.py:TestBasicClient.test_sending_headers
PASS: tests/test_basic_logic.py:TestBasicClient.test_sending_data
[...many lines...]
PASS: tests/test_utility_functions.py:test_size_limit_dict_limit
PASS: tests/test_utility_functions.py:test_size_limit_dict_limit_init
PASS: tests/test_utility_functions.py:test_size_limit_dict_no_limit
============================================================================
Testsuite summary
DURATION: 10
END: /usr/lib/python3-h2/ptest
2025-12-16T15:36
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc    | 1 +
 meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index e17d5ef46d..4cbdec70a3 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -38,6 +38,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-gpiod \
     python3-gpt-image \
     python3-gunicorn \
+    python3-h2 \
     python3-html2text \
     python3-httptools \
     python3-inflection \
diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
index 11ee118831..db181dc0b4 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
 SRC_URI[sha256sum] = "6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1"
 
-inherit pypi python_setuptools_build_meta
+inherit ptest-python-pytest pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-hpack python3-hyperframe"
+RDEPENDS:${PN}-ptest += "python3-hypothesis"

