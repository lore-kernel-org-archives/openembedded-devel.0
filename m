Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3E7C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.539.1642801159611722336
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=outZXov4;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id e8so242392wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z9dMiJn0rAEzl/fUB/yunRoul9jZBbg0xKuhp3Kon0c=;
        b=outZXov4TBE2Pr+02MivmDva40QGVaYGuD8eWxhrrxDQMzVy+usMGGzyOGAtbDkcBU
         7/DagfAy/PgPhGJjbTevcCWieCpXb9RcCE4wMthkY38jhnpnS5csh9UuH755RoLp4J91
         2UYyE0lHoJZ9WDDWKdH5dfPCfWIhurt8j2n3qww16l9Vh7KzFyU5p8wX/Mj4lPk02OcV
         R3PJw6VAhLKvtenjXllsctUUhchlhQL1KS2ZS7JxZ82E0agSWs1Kr1UD+FVqhu3bBX2H
         Ix2V8Zlz61EFzHcxGLYKTMT2cWZCb2L59BN3doMv/FdtFVaa6yypsSrNHJPFnmGhy8oN
         uJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z9dMiJn0rAEzl/fUB/yunRoul9jZBbg0xKuhp3Kon0c=;
        b=Jr4y8YMtkRPJStAntumOEPo/192dXUcoGyPgZDoO73frSj11OeLpbyh39O7dBuOVfD
         1LLb857J/bwC5cIkR0VBoinsmpV3KxM5o3jG2xq2wVpiy7/2UgamcgZybNm2I9vory3V
         loG2MHZstI2wKr1wX+1bJ7nULapWZVBqJsQNA7uwdm1SJ185PiYpqr8GQrAD8OF8LjPr
         sKWrRifAufHLxABYRkSfj3UOeHNDmxupc5KMhR28/wjuCH9FEj6R+RUWp8LmqxDV79pI
         wdzIAhvvt8X+XD5xN9RQh5eiBtplPCrcY3oBfxOlYLGRglvpaU3hTUQwphdDu4P38T2p
         cJuQ==
X-Gm-Message-State: AOAM533hgZrlCoxfujoEZmGMAyru/72VU8UlSg7rG8xAZI33w+oTO345
	WRCfQ7CdZ9xs45hDIq85Rd7OQA5Cqqo=
X-Google-Smtp-Source: 
 ABdhPJyZw61BIRVZreRpwWtj8ekBzDhBGbnOePlh4Fc+JvMXYq7vH9UFI0HEu7eP3ct7yPOiB+gS/Q==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr4194230wrq.473.1642801158197;
        Fri, 21 Jan 2022 13:39:18 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/19] gedit: add a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:53 +0100
Message-Id: <20220121213858.762625-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94992

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-incorrect-args-for-i18n.merge_file.patch | 34 +++++++++++++++++++
 meta-gnome/recipes-gnome/gedit/gedit_40.1.bb  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch

diff --git a/meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch b/meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch
new file mode 100644
index 000000000..66df3c269
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch
@@ -0,0 +1,34 @@
+From ea9a15afb76c093aea37f6c56c559b61afd9a9f2 Mon Sep 17 00:00:00 2001
+From: rvalue <i@rvalue.moe>
+Date: Wed, 15 Dec 2021 07:02:09 +0000
+Subject: [PATCH] Remove incorrect args for i18n.merge_file
+
+The positional argument has been silently ignored for a time. And it causes failure
+with "ERROR: Function does not take positional arguments" since meson 0.60.0
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gedit/-/merge_requests/124]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index bb61387..28d72a1 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -4,7 +4,6 @@ install_man('gedit.1')
+ 
+ appdata = 'org.gnome.gedit.appdata.xml'
+ appdata_file = i18n.merge_file(
+-  appdata,
+   input: appdata + '.in',
+   output: appdata,
+   po_dir: '../po/',
+@@ -23,7 +22,6 @@ endif
+ 
+ desktop_file = 'org.gnome.gedit.desktop'
+ desktop_output_file = i18n.merge_file(
+-  desktop_file,
+   type: 'desktop',
+   input: desktop_file + '.in',
+   output: desktop_file,
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
index 5a9c49976..df8ab620c 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
@@ -23,6 +23,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += " file://0001-Remove-incorrect-args-for-i18n.merge_file.patch"
 SRC_URI[archive.sha256sum] = "55e394a82cb65678b1ab49526cf5bd43f00d8fba21476a4849051a8e137d3691"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.20.1


