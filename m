Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7x3Y-0006wS-LY for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 23:15:46 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7x2v-0005ht-An for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 23:15:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 23:15:05 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 23:15:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 18 Oct 2010 23:11:58 +0200
Message-ID: <i9id6u$jcd$2@dough.gmane.org>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
	<1287427884-1517-15-git-send-email-morphis@gravedo.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1287427884-1517-15-git-send-email-morphis@gravedo.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 14/15] xserver-xorg-conf: switch from plain tslib access to evdev for touchscreen on palmpre machine
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
X-List-Received-Date: Mon, 18 Oct 2010 21:15:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-10-10 20:51, Simon Busch wrote:
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  .../xserver-xorg-conf/palmpre/xorg.conf            |    4 ++--
>  recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
> index 87001f0..08e99e8 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
> @@ -31,8 +31,8 @@ EndSection
>  
>  Section "InputDevice"
>      Identifier  "Touchscreen"
> -    Driver      "tslib"
> -    Option      "Device"                "/dev/touchscreen"
> +    Driver      "evdev"
> +    Option      "Device"                "/dev/input/event6"

You're better of using /dev/input/touchscreen0 for that since event
numbers are pretty much random.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMvLgeMkyGM64RGpERApKwAJwLqF1X+3CBz/IlaOBMrRoQl+2/XQCaAsxA
2u57/t0OjO6EJOjhTaLWYbM=
=4Gwt
-----END PGP SIGNATURE-----



