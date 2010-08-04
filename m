Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgbM5-0004er-M8
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 12:37:52 +0200
Received: by bwz10 with SMTP id 10so2734597bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=IDRxjMwigSg/0UdONk3/Vj9LzcP5q2BHWw2W4f5/Org=;
	b=AmKY0wmiXT3gGsb0o9rZPQXzd4EynY8pBuy3lrQa9EYkqdi8fnZcm9w6H+yoMHD4HF
	SSth4fqIoWDvoS62WNpgl1BopTPBey1lwSzvX75Ofs1uLU7+wO9UXmmFky2tKtV3Rokx
	BM8/tl4p4ZphXcKtLbRMJc2AWybCMJXU8BQUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HeoU3l4yXZGvA/mOmSAdCow5WJz18RERitz2Br4rBGZxyTPixzMKNj6suGkWrijyZV
	1zVgoK8DX6v5DL3SDgWH98REfez+KQ8ldxpzPPeXVx7Yl3V1t9HVNU5mJHJRxoxXsKva
	Wk0dSj0nBG0Ko16u6lZt2xhok+QQli7aVHbCs=
Received: by 10.204.77.137 with SMTP id g9mr6045169bkk.189.1280918265687;
	Wed, 04 Aug 2010 03:37:45 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id a11sm5835335bkc.0.2010.08.04.03.37.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 03:37:43 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OgbLv-00059g-3T; Wed, 04 Aug 2010 12:37:39 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 12:37:31 +0200
Message-Id: <1280918251-19703-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4C57294F.3030804@mentor.com>
References: <4C57294F.3030804@mentor.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: depend unpacking on native unpackers
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
X-List-Received-Date: Wed, 04 Aug 2010 10:37:52 -0000

Automatically depend do_unpack on the corresponding native unpacker.

If your package's SRC_URIs do not contain unambiguous extensions or are
misnamed (like .exe for ZIP'ed files) then add e.g.:
do_unpack[depends] += " unzip-native:do_populate_sysroot"

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/autotools.bbclass    |   17 ++++++++++++-----
 classes/base.bbclass         |   31 ++++++++++++++++---------------
 classes/native.bbclass       |    6 ++----
 recipes/xz/xz_4.999.9beta.bb |    5 ++++-
 4 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index b2de2b1..b2901ff 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -1,8 +1,14 @@
 # use autotools_stage_all for native packages
 AUTOTOOLS_NATIVE_STAGE_INSTALL = "1"
 
-def autotools_deps(d):
-	if bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS', d, 1):
+def autotools_deps(d, virtclass=None):
+	if virtclass:
+		virtclass_str = "_virtclass-%s" % (virtclass)
+	else:
+		virtclass_str = ""
+	if ((virtclass and bb.data.inherits_class(virtclass, d)) \
+	     or (virtclass is None)) \
+		and bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS' + virtclass_str, d, 1):
 		return ''
 
 	pn = bb.data.getVar('PN', d, 1)
@@ -17,7 +23,7 @@ def autotools_deps(d):
 		if not bb.data.inherits_class('native', d) \
                         and not bb.data.inherits_class('cross', d) \
                         and not bb.data.inherits_class('sdk', d) \
-                        and not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, 1):
+                        and not bb.data.getVar('INHIBIT_DEFAULT_DEPS' + virtclass_str, d, 1):
                     deps += 'libtool-cross '
 
 	return deps + 'gnu-config-native '
@@ -25,8 +31,8 @@ def autotools_deps(d):
 EXTRA_OEMAKE = ""
 
 DEPENDS_prepend = "${@autotools_deps(d)}"
-DEPENDS_virtclass-native_prepend = "${@autotools_deps(d)}"
-DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d)}"
+DEPENDS_virtclass-native_prepend = "${@autotools_deps(d, 'native')}"
+DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d, 'nativesdk')}"
 
 inherit siteinfo
 
@@ -86,6 +92,7 @@ oe_runconf () {
 }
 
 autotools_do_configure() {
+	[ "x${INHIBIT_AUTORECONF}" = "x" ] &&
 	case ${PN} in
 	autoconf*)
 	;;
diff --git a/classes/base.bbclass b/classes/base.bbclass
index 1847491..c4bdece 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -57,7 +57,11 @@ oe_runmake() {
 	${MAKE} ${EXTRA_OEMAKE} "$@" || die "oe_runmake failed"
 }
 
-def base_deps(d):
+def base_deps(d, virtclass=None):
+	if virtclass:
+		virtclass_str = "_virtclass-%s" % (virtclass)
+	else:
+		virtclass_str = ""
 	#
 	# Ideally this will check a flag so we will operate properly in
 	# the case where host == build == target, for now we don't work in
@@ -71,7 +75,7 @@ def base_deps(d):
 	# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
 	# we need that built is the responsibility of the patch function / class, not
 	# the application.
-	if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
+	if not bb.data.getVar('INHIBIT_DEFAULT_DEPS' + virtclass_str, d):
 		if (bb.data.getVar('HOST_SYS', d, 1) !=
 	     	    bb.data.getVar('BUILD_SYS', d, 1)):
 			deps += " virtual/${TARGET_PREFIX}gcc virtual/libc "
@@ -84,8 +88,8 @@ def base_deps(d):
 	return deps
 
 DEPENDS_prepend="${@base_deps(d)} "
-DEPENDS_virtclass-native_prepend="${@base_deps(d)} "
-DEPENDS_virtclass-nativesdk_prepend="${@base_deps(d)} "
+DEPENDS_virtclass-native_prepend="${@base_deps(d, 'native')} "
+DEPENDS_virtclass-nativesdk_prepend="${@base_deps(d, 'nativesdk')} "
 
 
 SCENEFUNCS += "base_scenefunction"
@@ -374,26 +378,24 @@ do_build[func] = "1"
 
 python () {
     import exceptions
+    import re
 
     source_mirror_fetch = bb.data.getVar('SOURCE_MIRROR_FETCH', d, 0)
     if not source_mirror_fetch:
         need_host = bb.data.getVar('COMPATIBLE_HOST', d, 1)
         if need_host:
-            import re
             this_host = bb.data.getVar('HOST_SYS', d, 1)
             if not re.match(need_host, this_host):
                 raise bb.parse.SkipPackage("incompatible with host %s" % this_host)
 
         need_machine = bb.data.getVar('COMPATIBLE_MACHINE', d, 1)
         if need_machine:
-            import re
             this_machine = bb.data.getVar('MACHINE', d, 1)
             if this_machine and not re.match(need_machine, this_machine):
                 raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
 
         need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
         if need_target:
-            import re
             this_target = bb.data.getVar('TARGET_SYS', d, 1)
             if this_target and not re.match(need_target, this_target):
                 raise bb.parse.SkipPackage("incompatible with target system %s" % this_target)
@@ -418,14 +420,13 @@ python () {
         depends = depends + " git-native:do_populate_sysroot"
         bb.data.setVarFlag('do_fetch', 'depends', depends, d)
 
-    # unzip-native should already be staged before unpacking ZIP recipes
-    need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
-    src_uri = bb.data.getVar('SRC_URI', d, 1)
-
-    if ".zip" in src_uri or need_unzip == "1":
-        depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
-        depends = depends + " unzip-native:do_populate_sysroot"
-        bb.data.setVarFlag('do_unpack', 'depends', depends, d)
+    # Make sure that native unpackers are staged before trying to unpack
+    for (ext, tool) in [('xz','xz'),('zip','unzip')]:
+        rex = re.compile('\.' + ext + '($|;|\s)')
+        if rex.search(srcuri):
+            depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
+            depends += ' ' + tool + '-native:do_populate_sysroot'
+            bb.data.setVarFlag('do_unpack', 'depends', depends, d)
 
     # 'multimachine' handling
     mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
diff --git a/classes/native.bbclass b/classes/native.bbclass
index 345bd80..e38fe20 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -88,8 +88,7 @@ PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
 PKG_CONFIG_SYSROOT_DIR = ""
 
 ORIG_DEPENDS := "${DEPENDS}"
-
-DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
+DEPENDS_virtclass-native ?= "${@base_conditional('INHIBIT_DEFAULT_DEPS_virtclass-native', '1', '', '${ORIG_DEPENDS}', d)}"
 
 def native_virtclass_add_override(d):
     if "native" in (bb.data.getVar('BBCLASSEXTEND', d, True) or ""):
@@ -117,7 +116,6 @@ python __anonymous () {
             if dep.endswith("-cross"):
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
-     
                 newdeps.append(dep + "-native")
             else:
                 newdeps.append(dep)
@@ -127,8 +125,8 @@ python __anonymous () {
             if prov.find(pn) != -1:
                 continue
             if not prov.endswith("-native"):
-    
                 provides = provides.replace(prov, prov + "-native")
         bb.data.setVar("PROVIDES", provides, d)
+        bb.data.setVar("INHIBIT_AUTORECONF", bb.data.getVar("INHIBIT_AUTORECONF_virtclass-native", d, True), d)
 }
 
diff --git a/recipes/xz/xz_4.999.9beta.bb b/recipes/xz/xz_4.999.9beta.bb
index 8733023..fe49412 100644
--- a/recipes/xz/xz_4.999.9beta.bb
+++ b/recipes/xz/xz_4.999.9beta.bb
@@ -1,5 +1,8 @@
+INHIBIT_AUTOTOOLS_DEPS_virtclass-native = "1"
+INHIBIT_DEFAULT_DEPS_virtclass-native = "1"
+INHIBIT_AUTORECONF_virtclass-native = "1"
 require xz.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
 SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
 SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"
-- 
1.7.1



