Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Oe7HP-0006vN-Or
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 16:07:13 +0200
Received: by fxm12 with SMTP id 12so1281740fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YxOqgcOAU+SnAvm3Lw2VV7SmmnAo0UtEwCMY1Z4LQkQ=;
	b=fOEUmkPeLa7h7vtrMMLzWASTxPu0TQgtZQ+sUG1CptVls4s/ZKiKYkD8I60DGCEqma
	yn/17Xfl9W0QVdAOsXuS8xmrvhNMlobOAPaZKOpkneXpMYFgAQwtSf8pnjCm0wEl7m8R
	jgD1IQqxEZIP38r0ZkV80wRo3BCXRShyXdaoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FVlCT4CCvrwnCaLoUBL1PSW8/kiuZ3SJnRfs7Ta7bOrezRD6K71TvFwScQogira/Uf
	QhuK0Pnb+HhAv5dZN8sDo+o5v1kzAjIr0hnyzUsLUz0LV6i0Ehwtb2mcfMf8HpvhK0Lf
	T8/7EtLC7iPuqRsgBlT2QfSrts/lCvNHo+1SI=
Received: by 10.223.111.78 with SMTP id r14mr10043404fap.29.1280325980345;
	Wed, 28 Jul 2010 07:06:20 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id b9sm2582565faq.7.2010.07.28.07.06.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 07:06:19 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Oe7Gv-0005d1-Fk; Wed, 28 Jul 2010 16:06:13 +0200
Date: Wed, 28 Jul 2010 16:06:13 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100728140613.GB19135@mx.loc>
References: <1280309434.7083.8.camel@utx.lan>
 <4C503315.8090009@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C503315.8090009@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)
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
X-List-Received-Date: Wed, 28 Jul 2010 14:07:17 -0000
X-Groupsio-MsgNum: 21541
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2010 at 03:39:33PM +0200, Marco Cavallini wrote:
>Stanislav Brabec ha scritto, Il 28/07/2010 11:30:
>> I just built an angstrom image and thinks failed.
>> 
>> lzma image depends on lzma-native, grep and other programs that use .xz
>> suffix for tarballs depend on xz-native.
>> This fact itself is bad - it creates file conflicts in the sysroot.
>> 
>> But things were even worse:
>> - xz-native staged xz binary and lzma as a symlink to xz.
>> - lzma-native tried to stage lzma 4 minutes later
>> 
>> But staging of lzma apparently went wrong. Instead of removal of lzma
>> symlink and installation of lzma binary, bitbake followed the symlink
>> and staged lzma as xz with a result of broken build environment.
>> 
>> I have bitbake-1.8.18.
>> 
>
>
>In the meantime we are waiting for a patch I used
> bitbake xz-native
>prior to launch
> bitbake x11-image

To rectify this extra manual step, one would need to something like the
attached (untested). This does not take care of diverting lzma/xz
binaries which is a separate issue.

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=fwd-xz-native1

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index b2de2b1..e4ad3bf 100644
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
+	[ "x${INHIBIT_AUTOTOOLS_DEPS_virtclass-native}" = "x" ] &&
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
index 3437836..57de77e 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -89,7 +89,7 @@ PKG_CONFIG_SYSROOT_DIR = ""
 
 ORIG_DEPENDS := "${DEPENDS}"
 
-DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
+DEPENDS_virtclass-native ?= "${@['${ORIG_DEPENDS}',''][bb.data.getVar('INHIBIT_DEFAULT_DEPS_virtclass-native', d, True) or False]}"
 
 python __anonymous () {
     # If we've a legacy native do_stage, we need to neuter do_install
@@ -111,7 +111,6 @@ python __anonymous () {
             if dep.endswith("-cross"):
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
-     
                 newdeps.append(dep + "-native")
             else:
                 newdeps.append(dep)
@@ -121,7 +120,6 @@ python __anonymous () {
             if prov.find(pn) != -1:
                 continue
             if not prov.endswith("-native"):
-    
                 provides = provides.replace(prov, prov + "-native")
         bb.data.setVar("PROVIDES", provides, d)
         bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", d, False) + ":virtclass-native", d)
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
index 8733023..24278e0 100644
--- a/recipes/xz/xz_4.999.9beta.bb
+++ b/recipes/xz/xz_4.999.9beta.bb
@@ -1,5 +1,7 @@
+INHIBIT_AUTOTOOLS_DEPS_virtclass-native = "1"
+INHIBIT_DEFAULT_DEPS_virtclass-native = "1"
 require xz.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
 SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
 SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"

--M9NhX3UHpAaciwkO--
