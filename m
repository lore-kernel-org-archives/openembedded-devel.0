Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RwyOy-0007sg-6z
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 17:05:16 +0100
Received: by eaal10 with SMTP id l10so1518703eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=S/4mM8l1Ft7YYoGOUXcasJY8jdlnuForCUr8FWpLubA=;
	b=De5ph8fNMqiJ98eHqi9qF2a6RI4bfAGnvI7CI/P0mgaHzQcEhcnNE6BEjDPj/46dU2
	HZAXMoVJ6p5Df8Ma2/MoSdZH1hmnJ6/RwnDK6298g+uIt0de9bhJ8lWEtzKgG3R3pxCr
	zpW34+SM92TzSGndDREGJxO8/BFBvnBU0c9sw=
Received: by 10.213.3.201 with SMTP id 9mr2784906ebo.93.1329148626870;
	Mon, 13 Feb 2012 07:57:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm2937956eea.5.2012.02.13.07.57.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:57:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:56:55 +0100
Message-Id: <2d1d85b8c16b655a71085d45c54bf7df8f84bbee.1329148318.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1329148318.git.Martin.Jansa@gmail.com>
References: <cover.1329148318.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 1/4] ecore: move /usr/lib/ecore/immodules/xim.so from ${PN}-dev to ${PN}-imf"
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
X-List-Received-Date: Mon, 13 Feb 2012 16:05:16 -0000

* it's needed for elementary entry too
* also add empty /usr/bin to fix QA

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore.inc |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 96bc26c..85e0204 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 inherit efl gettext
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 
 do_configure_prepend() {
 	touch ${S}/po/Makefile.in.in || true
@@ -57,7 +57,9 @@ RREPLACES_${PN}-txt = "libecore-txt-ver-pre-svn-01-0"
 RREPLACES_${PN}-x = "libecore-x-ver-pre-svn-01-0"
 RREPLACES_${PN}-input = "libecore-input-ver-pre-svn-01-0"
 
-FILES_${PN} = "${libdir}/libecore*.so.*"
+FILES_${PN} = "${libdir}/libecore*.so.* \
+  ${bindir} \
+"
 FILES_${PN}-con = "${libdir}/libecore_con*.so.*"
 FILES_${PN}-config = "${libdir}/libecore_config*.so.*"
 FILES_${PN}-desktop = "${libdir}/libecore_desktop*.so.*"
@@ -66,14 +68,15 @@ FILES_${PN}-sdl = "${libdir}/libecore_sdl*.so.*"
 FILES_${PN}-evas = "${libdir}/libecore_evas*.so.*"
 FILES_${PN}-fb = "${libdir}/libecore_fb*.so.*"
 FILES_${PN}-file = "${libdir}/libecore_file*.so.*"
-FILES_${PN}-imf = "${libdir}/libecore_imf*.so.*"
+FILES_${PN}-imf = "${libdir}/libecore_imf*.so.* \
+  ${libdir}/ecore/immodules/*.so \
+"
 FILES_${PN}-imf-evas = "${libdir}/libecore_imf_evas*.so.*"
 FILES_${PN}-ipc = "${libdir}/libecore_ipc*.so.*"
 FILES_${PN}-job = "${libdir}/libecore_job*.so.*"
 FILES_${PN}-txt = "${libdir}/libecore_txt*.so.*"
 FILES_${PN}-x = "${libdir}/libecore_x*.so.*"
 FILES_${PN}-input = "${libdir}/libecore_input*.so.*"
-FILES_${PN}-dev += "${libdir}/ecore/immodules/*.so"
 
 ECORE_OECONF = "\
   --x-includes=${STAGING_INCDIR}/X11 \
-- 
1.7.8.4



