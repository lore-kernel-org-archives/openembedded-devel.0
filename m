Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Otn1G-0002s0-DI
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 21:42:52 +0200
Received: by yxg6 with SMTP id 6so313666yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 12:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=OmXDLgqhRVrzWyXxQRejGRK0aMVoMeIgZhSmlpO2gbY=;
	b=tfjB2lzEvdBJ81ZxCx4PPSCWHXIORB/mueBVhuWPNAcPKD4JeupkHDSvEEjAZ5xfKI
	HLcaq4S6HmqDhzAyiRf/xC3FsdRjFisT8Ea+rUGoVhjhmn3K+Urt6DclXCYPn5e7kVQ/
	NoCDJiQHjCTI8InKrcm7NtEMHYFmgOtTWhcmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=EAx4bxc2ZDemsFw+bQ5esMxOMN6KFa+pRa5f7kSfwwFoG3c51N+AfiDyizm0oKh0Gd
	UeNlFb8PF5clJ78VUoVuVCFFWoZioy5U0dpF+iGp/ajFvzg5l7RRnyrTvixv5pNUuSZM
	AC//SJFgqF/L/sIpuwU2pa8/0JGZXNbli+i98=
Received: by 10.100.80.6 with SMTP id d6mr401395anb.64.1284061325449; Thu, 09
	Sep 2010 12:42:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Thu, 9 Sep 2010 12:41:45 -0700 (PDT)
In-Reply-To: <i6a71i$2tv$1@dough.gmane.org>
References: <1284010137-15488-1-git-send-email-raj.khem@gmail.com>
	<i6a71i$2tv$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Sep 2010 12:41:45 -0700
Message-ID: <AANLkTi=+R=7t_6Uh2GXPAgzV_ViPwK3v9dkTLajzFSVb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Thu, 09 Sep 2010 19:42:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2010 at 1:48 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-09-10 07:28, Khem Raj wrote:
>> * Fix omap3-sgx-modules_1.4.14.2616.bb to use new SDK
>
> Khem, the .07 release was made to get the license and distribution
> changes through, it can now be downloaded with wget without filling in a
> form.
> Could you please amend this patch so that the recipes fetch it directly?

hmm thats good. but I could not grok the direct link. Do you have it handy =
?

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
>> =C2=A0.../powervr-drivers/libgles-omap3_3.01.00.07.bb =C2=A0 =C2=A0| =C2=
=A0 19 +++++++++++++++++++
>> =C2=A0.../omap3-sgx-modules_1.4.14.2616.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +++-----
>> =C2=A02 files changed, 22 insertions(+), 5 deletions(-)
>> =C2=A0create mode 100644 recipes/powervr-drivers/libgles-omap3_3.01.00.0=
7.bb
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
>> =C2=A0TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
>> =C2=A0require ../ti/ti-eula-unpack.inc
>>
>> -SGXPV =3D "3_01_00_06"
>> +SGXPV =3D "3_01_00_07"
>> =C2=A0IMGPV =3D "1.4.14.2616"
>> =C2=A0BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
>>
>> =C2=A0SRC_URI =3D "http://install.source.dir.local/OMAP35x_Graphics_SDK_=
setuplinux_${SGXPV}.bin \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://texture-width.patch;striplev=
el=3D2 \
>> =C2=A0"
>>
>> =C2=A0S =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
>> @@ -35,6 +34,5 @@ do_install() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/services4/3rdparty/bufferclass_ti=
/bufferclass_ti.ko \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/lib/modules/${KERNEL_VERSION}/ker=
nel/drivers/gpu/pvr
>> =C2=A0}
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



--=20
-Khem


