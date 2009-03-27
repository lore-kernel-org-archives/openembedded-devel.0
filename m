Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LnELV-0005z4-Qx
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 16:51:50 +0100
Received: by gxk18 with SMTP id 18so2188632gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Sw+0ljHnu0x0syFOHDtClw3V6zuNumauWcNxmIW+HFI=;
	b=nU5CJjYqbUDWtlS54ZXDWVmuF6akAlkqFxxS9weYhHZyI7ehDE3OgsI+evkyEvKsJV
	r1Ohf4QOM6hH068FDuqbagOT8Gj6dxCxODRyUewiX6K3qnsYY7Dz5JWv24diafh+Ufq1
	On9Atpfh/YkaiEAl+vc5F82ov7xrqy5vkldUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aifSigBFvSZx9+/0z/THU7a06Xo8J0KfJNp60pyrsQAY3M8NKQToSBhGbhjQCRSMY8
	7cPColv9S7zBayQMtlEQZtEjcuXeSNtUi5Y7OqgL1mxjmeC4bDyAukfs4QOYavY++qC1
	KG6OjRpPBNayANvPvWIzZSj55ozyjm7MPrDfQ=
MIME-Version: 1.0
Received: by 10.150.200.8 with SMTP id x8mr4045350ybf.34.1238168999752; Fri, 
	27 Mar 2009 08:49:59 -0700 (PDT)
In-Reply-To: <1237996054-31234-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1237996054-31234-1-git-send-email-ihar.hrachyshka@gmail.com>
Date: Fri, 27 Mar 2009 11:49:59 -0400
Message-ID: <f96d234e0903270849q151ddf31k64e5e9130e40009d@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libzip: new recipe
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
X-List-Received-Date: Fri, 27 Mar 2009 15:51:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

pushed, thanks!

2009/3/25 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>:
> This is a C library for reading, creating, and modifying zip archives.
> Package is created for libzip-0.9
> ---
> =A0conf/checksums.ini =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++++
> =A0recipes/libzip/libzip_0.9.bb | =A0 13 +++++++++++++
> =A02 files changed, 17 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/libzip/libzip_0.9.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 9ade7df..bc4bb96 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -14398,6 +14398,10 @@ sha256=3Dccefd4ceb29bb729dcaa9a9d4a86654a9134adf=
d29bdd72be1a9d3726efb54e0
> =A0md5=3Dd6a9a020a76a3db17848d769d6c9c8a9
> =A0sha256=3D4e1f39ee16596fd2a83d28d6c3b065f742254f3336f93ce8ed1cae48ecbe4=
9da
>
> +[http://www.nih.at/libzip/libzip-0.9.tar.bz2]
> +md5=3D56b9f11c1eee5eed189a20183d7e06b0
> +sha256=3D23a8c3624122a3777bb4ac3be4a867fd0bed7f3aacb8f1d0b68fc459cfb035f=
c
> +
> =A0[http://downloads.sourceforge.net/lightblue/lightblue-0.3.3.tar.gz]
> =A0md5=3Dfb3761c8fff39a792035db4767847169
> =A0sha256=3D90b3271e5ce4de91d3651ba11b92e64fc7afb2a54ebe01826023e5bb2b53a=
3bc
> diff --git a/recipes/libzip/libzip_0.9.bb b/recipes/libzip/libzip_0.9.bb
> new file mode 100644
> index 0000000..914a0c1
> --- /dev/null
> +++ b/recipes/libzip/libzip_0.9.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "C library for reading, creating, and modifying zip arch=
ives"
> +SECTION =3D "libs"
> +HOMEPAGE =3D "http://www.nih.at/libzip"
> +LICENSE =3D "BSD"
> +DEPENDS =3D "zlib"
> +
> +SRC_URI =3D "http://www.nih.at/${PN}/${PN}-${PV}.tar.bz2"
> +
> +inherit autotools
> +
> +do_stage() {
> + =A0 =A0 =A0 autotools_stage_all
> +}
> --
> 1.6.2.rc2.22.g1d035
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


