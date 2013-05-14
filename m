Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UcBAo-0004co-LF
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 11:05:30 +0200
Received: by mail-ee0-f41.google.com with SMTP id d4so159613eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 01:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=lYfkKJmAOKU6JtTRpEFLwDpXK9jlg+eaNzRRhSw3pds=;
	b=TQs+fg811vD/rEY7aTTG0MgI/leYuqCBO1Qbt3gCoD42dazCaRA5bErRSKm9DRbTIl
	EhVJcRaiv6FhlCchE+USKFck+WRvpNRnd4TZ9Bp8I7R8i69A4GufVhd6LusZzR0+bcyt
	TVnPxThm5CQZcnY7u4zWZX3I+Ipbicmip3dOy7Pw/t46yilV1RvLBBOLJNNqDHA1/D4C
	X3tHNaIInMUcEuyjfqDQJoz+xclOMdzkgXtxSKVqORVVgyar3bi3KuogXO4xO5r5WoBZ
	1xZLwNqgLIE7YjEU+UEj5NZAU7Lg+qGoYi2CAkk/eHxHT6H5IAqZVBncRNWvUMidQqOu
	zPtA==
X-Received: by 10.15.24.136 with SMTP id j8mr88155496eeu.39.1368521239878;
	Tue, 14 May 2013 01:47:19 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id l6sm27969513eem.9.2013.05.14.01.47.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 14 May 2013 01:47:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 May 2013 10:44:50 +0200
Message-Id: <1368521090-5184-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] maliit-framework: fix build with glib 2.36
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
X-List-Received-Date: Tue, 14 May 2013 09:05:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream code has seen many structural changes and the failing test is gone.
Since changing to latest sources might cause huge reworking/test-efforts this
patch only fixes the build error.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...iit_glib_settings-fix-build-for-glib-2.36.patch |   33 ++++++++++++++++++++
 .../recipes-support/maliit/maliit-framework_git.bb |    2 +
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0002-ut_maliit_glib_settings-fix-build-for-glib-2.36.patch

diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0002-ut_maliit_glib_settings-fix-build-for-glib-2.36.patch b/meta-oe/recipes-support/maliit/maliit-framework/0002-ut_maliit_glib_settings-fix-build-for-glib-2.36.patch
new file mode 100644
index 0000000..df4f179
--- /dev/null
+++ b/meta-oe/recipes-support/maliit/maliit-framework/0002-ut_maliit_glib_settings-fix-build-for-glib-2.36.patch
@@ -0,0 +1,33 @@
+From 839e0933f09309a0374aa58cc58439c3a1f157b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 14 May 2013 10:24:48 +0200
+Subject: [PATCH] ut_maliit_glib_settings: fix build for glib 2.36
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [code removed upstream]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ .../ut_maliit_glib_settings.c                      |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/tests/ut_maliit_glib_settings/ut_maliit_glib_settings.c b/tests/ut_maliit_glib_settings/ut_maliit_glib_settings.c
+index 476ba33..09b6261 100644
+--- a/tests/ut_maliit_glib_settings/ut_maliit_glib_settings.c
++++ b/tests/ut_maliit_glib_settings/ut_maliit_glib_settings.c
+@@ -188,8 +188,9 @@ test_settings_manager_emits_disconnected(void)
+ int
+ main (int argc, char **argv) {
+     g_test_init(&argc, &argv, NULL);
++#if !GLIB_CHECK_VERSION (2, 36, 0)
+     g_type_init();
+-
++#endif
+     g_test_add_func("/ut_maliit_glib_settings/MaliitSettingsManager/preferred_description_locale/default",
+                     test_preferred_description_locale_default);
+     g_test_add_func("/ut_maliit_glib_settings/MaliitSettingsManager/preferred_description_locale/set-get-roundtrip",
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 2928562..15719f4 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -11,11 +11,13 @@ SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
     file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
+    file://0002-ut_maliit_glib_settings-fix-build-for-glib-2.36.patch \
     file://maliit-server.desktop \
 "
 
 SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
 PV = "0.92.3+git${SRCPV}"
+PR = "r1"
 
 
 PACKAGES =+ "${PN}-gtk"
-- 
1.7.6.5



