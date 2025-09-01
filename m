Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CB0CA0FF2
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 02:21:37 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.42092.1756693294144511053
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Aug 2025 19:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1Ky0XLA;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d605c6501so32661087b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Aug 2025 19:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756693293; x=1757298093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+t95gZRwk/HEtPY4kfBtL9o4t22mG26r23hrVORQGw=;
        b=d1Ky0XLAxukm98ckFu8376c3/H38OLT8lK617ds9rCYSUFRl3YI77b3RAam8zPj+pR
         QXPhX1qy2Iu6FqqidJYDIG7lIcTM5ROwfYVFW50tzOYRZd2m6xFEbmUWJ+202TmNwqMG
         eMxsG1IBqWz/IFdnJC21v8J0kj0EhKdI2kq3Z149l2iPPToMgO4gueHeNQ8DNzXkpseh
         JErBGzfVQd5ggl0mpacR2EzivQqHnDyOeUuIygkxMtRPBIKeHoz0pZwUPgqRS81Tef51
         w45Ien6AKxlvBNbqDkJrV6oAlFE/GAoug4RRZu65EJHPBqsHE8w1JziQ8wmgNbcLOQ/Q
         a8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756693293; x=1757298093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+t95gZRwk/HEtPY4kfBtL9o4t22mG26r23hrVORQGw=;
        b=iKDsFg1hSf7QrGyQ7T3/mvoxEj2qMow2X/l6jWkqovVyCZEnMAbrk8/KVX+4VzuZy7
         bU0tBaE8oIdtwgMWsL/Lci0icy3cAkir0zGLESl/dA6Zha3eNB6U7HSG4UazYS6nVCwL
         3AEj5dIOM18E38o1CFh0rbPOOinf3Czqy/+zmvIZfRBmqPYE/oFNDBSpFM54Kew8jrjW
         gGAUDpRHnf1aFB8iTtKViK9vu+kIcCjeZDYrcQ1kjayNGhviX4sY/KcwuwaGnXEN8rQz
         U72Yd6/Kc3oRKiiKt3VGaF0MPOElpMVAFG+5d7zFQTheE0GrYCb/lPoMQTvrpjjACj59
         tYJw==
X-Gm-Message-State: AOJu0YzrRQzGwxuHzm+2YmdYxeE76APWUJsNI7pRmkJXk73G7dvjBHbH
	WlFTj3VuSjgSsoXAiwVa+yHdKEWmkjF62/mARNCrG+Fm9NwAkvRM/wCUFiNV2g==
X-Gm-Gg: ASbGncvDUGfz4TB9WZjxp0/zySE6HRoFeGgWlNpv78EdBUUULYHk7QQv+JS9Rx0mZOm
	a503s1ibODg8OXOHL8TYL1W6KqYGoWNVc+ilTr/SIZRsp20TofAnp1vwZvbUy0G35ZxPY5ysZEL
	3y0glRxc0Mem+s83eiQRmBLNjt9nNGn6Cn8J9IWMnPlMJgo3ZWSXsHqxq2D+u3MidTpwTBhIMsB
	ETi16uN9l1ScG14JvbBNA39xuMeyILvaUoNENuR7acw7+MvEIs0U8SlPNASR87tnCHQKuDuXSNf
	yJqoQ9E7n7pSNSZ42xP+ECFEv039ATxiz3RsYxkXqViLU6EWoPm8YnBjUzzl1dN8/SQNUi8RShd
	PebCyQQi/FRjEu58WEOrOFUPT1jjy
X-Google-Smtp-Source: AGHT+IHdIVLeC1FsVGG9wAZFSZOrP4bZhZ/eiSnF2YxkdZP49V9U1WXoypkjlnGupx4YFM3DYe3Seg==
X-Received: by 2002:a05:690c:368d:b0:71e:7053:262 with SMTP id 00721157ae682-72276500db1mr74584127b3.26.1756693292647;
        Sun, 31 Aug 2025 19:21:32 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7227d92e437sm12026647b3.66.2025.08.31.19.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 19:21:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.4.11 -> 8.4.12
Date: Sun, 31 Aug 2025 22:21:09 -0400
Message-ID: <20250901022110.562230-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 02:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119151

This is just a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.12

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.11.bb => php_8.4.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.11.bb => php_8.4.12.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.11.bb b/meta-oe/recipes-devtools/php/php_8.4.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.11.bb
rename to meta-oe/recipes-devtools/php/php_8.4.12.bb
index fd41d5f8c0..fbab1b0dda 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.11.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.12.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "2c39c75b54df89b01195b72ad0ee1fcd490c71db18bc52bcd61fb2ffb57b26fa"
+SRC_URI[sha256sum] = "2ebd5382eb090d603087da649ed21de64b079616bc9a02abbc532b89b17e3468"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


