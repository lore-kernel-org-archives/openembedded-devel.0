Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1DEC48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:24 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.627.1708129043398190167
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TKyLczIx;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59927972125so1611101eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129042; x=1708733842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/veOXdZK9VZsQHdEYcZpfVmGdTkITElCNHaZ32Sg0Nc=;
        b=TKyLczIxM/ALb9Br+zcpOgm8IZoTqTjwOYCj4G+QqKowXHQND+QSYJt+pBGUlC3nkn
         GrkA35uMGqzI7jC+R3EWKd1Wb9T1MYI59BHn9kPXZBbtx+WhN5Ek/gMIfmKE+8j2WSQr
         p7dXn1ymDTu0KguYHPhHI6GSVmJ/8fQIj2/DDBc5KUW5x5MzuukaNV2tY0vB/BrKq6bZ
         lcri86ARLS5KT3kooYMwfXbt7sH+hJcykLEpsDXZ8DNUuIro7aTncr06amKO7jp4AhK1
         R4YrRTFkuFNUebRuhk4TRe0Fz04t56thgU76HDIJXN0yRkJiNn7VsLxa0g/AXFn1F7ST
         YHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129042; x=1708733842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/veOXdZK9VZsQHdEYcZpfVmGdTkITElCNHaZ32Sg0Nc=;
        b=sE55o8xq7ga4pea06WgqKC7CwTr1yweb1wpmMud/are1+VNHe/kAuu5yfe4x1yA1we
         AF2V4fipfkor7IEKDK8SXtC9z4NBq5EQDxY3Wt+r64WnaaWyOM7hFnglM/w5xRLaxw6W
         4qUIs675uC3WiJrckxCPKKkDhwyNo2IuFCR512I0GgcJOC8ZaoB97hf6nw4cG96QZcqb
         SxloOBQxxx0U1y1bcuO6j29BEfUMl/GMaNXIFwmyKraHOF6hb1666JCu7pAZUjPlB0oX
         aCJjB/Cf7/JZu1KSNzw/6VY96Fe+x2QLX0zJvZiugcnoqTMBVT3zMieF0x5cHwuvNyNr
         Gk/A==
X-Gm-Message-State: AOJu0YzdybSii7eHNhDdORz/MiVrleHQ9tBGYMGoW7KPnXhH2tMcKH5i
	mM7HBCTzeE9S+SILJDaB3cv51t7fPMdXlC+tPPe5UsXBvjApmBVLXfYpk3MN
X-Google-Smtp-Source: AGHT+IFmyoA3dXX2fUtc+C51Se6uI4x/QIToXS3og5eWUN+U1onyWRFBYof+9K06kWemGgIKdwpCNg==
X-Received: by 2002:a05:6358:6f1a:b0:17b:2bc6:e970 with SMTP id r26-20020a0563586f1a00b0017b2bc6e970mr2212175rwn.25.1708129042474;
        Fri, 16 Feb 2024 16:17:22 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 55/60] python3-pyserial: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:46 -0800
Message-Id: <7d8bc95a672c8b11103be4f2d5aa06b9d86bc311.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108825

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pyserial/run-ptest         |  2 +-
 .../python/python3-pyserial_3.5.bb            | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyserial/run-ptest b/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
index e301963f96..b651411db7 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyserial/run-ptest
@@ -1,4 +1,4 @@
 #!/bin/sh
 
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
index 15646235df..ade137a385 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
@@ -37,14 +37,14 @@ FILES:${PN}-win32 = " \
 "
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
+    python3-fcntl \
+    python3-io \
+    python3-logging \
+    python3-netclient \
+    python3-numbers \
+    python3-shell \
+    python3-stringold \
+    python3-threading \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -54,7 +54,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


