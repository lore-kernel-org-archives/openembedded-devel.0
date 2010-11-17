Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIjgQ-0004XP-8l
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 16:12:27 +0100
Received: by gwaa11 with SMTP id a11so1156560gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5R1lLoV1jVFrDlTMVOQgIIQ4kGMI5W35xt1cQ70mYhs=;
	b=bjHyNwtF+9EDoktdeo9CVdyU4txlorkP/uDIr66DViUVltEHaBMyDmpfeczctO+z42
	rVgP2Qm56/PX+OB5zNaVBBOLGhbiDC8UXk/Jm1NCra7+VaXwrQ9OmCjvk16bPBmdXkGI
	ggYJOCQpNz9dXthuZ2dfUzBn3wD7z3EDBAjz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pnCdb5wwDxr4ENRbUCba4jjAlhdPZYJfSaq7ooicPj3vEa+Q5edvO02TR9GTff6Ktf
	vWZtUWzJpvZZuGeYbttxnkkp6UDnpbXD9FOdfWiHDfOfW4GqORI21gDYgat1SGk550Hf
	+7hFqMiYaNLIUq7OCabCVIuh/DcOcdeMLuDqY=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr7335840ibd.26.1290006675008; Wed,
	17 Nov 2010 07:11:15 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Wed, 17 Nov 2010 07:11:14 -0800 (PST)
In-Reply-To: <1290006345-22363-1-git-send-email-rep.dot.nop@gmail.com>
References: <AANLkTi=qSnufgxxDHZ+VW6mZED1LFXBduX81HA-kBZEu@mail.gmail.com>
	<1290006345-22363-1-git-send-email-rep.dot.nop@gmail.com>
Date: Wed, 17 Nov 2010 16:11:14 +0100
Message-ID: <AANLkTi==WrNwoG_2u7zzb4V5hGc9Ctv2LYg8DLPv489p@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Wed, 17 Nov 2010 15:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/17 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> =A0 =A0bitbake.conf: add ext4 image support
>
> =A0 =A0Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

did you use git send-email?
The subject line is not ok.

>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f1dc0ff..b7ec8ad 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -369,6 +369,9 @@ IMAGE_CMD_ext2.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE=
}/tmp.bz2 ; genext2fs -b ${RO
> =A0IMAGE_CMD_ext3 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${D=
EPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${=
DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
> =A0IMAGE_CMD_ext3.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2=
fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_=
NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/=
${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NA=
ME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz=
 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
> =A0IMAGE_CMD_ext3.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genex=
t2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMA=
GE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.=
bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IM=
AGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.=
ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2"
> +IMAGE_CMD_ext4 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEP=
LOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O exte=
nts,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootf=
s.ext4; e2fsck.e2fsprogs-native -y -fDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.=
rootfs.ext4"
> +IMAGE_CMD_ext4.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NA=
ME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,h=
as_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; e2fsck.e2f=
sprogs-native -y -fDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4=
; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEP=
LOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IM=
AGE_NAME}.rootfs.ext4.gz"
> +IMAGE_CMD_ext4.bz2 =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2=
fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE=
_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_inde=
x,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; e2fsck=
.e2fsprogs-native -y -fDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs=
.ext4; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; m=
v ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IM=
AGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
> =A0IMAGE_CMD_squashfs =3D "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}=
/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
> =A0IMAGE_CMD_squashfs-lzma =3D "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_I=
MAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp =
lzma"
> =A0IMAGE_CMD_tar =3D "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/=
${IMAGE_NAME}.rootfs.tar ."
> @@ -402,6 +405,9 @@ IMAGE_DEPENDS_ext2.bz2 =3D "genext2fs-native"
> =A0IMAGE_DEPENDS_ext3 =3D "genext2fs-native e2fsprogs-native"
> =A0IMAGE_DEPENDS_ext3.gz =3D "genext2fs-native e2fsprogs-native"
> =A0IMAGE_DEPENDS_ext3.bz2 =3D "genext2fs-native e2fsprogs-native"
> +IMAGE_DEPENDS_ext4 =3D "genext2fs-native e2fsprogs-native"
> +IMAGE_DEPENDS_ext4.gz =3D "genext2fs-native e2fsprogs-native"
> +IMAGE_DEPENDS_ext4.bz2 =3D "genext2fs-native e2fsprogs-native"
> =A0IMAGE_DEPENDS_cpio.gz.u-boot =3D "u-boot-mkimage-native"
> =A0IMAGE_DEPENDS_cpio.lzma =3D "lzma-native"
> =A0IMAGE_DEPENDS_squashfs =3D "squashfs-tools-native"
> @@ -718,6 +724,8 @@ IMAGE_ROOTFS_SIZE_ext2 ?=3D "65536"
> =A0IMAGE_ROOTFS_SIZE_ext2.gz ?=3D "65536"
> =A0IMAGE_ROOTFS_SIZE_ext3 ?=3D "65536"
> =A0IMAGE_ROOTFS_SIZE_ext3.gz ?=3D "65536"
> +IMAGE_ROOTFS_SIZE_ext4 ?=3D "65536"
> +IMAGE_ROOTFS_SIZE_ext4.gz ?=3D "65536"
> =A0DISTRO_PR ?=3D ""
>
> =A0# Forcefully set CACHE now so future changes to things like
> diff --git a/conf/local.conf.sample b/conf/local.conf.sample
> index 60c10e4..c2d5c54 100644
> --- a/conf/local.conf.sample
> +++ b/conf/local.conf.sample
> @@ -114,7 +114,7 @@ PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g+=
+:gcc-cross"
> =A0# INHERIT =3D "package_tar"
>
> =A0# Add the required image file system types below. Valid are
> -# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
> +# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz), ext4(.gz=
),
> =A0# squashfs, squashfs-lzma
> =A0IMAGE_FSTYPES =3D "jffs2 tar"
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


