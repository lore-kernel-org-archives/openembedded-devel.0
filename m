Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C09DA6EC47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 08:56:22 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WEEZF-0004c2-KL for openembedded-devel@lists.openembedded.org;
	Fri, 14 Feb 2014 09:56:17 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 09:56:17 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 09:56:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 14 Feb 2014 09:57:23 +0100
Message-ID: <ldklmr$ov6$1@ger.gmane.org>
References: <1392363700-22933-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1392363700-22933-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH V2] libmicrohttpd: upgrade to 0.9.33
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
X-List-Received-Date: Fri, 14 Feb 2014 08:56:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 14-02-14 08:41:
> libmicrohttpd is needed by systemd-journald-gatewayd Remove older recipes
> and move to recipes-support
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
> .../libmicrohttpd/libmicrohttpd_0.4.6.bb           |   16
> ---------------- .../libmicrohttpd/libmicrohttpd_0.9.33.bb}         |
> 20 ++++++++++++-------- 2 files changed, 12 insertions(+), 24
> deletions(-) delete mode 100644
> meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb rename
> meta-oe/{recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb =>
> recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb} (23%)
> 
> diff --git
> a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
> b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb 
> deleted file mode 100644 index ebaa485..0000000 ---
> a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb +++
> /dev/null @@ -1,16 +0,0 @@ -DESCRIPTION = "GNU libmicrohttpd is a small C
> library that is supposed to make it easy to run an HTTP server as part of
> another application." -LICENSE = "LGPLv2.1" -LIC_FILES_CHKSUM =
> "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5" - -DEPENDS =
> "libgcrypt curl" - -# ftp://ftp.nluug.nl/pub/gnu/${PN}/ has only 0.9.*
> and newer now -SRC_URI =
> "http://mirrors.usc.edu/pub/gnu/${PN}/${P}.tar.gz" -SRC_URI[md5sum] =
> "61698da6aa04744ea076c327f66fc05a" -SRC_URI[sha256sum] =
> "0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a99e371" - 
> -inherit autotools lib_package - -do_compile_append() { -    sed -i
> s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc -} diff --git
> a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb 
> similarity index 23% rename from
> meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb rename
> to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb index
> 802ae40..2c738c9 100644 ---
> a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb +++
> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb @@ -1,16
> +1,20 @@ -DESCRIPTION = "GNU libmicrohttpd is a small C library that is
> supposed to make it easy to run an HTTP server as part of another
> application." -LICENSE = "LGPLv2.1" +DESCRIPTION = "A small C library
> that is supposed to make it easy to run an HTTP server as part of another
> application" +HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/" 
> +LICENSE = "LGPL-2.1+" LIC_FILES_CHKSUM =
> "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5" +SECTION = "net" 
> +DEPENDS = "gnutls libgcrypt curl"
> 
> -DEPENDS = "libgcrypt curl" - -SRC_URI =
> "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${PV}.tar.gz" 
> -SRC_URI[md5sum] = "a10496b7f1b495aaf6897584da52f51b" -SRC_URI[sha256sum]
> = "d532edf64c3a9da472114c2d10fc94606e3b31f21b883ec2e796ab8478f7e9cb" - 
> +SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz" 
> +SRC_URI[md5sum] = "013b10f9de1cda5448b29c81305354a3" +SRC_URI[sha256sum]
> = "d9587e8497548f820650cd607daf3615ea3272435779378983032c570f1cd559"
> 
> inherit autotools lib_package
> 
> +EXTRA_OECONF += "--disable-dependency-tracking --enable-largefile \ +
> --enable-curl --enable-messages --with-pic"

I'm not 100% sure, but isn't largefile a DISTRO_FEATURE?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS/dpzMkyGM64RGpERAoh1AKCBF+EjcIYqIXLoY27vC48I/BveOACgu38U
9w1XcagcP90WF752zdacvmQ=
=F3eg
-----END PGP SIGNATURE-----


