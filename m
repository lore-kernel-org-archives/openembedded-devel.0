Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id A4FF16D8FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 07:53:46 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W8Pxx-00051O-Vn for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jan 2014 08:53:45 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 08:53:45 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 08:53:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 29 Jan 2014 08:54:09 +0100
Message-ID: <lcac1h$c5i$1@ger.gmane.org>
References: <1390921195-18862-1-git-send-email-chase.maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1390921195-18862-1-git-send-email-chase.maupin@ti.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] php: update SRC_URI for new download location
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
X-List-Received-Date: Wed, 29 Jan 2014 07:53:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chase Maupin schreef op 28-01-14 15:59:
> * The old downloads location of http://www.php.net/distributions now
> points to a listing of all distributions and the mirrors or download
> locations where the sources can be downloaded. * The new download
> location is http://museum.php.net/..... where the rest of the URL is
> based on the major version on PHP being downloaded.  This is a change
> from the previous download server which had a flattened directory
> structure so that all versions were available in a single location. * To
> account for this change in the directory structure a variable called
> PHP_MAJVER is used based off of the PV to point the SRC_URI to the proper
> subdirectory. * This issue wsa first noted by Joshua Vanderpool at 
> Joshua.Vanderpool@raymondcorp.com and there was discussion at 
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-January/093757.html
>
>  Signed-off-by: Chase Maupin <chase.maupin@ti.com> --- 
> meta-oe/recipes-devtools/php/php.inc |    8 ++++++-- 1 file changed, 6
> insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc index 5345f2a..75c3704 100644 ---
> a/meta-oe/recipes-devtools/php/php.inc +++
> b/meta-oe/recipes-devtools/php/php.inc @@ -7,9 +7,13 @@ DEPENDS = "zlib
> libxml2 virtual/libiconv php-native lemon-native \ libc-client openssl" 
> DEPENDS_virtclass-native = "zlib-native libxml2-native"
> 
> -INC_PR = "r5" +INC_PR = "r6"

Unneeded, drop it.


> 
> -SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2" +# The
> new PHP downloads server groups PHP releases by major version so find +#
> the major version of the PHP recipe. +PHP_MAJVER =
> "${@d.getVar('PV',1).split('.')[0]}" + +SRC_URI =
> "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2"
> 
> S = "${WORKDIR}/php-${PV}"
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS6LOhMkyGM64RGpERAunvAJsHwh4jpfnyXlaPval5hJ4Enmck5QCguyE5
2QA9AMc0ZhddgDIDZXZNS94=
=J4pd
-----END PGP SIGNATURE-----


