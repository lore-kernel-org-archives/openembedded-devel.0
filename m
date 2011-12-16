Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbStg-00050B-DN for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:12:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSmx-0003Rw-B1 for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:05:07 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:05:07 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:05:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:54:38 +0100
Message-ID: <jcetfs$4n1$9@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-9-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-9-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 9/9] xfsprogs: add
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
X-List-Received-Date: Fri, 16 Dec 2011 08:12:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> xfsprogs provides XFS filesystem utilities.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb |   43
> ++++++++++++++++++++ 1 files changed, 43 insertions(+), 0 deletions(-) 
> create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
> 
> diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
> b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb new file mode
> 100644 index 0000000..07644ac --- /dev/null +++
> b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb @@ -0,0 +1,43 @@ 
> +DESCRIPTION = "XFS Filesystem Utilities" +HOMEPAGE =
> "http://oss.sgi.com/projects/xfs" +LICENSE = "GPL"

not a valid license

> +SECTION = "base" +DEPENDS = "util-linux" + +LIC_FILES_CHKSUM =
> "file://Makefile;endline=3;md5=def2844770bb44eba37bc9ca8610fad4"

move next to LICENSE

> + +SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz" 
> +SRC_URI[md5sum] = "049cf9873794ea49d0bb3f12d45748a4" +SRC_URI[sha256sum]
> = "e150914210ac5fd29c098ef0fd94bdec51d2fb231cf9faa765c16ec6d75c8eaa" + 
> +PARALLEL_MAKE = ""

move below inherit autotools

> +inherit autotools +EXTRA_OECONF = "--enable-gettext=no" +LIBTOOL =
> "${HOST_SYS}-libtool" +EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'" 
> +TARGET_CC_ARCH += "${LDFLAGS}" + +FILES_${PN}-dev +=
> "${base_libdir}/libhandle.la \ +
> ${base_libdir}/libhandle.so"

Move below do_install

> + +do_configure () { +	export DEBUG="-DNDEBUG" +	oe_runconf +} + 
> +do_install () { +	export DIST_ROOT=${D} +	oe_runmake install +	# needed
> for xfsdump +	oe_runmake install-dev +	# replace extra links to /usr/lib
> with relative links (otherwise autotools_prepackage_lamangler fails to
> read nonexistent link) +	rm -f ${D}/${base_libdir}/libhandle.la +	rm -f
> ${D}/${base_libdir}/libhandle.a +	ln -s ../usr/lib/libhandle.la
> ${D}/${base_libdir}/libhandle.la +	ln -s ../usr/lib/libhandle.a
> ${D}/${base_libdir}/libhandle.a + +	# and link from /usr/lib/libhandle.so
> to /lib/libhandle.so +	rm -f ${D}/${libdir}/libhandle.so +	ln -s
> ../../lib/libhandle.a ${D}/${libdir}/libhandle.so +} +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q+T4ACgkQMkyGM64RGpGJBgCcDoVQ7+QAiUlcHgBtZRtU9atm
dKgAoLUGquZFtXaU9Xfy3nztzqsg3Ou6
=92fE
-----END PGP SIGNATURE-----



