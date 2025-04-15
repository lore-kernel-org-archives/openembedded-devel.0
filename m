Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827F0C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 18:05:57 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.1111.1744740355079734451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 11:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIxfUXqk;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ff0c9d1761so54287197b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744740354; x=1745345154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOd8K+3QeEdijXYr8isCHDrCIEFiPj/bLGFW3+K1OZ8=;
        b=UIxfUXqkon7MHvmxisou35bRrrrTXG/SS2jINF9wkxc3tn/d3XU5hUT4OYHqEKQoEn
         wEQEJJ+tfojCpjMDOl6C9eYgDkUiX0MKFW5UdMx9H5RFhjvgpfBrv4t9jNKB2X7vrcEX
         BS2yR/xPI9oQmZDB7ottGhnFZBd7BZLvuB5P3DKTdVbsu3GupT+kvRUkUveOg4JsBl9l
         MR64wQwy8QuP7DG6RUXBjgJo47FsRfqAKa+Dhsv7WxgH9pl9aW6+SsOQ1FAXfSY97sLx
         3DnexcIpOJntZMrYmfCduVHpTKJYt2MUZ5VjXV5q8vFoqDE5tnp6U8eu8ohqwPA5JYR5
         PiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744740354; x=1745345154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOd8K+3QeEdijXYr8isCHDrCIEFiPj/bLGFW3+K1OZ8=;
        b=Npo5WHaEoEnckkPD+U8YEol4RSRbDHXU4Mv3EAZxIZDKfnwhxLiWOmmxui/ycnLstM
         601ohKDkoZ2CX0DIMXjD+qUia/utlIOTvzF6PGm7zuh5PIn8PW9nYTLQ/U8qitGOJU/z
         UrSckSUoD+WHoHPia49I6P1nWxYGPQaJnucRH8vOLI8/5N0MaIM3uWEuOPz+0cEn2ZJF
         rqbxO6nSUKM5QPKaIrtjVpK5AdyD0fMLMPp5QkUyLYIsG3Jxn2QYxJezr4wiTJ1M+uG5
         UptAlvPwEbEp41waHRxH/py0huuDIqJKoNwTrIn3xQYd2k+pY4RtLjK4Lz10tBEs8O7u
         2oHA==
X-Gm-Message-State: AOJu0Yx0TA9KKfMB9pMoOkYmuE1C2ArLyrtV3Rdyp0FLnzT0ZYDJLwk/
	WC2oPdEK+Couc0JLjCEM5wwJf++mzEWwNJQOFMpGcOhcrE59ODDAPqGbIaDS
X-Gm-Gg: ASbGnctjA2YZ7XrVzb15b5UTSlV/qpXkH1vZyCPuOWdqjfRaPLwshis1uD7mTgaMiJs
	5TvS9aqir0tkRSuNqDBgy2Xj6dX5mQgJqN3hiuB7NXdy2gBnsWV6ijCtqmf/QBRtRSZ43T2qHjk
	DkMoa5TJ+f+p9lYX1YqyoRCUEB+iPRcxLF/WiHJKSkvVYtXI7sp4KiMebk33SYY0fwCh+dHTfIN
	SvvTcf4eNQT1yhG6YCokVs0Uq9Big5MmSo0is0FBufq6A4GDiNaZeXl0L7LN1BgLdXy8td30E7a
	ITuoLjtaxH86+xBC58MlLe7w0sc01iIdIomDZG2FxKFszSN6qsc5jrej
X-Google-Smtp-Source: AGHT+IEDU9u/OhAvIRXQ6I2YB51ACDq1zPgJc7ACbBzOb9cXLyAc5sujpOnz5jxYEFK+jZVRAyCJmg==
X-Received: by 2002:a05:690c:67ca:b0:6f9:50aa:8605 with SMTP id 00721157ae682-706ad1c64c0mr4373217b3.34.1744740353540;
        Tue, 15 Apr 2025 11:05:53 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e13ce2asm37598157b3.65.2025.04.15.11.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:05:53 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] monkey: Update project website
Date: Tue, 15 Apr 2025 14:05:40 -0400
Message-ID: <20250415180540.1327811-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 18:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116865

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index a11af8129a..cdb6fb605c 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Fast and Lightweight HTTP Server for Linux"
-HOMEPAGE = "http://monkey-project.com"
+HOMEPAGE = "https://github.com/monkey/monkey/issues/414"
 BUGTRACKER = "https://github.com/monkey/monkey/issues"
 
 LICENSE = "Apache-2.0"
-- 
2.43.0


