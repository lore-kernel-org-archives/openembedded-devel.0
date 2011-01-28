Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PigJK-0000mZ-5g
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 05:51:50 +0100
Received: by yie16 with SMTP id 16so921058yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 20:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Occbwo5ma4AGqnVfYjLY/+upvbYRW/x/QG5jeEdr1Dw=;
	b=t0uVTEkXgbNo+Av4kG/kJI7FzMyEeMEQzIS764Eauz+C6dtGXnpYNF2UhO7nMpq0Dz
	uxa5yivXfIKG419r0TmjXMIwAiQkLqycxrFDsYojwDYvVGrFs8SrhEwfFik7bwzon1fu
	dzhsh6j+mYSRFpmfAS9UGPWXMslgax3YcvVlk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IRUUxZi2f2+zgieofsnaMn+tA07NQw9IAmS2cqw3xyhZpcHiE/rf/lqqAgHF54NRxg
	QjqfwiCk3ixKWOJmhPRT12Gdt9ftEO+IBKWmQze0/JZyad2HFeRfr84wf0D3dnpsZAo/
	1MynFixmGwW2Pm/WZst+Slxdfoj6CaVyogpNg=
Received: by 10.90.51.20 with SMTP id y20mr4233736agy.115.1296190258431; Thu,
	27 Jan 2011 20:50:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 27 Jan 2011 20:50:38 -0800 (PST)
In-Reply-To: <1296114247-11702-1-git-send-email-Martin.Jansa@gmail.com>
References: <1296114247-11702-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2011 20:50:38 -0800
Message-ID: <AANLkTikymCFYtdxLpWArFAe38iY4oGQEMZCatCA26F+2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] libxi: upgrade from 1.4.0 to 1.4.1
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
X-List-Received-Date: Fri, 28 Jan 2011 04:51:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2011 at 11:44 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/xorg-lib/libxi_1.4.0.bb | =C2=A0 10 ----------
> =C2=A0recipes/xorg-lib/libxi_1.4.1.bb | =C2=A0 10 ++++++++++
> =C2=A02 files changed, 10 insertions(+), 10 deletions(-)
> =C2=A0delete mode 100644 recipes/xorg-lib/libxi_1.4.0.bb
> =C2=A0create mode 100644 recipes/xorg-lib/libxi_1.4.1.bb
>
> diff --git a/recipes/xorg-lib/libxi_1.4.0.bb b/recipes/xorg-lib/libxi_1.4=
.0.bb
> deleted file mode 100644
> index 96aa92e..0000000
> --- a/recipes/xorg-lib/libxi_1.4.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require xorg-lib-common.inc
> -DESCRIPTION =3D "X11 Input extension library"
> -DEPENDS +=3D "libxext inputproto"
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "4ccdfe866f94c99b9190d16ffcfb3bdc"
> -SRC_URI[archive.sha256sum] =3D "42efe95a08c7bd28bc913bf8c34ed026abcc6250=
4307626fc5150ca360b93283"
> -
> -XORG_PN =3D "libXi"
> diff --git a/recipes/xorg-lib/libxi_1.4.1.bb b/recipes/xorg-lib/libxi_1.4=
.1.bb
> new file mode 100644
> index 0000000..39f09a1
> --- /dev/null
> +++ b/recipes/xorg-lib/libxi_1.4.1.bb
> @@ -0,0 +1,10 @@
> +require xorg-lib-common.inc
> +DESCRIPTION =3D "X11 Input extension library"
> +DEPENDS +=3D "libxext inputproto"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "e4b6fb1b08a92075469174f0cccde168"
> +SRC_URI[archive.sha256sum] =3D "599f1c0930f94c2ae74711b2577a7f354c4a991c=
c97b5ec5bb655b855c1429a6"
> +
> +XORG_PN =3D "libXi"
> --
> 1.7.4.rc3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


