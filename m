Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B9CC531DE
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:28:19 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.7796.1723303690505066167
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PpJ7hE25;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-690e9001e01so30059117b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723303689; x=1723908489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ9i2xsVIEbG9wYpboqgbae9HYinXMpK9Vfx5uiSibg=;
        b=PpJ7hE255dPFN/C3iU5kSNS1PXCpDQqbrH2DOubvG0/QmW7qSTDI7SW0/aFZREUSuY
         EEH9dTiDIqNLW5ajc3hRqw//LBDzfKjcrECbKvE8dw/IRuO4bXRdHRQaCMk57kdIr3SO
         M2O4C1J2lGL1ACiO/uCLgADtg7EcUlYiMLsrt0yrfyGx3dIbJmimZflkQgOfW3Gvu/yi
         /EMfqM0MvPaTohks54AjjaprOQLqwQv2ulFxp9HAil7q0jJ1spZOu70d9TgTp/odQVUU
         B52wYUFqSHLVGXzXo1H7EGtrZihkjC/rttnRhDwNmKRXhkVkhxZqRRPJU54gMcw58R33
         ZHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723303689; x=1723908489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ9i2xsVIEbG9wYpboqgbae9HYinXMpK9Vfx5uiSibg=;
        b=sEWOHDo0voUjrE+SenigSKJD1PTZiTmHjvKuhCwVk0+pdGTSweTrbNTqqZaDgrunF7
         8SSnb0HmjJbE3XDMKE1dVouN/gHxSAwk2VXUIN0N4sMp//YG56TBipz/ropOHwFmWKDy
         6SoUZxlvsgfwJWgNwN1tteiCn0hv+FG/UPCzkFjhsgqL7ZtUpk2GobzD5IQYtZjpruQX
         NZmGTfwHmKk64pL/ZWQh8dvHiSWxcK9V8Q6RROHpZ/RwWgbOG1anSlpU1BNpYaijNH55
         sIXEQEg2jMOekEdE+SCnO/RUg4hh+vuOENxZxz5pC6GbpDaI2Bdr3yg+vqHwJgF4aLrn
         8b6Q==
X-Gm-Message-State: AOJu0YxXnDcMzrESwo9Muu4p66xBNF6Udqm9XV31Q2awncl/2O+22QOs
	aL8WuG2USXek7qd9FcBlQgmLRLvIbq1MA1JBRLphL4ihqw34WkHRzyN//w==
X-Google-Smtp-Source: AGHT+IElNlOeFEDNfu49T8Th+AKFO3gqche4hvfNP3TksVLYj0pZsU1/IU9sMl6PPHgwosm5lFPf4Q==
X-Received: by 2002:a05:690c:17:b0:652:e91f:a1bc with SMTP id 00721157ae682-69ec482e37bmr51760147b3.3.1723303689476;
        Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068cf32sm2848947b3.48.2024.08.10.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 4/7] znc: Fix buildpaths QA errors
Date: Sat, 10 Aug 2024 11:28:04 -0400
Message-Id: <20240810152807.899873-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810152807.899873-1-akuster808@gmail.com>
References: <20240810152807.899873-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111741

From: "J. S." <schonm@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 28d77dddad1c86ac5771859e59504e662eb68813)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-irc/znc/znc_1.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
index 1517384eca..68dd0702f7 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -29,4 +29,5 @@ do_configure:prepend() {
 
 do_install:append() {
     sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
+    sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${bindir}/znc-buildmod
 }
-- 
2.34.1


