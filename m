Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88D4173163
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 14:28:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 1so4362254wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 06:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=uZ5q/rgcBOP8l8aqN4bBHtZpW03fR+D3tH8k9sMg+N0=;
	b=0QmlUIBiwcX7YP1/MWhdC8e03T8caDbXI0jR5F++xYaDaQyTQdiBp1/krs7tCIruy4
	xxDTszQImejm+B3Ey23gxnybLyYqtselfjWlYce0wyeXpB7v920x2NCApN8MpMU0RipG
	HRdIBqxDjcUtqenKkJQOTR/lOD5WqMmYPGgoyq32U6mb/LYtx1B2+AOupAWsPgqCHRPT
	3v2ZhIwS8t+5aDCJbGdfocLMeQCdb5E/vNzFPLa9uHfXbhSDkabtLoKBLssZYU9rdjE/
	M7xSQ4nijaHLEwM+XCiuXdUaAF/DZpQ1f5ekA1GZJjtOgQOmeT+HmpjQH1d3DmfFWM2h
	rA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=uZ5q/rgcBOP8l8aqN4bBHtZpW03fR+D3tH8k9sMg+N0=;
	b=Te0b02guWlphb8C98BrjKOXRxFaYzQ+bheTh4glqP53R+ckd3LlO6yZIir2w+woguf
	TU6G21bfKbUgONzbsLbK9wuWlGJhY2kH8An0H19Zt4aACXG+0ZeRJfyxA3SyAWVPyxMm
	QAD0AUIz1XnBI9zSehMG5UGFpzuE53RvcC4fa8ns3Jvj1NWVwvymj/AcaBgRkcrbuBgu
	Yw/ctsRr02LZMhplzxQfHqQX8OZf4B6s4Q3eDCZBMeDaliuEVbsLcVHD8N8rV09X4J6E
	tGz+1pLtiP24zoBCpjYRP/cXkN4y0qyjV965GLtH/VhRHEt6KbUcNrDKHlGttCU2TBbY
	h3NA==
X-Gm-Message-State: AD7BkJJ1IV5WyDQnWjUcYvz0xMWOhLwWiw87pMeHn/UoSsgwlAX65iwI5ppFvIwhw+ShjQ==
X-Received: by 10.28.23.75 with SMTP id 72mr6483854wmx.50.1457015338114;
	Thu, 03 Mar 2016 06:28:58 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	k124sm9177231wmb.11.2016.03.03.06.28.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 06:28:56 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 15:28:48 +0100
Message-Id: <1457015330-16676-2-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457015330-16676-1-git-send-email-funman@videolan.org>
References: <20160302192515.GG10529@jama>
	<1457015330-16676-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 2/4] vlc: update to 2.2.2
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
X-List-Received-Date: Thu, 03 Mar 2016 14:28:57 -0000

Drop rdp.c patch obsoleted by upstream changes
---
 .../vlc/vlc/0009-fix-rdp-module.patch                 | 19 -------------------
 meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb   | 18 ------------------
 meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb   | 17 +++++++++++++++++
 3 files changed, 17 insertions(+), 37 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch
deleted file mode 100644
index 8e554a9..0000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0009-fix-rdp-module.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- a/modules/access/rdp.c	2015-10-22 19:42:24.447445250 +0000
-+++ b/modules/access/rdp.c	2015-10-22 19:42:46.570445248 +0000
-@@ -428,8 +428,6 @@
-     if ( p_sys->f_fps <= 0 ) p_sys->f_fps = 1.0;
-     p_sys->i_frame_interval = 1000000 / p_sys->f_fps;
- 
--    freerdp_channels_global_init();
--
-     p_sys->p_instance = freerdp_new();
-     if ( !p_sys->p_instance )
-     {
-@@ -504,7 +502,6 @@
- 
-     freerdp_disconnect( p_sys->p_instance );
-     freerdp_free( p_sys->p_instance );
--    freerdp_channels_global_uninit();
- 
-     if ( p_sys->p_block )
-         block_Release( p_sys->p_block );
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
deleted file mode 100644
index fa9d11a..0000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require ${BPN}.inc
-
-# work around build failure
-EXTRA_OECONF += " --enable-libxml2=no"
-
-SRC_URI += "file://0001-enable-subdir-objects.patch \
-            file://0002-glibc-does-not-provide-strlcpy.patch \
-            file://0003-use-am-path-libgcrypt.patch \
-            file://0004-modules-gui-qt4-out-of-tree-build.patch \
-            file://0005-libpostproc-header-check.patch \
-            file://0006-make-opencv-configurable.patch \
-            file://0007-use-vorbisidec.patch \
-            file://0008-fix-luaL-checkint.patch \
-            file://0009-fix-rdp-module.patch \
-"
-
-SRC_URI[md5sum] = "42273945758b521c408fabc7fd6d9946"
-SRC_URI[sha256sum] = "543d9d7e378ec0fa1ee2e7f7f5acf8c456c7d0ecc32037171523197ef3cf1fcb"
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
new file mode 100644
index 0000000..5b15839
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
@@ -0,0 +1,17 @@
+require ${BPN}.inc
+
+# work around build failure
+EXTRA_OECONF += " --enable-libxml2=no"
+
+SRC_URI += "file://0001-enable-subdir-objects.patch \
+            file://0002-glibc-does-not-provide-strlcpy.patch \
+            file://0003-use-am-path-libgcrypt.patch \
+            file://0004-modules-gui-qt4-out-of-tree-build.patch \
+            file://0005-libpostproc-header-check.patch \
+            file://0006-make-opencv-configurable.patch \
+            file://0007-use-vorbisidec.patch \
+            file://0008-fix-luaL-checkint.patch \
+"
+
+SRC_URI[md5sum] = "f98d60f0f59ef72b6e3407f2ff09bda6"
+SRC_URI[sha256sum] = "9ad23128be16f9b40ed772961272cb0748ed8e4aa1bc79c129e589feebea5fb5"
-- 
2.5.0


