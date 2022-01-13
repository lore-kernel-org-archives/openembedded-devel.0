Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DC8C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 08:13:09 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.6277.1642061589143011729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gD1Ozi54;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id w16so20025962edc.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=jCi4b0UmAWDyAyWgsGm1qzT+csN3RMtvw4GN3o0hThA=;
        b=gD1Ozi54t3Sld+ePZg07W5OJ9wwnGtqjAnZk1I8FgymPRXkLDRAiLq/uHX43QrETG5
         YlGWfa2xNQo2Jce+FitGyTF7LQddqkDyMoEXBQmB8BS87p0gNgyvehd6YwvgkvoAGzLA
         xrlykTpGvItjv/Jmqf0rM7uJG9XtGkMC5I+8mYidy7Gs1hRHrtV3Pgqaeqcxv77VTakg
         pIYYdljlo+710H/9O7X/FmAZA6W38FODhagWalKPNdsFvLPGpaM+V3h/oD2B8JiqsOfQ
         AsXQg7t/+qbLpeKT9cU7qeQNGlWYFgTtIlBabXTli/zxQ9LeAiG2UJwdbtYdcsT+3Ws0
         2jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jCi4b0UmAWDyAyWgsGm1qzT+csN3RMtvw4GN3o0hThA=;
        b=chjgmyyCL0X1VkTItLbTdSXQvrGW0n4L7dTktlPJW51fx6xmFtf/K0WwTfeXywQKrd
         BYoRcsseigSSiDREUTgq0zkeFNujvOXVfgPyVDl3Bv3PNzisY5Ds3hoHTI0GXfwJqLjP
         SK6xYm41vu3k9IgSiT3dCWiDnxFHMkYZnobSLWWvi6blZDKQ7o901lVe+oSNzQvGBRHK
         4bR25EpsGupSUYDI88aOwHS8191QzM2oor8tbr5P7hUmNxcLhQqBqTvWKEXKh5u2v+jx
         AmkVkXNuAgbmklijMu2jkTiIl+CSDReHz4BkgzY3ISrNrOACosMOcS+jjRxlOmnjk89O
         SQMA==
X-Gm-Message-State: AOAM531ZypYFsKJwO8v/ydiSwRVOQk3aKoBJ8vgfyLKTe8a2pbURBE3r
	m1z4axCqhSglzdDT2aeeu1sIvi+9hgCGnA==
X-Google-Smtp-Source: 
 ABdhPJwkDxX9syVn50q+I7iRcDHCPZbQycyPek5tH7XI9ID6nYDiH+dSzULc8HvX2u/PwjAcOpT/Sg==
X-Received: by 2002:a17:907:7f86:: with SMTP id
 qk6mr2687257ejc.425.1642061587423;
        Thu, 13 Jan 2022 00:13:07 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 16sm611965ejx.149.2022.01.13.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 00:13:07 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nishaparrakat@gmail.com
Subject: [meta-oe][dunfell][PATCH 1/2] nodejs_12.21.0.bb: only handle npm if
 configured
Date: Thu, 13 Jan 2022 09:13:00 +0100
Message-Id: <20220113081301.26006-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 08:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94801

npm-cli.js should be symlinked only when the file is present
the file may not be available if the configure option is --without-npm

Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
index b9e382177..22191a157 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
@@ -133,7 +133,9 @@ do_install_append_class-native() {
     # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
     # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
     # npm-cli.js continues to use old shebang
-    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
+        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    fi
 
     # Install the native binaries to provide it within sysroot for the target compilation
     install -d ${D}${bindir}
@@ -147,7 +149,9 @@ do_install_append_class-native() {
 }
 
 do_install_append_class-target() {
-    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]; then
+        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+    fi
 }
 
 PACKAGES =+ "${PN}-npm"
-- 
2.17.1


