Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 365FB70927
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 10:22:11 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id A359130B03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 12:22:11 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jul 2014 12:22:06 +0200
Message-Id: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jul 2014 10:22:18 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../chromium/0002-Disable-API-keys-info-bar.patch  | 33 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_35.0.1916.114.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/0002-Disable-API-keys-info-bar.patch

diff --git a/recipes-browser/chromium/chromium/0002-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/0002-Disable-API-keys-info-bar.patch
new file mode 100644
index 0000000..5b5962a
--- /dev/null
+++ b/recipes-browser/chromium/chromium/0002-Disable-API-keys-info-bar.patch
@@ -0,0 +1,33 @@
+From e3a694a5324b9fab58875f2a1bd4cbe48fe6e151 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Mon, 9 Jun 2014 15:05:11 +0200
+Subject: [PATCH] Disable API keys info bar
+
+Upstream-Status: Inappropriate [other]
+The info bar is not a bug; it is just undesirable in some use cases.
+A clean approach - which requires discussion with upstream - is to
+disable it by using a command line option.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
+index 5014219..bb2a39d 100644
+--- a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
++++ b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
+@@ -18,8 +18,10 @@ void GoogleApiKeysInfoBarDelegate::Create(InfoBarService* infobar_service) {
+   if (google_apis::HasKeysConfigured())
+     return;
+ 
++#if 0
+   infobar_service->AddInfoBar(ConfirmInfoBarDelegate::CreateInfoBar(
+       scoped_ptr<ConfirmInfoBarDelegate>(new GoogleApiKeysInfoBarDelegate())));
++#endif
+ }
+ 
+ GoogleApiKeysInfoBarDelegate::GoogleApiKeysInfoBarDelegate()
+-- 
+1.8.3.2
+
diff --git a/recipes-browser/chromium/chromium_35.0.1916.114.bb b/recipes-browser/chromium/chromium_35.0.1916.114.bb
index cab3782..c1021c0 100644
--- a/recipes-browser/chromium/chromium_35.0.1916.114.bb
+++ b/recipes-browser/chromium/chromium_35.0.1916.114.bb
@@ -8,6 +8,7 @@ SRC_URI = "\
         file://oe-defaults.gypi \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://remove-linux-accel-canvas-from-blacklist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://0002-Disable-API-keys-info-bar.patch', '', d)} \
         file://unistd-2.patch \
         file://fix-glib-deprecated-warning.patch \
         file://google-chrome \
-- 
1.8.3.2


