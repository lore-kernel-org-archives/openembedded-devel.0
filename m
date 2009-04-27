Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LyQKV-0002jQ-A4
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 14:53:04 +0200
Received: by an-out-0708.google.com with SMTP id c3so1345772ana.30
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=bE8fge205XrZUrGk0583bAAcl/GoESCdrlIMUVBRics=;
	b=b8fDP/vjoHp6DgiIeqAr9i+mbeA0dsnYSsn7/LnLCC15AEfYY+mjUXf+A8tjVrkwlG
	8LRZuCSgxpAcWgDfJ9uVO6Rt/BXjJUlmBdHdA8zD+iM/qGfy8EeNhliFQx6x0xw92G3Q
	5keN8IcBXSDg8oR9xqFFM7mMnOmzvF/lGsoWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=GB37SI4hTIImETNbboFXjsla4aPivnvE9luO7zo39snsoaEXiKgIAiffWqtiZTH1MO
	W7a3dLa26n1o7anyXVZQeLb9Zo3g15x8qaDy6pXWsA0AMcFvaVohdTorRIQcqG6uhyqV
	+0Cw8MC4Zqya2C7gw2KRuOskX/Rn2//A7kiyM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.101.66.15 with SMTP id t15mr8611621ank.38.1240836480402; Mon, 
	27 Apr 2009 05:48:00 -0700 (PDT)
In-Reply-To: <1240829678-12348-1-git-send-email-khimov@altell.ru>
References: <1240829678-12348-1-git-send-email-khimov@altell.ru>
Date: Mon, 27 Apr 2009 09:48:00 -0300
X-Google-Sender-Auth: b5278b6ee96199c5
Message-ID: <be7a9f3d0904270548u586b643fw7d69df7611eee6d0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] bitbake.conf: fix parallel build for gzip'd images
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
X-List-Received-Date: Mon, 27 Apr 2009 12:53:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Mon, Apr 27, 2009 at 7:54 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Parallel build of gzip'd images is broken now because of the way
> ${DEPLOY_DIR_IMAGE}/tmp.gz dir is removed-created-removed for every image=
.
> Fix it by 'installing' the dir and let it stay in place.
> ---
> =A0conf/bitbake.conf | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 9e026e4..95ee9c6 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -342,9 +342,9 @@ IMAGE_CMD_jffs2 =3D "mkfs.jffs2 -x lzo --root=3D${IMA=
GE_ROOTFS} --faketime --output=3D
> =A0IMAGE_CMD_yaffs2 =3D "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
> =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${I=
MAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
> =A0IMAGE_CMD_ext2 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${D=
EPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_ext2.gz =3D "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPL=
OY_DIR_IMAGE}/tmp.gz; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPL=
OY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -=
9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMA=
GE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.r=
ootfs.ext2.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
> +IMAGE_CMD_ext2.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NA=
ME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs=
.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz"
> =A0IMAGE_CMD_ext3 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${D=
EPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${=
DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
> -IMAGE_CMD_ext3.gz =3D "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPL=
OY_DIR_IMAGE}/tmp.gz; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPL=
OY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -=
j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY=
_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz=
/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3=
.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
> +IMAGE_CMD_ext3.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NA=
ME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME=
}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz $=
{DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
> =A0IMAGE_CMD_squashfs =3D "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}=
/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
> =A0IMAGE_CMD_squashfs-lzma =3D "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_=
DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
> =A0IMAGE_CMD_tar =3D "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/=
${IMAGE_NAME}.rootfs.tar ."
> --
> 1.6.2.4
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


