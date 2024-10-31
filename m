Return-Path: <andrea.ricchi@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1780FE68963
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 09:22:36 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.8426.1730366548817677016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 02:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=CigstnX3;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.52, mailfrom: andrea.ricchi@amarulasolutions.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c94a7239cfso469265a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730366547; x=1730971347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UdVzuyc7h6ljQYFp8JYIENkWpczkr0q6Dx7+3YPFJD4=;
        b=CigstnX3drDdSw7k5nfCZxutxELG9dAmzkA/539I6+pGLbGZ1IyB0Ob/4cKDqY/wmO
         kqtAU2BH/I6VF+8nnq8SqDdCYxMc/F445LFTeNymGq+0WAnbN2nzh51VIKD9omfSuKy1
         4t8aAb1WuUgjW4Oq5qRWzudm/KFcWjA192Su4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366547; x=1730971347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdVzuyc7h6ljQYFp8JYIENkWpczkr0q6Dx7+3YPFJD4=;
        b=ahbE5W9WXghXZyk7nvmpy4rarWhOBnwmlXgqs3jbIt/+Yd16stDFcLmmrDOJXDa8EJ
         0UmnkkXiG7uIZfER8iW+6NnOSqGlhWU8mwrPXiB9oJzM1AT8shIY5JeeUa0MjtnxCAzM
         F5XwoMl2Qaxu+6mGMChk6SZYZbKiuVLrlL0p1nZc8GngAH0petqoyst35Y2m9NoVaoV1
         SmdddUBHPZzXZ5LsWML1z3RQAPNOftPc9Cn6zMXZ6kVlZjM8jStsZyqgKdOvm4L06SkV
         wY9uh2G0/Rx/mWxPiFUmyZCHTTG6ihajN2L07MlJHQnUSaBJaVnEPwHnECsO7ObX2TcV
         xSOw==
X-Gm-Message-State: AOJu0YyCoYPKfSAIKiRacbNjwfNeVTiK7LsbbHtm8oPa3F/icuLw89Et
	/avxxMp6VRzPU3gG/Zo29udxEOJSxoeyrHU/al2r9bI85vOnAi069B8fO94iSj+W7/eoFBRTkLS
	K
X-Google-Smtp-Source: AGHT+IE+zuSc/ihkNZwefHgJ7NGjm0qNnBmBFfc7tZHpHkb1zK1DJasCmZhsBw0OVGPSuJHuOCtsOg==
X-Received: by 2002:a05:6402:51cc:b0:5c9:a5a9:1167 with SMTP id 4fb4d7f45d1cf-5cbbf8a4198mr17563851a12.10.1730366546766;
        Thu, 31 Oct 2024 02:22:26 -0700 (PDT)
Received: from RccLenovo-T14S.homenet.telecomitalia.it (host-79-17-249-140.retail.telecomitalia.it. [79.17.249.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceaca8a809sm360682a12.48.2024.10.31.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:22:25 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Subject: [meta-oe][PATCH] asyncmqtt: add recipe
Date: Thu, 31 Oct 2024 10:22:22 +0100
Message-Id: <20241031092222.16328-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 09:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113357

async_mqtt is an C++ library for asynchronous MQTT communication.
The library is header-only using C++17 and Boost libraries; the main
features are client and server support, MQTT v3.1.1 and v5.0 support,
continuous packet sending and auto acquiring/mapping topic alias is
supported.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 .../asyncmqtt/asyncmqtt_9.0.2.bb                   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb
new file mode 100644
index 000000000..dac83065c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "MQTT communication C++ library using Boost.Asio"
+HOMEPAGE = "https://github.com/redboltz/async_mqtt"
+LICENSE = "BSL-1.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https"
+SRCREV = "51a97adfd022cf5205c3bb31f38ace1f7fbd21a1"
+
+DEPENDS = "openssl boost"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.34.1


