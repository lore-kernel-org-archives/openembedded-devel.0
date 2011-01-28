Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PigKg-0000og-8Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 05:53:14 +0100
Received: by ywi6 with SMTP id 6so926761ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 20:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=EJOjQHW6/GWwlvRGTrn62ubwmhjPoIJtjcbDarTUBAo=;
	b=jeu/CZH/28ar7zQt+gftx0ta+fBjkxlE/CI6WXi51Ah+hoWD8zukHKqX8XdURthDmw
	DX+ItsANYq0mE5KuMsmMMxsZOlI5/Go41CYqOL+ror34dntTdG3vE64tRsRyr88lMeHN
	jiRoSzRktPzVwgVG0dX/AT6S27mfzRNTXxLzg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gOSe0JcyH2IQ+rnJZkjBItdMiWgNl7iinA67E85sCjzdXBco6W6NH3dwbUGkTcydk5
	+hic9giTHgdfR0k72kr7mPvPSkJk0/UpGyd5N8y5Ym4qgROJvuJjsEy5GPQBa/mKVtfa
	D+MLPTqr6pzFsOC2itf9d4PVUKZ6Y/H+eTXfI=
Received: by 10.90.66.17 with SMTP id o17mr1649842aga.88.1296190343823; Thu,
	27 Jan 2011 20:52:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 27 Jan 2011 20:52:03 -0800 (PST)
In-Reply-To: <1296114247-11702-2-git-send-email-Martin.Jansa@gmail.com>
References: <1296114247-11702-1-git-send-email-Martin.Jansa@gmail.com>
	<1296114247-11702-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2011 20:52:03 -0800
Message-ID: <AANLkTikD5bnkWpQQTjoC4hVF-hTah6LfmYkWYKV=RiRj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] xbiff: upgrade from 1.0.2 to 1.0.3
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
X-List-Received-Date: Fri, 28 Jan 2011 04:53:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2011 at 11:44 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/xorg-app/xbiff_1.0.2.bb | =C2=A0 =C2=A07 -------
> =C2=A0recipes/xorg-app/xbiff_1.0.3.bb | =C2=A0 =C2=A07 +++++++
> =C2=A02 files changed, 7 insertions(+), 7 deletions(-)
> =C2=A0delete mode 100644 recipes/xorg-app/xbiff_1.0.2.bb
> =C2=A0create mode 100644 recipes/xorg-app/xbiff_1.0.3.bb
>
> diff --git a/recipes/xorg-app/xbiff_1.0.2.bb b/recipes/xorg-app/xbiff_1.0=
.2.bb
> deleted file mode 100644
> index 66cd182..0000000
> --- a/recipes/xorg-app/xbiff_1.0.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require xorg-app-common.inc
> -DEPENDS +=3D " libxaw xbitmaps libxext"
> -PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[archive.md5sum] =3D "1d4ad06725f9dc4b877ecd210b7b1607"
> -SRC_URI[archive.sha256sum] =3D "7c21763a90599ad627739804ba76dd33516b76cc=
e440294e1154bf680eca60f7"
> diff --git a/recipes/xorg-app/xbiff_1.0.3.bb b/recipes/xorg-app/xbiff_1.0=
.3.bb
> new file mode 100644
> index 0000000..5ac26d2
> --- /dev/null
> +++ b/recipes/xorg-app/xbiff_1.0.3.bb
> @@ -0,0 +1,7 @@
> +require xorg-app-common.inc
> +DEPENDS +=3D " libxaw xbitmaps libxext libxmu"
> +PE =3D "1"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "f38a0c63c2a7ed6fb9d6f8884785b5c9"
> +SRC_URI[archive.sha256sum] =3D "aa1db4f31f7afcfe131bda7ff6e380ff7de41cf1=
a7009464783043c817c47ce8"
> --
> 1.7.4.rc3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


