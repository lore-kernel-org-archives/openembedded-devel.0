Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60C7C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 16:48:22 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.1441.1710262099956324054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 09:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AJdaJqlo;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3664b08a419so1024275ab.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710262099; x=1710866899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vpbpq0kTKnUSS2u2GZbLWPL4PcQvgITQvxvFDmj11bs=;
        b=AJdaJqlo9YuaSdd1Z9GEotDMDr4Lv5T6GkTmmmQEZm/mTw2u2d/cEEcnoyw5a8D4Hc
         kyL9CPErHY7DhnmQv/2TZWXl95JN4GMc0prEIwwQxk/xjIHxzMVbFY8FV1aF9IKJQJ3n
         8VpEOayRLRiSWTHrxh/QeriXIAmeHg5UYUcU4jE0wMP4Tf4XhG/fxI8jg5xjM3b2YPro
         BIgxF3GqMRadj6583cRBi32A5C9IdX7CqTcfCLQ+LaS5HqkDfbn9utq2fyXJHp4Iijvg
         y+4f+1gbcIDfuPRcRw2Pl0wB3PbPJfXHpRmHpiPfmC8bkFGGE4tLlfT+MBWxwCPozLNi
         6x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262099; x=1710866899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vpbpq0kTKnUSS2u2GZbLWPL4PcQvgITQvxvFDmj11bs=;
        b=Yy018GD4xIgakmZPU9KmQOofHZj0B7AOrb/prl7EUxzGEIBsnz9QgFoxelv+8WXfiv
         5gFZE6xiZGfeuGgCCYB9Ua9AVDRfKbR3FCQAWFcb+8mC1U8OjZijjau+3dagw8TwGZJy
         kbEaQeOG4oOjI33Op4djrLyaUIcuIYmKbWyuGyYILSLcHobLkTrHsjXvjc4tvs0LSA0w
         24DBdiXRj0GbZap73oYspxI6bgE0J09MTWfbFaIeSD1yDjTWa5IH0Y0K36gsDTVB6iZe
         HfnjPesQ5ax9epQ9sycpZx4i/pdEJVwawZIGVB4Df+CoUaDhfCcZNAvUPR31bKForIji
         Bi5w==
X-Gm-Message-State: AOJu0YxMUxehM4tDi2NDaIvHkQaJBmCIV5jfmhVitwFunUmrAikrXYD8
	VsdZtWJhbAAkoii1xXp+BZHF2kKRz0aNIwzhOR8RFc57Oa58s7gxy9tuWaUH
X-Google-Smtp-Source: AGHT+IH1m0bFY2GGOm9EV7FRkdB6DxE7ByG8WL4FrXG712hrBgvEHa//Q3UxU372v1jD0IS1IrTmWQ==
X-Received: by 2002:a05:6e02:1527:b0:366:6d59:6c00 with SMTP id i7-20020a056e02152700b003666d596c00mr1040658ilu.27.1710262098900;
        Tue, 12 Mar 2024 09:48:18 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id z10-20020a92d6ca000000b00362b4d251a5sm2422263ilp.25.2024.03.12.09.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 09:48:18 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Dan McGregor <dan.mcgregor@vecima.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@vecima.com>
Subject: [meta-python][PATCH] python3-pylint: Update to 3.1.0
Date: Tue, 12 Mar 2024 10:48:15 -0600
Message-ID: <20240312164815.1638743-1-dan.mcgregor@vecima.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 16:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109278

PyLint needs to be comapatible with Astroid. It was recently updated
to version 3.1.0, so follow suit with pylint.

Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
---
 .../{python3-pylint_3.0.3.bb => python3-pylint_3.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.0.3.bb => python3-pylint_3.1.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
index eb4b9e897ff..49f0b3eb6e4 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.0.x;protocol=https \
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.1.x;protocol=https \
            file://run-ptest \
            "
-SRCREV = "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
+SRCREV = "053c2c3a25f97f043e10cdd41d2609e495a68f57"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.41.0


