Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TP9GU-0000aR-5e for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 11:53:14 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TP93i-0005N5-0w for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 11:40:02 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 11:40:02 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 11:40:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 19 Oct 2012 11:39:50 +0200
Message-ID: <k5r74s$r0$1@ger.gmane.org>
References: <1350565318-13026-1-git-send-email-ferlandm@sonatest.com>
	<1350565318-13026-2-git-send-email-ferlandm@sonatest.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1350565318-13026-2-git-send-email-ferlandm@sonatest.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] lmsensors: Initial commit.
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
X-List-Received-Date: Fri, 19 Oct 2012 09:53:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-10-12 15:01, Marc Ferland schreef:
> The lmsensors project provides hardware health monitoring tools in the 
> form of kernel drivers, a user-space library and some helper programs.
> This recipe provides all the different user-space tools offered by
> lmsensors in separete packages. Startup scripts and default configuration
> files are also made available through this commit.
> 
> The packages consist of (description text from lmsensors documentation): 
> * lmsensors-libsensors: The user-space sensors support library code. *
> lmsensors-sensors: A console tool to report sensor readings and set new
> sensor limits. * lmsensors-sensord: A daemon to watch sensor values and
> log problems. It includes RRD support. * lmsensors-fancontrol: Controls
> fanspeeds responding to changes on temperature sensors. Configuration
> through pwmconfig. * lmsensors-sensorsdetect: This program tries to
> detect the available SMBus adapters and the chips connected to them, as
> well as Super-I/O and misc chips. * lmsensors-sensorsconfconvert: Convert
> configuration files from lmsensorsv2 to lmsensorsv3. *
> lmsensors-pwmconfig: tests the pwm (pulse width modulation) outputs of
> sensors for their effect on the fans and helps to setup the configfile
> for fancontrol. * lmsensors-isatools: This program sets/gets the
> registers of ISA or Super-I/O chips.
> 
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com> ---

> +++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb @@ -0,0
> +1,150 @@ +SUMMARY = "lm_sensors" +DESCRIPTION = "Hardware health
> monitoring applications" +HOMEPAGE = "http://www.lm-sensors.org/" 
> +LICENSE = "GPLv2+ & LGPLv2.1+" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \ +
> file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"

> +PR = "r0"

Drop that


> +DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native
> rrdtool" +PROVIDES = "\ +${PN}-libsensors \ +${PN}-sensors \ 
> +${PN}-sensord \ +${PN}-fancontrol \ +${PN}-sensorsdetect \ 
> +${PN}-sensorsconfconvert \ +${PN}-pwmconfig \ +${PN}-isatools \

Anything listed in PACKAGES is already in (R)PROVIDES, so drop the above
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQgR/mMkyGM64RGpERAvJBAJ9Cnla/rkwCvnpoBauHCsKAYm7unQCcClGt
BYGjJVKXS5k9Z2Jg0Gf1Dww=
=Rc3D
-----END PGP SIGNATURE-----



