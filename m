Return-Path: <eric.nelson@boundarydevices.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6033D60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 18:46:48 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id eu11so9445123pac.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2014 11:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yjTgk5QdINAyLDBNXmN1Ok9zQ3RQ2sz2g9aJ4b7uGpo=;
	b=PNzZkKsdvF6p64RRH06gq7Tf2Hx8twnkwYWGDoUnlpltlqNTkRUl7t7uYyHmfoyay2
	IO1oYC9T82Cp5rWMGGLvRKr0Nroc/4HVWSziVvnc0UEg0hsgaf/u/IfJXwXfz9GMwF1b
	nFemEMHZC8uugibgy3prdJXc+jELDRTFvTNxhLbkn+lrzapjpJpwUOrSvA1DutqTClKN
	ab0FdIVDq+0+/1vtFlrO9n7j9YKFFOf3MSdLgGh+luscv0w5D4TX+16gdoTu/OBZWM7w
	tTr2mWn77yg0E1q/V+79974weT4q36pbLTPvoJrYSGpyco4iKmt3tfsEw3lbZa4Up/vv
	u1eg==
X-Gm-Message-State: ALoCoQl1r1GrKp6wNdzLuCuEJTdBOrU0wWQ8yYwwQN5zzbiy5LOd/BU1ZZDY0XjvPXSTachyH62t
X-Received: by 10.66.65.133 with SMTP id x5mr12876549pas.26.1412794009735;
	Wed, 08 Oct 2014 11:46:49 -0700 (PDT)
Received: from localhost.localdomain (174-19-208-215.phnx.qwest.net.
	[174.19.208.215])
	by mx.google.com with ESMTPSA id z7sm640390pdl.64.2014.10.08.11.46.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Oct 2014 11:46:48 -0700 (PDT)
From: Eric Nelson <eric.nelson@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Oct 2014 11:46:32 -0700
Message-Id: <1412793992-29793-1-git-send-email-eric.nelson@boundarydevices.com>
X-Mailer: git-send-email 1.9.1
Cc: otavio@ossystems.com.br
Subject: [meta-browser][PATCH][resend] chromium: conditionally compile routines for use with GLIB
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
X-List-Received-Date: Wed, 08 Oct 2014 18:46:50 -0000

The routine QuoteArgForDesktopFileExec is only called when GLIB is
used, and compilation will fail with the following error message
if it is compiled without GLIB support (e.g. under Wayland):
	"defined but not used [-Werror=unused-function]"

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 First e-mail bounced because I wasn't subscribed to the list

 ...ration-conditionally-compile-routines-for.patch | 41 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_37.0.2062.94.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/0001-shell-integration-conditionally-compile-routines-for.patch

diff --git a/recipes-browser/chromium/chromium/0001-shell-integration-conditionally-compile-routines-for.patch b/recipes-browser/chromium/chromium/0001-shell-integration-conditionally-compile-routines-for.patch
new file mode 100644
index 0000000..bf0f274
--- /dev/null
+++ b/recipes-browser/chromium/chromium/0001-shell-integration-conditionally-compile-routines-for.patch
@@ -0,0 +1,41 @@
+From 40659667549d1eec5c9ed29c6120584f6628d761 Mon Sep 17 00:00:00 2001
+From: Eric Nelson <eric.nelson@boundarydevices.com>
+Date: Mon, 6 Oct 2014 18:11:29 -0700
+Subject: [PATCH] shell integration: conditionally compile routines for use
+ with GLIB
+
+The routine QuoteArgForDesktopFileExec is only called when GLIB is
+used, and compilation will fail with the following error message
+if it is compiled.
+
+	"defined but not used [-Werror=unused-function]"
+
+Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
+---
+ chrome/browser/shell_integration_linux.cc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/chrome/browser/shell_integration_linux.cc b/chrome/browser/shell_integration_linux.cc
+index 24a1c55..bd82db4 100644
+--- a/chrome/browser/shell_integration_linux.cc
++++ b/chrome/browser/shell_integration_linux.cc
+@@ -260,6 +260,7 @@ void DeleteShortcutInApplicationsMenu(
+   LaunchXdgUtility(argv, &exit_code);
+ }
+ 
++#if defined(USE_GLIB)
+ // Quote a string such that it appears as one verbatim argument for the Exec
+ // key in a desktop file.
+ std::string QuoteArgForDesktopFileExec(const std::string& arg) {
+@@ -307,6 +308,8 @@ std::string QuoteCommandLineForDesktopFileExec(
+   return quoted_path;
+ }
+ 
++#endif
++
+ const char kDesktopEntry[] = "Desktop Entry";
+ 
+ const char kXdgOpenShebang[] = "#!/usr/bin/env xdg-open";
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium_37.0.2062.94.bb b/recipes-browser/chromium/chromium_37.0.2062.94.bb
index 3d4524b..c2b2b8b 100644
--- a/recipes-browser/chromium/chromium_37.0.2062.94.bb
+++ b/recipes-browser/chromium/chromium_37.0.2062.94.bb
@@ -13,6 +13,7 @@ SRC_URI = "\
         file://unistd-2.patch \
         file://google-chrome \
         file://google-chrome.desktop \
+        file://0001-shell-integration-conditionally-compile-routines-for.patch \
 "
 SRC_URI[md5sum] = "49bcf221a2e2e5406ae2e69964d01093"
 SRC_URI[sha256sum] = "d27c19580b74cbe143131f0bc097557b3b2fb3d2be966e688d8af51a779ce533"
-- 
1.9.1


