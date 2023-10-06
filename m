Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29FBE92FF6
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 07:46:56 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7737.1696578411126874362
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 00:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oh6bE29L;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so3337817a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696578409; x=1697183209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XToGuJnRLgHCFHzt4ijMjI3Y9aSY7w+y77/SDiz1Bkw=;
        b=Oh6bE29LUya1E3zvq6rGNOyFaJLT5ZilyGfSL6ypYcLF4pF/qUQMAeBzKgJcDa2cdG
         tdq5WbJ4o3IYmWpQdygvijemQoSJvR8MQ3p0gpMvLabanH6XO9iVOWsvIGI5EyOm9Fzf
         SyrH+EWg/dtu56XFioobetZMgbPaAiyN42kIHpW47S8rprks66mawGDgKKiYb/+nPtu4
         0+rLl0sEXvfVotltou0pIV+nCbQp429Es0wjZ0+Ut4Ut5gYxbGeY0oCqOYxi399TpsPy
         BQmFq9PGqofK0exgJY4+Kf3/uAC/Y4zl52lRSr4vF0hoahs5TPr0TsqpLrQn5lQyZ8YF
         nOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696578409; x=1697183209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XToGuJnRLgHCFHzt4ijMjI3Y9aSY7w+y77/SDiz1Bkw=;
        b=pYvZkdzcIMUv8vo5uAnPoW3tRcfXzQYX4RrQB7gWfruwWUCQWyIEYCMXVZvuQJzCxE
         tDLq/DaKagOFYztxhrJoRfzdhuKgzd4jP1l4jXlecgGcSBhodD3yjX/0+ztzjdsfpyBv
         0NvB0Z3WKDpmIUNlvOEkjhUQKy9M+HN3SsZMO8uVaiEbC3kzQ4JzwPxdmYu5RqR3pTiM
         mshupU/qQD5DhSlM8fqyMGX6UlAevpWGD5dHZJOwszHgXte0NeTjQ2jzomzYBHIGPTID
         050SeiraAEApjXDX48rQQs3/ASr0XfpJFDosCQluAbQAansv02hKjgUxOINgWO1SnQA+
         UP9A==
X-Gm-Message-State: AOJu0YxydegxeuKxu8F13g5JxxU7VXhx9kZolWMBSvk6ECgLr72IT/OK
	Ppz1Ws2l/hGAIYVnFk5h7DOiPKA/4cmL+A==
X-Google-Smtp-Source: AGHT+IHOQZb/iFMToAVZVWYA6CqZ0G4ZdDRJQxmmGfEDn1QHWuQqcx9D64r2A4wzKoGsY8TYebMuag==
X-Received: by 2002:a17:906:cc0d:b0:9a5:874a:9745 with SMTP id ml13-20020a170906cc0d00b009a5874a9745mr6535182ejb.26.1696578408789;
        Fri, 06 Oct 2023 00:46:48 -0700 (PDT)
Received: from Unimatrix08-Jammy.lan (mob-5-90-41-13.net.vodafone.it. [5.90.41.13])
        by smtp.gmail.com with ESMTPSA id t24-20020a1709066bd800b0099ddc81903asm2450396ejs.221.2023.10.06.00.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:46:48 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: Add an additional fix for non-systemd builds
Date: Fri,  6 Oct 2023 09:46:06 +0200
Message-Id: <20231006074606.1814427-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 07:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105366

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon_2.18.10.bb                 | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index ab367ad82..410fffa24 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd s
 PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF"
 
 # Linux options
-PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF -DWITH_DLT_SYSTEM=OFF,systemd"
 PACKAGECONFIG[systemd-watchdog] = "-DWITH_SYSTEMD_WATCHDOG=ON,-DWITH_SYSTEMD_WATCHDOG=OFF,systemd,libsystemd"
 PACKAGECONFIG[systemd-journal] = "-DWITH_SYSTEMD_JOURNAL=ON,-DWITH_SYSTEMD_JOURNAL=OFF,systemd,libsystemd"
 PACKAGECONFIG[dlt-dbus] = "-DWITH_DLT_DBUS=ON,-DWITH_DLT_DBUS=OFF,dbus,dbus-lib"
@@ -55,13 +55,13 @@ EXTRA_OECMAKE += "-DWITH_DLT_LOGSTORAGE_GZIP=ON -DWITH_EXTENDED_FILTERING=ON -DS
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
 SYSTEMD_SERVICE:${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-dbus', 'dlt-dbus.service', '', d)}"
+                          ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-system', 'dlt-system.service', '', d)} \
+                          ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-dbus', 'dlt-dbus.service', '', d)}"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 SYSTEMD_SERVICE:${PN}-systemd = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor-udp', 'dlt-adaptor-udp.service', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples', 'dlt-example-user.service', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples dlt-console', 'dlt-receive.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-adaptor-udp', 'dlt-adaptor-udp.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-examples', 'dlt-example-user.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'systemd dlt-examples dlt-console', 'dlt-receive.service', '', d)} \
 "
 SYSTEMD_AUTO_ENABLE:${PN}-systemd = "disable"
 
-- 
2.34.1


