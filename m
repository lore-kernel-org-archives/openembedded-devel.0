Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34835ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:57:04 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.67684.1661756214817469019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EEOuPeJx;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 12so6904763pga.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d0XfFHihTLC5GrC/wnD5JQH+FZG0f5swEPPTsXn/Dq8=;
        b=EEOuPeJxbVXvxFeHtRnQnz7MlqL60N4/12YPgOXYTH34nIQBz7qs3KvvD2gXLgLOTg
         8Ts0bEUE1+4piP8pHr2BBrr2k5Hz4u4faSMP1NbIr5yshI5krA6HnpNK3Fpq5d9lJcDZ
         RVX/2vNX2u7pz4mqEpTMT4/IenCeBrS9czOiHLwAl2UqJbqqIz6qRruIFup/hOyOa9+p
         K6+K33jDz9+byd6+8+yRWBH1eQRSWhULTPUqlsyGQ4QdhRkyqLDnGb0v7v5Is03IOmYS
         kc8yaIwQLVwXybq2jG4F+RSRzjR0H6ddqFnSP0kfr6rZ34RSobLvNzq4I5tswyPKgM0F
         mtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d0XfFHihTLC5GrC/wnD5JQH+FZG0f5swEPPTsXn/Dq8=;
        b=O6KaQvbk4mq26n1kW5Tyh+rHFwDhGCuZuS/qpjB7Wrt7t/os0/p8LJj0LyaJuHVu0m
         755VCdbs5Bve2ergFi42Bm3Xi2WrLSbfY4Z48wSLl1/gD4BvWXDud798jHNoOry8VT1f
         y3kROnp3YekoQvXLa9x8i8sI3IzHzSB6RoxntYRe7/2Q7LhTMlRG5HHbr31V1HTt4fni
         Z+NeWBG40Y0dSIhLJMxz/paTWbrb9YXSHmA7DwdF9k8Ha5R2mlPkwname4a8rwglXE8+
         Z6S8dMN5Iho5vId28uBDk6qr9jlxL+alIS5A6UbeSwFeu291t5BW1yfAWrV0aDv7AY5b
         R81w==
X-Gm-Message-State: ACgBeo25YjhQYZEFHCrQDBKggphG3cMLdgnPaZ6H3A2zpe9dvkaJUp7S
	uiZhShycgCt7DuuWsiu4i+lCAG1Yc3IvqA==
X-Google-Smtp-Source: 
 AA6agR6gUYfi6lKG8MbBkv0S+p7q28CuXDzO4FyiDsFR7Q9Rpe0ZfN7CMNKUxSAfcxAkNwAqbxwS/g==
X-Received: by 2002:a63:4f10:0:b0:426:9c61:5e48 with SMTP id
 d16-20020a634f10000000b004269c615e48mr12552856pgb.360.1661756218196;
        Sun, 28 Aug 2022 23:56:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b0016d5b7fb02esm505489plf.60.2022.08.28.23.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:56:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 7/7] monkey: Fix build with musl
Date: Sun, 28 Aug 2022 23:56:49 -0700
Message-Id: <20220829065649.808556-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829065649.808556-1-raj.khem@gmail.com>
References: <20220829065649.808556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98518

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...alue-instead-of-address-of-sin6_port.patch | 30 +++++++++++++++++++
 .../recipes-httpd/monkey/monkey_1.6.9.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch

diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch b/meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch
new file mode 100644
index 0000000000..f4bab49aa7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch
@@ -0,0 +1,30 @@
+From 7f724bbafbb1e170401dd5de201273ab8c8bc75f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 28 Aug 2022 14:24:02 -0700
+Subject: [PATCH] fastcgi: Use value instead of address of sin6_port
+
+This seems to be wrongly assigned where ipv4 sin_port is
+equated to address of sin6_port and not value of sin6_port
+
+Upstream-Status: Submitted [https://github.com/monkey/monkey/pull/375]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/fastcgi/fcgi_handler.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/fastcgi/fcgi_handler.c b/plugins/fastcgi/fcgi_handler.c
+index 9e095e3c..e8e1eec1 100644
+--- a/plugins/fastcgi/fcgi_handler.c
++++ b/plugins/fastcgi/fcgi_handler.c
+@@ -245,7 +245,7 @@ static inline int fcgi_add_param_net(struct fcgi_handler *handler)
+             struct sockaddr_in *s4 = (struct sockaddr_in *)&addr4;   
+             memset(&addr4, 0, sizeof(addr4));
+             addr4.sin_family = AF_INET;
+-            addr4.sin_port = &s->sin6_port;
++            addr4.sin_port = s->sin6_port;
+             memcpy(&addr4.sin_addr.s_addr, 
+                    s->sin6_addr.s6_addr + 12, 
+                    sizeof(addr4.sin_addr.s_addr));
+-- 
+2.37.2
+
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index fff406a3f2..5b7e32733c 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SECTION = "net"
 
 SRC_URI = "http://monkey-project.com/releases/1.6/monkey-${PV}.tar.gz \
+           file://0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch \
            file://monkey.service \
            file://monkey.init"
 
-- 
2.37.2


