Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EC2C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:10:55 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.51462.1699017046571556019
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=ENM0OADQ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.178, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5b3b17d36d5so27319807b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1699017045; x=1699621845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQbdv2pjVYnIeJc2yG64vH1Z6hiWH/oiFWyg3NV6EQ0=;
        b=ENM0OADQzZxJrxZ4jrnfpof6atIgNO+8p9B/yXIjlrOZqZzVS/WXOodfymlc6tTvml
         VfSgL3RHeRUsHztgUpnHhMcDx+lovM3iWRZ+FTMub2d/dKp20sWjLYfUoBbobfl2aT5I
         BfdXWG5NFQ/5URyykdlJUjwLNkgXaccYhUrHdRnVknGZXpfeMFBh/cfewk12cR0WuTHM
         Gy8Am3yO++lk8/Q7gEiQhh28ou60vJiVGeVp2wnMCtok+Lqb9FIXAL4p5p5jf9h2b7oK
         8GI5VpgguvD+Sa7GHQQ4L+OHvzZQrMFB0TbF/O+Nd5bQnMARIyVmn11JkRO3U5/Ha6jG
         RXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699017045; x=1699621845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQbdv2pjVYnIeJc2yG64vH1Z6hiWH/oiFWyg3NV6EQ0=;
        b=FnQL5lm4DKjFjU6uiTFPXw0MCGHu7M7wawATDT+wLwqjcUnscbmFSIF2QwPQYbrwVx
         ptisj/YaQ/H+Thk7O0h94qmc6ci3X4y0HIGNgoXigYnHz4ii2dJjLc6R+E7w8aWYDeoz
         ArJ8YLbbwwsqoxyVeqjGdi1HnYngbxbdyKu4qGBLQbs1fXiHZFjrI9IabROkzinlKCwt
         meRC4bjcpw0pjUIx8Zc3j3fuI7KW+L1UdNpu8IGM9bl4g+M7vhUb8B6x+s4fZbnhfyOP
         t32jUIPTqLF9Gyhdjkd5DMz20+lON65t65S9+sw/BtP/WX6HCntIGEcCqWQELITqPzeX
         Yoww==
X-Gm-Message-State: AOJu0YyYGAPSQq62byvjGLG2foTcu3BWigEzOMC39JvYrXkqcUYF/Gyv
	aoMGueDWZWHaXxCOtuRulJxWUT0feervKpG/zwmEVg==
X-Google-Smtp-Source: AGHT+IFrDJRkDqP1jx6eUYTl4/UqJmczSkfeA9FfxWUUb/5BOQGzLdBzdGo96JINCi0Jb+iHDrN13g==
X-Received: by 2002:a81:9b83:0:b0:5b3:f93c:d55 with SMTP id s125-20020a819b83000000b005b3f93c0d55mr1942379ywg.4.1699017045481;
        Fri, 03 Nov 2023 06:10:45 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id z145-20020a0dd797000000b005a0f9718a5fsm894927ywd.78.2023.11.03.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:10:45 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 3/3] python3-zopeevent: Add Zope.Event Python Recipe
Date: Fri,  3 Nov 2023 10:10:37 -0300
Message-Id: <20231103131037.2997335-4-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103131037.2997335-1-arthur.oliveira@ossystems.com.br>
References: <20231103131037.2997335-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105860

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit adds the python3-zopeevent recipe, which provides a simple event
system. It is licensed under ZPL-2.1.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
Add PYPI_PACKAGE to fix fetch
---
 .../recipes-devtools/python/python3-zopeevent_5.0.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
new file mode 100644
index 000000000..4d914c63e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "The zope.event package provides a simple event system"
+
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=72092419572155ddc2d4fb7631c63dd3"
+
+SRC_URI[sha256sum] = "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda6955f96bb9b91e67cd"
+
+PYPI_PACKAGE = "zope.event"
+
+inherit pypi setuptools3
-- 
2.39.2


