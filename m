Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 47DC26FA6A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 07:22:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ws5WN-0003LL-Rq for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jun 2014 09:22:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 09:22:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 09:22:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 04 Jun 2014 09:21:54 +0200
Message-ID: <lmmhei$ufg$1@ger.gmane.org>
References: <1401205819-21761-1-git-send-email-maxim.uvarov@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1401205819-21761-1-git-send-email-maxim.uvarov@linaro.org>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] update snort to 2.9.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jun 2014 07:22:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Maxim Uvarov schreef op 27-05-14 17:50:
> 1. looks like snort dropped reference to barnyard2. At least it's missing
> in configure. Also download link to barnyard2 is not available now. Drop
> this package. 2. update snort version from 2.9.4.6 to 2.9.6.0. 3. fix
> libdnet paths.

Can you please split such patches in 2 parts next time? If someone wants to
resurrect barnyard it will downgrade snort :/

> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org> --- 
> .../barnyard2-1.8/barnyard2-cross-fix.patch        | 24
> ---------------------- .../barnyard2/barnyard2_1.8.bb
> | 18 ---------------- .../snort/{snort_2.9.4.6.bb => snort_2.9.6.0.bb}
> |  8 ++++---- 3 files changed, 4 insertions(+), 46 deletions(-) delete
> mode 100644
> meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>
> 
delete mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
> rename meta-networking/recipes-connectivity/snort/{snort_2.9.4.6.bb =>
> snort_2.9.6.0.bb} (89%)
> 
> diff --git
> a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
> b/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>
> 
deleted file mode 100644
> index 7b5a60c..0000000 ---
> a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
>
> 
+++ /dev/null
> @@ -1,24 +0,0 @@ -Upstream-Status: Pending - -Index:
> barnyard2-1.8/configure.in 
> -=================================================================== ----
> barnyard2-1.8.orig/configure.in	2010-08-03 15:12:06.000000000 +0400 -+++
> barnyard2-1.8/configure.in	2010-08-03 15:13:46.000000000 +0400 -@@ -73,7
> +73,7 @@ -     # libpcap doesn't even LOOK at the timeout you give it
> under Linux -     AC_DEFINE([PCAP_TIMEOUT_IGNORED],[1],[Define if pcap
> timeout is ignored]) -     AC_SUBST(extra_incl) --
> extra_incl="-I/usr/include/pcap" -+    extra_incl="-I=/usr/include/pcap" 
> -     ;; -   *-hpux10*|*-hpux11*) -     AC_DEFINE([HPUX],[1],[Define if
> HP-UX 10 or 11]) -@@ -230,7 +230,7 @@ - # In case INADDR_NONE is not
> defined (like on Solaris) - have_inaddr_none="no" - AC_MSG_CHECKING([for
> INADDR_NONE]) --AC_RUN_IFELSE( -+AC_COMPILE_IFELSE( - [AC_LANG_PROGRAM( -
> [[ - #include <sys/types.h> diff --git
> a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
> b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb deleted
> file mode 100644 index 14acdac..0000000 ---
> a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb +++
> /dev/null @@ -1,18 +0,0 @@ -DESCRIPTION = "Barnyard2 is a fork of the
> original barnyard project, designed specifically for Snort's new unified2
> file format" -HOMEPAGE = "http://www.securixlive.com/barnyard2/" -LICENSE
> = "GPLv2" -LIC_FILES_CHKSUM =
> "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe" -DEPENDS =
> "libpcap" - -SRC_URI = " \ -
> http://www.securixlive.com/download/barnyard2/${BP}.tar.gz \ -
> file://barnyard2-cross-fix.patch \ -	" -SRC_URI[md5sum] =
> "72fc6c490db6ea6a0f46c27d24998067" -SRC_URI[sha256sum] =
> "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a" - 
> -inherit autotools pkgconfig - -EXTRA_OECONF = "--enable-prelude
> --enable-gre --without-mysql" - -CONFFILES_${PN} =
> "${sysconfdir}/barnyard2.conf" diff --git
> a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
> b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb similarity
> index 89% rename from
> meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb rename to
> meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb index
> acb1b1a..aba2850 100644 ---
> a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb +++
> b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb @@ -13,8
> +13,8 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \ 
> file://0001-libpcap-search-sysroot-for-headers.patch \ "
> 
> -SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd" 
> -SRC_URI[tarball.sha256sum] =
> "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc" 
> +SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659" 
> +SRC_URI[tarball.sha256sum] =
> "3cc6c8a9b52f4c863a5736a73b4012aff340b50b5e002771b04d4877f47cd19e"
> 
> inherit autotools  gettext  update-rc.d
> 
> @@ -28,6 +28,8 @@ EXTRA_OECONF = " \ --enable-reload-error-restart \ 
> --enable-targetbased \ --disable-static-daq \ +
> --with-dnet-includes=${STAGING_INCDIR} \ +
> --with-dnet-libraries=${STAGING_LIBDIR} \ "
> 
> do_install_append() { @@ -69,5 +71,3 @@ FILES_${PN}-dev += " \ 
> ${libdir}/snort_dynamicrules/*.so \ ${prefix}/src/snort_dynamicsrc \ " - 
> -RRECOMMENDS_${PN} += "barnyard2"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTjskSMkyGM64RGpERAsiWAKCB+yFIp/CqWoMdC3QZcSUs792MSQCeK3GF
fcCWJ3C+bI38YKdNGQqvBTc=
=hPu+
-----END PGP SIGNATURE-----


