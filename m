Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88ABE909CD
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:41:57 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15055.1771342917170557757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=MVvsOhBg;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.215.171, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c6139292ed7so278282a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 07:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1771342916; x=1771947716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uMdHF9nUeagsEy80sarY/WBcBQ5VnTIWp7WuSfG8Z4=;
        b=MVvsOhBg9hKYFAWw+xrWtA7d+Vdt2mviZDQFd12X1WbaXD9iSMq8WhpMUiTHWElr4W
         3+cGSpksLzyRI002KgGH+quiV6bKav1YXkvVz4jbepcB4l0uXjhlSwxY2yhuIoyfImME
         qDiRs70yVISRCbZDiFS3b95hj2Meg5JQAxh9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342916; x=1771947716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9uMdHF9nUeagsEy80sarY/WBcBQ5VnTIWp7WuSfG8Z4=;
        b=WVWHAjFG0e0wZu+p3n60bjt877zb4CL8P/7hPHSaUSj91MuzdGN0sKtwo9+t5uEUsq
         ePkcV5MGdwK/w1vPDGBhSfJP5K0Z4yQJR4SIArH1lP52ixkyem6kQ9V7+l54lyFLS3qp
         AhPh8ZKg6XYvbJxEM+5QsgXsCoY8G548oNwtB08RHm4Bj6Tx9uSnPynGJg3017CGJrD5
         vj08hQqpNU3xKrJ5PywuU+ap5SoM143xeQzgzX4AF0wLX7OW6MlD5CYbQGcybhtlT2dd
         EDXmv7VKwAvHt32evLqteo5I7PhI6SYqIadq0URWpags77utwiLTIKyP8ZAyuhsl8TpO
         yHDA==
X-Gm-Message-State: AOJu0YwRGB83GZCBKpAr1BOst608Ss72MNkz8I94BMylff/khR8Ovw+L
	VAiFFrWWlZPPQIJHlD2hgfMwTYM8UIPIesHEpThK4f22SSGDde1FBkZQJrM0L5E1xRZmXH4y7s5
	OXf2T
X-Gm-Gg: AZuq6aIx9DNF3owbGIzY6oodr9RC8wb9kgKT1lD1iaYAT85n/rtzyYkGaoYF2vcaPDU
	FTj7sje/gTOb3i/xsJUCNq7JOmA6vYV2nNIKQUsC8Dmg4ACYvAYgJyYjBqvzZymcWAk291Z/UKL
	suJkYqU3C4zWNRG8QUiMNNpCBByotmy6bOCy7acxHpyksOcr+MNxj6B4Kpb+/pj7vTORfuzBtm1
	uvWQbxIWrbV/67D3D1jXkIaYdFRh/IqZ5o8HDzu3SOVe4MKQTLgq4/kqFitDAmBfpPTNVvBsQop
	BEwDWe3tyXyi+iE1ALVWbViLdHFDGFKF1nIzYIuBNyXsnwehxzF0jWn4otvdX4VpN+i/Knu1pVo
	7odRG367UmFUMTuOUfIzONx+ayEm8/E2AgRl5jVKBXSlDps2ROHwSOVXqvS81r3MzEGuU5FfP+3
	P+dSuFbJ+cte6tSAZ/JDFb75WNoCJsxktcr1TY2ZBz
X-Received: by 2002:a17:90b:5483:b0:354:c3a4:394 with SMTP id 98e67ed59e1d1-356a7a88cefmr10505405a91.6.1771342916646;
        Tue, 17 Feb 2026 07:41:56 -0800 (PST)
Received: from adam.ht.home ([66.164.55.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fcff01sm10415519a12.2.2026.02.17.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:41:56 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 8/8] libtoml11: move SRCREV below SRC_URI
Date: Tue, 17 Feb 2026 16:41:44 +0100
Message-ID: <20260217154144.713423-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
References: <20260217154144.713423-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124468

According to the recipe style guide, SRCREV should be placed
below SRC_URI.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index d31ca06e77..7e097e4612 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -13,12 +13,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
 
 PE = "1"
 
-SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
-
-SRC_URI = "gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main \
-           file://0001-Remove-whitespace-in-operator.patch \
-           file://run-ptest \
+SRC_URI = "\
+    gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main;tag=v${PV} \
+    file://0001-Remove-whitespace-in-operator.patch \
+    file://run-ptest \
 "
+SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
 
 inherit cmake ptest
 
-- 
2.53.0


