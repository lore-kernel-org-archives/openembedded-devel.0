Received: from [209.85.218.227] (helo=mail-bw0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mw28D-0006eO-Gv
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 01:10:48 +0200
Received: by bwz27 with SMTP id 27so284478bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2009 16:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=wqobMpx3SwsN17ZH3rzCYI43EpSteIkM+u55jjwXNqs=;
	b=BkCjjHFtQ0G3riKzF8VtPmcl8EhrE39PhZmg+t3QYdKxJRsDywkdkl80YsElHpoHY3
	XgYeEvJJ+B/8AFXRIdTHgIh9jVFkLMUaQeGGhkqUz9Mg1kdtNEj3d+tXxk741AQ7BMiT
	4Rky1PmcBvCihRROSSLz6gLvnRm9xfGJSSF/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=MECOSMN989sH39/n16INnmRj1p5JTe0PqFMIeL4eNATTgOuZg314Xji99DmO9qGNhI
	F/iC+MGhOKldz13AKj3bPyJqJHd+aGofKu2wdQ7f2900NAcQFsxx4Xies4o2zgup2DMv
	M06jNIyeLx7lyWqQghuM7Rl9VEBhAgKEkUiIo=
Received: by 10.204.0.69 with SMTP id 5mr1526850bka.173.1255043394561;
	Thu, 08 Oct 2009 16:09:54 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 9sm475138fks.4.2009.10.08.16.09.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 08 Oct 2009 16:09:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Oct 2009 16:09:45 -0700
Message-Id: <1255043385-5606-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.218.227
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] conf: Decosmetize TARGET_OS
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
X-List-Received-Date: Thu, 08 Oct 2009 23:10:48 -0000

* This patch reverts the cosmetic change which used linux-gnu instead of linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/insane.bbclass                  |    4 +-
 classes/siteinfo.bbclass                |   39 +++----
 conf/distro/include/angstrom-eglibc.inc |    4 +-
 conf/distro/include/angstrom-glibc.inc  |    2 +-
 conf/distro/include/sane-toolchain.inc  |   13 ++-
 recipes/lsof/lsof_4.78.bb               |    3 +-
 recipes/openssl/openssl.inc             |    4 +-
 site/arm-linux                          |  180 +++++++++++++++++++++++++++++++
 site/arm-linux-gnu                      |  180 -------------------------------
 site/armeb-linux                        |   51 +++++++++
 site/armeb-linux-gnu                    |   51 ---------
 site/mips-linux                         |  115 ++++++++++++++++++++
 site/mips-linux-gnu                     |  115 --------------------
 site/mipsel-linux                       |  119 ++++++++++++++++++++
 site/mipsel-linux-gnu                   |  119 --------------------
 site/powerpc-linux                      |    5 +
 site/powerpc-linux-gnu                  |    5 -
 site/sparc-linux                        |   55 ++++++++++
 site/sparc-linux-gnu                    |   55 ----------
 site/x86_64-linux                       |   97 +++++++++++++++++
 site/x86_64-linux-gnu                   |   97 -----------------
 21 files changed, 656 insertions(+), 657 deletions(-)
 create mode 100644 site/arm-linux
 delete mode 100644 site/arm-linux-gnu
 create mode 100644 site/armeb-linux
 delete mode 100644 site/armeb-linux-gnu
 create mode 100644 site/mips-linux
 delete mode 100644 site/mips-linux-gnu
 create mode 100644 site/mipsel-linux
 delete mode 100644 site/mipsel-linux-gnu
 create mode 100644 site/powerpc-linux
 delete mode 100644 site/powerpc-linux-gnu
 create mode 100644 site/sparc-linux
 delete mode 100644 site/sparc-linux-gnu
 create mode 100644 site/x86_64-linux
 delete mode 100644 site/x86_64-linux-gnu

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index a6e4b6d..0dacaf8 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -34,7 +34,7 @@ def package_qa_get_machine_dict():
             "darwin9" : { 
                         "arm" :       (40,     0,    0,          True,          True),
                       },
-            "linux-gnu" : { 
+            "linux" : { 
                         "arm" :       (40,    97,    0,          True,          True),
                         "armeb":      (40,    97,    0,          False,         True),
                         "powerpc":    (20,     0,    0,          False,         True),
@@ -77,7 +77,7 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          True),
                         "armeb" :     (40,     0,    0,          False,         True),
                       },
-            "linux-gnuspe" : {
+            "linux-spe" : {
                         "powerpc":    (20,     0,    0,          False,         True),
                       },
             "linux-uclibcspe" : {
diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index c3e155b..c89014a 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -22,23 +22,21 @@ def get_siteinfo_list(d):
 
        targetinfo = {\
                "armeb-linux":             "endian-big bit-32 common-linux common-glibc arm-common",\
-               "armeb-linux-gnu":         "endian-big bit-32 common-linux common-glibc arm-common",\
-               "armeb-linux-gnueabi":     "endian-big bit-32 common-linux common-glibc arm-common armeb-linux-gnu",\
+               "armeb-linux-gnueabi":     "endian-big bit-32 common-linux common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc arm-common",\
                "armeb-linux-uclibceabi":  "endian-big bit-32 common-linux common-uclibc arm-common armeb-linux-uclibc",\
                "arm-darwin":              "endian-little bit-32 common-darwin",\
                "arm-darwin9":             "endian-little bit-32 common-darwin",\
-               "arm-linux-gnu":           "endian-little bit-32 common-linux common-glibc arm-common",\
-               "arm-linux-gnueabi":       "endian-little bit-32 common-linux common-glibc arm-common arm-linux-gnu",\
+               "arm-linux":               "endian-little bit-32 common-linux common-glibc arm-common",\
+               "arm-linux-gnueabi":       "endian-little bit-32 common-linux common-glibc arm-common arm-linux",\
                "arm-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc arm-common",\
                "arm-linux-uclibceabi":    "endian-little bit-32 common-linux common-uclibc arm-common arm-linux-uclibc",\
                "avr32-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc avr32-common",\
                "bfin-uclinux-uclibc":     "endian-little bit-32 common-uclibc bfin-common",\
-               "i386-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i486-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i586-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i686-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "i686-linux":              "endian-little bit-32 common-linux common-glibc ix86-common i686-linux-gnu",\
+               "i386-linux":          "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "i486-linux":          "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "i586-linux":          "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "i686-linux":          "endian-little bit-32 common-linux common-glibc ix86-common",\
                "i386-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
                "i486-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
                "i586-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
@@ -51,24 +49,23 @@ def get_siteinfo_list(d):
                "i486-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
                "i586-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
                "i686-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
-	       "ia64-linux-gnu":	  "endian-little bit-64 common-linux common-glibc",\
-               "mipsel-linux-gnu":        "endian-little bit-32 common-linux common-glibc mips-common",\
+	       "ia64-linux":	          "endian-little bit-64 common-linux common-glibc",\
+               "mipsel-linux":            "endian-little bit-32 common-linux common-glibc mips-common",\
                "mipsel-linux-uclibc":     "endian-little bit-32 common-linux common-uclibc mips-common",\
-               "mips-linux-gnu":          "endian-big bit-32 common-linux common-glibc mips-common",\
+               "mips-linux":              "endian-big bit-32 common-linux common-glibc mips-common",\
                "mips-linux-uclibc":       "endian-big bit-32 common-linux common-uclibc mips-common",\
                "powerpc-darwin":          "endian-big bit-32 common-darwin",\
-               "ppc-linux-gnu":           "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux-gnu",\
-               "ppc64-linux-gnu":         "endian-big bit-64 common-linux common-glibc powerpc-common powerpc64-linux-gnu",\
-	       "powerpc-linux-gnu":       "endian-big bit-32 common-linux common-glibc powerpc-common",\
-	       "powerpc-linux-gnuspe":    "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux-gnu",\
+               "ppc-linux":               "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
+               "ppc64-linux":             "endian-big bit-64 common-linux common-glibc powerpc-common powerpc64-linux",\
+	       "powerpc-linux":           "endian-big bit-32 common-linux common-glibc powerpc-common",\
+	       "powerpc-linux-spe":       "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
                "powerpc-linux-uclibc":    "endian-big bit-32 common-linux common-uclibc powerpc-common",\
                "powerpc-linux-uclibcspe": "endian-big bit-32 common-linux common-uclibc powerpc-common powerpc-linux-uclibc",\
-               "sh3-linux-gnu":           "endian-little bit-32 common-linux common-glibc sh-common",\
-               "sh4-linux-gnu":           "endian-little bit-32 common-linux common-glibc sh-common",\
+               "sh3-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
+               "sh4-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
                "sh4-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc sh-common",\
-               "sparc-linux-gnu":         "endian-big bit-32 common-linux common-glibc",\
-               "viac3-linux-gnu":         "endian-little bit-32 common-linux common-glibc ix86-common",\
-               "x86_64-linux-gnu":        "endian-little bit-64 common-linux common-glibc",\
+               "sparc-linux":         "endian-big bit-32 common-linux common-glibc",\
+               "viac3-linux":         "endian-little bit-32 common-linux common-glibc ix86-common",\
                "x86_64-linux":            "endian-little bit-64 common-linux common-glibc",\
                "x86_64-linux-uclibc":     "endian-little bit-64 common-linux common-uclibc"}
        if target in targetinfo:
diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
index ab3606d..47147a1 100644
--- a/conf/distro/include/angstrom-eglibc.inc
+++ b/conf/distro/include/angstrom-eglibc.inc
@@ -1,12 +1,12 @@
 # eglibc:
 require conf/distro/include/eglibc.inc
 
-TARGET_OS = "linux-gnu"
+TARGET_OS = "linux"
 
 TARGET_OS .= "${@['','eabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 TARGET_OS .= "${@['','spe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari']]}"
 
-#TARGET_OS = "linux-gnuspe"
+#TARGET_OS = "linux-spe"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
diff --git a/conf/distro/include/angstrom-glibc.inc b/conf/distro/include/angstrom-glibc.inc
index 544ee4a..28c31e3 100644
--- a/conf/distro/include/angstrom-glibc.inc
+++ b/conf/distro/include/angstrom-glibc.inc
@@ -3,7 +3,7 @@ require conf/distro/include/glibc.inc
 
 PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
 
-TARGET_OS = "linux-gnu"
+TARGET_OS = "linux"
 TARGET_OS .= "${@['','eabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
 #mess with compiler flags to use -Os instead of -O2
diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 9351187..561c97a 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -157,16 +157,16 @@ def detect_arm_abi (d):
 def compute_os_portion_of_target_triplet (d):
 	import bb
 	arm_eabi_supporting_arches = "armv6 armv6-novfp \
-	armv5te iwmmxt armv7a armv7 armv6 armv5teb armv4t"
+	armv5te iwmmxt armv7a armv7 armv5teb armv4t"
 	ppc_spe_supporting_arches = "ppce500v2 ppce500"
 
   	if bb.data.getVar("LIBC", d, 1) == "uclibc":
     		libc_suffix = "uclibc"
 	else:
-		libc_suffix = "gnu"
+		libc_suffix = ""
 	
 	if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
-		if libc_suffix == "gnu":
+		if libc_suffix is not "uclibc":
 			bb.fatal("bfin is not supported on glibc/eglibc. Please choose uclibc")
 		else:
 			os_suffix = "uclinux"
@@ -182,7 +182,7 @@ def compute_os_portion_of_target_triplet (d):
 				bb.fatal("DISTRO requested EABI but selected machine does not support EABI")
 				abi_suffix = ""
 			else:
-				abi_suffix = "eabi"
+				abi_suffix = "gnueabi"
 		elif bparch in ppc_spe_supporting_arches.split():
 			abi_suffix = "spe"
 		else:
@@ -190,7 +190,10 @@ def compute_os_portion_of_target_triplet (d):
 	else:
 		bb.note("DISTRO_FEATURES is not set abi suffix not set")
 		abi_suffix = ""
-	return os_suffix + "-" + libc_suffix + abi_suffix
+	if libc_suffix is not "" or abi_suffix is not "":
+		return os_suffix + "-" + libc_suffix + abi_suffix
+	else:
+		return os_suffix
 
 # This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
 ARM_ABI = "${@detect_arm_abi(d)}"
diff --git a/recipes/lsof/lsof_4.78.bb b/recipes/lsof/lsof_4.78.bb
index 1bb540e..243b5da 100644
--- a/recipes/lsof/lsof_4.78.bb
+++ b/recipes/lsof/lsof_4.78.bb
@@ -21,9 +21,8 @@ export LSOF_OS = "${TARGET_OS}"
 LSOF_OS_linux-uclibc = "linux"
 LSOF_OS_linux-uclibceabi = "linux"
 LSOF_OS_linux-uclibspe = "linux"
-LSOF_OS_linux-gnu = "linux"
 LSOF_OS_linux-gnueabi = "linux"
-LSOF_OS_linux-gnuspe = "linux"
+LSOF_OS_linux-spe = "linux"
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 4c6e435..8b8e870 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -35,7 +35,7 @@ do_configure () {
 		os=linux
 	elif [ "x$os" = "xlinux-uclibceabi" ]; then
 		os=linux
-	elif [ "x$os" = "xlinux-gnu" ]; then
+	elif [ "x$os" = "xlinux-gnueabi" ]; then
 		os=linux
 	fi
 	target="$os-${HOST_ARCH}"
@@ -70,7 +70,7 @@ do_configure () {
 	linux-powerpc)
 		target=linux-ppc
 		;;
-	linux-gnuspe-powerpc)
+	linux-spe-powerpc)
 		target=linux-ppc
 		;;
 	linux-supersparc)
diff --git a/site/arm-linux b/site/arm-linux
new file mode 100644
index 0000000..18dfb38
--- /dev/null
+++ b/site/arm-linux
@@ -0,0 +1,180 @@
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_malloc_0_nonnull=yes
+ac_cv_func_malloc_works=yes
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+ac_cv_func_setvbuf_reversed=no
+ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
+ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=1}
+ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
+ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
+ac_cv_sizeof_char_p=${ac_cv_sizeof_int_p=4}
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
+ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
+ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
+ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
+ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
+ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
+ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
+ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
+ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
+ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
+ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
+ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
+ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
+ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
+ac_cv_sizeof_unsigned_long_long=${ac_cv_sizeof_unsigned_long_long=8}
+ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
+
+ac_cv_sys_restartable_syscalls=yes
+ac_cv_uchar=${ac_cv_uchar=no}
+ac_cv_uint=${ac_cv_uint=yes}
+ac_cv_ulong=${ac_cv_ulong=yes}
+ac_cv_ushort=${ac_cv_ushort=yes}
+ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
+
+# samba
+samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=${samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=yes}
+samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=${samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=no}
+samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
+samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
+samba_cv_HAVE_BROKEN_LINUX_SENDFILE=${samba_cv_HAVE_BROKEN_LINUX_SENDFILE=yes}
+samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=yes}
+samba_cv_HAVE_BROKEN_READDIR_NAME=${samba_cv_HAVE_BROKEN_READDIR_NAME=no}
+samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
+samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
+samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
+samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
+samba_cv_HAVE_DQB_FSOFTLIMIT=${samba_cv_HAVE_DQB_FSOFTLIMIT=no}
+samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
+samba_cv_HAVE_FAM_H=${samba_cv_HAVE_FAM_H=no}
+samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
+samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
+samba_cv_HAVE_FUNCTION_MACRO=${samba_cv_HAVE_FUNCTION_MACRO=yes}
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
+samba_cv_HAVE_INT16_FROM_RPC_RPC_H=${samba_cv_HAVE_INT16_FROM_RPC_RPC_H=no}
+samba_cv_HAVE_INT32_FROM_RPC_RPC_H=${samba_cv_HAVE_INT32_FROM_RPC_RPC_H=no}
+samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
+samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=${samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=no}
+samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
+samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
+samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
+samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
+samba_cv_HAVE_NATIVE_ICONV=${samba_cv_HAVE_NATIVE_ICONV=yes}
+samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
+samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=yes}
+samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=${samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=no}
+samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
+samba_cv_HAVE_SENDFILE=${samba_cv_HAVE_SENDFILE=yes}
+samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
+samba_cv_HAVE_SOCK_SIN_LEN=${samba_cv_HAVE_SOCK_SIN_LEN=no}
+samba_cv_HAVE_STAT_ST_BLKSIZE=${samba_cv_HAVE_STAT_ST_BLKSIZE=yes}
+samba_cv_HAVE_STAT_ST_BLOCKS=${samba_cv_HAVE_STAT_ST_BLOCKS=yes}
+samba_cv_HAVE_STRUCT_DIR64=${samba_cv_HAVE_STRUCT_DIR64=no}
+samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
+samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
+samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
+samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=${samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=no}
+samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=${samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=no}
+samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=yes}
+samba_cv_HAVE_UTIMBUF=${samba_cv_HAVE_UTIMBUF=yes}
+samba_cv_HAVE_UT_UT_ADDR=${samba_cv_HAVE_UT_UT_ADDR=yes}
+samba_cv_HAVE_UT_UT_EXIT=${samba_cv_HAVE_UT_UT_EXIT=yes}
+samba_cv_HAVE_UT_UT_HOST=${samba_cv_HAVE_UT_UT_HOST=yes}
+samba_cv_HAVE_UT_UT_ID=${samba_cv_HAVE_UT_UT_ID=yes}
+samba_cv_HAVE_UT_UT_NAME=${samba_cv_HAVE_UT_UT_NAME=yes}
+samba_cv_HAVE_UT_UT_PID=${samba_cv_HAVE_UT_UT_PID=yes}
+samba_cv_HAVE_UT_UT_TIME=${samba_cv_HAVE_UT_UT_TIME=yes}
+samba_cv_HAVE_UT_UT_TV=${samba_cv_HAVE_UT_UT_TV=yes}
+samba_cv_HAVE_UT_UT_TYPE=${samba_cv_HAVE_UT_UT_TYPE=yes}
+samba_cv_HAVE_UT_UT_USER=${samba_cv_HAVE_UT_UT_USER=yes}
+samba_cv_HAVE_UX_UT_SYSLEN=${samba_cv_HAVE_UX_UT_SYSLEN=no}
+samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
+samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=yes}
+samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
+samba_cv_PUTUTLINE_RETURNS_UTMP=${samba_cv_PUTUTLINE_RETURNS_UTMP=yes}
+samba_cv_QUOTA_WORKS=${samba_cv_QUOTA_WORKS=yes}
+samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=yes}
+samba_cv_REPLACE_GETPASS=${samba_cv_REPLACE_GETPASS=yes}
+samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
+samba_cv_REPLACE_READDIR=${samba_cv_REPLACE_READDIR=no}
+samba_cv_RUN_QUOTA_TESTS=${samba_cv_RUN_QUOTA_TESTS=yes}
+samba_cv_SEEKDIR_RETURNS_VOID=${samba_cv_SEEKDIR_RETURNS_VOID=yes}
+samba_cv_SIZEOF_DEV_T=${samba_cv_SIZEOF_DEV_T=yes}
+samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
+samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
+samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
+samba_cv_SYSCONF_SC_NPROCESSORS_ONLN=${samba_cv_SYSCONF_SC_NPROCESSORS_ONLN=yes}
+samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
+samba_cv_SYSCONF_SC_PAGESIZE=${samba_cv_SYSCONF_SC_PAGESIZE=yes}
+samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
+samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
+samba_cv_SYSQUOTA_WORKS_XFS=${samba_cv_SYSQUOTA_WORKS_XFS=yes}
+samba_cv_TRY_QUOTAS=${samba_cv_TRY_QUOTAS=no}
+samba_cv_TRY_SYS_QUOTAS=${samba_cv_TRY_SYS_QUOTAS=yes}
+samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
+samba_cv_WE_USE_SYS_QUOTAS=${samba_cv_WE_USE_SYS_QUOTAS=yes}
+samba_cv_WITH_AFS=${samba_cv_WITH_AFS=no}
+samba_cv_WITH_FAKE_KASERVER=${samba_cv_WITH_FAKE_KASERVER=no}
+samba_cv_WITH_QUOTAS=${samba_cv_WITH_QUOTAS=auto}
+samba_cv_WITH_SYS_QUOTAS=${samba_cv_WITH_SYS_QUOTAS=auto}
+samba_cv_WITH_VFS_AFSACL=${samba_cv_WITH_VFS_AFSACL=no}
+samba_cv_compiler_supports_ll=${samba_cv_compiler_supports_ll=yes}
+samba_cv_found_xfs_header=${samba_cv_found_xfs_header=yes}
+samba_cv_have_longlong=${samba_cv_have_longlong=yes}
+samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
+samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
+samba_cv_immediate_structures=${samba_cv_immediate_structures=yes}
+samba_cv_optimize_out_funcation_calls=${samba_cv_optimize_out_funcation_calls=yes}
+samba_cv_sig_atomic_t=${samba_cv_sig_atomic_t=yes}
+samba_cv_socklen_t=${samba_cv_socklen_t=yes}
+samba_cv_struct_timespec=${samba_cv_struct_timespec=yes}
+samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_linux.c}
+samba_cv_unixsocket=${samba_cv_unixsocket=yes}
+samba_cv_volatile=${samba_cv_volatile=yes}
+
+#older sambe defines
+samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
+samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
+samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
+samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
+
+# clamav
+clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
+clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
+clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
+ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
+
+#dbus
+ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
+
+# lftp
+ac_cv_file___dev_ptc_=yes
+
+#mono
+mono_cv_uscore=${mono_cv_uscore=no}
+mono_cv_sizeof_sunpath=${mono_cv_sizeof_sunpath=108}
+
+# guile
+ac_cv_func_pthread_attr_getstack=${ac_cv_func_pthread_attr_getstack=yes}
+
+# gnet
+ac_cv_member_struct_sockaddr_sa_len=${ac_cv_member_struct_sockaddr_sa_len=no}
+ac_cv_gnet_have_abstract_sockets=${ac_cv_gnet_have_abstract_sockets=no}
+gnet_sockaddr_family_field_name=${gnet_sockaddr_family_field_name=ss_family}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
+
+# squeak (forbid unaliged access)
+ac_cv_double_align=${ac_cv_double_align=no}                           
+ac_cv_double_order=${ac_cv_double_order=no}
diff --git a/site/arm-linux-gnu b/site/arm-linux-gnu
deleted file mode 100644
index 18dfb38..0000000
--- a/site/arm-linux-gnu
+++ /dev/null
@@ -1,180 +0,0 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_func_setvbuf_reversed=no
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=1}
-ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
-ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
-ac_cv_sizeof_char_p=${ac_cv_sizeof_int_p=4}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
-ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
-ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
-ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
-ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
-ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
-ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
-ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
-ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
-ac_cv_sizeof_unsigned_long_long=${ac_cv_sizeof_unsigned_long_long=8}
-ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
-
-ac_cv_sys_restartable_syscalls=yes
-ac_cv_uchar=${ac_cv_uchar=no}
-ac_cv_uint=${ac_cv_uint=yes}
-ac_cv_ulong=${ac_cv_ulong=yes}
-ac_cv_ushort=${ac_cv_ushort=yes}
-ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
-
-# samba
-samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=${samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=yes}
-samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=${samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=no}
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
-samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
-samba_cv_HAVE_BROKEN_LINUX_SENDFILE=${samba_cv_HAVE_BROKEN_LINUX_SENDFILE=yes}
-samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=yes}
-samba_cv_HAVE_BROKEN_READDIR_NAME=${samba_cv_HAVE_BROKEN_READDIR_NAME=no}
-samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
-samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
-samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
-samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
-samba_cv_HAVE_DQB_FSOFTLIMIT=${samba_cv_HAVE_DQB_FSOFTLIMIT=no}
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
-samba_cv_HAVE_FAM_H=${samba_cv_HAVE_FAM_H=no}
-samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
-samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
-samba_cv_HAVE_FUNCTION_MACRO=${samba_cv_HAVE_FUNCTION_MACRO=yes}
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_INT16_FROM_RPC_RPC_H=${samba_cv_HAVE_INT16_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_INT32_FROM_RPC_RPC_H=${samba_cv_HAVE_INT32_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=${samba_cv_HAVE_KERNEL_OPLOCKS_IRIX=no}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_NATIVE_ICONV=${samba_cv_HAVE_NATIVE_ICONV=yes}
-samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
-samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=yes}
-samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=${samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=no}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_SENDFILE=${samba_cv_HAVE_SENDFILE=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_SOCK_SIN_LEN=${samba_cv_HAVE_SOCK_SIN_LEN=no}
-samba_cv_HAVE_STAT_ST_BLKSIZE=${samba_cv_HAVE_STAT_ST_BLKSIZE=yes}
-samba_cv_HAVE_STAT_ST_BLOCKS=${samba_cv_HAVE_STAT_ST_BLOCKS=yes}
-samba_cv_HAVE_STRUCT_DIR64=${samba_cv_HAVE_STRUCT_DIR64=no}
-samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
-samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
-samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=${samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=${samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=no}
-samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=yes}
-samba_cv_HAVE_UTIMBUF=${samba_cv_HAVE_UTIMBUF=yes}
-samba_cv_HAVE_UT_UT_ADDR=${samba_cv_HAVE_UT_UT_ADDR=yes}
-samba_cv_HAVE_UT_UT_EXIT=${samba_cv_HAVE_UT_UT_EXIT=yes}
-samba_cv_HAVE_UT_UT_HOST=${samba_cv_HAVE_UT_UT_HOST=yes}
-samba_cv_HAVE_UT_UT_ID=${samba_cv_HAVE_UT_UT_ID=yes}
-samba_cv_HAVE_UT_UT_NAME=${samba_cv_HAVE_UT_UT_NAME=yes}
-samba_cv_HAVE_UT_UT_PID=${samba_cv_HAVE_UT_UT_PID=yes}
-samba_cv_HAVE_UT_UT_TIME=${samba_cv_HAVE_UT_UT_TIME=yes}
-samba_cv_HAVE_UT_UT_TV=${samba_cv_HAVE_UT_UT_TV=yes}
-samba_cv_HAVE_UT_UT_TYPE=${samba_cv_HAVE_UT_UT_TYPE=yes}
-samba_cv_HAVE_UT_UT_USER=${samba_cv_HAVE_UT_UT_USER=yes}
-samba_cv_HAVE_UX_UT_SYSLEN=${samba_cv_HAVE_UX_UT_SYSLEN=no}
-samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
-samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=yes}
-samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
-samba_cv_PUTUTLINE_RETURNS_UTMP=${samba_cv_PUTUTLINE_RETURNS_UTMP=yes}
-samba_cv_QUOTA_WORKS=${samba_cv_QUOTA_WORKS=yes}
-samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=yes}
-samba_cv_REPLACE_GETPASS=${samba_cv_REPLACE_GETPASS=yes}
-samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
-samba_cv_REPLACE_READDIR=${samba_cv_REPLACE_READDIR=no}
-samba_cv_RUN_QUOTA_TESTS=${samba_cv_RUN_QUOTA_TESTS=yes}
-samba_cv_SEEKDIR_RETURNS_VOID=${samba_cv_SEEKDIR_RETURNS_VOID=yes}
-samba_cv_SIZEOF_DEV_T=${samba_cv_SIZEOF_DEV_T=yes}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
-samba_cv_SYSCONF_SC_NPROCESSORS_ONLN=${samba_cv_SYSCONF_SC_NPROCESSORS_ONLN=yes}
-samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
-samba_cv_SYSCONF_SC_PAGESIZE=${samba_cv_SYSCONF_SC_PAGESIZE=yes}
-samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
-samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
-samba_cv_SYSQUOTA_WORKS_XFS=${samba_cv_SYSQUOTA_WORKS_XFS=yes}
-samba_cv_TRY_QUOTAS=${samba_cv_TRY_QUOTAS=no}
-samba_cv_TRY_SYS_QUOTAS=${samba_cv_TRY_SYS_QUOTAS=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_WE_USE_SYS_QUOTAS=${samba_cv_WE_USE_SYS_QUOTAS=yes}
-samba_cv_WITH_AFS=${samba_cv_WITH_AFS=no}
-samba_cv_WITH_FAKE_KASERVER=${samba_cv_WITH_FAKE_KASERVER=no}
-samba_cv_WITH_QUOTAS=${samba_cv_WITH_QUOTAS=auto}
-samba_cv_WITH_SYS_QUOTAS=${samba_cv_WITH_SYS_QUOTAS=auto}
-samba_cv_WITH_VFS_AFSACL=${samba_cv_WITH_VFS_AFSACL=no}
-samba_cv_compiler_supports_ll=${samba_cv_compiler_supports_ll=yes}
-samba_cv_found_xfs_header=${samba_cv_found_xfs_header=yes}
-samba_cv_have_longlong=${samba_cv_have_longlong=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_immediate_structures=${samba_cv_immediate_structures=yes}
-samba_cv_optimize_out_funcation_calls=${samba_cv_optimize_out_funcation_calls=yes}
-samba_cv_sig_atomic_t=${samba_cv_sig_atomic_t=yes}
-samba_cv_socklen_t=${samba_cv_socklen_t=yes}
-samba_cv_struct_timespec=${samba_cv_struct_timespec=yes}
-samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_linux.c}
-samba_cv_unixsocket=${samba_cv_unixsocket=yes}
-samba_cv_volatile=${samba_cv_volatile=yes}
-
-#older sambe defines
-samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
-samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
-samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
-samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
-
-# clamav
-clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
-clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
-clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
-ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
-
-#dbus
-ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
-
-# lftp
-ac_cv_file___dev_ptc_=yes
-
-#mono
-mono_cv_uscore=${mono_cv_uscore=no}
-mono_cv_sizeof_sunpath=${mono_cv_sizeof_sunpath=108}
-
-# guile
-ac_cv_func_pthread_attr_getstack=${ac_cv_func_pthread_attr_getstack=yes}
-
-# gnet
-ac_cv_member_struct_sockaddr_sa_len=${ac_cv_member_struct_sockaddr_sa_len=no}
-ac_cv_gnet_have_abstract_sockets=${ac_cv_gnet_have_abstract_sockets=no}
-gnet_sockaddr_family_field_name=${gnet_sockaddr_family_field_name=ss_family}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
-# squeak (forbid unaliged access)
-ac_cv_double_align=${ac_cv_double_align=no}                           
-ac_cv_double_order=${ac_cv_double_order=no}
diff --git a/site/armeb-linux b/site/armeb-linux
new file mode 100644
index 0000000..d8da123
--- /dev/null
+++ b/site/armeb-linux
@@ -0,0 +1,51 @@
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_malloc_0_nonnull=yes
+ac_cv_func_malloc_works=yes
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+ac_cv_func_setvbuf_reversed=no
+ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
+ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
+ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
+ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
+ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
+ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
+ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
+ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
+
+ac_cv_sys_restartable_syscalls=yes
+ac_cv_uchar=${ac_cv_uchar=no}
+ac_cv_uint=${ac_cv_uint=yes}
+ac_cv_ulong=${ac_cv_ulong=yes}
+ac_cv_ushort=${ac_cv_ushort=yes}
+
+ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
+samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
+samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
+samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
+samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
+samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
+samba_cv_HAVE_SENDFILE=${samba_cv_HAVE_SENDFILE=yes}
+samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
+samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
+samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
+samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
+samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
+samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
+samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
+samba_cv_STAT_STATVFS64=${samba_cv_STAT_STATVFS64=yes}
+samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
+samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
+samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
diff --git a/site/armeb-linux-gnu b/site/armeb-linux-gnu
deleted file mode 100644
index d8da123..0000000
--- a/site/armeb-linux-gnu
+++ /dev/null
@@ -1,51 +0,0 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_func_setvbuf_reversed=no
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
-ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
-ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
-ac_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
-
-ac_cv_sys_restartable_syscalls=yes
-ac_cv_uchar=${ac_cv_uchar=no}
-ac_cv_uint=${ac_cv_uint=yes}
-ac_cv_ulong=${ac_cv_ulong=yes}
-ac_cv_ushort=${ac_cv_ushort=yes}
-
-ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
-samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_HAVE_SENDFILE=${samba_cv_HAVE_SENDFILE=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
-samba_cv_STAT_STATVFS64=${samba_cv_STAT_STATVFS64=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
diff --git a/site/mips-linux b/site/mips-linux
new file mode 100644
index 0000000..43f4aef
--- /dev/null
+++ b/site/mips-linux
@@ -0,0 +1,115 @@
+
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+
+# tslib, others
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# slrn
+slrn_cv___va_copy=${slrn_cv___va_copy=yes}
+slrn_cv_va_copy=${slrn_cv_va_copy=yes}
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
+
+# db3
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_mutex=${db_cv_mutex=no}
+db_cv_posixmutexes=${db_cv_posixmutexes=no}
+db_cv_uimutexes=${db_cv_uimutexes=no}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# sudo
+sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+# lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# mono
+cv_mono_sizeof_sunpath=108
+mono_cv_uscore=${mono_cv_uscore=no}
+
diff --git a/site/mips-linux-gnu b/site/mips-linux-gnu
deleted file mode 100644
index 43f4aef..0000000
--- a/site/mips-linux-gnu
+++ /dev/null
@@ -1,115 +0,0 @@
-
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-
-# tslib, others
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
-
-# slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
-# db3
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-# lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# mono
-cv_mono_sizeof_sunpath=108
-mono_cv_uscore=${mono_cv_uscore=no}
-
diff --git a/site/mipsel-linux b/site/mipsel-linux
new file mode 100644
index 0000000..bf82d4e
--- /dev/null
+++ b/site/mipsel-linux
@@ -0,0 +1,119 @@
+
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+
+# tslib, others
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+
+# mysql
+ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
+ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# slrn
+slrn_cv___va_copy=${slrn_cv___va_copy=yes}
+slrn_cv_va_copy=${slrn_cv_va_copy=yes}
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
+
+# db3
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_mutex=${db_cv_mutex=no}
+db_cv_posixmutexes=${db_cv_posixmutexes=no}
+db_cv_uimutexes=${db_cv_uimutexes=no}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# sudo
+sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+#lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# mono
+cv_mono_sizeof_sunpath=108
+mono_cv_uscore=${mono_cv_uscore=no}
+
diff --git a/site/mipsel-linux-gnu b/site/mipsel-linux-gnu
deleted file mode 100644
index bf82d4e..0000000
--- a/site/mipsel-linux-gnu
+++ /dev/null
@@ -1,119 +0,0 @@
-
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-
-# tslib, others
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
-# mysql
-ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
-ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
-
-# slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
-# db3
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=no}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-#lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# mono
-cv_mono_sizeof_sunpath=108
-mono_cv_uscore=${mono_cv_uscore=no}
-
diff --git a/site/powerpc-linux b/site/powerpc-linux
new file mode 100644
index 0000000..bea14d5
--- /dev/null
+++ b/site/powerpc-linux
@@ -0,0 +1,5 @@
+# libc
+libc_cv_ppc_machine=${libc_cv_ppc_machine=yes}
+libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
+libc_cv_mabi_ibmlongdouble=${libc_cv_mabi_ibmlongdouble=yes}
+libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
diff --git a/site/powerpc-linux-gnu b/site/powerpc-linux-gnu
deleted file mode 100644
index bea14d5..0000000
--- a/site/powerpc-linux-gnu
+++ /dev/null
@@ -1,5 +0,0 @@
-# libc
-libc_cv_ppc_machine=${libc_cv_ppc_machine=yes}
-libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
-libc_cv_mabi_ibmlongdouble=${libc_cv_mabi_ibmlongdouble=yes}
-libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
diff --git a/site/sparc-linux b/site/sparc-linux
new file mode 100644
index 0000000..ea6386b
--- /dev/null
+++ b/site/sparc-linux
@@ -0,0 +1,55 @@
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_malloc_0_nonnull=yes
+ac_cv_func_malloc_works=yes
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_setvbuf_reversed=no
+ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
+ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
+ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
+ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
+ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
+ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
+ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
+ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
+ac_cv_sizeof_unsigned_long_long=${ac_cv_sizeof_unsigned_long_long=8}
+ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
+
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
+libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
+libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
+ac_cv_alignof_CORBA_long_double=4
+ac_cv_c_long_double=${ac_cv_c_long_double=yes}
+
+
+ac_cv_sys_restartable_syscalls=yes
+ac_cv_uchar=${ac_cv_uchar=no}
+ac_cv_uint=${ac_cv_uint=yes}
+ac_cv_ulong=${ac_cv_ulong=yes}
+ac_cv_ushort=${ac_cv_ushort=yes}
+
+ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
+cookie_io_functions_use_off64_t=${cookie_io_functions_use_off64_t=yes}
+
+# minicom
+am_cv_sys_posix_termios=${am_cv_sys_posix_termios=yes}
+
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+#glib
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24} 
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+
+#linux
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
diff --git a/site/sparc-linux-gnu b/site/sparc-linux-gnu
deleted file mode 100644
index ea6386b..0000000
--- a/site/sparc-linux-gnu
+++ /dev/null
@@ -1,55 +0,0 @@
-ac_cv_func_getpgrp_void=yes
-ac_cv_func_setpgrp_void=yes
-ac_cv_func_setgrent_void=yes
-ac_cv_func_malloc_0_nonnull=yes
-ac_cv_func_malloc_works=yes
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_setvbuf_reversed=no
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
-ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
-ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
-ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
-ac_cv_sizeof_unsigned_long_long=${ac_cv_sizeof_unsigned_long_long=8}
-ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
-
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
-libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
-libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
-ac_cv_alignof_CORBA_long_double=4
-ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-
-
-ac_cv_sys_restartable_syscalls=yes
-ac_cv_uchar=${ac_cv_uchar=no}
-ac_cv_uint=${ac_cv_uint=yes}
-ac_cv_ulong=${ac_cv_ulong=yes}
-ac_cv_ushort=${ac_cv_ushort=yes}
-
-ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
-cookie_io_functions_use_off64_t=${cookie_io_functions_use_off64_t=yes}
-
-# minicom
-am_cv_sys_posix_termios=${am_cv_sys_posix_termios=yes}
-
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-#glib
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24} 
-glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-
-#linux
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
diff --git a/site/x86_64-linux b/site/x86_64-linux
new file mode 100644
index 0000000..9180cd6
--- /dev/null
+++ b/site/x86_64-linux
@@ -0,0 +1,97 @@
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
+ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
+ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
+ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
+ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_need_trio=${ac_cv_need_trio=no}
+ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
+ac_cv_sizeof_long=${ac_cv_sizeof_long=8}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
+ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=8}
+ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
+ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
+ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
+ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
+ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
+db_cv_posixmutexes=${db_cv_posixmutexes=no}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+db_cv_uimutexes=${db_cv_uimutexes=no}
+
+# glib
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=40}
+glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
+glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=8}
+glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=8}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=8}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
+glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
+glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+lftp_cv_va_copy=${lftp_cv_va_copy=yes}
+nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
+samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
+screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
+screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
+screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
+screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
+screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
+screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
+screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
+screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
+screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+#gcc
+ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
+
+# eds-dbus
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
+#dbus
+ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
+
+# p3scan / quagga
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+
+# bash
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
diff --git a/site/x86_64-linux-gnu b/site/x86_64-linux-gnu
deleted file mode 100644
index 9180cd6..0000000
--- a/site/x86_64-linux-gnu
+++ /dev/null
@@ -1,97 +0,0 @@
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
-ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
-ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
-ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
-ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_need_trio=${ac_cv_need_trio=no}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=8}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=8}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
-ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_uimutexes=${db_cv_uimutexes=no}
-
-# glib
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=yes}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=40}
-glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
-glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=8}
-glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=8}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=8}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
-glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
-glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
-glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-
-lftp_cv_va_copy=${lftp_cv_va_copy=yes}
-nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
-samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
-screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
-screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
-screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
-screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
-screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
-screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
-screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
-screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
-screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-#gcc
-ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
-
-#dbus
-ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
-
-# p3scan / quagga
-ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-
-# bash
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-- 
1.6.3.3



