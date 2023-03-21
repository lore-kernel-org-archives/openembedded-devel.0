Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E31C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:27:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.23802.1679426849355282028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 12:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ri8m1RNR;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id o11so17162449ple.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679426848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXNCXFmXTidQ/IKNid8c7W5onn1+YIOutY9L6qDj5Uc=;
        b=Ri8m1RNRnjAgPT6VYxFCSpO4zhoOdHi3D91Zc/CrHp49IcZrugjdEFKOHWh8WAoi63
         6bw1coaz2K70lPj92Z8U6h+f4cE8tgmD0tCBHovnAUYkSd7FQ59dBQ5+JaQ9Dg5T0uT8
         wTrQAvIXzBBbmF2j8esrRX3cjjp+JrubGMrWJMuxwLohSZQ/QJS69Rnf6adTl83/ZeAc
         MGhYN1disviqZo8g/HRPO1vziNV4S1Qie82+J/CS4wNLbM9gkvbPUQao09ZnuDn4bf19
         ivxEUR68C3fasUjvQI7SmlejI8hcjcp1hGAwBI5BtKZEazbuErl8492Xxo0FR6G/8GxO
         HVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679426848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXNCXFmXTidQ/IKNid8c7W5onn1+YIOutY9L6qDj5Uc=;
        b=eoPfTCVmCt+WN13h+88FrP6U9DxbU5tIYUDA1TARFRKOPWffIcTsisN8/CWWzJBVDp
         czY4hUjB7qj1B3oMuNH6a4Ig1RcEiOf+LlO9anjk1HveqeW0JP+H/JTd2LSvVdq3R+zm
         ctAZcKNerRzeI2/0aXDiwsOb90Vdxlzw2k4y0h6fFHApvubp8SZZbXdc+ccGNc2NDJlG
         yWbDg5BfSe2Q+zIC25IE6I9UCXjZdMe22uEpaxlIJwlm4iSVBuDv/+X91dWv9d0CjZeS
         jfzUMf5ImuQEhRvICVl/1zU4uJ0R42kTbVSswC9U/wHcDu4JlfhpDPXCuQFxXLbqApg8
         94Iw==
X-Gm-Message-State: AO0yUKUgKocL2tYY0z35om8+G5OsMgeAkpIlgRMhXM+LXuMU35RLRSwS
	wrMWDKRXKeAeIFNECCKDXdCJ8y6v5ABkzA==
X-Google-Smtp-Source: AK7set+wb783/f41gfYhNxOwfeBUDHWP7KalqTUHhnp7B7IEhAQOk3YeUP3ubgcjRTM0Ir4y+OTZ0w==
X-Received: by 2002:a17:902:e545:b0:1a0:57df:864f with SMTP id n5-20020a170902e54500b001a057df864fmr66112plf.16.1679426848399;
        Tue, 21 Mar 2023 12:27:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::86bb])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902b58700b001992e74d058sm9114924pls.7.2023.03.21.12.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:27:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] packagegroup-meta-networking: Set PACKAGE_ARCH = "${MACHINE_ARCH}"
Date: Tue, 21 Mar 2023 12:27:21 -0700
Message-Id: <20230321192721.2290695-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321192721.2290695-1-raj.khem@gmail.com>
References: <20230321192721.2290695-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 19:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101624

Remove memcached from rv64, its not buildable yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index c588b8640a..7be8261164 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Meta-networking packagegroups"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
@@ -259,6 +260,7 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     ettercap \
 "
 RDEPENDS:packagegroup-meta-networking-support:remove:mipsarch = "memcached"
+RDEPENDS:packagegroup-meta-networking-support:remove:riscv64 = "memcached"
 RDEPENDS:packagegroup-meta-networking-support:remove:libc-musl = "ypbind-mt"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.40.0


