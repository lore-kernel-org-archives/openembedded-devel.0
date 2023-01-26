Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A40C54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:05:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.86296.1674767131454815768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HARCaDfT;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so2929539pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9TqVYIAv8k8ZJTQsn1lflfD4ovmsOxVElP8c1+xR90=;
        b=HARCaDfTlNxWZD8jOrM9Id0Hv8rlLKJxu5Ow9g17Ll2iZI4+h7F8XdOguT2A4O4/ga
         mykISC9VwfFjK1C64dkoeLKextMeIyq7FB2uvkdJ1WA7YX61baZckIl5duLj4oqCdfh9
         aoN506C2hqA/TyvOxM5PQkol6LkR0/MxzL1qjXoSxsuMp79BryM3EoYRSX/TZWeYY4qj
         RbgXQXBWePhDM4Ix6xmkmpeVSJG0Wpdf6KunlZwK/CsLEraTFHnLwZXqsBPlw2/z7qSE
         S4tiwMmVFPoD8iIDTT9Q6tUB3GkY24+UEONYbu/TIyzCmZD8/Eaf8aGptVX1Uqs6LNL4
         uSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9TqVYIAv8k8ZJTQsn1lflfD4ovmsOxVElP8c1+xR90=;
        b=m1otytyca2f0wNJyS6C8UWIhM36BM52whFXICPFuLMqOteFRxRaP7ca5cOjoOLS8hA
         hA+a3mVbvRnVzSYEnbXk22lvlH2YoHRCeT+MQEyFoHpgh5s8Yw07rf7AwLi6P/TcWjh6
         8qt4J3ei4n+u61CwT6tyx7TQ0ahDpeSnZ0c7XtdodR+dx7J+mawNoLHoJ8RCJ29zuD1k
         idnv+4P71nF3HhaayJMCP58GvqOFVrYlDIFkHy6mhHY8KKPJgDYFJte5DVOSYPJycrkT
         Xdpp+Xt1nBwlkF7kU4ZND7OUB7xnp4AdmiGvQHr1yd/XuQCjA89/vBjFtGhDsRuPE843
         CNfQ==
X-Gm-Message-State: AO0yUKVP1S2p0MRHm66h/rmIW6wxxdu3nAj9fQ/DiE/R1th7WojyB2Q5
	JgO4aayrgLCmooZioWCPeVF1uiEjxjjXGQ==
X-Google-Smtp-Source: AK7set9UBg6nhSTEfeweI7vyWbiPndHhEqd7IXm9DtGSxerWWvc+1TsyMsmwZ4xYsBpSP2kukr9l1w==
X-Received: by 2002:a17:90b:388f:b0:22c:f1b:bdb1 with SMTP id mu15-20020a17090b388f00b0022c0f1bbdb1mr6680897pjb.3.1674767130396;
        Thu, 26 Jan 2023 13:05:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a94c800b0022bee398e09sm1503847pjw.4.2023.01.26.13.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:05:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] hiredis: Enable SSL/TLS support by default
Date: Thu, 26 Jan 2023 13:05:24 -0800
Message-Id: <20230126210527.2815542-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100800

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb
index 2ff4946883..dabca322cc 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/redis/hiredis"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
-DEPENDS = "redis"
+DEPENDS = "redis openssl"
 
 SRC_URI = "git://github.com/redis/hiredis;protocol=https;branch=master"
 SRCREV = "b731283245f3183af527237166261ad0768ba7d4"
@@ -11,3 +11,5 @@ SRCREV = "b731283245f3183af527237166261ad0768ba7d4"
 S = "${WORKDIR}/git"
 
 inherit cmake
+
+EXTRA_OECMAKE += "-DENABLE_SSL=ON"
-- 
2.39.1


