Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UVqfz-0003yx-Jt for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 23:59:37 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UVqOk-00013n-Re for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 23:41:42 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 23:41:42 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 23:41:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 26 Apr 2013 23:41:38 +0200
Message-ID: <klesac$abk$1@ger.gmane.org>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
In-Reply-To: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Fri, 26 Apr 2013 21:59:46 -0000
X-List-Received-Date: Fri, 26 Apr 2013 21:59:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-04-13 22:39, Nicolas Dechesne schreef:
> Import smartmontools recipe from OE classic, and updated to upstream
> v5.40.
> 
> Also added cosmetic changes in the recipe: INC_PR support and homepage.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org> --- 
> meta-oe/recipes-support/smartmontools/smartmontools.inc     | 10
> ++++++++++ meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb |
> 5 +++++ 2 files changed, 15 insertions(+) create mode 100644
> meta-oe/recipes-support/smartmontools/smartmontools.inc create mode
> 100644 meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
> 
> diff --git a/meta-oe/recipes-support/smartmontools/smartmontools.inc
> b/meta-oe/recipes-support/smartmontools/smartmontools.inc new file mode
> 100644 index 0000000..6f23055 --- /dev/null +++
> b/meta-oe/recipes-support/smartmontools/smartmontools.inc @@ -0,0 +1,10
> @@ +SECTION = "console/utils" +DESCRIPTION = "Control and monitor storage
> systems using S.M.A.R.T." +HOMEPAGE =
> "http://smartmontools.sourceforge.net/" +LICENSE = "GPLv2" 
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" +INC_PR = "r1"

Drop that

> + +SRC_URI =
> "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz" + 
> +inherit autotools diff --git
> a/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
> b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb new file
> mode 100644 index 0000000..93dc4db --- /dev/null +++
> b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb @@ -0,0
> +1,5 @@ +require smartmontools.inc +PR = "${INC_PR}.1"

And drop that.

And do you really need a .inc?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRevSRMkyGM64RGpERArE1AJ0XBvO7c35yipb1VMI1/GCwgOzCkQCeJQF1
z4Yu+V8MtCJnn0DZKNyIywk=
=Jq0r
-----END PGP SIGNATURE-----



