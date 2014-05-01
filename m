Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2FF60703
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 20:44:54 +0000 (UTC)
Received: from localhost.localdomain (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id F095C2EAE1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 22:36:19 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 May 2014 22:36:08 +0200
Message-Id: <1398976570-3026-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1398976570-3026-1-git-send-email-dv@pseudoterminal.org>
References: <1398976570-3026-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH v3 2/4] chromium: Add variable to contain extra command-line arguments
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
X-List-Received-Date: Thu, 01 May 2014 20:44:55 -0000

With this patch it becomes possible to add extra command line options to
the "chrome" call in /usr/bin/google-chrome script .

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 recipes-browser/chromium/chromium/google-chrome  | 9 +++++----
 recipes-browser/chromium/chromium_35.0.1883.0.bb | 6 ++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
index 8ce400b..78f4a29 100644
--- a/recipes-browser/chromium/chromium/google-chrome
+++ b/recipes-browser/chromium/chromium/google-chrome
@@ -3,8 +3,9 @@
 export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
 export LD_LIBRARY_PATH=/usr/lib/chrome
 
-if [ "${USER}" = "root" ] ; then 
-	/usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
-else
-	/usr/bin/chrome/chrome $@
+CHROME_EXTRA_ARGS=""
+if [ "${USER}" = "root" ] ; then
+	CHROME_EXTRA_ARGS="${CHROME_EXTRA_ARGS} --user-data-dir=${HOME}/.chromium/"
 fi
+
+/usr/bin/chrome/chrome ${CHROME_EXTRA_ARGS} $@
diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
index 96d3344..5f4e807 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -33,6 +33,8 @@ EXTRA_OEGYP =	" \
 "
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
 
+CHROMIUM_EXTRA_ARGS ?= ""
+
 export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 do_configure() {
 	cd ${S}
@@ -54,6 +56,10 @@ do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
 
+	# Add extra command line arguments to google-chrome script by modifying
+	# the dummy "CHROME_EXTRA_ARGS" line
+	sed -i "s/^CHROME_EXTRA_ARGS=\"\"/CHROME_EXTRA_ARGS=\"${CHROMIUM_EXTRA_ARGS}\"/" ${D}${bindir}/google-chrome
+
 	install -d ${D}${datadir}/applications
 	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
 
-- 
1.8.3.2


