Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71BFC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:02:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.57508.1701298969578664956
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TR87oFLi;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-409299277bbso2264055e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 15:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701298967; x=1701903767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RK6raf1smLmqguspyk44wU96lD8OOAU4D4qHQbR8dC0=;
        b=TR87oFLicGcK3SdNfoVCjzfjRDmxNWwwGlNeAd61K/gS4I5Gl4jfCmJYiT2+sdlN/f
         p6Qj/aCWjdqsBlWBiCOakiOhxQjHO+b5FbSWR+Qy7jBFcT5D6FVh7HqThxXP1H9KX83d
         9A+3WGJmaPkfQmbFFAG+aslMF0z7iw+Mmi5D+tm+JLaQXHPjGn+KQSqeXB5WeP0RQnZx
         8tzLkVJxY5uudoa4iCDsUx/IgMEbajqyuFsBZVapdxUEcgqtw/pYTb6osDIVVRILEG1s
         HIhuobZzvviZqhPWyWTBHjx7jjZrKtjcd0kDya80N9BsQX3RaLhMUhsJwDYxTMUNRoMK
         AvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701298967; x=1701903767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RK6raf1smLmqguspyk44wU96lD8OOAU4D4qHQbR8dC0=;
        b=hDEth8evrLPV3cl4VJEPabrSRuruiIUv1AbxbNMW8DsetpJioMoPKmDCWOVBuGXixF
         k/XqwyOeVOe2HvqX4ttBmeRwOPOhnxirYsy4QT/YzIJGjF0t8yeh6jTke6ylhZGuQQCF
         tgLGhT61IZ3puJs3/IyDezkje3NKsiSbWBkjO7ghBIDMv4kpVcia7lQipoarHTYUDVZE
         E6Ce69t0j0bMvNoqQi/PgStsSqn9PPeRtcdbFaI14GbuJpz5M2x8AmhEN5DuJd8SM57P
         2qN9X3CysSnjWHtK50SYcKaduOrRw1oXcEglSUxcrRDs4vR5kSC1yew0j1OTGizp+jQk
         Kjag==
X-Gm-Message-State: AOJu0Yxfmb6bucZVsTOjolZnmOjsNZkd6dAJbCwy4oxbOjp0z4Kr9Soy
	19LizOX9el4gyOPKJ2nRmAM+YtQkTmnTcg==
X-Google-Smtp-Source: AGHT+IGSxc3/SwGkfaMQUMqkX5rpAvQkcVL6Gktvnxq+Zlk2dCsYLDlhgBIXv7X/+HZXa3vTDsoj7w==
X-Received: by 2002:a05:600c:4e47:b0:3fa:934c:8356 with SMTP id e7-20020a05600c4e4700b003fa934c8356mr14084333wmq.10.1701298967195;
        Wed, 29 Nov 2023 15:02:47 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id k24-20020a5d5258000000b00332d04514b9sm18877239wrc.95.2023.11.29.15.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:02:46 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] iotop: upgrade 1.21 -> 1.25
Date: Thu, 30 Nov 2023 02:02:26 +0300
Message-Id: <20231129230226.741870-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 23:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107150

License-Update: Copyright years changed

Changelog:

* Fix bug when iotop busy loops after pressing ESC key
* Change the condition of displaying processes in only mode
* Fix a bug with graphs in ASCII mode
* Show the status of the configuration in the help window
* Support ancient compilers
* Revert syscall count stuff
* fix empty archlinux package
* view_curses: do not force black background
* fixed scroller logic
* fixed corner case of full scroller
* Update README.md
* Add regex search
* Better checking and error handling in netlink code
* More graceful signal handling
* Fix bug with a missing check if a process exited
* New option to hide exited processes
* Add color to % values and option to disable color at all
* Implement the suggestion from https://no-color.org
* Fix bug with cursor displayed in unusual places

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../iotop/{iotop_1.21.bb => iotop_1.25.bb}               | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.21.bb => iotop_1.25.bb} (63%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.21.bb b/meta-oe/recipes-extended/iotop/iotop_1.25.bb
similarity index 63%
rename from meta-oe/recipes-extended/iotop/iotop_1.21.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.25.bb
index 8eebd691a..8d19c6298 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.21.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.25.bb
@@ -1,12 +1,13 @@
 SUMMARY = "A top utility for I/O"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=48e7be78bd2671d08c9c3bad71f1cfaa"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=72ad44c0841d1e759669d27744e39389"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "https://github.com/Tomas-M/iotop/releases/download/v1.21/iotop-1.21.tar.xz"
-SRC_URI[sha256sum] = "7b4862ebc93909a3f800193140ca2464e926291a9c873b50dc31fa77e6d9383e"
-UPSTREAM_CHECK_URI = "https://github.com/Tomas-M/iotop/releases"
+SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https"
+SRCREV = "9d60bb7e262e0d41b0aa3bcfaa806fa4f42e548a"
+
+S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
-- 
2.25.1


