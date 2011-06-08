Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUBy3-0007b9-EL
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 08:10:16 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so160340bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=94XHI2DSbaXzpXPQVxvN7I34/0yUXz6C0Xqde1ZJKS4=;
	b=VwXPgYFRc7WQrQ5gGhOE/poxXzUjN0+WTPkIGWqL7HpDUwlocAh9JWwO5lBOYHDXgC
	lVcOWRI4m1hANMeIalLb5jp0wrRZknMC4WuzZXgJF6qSrF0HhSFjyRTjTq+Aw61d8Ko3
	FRIm1VsVK7kP+Mx3avXqPul0Bun+iwGdsW2Us=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=M5NdDneBSscATAK1/IG8gbzKJ7a0UnfbouAiwLC1FcA5VqVYV2pGnHf5vRmvodmUWl
	mNWSlb7673H0eKynRJfU8KWYTcAeKPzDziQi+qI3e3R/MbSKmlKNSrj9uQAX3rLSSoq2
	n60A/0hf4eYL341PwHTPhWQtetwGnj9bGOM94=
Received: by 10.204.38.5 with SMTP id z5mr583287bkd.111.1307513219412;
	Tue, 07 Jun 2011 23:06:59 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 16sm204837bkm.14.2011.06.07.23.06.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:06:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 08:06:41 +0200
Message-Id: <d734dca244980b2c6a02de9f41a4f914e5b3a9d9.1307513108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <9b79d5dee5765c2d9e8a1489244eccdfb0870e12.1307513108.git.Martin.Jansa@gmail.com>
References: <9b79d5dee5765c2d9e8a1489244eccdfb0870e12.1307513108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1307513108.git.Martin.Jansa@gmail.com>
References: <cover.1307513108.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/3] webkit-efl: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Wed, 08 Jun 2011 06:10:16 -0000

* currently it doesn't build with default pkg-config from oe-core
  http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003798.html
  if build pkg-config-native before this patch
  http://cgit.freedesktop.org/pkg-config/commit/?id=69a7eaa6763bb0920e2b539fffbad51348d94deb
  then webkit-efl builds fine again

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../webkit/webkit-efl/revert.r78057.patch          |   19 +++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   42 ++++++++++++++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch b/meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch
new file mode 100644
index 0000000..966a977
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch
@@ -0,0 +1,19 @@
+see https://bugs.webkit.org/show_bug.cgi?id=50762
+fixed by:
+http://trac.webkit.org/changeset/78047/trunk/Source/WebCore/CMakeLists.txt
+fix reverted by:
+http://trac.webkit.org/changeset/78057/trunk/Source/WebCore/CMakeLists.txt
+
+so revert revert as we care about webkit-efl and don't care about WinCE
+
+Index: Source/WebCore/CMakeLists.txt
+===================================================================
+--- Source/WebCore/CMakeLists.txt	(revision 78042)
++++ Source/WebCore/CMakeLists.txt	(revision 78047)
+@@ -1157,6 +1157,4 @@
+ 
+     platform/Arena.cpp
+-    platform/ContextMenu.cpp
+-    platform/ContextMenuItem.cpp
+     platform/ContentType.cpp
+     platform/CrossThreadCopier.cpp
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
new file mode 100644
index 0000000..ee1e18d
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Webkit browser engine, EFL edition"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
+                    file://JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
+                    file://WebKit/efl/ewk/EWebKit.h;endline=20;md5=55ea170b1582797d2c69712de850f2fa \
+"
+
+DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
+           libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
+           libxml2 pango eina ecore evas edje"
+
+SRCREV = "79192"
+PV = "1.3.11+svnr${SRCPV}"
+
+SRCREV_FORMAT = "source"
+
+SRC_URI = "\
+  svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http;subdir=src \
+  file://revert.r78057.patch \
+ "
+
+S = "${WORKDIR}/src/Source"
+
+inherit cmake lib_package pkgconfig
+
+# Wants to jump too far for THUMB on armv4t
+# in WebCore::DocTypeStringsHash::doctype_hash_function(char const*, unsigned int)':
+# DocTypeStrings.cpp:(.text._ZN7WebCore18DocTypeStringsHash21doctype_hash_functionEPKcj[WebCore::DocTypeStringsHash::doctype_hash_function(char const*, unsigned int)]+0x12): relocation truncated to fit: R_ARM_THM_CALL against symbol `__gnu_thumb1_case_uhi' defined in .text section in x86_64-linux/usr/armv4t/lib/gcc/arm-oe-linux-gnueabi/4.5.2/libgcc.a(_thumb1_case_uhi.o)
+# the same in WebCore::CSSValueKeywordsHash::value_hash_function(char const*, unsigned int)':
+#             WebCore::CSSPropertyNamesHash::propery_hash_function(char const*, unsigned int)':
+#             WebCore::ColorDataHash::colordata_hash_function(char const*, unsigned int)':
+ARM_INSTRUCTION_SET = "ARM"
+
+EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=ON"
+
+LEAD_SONAME = "libewebkit.so"
+PACKAGES =+ "${PN}launcher-dbg ${PN}launcher"
+
+FILES_${PN} += "${datadir}/webkit-1.0/theme/default.edj ${datadir}/ewebkit-0/themes/default.edj"
+FILES_${PN}launcher = "${bindir}/EWebLauncher"
+FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
-- 
1.7.5.3



