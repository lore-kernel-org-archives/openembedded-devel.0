Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LqwCO-00081d-RL
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 23:17:47 +0200
Received: by an-out-0708.google.com with SMTP id b2so3790622ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 14:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=S+DRqba9UyEI2Ng5F1geJ5Oam+d1WSJDxwky6S3uQT0=;
	b=PIDNDrho9+U7GiI3T9n1YZ5oxo09l+NDYIIVE4kgE+sU8No04l+JRSK+TCKb/AqzfD
	4g01yjCQxc1tmqwYJ+1TSlTMn7Rqd0dYXrnmVC81e14ctiNYgOiCEt0IrQhyeEw23nZj
	5kXTl5eXQll30uLk31tNZMq+76wgjG/J2Fbu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=SZBXiCoRW/s3JytDXIHDOjjwYiBD9VeS6soeNXO/kWEQUHKB52J+hdEkwra0H0Jh5J
	RDaMFi1Axl5oMEbBaGw+G89b8NVyuweMChsqz4xTUA/4cIubUkWgtYq+8+fnm76R5Q6z
	5tFhZUlRV7iQPqwfELV3Dkgtbai4G1/qDtoec=
MIME-Version: 1.0
Received: by 10.100.11.14 with SMTP id 14mr7909480ank.88.1239052492266; Mon, 
	06 Apr 2009 14:14:52 -0700 (PDT)
In-Reply-To: <1238737194-32521-1-git-send-email-jeremy.laine@bolloretelecom.eu>
References: <1238737194-32521-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Date: Mon, 6 Apr 2009 14:14:52 -0700
Message-ID: <19c1b8a90904061414o44b672b8x6c025f1df7a9b505@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.244
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?UTF-8?Q?Jeremy_Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: Re: [STABLE][PATCH] qt4-tools-native: set LFLAGS to pick up zlib from staging
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
X-List-Received-Date: Mon, 06 Apr 2009 21:17:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/2/09, Jeremy Lain=C3=A9 <jeremy.laine@bolloretelecom.eu> wrote:
> From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
>
>
> Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
> ---
>  recipes/qt4/files/configure-lflags.patch |   13 +++++++++++++
>  recipes/qt4/qt4-tools-native.inc         |    3 ++-
>  recipes/qt4/qt4-tools-native_4.4.3.bb    |    2 +-
>  recipes/qt4/qt4-tools-native_4.5.0.bb    |    2 +-
>  4 files changed, 17 insertions(+), 3 deletions(-)
>  create mode 100644 recipes/qt4/files/configure-lflags.patch
>
> diff --git a/recipes/qt4/files/configure-lflags.patch
> b/recipes/qt4/files/configure-lflags.patch
> new file mode 100644
> index 0000000..df19549
> --- /dev/null
> +++ b/recipes/qt4/files/configure-lflags.patch
> @@ -0,0 +1,13 @@
> +Index: qtopia-core-opensource-src-4.3.3/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtopia-core-opensource-src-4.3.3.orig/configure	2008-01-14
> 08:53:51.000000000 +0000
> ++++ qtopia-core-opensource-src-4.3.3/configure	2008-01-14
> 08:54:07.000000000 +0000
> +@@ -447,7 +447,7 @@
> + # initalize variables
> +
> #------------------------------------------------------------------------=
-------
> +
> +-SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS"
> ++SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
> + for varname in $SYSTEM_VARIABLES; do
> +     cmd=3D`echo \
> + 'if [ -n "\$'${varname}'" ]; then
> diff --git a/recipes/qt4/qt4-tools-native.inc
> b/recipes/qt4/qt4-tools-native.inc
> index fe2f94a..df5afd3 100644
> --- a/recipes/qt4/qt4-tools-native.inc
> +++ b/recipes/qt4/qt4-tools-native.inc
> @@ -8,6 +8,7 @@ LICENSE =3D "GPL"
>  inherit native
>
>  SRC_URI =3D
> "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}=
.tar.bz2
> \
> +           file://configure-lflags.patch;patch=3D1 \
>             file://qt-config.patch;patch=3D1 \
>             file://g++.conf \
>             file://linux.conf"
> @@ -29,7 +30,7 @@ EXTRA_OECONF =3D "-prefix ${prefix} \
>  EXTRA_OEMAKE =3D " "
>
>  do_configure() {
> -    echo yes | ./configure ${EXTRA_OECONF} || die "Configuring qt failed=
.
> EXTRA_OECONF was ${EXTRA_OECONF}"
> +    echo yes | LFLAGS=3D"-L${STAGING_LIBDIR_NATIVE}" ./configure
> ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was
> ${EXTRA_OECONF}"
>  }
>
>  TOBUILD =3D "\
> diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb
> b/recipes/qt4/qt4-tools-native_4.4.3.bb
> index 8a8d46f..ef86db4 100644
> --- a/recipes/qt4/qt4-tools-native_4.4.3.bb
> +++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
> @@ -1,2 +1,2 @@
>  require qt4-tools-native.inc
> -PR =3D "r2"
> +PR =3D "r3"
> diff --git a/recipes/qt4/qt4-tools-native_4.5.0.bb
> b/recipes/qt4/qt4-tools-native_4.5.0.bb
> index 6e5474b..ab63314 100644
> --- a/recipes/qt4/qt4-tools-native_4.5.0.bb
> +++ b/recipes/qt4/qt4-tools-native_4.5.0.bb
> @@ -1,5 +1,5 @@
>  require qt4-tools-native.inc
> -PR =3D "r0"
> +PR =3D "r1"
>
>  DEFAULT_PREFERENCE =3D "-1"
>  TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
> --
> 1.5.6.5
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

We need a linker flag here so why not append to LDFLAGS instead of
introducing a new variable ?


