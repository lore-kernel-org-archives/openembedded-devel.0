Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OuAGL-0000hS-J6
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:31:58 +0200
Received: by ywa8 with SMTP id 8so1392334ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=yCnyRcAUSshGk7OA5f2fC7aHg8SA2/cvqlZqx+sK838=;
	b=OnLukp4GTZIQvs1sT5R1R9DhirGOmjdghGnCWK8rSslfx1J7p+IOvmrrKIc7xABy9T
	HKoe8TB9Myjxbqhl1ARqXdi1HFTq2ROfHJ4xVkEJ+F6m9b8MJhhhOSaKkyA1DESj5EIm
	DsqPvdoEfM6nWdCd8nwzWBJYhiuN7xGfdRrtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Pqz17vA+92yfxKyUYh0flMpqPK81u1oxrcM448v3TezZ7k5XPdIdzcRJwPZHBgnv0t
	qmmW0QyaUnwKbMS40cknjSlEMaW7H4CYwZEAEuaQPeMlC9FpFDknB7fQi0Cvyd0Dcz6z
	g8UCxaJVS2KOJyrDK6YLj0+RtgYy/JrssByRc=
Received: by 10.90.80.2 with SMTP id d2mr1116062agb.44.1284150671603; Fri, 10
	Sep 2010 13:31:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Fri, 10 Sep 2010 13:30:51 -0700 (PDT)
In-Reply-To: <20100910193625.GM28148@denix.org>
References: <1284010137-15488-1-git-send-email-raj.khem@gmail.com>
	<i6a71i$2tv$1@dough.gmane.org>
	<AANLkTi=+R=7t_6Uh2GXPAgzV_ViPwK3v9dkTLajzFSVb@mail.gmail.com>
	<20100910193625.GM28148@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Sep 2010 13:30:51 -0700
Message-ID: <AANLkTimrOWAYky+mNWwxdxemh3hjGiSF+FhChq7Y8A=1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 10 Sep 2010 20:31:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2010 at 12:36 PM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> On Thu, Sep 09, 2010 at 12:41:45PM -0700, Khem Raj wrote:
>> On Thu, Sep 9, 2010 at 1:48 AM, Koen Kooi <k.kooi@student.utwente.nl> wr=
ote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > On 09-09-10 07:28, Khem Raj wrote:
>> >> * Fix omap3-sgx-modules_1.4.14.2616.bb to use new SDK
>> >
>> > Khem, the .07 release was made to get the license and distribution
>> > changes through, it can now be downloaded with wget without filling in=
 a
>> > form.
>> > Could you please amend this patch so that the recipes fetch it directl=
y?
>>
>> hmm thats good. but I could not grok the direct link. Do you have it han=
dy ?
>
> Khem,
>
> Per this Wiki Getting Started Guide:
>
> http://processors.wiki.ti.com/index.php/OMAP35x_Graphics_SDK_Getting_Star=
ted_Guide
>
> The 3.1.0.7 release is hosted here:
>
> http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk=
/3_01_00_07/index_FDS.html
>
> Release notes are here:
>
> http://processors.wiki.ti.com/index.php/RN_3_01_00_07
>
> The main GSG still says registration/login is required, but version speci=
fic
> release notes say otherwise:
>
> Features in this release
> [NEW] License change - from export control to TSPA (no registration requi=
red)
> [NEW] Corrected the core revision for omap3630 (from 121 to 125) in KM bu=
ild
>
>
> And the direct URL for the tarball would be:
>
> http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk=
/3_01_00_07/exports/OMAP35x_Graphics_SDK_setuplinux_3_01_00_07.bin
>

thats what I was looking for thx.

> --
> Denys
>
>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >> =C2=A0.../powervr-drivers/libgles-omap3_3.01.00.07.bb =C2=A0 =C2=A0| =
=C2=A0 19 +++++++++++++++++++
>> >> =C2=A0.../omap3-sgx-modules_1.4.14.2616.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +++-----
>> >> =C2=A02 files changed, 22 insertions(+), 5 deletions(-)
>> >> =C2=A0create mode 100644 recipes/powervr-drivers/libgles-omap3_3.01.0=
0.07.bb
>> >>
>> >> diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb b/re=
cipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
>> >> new file mode 100644
>> >> index 0000000..30a65b3
>> >> --- /dev/null
>> >> +++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
>> >> @@ -0,0 +1,19 @@
>> >> +BINLOCATION =3D "${S}/gfx_rel_es3.x"
>> >> +
>> >> +ES2LOCATION =3D "${S}/gfx_rel_es2.x"
>> >> +ES3LOCATION =3D "${S}/gfx_rel_es3.x"
>> >> +ES5LOCATION =3D "${S}/gfx_rel_es5.x"
>> >> +
>> >> +require libgles-omap3.inc
>> >> +
>> >> +# download required binary distribution from:
>> >> +# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent=
/gfxsdk/latest/index_FDS.html
>> >> +# see libgles-omap3.inc for detailed installation instructions
>> >> +
>> >> +SGXPV =3D "3_01_00_07"
>> >> +IMGPV =3D "1.4.14.2616"
>> >> +BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
>> >> +
>> >> +SRC_URI[md5sum] =3D "b33a82d393ed0a6c26ad0d952542d762"
>> >> +SRC_URI[sha256sum] =3D "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b=
44f8fcfd74d0f2559d8e"
>> >> +
>> >> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb=
 b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
>> >> index 0d2818b..fc98b7b 100644
>> >> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
>> >> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
>> >> @@ -10,12 +10,11 @@ PR_append =3D "c"
>> >> =C2=A0TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
>> >> =C2=A0require ../ti/ti-eula-unpack.inc
>> >>
>> >> -SGXPV =3D "3_01_00_06"
>> >> +SGXPV =3D "3_01_00_07"
>> >> =C2=A0IMGPV =3D "1.4.14.2616"
>> >> =C2=A0BINFILE :=3D "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
>> >>
>> >> =C2=A0SRC_URI =3D "http://install.source.dir.local/OMAP35x_Graphics_S=
DK_setuplinux_${SGXPV}.bin \
>> >> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://texture-width.patch;strip=
level=3D2 \
>> >> =C2=A0"
>> >>
>> >> =C2=A0S =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
>> >> @@ -35,6 +34,5 @@ do_install() {
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/services4/3rdparty/bufferclass=
_ti/bufferclass_ti.ko \
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/lib/modules/${KERNEL_VERSION}/=
kernel/drivers/gpu/pvr
>> >> =C2=A0}
>> >> -
>> >> -SRC_URI[md5sum] =3D "7aa37ca72f34011d353e72cc67f8aac1"
>> >> -SRC_URI[sha256sum] =3D "02276bc728699c36b0d2411c60f23030aa066ca6b8ed=
5adb7a40204563a227fb"
>> >> +SRC_URI[md5sum] =3D "b33a82d393ed0a6c26ad0d952542d762"
>> >> +SRC_URI[sha256sum] =3D "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b=
44f8fcfd74d0f2559d8e"
>> >
>> > -----BEGIN PGP SIGNATURE-----
>> > Version: GnuPG v1.4.5 (Darwin)
>> >
>> > iD8DBQFMiJ9yMkyGM64RGpERAoK2AJ9SsjGBUCtYY5/BOE8FX9ZQq8in3wCgqhnk
>> > H28hsB4lTTxnuJUwxpjcSJc=3D
>> > =3D9LzQ
>> > -----END PGP SIGNATURE-----
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>>
>>
>> --
>> -Khem
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


