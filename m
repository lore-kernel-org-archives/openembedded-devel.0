Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EF3C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.591.1642801151273195400
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oDbzjy9I;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id az25so1983160wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zJpJOG0G6z8q+HcWGWotZZrcs7iJQ0Z2SHwgVSQuNSs=;
        b=oDbzjy9Iw/n2+TURh35j/Z5pa14mvO+/ELMvCLs0kY3nt5BqfxsBm7BR5isWoCRPOL
         LK/SK5zqdCts8jUGRDgxjqdbOOM6cwAqTUkpdR7M5kTNLnUhLQAFov0wlwyi0J9ZK6Vg
         lWoLqwaqARxP3p8I4R88XYnkiFu6mE6btnzryEGZlyQTGqE7Ygma6inQvbCHbI0gzgpH
         v9o595Ht8+KXX3CCULld8ytUhXpO9DzXpD9R/lT0jCXxLHFgeazyJsWYjxin4i3u6NFx
         avSNfn6Q3lEORCKIjhHsCVAswJ0v5HflUq8qkkSTddHRvy3visYMKCBuDv3YXIv+wc/a
         Ij/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJpJOG0G6z8q+HcWGWotZZrcs7iJQ0Z2SHwgVSQuNSs=;
        b=AMaeFz5rIzPPS6aalps9Vxff4qMvafjl3rrsImGZQsrikZ2GSVBK7f+ySWxisq/7Yt
         /Gysi6FAi4+sYhMO3Wfwb4izpTnOkFcEt9UklF69Hj/adz+IJZ38LXmeH1FsvNorGsyM
         juH1BUi+8Yv2rf0cUUlwzeqLLQXTq1N3336TE4WwkAdXohsHR35qvas5kdSSUvL5HhPp
         c4zW5lHD+ZfktgU/JGNcZfuZKzW5qEsF9xY2e1ipw+56tO9qGtMHINcHFcui6Gq+hWvb
         SMmVGqWSwkcJEtJqvzYPW+DdF35TDNinarufDqpL+FCK3irdqIwThaEkHlhx/txupRhY
         itIg==
X-Gm-Message-State: AOAM533r2I1vhAqr7CCvwjmPrp4YQAg89NztZy0zHb7He4bfYfIJ1ZBS
	LyBoXjx6+eHBI8qm47UpPdVDOfYHCXw=
X-Google-Smtp-Source: 
 ABdhPJwjAtuh2YMwxshIW8QpWmYEsvwhQKiqj77wmzWMBnVKqwYnfAbJa3+TrhNhtlftJjaEqV7kLA==
X-Received: by 2002:adf:f68e:: with SMTP id v14mr5672158wrp.585.1642801149876;
        Fri, 21 Jan 2022 13:39:09 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/19] gnome-font-viewer: backport a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:44 +0100
Message-Id: <20220121213858.762625-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94983

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-Fix-meson-build-with-meson-0.60.0.patch | 40 +++++++++++++++++++
 .../gnome-font-viewer_41.0.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-Fix-meson-build-with-meson-0.60.0.patch

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-Fix-meson-build-with-meson-0.60.0.patch b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-Fix-meson-build-with-meson-0.60.0.patch
new file mode 100644
index 000000000..f32e120c1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-Fix-meson-build-with-meson-0.60.0.patch
@@ -0,0 +1,40 @@
+From 9c5ce6836498fdb057a7f865f516ce28609f542a Mon Sep 17 00:00:00 2001
+From: r-value <i@rvalue.moe>
+Date: Thu, 30 Dec 2021 17:14:47 +0800
+Subject: [PATCH] Fix meson build with meson 0.60.0+
+
+`i18n.merge_file` has been ignoring positional arguments for a time
+and explicitly rejects with error since meson 0.60.0
+
+Upstrean-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build | 2 +-
+ src/meson.build  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index bfc9caa..8e42134 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -1,6 +1,6 @@
+ appdatadir = join_paths(datadir, 'metainfo')
+ appdata_file = 'org.gnome.font-viewer.appdata.xml'
+-merged_appdata = i18n.merge_file(appdata_file,
++merged_appdata = i18n.merge_file(
+   input: appdata_file + '.in',
+   output: appdata_file,
+   po_dir: '../po',
+diff --git a/src/meson.build b/src/meson.build
+index f863d45..826c59b 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -39,7 +39,7 @@ desktop_file = 'org.gnome.font-viewer.desktop'
+ desktop_conf = configuration_data()
+ desktop_conf.set('VERSION', meson.project_version())
+ desktop_conf.set('APPLICATION_ID', application_id)
+-i18n.merge_file(desktop_file,
++i18n.merge_file(
+   input: configure_file(input: desktop_file + '.in.in',
+     output: desktop_file + '.in',
+     configuration: desktop_conf),
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb
index 7afdefda1..9528b6641 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb
@@ -16,6 +16,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += " file://0001-Fix-meson-build-with-meson-0.60.0.patch"
 SRC_URI[archive.sha256sum] = "5dd410331be070e4e034397f2754980e073851d50a2119f2fbf96adc6fe2e876"
 
 FILES:${PN} += " \
-- 
2.20.1


