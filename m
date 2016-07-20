Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8D26FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:51:45 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q62so4753802qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xD0dfdu2JxXnX0i+e9qIXJ8eYGjxxwQUv7VYN5ygCj8=;
	b=BPHXu2IBaVH5tPtpZzTraH14t2NfBOIVlsTBXCiT0mbdkHaY/GQMxZcbCNDXen7U0K
	eXQJ7XSvimZSePXhonDta34XLIyiFICy93eX/o3PO/feslyWT8NMUvzD25QOC/ZL2+so
	3cjSOUpqwD+n0+F80+AOheKSthRml0eM7ZgbFSKcqb4E9nQ0D2pfZbAtZSPyS/lxwoiI
	vyRAHKLUw/CrFo/9lhUcJP5iL4MBy4Jjj0GleihCzPHVNL37fF6y5wU+LY+4FDjJfLm5
	NYu7LawVMkeWzo8FCdhzGLt6u+vd7WKwU5OmPGPYk837d0HfNfgn5tMtm8m3nPM0jdoB
	AXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xD0dfdu2JxXnX0i+e9qIXJ8eYGjxxwQUv7VYN5ygCj8=;
	b=RXyXSWDWAplPqBfp9eL6ktv7M/42QsK/4Psk0bwSbxT7NNjNnr9NBAn8RClpIebW7/
	+0rg4d3fGI2Lxb6yQtahg0bPK4oPFDHAuZD+JvmsQu+ZtdWCpwdLDWbmhsgijsqdGIbp
	7RLDSkETbdChnA8oFkuRaKGoCrzCijKtk3c7vih1LwZk95hdI/2B3gAi+n5pDmKJ7gK3
	DyuL52oBVGC6MkFz5YPn5rxFIFu48fbwGIq3T7l5pl6UfZGbZYrYsT7dRsQEiTDytg0t
	1lWhULtuoTeCZNeJihepVgkwJeFytLFh+Nl225Uh+kOfOTjyJbTQhZfcg1bj2eaptZD2
	Tsxg==
X-Gm-Message-State: ALyK8tLRlvwdM1viuPOO8aQ12gcX19mHKxM0RTb6HywKypfYnMdZ23WgmUYOniRiTObEdQ==
X-Received: by 10.55.11.20 with SMTP id 20mr65042908qkl.160.1469044305544;
	Wed, 20 Jul 2016 12:51:45 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l1sm2258049qtd.49.2016.07.20.12.51.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 12:51:44 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 15:52:01 -0400
Message-Id: <20160720195201.22250-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160720195201.22250-1-twoerner@gmail.com>
References: <20160720195201.22250-1-twoerner@gmail.com>
Subject: [meta-browser][PATCH 4/4] chromium-x11: update 48.0.2548.0 -> 52.0.2743.76
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
X-List-Received-Date: Wed, 20 Jul 2016 19:51:45 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc      |  1 +
 .../chromium/chromium-wayland_48.0.2548.0.bb       |  9 +--
 .../chromium/chromium-x11_48.0.2548.0.bb           | 19 -----
 .../chromium/chromium-x11_52.0.2743.76.bb          | 18 +++++
 .../0002-Disable-API-keys-info-bar.patch           | 33 ---------
 ...accelerated-Canvas-support-from-blacklist.patch | 49 -------------
 .../0002-Disable-API-keys-info-bar.patch           | 33 ---------
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch | 43 -----------
 ...y-i18n_process_css_test.html-file-to-avoi.patch | 26 -------
 ...erride-root-filesystem-access-restriction.patch | 30 --------
 .../0011-Replace-readdir_r-with-readdir.patch      | 55 +-------------
 .../chromium-x11/add_missing_stat_h_include.patch  | 12 +--
 .../chromium/chromium-x11/remove-Werror.patch      | 85 +++++++++++-----------
 ...accelerated-Canvas-support-from-blacklist.patch |  0
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch |  0
 ...y-i18n_process_css_test.html-file-to-avoi.patch |  0
 ...erride-root-filesystem-access-restriction.patch |  0
 recipes-browser/chromium/files/api-keys.patch      | 13 ++++
 18 files changed, 87 insertions(+), 339 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium-x11_48.0.2548.0.bb
 create mode 100644 recipes-browser/chromium/chromium-x11_52.0.2743.76.bb
 delete mode 100644 recipes-browser/chromium/chromium/chromium-wayland/0002-Disable-API-keys-info-bar.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
 delete mode 100644 recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch
 rename recipes-browser/chromium/{chromium/chromium-wayland => files}/0001-Remove-accelerated-Canvas-support-from-blacklist.patch (100%)
 rename recipes-browser/chromium/{chromium/chromium-wayland => files}/0003-Remove-hard-coded-values-for-CC-and-CXX.patch (100%)
 rename recipes-browser/chromium/{chromium/chromium-wayland => files}/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch (100%)
 rename recipes-browser/chromium/{chromium/chromium-wayland => files}/0005-Override-root-filesystem-access-restriction.patch (100%)
 create mode 100644 recipes-browser/chromium/files/api-keys.patch

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index fc7ac04..4fb47fd 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -23,6 +23,7 @@ SRC_URI = "\
         file://include.gypi \
         file://oe-defaults.gypi \
         file://google-chrome \
+        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://api-keys.patch;patchdir=${WORKDIR}', '', d)} \
         file://google-chrome.desktop \
 "
 
diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
index a5d59a0..b1a32dc 100644
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
@@ -4,16 +4,15 @@ DEPENDS += "wayland libxkbcommon"
 
 SRC_URI += "\
         file://chromium-wayland/add_missing_stat_h_include.patch \
-        file://chromium-wayland/0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
-        file://chromium-wayland/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
-        file://chromium-wayland/0005-Override-root-filesystem-access-restriction.patch \
+        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
+        file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
+        file://0005-Override-root-filesystem-access-restriction.patch \
 	file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch \
 	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium-wayland/remove-Werror.patch \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-wayland/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-wayland/0002-Disable-API-keys-info-bar.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
diff --git a/recipes-browser/chromium/chromium-x11_48.0.2548.0.bb b/recipes-browser/chromium/chromium-x11_48.0.2548.0.bb
deleted file mode 100644
index c446b7f..0000000
--- a/recipes-browser/chromium/chromium-x11_48.0.2548.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-include chromium-browser.inc
-
-DEPENDS += "xextproto gtk+ libxi libxss"
-
-SRC_URI += "\
-        file://chromium-x11/add_missing_stat_h_include.patch \
-        file://chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
-        file://chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
-        file://chromium-x11/0005-Override-root-filesystem-access-restriction.patch \
-        file://chromium-x11/0011-Replace-readdir_r-with-readdir.patch \
-        file://chromium-x11/remove-Werror.patch \
-        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-x11/0002-Disable-API-keys-info-bar.patch', '', d)} \
-"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
-SRC_URI[md5sum] = "0534981cc21efcd11e64b67b85854420"
-SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8"
diff --git a/recipes-browser/chromium/chromium-x11_52.0.2743.76.bb b/recipes-browser/chromium/chromium-x11_52.0.2743.76.bb
new file mode 100644
index 0000000..dcf1d2d
--- /dev/null
+++ b/recipes-browser/chromium/chromium-x11_52.0.2743.76.bb
@@ -0,0 +1,18 @@
+include chromium-browser.inc
+
+DEPENDS += "xextproto gtk+ libxi libxss"
+
+SRC_URI += "\
+        file://chromium-x11/add_missing_stat_h_include.patch \
+        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
+        file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
+        file://0005-Override-root-filesystem-access-restriction.patch \
+        file://chromium-x11/0011-Replace-readdir_r-with-readdir.patch \
+        file://chromium-x11/remove-Werror.patch \
+        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
+SRC_URI[md5sum] = "0fee71466e1f2dc39ed4549d04b58ee2"
+SRC_URI[sha256sum] = "c54cdc11c3324152f3d5be98dcb4eae2bda0fc9dac7dd5f9010150458d68c18c"
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/0002-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-wayland/0002-Disable-API-keys-info-bar.patch
deleted file mode 100644
index 56a5b28..0000000
--- a/recipes-browser/chromium/chromium/chromium-wayland/0002-Disable-API-keys-info-bar.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 68773f2faea2608145e820bf23cf5efaf50e3399 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Mon, 9 Jun 2014 15:05:11 +0200
-Subject: [PATCH] Disable API keys info bar
-
-Upstream-Status: Inappropriate [other]
-The info bar is not a bug; it is just undesirable in some use cases.
-A clean approach - which requires discussion with upstream - is to
-disable it by using a command line option.
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
-index edea11a..4aef68f 100644
---- a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
-+++ b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
-@@ -18,8 +18,10 @@ void GoogleApiKeysInfoBarDelegate::Create(InfoBarService* infobar_service) {
-   if (google_apis::HasKeysConfigured())
-     return;
- 
-+#if 0
-   infobar_service->AddInfoBar(infobar_service->CreateConfirmInfoBar(
-       scoped_ptr<ConfirmInfoBarDelegate>(new GoogleApiKeysInfoBarDelegate())));
-+#endif
- }
- 
- GoogleApiKeysInfoBarDelegate::GoogleApiKeysInfoBarDelegate()
--- 
-1.9.1
-
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
deleted file mode 100644
index 2d7bf84..0000000
--- a/recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From be6f1d02f3f784594642929dff289dae33014d56 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sun, 3 Apr 2016 17:46:59 +0200
-Subject: [PATCH] Remove accelerated Canvas support from blacklist
-
-Together with the --gpu-no-context-lost command line switch, this patch is
-necessary to enable hardware accelerated 2D canvas rendering when using
-EGL.
-
-Note the implications on the behavior of Canvas, in particular with lost
-contexts, as discussed here:
-
-http://lists.whatwg.org/htdig.cgi/whatwg-whatwg.org/2012-September/206450.html
-
-Upstream-Status: Inappropiate [see link above]
----
- gpu/config/software_rendering_list_json.cc | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
-index 484467d..c3b5855 100644
---- a/gpu/config/software_rendering_list_json.cc
-+++ b/gpu/config/software_rendering_list_json.cc
-@@ -240,22 +240,6 @@ const char kSoftwareRenderingListJson[] = LONG_STRING_CONST(
-       ]
-     },
-     {
--      "id": 24,
--      "description": "Accelerated 2d canvas is unstable in Linux at the moment",
--      "os": {
--        "type": "linux"
--      },
--      "exceptions": [
--        {
--          "gl_vendor": "Vivante Corporation", 
--          "gl_renderer": "Vivante GC1000"
--        }
--      ],
--      "features": [
--        "accelerated_2d_canvas"
--      ]
--    },
--    {
-       "id": 27,
-       "description": "ATI/AMD cards with older drivers in Linux are crash-prone",
-       "cr_bugs": [95934, 94973, 136240, 357314],
--- 
-2.5.0
-
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch
deleted file mode 100644
index 56a5b28..0000000
--- a/recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 68773f2faea2608145e820bf23cf5efaf50e3399 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Mon, 9 Jun 2014 15:05:11 +0200
-Subject: [PATCH] Disable API keys info bar
-
-Upstream-Status: Inappropriate [other]
-The info bar is not a bug; it is just undesirable in some use cases.
-A clean approach - which requires discussion with upstream - is to
-disable it by using a command line option.
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
-index edea11a..4aef68f 100644
---- a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
-+++ b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
-@@ -18,8 +18,10 @@ void GoogleApiKeysInfoBarDelegate::Create(InfoBarService* infobar_service) {
-   if (google_apis::HasKeysConfigured())
-     return;
- 
-+#if 0
-   infobar_service->AddInfoBar(infobar_service->CreateConfirmInfoBar(
-       scoped_ptr<ConfirmInfoBarDelegate>(new GoogleApiKeysInfoBarDelegate())));
-+#endif
- }
- 
- GoogleApiKeysInfoBarDelegate::GoogleApiKeysInfoBarDelegate()
--- 
-1.9.1
-
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
deleted file mode 100644
index 7bc8d14..0000000
--- a/recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sun, 12 Oct 2014 19:31:47 +0200
-Subject: [PATCH] Remove hard coded values for CC and CXX
-
-In spite of what the comment says, the environment variables do *not*
-override the variables; "which which arm-linux-gnueabihf-gcc" etc. are
-always called. To undo this, remove the change.
-
-Upstream-Status: Pending
-
-The default values cannot be overriden without the patch; upstream
-might be interested in this.
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- build/common.gypi | 10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/build/common.gypi b/build/common.gypi
-index 7ec5ae2..11e8d1d 100644
---- a/build/common.gypi
-+++ b/build/common.gypi
-@@ -6047,16 +6047,6 @@
-         ['CXX.host', '<(host_cxx)'],
-       ],
-     }],
--    ['OS=="linux" and target_arch=="arm" and host_arch!="arm" and chromeos==0 and clang==0', {
--      # Set default ARM cross tools on linux.  These can be overridden
--      # using CC,CXX,CC.host and CXX.host environment variables.
--      'make_global_settings': [
--        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
--        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
--        ['CC.host', '<(host_cc)'],
--        ['CXX.host', '<(host_cxx)'],
--      ],
--    }],
-     # TODO(yyanagisawa): supports GENERATOR==make
-     #  make generator doesn't support CC_wrapper without CC
-     #  in make_global_settings yet.
--- 
-1.9.1
-
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch b/recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
deleted file mode 100644
index 24bec71..0000000
--- a/recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5158da97132db1a43c95f4c0ad65b4ac2629c4da Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sat, 23 Apr 2016 14:05:04 +0200
-Subject: [PATCH] Create empty i18n_process_css_test.html file to avoid build
- failure
-
-According to https://groups.google.com/a/chromium.org/forum/#!topic/chromium-packagers/9JX1N2nf4PU
-creating an empty i18n_process_css_test.html is a valid workaround for the
-following build error:
-
-"Exception: Failed to open test/data/webui/i18n_process_css_test.html while trying to flatten test/data/webui/i18n_process_css_test.html. (No such file or directory)"
-
-Upstream-Status: Pending
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- chrome/test/data/webui/i18n_process_css_test.html | 0
- 1 file changed, 0 insertions(+), 0 deletions(-)
- create mode 100644 chrome/test/data/webui/i18n_process_css_test.html
-
-diff --git a/chrome/test/data/webui/i18n_process_css_test.html b/chrome/test/data/webui/i18n_process_css_test.html
-new file mode 100644
-index 0000000..e69de29
--- 
-2.5.0
-
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch b/recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch
deleted file mode 100644
index ceb6c6c..0000000
--- a/recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ef3aaa58be440c1845e60432a498501088da07fe Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Thu, 28 Apr 2016 09:29:59 +0200
-Subject: [PATCH] Override root filesystem access restriction
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- sandbox/linux/suid/client/setuid_sandbox_client.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/sandbox/linux/suid/client/setuid_sandbox_client.cc b/sandbox/linux/suid/client/setuid_sandbox_client.cc
-index 12ef7f9..b59908a 100644
---- a/sandbox/linux/suid/client/setuid_sandbox_client.cc
-+++ b/sandbox/linux/suid/client/setuid_sandbox_client.cc
-@@ -21,8 +21,12 @@
- namespace {
- 
- bool IsFileSystemAccessDenied() {
-+#if 0
-   base::ScopedFD root_dir(HANDLE_EINTR(open("/", O_RDONLY)));
-   return !root_dir.is_valid();
-+#else
-+  return true;
-+#endif
- }
- 
- int GetHelperApi(base::Environment* env) {
--- 
-2.5.0
-
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch b/recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch
index 36c7ec2..eaf9568 100644
--- a/recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch
+++ b/recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch
@@ -20,10 +20,10 @@ diff --git a/base/files/file_enumerator_posix.cc b/base/files/file_enumerator_po
 index 7533a24..637b8cd 100644
 --- a/base/files/file_enumerator_posix.cc
 +++ b/base/files/file_enumerator_posix.cc
-@@ -7,6 +7,7 @@
- #include <dirent.h>
+@@ -8,6 +8,7 @@
  #include <errno.h>
  #include <fnmatch.h>
+ #include <stdint.h>
 +#include <string.h>
  
  #include "base/logging.h"
@@ -135,57 +135,6 @@ index 8341b4a..1603415 100644
      if (S_ISDIR(s.st_mode)) {
        return true;
      }
-diff --git a/third_party/boringssl/src/crypto/directory_posix.c b/third_party/boringssl/src/crypto/directory_posix.c
-index b944b69..17143a7 100644
---- a/third_party/boringssl/src/crypto/directory_posix.c
-+++ b/third_party/boringssl/src/crypto/directory_posix.c
-@@ -24,10 +24,6 @@
-  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */
- 
--#if !defined(_POSIX_C_SOURCE)
--#define _POSIX_C_SOURCE 201409  /* for readdir_r */
--#endif
--
- #include "directory.h"
- 
- 
-@@ -38,21 +34,6 @@
- #include <stdlib.h>
- #include <string.h>
- 
--#if defined(OPENSSL_PNACL)
--/* pnacl doesn't include readdir_r! So we do the best we can. */
--int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result) {
--  errno = 0;
--  *result = readdir(dirp);
--  if (*result != NULL) {
--    return 0;
--  }
--  if (errno) {
--    return 1;
--  }
--  return 0;
--}
--#endif
--
- struct OPENSSL_dir_context_st {
-   DIR *dir;
-   struct dirent dirent;
-@@ -85,10 +66,10 @@ const char *OPENSSL_DIR_read(OPENSSL_DIR_CTX **ctx, const char *directory) {
-     }
-   }
- 
--  if (readdir_r((*ctx)->dir, &(*ctx)->dirent, &dirent) != 0 ||
--      dirent == NULL) {
-+  errno = 0;
-+  dirent = readdir((*ctx)->dir);
-+  if (dirent == NULL || errno != 0)
-     return 0;
--  }
- 
-   return (*ctx)->dirent.d_name;
- }
 diff --git a/third_party/crashpad/crashpad/util/posix/close_multiple.cc b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
 index d94d575..4c1287a 100644
 --- a/third_party/crashpad/crashpad/util/posix/close_multiple.cc
diff --git a/recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch b/recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch
index 4620db2..dc34437 100644
--- a/recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch
+++ b/recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch
@@ -27,13 +27,13 @@ Tested with ARCH armv7.
 Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
 Upstream-Status: Pending
 
---- a/components/storage_monitor/storage_monitor_linux.cc~	2015-01-21 21:28:16.000000000 +0100
-+++ b/components/storage_monitor/storage_monitor_linux.cc	2015-10-27 13:21:08.405655894 +0100
-@@ -8,6 +8,7 @@
- 
+--- chromium-53.0.2774.4-ORIG/components/storage_monitor/storage_monitor_linux.cc       2016-06-22 12:04:10.000000000 -0400
++++ chromium-53.0.2774.4/components/storage_monitor/storage_monitor_linux.cc    2016-06-24 17:43:39.874640219 -0400
+@@ -9,6 +9,7 @@
  #include <mntent.h>
+ #include <stdint.h>
  #include <stdio.h>
 +#include <sys/stat.h>
- 
+ #include <limits>
  #include <list>
- 
+ #include <utility>
diff --git a/recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch b/recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch
index 2d1842b..e69b643 100644
--- a/recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch
+++ b/recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch
@@ -1,8 +1,8 @@
-Index: chromium-48.0.2548.0/build/common.gypi
+Index: chromium-53.0.2774.4/build/common.gypi
 ===================================================================
---- chromium-48.0.2548.0.orig/build/common.gypi
-+++ chromium-48.0.2548.0/build/common.gypi
-@@ -1421,7 +1421,7 @@
+--- chromium-53.0.2774.4.orig/build/common.gypi
++++ chromium-53.0.2774.4/build/common.gypi
+@@ -1446,7 +1446,7 @@
  
      # Disable fatal linker warnings, similarly to how we make it possible
      # to disable -Werror (e.g. for different toolchain versions).
@@ -11,9 +11,9 @@ Index: chromium-48.0.2548.0/build/common.gypi
  
      'release_valgrind_build%': 0,
  
-@@ -3135,12 +3135,6 @@
-               '-Wsign-compare',
-             ]
+@@ -3074,12 +3074,6 @@
+             # third-party code either.
+             'cflags!': [ '-Wall' ],
            }],
 -          # TODO: Fix all warnings on chromeos too.
 -          [ 'os_posix==1 and OS!="mac" and OS!="ios" and (clang!=1 or chromeos==1)', {
@@ -21,53 +21,54 @@ Index: chromium-48.0.2548.0/build/common.gypi
 -              '-Werror',
 -            ],
 -          }],
-           [ 'os_posix==1 and os_bsd!=1 and OS!="mac" and OS!="android"', {
-             'cflags': [
-               # Don't warn about ignoring the return value from e.g. close().
-@@ -3692,10 +3686,10 @@
+           [ 'OS=="win"', {
+             'defines': [
+               '_CRT_SECURE_NO_DEPRECATE',
+@@ -3615,10 +3609,10 @@
      }],
      ['os_posix==1 and OS!="mac" and OS!="ios"', {
        'target_defaults': {
 -        # Enable -Werror by default, but put it in a variable so it can
-+        # Disable -Werror by default, but put it in a variable so it can
++        # Disable -Werror by default and put it in a variable so it can
          # be disabled in ~/.gyp/include.gypi on the valgrind builders.
          'variables': {
 -          'werror%': '-Werror',
 +          'werror%': '',
            'libraries_for_target%': '',
-         },
-         'defines': [
-@@ -5045,7 +5039,7 @@
+           'conditions' : [
+             # Enable -Wextra for chromium_code when we control the compiler.
+@@ -5076,7 +5070,7 @@
            'GCC_OBJC_CALL_CXX_CDTORS': 'YES',        # -fobjc-call-cxx-cdtors
            'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES',      # -fvisibility=hidden
            'GCC_THREADSAFE_STATICS': 'NO',           # -fno-threadsafe-statics
 -          'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',    # -Werror
-+          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',     # -Werror
-           'GCC_VERSION': '4.2',
-           'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',  # -Wnewline-eof
++          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',    # -Werror
+           'GCC_VERSION': 'com.apple.compilers.llvm.clang.1_0',
            'USE_HEADERMAP': 'NO',
-Index: chromium-48.0.2548.0/build/config/compiler/BUILD.gn
+           'WARNING_CFLAGS': [
+Index: chromium-53.0.2774.4/build/config/compiler/BUILD.gn
 ===================================================================
---- chromium-48.0.2548.0.orig/build/config/compiler/BUILD.gn
-+++ chromium-48.0.2548.0/build/config/compiler/BUILD.gn
-@@ -687,7 +687,6 @@ config("default_warnings") {
-     cflags += [
-       # Enables.
-       "-Wendif-labels",  # Weird old-style text after an #endif.
--      "-Werror",  # Warnings as errors.
- 
-       # Disables.
-       "-Wno-missing-field-initializers",  # "struct foo f = {0};"
-Index: chromium-48.0.2548.0/build/nocompile.gypi
-===================================================================
---- chromium-48.0.2548.0.orig/build/nocompile.gypi
-+++ chromium-48.0.2548.0/build/nocompile.gypi
-@@ -81,7 +81,7 @@
-             '<(nocompile_driver)',
-             '4', # number of compilers to invoke in parallel.
-             '<(RULE_INPUT_PATH)',
--            '-Wall -Werror -Wfatal-errors -I<(DEPTH)',
-+            '-Wall -I<(DEPTH)',
-             '<(nc_result_path)',
-             ],
-           'message': 'Generating no compile results for <(RULE_INPUT_PATH)',
+--- chromium-53.0.2774.4.orig/build/config/compiler/BUILD.gn
++++ chromium-53.0.2774.4/build/config/compiler/BUILD.gn
+@@ -1040,9 +1040,6 @@ config("chromium_code") {
+     cflags = [ "/W4" ]  # Warning level 4.
+   } else {
+     cflags = [ "-Wall" ]
+-    if (treat_warnings_as_errors) {
+-      cflags += [ "-Werror" ]
+-    }
+     if (is_clang) {
+       # Enable -Wextra for chromium_code when we control the compiler.
+       cflags += [ "-Wextra" ]
+@@ -1089,11 +1086,6 @@ config("no_chromium_code") {
+       "_CRT_NONSTDC_NO_DEPRECATE",
+     ]
+   } else {
+-    # GCC may emit unsuppressible warnings so don't add -Werror for no chromium
+-    # code. crbug.com/589724
+-    if (treat_warnings_as_errors && is_clang) {
+-      cflags += [ "-Werror" ]
+-    }
+     if (is_clang && !is_nacl) {
+       # TODO(thakis): Remove !is_nacl once
+       # https://codereview.webrtc.org/1552863002/ made its way into chromium.
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/0001-Remove-accelerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/files/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-wayland/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
rename to recipes-browser/chromium/files/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-wayland/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
rename to recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch b/recipes-browser/chromium/files/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-wayland/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
rename to recipes-browser/chromium/files/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/0005-Override-root-filesystem-access-restriction.patch b/recipes-browser/chromium/files/0005-Override-root-filesystem-access-restriction.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-wayland/0005-Override-root-filesystem-access-restriction.patch
rename to recipes-browser/chromium/files/0005-Override-root-filesystem-access-restriction.patch
diff --git a/recipes-browser/chromium/files/api-keys.patch b/recipes-browser/chromium/files/api-keys.patch
new file mode 100644
index 0000000..85dc40c
--- /dev/null
+++ b/recipes-browser/chromium/files/api-keys.patch
@@ -0,0 +1,13 @@
+--- a/google-chrome	2016-07-08 09:47:11.121810646 -0400
++++ b/google-chrome	2016-07-08 09:47:37.881683637 -0400
+@@ -3,6 +3,10 @@
+ export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
+ export LD_LIBRARY_PATH=/usr/lib/chromium
+ 
++export GOOGLE_API_KEY="no"
++export GOOGLE_DEFAULT_CLIENT_ID="no"
++export GOOGLE_DEFAULT_CLIENT_SECRET="no"
++
+ CHROME_EXTRA_ARGS=""
+ if [ "`whoami`" = "root" ] ; then
+ 	CHROME_EXTRA_ARGS="${CHROME_EXTRA_ARGS} --user-data-dir=ROOT_HOME/.chromium/"
-- 
2.9.0


