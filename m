Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 63A2B6B678
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 17:42:38 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so3625273eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r53/WGTVO2BVKfoL+CnD3fyslKfQKVV7LWC1yLq7hio=;
	b=avVpOZdjCI4M/pgo4yB2fWDoOUBacNv0Po+vWXJwNHOv42fZO/QmtK6/TBDo//iVZl
	z3QJf6WC6Ndn66lgt6t0Jh/Tfxq2Ny1kMn07rC85SOX2IiT1Vc2XPb2LFpqTt8vJqC0z
	re2iW6YX6SJLO9g7ZdsDI+prJ4zV5oJVyfmNec4txg0dTua0aoRKIMDquw7BxInuD6KS
	BZDsMRn9kaV3NC2LIMfm8YjJTqkQfr0Z7mDxleN4u+2nw/YzS3gTXNBt7PYKP84F+1bY
	VF5IzOy1XmQqIJ6FdqVbfxX58JztxPb9jCTi4AbIz4kkGHQy5xafTvefCGtou38vK64G
	d2nQ==
X-Received: by 10.14.32.67 with SMTP id n43mr19049626eea.17.1390239759116;
	Mon, 20 Jan 2014 09:42:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm5442206ees.4.2014.01.20.09.42.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 09:42:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2014 18:42:35 +0100
Message-Id: <1390239757-27055-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
	<1390239757-27055-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] efl: Adjust packaging to match more with old 1.7 separate recipes
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
X-List-Received-Date: Mon, 20 Jan 2014 17:42:39 -0000

* it improves upgrade-path, it's not perfect and I was testing it only on
  my SHR images which include lot of efl stuff, but not all, so some packages
  can still be a bit different

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 104 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 2a8f2a2..a5ed55b 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -52,8 +52,19 @@ do_configure_prepend_class-native() {
     sed -i 's/EFL_LIB_START_OPTIONAL(\[Eeze\], \[test "${have_linux}" = "yes"\])/EFL_LIB_START_OPTIONAL([Eeze], [test "${no-we-really-dont-want-native-eeze}" = "yes"])/g' ${S}/configure.ac
 }
 
-PACKAGES += "ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus"
-RPROVIDES_edje += "edje-utils"
+PACKAGES =+ "edje-utils embryo-utils embryo-tests efreet-trash efreet-mime libeet libefreet ecore-audio ecore-input-evas ecore-input ecore-imf-evas ecore-imf ecore-file ecore-con ecore-ipc ecore-x ecore-evas libemotion eo ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus"
+
+# upgrade path from 1.7
+DEBIAN_NOAUTONAME_ecore-audio = "1"
+DEBIAN_NOAUTONAME_ecore-input-evas = "1"
+DEBIAN_NOAUTONAME_ecore-input = "1"
+DEBIAN_NOAUTONAME_ecore-imf-evas = "1"
+DEBIAN_NOAUTONAME_ecore-imf = "1"
+DEBIAN_NOAUTONAME_ecore-file = "1"
+DEBIAN_NOAUTONAME_ecore-con = "1"
+DEBIAN_NOAUTONAME_ecore-ipc = "1"
+DEBIAN_NOAUTONAME_ecore-x = "1"
+DEBIAN_NOAUTONAME_ecore-evas = "1"
 
 python populate_packages_prepend () {
     for plugin_type in "engines loaders savers".split():
@@ -77,22 +88,102 @@ python populate_packages_prepend () {
 
 PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
 
+# PACKAGES_DYNAMIC + do_split_packages isn't used for all libe libs,
+# because PACKAGES_DYNAMIC would be catching too many patterns
+# (or need to list all possible prefixes) and not all original packages
+# were splitted like that, so it would need RCONFLICTS/RPROVIDES/RREPLACES
+# combos at least in few places for upgrade path.
+
+FILES_efreet-trash = " \
+    ${libdir}/libefreet_trash${SOLIBS} \
+"
+FILES_efreet-mime = " \
+    ${libdir}/libefreet_mime${SOLIBS} \
+"
+FILES_libeet = " \
+    ${libdir}/libeet${SOLIBS} \
+"
+FILES_libefreet = " \
+    ${libdir}/libefreet${SOLIBS} \
+"
+FILES_ecore-audio = "\
+    ${libdir}/libecore_audio${SOLIBS} \
+"
+FILES_ecore-input-evas = "\
+    ${libdir}/libecore_input_evas${SOLIBS} \
+"
+FILES_ecore-input = "\
+    ${libdir}/libecore_input${SOLIBS} \
+"
+FILES_ecore-imf-evas = "\
+    ${libdir}/libecore_imf_evas${SOLIBS} \
+"
+FILES_ecore-imf = "\
+    ${libdir}/libecore_imf${SOLIBS} \
+"
+FILES_ecore-file = "\
+    ${libdir}/libecore_file${SOLIBS} \
+"
+FILES_ecore-con = "\
+    ${libdir}/libecore_con${SOLIBS} \
+"
+FILES_ecore-ipc = "\
+    ${libdir}/libecore_ipc${SOLIBS} \
+"
+FILES_ecore-x = "\
+    ${libdir}/libecore_x${SOLIBS} \
+"
+FILES_ecore-evas = "\
+    ${libdir}/libecore_evas${SOLIBS} \
+"
+FILES_eio = "\
+    ${libdir}/libeio${SOLIBS} \
+"
+FILES_eina = "\
+    ${libdir}/libeina${SOLIBS} \
+    ${bindir}/eina-bench-cmp \
+"
+FILES_edje-utils = "\
+    ${bindir}/edje_* \
+    ${datadir}/edje/include/edje.inc \
+"
+FILES_eldbus = "\
+    ${libdir}/libeldbus${SOLIBS} \
+"
+FILES_eo = "\
+    ${libdir}/libeo${SOLIBS} \
+"
+FILES_libemotion = "\
+    ${libdir}/libemotion${SOLIBS} \
+"
 FILES_efreet = " \
+    ${datadir}/dbus-1/services/*Efreet* \
     ${libdir}/efreet/*/efreet*create \
     ${bindir}/efreetd \
     ${datadir}/efreet \
 "
 FILES_eet = " \
     ${bindir}/eet \
+    ${libdir}/libeet${SOLIBS} \
 "
 FILES_emotion = " \
     ${datadir}/emotion \
 "
+FILES_embryo-tests = " \
+    ${datadir}/embryo/ \
+"
+FILES_embryo-utils = " \
+    ${binddir}/embryo_* \
+"
 FILES_embryo = " \
-    ${datadir}/embryo \
+    ${libdir}/libembryo${SOLIBS} \
 "
 FILES_ethumb = " \
+    ${datadir}/dbus-1/services/*Ethumb* \
+    ${libdir}/libethumb${SOLIBS} \
+    ${libdir}/libethumb_client${SOLIBS} \
     ${bindir}/ethumbd \
+    ${bindir}/ethumbd_client \
     ${bindir}/ethumb \
     ${libdir}/ethumb/*/*/*/module.so \
     ${libdir}/ethumb/*/*/*/*.edj \
@@ -100,21 +191,27 @@ FILES_ethumb = " \
     ${datadir}/ethumb* \
 "
 FILES_ecore = " \
+    ${libdir}/libecore${SOLIBS} \
     ${libdir}/ecore*/*/*/*/module.so \
     ${datadir}/ecore* \
 "
 FILES_evas = " \
+    ${libdir}/libevas${SOLIBS} \
     ${libdir}/evas*/*/*/*/*/module.so \
     ${libdir}/evas*/*/*/*/*/*.edj \
     ${libdir}/evas/cserve2/bin/*/evas_cserve2* \
     ${datadir}/evas* \
+    ${bindir}/evas_cserve2_* \
 "
 
 FILES_eeze = " \
+    ${libdir}/libeeze${SOLIBS} \
     ${libdir}/eeze*/*/*/*/*/module.so \
     ${datadir}/eeze \
+    ${bindir}/eeze_* \
 "
 FILES_edje = " \
+    ${libdir}/libedje${SOLIBS} \
     ${libdir}/edje*/*/*/*/module.so \
     ${libdir}/edje/utils/*/epp \
     ${datadir}/edje \
@@ -141,5 +238,4 @@ FILES_${PN}-dev += " \
     ${datadir}/gdb/auto-load \
     ${datadir}/eo/gdb \
     ${bindir}/eldbus-codegen \
-    ${bindir}/eina-bench-cmp \
 "
-- 
1.8.5.3


