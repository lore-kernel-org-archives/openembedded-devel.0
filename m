Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gavinswanson@gmail.com>) id 1RCDWb-000626-BJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 18:43:53 +0200
Received: by ywf7 with SMTP id 7so3869826ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aKGQBVUZTn1wntt9ODWx70CENV2tmYGjv+eMBm+Uvv8=;
	b=eJN3CAgw1uRjGjEuRGRw/G0srHuzjXIhYLtHrobzVhDC+NHkK+27axqcdaUCO/6bqx
	baUMNEWSDXRoYwCuyaOU14HUAqTP1pYMm6pC8fkTtUDyltoS00EIOMGbWLtZw53LunY2
	TlxRpNaPFJ6Ee0I9tXMeAY7NV3MDy5NgqwecQ=
MIME-Version: 1.0
Received: by 10.223.5.139 with SMTP id 11mr11753238fav.21.1318005495115; Fri,
	07 Oct 2011 09:38:15 -0700 (PDT)
Received: by 10.223.92.133 with HTTP; Fri, 7 Oct 2011 09:38:15 -0700 (PDT)
In-Reply-To: <1317981695.3685.22.camel@mattotaupa>
References: <1317942096-32057-1-git-send-email-gavinswanson@gmail.com>
	<1317981695.3685.22.camel@mattotaupa>
Date: Fri, 7 Oct 2011 09:38:15 -0700
Message-ID: <CAKHrxHGv4Sjky=nEQs4ma0bHB7TMtGhfoDyXeJ7xtYY125ZeCA@mail.gmail.com>
From: Gavin Swanson <gavinswanson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Added ImageMagick 6.7.2-3
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
X-List-Received-Date: Fri, 07 Oct 2011 16:43:53 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

This is my first attempt at submitting a patch. Please bear with me. I
read through the style guide and used the oe-stylize script on my
changed version. I still have some questions.

On Fri, Oct 7, 2011 at 3:01 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Gavin,
>
>
> thank you for your patch.
>
> Am Donnerstag, den 06.10.2011, 16:01 -0700 schrieb gavinswanson@gmail.com=
:
>> From: Gavin Swanson <gavinswanson@gmail.com>
>
> Please refer to our commit policy [1] and style guide [2].
> (Unfortunately the Wiki is down at the moment.)
>
> Change the commit summary to
>
> =A0 =A0 =A0 =A0imagemagick: Add version 6.7.2-3
>
> and add some more information to the commit message. What distribution
> and machine did you use for testing? Have you run tested the new
> version.
>
> You seem to have used an existing recipe as a template. Please note that
> too.
>
> At last please add you Signed-off-by line.
>
>> ---
>> =A0recipes/imagemagick/imagemagick_6.7.2-3.bb | =A0 36 +++++++++++++++++=
+++++++++++
>> =A01 files changed, 36 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/imagemagick/imagemagick_6.7.2-3.bb
>>
>> diff --git a/recipes/imagemagick/imagemagick_6.7.2-3.bb b/recipes/imagem=
agick/imagemagick_6.7.2-3.bb
>> new file mode 100644
>> index 0000000..14746c9
>> --- /dev/null
>> +++ b/recipes/imagemagick/imagemagick_6.7.2-3.bb
>> @@ -0,0 +1,36 @@
>> +DESCRIPTION =3D "ImageMagick is an image convertion tools"
>> +SECTION =3D "console/utils"
>> +LICENSE =3D "GPL"
>
> I updated those meta fields in the repository. Please update the above
> too.

I'm using the gumstix repo, so I didn't have these changes, I looked
them up though and have included them.

>
>> +# FIXME: There is much more checked libraries. All should be added or e=
xplicitly disabled to get consistent results.
>> +DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib"
>> +
>> +PR =3D "r1"
>
> Please start with `r0`.

Done

>
>> +
>> +SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.b=
z2 \
>> +# =A0 =A0 =A0 =A0 =A0 file://PerlMagic_MakePatch;apply=3Dyes \
>
> Why is this patch not needed anymore? You can just delete the line then.
>

Not sure why it was needed in the first place, but it builds and runs
fine without it.

>> + =A0 =A0 =A0 =A0 =A0"
>> +
>> +IMVER =3D "6.7.2-3"
>
> I think the old recipes strip the `-3` to get the correct directory
> names. This way `IMVER` is equal to `PN`.

The build does not succeed without the -3 in it

>> +
>> +S =3D "${WORKDIR}/ImageMagick-${IMVER}"
>
> It looks like you can delete this line for this version, since in your
> version the archive seems to have a =93correctly=94 named folder included=
.
>

This line has been removed with success

> $ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.4.4-1-r7/
> ImageMagick-6.4.4 =A0temp
>
> $ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.7.2-3-r1/
> ImageMagick-6.7.2-3 =A0temp
>
>> +
>> +inherit autotools binconfig pkgconfig
>> +
>> +EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetype --=
without-perl --disable-openmp"
>> +
>> +FILES_${PN} +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/ImageMagick-${IMVER}/modules-=
Q16/*/*.la \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/ImageMagick-${IMVER}/config/ =
\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/ImageMagick-${IMVER}"
>
> Could you please look into the following warnings.
>
> =A0 =A0 =A0 =A0NOTE: package imagemagick-6.7.2-3-r1: task do_qa_staging: =
Succeeded
> =A0 =A0 =A0 =A0WARNING: the following files were installed but not shippe=
d in any package:
> =A0 =A0 =A0 =A0WARNING: =A0 /usr/share/ImageMagick-6.7.2/francais.xml
> =A0 =A0 =A0 =A0WARNING: =A0 /usr/share/ImageMagick-6.7.2/locale.xml
> =A0 =A0 =A0 =A0WARNING: =A0 /usr/share/ImageMagick-6.7.2/english.xml
> =A0 =A0 =A0 =A0WARNING: =A0 /usr/share/ImageMagick-6.7.2/configure.xml
>

Not sure where those warnings show up for you, I don't get them during
the build, is there some kind of extra warnings flag I should be
using?

> Here you can also see that the directory name seems to only include
> 6.7.2 instead of 6.7.2-3. So you should check where `IMVER` should be
> used and where `PV`, which is 6.7.2-3.
>

Not sure what you mean by this. As stated the build fails without the
-3 on the IMVER

>> +
>> +FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
>> +
>> +FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.deb=
ug/*"
>> +
>> +BBCLASSEXTEND =3D "native"
>> +
>> +LEAD_SONAME =3D "libMagickCore.so.*"
>> +
>> +
>> +SRC_URI[md5sum] =3D "62e12090d2d385f4800c06f58f477bea"
>> +SRC_URI[sha256sum] =3D "50fe6e1af9e900e5d4bef45879a3a7e15512bb9ab3dbbaf=
b521825359cb6d2c7"
>
>
> Thanks,
>
> Paul
>
>
> [1] http://www.openembedded.org/wiki/Commit_Policy
> [2] http://www.openembedded.org/index.php?title=3DStyleguide
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


