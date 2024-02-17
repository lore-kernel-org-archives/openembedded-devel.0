Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F477C48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:34 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.632.1708129047352791269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d948jCVF;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso1304650a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129046; x=1708733846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaVfmDHbDZu3xG2A5Mtwi+xHXL1VoYza2JZwsli4A+A=;
        b=d948jCVFdOKzAoxEFL4ikFfVLQJEkwrjxdXEb73pc8HKp6CymH7XQxybvBS04f7ME3
         IqetqcPgQg8OEIZF1P1jnI8GfgMVh9eYFH4ngTBVEv+Y1NtUKRfkfv3kYAYLOh/KkGW3
         y622HjpNtJRAbR1nr20Gl3gV222ZEemZZfRV2xXEZTrYaK6B1zJFlthIx/4keRVy+ahV
         +I19oYptHwZsHC70Omf627s62RzcRG3bI/DjeqpxS9u6UE/XgOrDBytMLQ78NpRNAt/8
         M4mwckCQ77+zoUIN/YFdycxZxIzM5LrF8M7LVRjdyGdches7lCdInJwsqT78vcvMeLFE
         Ulag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129046; x=1708733846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaVfmDHbDZu3xG2A5Mtwi+xHXL1VoYza2JZwsli4A+A=;
        b=hOetW7hsO28uaVqm6LCSWDKy03BHLdbLuwZwy+qx8UR1z++JvfP77BI1O7d/KFwkG/
         53QxnTtdeXIwHdhOZ6L7EGTy8iIeZvIIlHsqcLKYXVw2fmIxICX4gQHmwf7ZualGBpXz
         I7Wu/w8N5fTUoATuJ61i87aBLWDIzE/WjOWdCGq+gjyRu3Es8U5yh6mlYV8BdoL6p/rg
         MiKloScexm/hZP627MjTE3QmRaLFbJ/1qpU6hl7Wg1Ikw+v+fLn0Bn0lnuXlY1Uy0Sj9
         9zjjk0nvI+Pkiqeo16labRbJx4rENOCh/4EHwNdV9MUC42PPmCqMQwTjb+BMeCx0JIlU
         nKoQ==
X-Gm-Message-State: AOJu0Yy1mb4fuIZp7ln3hgCPx20EaaP72JhI+5f44W2O33LU9jy6EhSQ
	P8Uyk+MImLSRunsuq8owak9f9syrYNHOACUrUa3RxkPYsiL9CUczQcFB0J4L
X-Google-Smtp-Source: AGHT+IEKSVtXvnvd8DUuQJUu13Xw1j1xDfKN2JPRCLkNMR1Qr10hP11cADyTPYix2yVafKPqtAjyNg==
X-Received: by 2002:a05:6a21:8ccc:b0:19c:881d:78e6 with SMTP id ta12-20020a056a218ccc00b0019c881d78e6mr7158628pzb.42.1708129046583;
        Fri, 16 Feb 2024 16:17:26 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 58/60] python3-pyyaml-include: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:49 -0800
Message-Id: <23d168a9449dbce282168b8bce5792e99cca2c4c.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108828

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pyyaml-include/run-ptest                | 2 +-
 .../python/python3-pyyaml-include_1.3.2.bb                 | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
index 3385d68939..8d2017d39c 100755
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
index 9bfaa21946..3a5bd99a78 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extending PyYAML with a custom constructor for including YAML files w
 HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 SRCREV = "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
 
 SRC_URI = " \
@@ -20,9 +20,10 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pyyaml \
+    python3-pyyaml \
 "
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
-- 
2.34.1


