Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06D5377E33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:06 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 79so18584210pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hqzHQig20jcmM5V2HpBIX+EQD56ejkml+fa9zcmnTvQ=;
	b=uJMaC4nYp+38OJVNAtMFa0msq9xXlNwhI+0gJdvfgsxojuVLqIPsaWF0Z6/EAmomgu
	cMn2/IIoQ6MPhHnzth1UM/JmcgMScTbLf1MhpdBEct8pzZ7PrwYzPxINcXsuVuQskYUy
	ThKpMKIcIEv2nK4BaYxSEkXgLWT7NwuAyx7zDUZE0MPtU0l0lOGHtr/TGxiUG3vtYBvn
	qJCq+OvwaBrvvsn6zvFozhTHf/yIzafsXHMmOP80LT0sAk0yX9v2OrklPr7s69J1W7T+
	S2fm4hRob9lCiuXIDYCSJBQxiAa9AaAbZ+bxjnaGJyAC/x9Oi9JnjB4Jp4G5xFwKL/wr
	kgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hqzHQig20jcmM5V2HpBIX+EQD56ejkml+fa9zcmnTvQ=;
	b=bvjm4qXd8MbQejQFlNVEUQxlG1TbVn+0Rws8ipenGnTBWMt843qlV3ZOz2uVsrjEbX
	aLY7wa5szTHU0znb37z9W5Yme67jsO2vfxfASgCoppT7irPy+q6J55HYkwBJ1BBjzGQj
	zSiop19vURZLSo6QBM5GHCCxQOmEL2VI43zA32WMm43+0JA8yNIUjQwJ0gutBZN9YSn2
	eIEAD+ncs5F0BJqS831eSEEC6VNFRBfQLUi/8Ph5Klk5pazURA/W7xbBiJD0llOkmyDz
	wr0zd4qdsEPwMpH+OoQ+0B7o1tY/4cPeBKNwj/ojoOubF0/rXVnptGJijtI/27QgNzEu
	eMpQ==
X-Gm-Message-State: AFeK/H2ZbGlw1zbiuwqnaaeVGJCTMwolynMiqvhyx9fDPrUSsxOvnNu49oa3mzL93L9Sbg==
X-Received: by 10.99.122.22 with SMTP id v22mr4345798pgc.226.1490978587311;
	Fri, 31 Mar 2017 09:43:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:13 -0700
Message-Id: <20170331164247.5052-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 09/43] xfce4-timer-plugin: Fix build when security flags are enabled with clang
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Mar 2017 16:43:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Specify-string-format-explicitly.patch    | 32 ++++++++++++++++++++++
 .../timer/xfce4-timer-plugin_1.6.0.bb              |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch

diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch
new file mode 100644
index 000000000..3f0bb05af
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch
@@ -0,0 +1,32 @@
+From 6b786e1c161026ab5486ac218891a85db65bf3ba Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 15:28:24 -0700
+Subject: [PATCH] Specify string format explicitly
+
+Avoids below errors when compiling with -Wformat-security
+
+error: format string is not a string literal (potentially insecure)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/xfcetimer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/xfcetimer.c b/src/xfcetimer.c
+index 601772f..4b89682 100644
+--- a/src/xfcetimer.c
++++ b/src/xfcetimer.c
+@@ -190,7 +190,7 @@ static gboolean update_function (gpointer data){
+ 
+     dialog = gtk_message_dialog_new (NULL, GTK_DIALOG_MODAL,
+                                     GTK_MESSAGE_WARNING,
+-                                    GTK_BUTTONS_NONE, dialog_message);
++                                    GTK_BUTTONS_NONE, "%s", dialog_message);
+                            
+     gtk_window_set_title ((GtkWindow *) dialog, dialog_title);                                    
+  
+-- 
+2.12.0
+
diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
index d61235fe0..961519285 100644
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
@@ -6,5 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae39271267fd63eb7619432ff24e7ff1"
 
 inherit xfce-panel-plugin
 
+SRC_URI += "file://0001-Specify-string-format-explicitly.patch"
+
 SRC_URI[md5sum] = "3be2a4ccfb2af20441b1d25c2cea5f28"
 SRC_URI[sha256sum] = "39d7d21f099bc4219f6a6156142f0bbb8374986ee1970a9c0c8dc138b87f867c"
-- 
2.12.1


