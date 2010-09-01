Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OqrqV-0002Ng-6V for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 20:15:39 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oqrpx-0008RR-1S for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 20:15:05 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 20:15:05 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 20:15:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Sep 2010 20:08:03 +0200
Message-ID: <i5m4q4$l1b$2@dough.gmane.org>
References: <4C7DF016.1020707@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <4C7DF016.1020707@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gst-plugins-bad_0.10.19.bb: add libmodplug to DEPENDS.
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
X-List-Received-Date: Wed, 01 Sep 2010 18:15:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-09-10 08:17, Graham Gower wrote:
> Several images want gst-plugin-modplug (e.g. illume-image and the
> fso images). They fail to find it without this.

Applied, thanks for the patch!

> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
>  recipes/gstreamer/gst-plugins-bad_0.10.19.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.19.bb b/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
> index 0f0ff21..2351431 100644
> --- a/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
> +++ b/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
> @@ -3,9 +3,9 @@ require gst-plugins.inc
>  SRC_URI[archive.md5sum] = "368f72e2a1c7a6e8fe60394e4315259b"
>  SRC_URI[archive.sha256sum] = "7b6c49f22caad3b573aee481381355b38ac9f2077f291d9f33a9a808a2568888"
>  
> -DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb"
> +DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb libmodplug"
>  
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>  
>  # We don't have vdpau headers in OE and it creates crosscompile badness
>  EXTRA_OECONF_append = " --disable-vdpau --enable-sdl"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMfpaDMkyGM64RGpERAmFTAJ0XVvxQv93/tW2bdTXr2G4H/ETYpACfaSJt
uAnNkktToDEbAHk2f+3MGPs=
=ut0J
-----END PGP SIGNATURE-----



