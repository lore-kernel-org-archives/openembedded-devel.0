Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QN8oJ-0007PU-Pv for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 21:23:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QN8lQ-0003D3-Az for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 21:20:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 21:20:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 21:20:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 May 2011 21:17:14 +0200
Message-ID: <ir3qbq$eqc$2@dough.gmane.org>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-6-git-send-email-GNUtoo@no-log.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305290588-7057-6-git-send-email-GNUtoo@no-log.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 06/12] xf86-video-omapfb: use newer srcrev(fix segmentation fault for bug20)
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
X-List-Received-Date: Thu, 19 May 2011 19:23:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-05-11 14:43, Denis 'GNUtoo' Carikli wrote:
> Without that fix Xorg go in segmentation fault when you insert the
>   bugview module(the module that has an hdmi and vga output)
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  recipes/xorg-driver/xf86-video-omapfb_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/xorg-driver/xf86-video-omapfb_git.bb b/recipes/xorg-driver/xf86-video-omapfb_git.bb
> index fce8ff8..bd81264 100644
> --- a/recipes/xorg-driver/xf86-video-omapfb_git.bb
> +++ b/recipes/xorg-driver/xf86-video-omapfb_git.bb
> @@ -2,7 +2,7 @@ require xorg-driver-video.inc
>  DESCRIPTION = "X.Org X server -- OMAP display driver"
>  PE = "1"
>  PV = "0.1.1+${PR}+gitr${SRCREV}"
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>  
>  SRC_URI = "git://git.pingu.fi/xf86-video-omapfb.git;protocol=http \
>             file://0001-blacklist-tv-out.patch \
> @@ -10,7 +10,7 @@ SRC_URI = "git://git.pingu.fi/xf86-video-omapfb.git;protocol=http \
>             file://0003-force-plain-mode.patch \
>            "
>  
> -SRCREV = "044617665d6737f4909aab96f91b06261dff05d2"
> +SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
>  S = "${WORKDIR}/git"
>  
>  EXTRA_OECONF_armv7a = " --enable-neon "

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN1Wy6MkyGM64RGpERAhX2AJ9ZD66JnKDR68UPzWHBA2NG/vnbzwCfdnLX
/eZn43YXujgP2SJNq97XPMM=
=FHLz
-----END PGP SIGNATURE-----



