Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PoEQL-0003en-UT for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 13:18:02 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PoEPJ-0008TG-AV for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 13:16:57 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 13:16:57 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 13:16:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 12 Feb 2011 13:16:44 +0100
Message-ID: <ij5tnc$9u6$1@dough.gmane.org>
References: <1297509134-31435-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1297509134-31435-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] util-linux-ng: use u-a for /sbin/blockdev
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
X-List-Received-Date: Sat, 12 Feb 2011 12:18:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-02-11 12:12, Martin Jansa wrote:
> * resolves conflict with latest busybox
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/util-linux-ng/util-linux-ng.inc |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
> index 579c8dc..51f25b2 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -6,7 +6,7 @@ DEPENDS_virtclass-native = "zlib-native lzo-native gettext-native"
>  
>  inherit autotools gettext
>  
> -INC_PR = "r35"
> +INC_PR = "r36"
>  
>  # allows for a release candidate
>  RC ?= ""
> @@ -126,8 +126,8 @@ do_install () {
>  		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
>  	mkdir -p ${D}${base_bindir}
>  
> -        sbinprogs="agetty blockdev ctrlaltdel cfdisk"
> -        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid vigr vipw uuidd"
> +        sbinprogs="agetty ctrlaltdel cfdisk"
> +        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid blockdev vigr vipw uuidd"
>          usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt reset cal script flock"
>          usrsbinprogs_a="readprofile"
>          binprogs_a="dmesg kill more umount mount login"
> @@ -220,6 +220,7 @@ pkg_postinst_${PN} () {
>  	update-alternatives --install ${base_bindir}/login login login.${PN} 100
>  	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 100
>  	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 100
> +	update-alternatives --install ${base_sbindir}/blockdev blockdev blockdev.${PN} 100
>  	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
>  	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
>  	update-alternatives --install ${base_sbindir}/uuidd uuidd uuidd.${PN} 100
> @@ -236,7 +237,7 @@ pkg_prerm_${PN} () {
>  	test -x ${base_sbindir}/pivot_root.${PN} && \
>  	update-alternatives --remove pivot_root pivot_root.${PN}
>  
> -	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login cal script flock uuidd; do
> +	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr blockdev chfn newgrp chsh login cal script flock uuidd; do
>  		update-alternatives --remove $i $i.${PN}
>  	done
>  }

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNVnosMkyGM64RGpERAuIHAJ4+/0uyMjYywzuLbklUmV84CR/sdgCdE2qa
pm+QYnyjZ4goWqbtexZTZwI=
=QNHh
-----END PGP SIGNATURE-----



