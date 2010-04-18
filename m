Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1O3Qam-0006VN-NH
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Apr 2010 11:15:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 20ADB2C7F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:10:25 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 660jlIwMEmJ9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:10:21 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 4940A2C7DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:10:20 +0000 (UTC)
Message-ID: <4BCACCDA.5010001@gmail.com>
Date: Sun, 18 Apr 2010 11:11:54 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
	<alpine.DEB.1.10.1004161851540.13187@vitus.devnet.local>
In-Reply-To: <alpine.DEB.1.10.1004161851540.13187@vitus.devnet.local>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/5] base-files: tb5200l specific changes
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
X-List-Received-Date: Sun, 18 Apr 2010 09:15:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Vitus Jensen ha scritto, Il 16/04/2010 18:52:
> * create /opt directory
> * fstab which mounts / and /opt from jffs2 filesystem on mtd
> * link /tmp to /var/tmp
> * issue and issue.net
>=20
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
>  recipes/base-files/base-files/tb5200l/fstab     |   10 ++++++++++
>  recipes/base-files/base-files/tb5200l/issue     |    2 ++
>  recipes/base-files/base-files/tb5200l/issue.net |    3 +++
>  recipes/base-files/base-files_3.0.14.bb         |    8 +++++++-
>  4 files changed, 22 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/base-files/base-files/tb5200l/fstab
>  create mode 100644 recipes/base-files/base-files/tb5200l/issue
>  create mode 100644 recipes/base-files/base-files/tb5200l/issue.net
>=20
> diff --git a/recipes/base-files/base-files/tb5200l/fstab b/recipes/base=
-files/base-files/tb5200l/fstab
> new file mode 100644
> index 0000000..38de296
> --- /dev/null
> +++ b/recipes/base-files/base-files/tb5200l/fstab
> @@ -0,0 +1,10 @@
> +# tb5200l filesystem, mount / read-only, mount /opt read-write
> +
> +rootfs		/		jffs2		defaults		1  1
> +/dev/mtdblock4 	/opt 		jffs2		defaults		0  0
> +proc 		/proc 		proc		defaults		0  0
> +devpts 		/dev/pts 	devpts		mode=3D0620,gid=3D5		0  0
> +usbfs 		/proc/bus/usb 	usbfs		defaults		0  0
> +tmpfs 		/var/volatile 	tmpfs		defaults		0  0
> +tmpfs 		/dev/shm 	tmpfs		mode=3D0777		0  0
> +tmpfs 		/media/ram 	tmpfs		defaults		0  0
> diff --git a/recipes/base-files/base-files/tb5200l/issue b/recipes/base=
-files/base-files/tb5200l/issue
> new file mode 100644
> index 0000000..5f4ee1f
> --- /dev/null
> +++ b/recipes/base-files/base-files/tb5200l/issue
> @@ -0,0 +1,2 @@
> +Cameron Linux \n \l
> +
> diff --git a/recipes/base-files/base-files/tb5200l/issue.net b/recipes/=
base-files/base-files/tb5200l/issue.net
> new file mode 100644
> index 0000000..b5cefd4
> --- /dev/null
> +++ b/recipes/base-files/base-files/tb5200l/issue.net
> @@ -0,0 +1,3 @@
> +Cameron Linux %h
> +
> +
> diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-fil=
es/base-files_3.0.14.bb
> index 483aef7..e341adc 100644
> --- a/recipes/base-files/base-files_3.0.14.bb
> +++ b/recipes/base-files/base-files_3.0.14.bb
> @@ -42,7 +42,7 @@ dirs755 =3D "/bin /boot /dev ${sysconfdir} ${sysconfd=
ir}/default \
>  	   ${localstatedir}/volatile/lock/subsys \
>  	   ${localstatedir}/volatile/log \
>  	   ${localstatedir}/volatile/run \
> -	   /mnt /media /media/card /media/cf /media/net /media/ram \
> +	   /opt /mnt /media /media/card /media/cf /media/net /media/ram \
>  	   /media/union /media/realroot /media/hdd \
>  	   /media/mmc1"
>=20
> @@ -157,6 +157,12 @@ do_install_append_netbook-pro () {
>  	mkdir -p ${D}/initrd
>  }
>=20
> +do_install_append_tb5200l() {
> +	rmdir ${D}/tmp
> +	ln -s var/tmp ${D}/tmp
> +}
> +
> +
>  PACKAGES =3D "${PN}-dbg ${PN}-doc ${PN}"
>  FILES_${PN} =3D "/*"
>  FILES_${PN}-doc =3D "${docdir} ${datadir}/common-licenses"


Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



