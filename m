Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SMLKh-0006J8-L4
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 17:37:43 +0200
Received: by wera1 with SMTP id a1so7644077wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=YwR9XqZIwgu6ITRL68rUnKwHTj1eT+QK/ltBok/7XHs=;
	b=ULLwpR5GiFc1jiH4L2AeRV9fe0G8WwEGEHKWs6nnn54WgCdf106ekfYSqyiDTDfVG6
	PmrPXcOv0HbfMKCVZmYEziOrMjOckfZX/HlMuAacGGsscxYHbBzuFkAQiw46QWj6/t4S
	dhS/TMuNTXpGHQF5kF0B7HxyDY9JBGfksipjX3mvZC9ycGb3/+8+e3jEfQBGnDh/q9e5
	Ia2wGSEiNW5K/T0Tsi1vxaI5ZPiQEc63wEdzmnYgaSpPZI0YJpXQFO56stQ0Sql/GcY2
	N8ui85kGbX0MAo2Wd7lVLNS+jO6FpmmwmFaDAEKsHgUITmD3LlCwCXyntW75mIwCZTa0
	FcdA==
MIME-Version: 1.0
Received: by 10.180.88.169 with SMTP id bh9mr22605694wib.5.1335194889969; Mon,
	23 Apr 2012 08:28:09 -0700 (PDT)
Received: by 10.223.159.15 with HTTP; Mon, 23 Apr 2012 08:28:09 -0700 (PDT)
In-Reply-To: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
References: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 23 Apr 2012 17:28:09 +0200
Message-ID: <CAGiJk9cpZH1gTD0=C0LH3JSoqHTwdhtbOaYg477cWUEfdJRh2g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-kde][PATCH] qt4-x11-free 4.8.0 bbappend: fix GLES configure switch and turn it on for AM335x SoCs as well
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
X-List-Received-Date: Mon, 23 Apr 2012 15:37:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/23 Koen Kooi <koen@dominion.thruhere.net>:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =C2=A0recipes-misc-support/qt4-x11-free_4.8.0.bbappend | =C2=A0 =C2=A05 +=
++--
> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend b/recipes-m=
isc-support/qt4-x11-free_4.8.0.bbappend
> index b5a3c16..4895893 100644
> --- a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> +++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> @@ -1,7 +1,8 @@
> -QT_GLFLAGS_omap3 =3D "-egl"
> +QT_GLFLAGS_omap3 =3D "-opengl es2 "
> =C2=A0DEPENDS_append_omap3 =3D " libgles-omap3"
> +DEPENDS_append_ti33x =3D " libgles-omap3"
>
> =C2=A0# Needed by kdelibs
> =C2=A0QT_DISTRO_FLAGS =3D "-accessibility -sm"
>
> -PRINC :=3D "${@int(PRINC) + 1}"
> \ No newline at end of file
> +PRINC :=3D "${@int(PRINC) + 2}"
> --
> 1.7.7.6
>


Applied, thanks.

You don't need QT_GLFLAGS_ti33x =3D "-opengl es2 " in the .bbappend?


--=20
Regards
Samuel


