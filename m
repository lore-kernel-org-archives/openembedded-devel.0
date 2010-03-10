Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NpNbN-00019g-Mt
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 16:13:39 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NpNYU-0000a0-Js from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 07:10:38 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Mar 2010 07:10:38 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 10 Mar 2010 15:09:55 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 Mar 2010 08:09:52 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268213424-16360-1-git-send-email-sledz@dresearch.de>
References: <1268156863.16526.133.camel@trini-m4400>
	<1268213424-16360-1-git-send-email-sledz@dresearch.de>
Organization: Mentor Graphics Corporation
Date: Wed, 10 Mar 2010 08:09:52 -0700
Message-ID: <1268233792.16526.168.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 Mar 2010 15:10:38.0004 (UTC)
	FILETIME=[D74EC740:01CAC063]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: introducing new image fstype .cpio.gz.u-boot
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
X-List-Received-Date: Wed, 10 Mar 2010 15:13:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-10 at 10:30 +0100, Steffen Sledz wrote:
> * initrd images need to be prepared with mkimage to be usable from u-boot
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  classes/image.bbclass |    1 +
>  conf/bitbake.conf     |    2 ++
>  2 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index 9dce609..8e202f0 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -1,4 +1,5 @@
>  inherit rootfs_${IMAGE_PKGTYPE}
> +inherit kernel-arch
> =20
>  LICENSE =3D "MIT"
>  PACKAGES =3D ""
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 3a68959..c020efe 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -374,6 +374,7 @@ IMAGE_CMD_tar.gz =3D "cd ${IMAGE_ROOTFS} && tar -zcvf=
 ${DEPLOY_DIR_IMAGE}/${IMAGE_
>  IMAGE_CMD_tar.bz2 =3D "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAG=
E}/${IMAGE_NAME}.rootfs.tar.bz2 ."
>  IMAGE_CMD_cpio =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${D=
EPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}"
>  IMAGE_CMD_cpio.gz =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc |=
 gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAG=
ECMD}"
> +IMAGE_CMD_cpio.gz.u-boot =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H=
 newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXT=
RA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMA=
GE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_I=
MAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
>  IMAGE_CMD_cpio.lzma =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc=
 | lzma -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_=
IMAGECMD}"
>  IMAGE_CMD_ubi =3D "echo \[ubifs\] > ubinize.cfg ; echo mode=3Dubi >> ubi=
nize.cfg ; echo image=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> u=
binize.cfg ; echo vol_id=3D0 >> ubinize.cfg ; echo vol_type=3Ddynamic >> ub=
inize.cfg ; echo vol_name=3D${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=
=3Dautoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_=
IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DI=
R_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
>  IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE=
}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
> @@ -397,6 +398,7 @@ IMAGE_DEPENDS_ext2 =3D "genext2fs-native"
>  IMAGE_DEPENDS_ext2.gz =3D "genext2fs-native"
>  IMAGE_DEPENDS_ext3 =3D "genext2fs-native e2fsprogs-native"
>  IMAGE_DEPENDS_ext3.gz =3D "genext2fs-native e2fsprogs-native"
> +IMAGE_DEPENDS_cpio.gz.u-boot =3D "u-boot-mkimage-native"
>  IMAGE_DEPENDS_cpio.lzma =3D "lzma-native"
>  IMAGE_DEPENDS_squashfs =3D "squashfs-tools-native"
>  IMAGE_DEPENDS_squashfs-lzma =3D "squashfs-tools-native"


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


