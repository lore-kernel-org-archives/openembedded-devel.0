Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511B4C54766
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:33 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.591.1708128986085037768
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T3YTnei3;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59a8b9b327aso883182eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128985; x=1708733785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tc9GgzIKlunv9emsz+SUhyILUQE4IaruPfDVuoJQhaY=;
        b=T3YTnei3gxCvnT8lQmCFaTYq8A1bBgNewbM7d2VbvoezmUvxMkiLxMi8W5U4gnzvUX
         HofOxqplHZTQxxDpi1I0YES7MMzgc2f6RyGz7FcJKCJghCeOpB6jQxrqbgBpDdtpwyGa
         QUSU1p+VPAI6reCV25hGWdn5+8YmLR/lt02TRwQmU81iIXn+Bta/YGsTGZOAq23+R3kp
         IbHMCbWGasglpH0eHk/veCl59G26mh3UTs3vAa/IYN24vbG3KPrOC4BUfOlN3N8/+u6j
         kA+wY65jQ4lA1bEZk0DLgPux27WKCVpySzhufTC9sF55NvDHn51fFpAWP1SVGqszsYeJ
         ueaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128985; x=1708733785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tc9GgzIKlunv9emsz+SUhyILUQE4IaruPfDVuoJQhaY=;
        b=ZkazKphWcSgxYwCn22OrjuCzIeEPH1X2qPHXDHCHct1YZcqDnb0a2kPDrfxhZGJw5j
         x/DG7YqLrjZ5a3aBIXmARE96LgyVYXO6i6uMO/fdDSVe2z/dNl+eZkvMA2C95UfgTMX/
         5ivfH2IxjH1bYGm5WOuzDKQ4haf5M/x5WNTHnFitOwx9cySvSPF5N2Tw0z8Y6cfi+qEw
         yKgtjxVdrZ3ZhTBf0MzVmcHTMMK7myu96Pp6CD3BQhzpewppC2e+vrLp6D04lokgenk1
         MEQ/He1Ow1v8OvYjb3SoVrGc4OYuwP8jdXxbnCCQ3u6A6iLuHV32hgqilqG+8uR7LLlS
         N4Pg==
X-Gm-Message-State: AOJu0Ywk4XniTuLcSzDncE+HoOJS4JY5FUDmZ3YBJQPhmu99YZBIt9Rh
	naMJ/M+VO9MWV2MOi+EA8u04so1uJVdVIVFlqh0jsszHCq5IyelpybQ9Kp4l
X-Google-Smtp-Source: AGHT+IHfsYiPeq8qsutnaNpYKWqDPu5PV0JEvYwjM5EcWA+JkGC9VUFTRsagSqk70qziIsrnkGCiEg==
X-Received: by 2002:a05:6359:411f:b0:178:de46:783c with SMTP id kh31-20020a056359411f00b00178de46783cmr8051099rwc.16.1708128985223;
        Fri, 16 Feb 2024 16:16:25 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 16/60] python3-html2text: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:07 -0800
Message-Id: <b2365470cc1ffc53b5e08efc76159504d618266f.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108786

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-html2text/run-ptest        | 2 +-
 .../recipes-devtools/python/python3-html2text_2020.1.16.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-html2text/run-ptest b/meta-python/recipes-devtools/python/python3-html2text/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-html2text/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-html2text/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
index 5b6d040368..d96f61bdc7 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
@@ -14,7 +14,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 RDEPENDS:${PN} += "python3-cgitb"
-- 
2.34.1


