Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPL8p-0000zU-4c
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 01:06:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Apr 2013 15:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,434,1363158000"; d="scan'208";a="224781964"
Received: from unknown (HELO helios.localnet) ([10.255.13.161])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Apr 2013 15:49:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Mon, 08 Apr 2013 23:49 +0100
Message-ID: <1644870.xWQQ3phVp5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-26-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1365458017-3185-1-git-send-email-dv@pseudoterminal.org>
References: <1365458017-3185-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] add recipe for mpg123, a decoder for MPEG-1 layer 1, 2, and 3
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
X-List-Received-Date: Mon, 08 Apr 2013 23:06:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 08 April 2013 23:53:37 Carlos Rafael Giani wrote:
> mpg123 consists of a decoder library, and a command line application.
> The application can be used to playback and dump decoded mp1/mp2/mp3 files.
> The library can be integrated in other applications. CPU usage is minimal.
> 
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta-oe/recipes-multimedia/mpg123/mpg123_1.15.3.bb | 30
> ++++++++++++++++++++++ 1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> 
> diff --git a/meta-oe/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> b/meta-oe/recipes-multimedia/mpg123/mpg123_1.15.3.bb new file mode 100644
> index 0000000..6b9490e
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mpg123/mpg123_1.15.3.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Audio decoder for MPEG-1 Layer 1/2/3"
> +DESCRIPTION = "The core of mpg123 is an MPEG-1 Layer 1/2/3 decoding
> library, which can be used by other programs. \ +mpg123 also comes with a
> command-line tool which can playback using ALSA, PulseAudio, OSS, and
> several other APIs, \ +and also can write the decoded audio to WAV."
> +HOMEPAGE = "http://mpg123.de/"
> +BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
> +SECTION = "multimedia"
> +
> +LICENSE = "LGPLv2.1"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a7aa23a2b646eca38ad4eeb7a853761c"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/mpg123-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "f734f9e2982f398a1c919475fc0b3798"
> +SRC_URI[sha256sum] =
> "b6b1aef887835f83ac3d4acb5701ae619041fc60d76548ad779a409080338df7" +
> +S = "${WORKDIR}/mpg123-${PV}"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = " \
> +	--enable-shared \
> +	${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
> +	${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec',
> '', d)} \ +	${@bb.utils.contains('TUNE_FEATURES', 'i586',
> '--with-cpu=i586', '', d)} \ +	${@bb.utils.contains('DISTRO_FEATURES',
> 'alsa', '--with-default-audio=alsa', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',
> '--with-default-audio=pulse', '', d)} \ +	"
> +

Recipe looks good, however this should probably go into meta-multimedia. We do 
still have some multimedia recipes in meta-oe but these ought to be moved 
(when someone gets around to it).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


