Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5215C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 13:28:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.21268.1707226099881140652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 05:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i7ETDOTM;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33b4b121e28so24192f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707226098; x=1707830898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wEIRFiveaQfqVkvFVZE/MSh3fY5FJ1Xpdv8pyffFO4=;
        b=i7ETDOTMUdaserse6pseo43LA3lXIopvAkKwy/SsGhrdr0dWDZQCh91izGp2EPFFyt
         3RlWFu9VZf7iVwE66QkY2GVkXXVmWND7WQ9a/5YvNpmokkHL7IgcWijTT30nYbJeE60S
         n3ircw2ocduozd3Nz28yV7fa7DXYQW7VNi1Q8G3R9CcxGHdpsXB8ukoTePyz8mc5uaIF
         +MtA7bwM+U62cZUNtmnlPyN1q3Xt/cDJsHG1CGfu/+kbvwymJs1jXuM0XncqMz3TifTr
         1VU2paz8jlheHNCcctfW3cOk6OPI1xpXfc6g6m8NS3sFpV06474CsN9gVTqzL+gDxZOa
         mG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226098; x=1707830898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wEIRFiveaQfqVkvFVZE/MSh3fY5FJ1Xpdv8pyffFO4=;
        b=ciXScgr7MRrnYQkM01fOrmRiMTCUUymZ4PdUT+zx6VHu4IF9efYpEkNimVX2UOIhSl
         8hIWee8NJY1ebAqAHy726B9Rw+h6jfP70whvR/rnxKQveiPF48l7GXqetpd3KuK2Qzn0
         V2z+ApMyFIXzuIAAEl56WPX46wBgkIweOtZtqlt0SUyGQMLioMxH1ZRjqu+aHut4jjjE
         Ro2xE8AnqabkCUap7sKiLDE3Z2IxeBS4PGPIHjtnXnYxTJABEtP7twP7cUHQaCEViLZO
         LSZgTz9vG8JB47I9i33G02v0l2+tOXgJBtn6zf0m86gWIMH8c2CiQtruL/jm44DB+M8z
         F5og==
X-Gm-Message-State: AOJu0YzCfxaH8XnMljVwCwp6lils56elq31fw5D6CsAxsZ8R+2rsaTpF
	JwPq0xPayiNYfO5j06xcnqlUWa3pkuasPRiXtP4NbUhiHItR7eyS3QNC7LqM
X-Google-Smtp-Source: AGHT+IEBd9pa9IGkQ4FtJg/Ja4yXHderCPoFfAPBX/y/n6c1Crq35IUavgUi5un5gzfzCZoDS//E2A==
X-Received: by 2002:adf:fd0c:0:b0:33a:ffeb:8531 with SMTP id e12-20020adffd0c000000b0033affeb8531mr1096316wrr.61.1707226098037;
        Tue, 06 Feb 2024 05:28:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id by6-20020a056000098600b0033b07f428b6sm2171556wrb.0.2024.02.06.05.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 05:28:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH 2/5] recipes: drop remaining +gitr cases
Date: Tue,  6 Feb 2024 14:28:09 +0100
Message-ID: <20240206132812.1362456-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206132812.1362456-1-martin.jansa@gmail.com>
References: <20240206132812.1362456-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 13:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108627

: drop 'r' from gitr and ${SRCPV}

* +git is preferred over +gitr since 2012:
  https://lists.openembedded.org/g/openembedded-core/topic/72154716#16837
  some recipes still use +gitr, because updating it would cause PV going backwards
  but without share PRservice the version-going-backwards QA issues are quite
  common and most people probably cannot depend on always-increasing version number
  already

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb         | 2 +-
 meta-oe/recipes-devtools/openocd/openocd_git.bb            | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb        | 2 +-
 meta-oe/recipes-support/pidgin/icyque_git.bb               | 2 +-
 meta-oe/recipes-support/serial-utils/pty-forward-native.bb | 2 +-
 meta-oe/recipes-support/serial-utils/serial-forward_git.bb | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index 122a3f9916..424d31a535 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://dbus-daemon-proxy.c;endline=19;md5=41df6d21fe1c97d6a1cc22a5bf374cba"
 DEPENDS = "dbus dbus-glib"
 SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
-PV = "0.0.0+gitr"
+PV = "0.0.0+git"
 PR = "r1.59"
 
 SRC_URI = "git://github.com/alban/dbus-daemon-proxy;branch=master;protocol=https \
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 36cdb00f2b..559fe29ff8 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -17,7 +17,7 @@ SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
 SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
 SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
 
-PV = "0.12+gitr"
+PV = "0.12+git"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep gettext
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index 119612cd73..f223664905 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.droidfonts.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
 SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
-PV = "0.1+gitr"
+PV = "0.1+git"
 PR = "r3"
 
 SRC_URI = "git://github.com/android/platform_frameworks_base.git;branch=master;protocol=https"
diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recipes-support/pidgin/icyque_git.bb
index 76ed26e88e..ed58c4a76f 100644
--- a/meta-oe/recipes-support/pidgin/icyque_git.bb
+++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "pidgin json-glib"
 
-PV = "0.1+gitr"
+PV = "0.1+git"
 
 inherit pkgconfig
 
diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 41a93f3249..82994331ee 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/network"
 SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
-PV = "1.1+gitr"
+PV = "1.1+git"
 
 SRC_URI = "git://github.com/freesmartphone/cornucopia.git;protocol=https;branch=master"
 S = "${WORKDIR}/git/tools/serial_forward"
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 751bdffead..541ae84a93 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/devel"
 SRCREV = "07c6fdede0870edc37a8d51d033b6e7e29aa7c91"
-PV = "1.1+gitr"
+PV = "1.1+git"
 
 SRC_URI = "git://github.com/freesmartphone/cornucopia.git;branch=master;protocol=https \
            file://0001-serial_forward-Disable-default-static-linking.patch;striplevel=3 \
-- 
2.43.0


