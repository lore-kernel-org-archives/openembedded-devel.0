Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GGULs-0001Ax-08
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Aug 2006 07:35:34 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 4E9D42349B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2006 15:33:47 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01740-03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2006 15:33:42 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 2001E1D796
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2006 15:33:42 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 0CD42DBFD6B; Fri, 25 Aug 2006 15:33:42 +1000 (EST)
Date: Fri, 25 Aug 2006 15:33:42 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060825053341.GA29761@twibble.org>
References: <20060817105325.GA2172@twibble.org>
	<20060817153312.GA23152@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20060817153312.GA23152@twibble.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: site/* - using common files for site information
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Aug 2006 05:35:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2006 at 01:33:12AM +1000, Jamie Lenehan wrote:
> On Thu, Aug 17, 2006 at 08:53:25PM +1000, Jamie Lenehan wrote:
> > Attached is a patch I'd like to propose to allow for multiple site
> > files to be used so that common stuff can be moved into common site
> [...]

I've extended this a bit to allow site files to be per package,
rather than having to be global - including version specific site
files (such as db needs). Lots of packages just need a few site file
entries which are generally common across all builds or specific to
glibc or uclibc.

Probably the most useful part is allowing all of the x86 site files
to be merged together.

If no one has any comments on this then I guess I'll push it in.
First the info.bbclass, then clean up the few recipes that directly
mess with CONFIG_SITE, then clean up the x86 files and the the few
recipes that I've been maintaining. 

=== oe-multi-site-file.patch ===

# 
# old_revision [ac2124fc98391df1b17c8e6b7041eecdfa7543ed]
# 
# add_file "classes/info.bbclass"
#  content [e4021d0330d1006610d2d86ba7a6ebd6a1afbf23]
# 
# patch "classes/autotools.bbclass"
#  from [9467624c157cb8970b3658f48e7952ac0fa11fcc]
#    to [e1849c9126d9460cb1c931e9a920ec02c3cb091c]
# 
============================================================
--- classes/info.bbclass	e4021d0330d1006610d2d86ba7a6ebd6a1afbf23
+++ classes/info.bbclass	e4021d0330d1006610d2d86ba7a6ebd6a1afbf23
@@ -0,0 +1,81 @@
+# info.bbclass
+#
+# This class exists to provide information about the targets that
+# may be needed by other classes and/or recipes. If you add a new
+# target this will probably need to be updated.
+#
+
+#
+# Returns information about 'what' for the named target 'target'
+# where 'target' == "<arch>-<os>"
+#
+# 'what' can be one of
+# * target: Returns the target name ("<arch>-<os>")
+# * endianess: Return "be" for big endian targets, "le" for little endian
+# * bits: Returns the bit size of the target, either "32" or "64"
+# * libc: Returns the name of the c library used by the target
+#
+# It is an error for the target not to exist.
+# If 'what' doesn't exist then an empty value is returned
+#
+def get_info_for_named_target(target, what, d):
+	import bb
+	targetinfo = {\
+		"armeb-linux":		dict(endianess="be", bits="32", libc="glibc" ),\
+		"armeb-linux-uclibc":	dict(endianess="be", bits="32", libc="uclibc"),\
+		"arm-linux":		dict(endianess="le", bits="32", libc="glibc" ),\
+		"arm-linux-gnueabi":	dict(endianess="le", bits="32", libc="gnueabi", alias="arm-linux"),\
+		"arm-linux-uclibc":	dict(endianess="le", bits="32", libc="uclibc" ),\
+		"i386-linux":		dict(endianess="le", bits="32", libc="glibc",  alias="ix86-linux"),\
+		"i486-linux":		dict(endianess="le", bits="32", libc="glibc",  alias="ix86-linux"),\
+		"i586-linux":		dict(endianess="le", bits="32", libc="glibc",  alias="ix86-linux"),\
+		"i686-linux":		dict(endianess="le", bits="32", libc="glibc",  alias="ix86-linux"),\
+		"i386-linux-uclibc":	dict(endianess="le", bits="32", libc="uclibc", alias="ix86-linux-uclibc"),\
+		"i486-linux-uclibc":	dict(endianess="le", bits="32", libc="uclibc", alias="ix86-linux-uclibc"),\
+		"i586-linux-uclibc":	dict(endianess="le", bits="32", libc="uclibc", alias="ix86-linux-uclibc"),\
+		"i686-linux-uclibc":	dict(endianess="le", bits="32", libc="uclibc", alias="ix86-linux-uclibc"),\
+		"mipsel-linux":		dict(endianess="le", bits="32", libc="glibc" ),\
+		"mipsel-linux-uclibc":	dict(endianess="le", bits="32", libc="uclibc"),\
+		"powerpc-darwin":	dict(endianess="be", bits="32", libc="darwin"),\
+		"powerpc-linux":	dict(endianess="be", bits="32", libc="glibc" ),\
+		"powerpc-linux-uclibc":	dict(endianess="be", bits="32", libc="uclibc"),\
+		"sh3-linux":		dict(endianess="le", bits="32", libc="glibc" ),\
+		"sh4-linux":		dict(endianess="le", bits="32", libc="glibc" ),\
+		"sh4-linux-uclibc":	dict(endianess="le", bits="32", libc="uclibc"),\
+		"sparc-linux":		dict(endianess="be", bits="32", libc="glibc" ),\
+		"x86_64-linux":		dict(endianess="le", bits="64", libc="glibc" ),\
+		"x86_64-linux-uclibc":	dict(endianess="le", bits="64", libc="uclibc")}
+	if targetinfo.has_key(target):
+		info = targetinfo[target]
+		# allow them to ask for the target name
+		if what == "target":
+			return target;
+		# otherwise get the information from the table
+		return info.get(what, "")
+	else:
+		bb.error("Information not available for target '%s'" % target)
+
+#
+# Returns information about 'what' for the current target
+#
+def get_info_for_target(what, d):
+	import bb
+	target = bb.data.getVar('HOST_ARCH', d, 1) + "-" + bb.data.getVar('HOST_OS', d, 1)
+	return get_info_for_named_target(target, what, d)
+
+
+#
+# Return the value of 'le' if the target is little endian, or 'be' if
+# it's big endian. Let's a recipe define a specific value based on
+# the endianess of the target without the need to write lots of
+# tests.
+#
+def get_info_choice_endianess(le, be, d):
+	import bb
+	e = get_info_for_target('endianess', d);
+	if e == 'le':
+		return le
+	if e == 'be':
+		return be
+	else:
+		bb.error("Endianess unknown for target '%s'" % target)
============================================================
--- classes/autotools.bbclass	9467624c157cb8970b3658f48e7952ac0fa11fcc
+++ classes/autotools.bbclass	e1849c9126d9460cb1c931e9a920ec02c3cb091c
@@ -1,5 +1,67 @@
-inherit base
+inherit base info
 
+#
+# Define which site files to use. We check for several site files and
+# use each one that is found in the following order:
+# 1) common		- common settings
+# 2) common-<libc>	- libc specified settings
+# 3) common-(32|64)bits	- bit-size specific settings
+# 4) common-(le|be)	- endianess specific settings
+# 5) <alias>		- target alias, if it has one
+# 6) <arch>-<os>	- target specific settings
+#
+# Search for the files in the following directories:
+# 1) ${BBPATH}/site (in reverse) - app specific, then site wide
+# 2) ${FILE_DIRNAME}/site-${PV}	 - app version specific
+#
+def get_config_site_files(d):
+	import bb, os
+	# How to map a specific type of info to the name of a site file
+	sitenamemap = { "common":    "%s", \
+			"libc":      "common-%s", \
+			"bits":      "common-%sbits", \
+			"endianess": "common-%s", \
+			"alias":     "%s", \
+			"target":    "%s" }
+	sites = []
+	sitefiles = ""
+
+	# Determine which site files to look for
+	for i in ["common", "libc", "bits", "endianess", "alias", "target"]:
+		tmp = get_info_for_target(i, d)
+		if tmp:
+			sites.append(sitenamemap[i] % tmp)
+
+	# Check along bbpath for site files and append in reverse order so
+	# the application specific sites files are last and system site
+	# files first.
+	path_bb = bb.data.getVar('BBPATH', d, 1)
+	for p in (path_bb or "").split(':'):
+		tmp = ""
+		for i in sites:
+			fname = os.path.join(p, 'site', i)
+			if os.path.exists(fname):
+				tmp += fname + " "
+		sitefiles = tmp + sitefiles;
+
+	# Now check for the applications version specific site files
+	path_pkgv = os.path.join(bb.data.getVar('FILE_DIRNAME', d, 1), "site-" + bb.data.getVar('PV', d, 1))
+	for i in sites:
+		fname = os.path.join(path_pkgv, i)
+		if os.path.exists(fname):
+			sitefiles += fname + " "
+
+	bb.debug(1, "SITE files " + sitefiles);
+	return sitefiles
+
+#
+# Export CONFIG_SITE to the enviroment. The autotools will make use
+# of this to determine where to load in variables from. This is a
+# space seperate list of shell scripts processed in the order listed.
+#
+export CONFIG_SITE = "${@get_config_site_files(d)}"
+
+
 def autotools_dep_prepend(d):
 	import bb;
 
=== oe-openssl-useinfo.patch ===

This is just an example of using the info class, and the methods I
added there, to clean up the openssl endianess selection code:

# 
# old_revision [ac2124fc98391df1b17c8e6b7041eecdfa7543ed]
# 
# patch "packages/openssl/openssl.inc"
#  from [f31f2327d25b80adafc3098cc53e6327891e3bc3]
#    to [7bf91f408b25843e121832d1c8baa068c66112c1]
# 
============================================================
--- packages/openssl/openssl.inc	f31f2327d25b80adafc3098cc53e6327891e3bc3
+++ packages/openssl/openssl.inc	7bf91f408b25843e121832d1c8baa068c66112c1
@@ -6,6 +6,8 @@ S = "${WORKDIR}/openssl-${PV}"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz"
 S = "${WORKDIR}/openssl-${PV}"
 
+inherit info
+
 AR_append = " r"
 export CFLAG = "-fPIC -DTHREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DTERMIO -Wall ${FULL_OPTIMIZATION}"
 
@@ -26,15 +28,8 @@ do_compile () {
 	cd ..
 	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
 
-	# endianness fun.. whee
-	. ${CONFIG_SITE}
-	if [ "x$ac_cv_c_bigendian" = "xyes" -o "x$ac_cv_c_littleendian" = "xno" ]; then
-		CFLAG="${CFLAG} -DB_ENDIAN"
-	elif [ "x$ac_cv_c_littleendian" = "xyes" -o "x$ac_cv_c_bigendian" = "xno" ]; then
-		CFLAG="${CFLAG} -DL_ENDIAN"
-	else
-		oefatal do_configure cannot determine endianess
-	fi
+	# Additional flag based on target endiness (see info.bbclass)
+	CFLAG="${CFLAG} ${@get_info_endianess_select('-DL_ENDIAN', '-DB_ENDIAN', d)}"
 
 	os=${HOST_OS}
 	if [ "x$os" = "xlinux-uclibc" ]; then

-- 
 Jamie Lenehan <lenehan@twibble.org>


