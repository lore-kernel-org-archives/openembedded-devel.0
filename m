Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD28C48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:43 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.602.1708129002601448488
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mh53KULV;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e0a37751cbso2383105b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129002; x=1708733802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rq4EU/vUmkAAmoXvJyIpe+G84iaaMd1mXWoN62CyFVo=;
        b=mh53KULVPXfWDFt9XHJ1qqgG5kpmx6Se/ieClPfrR3XrLtak7Txf+0nKhIiT3/ZqIL
         HkRcBgIm9WXTRiep1eFcPr85hbwMVoJMlpdCoF3oNAH0JCvXQib25BSWYRftHgV5klcn
         zxpLLU74rECa0XKKVmmMEpiBhm4yD2W4U6VZS++jeSCac8IRXfykY8HyaPcH6nOM3ZLG
         Zs1UQ7rqSKDlr3T0yf45QI4yj7Wyo3vVWDEijX50C3BV1gfPxqSM9wXeBA6cWEvFbMfE
         HeMvgGe+utW20Isy1y9kHKbum0m+SGzIR7ghDjxVh97F1nZdUajQWvHYrcizU00Qm+/g
         w1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129002; x=1708733802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rq4EU/vUmkAAmoXvJyIpe+G84iaaMd1mXWoN62CyFVo=;
        b=kdPJ2oBC5+aRO6ny2IphW7bkYwQRCuhCRQKgPQREZ9JhbMYz+cCBTvPOs/Q4Py9b27
         y18rntHWUY746ZUgA2jKCG4VQ3qGGYtouTP/uHOYZoNyD9bGKZMufxsHbOUr5UC4Ym0y
         ZHBjVmP4os1K8/M7xOe/6UdLujMN/EayCwHI7qIrzWXsGYi8vXJvpUUPH4LsrMnYcAHY
         qEuZzEZssy0MdGTbsfK9o7C0GH+2oYsFblKMtJtOZJsU2RLZY0UW4533Fu/XTRuH2Ggn
         Vnak5/GhRjyuFcSO5xkavuO1TMiLqgcStdloPagkSnVK3KHL9x7pH0WmiIMSmOvMBs8a
         Rx4Q==
X-Gm-Message-State: AOJu0YzE8b0N/HWeACfEYzvhb45VUwvlesHIAeHYBNwpFMP37VBYGbG1
	vweX/AxI28IuLU9Oy2AQndBTM5muK5szotNOQI+UKxc7WHJU8xihMGgfxRnf
X-Google-Smtp-Source: AGHT+IHZ2j9ivKR8d1MdoU4N7dCoI6uIIGp9tSXGIrxKsDk9lCuju6Ts2Rq14R+U4BQHLqF8O/R1BQ==
X-Received: by 2002:aa7:8204:0:b0:6dd:a086:1e0f with SMTP id k4-20020aa78204000000b006dda0861e0fmr6119281pfi.32.1708129001868;
        Fri, 16 Feb 2024 16:16:41 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:41 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 27/60] python3-pytest-mock: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:18 -0800
Message-Id: <6950d4911ce42ed639b09da6f6387378cb01e135.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108797

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pytest-mock/run-ptest      | 2 +-
 .../recipes-devtools/python/python3-pytest-mock_3.12.0.bb      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
index bad3df11ae..e9a9a4fbc5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
@@ -15,13 +15,14 @@ SRCREV = "69adc6f76c1a7baf4e7a728da9eec38741d5783e"
 
 inherit setuptools3 ptest
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
     python3-pytest \
     python3-pytest-asyncio \
     python3-unittest \
+    python3-unittest-automake-output \
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


