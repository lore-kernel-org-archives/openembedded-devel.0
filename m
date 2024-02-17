Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3523C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:03 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.603.1708129020622663328
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UFdtlJdd;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7c3e01a7fdeso96691639f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129020; x=1708733820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqyswgPlSNrVBnovlEA67PhMJATIDeqQukzFvPtcOuM=;
        b=UFdtlJddKFRI1Hx3eT0XEYaVkt402tP8rgrP8/fCbjCCqlk7v6zJACAVwyKRawyIuT
         6s0s/QJb5jbtyhXt9Yos/OXNJuaRMsP9rstN2pn7pHD91TGGDCYPBqoTmpF3xKbTZqNk
         M2yyZhqxFey+nFdO2KIabzubRWTud3AUjueK9v32v9WmtEpWtzYZtuCam0CvpkXkVn6n
         QGO2Vs41uzLONlgdNDKcVsVt6tSBEoFZ1JYtAWLef0MrmxgTdIHErwnL7V0XcUmRdXnE
         tcy1uAo1wE+w9pB5iSA2i3cERRGQUZp3lIOpNtlaJ9wXsRNELKR4+qp6y9SYJrJWwC3W
         VCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129020; x=1708733820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqyswgPlSNrVBnovlEA67PhMJATIDeqQukzFvPtcOuM=;
        b=e32LbOPeuQNbBuwrSIG+epyBgKIyziJK/hLChm9V/DJP/E/0fBQZMXrDokwJw2mXAR
         XBhMOUOvqFqyftsaJGzbg2ksE9dwwIKZkMUHY0giK4qb0ca6sKfpmKsUOwulkLZZ38xC
         ZXBxpMee/1pXD2GhoAOur1LNjSKfOYZIFkytdJ2fkjTe344kSHIDRVq5K1llmCxaCqOg
         +3Mevk3lYm1ldzfGOsMnt+JCD8BwqQfq5CcN6eW9+zu3aV8lN1gff/JV0wnNmIyB9ZMr
         MnT+EsXzrMR6flgGxBGIJuoDyYNQRaqqDFw9ZyrtwGwPL6bJu7MBOJc4JagJcxrKTRHp
         AhTg==
X-Gm-Message-State: AOJu0Yy/5Uaww/ZXkuL+mGSgFTPf/7oinlL/81kH7m4mjtAG3+yHudwL
	TTgLipltuS3Dr1tKzVO/cvICnQGwoAsf1h2xVUeoaDc2kqDP01//J91kJ/r4
X-Google-Smtp-Source: AGHT+IF5AV5KIwvO+7vrtrLEtf6Mh4W4ikRAxY6OCMPPXSUVH/WF/KGJduE/jnG63JA98WygaqOnKQ==
X-Received: by 2002:a5d:934e:0:b0:7c7:2913:d8d1 with SMTP id i14-20020a5d934e000000b007c72913d8d1mr2481929ioo.11.1708129019699;
        Fri, 16 Feb 2024 16:16:59 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 39/60] python3-ipy: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:30 -0800
Message-Id: <8e6170e643f6adbdc19ed4d11621830754d400c3.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108809

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-ipy/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-ipy_1.01.bb   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-ipy/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 8e7b5b987e..36d0b9ae27 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -19,7 +19,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


