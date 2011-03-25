Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Q3GCN-0007Dw-19
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 00:13:45 +0100
Received: by pxi1 with SMTP id 1so314980pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=/+X/kw6SnKlNBGkubeLp54efIalTNwev0vFJWiIFIDI=;
	b=CmZKwMHZysaezMaqstGJVxNIlScJlB5k5FdGZAi19uqN1CLKSW1POzpO4HFywqTND+
	IhPKEofgj1yElRXRq4C1WZQtL5ldv0u+sMqs26NvhLXbekDMZYfJGrrl3Ep7z9YVyqvZ
	d/xIH2jzCFaFU0GyzDEcuc7thA7d+fF9EnC3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=b/nr3UmFy5kqKvCM4U+AN4arMeq+VzR7FBVnDl7k0N0WzEfo5hbsAgR9TTpvEa5vio
	cE1zr/ffKCVKJeprvJ5N5x8Uls8KV9D86AVCCSx94BQfca5vafPkI65A7TyNlJS4H5X2
	qkp1BG344HByATwlNYgeDSWXjlwnSXzRTHLII=
MIME-Version: 1.0
Received: by 10.142.226.8 with SMTP id y8mr1022835wfg.361.1301094708092; Fri,
	25 Mar 2011 16:11:48 -0700 (PDT)
Received: by 10.142.136.15 with HTTP; Fri, 25 Mar 2011 16:11:47 -0700 (PDT)
In-Reply-To: <1300971868-31866-1-git-send-email-otavio@ossystems.com.br>
References: <20110322172251.GB22283@sakrah.homelinux.org>
	<1300971868-31866-1-git-send-email-otavio@ossystems.com.br>
Date: Sat, 26 Mar 2011 00:11:47 +0100
Message-ID: <AANLkTi=zX5XA-WorbCjNx5CN5yEgs=rysP+J6qkGnZ8j@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Fri, 25 Mar 2011 23:13:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2011 at 2:04 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> =A0* add GZIP_COMPRESSION_LEVEL
> =A0* add BZIP2_COMPRESSION_LEVEL
> =A0* use xz-native to generate lzma images
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =A0conf/bitbake.conf | =A0 22 ++++++++++++----------
> =A01 files changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 6946be5..783d781 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -150,6 +150,8 @@ QEMU_OPTIONS_armv7a =A0 =3D "-cpu cortex-a8"
> =A0# default compression levels
> =A0XZ_COMPRESSION_LEVEL ?=3D "-e -9"
> =A0LZMA_COMPRESSION_LEVEL ?=3D "-e -9"
> +GZIP_COMPRESSION_LEVEL ?=3D "-9"
> +BZIP2_COMPRESSION_LEVEL ?=3D "-9"
>
> =A0# default integrity check
> =A0XZ_INTEGRITY_CHECK ?=3D "crc32"
> @@ -384,14 +386,14 @@ IMAGE_CMD_jffs2 =3D "mkfs.jffs2 -x lzo --root=3D${I=
MAGE_ROOTFS} --faketime --output=3D
> =A0IMAGE_CMD_yaffs2 =3D "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
> =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
> =A0IMAGE_CMD_ext2 =3D "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROO=
TFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_ext2.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/t=
mp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME=
}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz"
> -IMAGE_CMD_ext2.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2=
fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2=
/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; bzip2 -f -9 ${DEPLOY_DIR_IMAG=
E}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAG=
E_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2"
> +IMAGE_CMD_ext2.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f ${GZIP_COMPRESSION_LEVEL=
} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMA=
GE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.r=
ootfs.ext2.gz"
> +IMAGE_CMD_ext2.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2=
fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2=
/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; bzip2 -f ${BZIP2_COMPRESSION_=
LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_D=
IR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE=
_NAME}.rootfs.ext2.bz2"
> =A0IMAGE_CMD_ext3 =3D "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROO=
TFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2=
fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
> -IMAGE_CMD_ext3.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/t=
mp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IM=
AGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.e=
xt3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
> -IMAGE_CMD_ext3.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2=
fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2=
/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE=
}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz=
2/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.r=
ootfs.ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2"
> +IMAGE_CMD_ext3.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/t=
mp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f ${GZIP_COMPRESSION_LEVEL} ${DEPLOY=
_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz=
/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3=
.gz"
> +IMAGE_CMD_ext3.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2=
fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2=
/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE=
}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f ${BZIP2_COMPRESSION_LEVEL} ${=
DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}=
/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ro=
otfs.ext3.bz2"
> =A0IMAGE_CMD_ext4 =3D "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROO=
TFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2=
fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_N=
AME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.r=
ootfs.ext4;chk=3D$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac;"
> -IMAGE_CMD_ext4.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir=
_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; se=
t +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=
=3D$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f -9 ${DEPLOY_=
DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/=
${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.=
gz"
> -IMAGE_CMD_ext4.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2=
fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2=
/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,=
dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4=
; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ex=
t4;chk=3D$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f -9 ${=
DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}=
/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ro=
otfs.ext4.bz2"
> +IMAGE_CMD_ext4.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir=
_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; se=
t +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=
=3D$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f ${GZIP_COMPR=
ESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DE=
PLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.ext4.gz"
> +IMAGE_CMD_ext4.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2=
fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2=
/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,=
dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4=
; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ex=
t4;chk=3D$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f ${BZI=
P2_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4=
; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR=
_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
> =A0IMAGE_CMD_ext4.xz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.xz; genext2f=
s -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.xz/$=
{IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,di=
r_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4; s=
et +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4;c=
hk=3D$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; xz -c ${XZ_COMPRES=
SION_LEVEL} --check=3D${XZ_INTEGRITY_CHECK} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IM=
AGE_NAME}.rootfs.ext4 > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.xz ; =
rm -f ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ; rmdir ${DEPLOY=
_DIR_IMAGE}/tmp.xz"
>
> =A0IMAGE_CMD_squashfs =3D "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}=
/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
> @@ -401,10 +403,10 @@ IMAGE_CMD_tar.gz =3D "cd ${IMAGE_ROOTFS} && tar -zc=
vf ${DEPLOY_DIR_IMAGE}/${IMAGE_
> =A0IMAGE_CMD_tar.bz2 =3D "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IM=
AGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
> =A0IMAGE_CMD_tar.xz =3D "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR=
_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
> =A0IMAGE_CMD_cpio =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >$=
{DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_cpio.gz =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find=
 . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs=
.cpio.gz) ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_cpio.gz =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find=
 . | cpio -o -H newc | gzip -c ${GZIP_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAG=
E}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}"
> =A0IMAGE_CMD_cpio.xz =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (fi=
nd . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=3D${XZ_INTEG=
RITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMA=
GECMD}"
> -IMAGE_CMD_cpio.gz.u-boot =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &=
& (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}=
.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ra=
mdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.=
cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
> -IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (fi=
nd . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL} >${DEPLOY_DIR_IM=
AGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_cpio.gz.u-boot =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &=
& (find . | cpio -o -H newc | gzip -c ${GZIP_COMPRESSION_LEVEL} >${DEPLOY_D=
IR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBO=
OT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE=
}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpi=
o.gz.u-boot"
> +IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (fi=
nd . | cpio -o -H newc | xz --format=3Dlzma -c ${LZMA_COMPRESSION_LEVEL} >$=
{DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
> =A0IMAGE_CMD_ubi =3D "echo \[ubifs\] > ubinize.cfg ; echo mode=3Dubi >> u=
binize.cfg ; echo image=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ub=
inize.cfg ; echo vol_id=3D0 >> ubinize.cfg ; echo vol_type=3Ddynamic >> ubi=
nize.cfg ; echo vol_name=3D${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=
=3Dautoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_=
IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_I=
MAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
> =A0IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMA=
GE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
>
> @@ -435,7 +437,7 @@ IMAGE_DEPENDS_ext4.gz =3D "genext2fs-native e2fsprogs=
-native"
> =A0IMAGE_DEPENDS_ext4.bz2 =3D "genext2fs-native e2fsprogs-native"
> =A0IMAGE_DEPENDS_ext4.xz =3D "genext2fs-native e2fsprogs-native xz-native=
"
> =A0IMAGE_DEPENDS_cpio.gz.u-boot =3D "u-boot-mkimage-native"
> -IMAGE_DEPENDS_cpio.lzma =3D "lzma-native"
> +IMAGE_DEPENDS_cpio.lzma =3D "xz-native"
> =A0IMAGE_DEPENDS_cpio.xz =3D "xz-native"
> =A0IMAGE_DEPENDS_squashfs =3D "squashfs-tools-native"
> =A0IMAGE_DEPENDS_squashfs-lzma =3D "squashfs-tools-native"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Acked-by: Andrea Adami <andrea.adami@gmail.com>


