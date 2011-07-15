Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QhnaU-00024a-5q for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 20:58:10 +0200
Received: from f053039174.adsl.alicedsl.de ([78.53.39.174]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QhnXG-0003cT-LK; Fri, 15 Jul 2011 18:54:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org, Raymond Danks
	<ray.danks@se-eng.com>
In-Reply-To: <4E207114.2000602@se-eng.com>
References: <4E207114.2000602@se-eng.com>
Date: Fri, 15 Jul 2011 20:54:09 +0200
Message-ID: <1310756049.3995.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: coreboot@coreboot.org
Subject: Re: [PATCH 2/2] Add mkelfimage and support for generating kernel+initrd ELF payloads to OpenEmbedded
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
X-List-Received-Date: Fri, 15 Jul 2011 18:58:10 -0000
X-Groupsio-MsgNum: 33181
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vSRg7bMqBuhoF4iOi/ra"

--=-vSRg7bMqBuhoF4iOi/ra
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Raymond,


thank you for your patch!

Am Freitag, den 15.07.2011, 10:55 -0600 schrieb Raymond Danks:
> On x86, and ELF image file may be stored as a coreboot payload.  This=20
> image file may be a kernel or a kernel+initrd.
>=20
> Documentation on this has been started on the coreboot wiki:
> http://www.coreboot.org/Mkelfimage
>=20
> We have seen success using the mkelfimage utility to construct a=20
> kernel+initrd image using the micro-image OpenEmbedded image as an initrd=
.
> http://www.se-eng.com/wiki/index.php/Open_Embedded_Setup
>=20
> The second patch contains the necessary commands for adding the image=20
> type to bitbake.

Please update the summary to just describe the change of this patch.
Maybe also add an example command line on how to use the new
functionality.

> ---
>   conf/bitbake.conf |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 66dfaba..1ab72e1 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -375,6 +375,7 @@ IMAGE_BASENAME =3D "${PN}"
>   IMAGE_NAME =3D "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
>   IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"
>   IMAGE_EXTRA_SPACE =3D 10240
> +IMAGE_KERNELPARAMS =3D "ramdisk_size=3D32768 root=3D/dev/ram0 rw console=
=3D"
>=20
>   UBI_VOLNAME ?=3D "${MACHINE}-rootfs"
>=20
> @@ -406,6 +407,7 @@ IMAGE_CMD_cpio.gz.u-boot =3D "type cpio >/dev/null; c=
d=20
> ${IMAGE_ROOTFS} && (find .
>   IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&=
=20
> (find . | cpio -o -H newc | xz --format=3Dlzma -c ${XZ_COMPRESSION_LEVEL}=
=20
> --check=3D${XZ_INTEGRITY_CHECK}=20
>  >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
>   IMAGE_CMD_ubi =3D "echo \[ubifs\] > ubinize.cfg ; echo mode=3Dubi >>=
=20
> ubinize.cfg ; echo image=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >>=
=20
> ubinize.cfg ; echo vol_id=3D0 >> ubinize.cfg ; echo vol_type=3Ddynamic >>=
=20
> ubinize.cfg ; echo vol_name=3D${UBI_VOLNAME} >> ubinize.cfg ; echo=20
> vol_flags=3Dautoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o=
=20
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize=
=20
> -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.c=
fg"
>   IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o=20
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
> +IMAGE_CMD_elf =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . |=
=20
> cpio -o -H newc | gzip -c -9=20
>  >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ; rm -f=20
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf ;  mkelfImage=20
> --append=3D'${IMAGE_KERNELPARAMS}'=20
> --kernel=3D${STAGING_DIR}/${MACHINE}${HOST_VENDOR}-${HOST_OS}/kernel/bzIm=
age=20
> --initrd=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz=20
> --output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf ${EXTRA_IMAGECMD}=
"
>=20
>   EXTRA_IMAGECMD =3D ""
>   EXTRA_IMAGECMD_jffs2 =3D ""
> @@ -440,6 +442,7 @@ IMAGE_DEPENDS_squashfs =3D "squashfs-tools-native"
>   IMAGE_DEPENDS_squashfs-lzma =3D "squashfs-tools-native"
>   IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
>   IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
> +IMAGE_DEPENDS_elf =3D "virtual/kernel mkelfimage-native"
>=20
>   EXTRA_IMAGEDEPENDS =3D ""
>=20

As in the first patch, your Signed-off-by line is missing and your
mailer mangled the patch. Please resend as [PATCH 2/2 v2]. (Please
always describe changed between patch iterations under the `---`.


Thanks,

Paul

--=-vSRg7bMqBuhoF4iOi/ra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4gjNEACgkQPX1aK2wOHVjHIQCfQPjpJXA9Raz0O7hBJ05joDw/
91QAn2Xef0ysKPGeWmotSd0GWtyof1ge
=j/Iv
-----END PGP SIGNATURE-----

--=-vSRg7bMqBuhoF4iOi/ra--
