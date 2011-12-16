Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSbP-0003bL-QP for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 08:53:11 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSUg-0006KD-8y for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 08:46:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:46:14 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 08:46:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:45:59 +0100
Message-ID: <jcesvl$4n1$1@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-1-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 1/9] bridge-utils: add
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
X-List-Received-Date: Fri, 16 Dec 2011 07:53:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> bridge-utils provides tools for ethernet bridging.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> .../bridge-utils/bridge-utils.inc                  |   30 +++ 
> .../bridge-utils/bridge-utils_1.4.bb               |    6 + 
> .../bridge-utils/files/ifupdown.sh                 |  245
> ++++++++++++++++++++ 3 files changed, 281 insertions(+), 0 deletions(-) 
> create mode 100644
> meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc create mode
> 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb 
> create mode 100644
> meta-oe/recipes-connectivity/bridge-utils/files/ifupdown.sh
> 
> diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc new file
> mode 100644 index 0000000..5ac6c83 --- /dev/null +++
> b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc @@ -0,0
> +1,30 @@ +DESCRIPTION = "Tools for ethernet bridging." +HOMEPAGE =
> "http://bridge.sourceforge.net/" +SECTION = "console/network" +LICENSE =
> "GPL"

That's not a valid license

> +DEPENDS = "sysfsutils" +RRECOMMENDS_${PN} = "kernel-module-bridge"

That needs to move below do_install. Does it also need ifupdown? Patch looks
OK otherwise.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q9zcACgkQMkyGM64RGpFR3QCfes5gKH1Jk36n80JUJGUoa1nO
DWsAn1aWYMXjieT5K+xmiwEdACL6Ln+5
=RPWd
-----END PGP SIGNATURE-----



