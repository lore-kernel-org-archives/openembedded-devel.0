Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05724C63716
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.32377.1649696227692030574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lwrozp4F;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id w7so15075422pfu.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GBm3Wmvv29XeJ+XVAAWfPBeGR6giZ1L7yd7q02wfPCE=;
        b=Lwrozp4F7d4h4PUzYVQu6bRFbODM8a/JX4u7PIJk1/9njZ+DZkZBnL2Tuvpxc1OnQH
         UOP01INwXoV8jMK2Hx78KQUPl0oSftHPtt512rIpkjVv+6AOsoFgTucs+p/H2H/xhhww
         jpM2e7tVXXQFiQFTcOluFYV3Y9My3oYP7GSLu//YxPEEvnL5pg1CYcCVyr3aAONycvuz
         Mou4lzcxa116bUAgxWDWsOPoNxOcPo9CsnyXd4qIz8cT0crKX9Y6yOaP5An82th6JKkq
         0y2WaiBOLodKsu4tsgIQhqZbNHTAz2eynw0RBZJqI9u80b2O/4N3o1gJCeO3omE+sOGq
         DNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GBm3Wmvv29XeJ+XVAAWfPBeGR6giZ1L7yd7q02wfPCE=;
        b=auf+Wc2IwakASIsi9VpCwBVNrsf+4XvGH0lHJZ6iURTzjrBULCmxFnnnvh1HFYSym7
         SjKVGADmBI+LMAWcoaUcGZaq8m2nonXJZ/2iDNONrEfgmafLXmwPUIKDKlrcMEO4LZbf
         RB5I8WWb/0793O+j7yodHUNCtVy0zUeGp5qNXrYoZB0XoykrlYWKMqScbjpcN4DzAkcQ
         GQGMUYjEj6mDXeOkkqhbJRJYqpty97UEU7wzaF0ymNFu8kWh8bMqjH9idIPTxfInxOl+
         VB06g5c/+tEpqAvxzGArNKWIhfgsMb1TimeV+bLTN/JcCxXYuuNW7I3VHIKLr+LiKErh
         pPNQ==
X-Gm-Message-State: AOAM531FN8Oi5GGF7dmOUvnAuBCtXRLJts74p0BFJAJHRiZ+1T+GIFKf
	BEgab364dwhTBO+BILOnM+MMlrKXZ4I=
X-Google-Smtp-Source: 
 ABdhPJzrA7OMgbhZwvBHYdsP+IW7dy19CMKmzwawlrCaPkR/VlS4ozSBG1lYEpgUxCFKMxhB4aLqxw==
X-Received: by 2002:a65:680b:0:b0:39d:2965:b249 with SMTP id
 l11-20020a65680b000000b0039d2965b249mr8596642pgt.289.1649696226712;
        Mon, 11 Apr 2022 09:57:06 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:70d5:c5c2:9136:2337])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004fb44e0cb17sm36519805pfw.116.2022.04.11.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 09:57:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH] sdbus-c++-libsystemd: Avoid hard
 dependency on rsync
Date: Mon, 11 Apr 2022 09:57:05 -0700
Message-Id: <20220411165705.1830023-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96554

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dcb8ab6169bd93440137bbd4703171987ecd3a15)
[Fixup for hardknott context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...d25119a495009ea62f79e5daec34cc464628.patch | 53 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  7 +--
 2 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
new file mode 100644
index 0000000000..ae449791f1
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
@@ -0,0 +1,53 @@
+From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 12 Apr 2021 14:03:32 +0200
+Subject: [PATCH] meson: do not fail if rsync is not installed with meson
+ 0.57.2
+
+https://github.com/mesonbuild/meson/issues/8641
+
+Our CI started to fail. Even if the change is reverted in meson,
+we need a quick workaround here.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ man/meson.build | 25 ++++++++++++++-----------
+ 1 file changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/man/meson.build b/man/meson.build
+index 3cae8446cda..f9c4b83dc81 100644
+--- a/man/meson.build
++++ b/man/meson.build
+@@ -184,17 +184,20 @@ html = custom_target(
+         depends : html_pages,
+         command : ['echo'])
+ 
+-run_target(
+-        'doc-sync',
+-        depends : man_pages + html_pages,
+-        command : ['rsync', '-rlv',
+-                   '--delete-excluded',
+-                   '--include=man',
+-                   '--include=*.html',
+-                   '--exclude=*',
+-                   '--omit-dir-times',
+-                   meson.current_build_dir(),
+-                   get_option('www-target')])
++rsync = find_program('rsync', required : false)
++if rsync.found()
++        run_target(
++                'doc-sync',
++                depends : man_pages + html_pages,
++                command : [rsync, '-rlv',
++                           '--delete-excluded',
++                           '--include=man',
++                           '--include=*.html',
++                           '--exclude=*',
++                           '--omit-dir-times',
++                           meson.current_build_dir(),
++                           get_option('www-target')])
++endif
+ 
+ ############################################################
+ 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index c52024130e..59d6f352c8 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -12,9 +12,10 @@ DEPENDS += "gperf-native gettext-native util-linux libcap"
 
 SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
 SRCBRANCH = "v243-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
-
-SRC_URI += "file://static-libsystemd-pkgconfig.patch"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
+           file://static-libsystemd-pkgconfig.patch \
+           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+           "
 
 # patches needed by musl
 SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
-- 
2.25.1


