Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LjPJW-00020b-Kc
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 03:46:00 +0100
Received: by rv-out-0708.google.com with SMTP id c5so1615103rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 19:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=R2r9YkrutqMrh6HzW+YAoWxVLIIKcVnnx0VwiIDlhts=;
	b=AgEHe/XGHXtt53QYM2/kOLxj/JSf79LFDFR7cdTEiybYnS9Lyb/vWX5siMJmlYLOBg
	flt7FaA9S0uyYz/ef+J2HYdOFyvsN9VBfWSpPvzhLpYfRsaHqKoS/DdYjvcZeDT7Lom4
	dW8Eu/KPwtXNwQWwcUZ4IUdiCICCN98GxBsx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=bsTuxb5d/sHRTf2RWGbqKKdjvFtcN0PxHOSFC7em4w610EWuEINEdtmp4k99isJ6a1
	krWpYsjajmbb9fOIsBW4jj5Cw/+gvgbdhHN8MfavT0iyG0o76xusTiMCsquMQ8wbELPe
	S30MhUBc0Y9RRjHuSI2Cvwk771W5RJKu4Ltm8=
Received: by 10.114.153.2 with SMTP id a2mr3831735wae.170.1237257916722;
	Mon, 16 Mar 2009 19:45:16 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-2-112.dsl.pltn13.sbcglobal.net
	[71.146.2.112])
	by mx.google.com with ESMTPS id n30sm5693126wag.56.2009.03.16.19.45.15
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Mar 2009 19:45:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2009 19:45:12 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-10-generic; KDE/4.2.1; x86_64; ; )
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<1237246365-32076-3-git-send-email-denis@denix.org>
In-Reply-To: <1237246365-32076-3-git-send-email-denis@denix.org>
MIME-Version: 1.0
Message-Id: <200903161945.13973.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.198.248
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] recipes: fix hardcoded instances of packages/
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
X-List-Received-Date: Tue, 17 Mar 2009 02:46:01 -0000
X-Groupsio-MsgNum: 8471
Content-Type: multipart/signed; boundary="nextPart24769972.IFcs0DV9nW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart24769972.IFcs0DV9nW
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 16 March 2009 16:32:43 Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes/kexecboot/linux-kexecboot.inc |    2 +-
>  recipes/libffi/libffi_2.0+gcc4.3.2.bb |    2 +-
>  recipes/libffi/libffi_3.0.8.bb        |    2 +-
>  recipes/mamona/gcc-noemu_4.1.1.bb     |    2 +-
>  recipes/mamona/gcc-noemu_4.1.2.bb     |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes/kexecboot/linux-kexecboot.inc b/recipes/kexecboot/li=
nux-kexecboot.inc
> index 2056758..31b6377 100644
> --- a/recipes/kexecboot/linux-kexecboot.inc
> +++ b/recipes/kexecboot/linux-kexecboot.inc
> @@ -6,7 +6,7 @@ SRC_URI =3D "file://defconfig"
>  LOGO_SIZE =3D '${@base_conditional("GUI_MACHINE_CLASS", "bigscreen", "vg=
a", "qvga", d)}'
>  SRC_URI +=3D "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
> =20
> -require packages/linux/linux.inc
> +require recipes/linux/linux.inc
> =20
>  DONT_CHECK_KERNELSIZE =3D ""
>  INITRAMFS_IMAGE =3D "initramfs-kexecboot-image"
> diff --git a/recipes/libffi/libffi_2.0+gcc4.3.2.bb b/recipes/libffi/libff=
i_2.0+gcc4.3.2.bb
> index 5a2ae1a..be98050 100644
> --- a/recipes/libffi/libffi_2.0+gcc4.3.2.bb
> +++ b/recipes/libffi/libffi_2.0+gcc4.3.2.bb
> @@ -1,4 +1,4 @@
> -require packages/gcc/gcc-common.inc
> +require recipes/gcc/gcc-common.inc
>  SECTION =3D "libs"
>  DESCRIPTION =3D "Foreign Function Interface library"
>  LICENSE =3D "libffi"
> diff --git a/recipes/libffi/libffi_3.0.8.bb b/recipes/libffi/libffi_3.0.8=
=2Ebb
> index 0bad49b..cef09ae 100644
> --- a/recipes/libffi/libffi_3.0.8.bb
> +++ b/recipes/libffi/libffi_3.0.8.bb
> @@ -1,4 +1,4 @@
> -require packages/gcc/gcc-common.inc
> +require recipes/gcc/gcc-common.inc
> =20
>  SECTION =3D "libs"
>  DESCRIPTION =3D "Foreign Function Interface library"
> diff --git a/recipes/mamona/gcc-noemu_4.1.1.bb b/recipes/mamona/gcc-noemu=
_4.1.1.bb
> index 1582598..56ba167 100644
> --- a/recipes/mamona/gcc-noemu_4.1.1.bb
> +++ b/recipes/mamona/gcc-noemu_4.1.1.bb
> @@ -57,7 +57,7 @@ JAVA_arm =3D ""
>  JAVA =3D ""
> =20
>  LANGUAGES =3D "c,c++${FORTRAN}${JAVA}"
> -require packages/gcc/gcc-${PV}.inc
> +require recipes/gcc/gcc-${PV}.inc
> =20
>  EXTRA_OECONF +=3D "--disable-libspp --with-slibdir=3D\"/lib\""
> =20
> diff --git a/recipes/mamona/gcc-noemu_4.1.2.bb b/recipes/mamona/gcc-noemu=
_4.1.2.bb
> index 9015e10..44b1d44 100644
> --- a/recipes/mamona/gcc-noemu_4.1.2.bb
> +++ b/recipes/mamona/gcc-noemu_4.1.2.bb
> @@ -77,7 +77,7 @@ JAVA_arm =3D ""
> =20
> =20
>  LANGUAGES =3D "c,c++${FORTRAN}${JAVA}"
> -require packages/gcc/gcc-${PV}.inc
> +require recipes/gcc/gcc-${PV}.inc
> =20
> =20
>  EXTRA_OECONF +=3D " --disable-libssp --with-slibdir=3D\"/lib\" "

Ack. A small nit you also need to make necessary changes in conf files
I guess local.conf.sample etc will need to be changed.
=2D-=20
Khem Raj

--nextPart24769972.IFcs0DV9nW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm/DrkACgkQHnJKy6V6em71bgCeJkolBDOBqZ/iQXDvn1refel2
aZwAn1N/Gp3Xbe9jXhLqqZFldNFhnIgi
=d0di
-----END PGP SIGNATURE-----

--nextPart24769972.IFcs0DV9nW--
