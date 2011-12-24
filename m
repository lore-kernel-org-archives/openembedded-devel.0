Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ReWHd-0006rf-Gf for openembedded-devel@lists.openembedded.org;
	Sat, 24 Dec 2011 19:25:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ReWAj-0008Ki-Rw for openembedded-devel@lists.openembedded.org;
	Sat, 24 Dec 2011 19:18:17 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Dec 2011 19:18:17 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Dec 2011 19:18:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 24 Dec 2011 19:18:03 +0100
Message-ID: <jd550r$uov$1@dough.gmane.org>
References: <1324621680-32025-1-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324621680-32025-1-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH v4 meta-oe] xfsprogs: add version 3.1.7
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
X-List-Received-Date: Sat, 24 Dec 2011 18:25:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-12-11 07:28, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> xfsprogs provides XFS filesystem utilities.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> ...-uid-gid-instead-of-actual-name-for-chown.patch |   32 ++++++++++++++ 
> meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb |   45
> ++++++++++++++++++++ 2 files changed, 77 insertions(+), 0 deletions(-) 
> create mode 100644
> meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch
>
> 
create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
> 
> diff --git
> a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch
> b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch
>
> 
new file mode 100644
> index 0000000..0238d11 --- /dev/null +++
> b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch
>
> 
@@ -0,0 +1,32 @@
> +diff -urN a/include/install-sh b/include/install-sh +---
> a/include/install-sh	2011-12-23 00:16:19.111481779 -0600 ++++
> b/include/install-sh	2011-12-23 00:11:20.368198711 -0600 +@@ -105,10
> +105,10 @@ +    c) + 	;; +    g) +-	GROUP=$OPTARG ++	GROUP=`id -g
> $OPTARG` + 	;; +    o) +-	OWNER=$OPTARG ++	OWNER=`id -u $OPTARG` + 	;; +
> m) + 	DIRMODE=`expr $OPTARG` +diff -urN a/install-sh b/install-sh +---
> a/install-sh	2011-12-23 00:15:34.733482017 -0600 ++++ b/install-sh
> 2011-12-23 00:10:59.679500386 -0600 +@@ -105,10 +105,10 @@ +    c) + 	;; 
> +    g) +-	GROUP=$OPTARG ++	GROUP=`id -g $OPTARG` + 	;; +    o) +-
> OWNER=$OPTARG ++	OWNER=`id -u $OPTARG` + 	;; +    m) + 	DIRMODE=`expr
> $OPTARG` diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
> b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb new file mode
> 100644 index 0000000..aa414a3 --- /dev/null +++
> b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb @@ -0,0 +1,45 @@ 
> +DESCRIPTION = "XFS Filesystem Utilities" +HOMEPAGE =
> "http://oss.sgi.com/projects/xfs" +SECTION = "base" +LICENSE = "LGPL2.1" 
> + +LIC_FILES_CHKSUM =
> "file://Makefile;endline=3;md5=def2844770bb44eba37bc9ca8610fad4" + 
> +DEPENDS = "util-linux" + +SRC_URI =
> "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \ +
> file://use-uid-gid-instead-of-actual-name-for-chown.patch " 
> +SRC_URI[md5sum] = "049cf9873794ea49d0bb3f12d45748a4" +SRC_URI[sha256sum]
> = "e150914210ac5fd29c098ef0fd94bdec51d2fb231cf9faa765c16ec6d75c8eaa" + 
> +inherit autotools + +FILES_${PN}-dev += "${base_libdir}/libhandle.la \ +
> ${base_libdir}/libhandle.so" + +EXTRA_OECONF = "--enable-gettext=no" 
> +do_configure () { +	export DEBUG="-DNDEBUG" +	oe_runconf +} + +LIBTOOL =
> "${HOST_SYS}-libtool" +EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'" 
> +TARGET_CC_ARCH += "${LDFLAGS}" +PARALLEL_MAKE = "" + +do_install () { +
> export DIST_ROOT=${D} +	oe_runmake install +	# needed for xfsdump +
> oe_runmake install-dev +	# replace extra links to /usr/lib with relative
> links (otherwise autotools_prepackage_lamangler fails to read nonexistent
> link) +	rm -f ${D}/${base_libdir}/libhandle.la +	rm -f
> ${D}/${base_libdir}/libhandle.a +	ln -s ../usr/lib/libhandle.la
> ${D}/${base_libdir}/libhandle.la +	ln -s ../usr/lib/libhandle.a
> ${D}/${base_libdir}/libhandle.a + +	# and link from /usr/lib/libhandle.so
> to /lib/libhandle.so +	rm -f ${D}/${libdir}/libhandle.so +	ln -s
> ../../lib/libhandle.a ${D}/${libdir}/libhandle.so +}


ERROR: Function 'do_install' failed (see
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.685
for further information)
ERROR: Logfile of failure stored in:
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.685
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| ERROR: Function 'do_install' failed (see
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.685
for further information)
| + cd
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/xfsprogs-3.1.7
| + do_install
| + export
DIST_ROOT=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/image
| +
DIST_ROOT=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/image
| + oe_runmake install
| + '[' xmake = x ']'
| + bbnote make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install
| + echo 'NOTE: make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install'
| NOTE: make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install
| + make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install
| Installing include-install
| make[1]: Nothing to be done for `install'.
| Installing libxfs-install
| make[1]: Nothing to be done for `install'.
| Installing libxlog-install
| make[1]: Nothing to be done for `install'.
| Installing libxcmd-install
| make[1]: Nothing to be done for `install'.
| Installing libhandle-install
| cd ../libhandle/.libs; ../../install-sh -o koen -g koen -m 755 -d /lib;
../../install-sh -o koen -g koen -m 644 -T so_dot_version libhandle.lai
/lib; ../../install-sh -o koen -g koen -T so_dot_current libhandle.lai /lib
| id: koen: No such user
| id: koen: No such user
| id: koen: No such user
| id: koen: No such user
| id: koen: No such user
| id: koen: No such user
| Installing libdisk-install
| make[1]: Nothing to be done for `install'.
| Installing copy-install
| ../install-sh -o koen -g koen -m 755 -d /usr/sbin
| id: koen: No such user
| id: koen: No such user
| make[1]: *** [install] Error 255
| make: *** [copy-install] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package xfsprogs-3.1.7-r0: task do_install: Failed

The whole 'install as user' idea is flawed, so I'd recommend to patch it out
completely
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk72F1kACgkQMkyGM64RGpHZiQCeId2s8LBT/nKC2kKR8qm7bNva
1K4AmgKbwHnDCWxpM1HdhJhLmROZz8uC
=7BMT
-----END PGP SIGNATURE-----



