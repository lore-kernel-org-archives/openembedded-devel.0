Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id CA0AE7392B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 17:52:37 +0000 (UTC)
Received: by wggx12 with SMTP id x12so10951101wgg.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/l5QSZ6cD2gwRTC76RDwNF9glb/qGenm3fwCWsBfotQ=;
	b=jEem+LT7BtNBG3Wakk1S+Kf7lR+sJQemSkJlpTJeUW2RjnLIIxM0qwz5JerTb/df10
	Vi06LisKhK9FTLYw3u9GC+662vT/5HMytH7D/9xI0Du4pPLa0IDLJdXFYKM2MiwJVX5B
	PIVIdKM+qOsD9jebA2vHQVSPNCn33zEl+PGKl6KlZVgbZk8oiIYl7C2Ld5Hn26e/ZGo/
	qH0L17DLoS1k0zjz94ULU552iFBbgo74nYzhGnGETzWPq2lilxHa9Qt5c4wpTzQR0FzE
	CxprV8w5uswzwbsLgMPd7nLr7NnJKaCPmcl9u6w+Vi44BVO+8WzVC/C0+eZvXi2Eaef+
	ZwGA==
X-Received: by 10.180.24.65 with SMTP id s1mr80521195wif.30.1426096357556;
	Wed, 11 Mar 2015 10:52:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fm10sm7099187wib.7.2015.03.11.10.52.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 10:52:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Mar 2015 18:53:12 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150311175312.GB6713@jama>
References: <1426089592-16955-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1426089592-16955-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH V2] var/volatile: Mount it if doing ro-rfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Mar 2015 17:52:41 -0000
X-Groupsio-MsgNum: 54746
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline

--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2015 at 03:59:52PM +0000, Khem Raj wrote:
> - Do not mount /var/volatile to be tmpfs always only when generating
>   readonly rootfs
> - Generate var-volatile.mount unit when using system in readonly-rootfs
>   to mount /var/volatile as tmpfs
> - for sysvinit, mount /var/volatile to be tmpfs if its not already
>   mounted so
> - Use RequiresMountsFor instead of After=3D, so systemd figures out the
>   needed dependencies for making /var/volatile accessible for journald
>   and not us.

Wrong ML :)

>=20
> Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/image.bbclass                                             |=
 1 +
>  meta/recipes-core/base-files/base-files/fstab                          |=
 1 -
>  meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh |=
 2 +-
>  meta/recipes-core/systemd/systemd/journald-volatile.conf               |=
 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 89eb5f3..818af86 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -228,6 +228,7 @@ read_only_rootfs_hook () {
>  	fi
> =20
>  	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", =
d)}; then
> +	    sed -e 's#/tmp#/var/volatile#g' ${IMAGE_ROOTFS}/lib/systemd/system/=
tmp.mount > ${IMAGE_ROOTFS}/lib/systemd/system/var-volatile.mount
>  	    # Update user database files so that services don't fail for a read=
-only systemd system
>  	    for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${I=
MAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>  		[ -e $conffile ] || continue
> diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes=
-core/base-files/base-files/fstab
> index 739b844..56b14d7 100644
> --- a/meta/recipes-core/base-files/base-files/fstab
> +++ b/meta/recipes-core/base-files/base-files/fstab
> @@ -5,7 +5,6 @@ proc                 /proc                proc       defa=
ults              0  0
>  devpts               /dev/pts             devpts     mode=3D0620,gid=3D5=
       0  0
>  usbdevfs             /proc/bus/usb        usbdevfs   noauto             =
   0  0
>  tmpfs                /run                 tmpfs      mode=3D0755,nodev,n=
osuid,strictatime 0  0
> -tmpfs                /var/volatile        tmpfs      defaults           =
   0  0
> =20
>  # uncomment this if your device has a SD/MMC/Transflash slot
>  #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noau=
to  0  0
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-root=
fs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs=
-hook.sh
> index 1a0328d..3ff39f4 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook=
=2Esh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook=
=2Esh
> @@ -29,7 +29,7 @@ is_on_read_only_partition () {
> =20
>  if [ "$1" =3D "start" ] ; then
>  	if [ `is_on_read_only_partition /var/lib` =3D "yes" ]; then
> -		grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
> +		grep -q "tmpfs /var/volatile" /proc/mounts || mount -t tmpfs -o strict=
atime tmpfs /var/volatile
>  		mkdir -p /var/volatile/lib
>  		cp -a /var/lib/* /var/volatile/lib
>  		mount --bind /var/volatile/lib /var/lib
> diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf b/m=
eta/recipes-core/systemd/systemd/journald-volatile.conf
> index b11e160..9356a4e 100644
> --- a/meta/recipes-core/systemd/systemd/journald-volatile.conf
> +++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
> @@ -3,4 +3,4 @@
>  # /var/log -> /var/volatile/log. And if the journal starts before the mo=
unt
>  # happens, the journal will appear empty until restarted.
>  [Unit]
> -After=3Dvar-volatile.mount
> +RequiresMountsFor=3D/var/volatile
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUAgQgACgkQN1Ujt2V2gByJBwCfRjz15OvrB1BZFk1bZ+wa3FFX
3a4AoLMXMwpwdXTfD3yCKsz9RrsLGads
=b3JH
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
