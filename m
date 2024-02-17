Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC07C5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:53 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.596.1708129010390172226
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aw2N9Ttp;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e0f5934813so2095192b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129009; x=1708733809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkvnNv9hISbFpZ1ttbgIre1D44RWav6cpCDOnT0vgqA=;
        b=Aw2N9Ttpp4cxFOuvuWlQGICtTq+WOA2iXO2dzWhfqrd6N4sZEXe2Lk7MV1DnxBHANk
         v0sNuHR8T542ODNhyLr7rlM0reZm1cHshF9gd8K6NV7O7w90dRN8hz//Kc95oZ4OyPlp
         34o8F6BtbszRjlOLyH1nRR9a1blBziRHEvi3SzqaGzFajzylt6Jk9IBeu9PuRESxMLmq
         1+Oe7MDR6L+bQaj9X//+CAwT+Cxh/UE4hTaIs9F5WCoIaTpU8TYsQyNviblChvUrlbPo
         8EUbvKzIM9tVLxT7+p6h3WYTA29DBzRXrx7PHoHlmrYVN/3AsNAD0Chu9tWMQMMijaHc
         aYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129009; x=1708733809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkvnNv9hISbFpZ1ttbgIre1D44RWav6cpCDOnT0vgqA=;
        b=MqAQCUq8xsBFgGm2a6leudkwpmWTqAMuAwwc10RgIzO41PO07WYARh7duPyzdF4p85
         32swxCSOQKz9Y1GVHBRbFQj7uc1aog8wNpFrklLO2tcUI8ADiqARUJsfT+p3a7t1nmhz
         V/aYnTw/PZ41mb0STvH7x1D92P6yQDL8rM4oLZIW33Zmc+uk1QWX03uAUvfprdj09y3v
         Rs1t9raELdA0XP1tHWGuliBzPhakaXSErpK7tG4/8t1Cod14nKMSu9Y+jFf9yRde9no6
         o4rbd10dLwPbNYDLqCLTuqWYGlStW9Nzwc+bKU3BfNQkEgxC1eXhAoNICsJ6QadA0pHF
         s/kQ==
X-Gm-Message-State: AOJu0YxlBy6NjUjreggOTxF3gw4j3u695pptQuuodpDK4+lqVUg4Vo17
	/Wo3ZFwoB/1mG649Y2oHokK1IB7xq02rNRxCR+pD1zb6baRpvHeamB63P/a1
X-Google-Smtp-Source: AGHT+IGj2kblcd+N12uayzEFwQLTKSzhbPHBGH9bAqaHO7RnS1dLgCvzfxptI0AQhEbqgY/de4PQPw==
X-Received: by 2002:aa7:84cf:0:b0:6e0:3f63:ed64 with SMTP id x15-20020aa784cf000000b006e03f63ed64mr6015047pfn.34.1708129009582;
        Fri, 16 Feb 2024 16:16:49 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 32/60] python3-geojson: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:23 -0800
Message-Id: <c62c5d8d41976ea7d876f60b1b8739ce56c123d3.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108802

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-geojson/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-geojson/run-ptest b/meta-python/recipes-devtools/python/python3-geojson/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-geojson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-geojson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
index 79ad228d1c..742f921e59 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.1.0.bb
@@ -12,7 +12,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


