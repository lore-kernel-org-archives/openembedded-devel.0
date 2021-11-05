Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343CCC433FE
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5336.1636118167291945957
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lbd6AUFN;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id y1so11028276plk.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qJIGXstPSR45k6De55/VIpEBHSqfbjzQoSLcaRaKoU4=;
        b=lbd6AUFN9zlUW6wnYBiD4PDg8V2zVE1JTjJaTVp2twDQYt12bOSXR/wmRj6LIOXeDZ
         BeOfTrU3J64LLtNuZJDfmjdQHu8BCxixMxn3en0dhy6lrH5o5h1adOzR9BMDGMVVrETy
         tfkJJ6VRA08m8rJU3lXqwhwUEK1dziyEklaT0SeTq7yF7/EtHEpm0ELFgUqNn+cnj17g
         5PUVJnBptS4tl1UGSpgh5lGqx458suWc/mmU7yme1ZRQlEtCRB4lEV1bPJUQl94y7Cnx
         1rV0VkPEszX3AZHjuG75P1h5G0deIm8N8J6MONTAoGP7jc4b9B10LgYr3l9I33ng3/j3
         V6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJIGXstPSR45k6De55/VIpEBHSqfbjzQoSLcaRaKoU4=;
        b=F3910hlVNcCkucYTdyuepKz29ioquVvI+r9mUZeiCx7EW1Ic3AGX+wkstZWpUvlXDm
         zch24RgtEMWo03Hz9qpBXKjoSERm6VgTZjdgZFEHkXM6DyKfgIfa/uXPU5ur3my0tWXG
         eWgsQMxedStAm9/L3Jfok2fB7+a23+fG4fqxwgRVgDkSjvW6rmzFNPuF2Pxo0kUzm0QX
         RFMkQ5UeL4PFFK3ZS8Yfmd2UEShhAJftgFYLatlRXXhTx8y0rr4jMDeIFujJMET0cB/J
         9wn+xkfRXqOVwN4X2aXqiiEtcwUZKTz4R4awMeIWc1gkSOsNtoq/BR4QSKdp/wOUYjyA
         GN8g==
X-Gm-Message-State: AOAM53221tJb3D9UeyVxhrH3LP5iQkBhwfuSC32XgknzmpYGFdxHZeFH
	e/maggIxH0HDYJGzkZKscPI8Fu6w0oE=
X-Google-Smtp-Source: 
 ABdhPJzK8Arb6rx00ICVXI6In9QD1GQtSbyBasdGXAlltnPmqmftzFZf+yJdbR4fXHCoMccZksZf4g==
X-Received: by 2002:a17:90a:cd:: with SMTP id
 v13mr30178924pjd.81.1636118166405;
        Fri, 05 Nov 2021 06:16:06 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/10] android-tools: Define SRCREV_FORMAT
Date: Fri,  5 Nov 2021 06:15:52 -0700
Message-Id: 
 <9298852a912b1ad1d3f6c71e615c7df3e64f8248.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93837

From: Khem Raj <raj.khem@gmail.com>

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index fb6125e2a5..ef440471bf 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -19,6 +19,7 @@ SRCREV_libhardware = "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
 SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
 SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
 
+SRCREV_FORMAT = "core_extras_libhardware_libselinux_build"
 SRC_URI = " \
     git://${ANDROID_MIRROR}/platform/system/core;name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
     git://${ANDROID_MIRROR}/platform/system/extras;name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
-- 
2.25.1


