Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYD9x-0000dh-SJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 12:24:14 +0200
Received: by mail-ea0-f170.google.com with SMTP id z7so655743eaf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=ThpNBpPn0vGSNMpQdG04P8pLO2zprw8UJIwxhBb5TWM=;
	b=DX1TA8EZoiTjQexhdrH1YijhRr9jJGFhIh1VLt5m0p+C1Pdb90pP+8xaw7nQjHftdj
	/p/SKrtHJ1/C3DBtaLtHDQOhDmtno1C2SVW7F4X4zIDSfgYHvbPdvRf4ZgQKfZUfQH2S
	kEr7hMce/W86TO1jQ66gxfUvaZIcHTXydB5tvo8wf63vf16bXNxNxH6ixnvcb7s0Hdgm
	jfSeiaaMY+TKXMIRxxKKEoKMQeYaprN/gJ0woCmwwX1J+LVb9AiT2oIrl/A0HTdtDYEq
	m5V4rB0p/mCelX/leiSDzSzP87DJ8i89g7uSXm1nfaKnQF4NnPYJsqPQO2rhdUwYf+jr
	zaFg==
X-Received: by 10.15.36.2 with SMTP id h2mr29963108eev.2.1367575579240;
	Fri, 03 May 2013 03:06:19 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id l6sm14863997eem.9.2013.05.03.03.06.17
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 03:06:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 May 2013 12:03:52 +0200
Message-Id: <1367575432-5173-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: [PATCH] chromium: fix build with glib >= 2.35
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 10:24:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ser_main_loop.cc-fix-build-with-glib-2.35.patch |   42 ++++++++++++++++++++
 recipes-browser/chromium/chromium_24.0.1312.52.bb  |    3 +-
 2 files changed, 44 insertions(+), 1 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch

diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch b/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
new file mode 100644
index 0000000..cdf8051
--- /dev/null
+++ b/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
@@ -0,0 +1,42 @@
+From eb0c0c982322c0e366c1c854475ceda6342dd55a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 2 May 2013 15:12:24 +0200
+Subject: [PATCH] browser_main_loop.cc: fix build with glib > 2.35
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Applied [1]
+
+[1] http://code.ohloh.net/file?fid=pYuYekcDZUhiAoN5uY-KdIaKFTI&cid=0W4KUpSYxGo&s=&browser=Default#L0
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ content/browser/browser_main_loop.cc |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/content/browser/browser_main_loop.cc b/content/browser/browser_main_loop.cc
+index ad4b0c6..86deea3 100644
+--- a/content/browser/browser_main_loop.cc
++++ b/content/browser/browser_main_loop.cc
+@@ -687,12 +687,17 @@ void BrowserMainLoop::InitializeToolkit() {
+   // TODO(stevenjb): Move platform specific code into platform specific Parts
+   // (Need to add InitializeToolkit stage to BrowserParts).
+ #if defined(OS_LINUX) || defined(OS_OPENBSD)
++  // g_type_init will be deprecated in 2.36. 2.35 is the development
++  // version for 2.36, hence do not call g_type_init starting 2.35.
++  // http://developer.gnome.org/gobject/unstable/gobject-Type-Information.html#g-type-init
++#if !GLIB_CHECK_VERSION(2, 35, 0)
+   // Glib type system initialization. Needed at least for gconf,
+   // used in net/proxy/proxy_config_service_linux.cc. Most likely
+   // this is superfluous as gtk_init() ought to do this. It's
+   // definitely harmless, so retained as a reminder of this
+   // requirement for gconf.
+   g_type_init();
++#endif
+ 
+ #if !defined(USE_AURA)
+   gfx::GtkInitFromCommandLine(parsed_command_line_);
+-- 
+1.7.6.5
+
diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-browser/chromium/chromium_24.0.1312.52.bb
index 2827cc1..a9a2d28 100644
--- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
+++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
@@ -11,9 +11,10 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
         file://ui-gl-no-narrowing.patch \
         file://google-chrome \
         file://google-chrome.desktop \
+        file://0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch \
 "
 
-PR = "r1"
+PR = "r2"
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
 COMPATIBLE_MACHINE = "(-)"
-- 
1.7.6.5



