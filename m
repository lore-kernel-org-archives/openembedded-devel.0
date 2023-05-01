Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8D7C7EE25
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.87633.1682921125373526449
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VYVCZfn9;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1aad55244b7so13059345ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921124; x=1685513124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1X8CWTZlr11Mkc0hnuuHtH1fH65ZzkN5BiQBYOQH80=;
        b=VYVCZfn9+grub3ysBeBd+TQt49vchRVKv7zoDFFuAkUTiWRji1EEaiEo4RutJIVXJO
         jgyCFgWwFrz49VBv9g99yQ0vOispj5AD0r5or3TTDXQbv7PhDEObjbNdmx+v8SSPNe66
         DUO5U1XsgbJt9rk9GzmH3NpY16C64/pA6VhgZMWm1F+Qfib4ZQNreOYWdO6gv7Cb7df5
         3n0HfhnFMQf1uHcFI+/sIU4XNQJi+Fr6t5uip7LRF/PUaRTO4UxjfI8KKQf8GvPtZ7Oe
         2CCcL5l9fQW0Pu0hDS8z1lG8UrbNdM/4WC4usFNqdG+BcOSDEM8P9JupDtjmcdEXavZC
         gPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921124; x=1685513124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1X8CWTZlr11Mkc0hnuuHtH1fH65ZzkN5BiQBYOQH80=;
        b=JUuehdtpEWKTZkjeckNJj0PrSYIBcD7gN15k4Tn3qiSnsgwprJ+BYTWvG4KWt5uOUx
         ugBo4PcmF/RymBHKtXjNfBPn4qkdMxgfGYlV9zJ6S1aqxW1ipDMeFZKNXdIYZzBbpNt5
         cEswmKGMS/YOhdoPu3ObLKVZ5lpLG9+4rHYUAfzHPbgkW9kWZi9MIPRGBoNCTNw9HiqO
         kKm7Qk8j1ctJpvbHo07382bMECyceHzj46WU1orWRhNhT7NioW5xh7BS9rewvzQrPRmm
         SRHEyARU0s1fKE775u8vyNZx9lYYtLstKSu0jks/pCCZEC3UOei61vYspdMnIt195evI
         RitA==
X-Gm-Message-State: AC+VfDw3FPmNETbvFNOSR/Pw2NoOLzrq8lP3gpXiCKnLWRQbx4vu6dUk
	rPNXN6TbX4Fjh8C+ZkziLhZfSNztldvEVg==
X-Google-Smtp-Source: ACHHUZ6jRKzH5tOY7sK2OJK+/VOu/Ml0QG5S1m77YfeaHmT7ru8nQhM2CAAZh53dJzW6PQxmNLl9Bw==
X-Received: by 2002:a17:902:db0b:b0:1aa:e5cd:6478 with SMTP id m11-20020a170902db0b00b001aae5cd6478mr5395051plx.58.1682921124325;
        Sun, 30 Apr 2023 23:05:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/13] libx86: Point to working SRC_URI
Date: Sun, 30 Apr 2023 23:05:11 -0700
Message-Id: <20230501060518.3505068-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102235

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
index b646162c26..f11c52dd11 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -7,15 +7,13 @@ LICENSE = "MIT & BSD-3-Clause"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=633af6c02e6f624d4c472d970a2aca53"
 
-SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://mirrors.slackware.com/slackware/slackware-current/source/ap/libx86/libx86-${PV}.tar.gz \
            file://libx86-mmap-offset.patch \
            file://0001-assume-zero-is-valid-address.patch \
            file://makefile-add-ldflags.patch \
            file://0001-Fix-type-of-the-void-pointer-assignment.patch \
            file://0001-Define-CARD32-as-uint-as-it-is-32-bit.patch \
 "
-
-SRC_URI[md5sum] = "41bee1f8e22b82d82b5f7d7ba51abc2a"
 SRC_URI[sha256sum] = "5bf13104cb327472b5cb65643352a9138646becacc06763088d83001d832d048"
 
 BPN = "libx86"
-- 
2.40.1


