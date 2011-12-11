Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RZs1N-0003Pn-IH
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Dec 2011 23:37:25 +0100
Received: by pbcc11 with SMTP id c11so731558pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Dec 2011 14:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=d+t2ifHqJUOV0+2pD4OaVuYbFzAnWSIMbAVtrPZGK20=;
	b=YoYEQpewo79S2aBjZa5nyBNBwSrxl+8A6SlrxzU1UjoLMdzRuE/BGZobJA+Cqu2eDI
	lEc+ZpOqGk3PyZ6HWvb1YXOcN2Dvlhhcyi/6FoKeXgzvnxcJe85OGiEIQEEZl42uP04T
	xrGt9kQsmqZhhrd9sDmjettOcLheiYFCWQ+1g=
MIME-Version: 1.0
Received: by 10.68.73.197 with SMTP id n5mr28143712pbv.102.1323642630356; Sun,
	11 Dec 2011 14:30:30 -0800 (PST)
Received: by 10.142.128.8 with HTTP; Sun, 11 Dec 2011 14:30:30 -0800 (PST)
In-Reply-To: <20111211092940.GD3986@jama.jama.net>
References: <1323360390-12622-1-git-send-email-andrea.adami@gmail.com>
	<20111211092940.GD3986@jama.jama.net>
Date: Sun, 11 Dec 2011 23:30:30 +0100
Message-ID: <CAAQYJAsnWiv8YnF_oe=L5NheMw6O4n29Bq-cauVCKK-dSm505A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] zaurus.inc: adapt jffs2 and sum.jffs2 to changes in oe-core
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
X-List-Received-Date: Sun, 11 Dec 2011 22:37:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 11, 2011 at 10:29 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Dec 08, 2011 at 05:06:30PM +0100, Andrea Adami wrote:
>> * in oe-core jffs2 summary has been added to image_types.bbclass and
>> * IMAGE_CMD_jffs2 now includes '-n' to skip cleanmarkers node creation
>> * so we need to customize only padding, endianness and compression mode
>> * While there remove compression settings which are handled in kernel.
>> * This allows us to use the same string for mkfs.jffs2 and for sumtool.
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>> =A0conf/machine/include/zaurus.inc | =A0 13 +++----------
>> =A01 files changed, 3 insertions(+), 10 deletions(-)
>>
>> diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaur=
us.inc
>> index b488f37..0a9b1c5 100644
>> --- a/conf/machine/include/zaurus.inc
>> +++ b/conf/machine/include/zaurus.inc
>> @@ -9,18 +9,11 @@ ERASEBLOCKSIZE_akita =3D "0x20000"
>> =A0# C3100 and C3200 have same 128MiB NAND device as akita
>> =A0ERASEBLOCKSIZE_spitz =3D "0x20000"
>>
>> -IMAGE_FSTYPES +=3D "jffs2 tar.gz"
>> +IMAGE_FSTYPES +=3D "tar.gz jffs2 sum.jffs2"
>
> Do you really need jffs2 if there is sum.jffs2? IMAGE_CMD_sum.jffs2
> produces both now, doesn't it?
>
Yes, the jffs2 is rebuilt as well.
Actually I though about calling the output differently and remove it
after the sumtool step but did not find special reasons to do it...in
fact you almost always want the plain jffs2 too.
Not a strong opinion, though...

> IIRC there was discussion about using +=3D IMAGE_FSTYPES, I don't remembe=
r
> the result, but can we use ?=3D here? Just to make easier for someone to
> limit images in local.conf ie just
> IMAGE_FSTYPES =3D "tar.gz"
>

Nothing against, this is a remnant of oe-classic.

>
>> =A0# kernel now supports favourlzo
>> -IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime -m =
favourlzo \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --output=3D${T}/${IMAGE_NAME}.root=
fs.jffs2 --pad --little-endian --eraseblock=3D${ERASEBLOCKSIZE} -n \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 && sumtool -i ${T}/${IMAGE_NAME}.r=
ootfs.jffs2 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -o ${T}/${IMAGE_NAME}.rootfs.jffs2=
.summary \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --eraseblock=3D${ERASEBLOCKSIZE} -=
l -p; \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${T}/${IMAGE_NAME}.rootfs.jffs=
2 > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2; \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm ${T}/${IMAGE_NAME}.rootfs.jffs2=
; \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${T}/${IMAGE_NAME}.rootfs.jffs=
2.summary > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.summary.jffs2; \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm ${T}/${IMAGE_NAME}.rootfs.jffs2=
.summary;"
>> +EXTRA_IMAGECMD_jffs2 =3D "-p -l --eraseblock=3D${ERASEBLOCKSIZE}"
>> +EXTRA_IMAGECMD_sum.jffs2 =3D "${EXTRA_IMAGECMD_jffs2}"
>>
>> =A0EXTRA_IMAGEDEPENDS +=3D "zaurus-installer"
>>
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

BTW we'll support soon ubi filesystems in kexecboot so long mount
times will disappear.
Thanks for testing

Cheers

Andrea


