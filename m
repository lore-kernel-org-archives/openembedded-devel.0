Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6714DCA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 22:43:36 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.6993.1755643406760716245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 15:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jKfFsZQQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71fab75fc97so8554227b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 15:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755643406; x=1756248206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3e/LYeCuaUo1pHVWzDjYe+sFM0lFphRQm7/8mNifuec=;
        b=jKfFsZQQSK1v7HBgzHnK1l98X0TUHbdgCzHC4CcO17qkkqXggJjXb6l5NG9BjG8U2N
         AErs5J6ASA38QnBWsFvqwqUoyL6LoEbr4L94KC26oKHcP9vpFh+hElynXCEK6XlsaqyJ
         12K42AGzuCZNlL3Mv6gfYSUOgPAJiw9y/KiR86Opin8Md6UIeUXPdwuvuOclo0Mjx792
         tTkiHrI/ANXbJ3ufkWLesyJup28pCJ6+ABvlCMkZTO4F+pe2GAQ2ujBlN8BCMxBvpTEV
         wMS5mQO5sF56ZpYRJpCnCcRM/WD4w6BKFy9XRzj7cI9/b0AN9DuIGoRf6AOFCP5rUC6z
         La+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755643406; x=1756248206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3e/LYeCuaUo1pHVWzDjYe+sFM0lFphRQm7/8mNifuec=;
        b=WLYvfiaIUxfhv2Sly66Sf8Thq0+zvsMVRwv6DpeokMOT9ZGXAKtzFIqjp1zTYD+x5G
         /9tDULwLIgvDsvHr3PTdopNua/fI2r5U6uWzdi4CSo2lF/RMPCzRL3mCc9EeC5RcAPxJ
         iAxBoxN49OZwXJcV6Da6YO9eYEKIN1cmDoWvl7mv0zEgUrftsJ/XAIzN3qfU7MQlyQvm
         UXG34s5PSbAyvBhzinJiurDE5xzUR5WalNbWT925AGeft0zJctcg11sHO9J1E12JfIOf
         XLNOuDFA10rHE9KZVPmjyyBEgnx3sbpom/gIn9oP5rLBxH/Q7Yj/CcKHNTDz6g87sFSO
         2kbg==
X-Gm-Message-State: AOJu0YzCmXukwzk9gMcAj3U5TVkyzmwlq0fDC6npRHo9AtpbpqSWSWwe
	NO1hARVJ8OJFmJHmgUbJ+Lacd7jxLBaixl/0uAYx/pnL9PQi6dDekh1PDZ003g==
X-Gm-Gg: ASbGncuhpSlI98CJnEASOAeLr4R6cJZKfiPw2vvjmjERgj7MAESTrxEFhGPzr4iEQ4Y
	Qgb+4crJMqS8iou0d7ud5VbAeUte5yuKf1QUIVnPTiQ1s5gIlLjSQu4SNIyDNgIeg1tgkjQ2nmS
	HaXnEYvdwqfZFQ7pqsaA7lLQFed0HMZsXuyHmJ33xDxA4vXVXpubSn18keUtjWugSKdFrPo7vmH
	TbyA2peFmSTEnVoD8We8jmoZ2hhTXUIEJ46c6JKzKdoB0gqiZshFK0+gFEPv5pp6NIEmjbqtuFh
	rc9iB4msxBSZ/6DzcOYKjBUmFT8RQH5TWE/r+dHssBqkL1MxsAZX/Qg5rnmew0OBXXTOj+37W1A
	k5EpL6166ixgMupeuUCMHCc8h2HW2
X-Google-Smtp-Source: AGHT+IFDiNSmmsLxOXyBkzDFMK5zloznXkbvlMYBtTl3oqZPEirBwtH9D5jw5PY3gqKvmJyEYdaftw==
X-Received: by 2002:a05:690c:708f:b0:71c:2173:51ae with SMTP id 00721157ae682-71fb3235ab9mr12176297b3.39.1755643405270;
        Tue, 19 Aug 2025 15:43:25 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71faf1e1459sm3571477b3.60.2025.08.19.15.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:43:24 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.4.10 -> 8.4.11
Date: Tue, 19 Aug 2025 18:42:12 -0400
Message-ID: <20250819224212.264050-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 22:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119009

This is just a bug fix release.

Integer overflows, segmentation faults and memory leaks.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.11

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.10.bb => php_8.4.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.10.bb => php_8.4.11.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recipes-devtools/php/php_8.4.11.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.10.bb
rename to meta-oe/recipes-devtools/php/php_8.4.11.bb
index 4ed5d1e4ff..fd41d5f8c0 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.11.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "8815d10659cde5f03be4d169205d62b7b29ed0edc7cdd84b6384cda0310c3108"
+SRC_URI[sha256sum] = "2c39c75b54df89b01195b72ad0ee1fcd490c71db18bc52bcd61fb2ffb57b26fa"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


