Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20765E91280
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15260.1770274807294480049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=afufIK2y;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso4876245e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274806; x=1770879606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fpJrWFvuNeMvt8MrL9VUaEnOQAUvNfSI/tAHhXlrV8=;
        b=afufIK2y8p7FMtoauzELZIM7ZAmSLcBA0ff8Aksm9KW04ZAq2RBqQxpy6tsZsIpEhY
         r6rygA0FXSEAiOv8lkSqkBKwRsLseKok0yTYaq8f8QozRHanXcwqFoUhfgioEknxUNX3
         6shrhrsO1ljsnw7bOLu8CijHcwkrlOfGKmVuysuhuH5nhRhN6X37FaKuVy7ZlC3yRKm/
         3/W2ktsPwSpYzpiqtpVWX1JTEHHvONJYY5HJ6Az29FuSYtoEeBRUoMGrUMQSTq8s8Kvm
         NSaKGwlqHMCEwahH2+wmkXsxq4uDZz/p8l8Jotr0+7R5puMicqyLI88nb3yegpyiluqe
         XJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274806; x=1770879606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+fpJrWFvuNeMvt8MrL9VUaEnOQAUvNfSI/tAHhXlrV8=;
        b=SMw0edJ8rrnLq5nCkEES8Ek4qgRzI1VdbO8PkQAfyXOrxTIGo6WmHnbgTEEfizBmY4
         YGiEY6W4ii/juDVeV/4OUdlXymqDL1U+rwfALKNcoFgjK1QRxTip2kPOzG2pQ/729c1m
         2beoZYXPyWh8TytMxMEVFn6t6cELt9FcYLSRbC4arVJLWvU0B/KdzpFBfF33j97t1tDt
         XZ2Hm0YqhIUpKomYuMjtoaCKI+5PDBTtUZa0Rj7MPUO6zYrj2i3rClC6k47xD22gEvcR
         AJ9QAe8hiWg2yZbayMnP09Rk7HUiTI3sVzujeuUxjWJfG686StwXGSBbQLmxUoyI5hQw
         Cv3Q==
X-Gm-Message-State: AOJu0YwNiMVH0o443yAoPRoiHKA04uKrOOmUuh79abNNDjWePzsX6Hq9
	dW10tluRGU3SDIowNxpisTS0RVSMbRzRJz1CbvepWbbq+q8i9wHIqRBjfeW96A==
X-Gm-Gg: AZuq6aKCTkJPWdVQiCsTEaYzJgN2ekUFs468rUeqpnOyU0b95NJK/waaAXQL8X+/Emi
	mV0JVVwlIySsq4fwWv012wtuxVQUy9IeVT2nhjegM78i9V5FTqfSfHVK7V3c3tHVpYWLJD1d5Sg
	sR77BsSlkly6/oAWGyLwfXtG3JSPaslehlWP3DRs99uaO8BPPSSqXFLQNJlAGSiQe31uH5AOMbs
	lzRMizE3SCugtoGiOKUgKnmmXvxs2ymJB6xOARqDlugVitFfeI6qVT/UjqhCnBq7V+5hQu2oKXp
	ceWzpNSBEZ+IUZ/8iVRouIK/JYvfiopTSJPmpZeFHkYRX8x0GGwneTNcJ3upTOES1VDPPnAAgnS
	UuGALJrB2SZC6jPOUDCEjVZQuTGBhBfk5JiWlkz4NMA55lLhHR6G0twRH1j87ZcTOYXBjmZLGqJ
	Z09qvFac+d
X-Received: by 2002:a05:600c:8b5c:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-4830e93c021mr73576765e9.16.1770274805523;
        Wed, 04 Feb 2026 23:00:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 13/20] python3-tornado: upgrade 6.5.3 -> 6.5.4
Date: Thu,  5 Feb 2026 07:59:48 +0100
Message-ID: <20260205065955.1267785-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124189

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes
~~~~~~~~~
- The "in" operator for "HTTPHeaders" was incorrectly case-sensitive, causing
  lookups to fail for headers with different casing than the original header name.
  This was a regression in version 6.5.3 and has been fixed to restore the intended
  case-insensitive behavior from version 6.5.2 and earlier.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ebca0ae79d15c5d5f1489a8b5de18c810891e7e4)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-tornado_6.5.3.bb => python3-tornado_6.5.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.3.bb => python3-tornado_6.5.4.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
index fedd2700a7..9b43d98e1c 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "16abdeb0211796ffc73765bc0a20119712d68afeeaf93d1a3f2edf6b3aee8d5a"
+SRC_URI[sha256sum] = "a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7"
 
 inherit pypi python_setuptools_build_meta
 

