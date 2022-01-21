Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881CEC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.591.1642801156468383369
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpvVOhWF;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id r14so1979260wrp.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MKw1RAozLA5hKTgNoB8C7S4l796UujHD9uvMOXtqB5Q=;
        b=dpvVOhWF00N3mjpeB+F3E9St5aR18ik1SCxeP3qGUCK0mlk63pKCNDhB7prNAKu4Cs
         Fdhwtx+uQJMTURMp+Zob0KDlQKwQycKZCFZLzSbcCkwTUi/z3lgEasnSwumJ5jINZT3t
         faZ/sOEh7BOEIxQlx7DFtNXXACOfHVih9a16W4EXS2ecpGyHSg6LnsQacNBk8APBYGTX
         P092xMyodjgIrP1eNjbdrrMk7Na/QW0HOZ22YWcfYnCmAB8kL/fotEONnEF/2AqA//N5
         nhrQWw7sGhRVLaoXOmmmBuULNwAhaVuhUuqERu60rLUML//eWoRs6HD/L4Tg0IqdpcyY
         x4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MKw1RAozLA5hKTgNoB8C7S4l796UujHD9uvMOXtqB5Q=;
        b=8B3EhTKvyP2bEhslI6KLN24FHAeqD9/mhDLomCblr7GFPEud+o6Ep1CtSmaJFPyvpo
         9n5xqRgFMg+qTTa2l3cPr1ePS1n4kiRUngi3uqHwhsPWYUAUupvghI+f8n94PS3E5VwG
         EMrlMd+Mi9VEOBzmTtVIisN0ES5Xjqw6EjWXqWLheoTzEBWU8lUQATzVAKyea9h2FF98
         pJmP2iTRZAGEQh/puMsp1bGbx+8vPxJeeWLnwu7Y9oswCVLLcUITsS1TI5wAJV3EogXo
         KZEnhtgdJmlSrFGq+UEO5jhQo4kidhL6x4MN2o2ZI3yJkVZtMcQW7/dsnYCLWm/U/XuI
         STUQ==
X-Gm-Message-State: AOAM53007QOYafxheJsTiZISkbs5b4Jw7RDErsx0q5fAYOgYQiqZfogz
	Rc3E3XSUob/lneXw+x3VNQYK53ODdBY=
X-Google-Smtp-Source: 
 ABdhPJxuICgNSoOlJREFsgwoqmD2VxMeYfc4sfRIrQBenQrlU5OqP0/vbRr5f+a48v9f4btYUcphEw==
X-Received: by 2002:a5d:610b:: with SMTP id v11mr5398646wrt.487.1642801155041;
        Fri, 21 Jan 2022 13:39:15 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/19] gnome-screenshot: backport a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:49 +0100
Message-Id: <20220121213858.762625-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94988

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...emove-extraneous-positional-argument.patch | 36 +++++++++++++++++++
 .../gnome-screenshot/gnome-screenshot_41.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch

diff --git a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch
new file mode 100644
index 000000000..c80fda63a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot/0001-meson-remove-extraneous-positional-argument.patch
@@ -0,0 +1,36 @@
+From c38c604b06a63f690d67318d4ef97ac556264876 Mon Sep 17 00:00:00 2001
+From: Jack Hill <jackhill@jackhill.us>
+Date: Thu, 18 Nov 2021 00:46:58 -0500
+Subject: [PATCH] meson: remove extraneous positional argument
+
+* data/meson.build (desktop_file)
+  (metainfo_file): Remove extraneous positional argument.
+
+Closes #186
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index fd570b3..4e2e2e8 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -1,7 +1,6 @@
+ gnome = import('gnome')
+ 
+ desktop_file = i18n.merge_file(
+-  'desktop',
+   type: 'desktop',
+   input: 'org.gnome.Screenshot.desktop.in',
+   output: 'org.gnome.Screenshot.desktop',
+@@ -23,7 +22,6 @@ if desktop_file_validate.found()
+ endif
+ 
+ metainfo_file = i18n.merge_file(
+-  'appdata',
+   input: 'org.gnome.Screenshot.metainfo.xml.in',
+   output: 'org.gnome.Screenshot.metainfo.xml',
+   po_dir: join_paths(meson.current_source_dir(), '../po'),
diff --git a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
index 834b443fa..18d73d872 100644
--- a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
@@ -10,6 +10,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit features_check gnomebase gettext upstream-version-is-even pkgconfig
 
+SRC_URI += " file://0001-meson-remove-extraneous-positional-argument.patch"
 SRC_URI[archive.sha256sum] = "4adb7dec926428f74263d5796673cf142e4720b6e768f5468a8d0933f98c9597"
 
 DEPENDS += "glib-2.0 glib-2.0-native gtk+3 libhandy xext"
-- 
2.20.1


