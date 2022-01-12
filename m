Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79D8C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 08:41:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.20662.1641976883227340291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Obqo5FjE;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id e9so2829081wra.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=3kF90c7WSmadAaC0XJd05UU6ZY/63eHt+FWqYuAXwe4=;
        b=Obqo5FjEpTd7WecDr/QSOOX7EX4H7KNvm4m2IbfVuRtTMF11H6Bwi8RlmWlbl16JVD
         GpVAwXD9aXuwdigKjF3bpO0/zb9mawq9Pp+ggykfek+Y4cWeGItdr/hn5I8KwdZi37Jo
         oM0HGFzNtRPmXAhUlImb+FH9fyTKB7VyXrUsfqe6X+5DGRtB3pcshQgJSh9vW1iWd4wx
         dQlvdJjPrIbH4qsW9kgRpH80jKq8bctCy1zdkijm1wKNcUiQZaX8HqXjzgoVyRV5q8PL
         1Fr2kK2N2XqCKN8TgtTdG7zm3mmvyesUHZ5XsNyhDHTHaxfBxb4v7MvI7V+9KfkEWA9Y
         +IpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3kF90c7WSmadAaC0XJd05UU6ZY/63eHt+FWqYuAXwe4=;
        b=TeZ5sV3SgKqqRL3flaaKaXyoqBnTtWJjWPqQlR+4nRNcQlVLMDQFgGxqlW5dTkuGo9
         WYkFk4J+CRKk2BVsNZpufhmQw35xFWmQ1cHywlrHRudwxWTAVR478Sy4hKvpIDUkE+2q
         RI8k7xfBeTDjAs95bWS+q/sLipkcvPFCdCmeg9p2VnaZeLHQAGHzVybX5YR0tvSEcBzU
         dma2769d5AFuV1FdzOT4uuyVvGPwulGLOwr2G42HXLKrYvw/fEP4oVgkXsG/QJJ3FfVk
         w2xfjy1lZlOyP7xd7S7jKfoAn+B9Bpa9Nej1/zz5s79YNgZdrp3I72Srwa1b7exaU19o
         hyzQ==
X-Gm-Message-State: AOAM530rIQMq0UprbVz01fja4pqUkqyBd5CBo743YzosgX2wsZtADgx6
	L8Czs076PrIgJrSzWpSrFgToLZYNEhdkJA==
X-Google-Smtp-Source: 
 ABdhPJwTaZwcmh4dEqAkrelprRB7Wa03sXkc9oKp2SJcMJHwv45yli3e9Xb9L83YRMxiz+wg4tU04Q==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr6369982wrz.437.1641976881606;
        Wed, 12 Jan 2022 00:41:21 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 z15sm3559757wrm.25.2022.01.12.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 00:41:21 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][master][PATCH] nodejs_16.11.1.bb: only handle npm if
 configured
Date: Wed, 12 Jan 2022 09:40:57 +0100
Message-Id: <20220112084057.3527-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 08:41:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94780

npm-cli.js should be symlinked only when the file is present
the file may not be available if the configure option is --without-npm

Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
index 11034420a..c8d942538 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -175,8 +175,9 @@ do_install:append:class-native() {
     # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
     # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
     # npm-cli.js continues to use old shebang
-    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-
+    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
+        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    fi
     # Install the native binaries to provide it within sysroot for the target compilation
     install -d ${D}${bindir}
     install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
@@ -189,7 +190,9 @@ do_install:append:class-native() {
 }
 
 do_install:append:class-target() {
-    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
+        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    fi
 }
 
 PACKAGES =+ "${PN}-npm"
-- 
2.17.1


