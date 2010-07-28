Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OeBAn-0007DL-2v
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 20:16:23 +0200
Received: by fxm12 with SMTP id 12so1446858fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 11:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition
	:content-transfer-encoding:user-agent;
	bh=sx68jyoTDy7j4Z2eigonmeaVZaUfCkrEKxL3e21cYws=;
	b=ZSZ8tFS12hRo2KQADyIt5cEvjK9j4WaHzG24k+QVXVCngTnKn4za6zAdn9tkjmXyrS
	uTxdBq93eH8e2shEmH7Cu2zGBf5o3kj71MbMEfRt4tlMRrBZM2tZd2xOkavg04Sl0UXq
	Aejze54YFob2NC75vVrn2gIlaLSrFaHsmewfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:content-transfer-encoding:user-agent;
	b=ppmYi0Jtbe6WZa8UCIcwsjqJeWrslueIv79c75dijBWSeMzzPDDnggdKK72tyIQHXy
	rIgktDzLQDn8m/OpHqeQ4i4ah3ZBrB6NrQ3sTCDfVWLa7LbcvxkOvga1qqcRU7LKPUm7
	rMA/TcK3apq2u1tAZ5JfGDbVCZowX7wEzfess=
Received: by 10.223.110.212 with SMTP id o20mr10479248fap.27.1280340949780;
	Wed, 28 Jul 2010 11:15:49 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id b36sm2710559faq.11.2010.07.28.11.15.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 11:15:49 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OeBAL-00075w-V3; Wed, 28 Jul 2010 20:15:41 +0200
Date: Wed, 28 Jul 2010 20:15:41 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100728181541.GE19135@mx.loc>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH, RFC] automatically depend .tar.xz SRC_URIs on xz-native
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
X-List-Received-Date: Wed, 28 Jul 2010 18:16:28 -0000
X-Groupsio-MsgNum: 21560
Content-Type: multipart/mixed; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

The attached RFC would automatically depend do_unpack on xz-native
to help people who do not have xz packaged for their buildhost ¹).

It contains extra work for situations where autoconf comes from an .xz
compressed tarball: In these situations, we know that we can
configure the xz-native tarball right away without autoreconf'ing.

I've successfully built micro-image for qemux86 after moving my host's
xz out of the way and with the following packages in .tar.xz format:
m4, mpfr.


Comments?
TIA and cheers,

¹) Ideally we would see if xz (or any
sanity.bbclass::required_utilities) is on the host and fallback to build
the native variant otherwise. This may not be worth the effort though.

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=fwd-xz-native3

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
index 1847491..c4856d1 100644
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
@@ -420,12 +424,16 @@ python () {
 
     # unzip-native should already be staged before unpacking ZIP recipes
     need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
-    src_uri = bb.data.getVar('SRC_URI', d, 1)
 
-    if ".zip" in src_uri or need_unzip == "1":
+    if ".zip" in srcuri or need_unzip == "1":
         depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
         depends = depends + " unzip-native:do_populate_sysroot"
         bb.data.setVarFlag('do_unpack', 'depends', depends, d)
+    for ext in ['xz']: #['gzip', 'bzip2', 'xz']:
+        if '.' + ext in srcuri:
+            depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
+            depends += ' ' + ext + '-native:do_populate_sysroot'
+            bb.data.setVarFlag('do_unpack', 'depends', depends, d)
 
     # 'multimachine' handling
     mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
diff --git a/classes/native.bbclass b/classes/native.bbclass
index 3437836..9539d30 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -88,8 +88,7 @@ PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
 PKG_CONFIG_SYSROOT_DIR = ""
 
 ORIG_DEPENDS := "${DEPENDS}"
-
-DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
+DEPENDS_virtclass-native ?= "${@base_conditional('INHIBIT_DEFAULT_DEPS_virtclass-native', '1', '', '${ORIG_DEPENDS}', d)}"
 
 python __anonymous () {
     # If we've a legacy native do_stage, we need to neuter do_install
@@ -111,7 +110,6 @@ python __anonymous () {
             if dep.endswith("-cross"):
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
-     
                 newdeps.append(dep + "-native")
             else:
                 newdeps.append(dep)
@@ -121,9 +119,9 @@ python __anonymous () {
             if prov.find(pn) != -1:
                 continue
             if not prov.endswith("-native"):
-    
                 provides = provides.replace(prov, prov + "-native")
         bb.data.setVar("PROVIDES", provides, d)
         bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", d, False) + ":virtclass-native", d)
+        bb.data.setVar("INHIBIT_AUTORECONF", bb.data.getVar("INHIBIT_AUTORECONF_virtclass-native", d, True), d)
 }
 
diff --git a/recipes/grep/grep_2.6.3.bb b/recipes/grep/grep_2.6.3.bb
index 981c062..5c76bab 100644
--- a/recipes/grep/grep_2.6.3.bb
+++ b/recipes/grep/grep_2.6.3.bb
@@ -3,8 +3,6 @@ SECTION = "console/utils"
 DESCRIPTION = "grep GNU utility"
 PR = "r2"
 
-do_unpack[depends] += "xz-native:do_populate_sysroot"
-
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://uclibc-fix.patch"
 
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

--CdrF4e02JqNVZeln--
