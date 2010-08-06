Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1OhMPI-0003ty-FQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 14:52:17 +0200
Received: by vws13 with SMTP id 13so6213838vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mQNhRPwU0NzU7NeWnPqiqDaiy1BUxPWbjZOHwAZ+P7o=;
	b=J+zdqn30LfjaycKQnpb2LGJ5tPKDBENBGNqIAxuTgG7tpIG5Ugy1T68SjfHvLcgUIf
	RKaY5giOf2mb0mbF23V47lDcTwEk93aqZcz0JX3MTA7x0ilwbf+Y31dyRMnXR3S8KdyQ
	6FpheFDDsovmlfpj00vFPCJrTNIEhwpRpTvg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hcbOiUr8X/Kwud0eFcvGl4q7Je2e1xjJet3lAJa/l08pT47UH2j2EV035Y2MqcxwLy
	HbgJX3DipcRIZ8x5RswWDS01xL9TiRjTJjpJdY5YPRh6WD8PmK0vDoldRwBcbY5L/bNp
	S0jnm7JLoSmiKP5TLFKlWWbjZcy3sDCp/eP+U=
MIME-Version: 1.0
Received: by 10.220.58.138 with SMTP id g10mr8242411vch.270.1281099129131; 
	Fri, 06 Aug 2010 05:52:09 -0700 (PDT)
Received: by 10.220.202.201 with HTTP; Fri, 6 Aug 2010 05:52:09 -0700 (PDT)
In-Reply-To: <AANLkTinAWxpN=CRaPXH8J8x7FZEZnTqoCgT-mdGZ6iAu@mail.gmail.com>
References: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTinAWxpN=CRaPXH8J8x7FZEZnTqoCgT-mdGZ6iAu@mail.gmail.com>
Date: Fri, 6 Aug 2010 14:52:09 +0200
Message-ID: <AANLkTi=qSnufgxxDHZ+VW6mZED1LFXBduX81HA-kBZEu@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
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
X-List-Received-Date: Fri, 06 Aug 2010 12:52:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/8/6 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> Hi,
>
> On 6 August 2010 11:40, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> =
wrote:
>> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> ---
>> =C2=A0conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 ++++++
>> =C2=A0conf/local.conf.sample | =C2=A0 =C2=A02 +-
>> =C2=A02 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>> index abe500a..9b0afce 100644
>> --- a/conf/bitbake.conf
>> +++ b/conf/bitbake.conf
>> @@ -366,6 +366,8 @@ IMAGE_CMD_ext2 =3D "genext2fs -b ${ROOTFS_SIZE} -d $=
{IMAGE_ROOTFS} ${DEPLOY_DIR_IM
>> =C2=A0IMAGE_CMD_ext2.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; gen=
ext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IM=
AGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp=
.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.=
rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz"
>> =C2=A0IMAGE_CMD_ext3 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS}=
 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -=
j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
>> =C2=A0IMAGE_CMD_ext3.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; gen=
ext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IM=
AGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp=
.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAG=
E_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext=
3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
>> +IMAGE_CMD_ext4 =3D "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DE=
PLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -j ${D=
EPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4"
>> +IMAGE_CMD_ext4.gz =3D "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2f=
s -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_N=
AME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/$=
{IMAGE_NAME}.rootfs.ext4; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAM=
E}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
>
> It seems the IMAGE_CMDs for ext3 and ext4 exactly alike (except for the
> filename)? Or am I missing something? According to [1], converting ext2 f=
s
> to ext4 is performed like this:
>
> =C2=A0tune2fs -j /dev/DEV
> =C2=A0tune2fs -O extents,uninit_bg,dir_index /dev/DEV
>
> followed by a fsck to fix up some structures
>
> =C2=A0e2fsck -fDC0 /dev/DEV

Or directly from ext2 to ext4:

  tune2fs -O extents,uninit_bg,dir_index,has_journal /dev/DEV
  e2fsck -fDC0 /dev/DEV

Regards,
Bj=C3=B8rn Forsman


