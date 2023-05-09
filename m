Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C41C7EE33
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.25852.1683616027849204238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cbTvFj1L;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f423521b10so15241985e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616026; x=1686208026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFnMjdKHZrQ3dzidaWecklZb5uZ2WxXnRul0G3BsTfQ=;
        b=cbTvFj1Llwgq5t8hTrWemDiDW9UCJLHb7zibPMJmOrRac+5tv81cWRYjPal+kvc3k0
         luJ7jnRAVwkv6XxAcGfmJkHxqIEj9YpGfBtPa+0AD2bGEKUkeS8cjfbG0F4XReZ+EjvM
         YTRgsCJiVVn17ySQ1jnekREh6yTpjTqpnBTUXXXVVoyYU3n9aNBwD4FU129LpHKXZUHk
         xc/MazadfIZ9NnG6Rlcsa3lJ6uE3I2Zi1M4oCul4MHJICc/UImQr64IiSqNPg9hbSmsG
         tCvE6w8EhvVTryn7rOaPN9OBP+HBQ542jE9ir7XcvD7RRF4u2FcmcS1pjPoWOIHon+t1
         IZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616026; x=1686208026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFnMjdKHZrQ3dzidaWecklZb5uZ2WxXnRul0G3BsTfQ=;
        b=hqi8G8NpoVWzCLFMWVqnLCDUtjA9uuNuobzX01f+9496053W9UDlq4fZlSaxoSUs43
         JfJV/Tjo40SD+/hucIzYLRHgdGXmxnELc5nGDhKLNbCD8U/NT2cjwudHwOGqXXb93c3h
         EqAnQr1eqWnOT/izx5d2ZE0VmlNRfhYgE05htcRnn21yZ2hTgPBA0BmAtzOQoLFrslhV
         Lb0tGp5X8Ea+a7xyh7FaI8tCW8Ih3WPKuA245ekCQeKDRiTmsRW3TJilGY58tjAyjsKW
         0Afa0oUNnaGAN3VcpIS7QCZurSib8/Y1fULZ9i2Xons8NhSl3RV3lrFiS2GM75Msv9Ss
         yQZw==
X-Gm-Message-State: AC+VfDyWeAo1gtqC/ZodazxkrX0eLyqtvmfV/CBp/tV5iTwrbSCm5SQM
	IDgll5A4OqGEUTiXUDF342Hcl3oIfMo=
X-Google-Smtp-Source: ACHHUZ5Xiot89gUVGKlDWxamRkdfLorMY9zJSSOqLeuNK32taxYYhNGbksMbAAmz2XWMud+7ZbEqhg==
X-Received: by 2002:a7b:c44d:0:b0:3f4:2438:31ca with SMTP id l13-20020a7bc44d000000b003f4243831camr4202825wmi.26.1683616026424;
        Tue, 09 May 2023 00:07:06 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w3-20020a5d6803000000b00307a83ea722sm201488wru.58.2023.05.09.00.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 10/16] cpulimit: fix do_install with multilib
Date: Tue,  9 May 2023 09:06:49 +0200
Message-Id: <20230509070655.70784-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102478

* fixes:
  DEBUG: Executing shell function do_install
  install: cannot stat 'TOPDIR/.../lib32-cpulimit/0.2-r0/git/src/lib32-cpulimit': No such file or directory
  WARNING: exit code 1 from a shell command.

* drop strange 'g...@' from SRC_URI

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
index 86a58beda4..58e4fd6e88 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
 SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
 
-SRC_URI = "git://g...@github.com/opsengine/cpulimit.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/opsengine/cpulimit.git;protocol=https;branch=master \
            file://0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch \
            "
 
@@ -15,7 +15,7 @@ do_compile() {
 }
 do_install() {
     install -d ${D}${sbindir}
-    install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
+    install -m 0755 ${B}/src/${BPN} ${D}${sbindir}/
 }
 
 CFLAGS += "-D_GNU_SOURCE ${LDFLAGS}"
-- 
2.40.1


