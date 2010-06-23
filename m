Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORKoY-0007Fv-Lb for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 09:56:07 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORKk6-0002Ig-C3 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 09:51:30 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 09:51:30 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 09:51:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Jun 2010 09:51:21 +0200
Message-ID: <hvsedp$kjb$1@dough.gmane.org>
References: <111b01cb123eb0466e0MAN_POSIXLY_CORRECT=1Distant-earth.com>
	<1277273473-17376-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1277273473-17376-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] udev/mount.sh: use lazy umount
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
X-List-Received-Date: Wed, 23 Jun 2010 07:56:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-06-10 08:11, Steffen Sledz wrote:
> * umount will fail if there are processes accessing files at the
>   device, use lazy umount to avoid this problem
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Looks good to me:

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/udev/files/mount.sh        |    2 +-
>  recipes/udev/files/slugos/mount.sh |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/udev/files/mount.sh b/recipes/udev/files/mount.sh
> index be8b3df..440dcee 100644
> --- a/recipes/udev/files/mount.sh
> +++ b/recipes/udev/files/mount.sh
> @@ -64,7 +64,7 @@ fi
>  if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
>  	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
>  	do
> -		$UMOUNT $mnt
> +		$UMOUNT -l $mnt
>  	done
>  	
>  	# Remove empty directories from auto-mounter
> diff --git a/recipes/udev/files/slugos/mount.sh b/recipes/udev/files/slugos/mount.sh
> index 0990a7e..b5298e9 100644
> --- a/recipes/udev/files/slugos/mount.sh
> +++ b/recipes/udev/files/slugos/mount.sh
> @@ -75,7 +75,7 @@ fi
>  if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
>  	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
>  	do
> -		$UMOUNT $mnt
> +		$UMOUNT -l $mnt
>  	done
>  	
>  	# Remove empty directories from auto-mounter

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIbz5MkyGM64RGpERAt02AJ40tRHUFB92CtUl1Aygxf2Vl6IFTwCfYgUQ
VrKYoZrz8xUJxWkPt/Fq+QM=
=Gvcc
-----END PGP SIGNATURE-----



