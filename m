Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GHUex-0002eQ-Jy
	for openembedded-devel@openembedded.org; Mon, 28 Aug 2006 02:07:25 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id D05689C8DC;
	Mon, 28 Aug 2006 10:05:27 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05782-04; Mon, 28 Aug 2006 10:05:22 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 954DE9C871;
	Mon, 28 Aug 2006 10:05:22 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 7CDC9D6B2FC; Mon, 28 Aug 2006 10:05:22 +1000 (EST)
Date: Mon, 28 Aug 2006 10:05:22 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@openembedded.org
Message-ID: <20060828000522.GA2868@twibble.org>
References: <20060817105325.GA2172@twibble.org>
	<20060817153312.GA23152@twibble.org>
	<20060825053341.GA29761@twibble.org>
	<1156493289.5554.2.camel@localhost.localdomain>
	<20060825082210.GA18599@twibble.org>
	<1156495256.5554.16.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1156495256.5554.16.camel@localhost.localdomain>
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
X-List-Received-Date: Mon, 28 Aug 2006 00:07:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2006 at 09:40:56AM +0100, Richard Purdie wrote:
[...]
> config-info.bclass? site-config.bbclass? Calling it autotools-info

Ok, renamed to config-info.bbclass.

[...]
> option like endiness, why not have a variable which contains the
> endiness set by the class and use base_conditional to get the value you

And I've set some variables and made made use of base_conditional now
also - that works well.

Here's my current patch with examples for openssl and net-snmp using
base_conditional:

# 
# old_revision [1e0480e593c593d843d47a6544316b0a4962aabc]
# 
# add_file "classes/config-info.bbclass"
#  content [8f5ae6c352748a5abdecb295e1ed6e45d6d26f23]
# 
# patch "classes/autotools.bbclass"
#  from [9467624c157cb8970b3658f48e7952ac0fa11fcc]
#    to [8641748ec51a12f9d91fefe054dc3cfec7bbe8f2]
# 
# patch "packages/net-snmp/net-snmp_5.1.2.bb"
#  from [b7fa972e12bd3059d7830244f8cf6f3baa933c5b]
#    to [935cbe24aaddf4489a0a7c779092a8649ca9bc0e]
# 
# patch "packages/openssl/openssl.inc"
#  from [f31f2327d25b80adafc3098cc53e6327891e3bc3]
#    to [c995ed00c1d37d995145bf9519a803e6f6ce6121]
# 
============================================================
--- classes/config-info.bbclass	8f5ae6c352748a5abdecb295e1ed6e45d6d26f23
+++ classes/config-info.bbclass	8f5ae6c352748a5abdecb295e1ed6e45d6d26f23
@@ -0,0 +1,72 @@
+# config-info.bbclass
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
+def get_config_info_for(target, what, d):
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
+			return target
+		# otherwise get the information from the table
+		return info.get(what, "")
+	else:
+		bb.error("Information not available for target '%s'" % target)
+
+#
+# Returns information about 'what' for the current target
+#
+def get_config_info(what, d):
+	import bb
+	target = bb.data.getVar('HOST_ARCH', d, 1) + "-" + bb.data.getVar('HOST_OS', d, 1)
+	return get_config_info_for(target, what, d)
+
+#
+# Make some information available via variables
+#
+CONFIG_INFO_ENDIANESS	= "${@get_config_info('endianess', d)}"
+CONFIG_INFO_BITS	= "${@get_config_info('bits', d)}"
+CONFIG_INFO_LIBC	= "${@get_config_info('libc', d)}"
+CONFIG_INFO_ALIAS	= "${@get_config_info('alias', d)}"
============================================================
--- classes/autotools.bbclass	9467624c157cb8970b3658f48e7952ac0fa11fcc
+++ classes/autotools.bbclass	8641748ec51a12f9d91fefe054dc3cfec7bbe8f2
@@ -1,5 +1,67 @@
-inherit base
+inherit base config-info
 
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
+		tmp = get_config_info(i, d)
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
 
============================================================
--- packages/net-snmp/net-snmp_5.1.2.bb	b7fa972e12bd3059d7830244f8cf6f3baa933c5b
+++ packages/net-snmp/net-snmp_5.1.2.bb	935cbe24aaddf4489a0a7c779092a8649ca9bc0e
@@ -11,23 +11,15 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snm
 	file://snmpd.conf \
 	file://snmptrapd.conf"
 	
-inherit autotools
+inherit config-info autotools
 
 PARALLEL_MAKE = ""
 EXTRA_OECONF = "--enable-shared --disable-manuals" 
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 
 do_configure() {
-	# endianness fun... inspired by openssl.inc
-	. ${CONFIG_SITE}
-	if [ "x$ac_cv_c_bigendian" = "xyes" -o "x$ac_cv_c_littleendian" = "xno" ]; then
-	    ENDIANESS=" --with-endianness=big"
-	elif [ "x$ac_cv_c_littleendian" = "xyes" -o "x$ac_cv_c_bigendian" = "xno" ]; then
-	    ENDIANESS=" --with-endianness=little"
-	else
-	    oefatal do_configure cannot determine endianess
-	fi
-	oenote Determined endianess as: $ENDIANESS
+	# Additional flag based on target endiness (see config-info.bbclass)
+	ENDIANESS="${@base_conditional('CONFIG_INFO_ENDIANESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
 	oe_runconf $ENDIANESS
 }
 
============================================================
--- packages/openssl/openssl.inc	f31f2327d25b80adafc3098cc53e6327891e3bc3
+++ packages/openssl/openssl.inc	c995ed00c1d37d995145bf9519a803e6f6ce6121
@@ -6,6 +6,8 @@ S = "${WORKDIR}/openssl-${PV}"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz"
 S = "${WORKDIR}/openssl-${PV}"
 
+inherit config-info
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
+	CFLAG="${CFLAG} ${@base_conditional('CONFIG_INFO_ENDIANESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)}"
 
 	os=${HOST_OS}
 	if [ "x$os" = "xlinux-uclibc" ]; then


-- 
 Jamie Lenehan <lenehan@twibble.org>


