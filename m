Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpU1-0006vI-Hx for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 12:04:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpPg-0008F6-Lq for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 12:00:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 12:00:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 12:00:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jun 2010 11:47:13 +0200
Message-ID: <hva6j1$vtv$2@dough.gmane.org>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
	<1276625727-22991-3-git-send-email-stefan@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1276625727-22991-3-git-send-email-stefan@datenfreihafen.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 2/4] bug20.conf: Sync with Bug Labs repo
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
X-List-Received-Date: Wed, 16 Jun 2010 10:04:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-06-10 20:15, Stefan Schmidt wrote:
> From: John Connolly <john@buglabs.net>
> 
> This brings the bug20 machine file in sync with the Bug Labs internal version.
> The difference was only ubi as FSTYPE, tslib usage and some jffs2 tweaking.
> 
> Signed-off-by: John Connolly <john@buglabs.net>
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

Acked-by: Koen Kooi <koen@openembedded.org>

> 
> ---
>  conf/machine/bug20.conf |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
> index dbc1faf..2979c7e 100644
> --- a/conf/machine/bug20.conf
> +++ b/conf/machine/bug20.conf
> @@ -8,6 +8,7 @@ XSERVER = "xserver-xorg \
>             xserver-xorg-extension-dri \
>             xserver-xorg-extension-glx \
>             xf86-input-evdev \
> +           xf86-input-tslib \
>             xf86-input-mouse \
>             xf86-video-omapfb \
>             xf86-input-keyboard"
> @@ -20,7 +21,8 @@ require conf/machine/include/omap3.inc
>  # this kernel is not provided in OE yet
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap-hah"
>  
> -IMAGE_FSTYPES += "tar.bz2"
> +IMAGE_FSTYPES += "tar.bz2 ubi"
> +EXTRA_IMAGECMD_jffs2 = "-lnp "
>  
>  SERIAL_CONSOLE = "115200 ttyS2"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGJ2hMkyGM64RGpERAgpAAJ9iJIuehWNVhsbivtng/VKOE5C8AACdG7u/
snobNGVpHLXLzyigS65tEEU=
=uZpZ
-----END PGP SIGNATURE-----



