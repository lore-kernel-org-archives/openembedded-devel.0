Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pr5nS-0000Uc-Ql
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 10:41:43 +0100
Received: by iyj8 with SMTP id 8so4902083iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=nfXqVOzBSTErjAQIADqS5wAIwqatlxwRkZRxlYGimxw=;
	b=ekAFOhkWvJSB7t9H4sV/iaJaYrHJPV443ogSIjEa0Lhhq0/WaP+EFDdT18jzqZNngt
	k+Qlm9tx5IEMpSzC/EKbr6Bftu9oyXdD5ieFxCoFiqMgux8jNXv0I4S3y79lcAPkx5ml
	Ucx1/J7Kbu94aotCHzL9GiuONK6sQH1EsjZLI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=F3pok9t+pWJrvCHdGnTqfCitDj9b99UArj42IgC5XdKN7EjT+fNgPN4l7kaEGJc2no
	07m5eqacpVY23l02VSBVOy0IOEoot9nlsIdp38EHpcImKiQK8qfHhRpCjxn1wmZBuwkt
	LJnLeSZVNmCdsBEImD19n401UhmjxvjSHfeTo=
MIME-Version: 1.0
Received: by 10.231.35.200 with SMTP id q8mr172391ibd.147.1298194674808; Sun,
	20 Feb 2011 01:37:54 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sun, 20 Feb 2011 01:37:54 -0800 (PST)
In-Reply-To: <1298051011-10445-8-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
	<1298051011-10445-8-git-send-email-otavio@ossystems.com.br>
Date: Sun, 20 Feb 2011 10:37:54 +0100
Message-ID: <AANLkTik89-uYd5sOW80+ef_wL4=2HQ0XUTBZm=70Myu=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 07/16] libinih: add
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
X-List-Received-Date: Sun, 20 Feb 2011 09:41:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/18 Otavio Salvador <otavio@ossystems.com.br>:
> This provides a C and C++ INI library that can be statically linked
> into projects.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Acked-by: Khem Raj <raj.khem@gmail.com>

I pushed this recipe yesterday, but apparently it seems to break the
build, so I reverted it.
Guess this is the bad guy:
SRCREV =3D "${AUTOREV}"
anyway using autorev is not really desired (didn't realize it when pushing)

Otavio can you come with a better version?

Frans

> ---
> =A0recipes/libinih/libinih_git.bb | =A0 14 ++++++++++++++
> =A01 files changed, 14 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/libinih/libinih_git.bb
>
> diff --git a/recipes/libinih/libinih_git.bb b/recipes/libinih/libinih_git=
.bb
> new file mode 100644
> index 0000000..e9f811f
> --- /dev/null
> +++ b/recipes/libinih/libinih_git.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "C and C++ INI Library"
> +PRIORITY =3D "optional"
> +PV =3D "0.0+gitr${SRCPV}"
> +PKGV =3D "${GITPKGVTAG}"
> +PR =3D "r0"
> +LICENSE =3D "BSD"
> +RDEPENDS_${PN}-dev =3D ""
> +
> +SRCREV =3D "${AUTOREV}"
> +SRC_URI =3D "git://projetos.ossystems.com.br/git/libinih.git;protocol=3D=
git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit gitpkgv cmake
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


