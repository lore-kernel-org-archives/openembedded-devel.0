Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0560FC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 09:15:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.21237.1641978946636773827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AbfMEKvh;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id q8so2902180wra.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=jCi4b0UmAWDyAyWgsGm1qzT+csN3RMtvw4GN3o0hThA=;
        b=AbfMEKvhSgMwcsWnk9vlJcNme5DFTzH4a74zFrK6LdmDaHl92yhpfBI8rypLsTU7T5
         jGSKVWFPJdIPnFBfIyFaZBTZwS/RE9NeEO5V3KqE3cwdXiRh9YQBt+9UNrKIgzUSNsdp
         WibaOvU8Hk+f75cwRq74zKOOO5fUQtzxpYOz9sISex37DZzASqR6pIdkTVjzeSd6L5oO
         dfgI4CxdkJn62UVCS5Jv1wSih/qQpxR0228/U+N1QSyna9tX1CV6vIKPVj4uWrMDTThp
         7LE84bZ1FTilpmXPyQ7BzWzHoaK8ZYPrlka0sWrsqBkhOSE90tM9denrjUyxmXl/R3VP
         /PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jCi4b0UmAWDyAyWgsGm1qzT+csN3RMtvw4GN3o0hThA=;
        b=T0g/NV81mfo5R26Nb60I9zDX2S/ZQGSoYDMQWz+r+MpeD+i3oNz9lEpidMKGvzeTmS
         3Ds6dpIKNkEUvSh+eh9YPJolGL6Wk6sVhhB0/zNvqoNa5L5fxMIOFmq7Ws3+Pv3c87PH
         08xi2gmaN9zSjxDNh3curf3PN37mssq4jh0ngrTch5hgbCGN8n6xbMwlddbeYTCtyozr
         FZisuh8EYqgVo+xTKxAq8Y0oa1kQfBUX8Jf6RnVdf59yZPHvTbdSDGkUa8dIdw3eSvhR
         +O7en2cdwNnGnJtkBE57Tz40wpHMLLjUddK+jgfgU2trrRgOkAedBpLaGsTMHhFOnIDI
         cF8A==
X-Gm-Message-State: AOAM530wWsXhQpaUsaGLHxD3Pm4ecZfuqWGSsljAEPg0rOuicoNlVyS9
	oSiYVKi85sllglpPnSPU15VxWHYwF7+iSA==
X-Google-Smtp-Source: 
 ABdhPJzVkZBPH+e5+Wl1uM9Zzqd+YMGPxKShxaki+NCNzfjdJd2jPGbAQ0fIUsnc+U81rj+Gw2CK1Q==
X-Received: by 2002:a05:6000:1b89:: with SMTP id
 r9mr1635687wru.21.1641978944963;
        Wed, 12 Jan 2022 01:15:44 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 w7sm5883472wrv.96.2022.01.12.01.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 01:15:44 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][master][PATCH 1/2] nodejs_12.21.0.bb: only handle npm if
 configured
Date: Wed, 12 Jan 2022 10:15:28 +0100
Message-Id: <20220112091529.4853-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 09:15:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94781

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


