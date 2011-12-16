Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbTD3-00064a-Mg for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:32:05 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbT6L-0001eq-2G for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:25:09 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:25:09 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:25:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:49:42 +0100
Message-ID: <jcet6k$4n1$3@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-3-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-3-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 3/9] ipsec-tools: add
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
X-List-Received-Date: Fri, 16 Dec 2011 08:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> IPsec-Tools is a port of KAME's IPsec utilities to the Linux IPsec 
> implementation.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> .../ipsec-tools/files/ipsec-tools-install.patch    |   14 +++++ 
> .../recipes-support/ipsec-tools/ipsec-tools.inc    |   52
> ++++++++++++++++++++ .../ipsec-tools/ipsec-tools_0.7.2.bb               |
> 11 ++++ 3 files changed, 77 insertions(+), 0 deletions(-) create mode
> 100644
> meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch 
> create mode 100644 meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc 
> create mode 100644
> meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> 
> diff --git
> a/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
> b/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch new
> file mode 100644 index 0000000..6b9c39b --- /dev/null +++
> b/meta-oe/recipes-support/ipsec-tools/files/ipsec-tools-install.patch @@
> -0,0 +1,14 @@ +Taken from pld-linux.org: 
> +http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipsec-tools-install.patch
>
> 
+
> +--- ipsec-tools-0.7.2/src/racoon/Makefile.am~	2008-07-23
> 13:48:40.000000000 +0200 ++++ ipsec-tools-0.7.2/src/racoon/Makefile.am
> 2009-07-04 01:43:48.148433975 +0200 +@@ -3,7 +3,7 @@ + sbin_PROGRAMS =
> racoon racoonctl plainrsa-gen + noinst_PROGRAMS = eaytest +
> include_racoon_HEADERS = racoonctl.h var.h vmbuf.h misc.h gcmalloc.h
> admin.h \ +-	schedule.h sockmisc.h vmbuf.h isakmp_var.h isakmp.h
> isakmp_xauth.h \ ++	schedule.h sockmisc.h isakmp_var.h isakmp.h
> isakmp_xauth.h \ + 	isakmp_cfg.h isakmp_unity.h ipsec_doi.h evt.h +
> lib_LTLIBRARIES = libracoon.la + diff --git
> a/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc
> b/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc new file mode
> 100644 index 0000000..fffb897 --- /dev/null +++
> b/meta-oe/recipes-support/ipsec-tools/ipsec-tools.inc @@ -0,0 +1,52 @@ 
> +DESCRIPTION = "IPsec-Tools is a port of KAME's IPsec utilities to the \ 
> +Linux-2.6 IPsec implementation." +HOMEPAGE =
> "http://ipsec-tools.sourceforge.net/" +SECTION = "console/network" 
> +LICENSE = "BSD" +DEPENDS = "virtual/kernel openssl readline flex" + 
> +SRC_URI =
> "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.bz2;name=ipsec-tools-${PV}"
>
> 
+
> +INC_PR = "r3"

remove that

> + +inherit autotools + +# Options: +#  --enable-adminport      enable
> admin port +#  --enable-rc5            enable RC5 encryption (patented) 
> +#  --enable-idea enable IDEA encryption (patented) +#  --enable-gssapi
> enable GSS-API authentication +#  --enable-hybrid         enable hybrid,
> both mode-cfg and xauth support +#  --enable-frag           enable IKE
> fragmentation payload support +#  --enable-stats          enable
> statistics logging function +#  --enable-dpd            enable dead peer
> detection +#  --enable-samode-unspec  enable to use unspecified a mode of
> SA +#  --disable-ipv6          disable ipv6 support +#  --enable-natt
> enable NAT-Traversal (yes/no/kernel) +#  --enable-natt-versions=list
> list of supported NAT-T versions delimited by coma. +#
> --with-kernel-headers=/lib/modules/<uname>/build/include +#
> where your Linux Kernel headers are installed +#  --with-readline
> support readline input (yes by default) +#  --with-flex             use
> directiory (default: no) +#  --with-flexlib=<LIB>    specify flex
> library. +#  --with-openssl=DIR      specify OpenSSL directory +#
> --with-libradius=DIR    specify libradius path (like/usr/pkg) +#
> --with-libpam=DIR       specify libpam path (like/usr/pkg) +# +# Note: if
> you give it the actual kernel headers it won't build, it actually +#
> needs to point at the linux-libc-headers version of the kernel headers. 
> +# +EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \ +
> --with-readline \ +                --with-openssl=${STAGING_LIBDIR}/.. \ 
> +                --without-libradius \ +                --without-gssapi
> \ +                --without-libpam" + +# See
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527 +CFLAGS +=
> "-fno-strict-aliasing" + +# Sometimes it attempts to use y.tab.c before
> it is actually +# generated. Note that the failure case is very rare, but
> it does +# happen. +PARALLEL_MAKE = "" diff --git
> a/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
> b/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb new file mode
> 100644 index 0000000..e86f2cf --- /dev/null +++
> b/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb @@ -0,0 +1,11
> @@ +PR = "${INC_PR}.1"

and remove thart

> + +require ipsec-tools.inc + +LIC_FILES_CHKSUM =
> "file://Makefile.in;endline=14;md5=c73d05590728997bfbab5c671ed38366" + 
> +SRC_URI += "file://ipsec-tools-install.patch" 
> +SRC_URI[ipsec-tools-0.7.2.md5sum] = "72861f005746ee27984b2ee715ecc629" 
> +SRC_URI[ipsec-tools-0.7.2.sha256sum] =
> "08722ff6c62de3e042fef337454f03622a79053108d6dcc686c9c854f9f9e031" + 
> +EXTRA_OECONF += " --disable-security-context"

And put that in the .inc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q+BYACgkQMkyGM64RGpGdggCePgqIdbPzcxHLdd2eNIH3t7FK
XXsAoKixgiw8dMxscOXWLVx/IXk+CJk7
=GSxm
-----END PGP SIGNATURE-----



