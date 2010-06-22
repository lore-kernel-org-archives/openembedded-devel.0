Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR1Jw-0002qW-Fl for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 13:10:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR1FX-0008Oz-8U for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 13:02:39 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 13:02:39 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 13:02:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 22 Jun 2010 13:02:30 +0200
Message-ID: <hvq586$1jc$1@dough.gmane.org>
References: <1277201329-1339-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1277201329-1339-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev/mount.sh: try to kill active processes before umount
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
X-List-Received-Date: Tue, 22 Jun 2010 11:10:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Wouldn't a umount -l be a lot better in this case?

On 22-06-10 12:08, Steffen Sledz wrote:
> * umount will fail if there are processes accessing files at the
>   device. Therefor try to kill these processes using fuser if
>   available.
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/udev/files/mount.sh        |   21 ++++++++++++++++++++-
>  recipes/udev/files/slugos/mount.sh |   21 ++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/udev/files/mount.sh b/recipes/udev/files/mount.sh
> index be8b3df..79c6891 100644
> --- a/recipes/udev/files/mount.sh
> +++ b/recipes/udev/files/mount.sh
> @@ -8,6 +8,7 @@
>  MOUNT="/bin/mount"
>  PMOUNT="/usr/bin/pmount"
>  UMOUNT="/bin/umount"
> +FUSER="/usr/bin/fuser"
>  name="`basename "$DEVNAME"`"
>  
>  for line in `cat /etc/udev/mount.blacklist | grep -v ^#`
> @@ -64,7 +65,25 @@ fi
>  if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
>  	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
>  	do
> -		$UMOUNT $mnt
> +		if [ -x "$FUSER" ]; then
> +			$FUSER -k -KILL -m $mnt
> +			for try in `seq 10`
> +			do
> +				$FUSER -m $mnt || break
> +				sleep 1
> +				logger "mount.sh/automount" "$try secs waited for processes active at $mnt to finish on SIGKILL"
> +			done
> +
> +			if $FUSER -m $mnt 
> +			then
> +				logger "mount.sh/automount" "Could not kill all processes using files at $mnt, try forced umount"
> +				$UMOUNT -f $mnt
> +			else
> +				$UMOUNT $mnt
> +			fi
> +		else
> +			$UMOUNT $mnt
> +		fi
>  	done
>  	
>  	# Remove empty directories from auto-mounter
> diff --git a/recipes/udev/files/slugos/mount.sh b/recipes/udev/files/slugos/mount.sh
> index 0990a7e..f67c3ff 100644
> --- a/recipes/udev/files/slugos/mount.sh
> +++ b/recipes/udev/files/slugos/mount.sh
> @@ -8,6 +8,7 @@
>  MOUNT="/bin/mount"
>  PMOUNT="/usr/bin/pmount"
>  UMOUNT="/bin/umount"
> +FUSER="/usr/bin/fuser"
>  name="`basename "$DEVNAME"`"
>  
>  if ( blkid "$DEVNAME" | grep -q 'TYPE="mdraid"' )
> @@ -75,7 +76,25 @@ fi
>  if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
>  	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
>  	do
> -		$UMOUNT $mnt
> +		if [ -x "$FUSER" ]; then
> +			$FUSER -k -KILL -m $mnt
> +			for try in `seq 10`
> +			do
> +				$FUSER -m $mnt || break
> +				sleep 1
> +				logger "mount.sh/automount" "$try secs waited for processes active at $mnt to finish on SIGKILL"
> +			done
> +
> +			if $FUSER -m $mnt 
> +			then
> +				logger "mount.sh/automount" "Could not kill all processes using files at $mnt, try forced umount"
> +				$UMOUNT -f $mnt
> +			else
> +				$UMOUNT $mnt
> +			fi
> +		else
> +			$UMOUNT $mnt
> +		fi
>  	done
>  	
>  	# Remove empty directories from auto-mounter

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIJhGMkyGM64RGpERAo+WAJsEfFfYOKZzeSChA8FBf6SmLSlEbgCdHP2z
d2kNPcFp4RiRHac8Zqh8Hb4=
=HT9O
-----END PGP SIGNATURE-----



