Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV9IZ-0000ru-0y for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 20:54:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV9GR-0004UO-TD
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 20:52:23 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 20:52:23 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 20:52:23 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 20:52:11 +0100
Message-ID: <hil89a$835$1@ger.gmane.org>
References: <1263401193-12161-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1263401193-12161-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <1263401193-12161-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH 1/2] bug: use full X.org
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
X-List-Received-Date: Wed, 13 Jan 2010 19:54:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>


On 13-01-10 17:46, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  conf/machine/bug.conf |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
> index 3e0389a..d79cf15 100644
> --- a/conf/machine/bug.conf
> +++ b/conf/machine/bug.conf
> @@ -14,3 +14,11 @@ CPU_FEATURES += "vfp"
>  require conf/machine/include/tune-arm1136jf-s.inc
>  
>  KERNEL_IMAGETYPE = "uImage"
> +
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +XSERVER = "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-tslib \
> +           xf86-input-mouse \
> +           xf86-video-fbdev \
> +           xf86-input-keyboard"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTiRrMkyGM64RGpERAl8sAJ4wGzNROfUA4iOUIj0WkbaIdh2uOgCdEQl3
6obKyJJLCTx+PUf5gWJIAUc=
=hSWq
-----END PGP SIGNATURE-----



