Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIPzC-0005f6-H1 for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 20:42:46 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIPwa-0004le-7D for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 20:40:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 20:40:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 20:40:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 May 2011 20:35:02 +0200
Message-ID: <iq1f0m$1u2$1@dough.gmane.org>
References: <1304688591-31481-1-git-send-email-pprakash@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304688591-31481-1-git-send-email-pprakash@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] gst-ffmpeg: fix license information
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
X-List-Received-Date: Fri, 06 May 2011 18:42:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-11 15:29, Punya Prakash wrote:
> From: Punya Prakash <pprakash.ti@gmail.com>
> 
> * gst-ffmpeg by default compiles FFmpeg/libav with --enable-gpl and --enable-postproc

As stated in the other mail, gst-ffmpeg doesn't compile libav, so are
you sure this license change is correct?

> ---
>  recipes/gstreamer/gst-ffmpeg_0.10.11.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> index 563521e..26aecce 100644
> --- a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> +++ b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> @@ -1,11 +1,11 @@
>  DESCRIPTION = "FFmpeg-based GStreamer plug-in"
>  SECTION = "multimedia"
>  PRIORITY = "optional"
> -LICENSE = "LGPL"
> +LICENSE = "GPLv2 LGPLv2.1"
>  HOMEPAGE = "http://www.gstreamer.net/"
>  DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  inherit autotools pkgconfig
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxD9WMkyGM64RGpERAm1wAJ41riUGHjnzXO6IbfgduwFNxwSIqwCgvMNk
qHphF4LQGvNyUiI0D36Q6hs=
=C6Te
-----END PGP SIGNATURE-----



