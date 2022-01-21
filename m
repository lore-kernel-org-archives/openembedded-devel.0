Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A5DC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:14 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.557.1642801153359429970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wey4VJed;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id l25so1981991wrb.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loRY/YMkzMlSGqYnOG94+MhAqiATSBvOlypGK87s4Wc=;
        b=Wey4VJedSiPfBPCI+Q+uPzMKdr3KushX4w7A1e32eegQmfDVLTeNOcpVMDLEl7lBop
         lQjYeXw6/Y7pt4aK3jxsXJYBUH6ujyINqPI6ojDzYUJ0RyWWD3x1kR3OZUps5Uwjgrn7
         zh6ucU0s2W6Q1W3SrAocEPtxwDvLhUvxvag+TmvClBtomrRh92zf3nuDnpCBvh064DZB
         3JHPOQs3LKneZh2F8dFcmJkEo83f4SSRQ/Xu03VwhnS7sChn7IvqR7x84Zben2mh5YNw
         g/3OWtFGpPrgHTtmov025xXIRd6IOkcgPT6t3E0URI7a6RazXD71XN9fHzBGcBuy2GJz
         x0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loRY/YMkzMlSGqYnOG94+MhAqiATSBvOlypGK87s4Wc=;
        b=MkXSuCW3H3JYL0yDflCoJcASBPseCtOFjbyPK9sawKo5iSA7qKHhci1H7kZq9CswTN
         4izeWR+qDRdtgEdrZVnkNySBzGHXtphbaLgs9Ul8Dg1EyMbdx+Ces7mek8ossFzbUIJA
         9ZuXn8EQkYOF0iDCt8yTBsfstbI7zX8plreIJJxyFtm/ws0Jyaw6a42OXIqc2Y6P6kGu
         zXA/OplZDQOjdxHM3T1Zvx6zyTYjcOa7lfTS426/g55vQ+XY25UxZwWF5Y6p9qovQukn
         C9BPhUQ/XTBEkAlq3oN508l1YaUzgtdROfQODJL9gNKMofyYe0daMdvbG2w9mDo2R5NH
         8cNw==
X-Gm-Message-State: AOAM532+qrbqmThlaIVmYaMtbp3hWSutguulgc3OOxR6fwf/R/yLqsV6
	O6DZtZVPe5uQjfj98AuBBko8Nxfolt0=
X-Google-Smtp-Source: 
 ABdhPJwkibM2AmjRAJGM0FbpsMgLM7Ulph1GYnfBkkh2dqUec27chPPtANRsjDYulTkZqOZSBE70MA==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr5504760wru.471.1642801152001;
        Fri, 21 Jan 2022 13:39:12 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/19] gnome-settings-daemon: add a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:46 +0100
Message-Id: <20220121213858.762625-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94985

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...positional-i18n.merge_file-arguments.patch | 40 +++++++++++++++++++
 .../gnome-settings-daemon_41.0.bb             |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-build-remove-positional-i18n.merge_file-arguments.patch

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-build-remove-positional-i18n.merge_file-arguments.patch b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-build-remove-positional-i18n.merge_file-arguments.patch
new file mode 100644
index 000000000..cb758c7c8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-build-remove-positional-i18n.merge_file-arguments.patch
@@ -0,0 +1,40 @@
+From 56535d2f1ec64e847e5fbd0613e78bd0dc046519 Mon Sep 17 00:00:00 2001
+From: Michal Vasilek <michal@vasilek.cz>
+Date: Fri, 14 Jan 2022 23:55:06 +0100
+Subject: [PATCH] build: remove positional i18n.merge_file arguments
+
+otherwise building with meson 0.61+ fails:
+
+    ERROR: Function does not take positional arguments.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests/281]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ plugins/power/meson.build | 1 -
+ plugins/wacom/meson.build | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/plugins/power/meson.build b/plugins/power/meson.build
+index 69e619f..014bb6d 100644
+--- a/plugins/power/meson.build
++++ b/plugins/power/meson.build
+@@ -76,7 +76,6 @@ if host_is_linux
+   )
+ 
+   i18n.merge_file(
+-    policy,
+     input: policy_in,
+     output: policy,
+     po_dir: po_dir,
+diff --git a/plugins/wacom/meson.build b/plugins/wacom/meson.build
+index d8dd0ec..c00323d 100644
+--- a/plugins/wacom/meson.build
++++ b/plugins/wacom/meson.build
+@@ -7,7 +7,6 @@ policy_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  policy,
+   input: policy_in,
+   output: policy,
+   po_dir: po_dir,
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
index 2851ccfd9..78d681170 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
@@ -25,6 +25,7 @@ DEPENDS = " \
 REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
+SRC_URI += " file://0001-build-remove-positional-i18n.merge_file-arguments.patch"
 SRC_URI[archive.sha256sum] = "e6ca6361fbd1deab2de1a1e390d4f14167cf47b1c547dbb8b65a5d89e9663884"
 
 PACKAGECONFIG ??= " \
-- 
2.20.1


