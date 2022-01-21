Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB8BC4167B
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.540.1642801160603977085
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mQpWEvTe;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id az25so1983648wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3FB8o5LbSa1c/Jt/9S7SHK6GGBbkBFoqasjcLpjnWTc=;
        b=mQpWEvTe7z+MnVfamqaejZDKrBqZxIjzjDRWB58nUmocl4RVuDzWomdiMgmyM1N6k/
         rNKHAbAC/CEzSkl8OwRcuyCAUxHcYNxH6p4NFyx3pO6CRYsmBAeVvMHCnrpuSUW9wybS
         eAlz3G/qvygNTGteKnMK0psfJ4W7tHOODCzu3/9RaLgapmVu7X1z4lzrPQ6zuEuFtU8a
         wzLSim4HGFEh/Wc55GmedDlKlRnReomcuvhLEplxfJnzdE6iUNkV4oKen0DgsqoYT2em
         /cgy1PVNXle7wiFhvnpW+IcYEkskulwoK4ZXPyV8SrtQ6Wt1RBhiQXonebPaPsLcDYig
         dyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3FB8o5LbSa1c/Jt/9S7SHK6GGBbkBFoqasjcLpjnWTc=;
        b=iBWQnd3zlgQFIIbO2JWB2XCA226i805BLmqC2CcyI8w6KBKoKEQ7nzWqskz9C5Z1Ra
         eGjQ5WsINXQD3btlPcOY/YTUnuLIrd9oz8Mny9xTl/ADbyDQcgUqUs1uxhruBqbTZ0s5
         ESJEg6eJIzjnutw8crLnGbtwGhT9WPLozUBbnNkg549o3upjJeuSk45CoWrJ5kiqQEmB
         gtD4mI0YxXnEIEZXUkvdfDZBBa0JXaOoc7zdEZ4MT6VRdUMALNNIZ3sDMazkwSe4RR7I
         J3irGZeCYTdRXO8WHcbwk7ZzbTpSl0oEjeR5CIrxuHATAtg3W4n53XIY0f0dI8EE45/6
         xf+Q==
X-Gm-Message-State: AOAM531KO48ABVB7mKzdpaCvZsv3eUaB+ls6rFPvyVCJlieFIUUwVzYe
	eU6M/QtPi7NFDWRGEktvsq8P95gRE3s=
X-Google-Smtp-Source: 
 ABdhPJwvXO5yASm2naKv7Rh8/uLABNp8ThC2E4SF/Y5xITFaCEk0VanWlarqaIqvAJ9L3Bm21FDatw==
X-Received: by 2002:adf:f489:: with SMTP id l9mr4946587wro.489.1642801159254;
        Fri, 21 Jan 2022 13:39:19 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/19] gnome-disk-utility: add a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:54 +0100
Message-Id: <20220121213858.762625-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94993

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ild-fix-arguments-of-i18n.merge_file.patch | 34 +++++++++++++++++++
 .../gnome-disk-utility_41.0.bb                |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch
new file mode 100644
index 000000000..2758af507
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-build-fix-arguments-of-i18n.merge_file.patch
@@ -0,0 +1,34 @@
+From 629ca0e61bb59303d43d7eac44a47ae866cc78f0 Mon Sep 17 00:00:00 2001
+From: rvalue <i@rvalue.moe>
+Date: Fri, 17 Dec 2021 12:29:30 +0000
+Subject: [PATCH] build: fix arguments of i18n.merge_file
+
+`i18n.merge_file` has been ignoring positional arguments for a time
+and explicitly rejects with error since meson 0.60.0
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index e38a1d8..38fb520 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -11,7 +11,6 @@ desktops = [
+ 
+ foreach desktop: desktops
+   i18n.merge_file (
+-    desktop,
+     type: 'desktop',
+     input: desktop + '.in',
+     output: desktop,
+@@ -38,7 +37,6 @@ install_data(
+ info = 'org.gnome.DiskUtility.appdata.xml'
+ 
+ i18n.merge_file(
+-  info,
+   input: info + '.in',
+   output: info,
+   po_dir: po_dir,
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
index 462865e72..7e254f52c 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
@@ -26,6 +26,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 # As soon as elogind is of interest this needs rework: meson option is combo
 PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"
 
+SRC_URI += " file://0001-build-fix-arguments-of-i18n.merge_file.patch"
 SRC_URI[archive.sha256sum] = "8743c98fd656062ef862933efe30c5be4c6b322ec02eee154ec70d08ed0895df"
 
 FILES:${PN} += " \
-- 
2.20.1


