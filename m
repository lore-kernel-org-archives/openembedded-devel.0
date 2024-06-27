Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80D3C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 22:45:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.5039.1719527990840734080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 15:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYhu86cy;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-424ad289949so22631135e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719527989; x=1720132789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi0WX1b7ZvmPl5wsp87N4fhJqzOMmACYY0F1O56PdnE=;
        b=OYhu86cy4WnV6Ol6E6KdpdgJrPd1F+PyQjUcmh/nUmnfVXg626HqrxnKWBqBF9MUSB
         XMqEQlFnzo6d2EEZAuq2se/Y0iEDKK0EvlpDJH53w/Rk3BdTvIbWj67gqmC8nRxQqMbR
         RhqGwAESe4fNicWlaY9fwMYKRcExLzD/2WcntRNbSR69CuPne/7eNSkcR/WgjthlKdGS
         aMZz8n0yQOWR/gjUew9xtoTBq9rl/OMtgoJLQAZ5OOLrX5ow6haDlvRUSdOBDdzqxwge
         4ivcUNfcF0Qlo80MnzkxxwIKYWHWXCppOAkKwYAyMToUTmhCt0ZvD6iRrioVep61ZCVd
         7SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719527989; x=1720132789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hi0WX1b7ZvmPl5wsp87N4fhJqzOMmACYY0F1O56PdnE=;
        b=BdFNcAeQXNxukMxv8XtV68QshjLgCJ0jGnC6vTjUrlspAZdhd3fP/90PYeFw85K55z
         yxfLtSU1BUltqGeYvaXBpfQSfC124C4QICU9jxRLAyW3dcOrBsn0qh6L2ExQ5sMtCZK6
         tv4NumTu54QXB5M9OstP6uaKNqkVZMgDATgf5C/UXFe0y7LjlAQ3le9Hd1XUhRYUZdFl
         QdiIlXfdRMJMYIidJKw2Q5fzIKPJuDwMVSP+784KLr2XxIdCqTB1SDFrRZHVsJbeDwuw
         wfdXwK5ci96IK5bpkzrta2MMiRsPZl5hPPAtdC6QCXavDvoSUndprv5u3iL2ZytYWXYV
         B+Mw==
X-Gm-Message-State: AOJu0YyhSrkDts017q42guaYS6ODNFWp/bGA3Rx2535qS5lzeiuCjcSB
	ehUgqbEXLjqE0kNceGniyrUQmROS+8gdi19XcGyY4IRQPksiX+GYXCBiWg==
X-Google-Smtp-Source: AGHT+IEGEIEB/74a+vpagtaxmoUf8uvychXUTln+1RIRpv2g1xaHruIvkycAWWIjH77ixutBVimrqg==
X-Received: by 2002:a05:600c:2e87:b0:425:5e8b:af9a with SMTP id 5b1f17b1804b1-4255e8bb07fmr46116555e9.36.1719527988499;
        Thu, 27 Jun 2024 15:39:48 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b068e93sm9741835e9.24.2024.06.27.15.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:39:48 -0700 (PDT)
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-bleak: upgrade 0.21.1 -> 0.22.2
Date: Thu, 27 Jun 2024 22:38:54 +0000
Message-Id: <20240627223854.198062-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 22:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111132

Changes to the build:
- Drop python3-async-timeout which is only required for Python 3.10 and older.

Changelogs:
* https://github.com/hbldh/bleak/releases/tag/v0.22.2
* https://github.com/hbldh/bleak/releases/tag/v0.22.1
* https://github.com/hbldh/bleak/releases/tag/v0.22.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../{python3-bleak_0.21.1.bb => python3-bleak_0.22.2.bb}  | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_0.21.1.bb => python3-bleak_0.22.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
index 96f3fcbcf..36a823a9b 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
@@ -3,13 +3,10 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "054b092e19c7a45d5ea07d8948022f54117fe5e8"
-PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop"
+SRC_URI[sha256sum] = "09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c6163f0723aaa986e9fe"
 
 inherit pypi python_poetry_core ptest
 
-S = "${WORKDIR}/git"
-
 SRC_URI += " \
 	file://run-ptest \
 "
@@ -26,8 +23,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += " \
-	python3-core (>3.7) \
-	python3-async-timeout \
+	python3-core (>3.8) \
 	python3-dbus-fast \
 	python3-xml \
 "
-- 
2.34.1


