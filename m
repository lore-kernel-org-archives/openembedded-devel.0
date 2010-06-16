Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpHX-00065r-6U for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:51:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpD9-00035o-BQ for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:47:07 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:47:07 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:47:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jun 2010 11:46:55 +0200
Message-ID: <hva6if$vtv$1@dough.gmane.org>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
	<1276625727-22991-2-git-send-email-stefan@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1276625727-22991-2-git-send-email-stefan@datenfreihafen.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 1/4] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Wed, 16 Jun 2010 09:51:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-06-10 20:15, Stefan Schmidt wrote:
> From: Ken Gilmer <ken@buglabs.net>
> 
> 
> Signed-off-by: Ken Gilmer <ken@buglabs.net>
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

Acked-by: Koen Kooi <koen@openembedded.org>

> 
> ---
>  .../xorg-xserver/xserver-xorg-conf/bug20/xorg.conf |    8 ++++++++
>  recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
>  2 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> index 0b976fe..6301d06 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> @@ -26,4 +26,12 @@ EndSection
>  Section "ServerLayout"                                 
>          Identifier      "Builtin Default Layout"                                     
>          Screen  "Builtin Default fbdev Screen 0"        
> +		InputDevice "bmi-lcd-ts" "CorePointer"
>  EndSection                                              
> +
> +Section "InputDevice"
> +		Identifier "bmi-lcd-ts"
> +		Driver "tslib"
> +		Option "SwapAxes" "1"
> +		Option "Device" "/dev/input/touchscreen0"
> +EndSection
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> index 0d286b7..43ca6fa 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> +++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Machine specific xorg.conf files"
> -PR = "r24"
> +PR = "r25"
>  
>  SRC_URI = "file://xorg.conf"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGJ2PMkyGM64RGpERAjKFAJ9NYi/+KH6auz08uIcPNG7EjRuDigCeMtLA
YWQr4pNuwjNXvJmExh6CRdg=
=389Z
-----END PGP SIGNATURE-----



