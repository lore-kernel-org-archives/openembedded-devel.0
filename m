Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1OhMJj-0003is-Vn
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 14:46:33 +0200
Received: by yxi11 with SMTP id 11so3017016yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iYqknyLyBtRp2oSFcjkyH/G6gTeHFxj36O4iNP7pTpo=;
	b=jqH1kkD4cDlflcpcwyptif3ZEuog3vsiywFrdTfHxrYXKuTpGX/xlL6Wp0e3b20n+e
	AZNIlfBB2kt5JnmlUzC765dxoLzOILhPzu19q5XxXdzd6ejhnojOpvz4Dtdh+cnDaCBu
	WmPbB3JSdzbvU5XLCMDeBGTmIZmomNiATuhNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Y0WJmChp1xb35vUgqqYaEeuFo5e9OxIBdJ8/BKOWSRTFwqvoyuf2Q+V8fAiOHJbRMj
	ADtj4ALJkMX8lorHDE7C5WPUSG7MIOtCwoiMWDneAw6yxZmZnMejGZ3lbRQaw8ln2GzG
	OYLOfY0egRf6yXqg7fFztWbjyQ/N67StUn2Kw=
MIME-Version: 1.0
Received: by 10.150.228.16 with SMTP id a16mr6636026ybh.336.1281098785016; 
	Fri, 06 Aug 2010 05:46:25 -0700 (PDT)
Received: by 10.220.202.201 with HTTP; Fri, 6 Aug 2010 05:46:24 -0700 (PDT)
In-Reply-To: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
References: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
Date: Fri, 6 Aug 2010 14:46:24 +0200
Message-ID: <AANLkTinAWxpN=CRaPXH8J8x7FZEZnTqoCgT-mdGZ6iAu@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] bitbake.conf: add ext4 image support
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
X-List-Received-Date: Fri, 06 Aug 2010 12:46:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 6 August 2010 11:40, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wr=
ote:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =C2=A0conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 ++++++
> =C2=A0conf/local.conf.sample | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index abe500a..9b0afce 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -366,6 +366,8 @@ IMAGE_CMD_ext2 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${=
IMAGE_ROOTFS} ${DEPLOY_DIR_IM
> =C2=A0IMAGE_CMD_ext2.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; gene=
xt2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMA=
GE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.=
gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.r=
ootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz"
> =C2=A0IMAGE_CMD_ext3 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j=
 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
> =C2=A0IMAGE_CMD_ext3.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; gene=
xt2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMA=
GE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.=
gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE=
_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3=
.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
> +IMAGE_CMD_ext4 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEP=
LOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -j ${DE=
PLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4"
> +IMAGE_CMD_ext4.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs=
 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NA=
ME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${=
IMAGE_NAME}.rootfs.ext4; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME=
}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz $=
{DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"

It seems the IMAGE_CMDs for ext3 and ext4 exactly alike (except for the
filename)? Or am I missing something? According to [1], converting ext2 fs
to ext4 is performed like this:

  tune2fs -j /dev/DEV
  tune2fs -O extents,uninit_bg,dir_index /dev/DEV

followed by a fsck to fix up some structures

  e2fsck -fDC0 /dev/DEV


Best regards,
Bj=C3=B8rn Forsman

[1]: https://ext4.wiki.kernel.org/index.php/Ext4_Howto


