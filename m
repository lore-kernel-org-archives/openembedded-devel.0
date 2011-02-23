Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsKSA-0000r7-2f
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 20:32:50 +0100
Received: by fxm8 with SMTP id 8so3933284fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=AlEwe5LbjRTFwtBTIoqL8Q8+O12wegQ+D1AFQaS6ghM=;
	b=cZpzDxr7Se07AO1F3DlwJuEsb3xUprCjU8IyQO7i3yluP6uD3X138YMTjxPvLE8Bi0
	DehCLNGWRuuxPr0elwJYzSqwic1ixQ7aOOas1dD+eYrw3E3zfxP1NoQ6yI9e7WY8QjCf
	4I/0wGw7tLjpBOx21QM982a8haheCcNP4J8yA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=asqK/gOn3ynO1cPEHPqSKOckuncGv7NV24SsSIZvWrvK/r9neN/VC0h16PWL0qmzPy
	cdabqpz57w621Fc4jBHn3agTrC+TQ309y7/yj5xmQPdqbXePeCa1jziC8Q9u8ryDVvRy
	4faOTdB7hw2a8NSQ8aWnsrfSj/UtNlEbikuwM=
Received: by 10.223.79.14 with SMTP id n14mr5778493fak.19.1298489329935; Wed,
	23 Feb 2011 11:28:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 11:26:01 -0800 (PST)
In-Reply-To: <4D65557C.3020709@mwester.net>
References: <4D65557C.3020709@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 11:26:01 -0800
Message-ID: <AANLkTi=esa8SRXwtvzMUcYfbYW8cW4eUHxnwohRDG652@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] groff - fix do_install failure
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
X-List-Received-Date: Wed, 23 Feb 2011 19:32:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 10:44 AM, Mike Westerhof <mike@mwester.net> wrote:
> Bitbaking groff fails in the do_install step, complaining that img/pic* d=
oes
> not exist. =C2=A0Normally, these files would be created by groff itself d=
uring the
> build process, but since we are cross-compiling, the old recipe replaces =
the
> invocation of groff and troff with echo commands. =C2=A0However, echo doe=
s not
> create the output files, which eventually results in the do_install failu=
re.
>
> This patch makes groff dependent on groff-native, and instead of using ec=
ho,
> it instructs the build process to use the staged groff binaries.
>
> Signed-off-by: Mike Westerhof <mike@mwester.net>

looks good.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> ---
> diff --git a/recipes/groff/groff_1.20.1.bb b/recipes/groff/groff_1.20.1.b=
b
> index 6ea87dc..5869ff7 100644
> --- a/recipes/groff/groff_1.20.1.bb
> +++ b/recipes/groff/groff_1.20.1.bb
> @@ -1,7 +1,10 @@
> =C2=A0DESCRIPTION =3D "GNU roff"
> =C2=A0SECTION =3D "base"
> =C2=A0LICENSE =3D "GPL"
> -PR =3D "r2"
> +PR =3D "r3"
> +
> +DEPENDS =3D "groff-native"
> +DEPENDS_virtclass-native =3D ""
>
> =C2=A0SRC_URI =3D "http://ftp.gnu.org/gnu/groff/groff-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> @@ -15,10 +18,10 @@ PARALLEL_MAKE =3D ""
> =C2=A0do_configure_prepend(){
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^GR=
OFFBIN=3D/s:=3D.*:=3Decho:' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^TR=
OFFBIN=3D/s:=3D.*:=3Decho:' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^GR=
OFF_BIN_PATH=3D/s:=3D.*:=3D:' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^GR=
OFF_BIN_DIR=3D/s:=3D.*:=3D:' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^GR=
OFFBIN=3D/s:=3D.*:=3D${STAGING_BINDIR_NATIVE}/groff:' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^TR=
OFFBIN=3D/s:=3D.*:=3D${STAGING_BINDIR_NATIVE}/troff:' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^GR=
OFF_BIN_PATH=3D/s:=3D.*:=3D${STAGING_BINDIR_NATIVE}:' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^GR=
OFF_BIN_DIR=3D/s:=3D.*:=3D${STAGING_BINDIR_NATIVE}:' \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}=
/contrib/*/Makefile.sub \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}=
/doc/Makefile.in \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}=
/doc/Makefile.sub
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


