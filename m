Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PDQqr-0005z0-U8
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 01:05:19 +0100
Received: by wwi18 with SMTP id 18so40481wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lWmuhGYRPhFf2Lg5EtNabUUwDOTAmHW7h9t36IiTEW0=;
	b=QN0FSLWwF9LP4T2cJe4XGGaHYP1yaNioWCflEyVEN15OPQB+3w6dY81+va7x6CX4//
	ba7zQx6vUvsiXVK/AGn/3etgFh06OAEOmMvykB1sXaHBsjp/gkmFehUOAGxDOTcmEfet
	LgRLnzs9xiRANqIWp+m3eN1mB3mCEctuAF0n4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Vza+8krCMNet89byLyoJh8lkisZ3vVeAkMiDTCbxypn13mxRr7FfD/Pn5HTI1aT1D2
	maV4BhPycnGVFJdNLuCaL0Hc/PRp61I7Nah0MucQMYsFG/F6sbIDztFQAeGngv3eTPqh
	HFMxrZFnJtAOGnchQJwAS0XXnCqK4MqCpLIPk=
MIME-Version: 1.0
Received: by 10.227.135.9 with SMTP id l9mr10575250wbt.49.1288742659298; Tue,
	02 Nov 2010 17:04:19 -0700 (PDT)
Received: by 10.227.37.205 with HTTP; Tue, 2 Nov 2010 17:04:19 -0700 (PDT)
In-Reply-To: <AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
Date: Wed, 3 Nov 2010 10:34:19 +1030
Message-ID: <AANLkTimvfGUSNhMnvcru3D46EoqNcSW87sON6OMV0GD5@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 00:05:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2 November 2010 17:08, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/2 Graham Gower <graham.gower@gmail.com>:
>> =A0* Point configure at where it can find jpeg.
>> =A0* Explicitly disable cdk and aalib.
>> =A0* Fix license while here.
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>> ---
>> =A0recipes/gphoto2/gphoto2_2.4.8.bb | =A0 =A09 +++++++--
>> =A01 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/gphoto2/gphoto2_2.4.8.bb b/recipes/gphoto2/gphoto2_=
2.4.8.bb
>> index ea54713..836ea85 100644
>> --- a/recipes/gphoto2/gphoto2_2.4.8.bb
>> +++ b/recipes/gphoto2/gphoto2_2.4.8.bb
>> @@ -1,7 +1,8 @@
>> =A0DESCRIPTION =3D "gphoto2 is a command-line utility to fetch pictures =
from digital cameras"
>> =A0SECTION =3D "console/utils"
>> -LICENSE =3D "GPL"
>> -DEPENDS =3D "libtool libgphoto2 popt"
>> +LICENSE =3D "GPLv2+"
>> +DEPENDS =3D "libtool libgphoto2 popt jpeg"
>
> The original recipe would build without the depends on jpeg
> adding it to depends should be mentioned in the commit message
>
>> +PR =3D "r1"
>>
>> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=
=3Dgphoto2 \
>> =A0 =A0 =A0 =A0 =A0 =A0file://gphoto-popt-fixup.patch"
>> @@ -11,6 +12,10 @@ SRC_URI[gphoto2.sha256sum] =3D "a2e2f70fd6051234cbc3d=
76dc82df6991e8a07ead56aa8d5c4
>>
>> =A0inherit autotools
>>
>> +EXTRA_OECONF=3D"--without-cdk \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-aalib \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-jpeg-prefix=3D${STAGING_EXECPREFIXD=
IR}"
>> +
>
> I have some concerns here.
> For configure it seems best to explicitly set and reset the flags in
> it, otherwise you may just pick up whatever happened to be build
> before.
>
> from --help:
>
> Optional Features:
> =A0--disable-option-checking =A0ignore unrecognized --enable/--with optio=
ns
> =A0--disable-FEATURE =A0 =A0 =A0 do not include FEATURE (same as --enable=
-FEATURE=3Dno)
> =A0--enable-FEATURE[=3DARG] =A0include FEATURE [ARG=3Dyes]
> =A0--disable-dependency-tracking =A0speeds up one-time build
> =A0--enable-dependency-tracking =A0 do not reject slow dependency extract=
ors
> =A0--enable-shared[=3DPKGS] =A0build shared libraries [default=3Dyes]
> =A0--enable-static[=3DPKGS] =A0build static libraries [default=3Dyes]
> =A0--enable-fast-install[=3DPKGS]
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0optimize for fast inst=
allation [default=3Dyes]
> =A0--disable-libtool-lock =A0avoid locking (might break parallel builds)
> =A0--disable-largefile =A0 =A0 omit support for large files
> =A0--disable-nls =A0 =A0 =A0 =A0 =A0 do not use Native Language Support
> =A0--disable-rpath =A0 =A0 =A0 =A0 do not hardcode runtime library paths
>
> Optional Packages:
> =A0--with-PACKAGE[=3DARG] =A0 =A0use PACKAGE [ARG=3Dyes]
> =A0--without-PACKAGE =A0 =A0 =A0 do not use PACKAGE (same as --with-PACKA=
GE=3Dno)
> =A0--with-pic =A0 =A0 =A0 =A0 =A0 =A0 =A0try to use only PIC/non-PIC obje=
cts [default=3Duse
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0both]
> =A0--with-gnu-ld =A0 =A0 =A0 =A0 =A0 assume the C compiler uses GNU ld [d=
efault=3Dno]
> =A0--with-gnu-ld =A0 =A0 =A0 =A0 =A0 assume the C compiler uses GNU ld de=
fault=3Dno
> =A0--with-libiconv-prefix[=3DDIR] =A0search for libiconv in DIR/include a=
nd DIR/lib
> =A0--without-libiconv-prefix =A0 =A0 don't search for libiconv in
> includedir and libdir
> =A0--with-libintl-prefix[=3DDIR] =A0search for libintl in DIR/include and=
 DIR/lib
> =A0--without-libintl-prefix =A0 =A0 don't search for libintl in includedi=
r and libdir
> =A0--with-libgphoto2=3DPREFIX
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0where to find libgphot=
o2, "no" or "auto"
> =A0--without-pthread =A0 =A0 =A0 =A0 Don't use pthread
> =A0--without-cdk =A0 =A0 =A0 =A0 =A0 Do not use cdk
> =A0--with-cdk-prefix=3DPREFIX
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Location of cdk
> =A0--without-jpeg =A0 =A0 =A0 =A0 =A0Do not use jpeg
> =A0--with-jpeg-prefix=3DPREFIX
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Location of jpeg
> =A0--with-libexif=3DPREFIX =A0 where to find libexif, "no" or "auto"
> =A0--without-aalib =A0 =A0 =A0 =A0 Do not use aalib
> =A0--without-readline =A0 =A0 =A0Do not use readline
>
> All things that are not mentioned in DEPENDS should (IMHO) be
> explicitly be turned off.
> And for the things in DEPENDS I would encourage to still add them.
> E.g. --with-jpeg. Yes I know these will always be picked up when a
> DEPENDS =3D "jpeg" is present, but making it explict does not hurt and
> it trips an error if jpeg is not there and someone does a bitbake -b
> of the recipe (instead of silently building a package without jpeg).
>
> Thanks for your contribution & apologies for using your commit for a
> rant on configure flags.
>
> Frans.
>

I agree with you here. Often a recipe breaks when a particular
subsystem is enabled, which is usually not enabled during regular
image builds. And it can be difficult to determine if something should
be added to DEPENDS or disabled at configure time.

What I found with gphoto2 (which probably wasn't clear) was the
configure script was testing for jpeg and cdk with
-I/usr/local/include. So I guessed on what was useful and what wasn't
and added jpeg to depends to make it clear that jpeg support was
intended (even though it will likely be pulled in by other
dependencies).

I assume you just want exif and readline disabled too? (and possibly
an essay in the commit message :))

-Graham


