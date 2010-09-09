Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1OtgoR-0000Xx-ML
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 15:05:13 +0200
Received: by wwi14 with SMTP id 14so1608557wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xd+kdm9rjwWmMLTofBlxJrRGYj2FjRNj0QdciUckqJ4=;
	b=TZL/YGqq7AXHj2AM4xj96s9EiGnzchC2H/C0bxFEbs+5T9R7gEomu2plLaoT9ggU/4
	pruAgDbdngMd7W1wNBdeE0LuJ7n7Npe7xxnDEWM/2hVRDriK378h3SBdqyGOuz0x/RQM
	NlsQY/7sh7SXeyDKG1pvivygK02H5qLlTSmGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NKm/ImOUbctEnJg9c284hapIj9OBduABeNEST5VaxYkXC8TIeauhHDoyD+wBRaDa/J
	ImymUegiUs+X8LiXfh5abXPMkSY0suW//BN2SkeqoMox+FypBCdmdhrWAnvd7wlkUkzF
	Qxf3zUo8eooLFnQanneJy1kQQanAGLke/PXsk=
MIME-Version: 1.0
Received: by 10.216.158.140 with SMTP id q12mr287521wek.14.1284037468507; Thu,
	09 Sep 2010 06:04:28 -0700 (PDT)
Received: by 10.216.16.193 with HTTP; Thu, 9 Sep 2010 06:04:28 -0700 (PDT)
In-Reply-To: <i6a71i$2tv$1@dough.gmane.org>
References: <1284010137-15488-1-git-send-email-raj.khem@gmail.com>
	<i6a71i$2tv$1@dough.gmane.org>
Date: Thu, 9 Sep 2010 06:04:28 -0700
Message-ID: <AANLkTin-FbqWWLQE+ZJ9TA3zF70U=GBy5cbVm_DHqW5J@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libgles-omap3_3.01.00.07.bb: Add recipe
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
X-List-Received-Date: Thu, 09 Sep 2010 13:05:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

n Thu, Sep 9, 2010 at 1:48 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-09-10 07:28, Khem Raj wrote:
>> * Fix omap3-sgx-modules_1.4.14.2616.bb to use new SDK
>
> Khem, the .07 release was made to get the license and distribution
> changes through, it can now be downloaded with wget without filling in a
> form.

Koen:  does the .07 release build against recent linux-omap kernels or
is it still broken in the same way as the .06 version?

Steve

> Could you please amend this patch so that the recipes fetch it directly?
>
>
> regards,
>
> Koen
>
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0.../powervr-drivers/libgles-omap3_3.01.00.07.bb =A0 =A0| =A0 19 +++++=
++++++++++++++
>> =A0.../omap3-sgx-modules_1.4.14.2616.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A08 +++-----
>> =A02 files changed, 22 insertions(+), 5 deletions(-)
>> =A0create mode 100644 recipes/powervr-drivers/libgles-omap3_3.01.00.07.b=
b
>>
>> diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb b/recip=
es/powervr-drivers/libgles-omap3_3.01.00.07.bb
>> new file mode 100644
>> index 0000000..30a65b3
>> --- /dev/null
>> +++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
>> @@ -0,0 +1,19 @@
>> +BINLOCATION =3D "${S}/gfx_rel_es3.x"
>> +
>> +ES2LOCATION =3D "${S}/gfx_rel_es2.x"
>> +ES3LOCATION =3D "${S}/gfx_rel_es3.x"
>> +ES5LOCATION =3D "${S}/gfx_rel_es5.x"
>> +
>> +require libgles-omap3.inc
>> +
>> +# download required binary distribution from:
>> +# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf=
xsdk/latest/index_FDS.html
>> +# see libgles-omap3.inc for detailed installation instructions
>> +
>> +SGXPV =3D "3_01_00_07"
>> +IMGPV =3D "1.4.14.2616"
>> +BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
>> +
>> +SRC_URI[md5sum] =3D "b33a82d393ed0a6c26ad0d952542d762"
>> +SRC_URI[sha256sum] =3D "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b44f=
8fcfd74d0f2559d8e"
>> +
>> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb b/=
recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
>> index 0d2818b..fc98b7b 100644
>> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
>> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
>> @@ -10,12 +10,11 @@ PR_append =3D "c"
>> =A0TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
>> =A0require ../ti/ti-eula-unpack.inc
>>
>> -SGXPV =3D "3_01_00_06"
>> +SGXPV =3D "3_01_00_07"
>> =A0IMGPV =3D "1.4.14.2616"
>> =A0BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
>>
>> =A0SRC_URI =3D "http://install.source.dir.local/OMAP35x_Graphics_SDK_set=
uplinux_${SGXPV}.bin \
>> - =A0 =A0 =A0 =A0 =A0 file://texture-width.patch;striplevel=3D2 \
>> =A0"
>>
>> =A0S =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
>> @@ -35,6 +34,5 @@ do_install() {
>> =A0 =A0 =A0 =A0 =A0${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti=
.ko \
>> =A0 =A0 =A0 =A0 =A0${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu=
/pvr
>> =A0}
>> -
>> -SRC_URI[md5sum] =3D "7aa37ca72f34011d353e72cc67f8aac1"
>> -SRC_URI[sha256sum] =3D "02276bc728699c36b0d2411c60f23030aa066ca6b8ed5ad=
b7a40204563a227fb"
>> +SRC_URI[md5sum] =3D "b33a82d393ed0a6c26ad0d952542d762"
>> +SRC_URI[sha256sum] =3D "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b44f=
8fcfd74d0f2559d8e"
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMiJ9yMkyGM64RGpERAoK2AJ9SsjGBUCtYY5/BOE8FX9ZQq8in3wCgqhnk
> H28hsB4lTTxnuJUwxpjcSJc=3D
> =3D9LzQ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


