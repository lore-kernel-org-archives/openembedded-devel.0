Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 80D2F731D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 21:15:59 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id to18so20249732igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 13:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XdN6RMlo9KsWR5Vg2Q31FMXBLmOdJPVKmUS6ATYeqsE=;
	b=NzOgSMZSHERptuGqjJCbPyjk7xY8jE8sZ0WOxnsf5GjBgnEHb8uSscadrlfLWyqd53
	Lp666JGPIiz/4L0SFMwn5ltdJNc14KtFN5RUjPELQtL45Er54ID4H3JhEMMHMjQP6Wvt
	q4DoYHuUYSx1wrL+fsIG7TYJ1wX2ux+siCzQxKNU8YW8p6u4BYfGsla9wxj30Xq0WOUG
	jtYrlItthxdY7n+578L4tsEqYk4bKAqrk/ba+jbaN2wFUe8RD6ohEnh5F3MMYvkLC528
	xx7xiIrRjUxjRZUvRFt3WlYqCsNHyPhgrnm9jqYR3p5ZkkjMIEWjEQQ8Hss/I7/0ZoQf
	Tnow==
X-Received: by 10.50.6.104 with SMTP id z8mr5921767igz.58.1452028559919;
	Tue, 05 Jan 2016 13:15:59 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g67sm26731272ioe.34.2016.01.05.13.15.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 13:15:59 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:15:42 -0500
Message-Id: <1452028543-30812-3-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <1452028543-30812-1-git-send-email-twoerner@gmail.com>
References: <1452028543-30812-1-git-send-email-twoerner@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Gary Thomas <gary@mlbassoc.com>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: [meta-browser][PATCH 3/3] chromium: add kiosk-mode PACKAGECONFIG
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
X-List-Received-Date: Tue, 05 Jan 2016 21:15:59 -0000

If you are creating a kiosk, then enable this PACKAGECONFIG and the browser
will start up fullscreen and without menu bars etc.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium.inc             | 1 +
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 716988d..5e8aba6 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -25,6 +25,7 @@ PACKAGECONFIG[disable-api-keys-info-bar] = ""
 PACKAGECONFIG[ignore-lost-context] = ""
 PACKAGECONFIG[impl-side-painting] = ""
 PACKAGECONFIG[use-egl] = ""
+PACKAGECONFIG[kiosk-mode] = ""
 
 GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index e138628..dd42903 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -77,6 +77,11 @@ SRC_URI = "\
 #       development stages, it can improve performance See
 #       http://www.chromium.org/developers/design-documents/impl-side-painting
 #       for more.
+#
+# * kiosk-mode: (off by default)
+#       Enable this option if you want your browser to start up full-screen,
+#       without any menu bars, without any clutter, and without any initial
+#       start-up indicators.
 SRC_URI += "\
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-40/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://chromium-40/0002-Add-Linux-to-impl-side-painting-whitelist.patch', '', d)} \
@@ -86,6 +91,7 @@ CHROMIUM_EXTRA_ARGS ?= " \
 	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '--gpu-no-context-lost', '', d)} \
 	${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', '--enable-gpu-rasterization --enable-impl-side-painting', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'kiosk-mode', '--start-fullscreen --kiosk --no-first-run', '', d)} \
 "
 
 # Conditionally add ozone-wayland and its patches to the Chromium sources
-- 
2.7.0.rc3


