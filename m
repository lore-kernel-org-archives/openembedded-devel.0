Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40BDC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 11:11:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.15491.1698145916324724596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Oct 2023 04:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q8NrMyUu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso34152365e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698145914; x=1698750714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRZ+xpfOd8Xre3mwix3Y+oVH7CMIEJkN5W7HZ0bZ3/A=;
        b=Q8NrMyUuYNOtRSDz0EAjZjBSCahZHnXfJ2FHumZnls1y6QcLp/UHjCPBQGqLm1bejg
         RbAD7Id6HDEm7TKTTG4MTpUBnTrC1lVhW1KpQ7q9kp2hsP4FEmFOeNXsIRTz660pUdUl
         3mxAJBQen40uSUd/3XgIG1VvIhmEra2hGLl7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698145914; x=1698750714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRZ+xpfOd8Xre3mwix3Y+oVH7CMIEJkN5W7HZ0bZ3/A=;
        b=sYeboJ9dSHCA3FgS9RoivZUKZLjMTg3uUrrvY229mZ9FmxoMTA/XhRyeiHs0lunp8P
         ApKiEheWOJ1qxtBgNa0K6mo4TZyu3AjYcMDJ30LzZ/T9ThLrMiaEIX8VphCJVdOS1U/5
         4T55ZkLBfRbaGBdCVJX7YLKV3hV8crqAOiy1iqmic0qi02yt5jFWx+ppdFfmR10x9jy/
         cGH79PtGViHw/1UnPbpaG5XkMbPO8jTD+R5uOW5pdQYTQi3T7Gpffoht7PepXEqMTH5z
         l0YkoucqFO70cSxg0U4x2VD9xC1uko59RN6wITntoDQJ+/4/zZx7mmy7fpy4+F9zS1As
         ciuA==
X-Gm-Message-State: AOJu0YysrNuzcb3+jpNdfpXFY7nyWoig7ImRNSQaf9gsSb+iJhqDUQsX
	5fxmtrDtj9r1PM3ncAMCo79dTDoEbJEKiUgymls=
X-Google-Smtp-Source: AGHT+IFHv4qoKCi1eYtPmJy36SaJlpeudAS0C9Cw15AaTmdvEhyBbJBrLMS36dRU0p4uwUF1MrWxPw==
X-Received: by 2002:a05:6000:11c7:b0:31f:b120:143 with SMTP id i7-20020a05600011c700b0031fb1200143mr8585103wrx.59.1698145914208;
        Tue, 24 Oct 2023 04:11:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:8b0:aba:5f3c:ae1f:6bff:fe41:1692])
        by smtp.gmail.com with ESMTPSA id e23-20020adf9bd7000000b0032d893d8dc8sm9800414wrc.2.2023.10.24.04.11.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 04:11:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] meta-networking: Drop broken BBCLASSEXTEND variants
Date: Tue, 24 Oct 2023 12:11:53 +0100
Message-Id: <20231024111153.58050-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 11:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105718

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb          | 2 --
 .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
index 0c9ccc810d..7685cc9287 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.bb
@@ -88,5 +88,3 @@ INITSCRIPT_PARAMS = "defaults 30"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --shell /bin/false \
                        --user-group mosquitto"
-
-BBCLASSEXTEND += "native nativesdk"
diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
index 004330e1b4..341eab015c 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
@@ -33,4 +33,4 @@ do_install() {
     oe_runmake DESTDIR=${D} netsniff-ng_install
 }
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
-- 
2.34.1


