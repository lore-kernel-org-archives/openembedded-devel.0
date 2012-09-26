Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TGmLV-0006WT-R8 for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 09:47:49 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TGm99-0001TK-Ej for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 09:35:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 09:35:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 09:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 26 Sep 2012 09:30:53 +0200
Message-ID: <k3uava$evl$2@ger.gmane.org>
References: <1348631053-21801-1-git-send-email-jackie.huang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
In-Reply-To: <1348631053-21801-1-git-send-email-jackie.huang@windriver.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-networking] [PATCH] iw: migrate from meta-oe into meta-networking and uprev to iw 3.6
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
X-List-Received-Date: Wed, 26 Sep 2012 07:47:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-09-12 05:44, jackie.huang@windriver.com schreef:
> From: Jackie Huang <jackie.huang@windriver.com>

Most importantly: iw can't be moved out of meta-oe since packagegroup-basic
depends on it. Since iw is replacing wireless-tools it is a candidate for
oe-core.

> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com> --- 
> ....sh-don-t-use-git-describe-for-versioning.patch |   44
> ++++++++++++++++++++ meta-networking/recipes-support/iw/iw_3.2.bb       |
> 22 ++++++++++ meta-networking/recipes-support/iw/iw_3.6.bb       |   27
> ++++++++++++

Why 2 versions?

> +++ b/meta-networking/recipes-support/iw/iw_3.6.bb @@ -0,0 +1,27 @@ 
> +SUMMARY = "nl80211 based CLI configuration utility for wireless
> devices" +DESCRIPTION = "iw is a new nl80211 based CLI configuration
> utility for \ +wireless devices. It supports almost all new drivers that
> have been added \ +to the kernel recently. " +HOMEPAGE =
> "http://linuxwireless.org/en/users/Documentation/iw" +SECTION = "base" 
> +LICENSE = "BSD" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774" + +PR = "r0"

Remove that.

> + +DEPENDS = "libnl pkgconfig" + +SRC_URI =
> "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \ +
> file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \ +
> " + +SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c" 
> +SRC_URI[sha256sum] =
> "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857" + +#
> EXTRA_OEMAKE is typically: -e MAKEFLAGS= +# the -e causes problems as
> CFLAGS is modified in the Makefile. +EXTRA_OEMAKE = ""

Same comment as with ptpd. The older version don't seem to need this hack.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQYq8tMkyGM64RGpERAigGAJwImQk5QRWnjicqP2SgCAclj8YKTgCgsblY
ccuKk2jnfr2i3XpWBpQAn+c=
=oaSE
-----END PGP SIGNATURE-----



