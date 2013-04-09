Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPSXY-00077Z-UG for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 09:00:43 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UPSGn-0000TT-Hv for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 08:43:05 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 08:43:05 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 08:43:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Apr 2013 08:43:02 +0200
Message-ID: <kk0d9f$qip$1@ger.gmane.org>
References: <1365463467-5893-1-git-send-email-dv@pseudoterminal.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1365463467-5893-1-git-send-email-dv@pseudoterminal.org>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][PATCH v2] add recipe for mpg123, a decoder for MPEG-1 layer 1, 2, and 3
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
X-List-Received-Date: Tue, 09 Apr 2013 07:01:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-04-13 01:24, Carlos Rafael Giani schreef:
> mpg123 consists of a decoder library, and a command line application. The
> application can be used to playback and dump decoded mp1/mp2/mp3 files. 
> The library can be integrated in other applications. CPU usage is
> minimal.
> 
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org> --- 
> .../recipes-multimedia/mpg123/mpg123_1.15.3.bb     | 30
> ++++++++++++++++++++++ 1 file changed, 30 insertions(+) create mode
> 100644 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> 
> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb new file
> mode 100644 index 0000000..6b9490e --- /dev/null +++
> b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb @@ -0,0
> +1,30 @@ +SUMMARY = "Audio decoder for MPEG-1 Layer 1/2/3" +DESCRIPTION =
> "The core of mpg123 is an MPEG-1 Layer 1/2/3 decoding library, which can
> be used by other programs. \ +mpg123 also comes with a command-line tool
> which can playback using ALSA, PulseAudio, OSS, and several other APIs,
> \ +and also can write the decoded audio to WAV." +HOMEPAGE =
> "http://mpg123.de/" +BUGTRACKER =
> "http://sourceforge.net/p/mpg123/bugs/" +SECTION = "multimedia" + 
> +LICENSE = "LGPLv2.1" +LICENSE_FLAGS = "commercial" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=a7aa23a2b646eca38ad4eeb7a853761c" + +SRC_URI =
> "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/mpg123-${PV}.tar.bz2" + 
> +SRC_URI[md5sum] = "f734f9e2982f398a1c919475fc0b3798" +SRC_URI[sha256sum]
> = "b6b1aef887835f83ac3d4acb5701ae619041fc60d76548ad779a409080338df7" + +S
> = "${WORKDIR}/mpg123-${PV}" + +inherit autotools pkgconfig + 
> +EXTRA_OECONF = " \ +	--enable-shared \ +
> ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)}
> \ +	${@bb.utils.contains('TUNE_FEATURES', 'altivec',
> '--with-cpu=altivec', '', d)} \ +	${@bb.utils.contains('TUNE_FEATURES',
> 'i586', '--with-cpu=i586', '', d)} \

A note of warning, OE-core defines a ton of modern CPUs to be i586, the Atom
E6xx is one of them, it supports up to SSSE4.0, but I don't think mpg123
will include that.

This isn't a problem with your patch, but with OE-core, so no need to
change. Just adding more google juice for when people are wondering why
mpg123 sucks on their intel boards :)

> +	${@bb.utils.contains('DISTRO_FEATURES', 'alsa',
> '--with-default-audio=alsa', '', d)} \ +
> ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> '--with-default-audio=pulse', '', d)} \ +	" +
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD4DBQFRY7h2MkyGM64RGpERAi+bAJjMMmIPOANk37QFxxsh/nsRs9N8AKC7dzI+
4PsmLFH/3KicA3kdYQ0lSg==
=b13E
-----END PGP SIGNATURE-----



