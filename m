Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id D97A6605D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 09:03:01 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YICuK-0004SV-IL for openembedded-devel@lists.openembedded.org;
	Mon, 02 Feb 2015 10:03:00 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 10:03:00 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 10:03:00 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 02 Feb 2015 10:02:53 +0100
Message-ID: <maneft$mtj$1@ger.gmane.org>
References: <1422622652-28318-1-git-send-email-raphael.freudiger@siemens.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
In-Reply-To: <1422622652-28318-1-git-send-email-raphael.freudiger@siemens.com>
Subject: Re: [meta-oe][PATCH v5] p7zip: new recipe
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
X-List-Received-Date: Mon, 02 Feb 2015 09:03:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Raphael Freudiger schreef op 30-01-15 om 13:57:
> p7zip is the command line version of 7-Zip for Unix/Linux.

> +DESCRIPTION = "7-zip is a commandline utility handling 7z archives." 
> +HOMEPAGE = "http://www.7-zip.org/" +LICENSE = "LGPL-2.1+ & unRAR" 
> +LIC_FILES_CHKSUM =
> "file://DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a \ +
> file://DOCS/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de" + 
> +SRC_URI =
> "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2
> \ +          file://do_not_override_compiler.patch" + +S =
> "${WORKDIR}/${PN}_${PV}" + +INHIBIT_PACKAGE_STRIP = "1"

Why is that needed?

> + +do_install() { +    install -d ${D}${bindir} +    install -m 0755
> ${S}/bin/* ${D}${bindir} +} + +SRC_URI[md5sum] =
> "bd6caaea567dc0d995c990c5cc883c89" +SRC_URI[sha256sum] =
> "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782"

Group all the SRC_URI* entries together please
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUzz09MkyGM64RGpERAl3YAJ4xDjvtnUowteVKqze1p2eV3vDTrgCfdSxh
tbuifAfyZpTKm64O3ibOB3s=
=Oxlo
-----END PGP SIGNATURE-----


