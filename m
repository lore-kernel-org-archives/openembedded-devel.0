Received: from [204.127.225.94] (helo=alnrmhc14.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HKLCc-00052p-Df
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Feb 2007 22:10:10 +0100
Received: from gatekeeper.stellarwerx.com (failure[68.57.212.205])
	by comcast.net (alnrmhc14) with ESMTP
	id <20070222211008b140063g0ue>; Thu, 22 Feb 2007 21:10:09 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id E3A8D6A50; Thu, 22 Feb 2007 16:15:55 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1172178954.8592@gatekeeper.stellarwerx.com>
Date: Thu, 22 Feb 2007 16:15:54 -0500 (EST)
MIME-Version: 1.0
Subject: AM_GNU_GETTEXT Undefined During e2fsprogs Config Step
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2007 21:10:10 -0000
Content-Type: multipart/mixed; boundary="bound1172178955"

--bound1172178955
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

I'm trying to build a Spitz Angstrom distro and receiving this when building e2fsprogs: 

-----------------------------------------------------------
OE Build Configuration:
BB_VERSION     = "1.6.6"
OE_REVISION    = "4b0e693188daff03f827e74d152209f6c65eed49"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "spitz"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070222"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package e2fsprogs-1.38: started
NOTE: package e2fsprogs-1.38-r8: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows (/var/tmp/OpenEmbedded/Spitz/tmp/work/armv5te-angstrom-linux-gnueabi/e2fsprogs-1.38-r8/temp/log.do_configure.29720)
| automake (GNU automake) 1.9.3
| Written by Tom Tromey <tromey@redhat.com>.
|
| Copyright 2004 Free Software Foundation, Inc.
| This is free software; see the source for copying conditions.  There is NO
| warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
| AUTOV is 1.9
| NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal-1.9 -I /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal -I /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal-1.9 -I /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal --force
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:45: warning: underquoted definition of AC_LBL_C_INIT
|   run info '(automake)Extending aclocal'
|   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:172: warning: underquoted definition of AC_LBL_C_INLINE
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:228: warning: underquoted definition of AC_LBL_LIBPCAP
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:296: warning: underquoted definition of AC_LBL_TYPE_SIGNAL
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:326: warning: underquoted definition of AC_LBL_FIXINCLUDES
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:372: warning: underquoted definition of AC_LBL_LEX_AND_YACC
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:425: warning: underquoted definition of AC_LBL_UNION_WAIT
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:454: warning: underquoted definition of AC_LBL_SOCKADDR_SA_LEN
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:479: warning: underquoted definition of AC_LBL_SOCKADDR_STORAGE
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:512: warning: underquoted definition of AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:538: warning: underquoted definition of AC_LBL_HAVE_RUN_PATH
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:564: warning: underquoted definition of AC_LBL_CHECK_TYPE
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:593: warning: underquoted definition of AC_LBL_UNALIGNED_ACCESS
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:698: warning: underquoted definition of AC_LBL_DEVEL
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:828: warning: underquoted definition of AC_LBL_LIBRARY_NET
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:851: warning: underquoted definition of AC_C___ATTRIBUTE__
| /var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal/libpcap.m4:889: warning: underquoted definition of AC_LBL_TPACKET_STATS
| aclocal:configure.in:500: warning: macro `AM_GNU_GETTEXT' not found in library
| autoreconf: configure.in: tracing
| configure.in:582: warning: AC_RUN_IFELSE called without default to allow cross compiling
| autoconf/general.m4:2282: AC_RUN_IFELSE is expanded from...
| autoconf/general.m4:1800: AC_CACHE_VAL is expanded from...
| autoconf/general.m4:1809: AC_CACHE_CHECK is expanded from...
| autoconf/types.m4:445: AC_CHECK_SIZEOF is expanded from...
| configure.in:582: the top level
| configure.in:583: warning: AC_RUN_IFELSE called without default to allow cross compiling
| configure.in:583: the top level
| configure.in:584: warning: AC_RUN_IFELSE called without default to allow cross compiling
| configure.in:584: the top level
| configure.in:585: warning: AC_RUN_IFELSE called without default to allow cross compiling
| configure.in:585: the top level
| autoreconf: configure.in: not using Libtool
| autoreconf: running: /var/tmp/OpenEmbedded/Spitz/tmp/staging/i686-linux/bin/autoconf --include=/var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal-1.9 --include=/var/tmp/OpenEmbedded/Spitz/tmp/staging/arm-angstrom-linux-gnueabi/share/aclocal --force --warnings=cross
| configure.in:582: warning: AC_RUN_IFELSE called without default to allow cross compiling
| autoconf/general.m4:2282: AC_RUN_IFELSE is expanded from...
| autoconf/general.m4:1800: AC_CACHE_VAL is expanded from...
| autoconf/general.m4:1809: AC_CACHE_CHECK is expanded from...
| autoconf/types.m4:445: AC_CHECK_SIZEOF is expanded from...
| configure.in:582: the top level
| configure.in:583: warning: AC_RUN_IFELSE called without default to allow cross compiling
| configure.in:583: the top level
| configure.in:584: warning: AC_RUN_IFELSE called without default to allow cross compiling
| configure.in:584: the top level
| configure.in:585: warning: AC_RUN_IFELSE called without default to allow cross compiling
| configure.in:585: the top level
| configure.in:500: error: possibly undefined macro: AM_GNU_GETTEXT
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| autoreconf: /var/tmp/OpenEmbedded/Spitz/tmp/staging/i686-linux/bin/autoconf failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: Task failed: /var/tmp/OpenEmbedded/Spitz/tmp/work/armv5te-angstrom-linux-gnueabi/e2fsprogs-1.38-r8/temp/log.do_configure.29720
NOTE: package e2fsprogs-1.38-r8: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package e2fsprogs-1.38: failed
ERROR: Build of angstrom-bootstrap-image failed
-----------------------------------------------------------

According to

http://freelords.sourceforge.net/cgi-bin/moin.cgi/Installation

I should execute "aclocal --force -I <pwd>/m4" to fix.  Shouldn't bitbake/OE be doing that for me?

Regards,
-Mark Gollahon

--bound1172178955--
