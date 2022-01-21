Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1F8C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.592.1642801163579720350
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qG3Ma37j;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ba4so1973862wrb.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EUmpVJDH7Wt+Ds4gsGqP7OpVcCyuoiiJ57JQRRgvdfo=;
        b=qG3Ma37jiu6E+NvcdXIxq//Naz6XNV6XHQoH7iV8YqpUljdWO9IRQPrnm/Mh/KRpUw
         Rsp3FqxhdBnokL99zSL6yunBQpXGGiBP/itV2MWKsJfB2poOwxthQTMp43Zaj07Yv6Uk
         lGrJ9d2IezW0DN9TZfc/DacJjxYpAl+V8/GU9pCRh0fHc6Rs0ob5sDD/c780yzEG/yXO
         pg2pHFn4XHPW8k8kdCKmAoN4x57MnDmvQem99dIZsrm4IN2+/y1XhFXpahWk0jPlI3Br
         CWIVQaS32prHYDFxfvj6pVKALQK6pl9synPnYqGryI31yxJvfTTJeAG/Jelrq3F6acft
         e5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUmpVJDH7Wt+Ds4gsGqP7OpVcCyuoiiJ57JQRRgvdfo=;
        b=a+gx5ObC2lXtQW7Uop6CJ8B2NwQZEG69YnwmK2tkf2McbHiSusRRiksu0J6rPooOk+
         Z02mMhHZPDqSDkYk0Hmi6GMGNIStmkRjYWMabG238Rbpowmvc/UZYssdPNtSsYCwkt0F
         uHfeQOLLOtG8fQpiHGnseZykxekjYRYHBYDsjLAl3DG8qn94TAZgQYRf8g42pUMn98jR
         jkFNHNSh3tMBl8YNN2Hsu/15ZiIuKuL8UBO+88ui025CdeVlXg3wyBQeHMQTSkZrJNFz
         k+GBSVIhu1AHQbkIyD/qHGD9BMJqDqtKE79QDXkRQQbQXF9uE9V/BdMRkSY5N9DBhW02
         OkSQ==
X-Gm-Message-State: AOAM530ILCVRqMMClgJtyu/fmYvjh3i7ZNzgbdLoa679oB3BWz/vh6XT
	XWV2keRYzD9uX1kCKr5SJsWlig45+YM=
X-Google-Smtp-Source: 
 ABdhPJwWG1BQ9Tywr1KtY+w7LykurjNTEfgOJjsYXiPeFIvIlnCpo9MCnm1SXx5uO3E/1ii19svipg==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr5373606wrs.330.1642801162146;
        Fri, 21 Jan 2022 13:39:22 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/19] network-manager-applet: add meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:58 +0100
Message-Id: <20220121213858.762625-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94997

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...on.build-address-meson-0.61-failures.patch | 31 +++++++++++++++++++
 .../network-manager-applet_1.24.0.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-meson.build-address-meson-0.61-failures.patch

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-meson.build-address-meson-0.61-failures.patch b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-meson.build-address-meson-0.61-failures.patch
new file mode 100644
index 000000000..4a5cd5b81
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-meson.build-address-meson-0.61-failures.patch
@@ -0,0 +1,31 @@
+From ab27e6e6c839e1c65e4059a06982453a7aa1b6b3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 21 Jan 2022 22:34:09 +0100
+Subject: [PATCH] meson.build: address meson 0.61 failures
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/network-manager-applet/-/merge_requests/107]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7ab613c8..688a7311 100644
+--- a/meson.build
++++ b/meson.build
+@@ -253,7 +253,6 @@ desktop_file_validate = find_program('desktop-file-validate', required: false)
+ 
+ foreach desktop: desktop_files
+   i18n.merge_file(
+-    desktop + '-desktop',
+     input: desktop + '.desktop.in',
+     output: desktop + '.desktop',
+     install: true,
+@@ -274,7 +273,6 @@ endforeach
+ appdata = 'nm-connection-editor.appdata.xml'
+ 
+ i18n.merge_file(
+-  'desktop',
+   input: appdata + '.in',
+   output: appdata,
+   install: true,
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
index 6ebb3ea9f..c181d3943 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
@@ -9,6 +9,7 @@ inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += " file://0001-meson.build-address-meson-0.61-failures.patch"
 SRC_URI[archive.sha256sum] = "b9f4bca5d0352718e07b7385fb195a9bbc8fd686b7959b74137854d52aab9c58"
 
 # We don't not have ubuntu's appindicator (yet?)
-- 
2.20.1


