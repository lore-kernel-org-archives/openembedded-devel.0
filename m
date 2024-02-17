Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DC1C5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.610.1708129032154427260
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/nFbT4E;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e320ebf874so6188b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129031; x=1708733831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVpX0mIezUFl359M2ifxsclp6u21EzyqVujabdKcdhs=;
        b=l/nFbT4E+wFdTqNgVaXCh9vKqUh5vD/mESgFISzGyanGKJyUmBds1G1+pWN+D/2D/u
         13DIUo8pymQl5vI6X+zUYt7Om/Flfl8UbUkOd10T8LLml6aLsVTUl0dT7HKymNiZmKqI
         YZQjCVkAWl9IpGjBm04OaN77BpzN6JrVnc+WNOQ4c1VHO/oh5T524Y9WDQSlxzKNogFJ
         sepHntVubDvwVtKcI6iJgQiNfPfixpUszAKjzU4hBQtollMdZNo0S3Dwu/zO/c/x2SvK
         Ohm2eYIsm80M/jw0EMCWmxttWrMF3OQdwvPujj36oB38NOsCGNkQGT9IfmZfUBr1QoKQ
         7RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129031; x=1708733831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVpX0mIezUFl359M2ifxsclp6u21EzyqVujabdKcdhs=;
        b=mRIFZHGxHqSYBH13f9XTnnRFdscspI0YlZOg/ojXRS06Gv6DopKaXGsX58BtuGEo5y
         h5zkAsEPlq9gJT7JFwu9HYxGuGBFGLO1hblpziM4gY0Ba2+nupyYwBgzqeZRwqlK6S6G
         FJg8dXcHv13X9ZmX1KiSr9lf13LPyKg2eULR2h6pvHfmoyXC3ozPP4qfsrX3DerlgESa
         0UK2Vj6xkXCY+f0qLi4nhXKeUCwvvHpW+/fz31HahHvulRic4RUKG8/EMD2qcBAZ0AmO
         rkhi4wYPiCzBUiEWXXT9lzPXg9L+cmEpEbtDCjZbUaH1b/Wa3maTDKljzTuKYbUADNfC
         QfOQ==
X-Gm-Message-State: AOJu0Yx7+ztNOYIR/tsFEpBTlQ327EV8cYzBNBwpHXyi+2MewWYuMnA9
	CAyBASZBNqnxUQ0TWPeqlAzisJqHB9z0oh7V3HqRuZbbP1a9xbmWt4JUYS7i
X-Google-Smtp-Source: AGHT+IHUvY2D0tnSTmvP4vqfYP8kRXyst/xiyXLTPX3J0YLYVx9rlsBabzkD/RnfNG/BFVdbVk3y2A==
X-Received: by 2002:a05:6a20:21d2:b0:19e:cbe9:63a with SMTP id p18-20020a056a2021d200b0019ecbe9063amr5246284pzb.28.1708129031208;
        Fri, 16 Feb 2024 16:17:11 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 47/60] python3-simpleeval: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:38 -0800
Message-Id: <c1cfe81bdab6874f0f04928ed883b68ec1cd394f.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108817

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-simpleeval/run-ptest     | 2 +-
 .../recipes-devtools/python/python3-simpleeval_0.9.13.bb     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest b/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
index 35cd19ffef..af2c4a1e2e 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.13.bb
@@ -12,11 +12,12 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-math \
+	python3-math \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


