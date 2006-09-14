Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GNf0K-0007Dz-4e
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 02:22:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 9A9DC26FAD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2006 10:19:20 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25583-10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2006 10:19:19 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 5296E26F99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2006 10:19:19 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 2A96710B5207; Thu, 14 Sep 2006 10:19:19 +1000 (EST)
Date: Thu, 14 Sep 2006 10:19:19 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060914001918.GA8432@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
Mime-Version: 1.0
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: site/* Common site files
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
X-List-Received-Date: Thu, 14 Sep 2006 00:22:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Here's the common site file stuff again. The main patch is at the end
and includes one fix for the "common" site file which was broken in
the last patch (cleaned up the code and broke it).

It'd be nice to move forward on this. I'm going to remove all this
from my tree now to stop me from accidental using it (again!).

What this does is gives some flexibility with regards to site file
processing:

 - It allows site files to be per recipe. So instead of updating a
   global site file they can be added to the individual packages. 
   This is particularly in the case where the same variable needs to
   be set differently for different packages.

 - It allows site file aliases, so i386-linux, i486-linux, i586-linux
   and i686-linux could all be use a common i86-linux site file (the
   individual files could still be used if there was anything
   actually specific to i386 or i486 etc)

 - It allows for common site files including a global common file,
   libc specific common site files, endianess specific site files and
   bitsize specified endianess files.


The main things I wanted from this are:

 - merge all those x86 files

 - replace stuff that manually looks in the site files to determine
   endianess

 - replace stuff that manually clears the site file entries because
   existing entries break it

 - allow site files to be per package

 - allow a common site files for things that are the same regardless
   of target.


Here's an example of a package specific common site file:

--- packages/clamav/site/common-glibc	410254f416c43a062cf76a1bd89bad784a4a6132
+++ packages/clamav/site/common-glibc	410254f416c43a062cf76a1bd89bad784a4a6132
@@ -0,0 +1,4 @@
+clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
+clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
+clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
+ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}

All of these variables are glibc specific, or for clamav, and are the
same for all targets. So this one entry would have resulted in clamav
building for all glibc based targets. Instead I added these above
entries into site/sh4-linux, site/i486-linux and site/i586-linux (the
three platforms I tested this on). This means it will not work for
other targets until someone else adds these entries to the
appropriate site files.


Here's an example of using the config-info class to simplify the
situation of manually passing the endianess in a few of the places
where this is needed. In this case it queries the endianess of the
target and use base_conditional to set the appropriate option based
on the returned endianess:

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


Here's another example which shows the endiness entries from the site
files being moved out. This only shows the sh4-linux site file having
the entries removed, but they would also be able to be removed from
all the other site files. By doing this any new targets would only
require the definition in classes/config-info.bbclass in order to
pick up the endiness related site file entries;

--- site/common-be	36c1c248edd391ff060ad1bec9daa8bcb900b3ba
+++ site/common-be	36c1c248edd391ff060ad1bec9daa8bcb900b3ba
@@ -0,0 +1,2 @@
+ac_cv_c_littleendian=${ac_cv_c_littleendian=no}
+ac_cv_c_bigendian=${ac_cv_c_bigendian=yes}
============================================================
--- site/common-le	811e035839ca32e887c06c1e7564518cc7f36c1f
+++ site/common-le	811e035839ca32e887c06c1e7564518cc7f36c1f
@@ -0,0 +1,2 @@
+ac_cv_c_littleendian=${ac_cv_c_littleendian=yes}
+ac_cv_c_bigendian=${ac_cv_c_bigendian=no}
============================================================
--- site/sh4-linux	f41ae145ec1ffb1be3471dd71778bf2179742a42
+++ site/sh4-linux	e6dcbd713db70d1c64ec2c765d5f885ea9f9ac11
@@ -29,8 +29,6 @@ mr_cv_target_elf=${mr_cv_target_elf=yes}
 
 mr_cv_target_elf=${mr_cv_target_elf=yes}
 
-ac_cv_c_littleendian=${ac_cv_c_littleendian=yes}
-ac_cv_c_bigendian=${ac_cv_c_bigendian=no}
 ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
 
 # apache


Possible issues with this approach:

 - too many possibilities for site files

 - more difficult to determine which site files to edit

 - more work to figure out what is/isn't common

 - may result in something building but being broken on a target it
   hasn't been tested on (this already happens... more than likely it'll
   result in it being fixed on all platforms when someone fixes it the
   ones they are testing on.)


Possible issues with the implementation:

 - Encodes the target information in config-info.bbclass (maybe
   should be split out to a file?)


Here's the main patch:

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
+++ classes/autotools.bbclass	ee7b9f507881c4490c839fdea3ce4809571cf298
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
+	sitenamemap = { "libc":      "common-%s", \
+			"bits":      "common-%sbits", \
+			"endianess": "common-%s", \
+			"alias":     "%s", \
+			"target":    "%s" }
+	sites = []
+	sitefiles = ""
+
+	# Determine which site files to look for
+	sites.append("common");
+	for i in ["libc", "bits", "endianess", "alias", "target"]:
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
 

-- 
 Jamie Lenehan <lenehan@twibble.org>


