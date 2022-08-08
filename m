Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA369C25B08
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:08 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.26171.1659968707949884940
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o81cPmVW;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so9290973pjl.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PQeRRJH1egG5YIbEvyeH0yX0gSeniJT0nk38BjYqWmI=;
        b=o81cPmVWOPn4UpCK0/DP+ngasVC51lyrrkY6y3WPc6oeIXrsiX15aI9YeewZVyw4B7
         O9/paxqCVLXzYJPb7DQnc5ECq+1aOjYif8S0wdHULQ64djQN5QksU+EkgtkNmYG2367h
         NU+zaRFnB78ZD1zJ1Y4X+ONRcuhI4rPIyw8CCdtj0gNuTdL6owfDecqe02ngD0BMrCH5
         /e9C3gy576eHsGMbIoHCYPFF2hqgdmXZAzgQxkRxXjfXxKD2NawNPhEUGzck5GwL9p3Q
         lWY9OC3o2AE5h53EWgThL6g95K1ecFLagMV4N40/Q1OI/L6U6vIWpHt2vGdUkqHQBfbt
         7DUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PQeRRJH1egG5YIbEvyeH0yX0gSeniJT0nk38BjYqWmI=;
        b=d9aQaKNwhfBrJjL8NJz4sQNMPU7CrMNpmbQ9MIR7dtGV3/vCcUbPnhbl4o2ZnniWXL
         ljMLOhTHqtuy3G8Ocek1LyQMb1k7kWbMZil25nP7qxgjJqWmmo8R/ddY6yyZI2ASmuZm
         TqSXyMoY4RnoASHCB7VKG7EZoRZmKe94HqH9wrWFJKlaQzU8Kg+6iy+WXHuuje/y++41
         Jy8FePAkxfhuPyqrP/UsnIkV5u4nhv+kLt+gqlR1NsmO1FlGW4FkX08jYz17mIsEC2Wg
         5xBWUwfufRpUzCrYGVesvLU8Xb+YMfuCukINZO9GHOaiYJt/ATB2c0vLLvlgKGPL2k5g
         /2HA==
X-Gm-Message-State: ACgBeo16FUuDh9gNu4ucr+xqW85G9MqIFSPDITaLBKQeWCgTNLyEEugX
	14dzLi6QIer9JwxcS3WuYYvwXewBlPo=
X-Google-Smtp-Source: 
 AA6agR4lnP3eRbzvI8g35rx+dWiiBWU3IKXnP9F3SM4LnnDuWsTPl9Coph0H7UWBxEkyA2Yjm5+j5g==
X-Received: by 2002:a17:902:e5d1:b0:16f:15a1:6dbc with SMTP id
 u17-20020a170902e5d100b0016f15a16dbcmr18853909plf.73.1659968706996;
        Mon, 08 Aug 2022 07:25:06 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 06/13] ibus: Swith to use main branch instead of master
Date: Mon,  8 Aug 2022 07:22:45 -0700
Message-Id: 
 <72d3abde62f208f4f9a1e19cd8a773c93b6e6aa7.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98166

From: Khem Raj <raj.khem@gmail.com>

Upstream has switched to using main for tip of trunk, therefore follow
it here in SRC_URI as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Fabio Estevam <festevam@gmail.com>
Reported-by: Markus Volk <f_l_k@t-online.de>
(cherry picked from commit ca5f1dde541689f6a479a914ec742a3bf46dfbe1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 37a490abe0..bb662f2ec9 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -10,7 +10,7 @@ PV = "1.5.26"
 DEPENDS = "unicode-ucd"
 
 SRC_URI = " \
-    git://github.com/ibus/ibus.git;branch=master;protocol=https \
+    git://github.com/ibus/ibus.git;branch=main;protocol=https \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
 "
 SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
-- 
2.25.1


