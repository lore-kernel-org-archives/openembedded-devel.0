Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 May 2014 06:41:33 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDB0607FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 06:41:33 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WfkRz-00013D-9G for openembedded-devel@lists.openembedded.org;
	Thu, 01 May 2014 08:26:31 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 08:26:31 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 08:26:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 May 2014 08:26:20 +0200
Message-ID: <ljspeb$sbo$1@ger.gmane.org>
References: <1398886261-23886-1-git-send-email-ferlandm@sonatest.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1398886261-23886-1-git-send-email-ferlandm@sonatest.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] lmsensors: update 3.3.3 -> 3.3.5
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
X-List-Received-Date: Thu, 01 May 2014 06:41:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marc Ferland schreef op 30-04-14 21:31:
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com> --- 
> .../lm_sensors/{lmsensors_3.3.3.bb => lmsensors_3.3.5.bb}        | 9 
> ++++++--- 1 file changed, 6 insertions(+), 3 deletions(-) rename 
> meta-oe/recipes-support/lm_sensors/{lmsensors_3.3.3.bb => 
> lmsensors_3.3.5.bb} (93%)
> 
> diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb 
> b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb similarity index
>  93% rename from meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb 
> rename to meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb index 
> a965c29..6c9b3fd 100644 --- 
> a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb +++ 
> b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb @@ -11,8 +11,10 
> @@ SRC_URI = 
> "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 
> file://fancontrol.init \ file://sensord.init \ " -SRC_URI[md5sum] = 
> "73c2fcccdab6049d289c5e0c596192a1" -SRC_URI[sha256sum] = 
> "ecc91ba3d918e96fb7d5eb9acce978af803b130e0b33b08d5ea05b2bfca84955" 
> +SRC_URI[md5sum] = "da506dedceb41822e64865f6ba34828a" +SRC_URI[sha256sum]
> = "5dae6a665e1150159a93743c4ff1943a7efe02cd9d3bb12c4805e7d7adcf4fcf" +
> +PR = "r1"

Why are you bumping PR? Please remove PR from the recipe.

> 
> inherit update-rc.d
> 
> @@ -67,7 +69,7 @@ PACKAGES =+ "${PN}-fancontrol ${PN}-fancontrol-doc" 
> PACKAGES =+ "${PN}-sensorsdetect ${PN}-sensorsdetect-doc"
> 
> # sensors-conf-convert script -PACKAGES =+ "${PN}-sensorsconfconvert" 
> +PACKAGES =+ "${PN}-sensorsconfconvert ${PN}-sensorsconfconvert-doc"
> 
> # pwmconfig script PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc" @@ 
> -109,6 +111,7 @@ RDEPENDS_${PN}-sensorsdetect = "${PN}-sensors perl 
> perl-modules"
> 
> # sensors-conf-convert script files FILES_${PN}-sensorsconfconvert = 
> "${bindir}/sensors-conf-convert" +FILES_${PN}-sensorsconfconvert-doc = 
> "${mandir}/man8/sensors-conf-convert.8" RDEPENDS_${PN}-sensorsconfconvert
> = "${PN}-sensors perl perl-modules"

These changes aren't mentioned in the commit summary

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTYekMMkyGM64RGpERAiv+AJ9nRDHUuvit48MWhBkQpTm/BSIufQCcDRLQ
Qdw1uiwnhOMfjFOj2yIF14I=
=+moE
-----END PGP SIGNATURE-----


