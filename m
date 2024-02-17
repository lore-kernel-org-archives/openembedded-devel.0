Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0819EC54766
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:13 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.582.1708128972623610570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IH72gVJT;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59d7cbf1279so1511353eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128972; x=1708733772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExntGg6okDQWMaJdtxd79RIiCsg7muG67Soh4AieuZw=;
        b=IH72gVJT8DRilllsBXNqQnLaxj3OXNKpbfWGFKu0bbY6I/yzWWyidBVYsEdfPGSGUi
         MhecUnFkMfnBbDfziTO6X8tgeqZqPU3kxCVrKH7RvqUf2W5uVS1KFyoGXB0yoNPaSAg5
         Ci5In9HBGWbPrv2oSH/Mmadv6O+yYykjEFc5iGbDO3M55UFmy8x5CqBIlc/lp3+1yTH7
         19qRHoJjLU/SoVauYqs/K7/gZdW30CYvob35mdM83XKO7helsjJ4yIYVUUBHgKbFPQ8r
         gHxgHYSbYtBjzrdPXizeVoWQL8RE7vgobq/Zcbwp1xkVQSrUeydA+h4btOHGPx1ULS+Q
         NvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128972; x=1708733772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExntGg6okDQWMaJdtxd79RIiCsg7muG67Soh4AieuZw=;
        b=WRLJqCIuYYVyoEof1XmPObSj1C8RQ2S9TKey6EwQJUvFgNpYynt8Ew8g9djVXdhI5c
         MS3zIoeEbNPDvn4hhcaPY475IOQSVdUp4of1HjMf+jbsIeq5/+xwI0iXdz0/BqHdBImx
         TfOYEx97rcKU6qIa0gvBiTp6l3l+EJ7vNKlvNZFThCyqY5QUgyw2ke+bP4Fhh4MgOxrv
         LpHcckU+TBrZzT23XJHZflZqWR2y+CvjjZ9EtXrtrTBj63bmu5n8uD3QYIgRXcQEI5NQ
         IM/ZbfYIIDeYxEryfi/K+wSt4QkRLkGy+QRmE3318hcZRxwmPIiCGHxH71igxaOHGd8P
         FKIA==
X-Gm-Message-State: AOJu0Yyo663PWr17d/1ZoiEjPHrbIC3/iMbO6Jqc2jsoJ92RBPduYjzN
	ISmuUKUm3m+klSjvnuBDtUtpK4/WX9yi/oVGx+WCY6GDxbTRDSSqAPebxAaR
X-Google-Smtp-Source: AGHT+IEr/RtEAv7Mi02Inj+IjWDLKmrNseddwaPp7FlM+ColsCpkqf9tDN/sqIcdCpaYw9uaRYBZHw==
X-Received: by 2002:a05:6358:7246:b0:178:6db3:27d0 with SMTP id i6-20020a056358724600b001786db327d0mr5902761rwa.30.1708128971706;
        Fri, 16 Feb 2024 16:16:11 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/60] python3-requests-file: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:59 -0800
Message-Id: <197609f7963a41d0dc2d8008f98428d4a1d87cd2.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108778

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-requests-file/run-ptest    | 2 +-
 .../recipes-devtools/python/python3-requests-file_1.5.1.bb     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests-file/run-ptest b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-requests-file/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
index 21cdb8c127..7ff984a933 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
@@ -13,7 +13,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


