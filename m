Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lrk9W-0001Ds-NB
	for openembedded-devel@openembedded.org; Thu, 09 Apr 2009 04:38:22 +0200
Received: by an-out-0708.google.com with SMTP id d11so360980and.30
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 19:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=8eOTfP4NeBxWyf1su968FsDYZsyyDMAPwaWAS7kfcsg=;
	b=jqexSHNL+rF+JHy/PyyB7KcQSIGl/obMFiOU2BIEkt34dWAKJlAkQj+iRFZKHk3ra5
	JCuib3v1yyqZuEAskqtgQbUNG0CPiOrrJOlrj35fVeIVaIegXXDlK3sAo2k6UxTmLyce
	tPXAVqg11fqsoknwlo27zdRvxQ/K5QlCzgVtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=bmWxZqU/EVNddjo1iFZyG1+/nDQk/xDhg8d3DmLVW16FARKE/fN1Nnw5IRp+tHfjZ7
	vP3gB+g2INItw95U2TePv+pmHivD6KOfb95VnI5T7+LsTqqp2PSsh2/wRWmlOg181VQx
	VCBExi65QdrjXFek6m4J0asQV660+PQMVD7Vw=
MIME-Version: 1.0
Received: by 10.100.126.19 with SMTP id y19mr4544546anc.47.1239244494689; Wed, 
	08 Apr 2009 19:34:54 -0700 (PDT)
In-Reply-To: <20090408180920.GN2195@smtp.west.cox.net>
References: <20090408180920.GN2195@smtp.west.cox.net>
Date: Wed, 8 Apr 2009 19:34:54 -0700
Message-ID: <19c1b8a90904081934h1e43b22dk87de1bf2266c918c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.245
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS,URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [STABLE][PATCH] mingw-binutils: Add 2.19.1 recipe and split common parts out into mingw-binutils.inc
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
X-List-Received-Date: Thu, 09 Apr 2009 02:38:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2009 at 11:09 AM, Tom Rini <trini@kernel.crashing.org> wrote=
:
> mingw-binutils: Add 2.19.1 recipe and split common parts out into mingw-b=
inutils.inc
>
> Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
> Signed-off-by: Tom Rini <trini@embeddedalley.com>
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A04 ++++
> =C2=A0...w-binutils-canadian-cross_2.17.50-20060824-1.bb | =C2=A0 =C2=A09=
 +--------
> =C2=A0.../mingw-binutils-canadian-cross_2.19.1.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A04 ++++
> =C2=A0recipes/binutils/mingw-binutils.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 10 ++++++++++
> =C2=A0.../binutils/mingw-binutils_2.17.50-20060824-1.bb =C2=A0| =C2=A0 12=
 +-----------
> =C2=A0recipes/binutils/mingw-binutils_2.19.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A06 files changed, 21 insertions(+), 19 deletions(-)
> =C2=A0create mode 100644 recipes/binutils/mingw-binutils-canadian-cross_2=
.19.1.bb
> =C2=A0create mode 100644 recipes/binutils/mingw-binutils.inc
> =C2=A0create mode 100644 recipes/binutils/mingw-binutils_2.19.1.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index c416e16..658aae7 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -2550,6 +2550,10 @@ sha256=3D6fe3c4b2d45a50582f832bc77deb4e3da74a15ea8=
e09dbb214b9c44e7c3378fc
> =C2=A0md5=3D9d22ee4dafa3a194457caf4706f9cf01
> =C2=A0sha256=3D487a33a452f0edcf1f8bb8fc23dff5c7a82edec3f3f8b65632b6c945e9=
61ee9b
>
> +[http://downloads.sourceforge.net/mingw/binutils-2.19.1-src.tar.gz]
> +md5=3Dad3f2b5fdcd599a772ad75fec2c384d8
> +sha256=3D2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e=
7
> +
> =C2=A0[ftp://ftp.gnu.org/gnu/binutils/binutils-2.19.1.tar.bz2]
> =C2=A0md5=3D09a8c5821a2dfdbb20665bc0bd680791
> =C2=A0sha256=3D3e8225b4d7ace0a2039de752e11fd6922d3b89a7259a292c347391c478=
8739f6
> diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060=
824-1.bb b/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-=
1.bb
> index 385aa1d..7f80a77 100644
> --- a/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.b=
b
> +++ b/recipes/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.b=
b
> @@ -1,11 +1,4 @@
> =C2=A0require mingw-binutils_${PV}.bb
> =C2=A0require binutils-canadian-cross.inc
>
> -DEFAULT_PREFERENCE_sdk-mingw32 =3D "1"
> -DEFAULT_PREFERENCE_sdk-mingw64 =3D "1"
> -
> -require binutils-canadian-cross.inc
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
> -
> -S =3D "${WORKDIR}/binutils-${PV}-src"
> +DEFAULT_PREFERENCE_mingw32 =3D "1"
> diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb b/r=
ecipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> new file mode 100644
> index 0000000..7f80a77
> --- /dev/null
> +++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
> @@ -0,0 +1,4 @@
> +require mingw-binutils_${PV}.bb
> +require binutils-canadian-cross.inc
> +
> +DEFAULT_PREFERENCE_mingw32 =3D "1"
> diff --git a/recipes/binutils/mingw-binutils.inc b/recipes/binutils/mingw=
-binutils.inc
> new file mode 100644
> index 0000000..1e3898a
> --- /dev/null
> +++ b/recipes/binutils/mingw-binutils.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "A GNU collection of binary utilities - MinGW port"
> +HOMEPAGE =3D "http://www.mingw.org/"
> +
> +require binutils.inc
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
> +
> +S =3D "${WORKDIR}/binutils-${PV}"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> diff --git a/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb b/reci=
pes/binutils/mingw-binutils_2.17.50-20060824-1.bb
> index 9d17873..7021cfe 100644
> --- a/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb
> +++ b/recipes/binutils/mingw-binutils_2.17.50-20060824-1.bb
> @@ -1,12 +1,2 @@
> -PR =3D "r1"
> -
> -require binutils.inc
> -
> -DESCRIPTION =3D "A GNU collection of binary utilities - MinGW port"
> -HOMEPAGE =3D "http://www.mingw.org/"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
> -
> +require mingw-binutils.inc
> =C2=A0S =3D "${WORKDIR}/binutils-${PV}-src"
> -
> -DEFAULT_PREFERENCE =3D "0"
> diff --git a/recipes/binutils/mingw-binutils_2.19.1.bb b/recipes/binutils=
/mingw-binutils_2.19.1.bb
> new file mode 100644
> index 0000000..0f719ed
> --- /dev/null
> +++ b/recipes/binutils/mingw-binutils_2.19.1.bb
> @@ -0,0 +1 @@
> +require mingw-binutils.inc
> --
> 1.5.6.3
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Acked-By: Khem Raj <raj.khem@gmail.com>


