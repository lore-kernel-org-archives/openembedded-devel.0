Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA0CC48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.606.1708129024748724107
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWrS9/y9;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso2425509b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129024; x=1708733824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMkPAALShpSGuY2Y/20h7ymEVLWpmBWUb2FpkNlvImU=;
        b=eWrS9/y9aqVU6YFDOTM7aa7VZ+Mm3uo6vWM4ha1x5MHCJOm2c+sAi8DmEgN4cE8O4X
         sTI10f1eHb8Vu5rOhvyJaIEFPRzcxNY+pZLW2o2tL0fNvmFVIeTy+zYYgwlZt5eM67IX
         esh/3j19lIPrKe7Cxz85zNNuKPg8IUgsSIYaGiIowJUifBORqTpqirL79B3qInZb8scb
         XnO0HT8oROqJHOmlV8YfYNNDKJ0iPSNkcQ7/vERmdPYD7U+TVIF6oYX77X6ERi791yVz
         N+ZDnrPUKP97uVO17oKX5jFDHQ8XI/pa8BW/kbUj1YOl/gQEp3hM2vHEo2x0/+L1F1WJ
         QkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129024; x=1708733824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMkPAALShpSGuY2Y/20h7ymEVLWpmBWUb2FpkNlvImU=;
        b=cy3xhMRMsGe3mwHfGquBzt1QDNBbo24MrfRQuRClG5Rt1lC2u8tPQNGEwndd99aNrL
         dcTHUf4oGGt04pKPGg5P49Ao5V5vYaf/c2USCfeU31VCFQ+FCG/BAGa//JPTnf53kTz6
         HPRaq9gfjJAGIR0pLGEJHWeeN4KOiXCd8fxMelGTzabmeIbJsMrxFNUnCObWZ3OKgdjT
         yQXpWYF5NmwADitX25JYtoJXke0rYGawd8p4GEyhAZD0wAT+Tr0yv9AvvwJSfUF/MZfc
         gpu3K5EAw3UN2gVcXWmofssOH1SplozYv4A+vhT85Hv0yTXHQ3WqrLMHACrTWFm+GKh0
         J6+A==
X-Gm-Message-State: AOJu0YyGGGW1cAq6aXISZbEsvgETusdlhBQEy7E1/eF+TWUgHFrEuRL2
	Ek5nR9q251NSlmfQCWgPT5y9TQyRzD7R17cQVwchTTXSCJxoBCZYnhTXfexO
X-Google-Smtp-Source: AGHT+IFWDE+onJstjK28IJh7tTfJAkB3EJC8Qr63uWQjouU8nA0+x8ZVG6pH7rgpvNQHuV+U6TAqyA==
X-Received: by 2002:a05:6a00:1d0a:b0:6e1:bcb:d4d8 with SMTP id a10-20020a056a001d0a00b006e10bcbd4d8mr7210348pfx.7.1708129023963;
        Fri, 16 Feb 2024 16:17:03 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:03 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 42/60] python3-parse-type: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:33 -0800
Message-Id: <7032a6b5cd52f7d895bd473cc34048cda621cfb1.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108812

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-parse-type/run-ptest     | 2 +-
 .../recipes-devtools/python/python3-parse-type_0.6.2.bb      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-parse-type/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index 99493db322..a7d8cd86ce 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -8,14 +8,15 @@ SRC_URI[sha256sum] = "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876aa48d75a
 PYPI_PACKAGE = "parse_type"
 inherit pypi ptest setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-parse"
+RDEPENDS:${PN} += "python3-parse"
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


