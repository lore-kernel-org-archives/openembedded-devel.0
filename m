Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbT8d-0005oq-4T for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:27:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbT1U-0008Mz-Te for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:20:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:20:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:20:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:51:49 +0100
Message-ID: <jcetai$4n1$5@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-5-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 5/9] nerperf: add
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
X-List-Received-Date: Fri, 16 Dec 2011 08:27:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> Network performance benchmark including tests for TCP, UDP, sockets, ATM
> and more.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> ---

> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0 +1,47
> @@ +DESCRIPTION="Network performance benchmark including tests for TCP,
> UDP, sockets, ATM and more." +SECTION = "console/network" +HOMEPAGE =
> "http://www.netperf.org/" +LICENSE = "netperf"

Can you include a comment on what type of license netperf is? MIT like, BSD
like, GPL like?

> +PR = "r3"

remove that

> + +LIC_FILES_CHKSUM =
> "file://COPYING;md5=a0ab17253e7a3f318da85382c7d5d5d6"

Move next to LICENSE

> + +SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2
> \ +         file://cpu_set.patch \ +         file://vfork.patch \ +
> file://init" + +inherit update-rc.d autotools + +S =
> "${WORKDIR}/netperf-${PV}" + +# cpu_set.patch plus _GNU_SOURCE makes
> src/netlib.c compile with CPU_ macros +CFLAGS_append = " -DDO_UNIX
> -DDO_IPV6 -D_GNU_SOURCE" + +do_install() { +        install -d
> ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d +        install -m
> 4755 src/netperf ${D}${bindir} +        install -m 4755 src/netserver
> ${D}${sbindir} +        install -m 0755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/netperf + +        # man +        install -d
> ${D}${mandir}/man1/ +        install -m 0644 doc/netserver.man
> ${D}${mandir}/man1/netserver.1 +        install -m 0644 doc/netperf.man
> ${D}${mandir}/man1/netperf.1 + +        # move scripts to examples
> directory +        install -d ${D}${docdir}/netperf/examples +
> install -m 0644 doc/examples/*_script ${D}${docdir}/netperf/examples/ + +
> # docs .. +        install -m 0644 COPYING ${D}${docdir}/netperf +
> install -m 0644 Release_Notes ${D}${docdir}/netperf +        install -m
> 0644 README ${D}${docdir}/netperf +        install -m 0644
> doc/netperf_old.ps ${D}${docdir}/netperf +} + +INITSCRIPT_NAME="netperf" 
> +INITSCRIPT_PARAMS="defaults" + +SRC_URI[md5sum] =
> "0e942f22864e601406a994420231075b" +SRC_URI[sha256sum] =
> "28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497"

move next to SRC_URI

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q+JUACgkQMkyGM64RGpGGHQCgnou5F2Pjm9TDWEC55MbufJvg
qTYAn0ooWerqftJ4JpElOvB96dTJWAb8
=L7Pg
-----END PGP SIGNATURE-----



