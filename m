Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00909C48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:23 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.575.1708128974220525400
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q3s+YGA6;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bba50cd318so1850684b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128973; x=1708733773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6vgUiTVyWl7rWDUsqWKGqh1uom83Mbiw91KpSrbgPA=;
        b=Q3s+YGA69kiMCEl70i5c7McIb4ZKOk5cKnn8g5g2TiXXHcsnd2mqKy2KF4NUPS05ov
         YCYl1NqtmfKjh9FKz07DN9ADtNZvfhpqRZkBHOR6nodG5lf13SyuMoFskMMmtYnhL92l
         1le5wSacYRwf7EvMGW8JRByEIaBsgOSmNYQMD44/pKgsxqJdMdF5tHpojVgOqrNAojgg
         vFYWZc9nD54RW3m/fWO/Xfh0DU3G30IGqYnRngLweBKSuyrHFMxUzFmoKkH6TJiPkEki
         6wi5N1HUjV+jKqdvlVSnYNgJYBoke7SsPZFaWm/cyJRY3Txisxl1wL8X4CTSVPbcPEKp
         8q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128973; x=1708733773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6vgUiTVyWl7rWDUsqWKGqh1uom83Mbiw91KpSrbgPA=;
        b=Ui/+9IenNLdIwgUahHin4IgveW+lOfAsutyp/iVDZwfLAPWyXmG99a4lI1DW+vGhiy
         GCuPmdNnD888QTYsMgje/sCM+V/q+YKv4nZ0V78UVJR+npBxENOuSh3U1efB7wKC1Vwm
         8p/2wJszhKCWJKgt1jnpyT5/aAvin8kcr9xNtbi17lSMFeOJ8H98D8GQ5uCJuD3oneMR
         jOQqMQ+fCnpWkfOwKgIougloDzSyairjV3FQKlEENAqskUVwNwGmp3CkXeKW7pYQeP1/
         ljOR0pkZRQ2qDRsk5m9lXHqtJb6hbRdksCA33/GLrp3095V9dLOPWjrB/NjW6GC/FACc
         HlRg==
X-Gm-Message-State: AOJu0Ywtd31MHgnRI1ZwkBZBDBnRBAt8RAhxOhltURk+91ZeD9P9WGrc
	/8YnLFLnvehBiwKmosPhYHpfcMtbibPIU+btf0mCOc7jEomvXc2uYEyJ7Ylp
X-Google-Smtp-Source: AGHT+IE8/0AjsB7Fd7RxMDPBHSAu/quBWtlctqF4I+iDok7GyYFtt5DRJR/hnJJ4MQlH5qyx+n/HNQ==
X-Received: by 2002:a05:6358:e486:b0:176:d0a8:8df with SMTP id by6-20020a056358e48600b00176d0a808dfmr7842878rwb.8.1708128973292;
        Fri, 16 Feb 2024 16:16:13 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/60] python3-covdefaults: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:00 -0800
Message-Id: <9d8b013470a4327cd2272f1939e22c913a45ff9e.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108779

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-covdefaults/run-ptest    | 2 +-
 .../recipes-devtools/python/python3-covdefaults_2.3.0.bb     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-covdefaults/run-ptest b/meta-python/recipes-devtools/python/python3-covdefaults/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-covdefaults/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-covdefaults/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
index a0ef2af828..7391c3ae2e 100644
--- a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
@@ -16,11 +16,12 @@ S = "${WORKDIR}/git"
 inherit setuptools3 ptest
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-coverage \
+    python3-coverage \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


