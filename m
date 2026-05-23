Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE3ACD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:00:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3060.1779512444085715633
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O3l7av2Z;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so3531066b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512443; x=1780117243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvc850/N+XzUPsczSMBA9iF96nFTuREPXV9CY3FChVM=;
        b=O3l7av2Znd4jyoa61ROwDWQ8j+1lAoJ8NNuTqqX02pCf+VHW4d5re+i6uMBLtfZyxh
         u8lM6wCuRCJsUa/k2W1bP92O3JogNAPD0Ou6dfql++vJ/wj0SIAbwDwgBLGD1Y7YnKxB
         fyVCrhfOvIn25s/J1WHU++BoaauoA9Ui+U/SVCEOlb5rZ4rCnWdxqxGeTHwyo5M5Zo/4
         ZbMuDTVDjRX18rLxtaeag3f2b5qo6VghVAtuPZwTSpx01AcZOHA24JnC0iikkquldl8m
         sfhc3njjD2H4vbd35XPf99B7V/1uNq1WB4EvKIu5kQehmF011sNuq9m/gmGYdXxyFAit
         y1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512443; x=1780117243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rvc850/N+XzUPsczSMBA9iF96nFTuREPXV9CY3FChVM=;
        b=HpgN6k4gzu9aONLSJI1QpIrzU+uJ6EEBr4BMZ1voSErGFCHvXlC0k6bJznmsT3Mr4K
         mYdVyS1oU1BQ6PJfPDy6ytT7NcvlUdK7hcnCOVh93BroNjx5LwyBp/MiAgoVt0JaYNBN
         fE9bSxQZERtAAqxM/PZpk+cw6qlzPNt+BayBdydwkhIqGZVtbPUy8QwH8jnZ59WMtNH7
         0pTTSeJ2gksEyCbGDhNdGNkErHZdjRh6MTC3V3ihih1+Q2vsUnsXfwXbJS38Uyqa4IGq
         jTm/lSWmJJvdZ4Y5jwe7bjnCTEeNzWLvpjNvpsCIQi7X/6hBgnvr+QdstLgRSrIrOsGG
         lFlQ==
X-Gm-Message-State: AOJu0YyImUyAqfISgKTilwLPiorRujiFPK4s0sDARRw68vA4wZ/Tlw5o
	Eqe4MEJqZAWdt2GY9Jd+ZE03oceZYIClfSJShQ41Jzhoqlnb2wQgxhl5KUj/is7i
X-Gm-Gg: Acq92OHYx3V43wED7guC591tEJArHPGbgGXqy0dr121hY2ZzNmneqeoJs4dXngv0h01
	DdyvVY85E/WJC+SydDLQCcIXGgXXsOj4PP2X4jhp7S615+UfHuE1v0+OTx/HnHteWNZd6NCoGoM
	U3nGZfbNyvx61sWKZeZ/cfzKeZGkfVRcVxEwJZshemg71wj/JX69oe9suSUKntvNWvRpgfAb3Qs
	qA22jzC1CkTXhdtHD+psUPgQWVeEP5+NQlENYe51ASGjBGqk9uvaS0Ua5gjkFpV++UcscDkqloM
	56bZtRbF+6e/Zmjp+I6pZtoKzDkQuP1tpqtjIUbdBVVhU32MJQcG3Dk/E9qmhhz9k0GmThrUOBq
	Lva49RRJawSQDlzyKy3LtO4qNX4oKfrxMEdf9giKOoWpS7O0W8kSuH7vKtehA0nbQYK8i7TEF7Y
	q8D0X5fAtrzmNMvGlSuo1gQwzIg84+FiLKCvLV
X-Received: by 2002:a05:6a00:4508:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-841611e3eeemr4245899b3a.23.1779512443465;
        Fri, 22 May 2026 22:00:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 3/25] python3-inline-snapshot: upgrade 0.32.6 -> 0.32.7
Date: Sat, 23 May 2026 17:00:05 +1200
Message-ID: <20260523050028.848327-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127153

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed snapshot comparison for dicts where keys are dataclass instances (or
  other custom objects used as dict keys), which previously caused corrupted
  snapshots - either collapsing multiple entries into one or appending duplicate
  keys on subsequent runs
- Fixed tuple snapshot updates to compare elements positionally rather than
  using sequence alignment, so existing expressions (e.g. 3 + 3) are preserved
  when elements are removed from or added to a tuple.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit fe086de31ae8fe4c8d63306c112dbe8e41db1e59)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ine-snapshot_0.32.6.bb => python3-inline-snapshot_0.32.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.32.6.bb => python3-inline-snapshot_0.32.7.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
index 1bcd3a457f..57a1b4965f 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.6.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "224a96eeb86c4b2831d274239d3468dc0b7819264f608f595b2f9d01f79a6e38"
+SRC_URI[sha256sum] = "1a97a50420de32b86c422cceadf950f1f343ba03a28b878a757ee492b741c093"
 
 inherit pypi python_hatchling
 

