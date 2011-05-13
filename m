Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QKwsW-0004Av-Se
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:14:20 +0200
Received: from p4fc7654c.dip.t-dialin.net ([79.199.101.76]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QKwpm-0003sK-Kw by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 13 May 2011 20:11:33 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>)
	id 1QKwpk-0002CY-RV; Fri, 13 May 2011 20:11:28 +0200
Date: Fri, 13 May 2011 20:11:28 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110513181128.GG29302@excalibur.local>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-6-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290588-7057-6-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
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
X-List-Received-Date: Fri, 13 May 2011 18:14:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-05-13 at 14:43, Denis 'GNUtoo' Carikli wrote:
> Without that fix Xorg go in segmentation fault when you insert the
>   bugview module(the module that has an hdmi and vga output)
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

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
> -- 
> 1.7.0.4
> 


