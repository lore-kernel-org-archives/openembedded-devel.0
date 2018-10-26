Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E9AC579C4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 12:44:44 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l41-v6so990415qtl.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fZZSNaZS9z099xm+FGLyJM3rDA/VojolLoiDs0pxxks=;
	b=qR2slk2iCBPnqj+nqEJQhIIPPh3oH4U4KevzSBEuiS4JT+RLmp/o1UhXUx4gQtT6+u
	N1fj6hrmeOu0vQLFXXfw5wOgdSpDHmoS2G3GweV/prT4urGfjsA7BYcuQ/vI2rRJiqP4
	5Ym1MoFlW02UG8pd3reAY3h6I4Yezg6LmeypVPQKKFQTAAfV83WigsPNiYH4/d1JIKx9
	YjPswSxuKqbF6Ct+xFK2V5r0YLMWI0nsvvjXZuTAbZgp3pwFHyp5aJNVuSM7eeKkkKmW
	q4NxZFNSld0+2zSitFcWimx/vqI+D74+9JLlTLfvkQ8OXMAgIQ8DDKnvBO/xtMVGla6w
	SVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fZZSNaZS9z099xm+FGLyJM3rDA/VojolLoiDs0pxxks=;
	b=OG1VpMwfBogf2hhi0wP8vE8SY/QkHyOtqw4gq1KsgQlgwr9AWsabU/gyTHJd5R6OLR
	xB0WHA7WTna1Gos7v4yFW1zYTBaNh2NQ1zduAzCReB9nOLbALzG6L4u+iNf5l1mDuun7
	eQjh9WQvZ3cGTINOf/8uR58H259ftJ+VpMIWOEdIfOC1rKNg94F4gLGeiTvN+Fqxu0/t
	s3vtJ+dL+fcW4mURgPnKOpFgZHf77vo+gpQ3672Ibf4lUTIJXYBwHg3B7OEIZ8gqcjBy
	FLXdMCcWOoHU1jhgeTCnezTyVg/rqWCYG97f5unOew8sLI3GTYmrq6bWVDn0N1sFTQcN
	4D9A==
X-Gm-Message-State: AGRZ1gJOdqfKlTY+cfter8kKToAjeiwOWdFMQWQL+A51X7ahdSzpmzqp
	KrEXRH0+qAPa9KB8SaibhZClnmh2MCdAjmSMUbc=
X-Google-Smtp-Source: AJdET5fbCZf4z54RXQ1+4jC+EokkwhBw9F7Nx1e1UGYNNLlcqyoBdESbfBZtwvn3M3w1rAfGXzeJXLI1Aq6Ck4e3lUU=
X-Received: by 2002:aed:3024:: with SMTP id 33-v6mr3010436qte.29.1540557885039;
	Fri, 26 Oct 2018 05:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Oct 2018 13:44:19 +0100
Message-ID: <CAMKF1sqS-wLnd-ULxV+sL9REtC94Btc=FNzyw=pVg9cBtqQaOw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] xfce4-settings: upgrade 4.12.3 -> 4.12.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2018 12:44:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas

On Fri, Oct 26, 2018 at 11:49 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * A GTK3 version is abvailable but keep GTK2: haven't found the time yet =
to
>   rework my additions which I would miss.
> * 0002-Fix-linking-to-dbus-glib-bug-13633.patch had to be aligned slightl=
y for
>   changed sources.

I dont see these changes in the patch. It just is the recipe bumping
the SRC_URI and PV

>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb =
b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> index d937653fa..a4685aed3 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> @@ -13,13 +13,13 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>  # + minor bugfixes - sent mainline but no response
>  # + option to hide mousepointer for a specific (touch) input device - se=
nt mainline but no response
>  SRC_URI =3D " \
> -    git://github.com/schnitzeltony/xfce4-settings.git;protocol=3Dgit;bra=
nch=3Dfor-oe-4.12.3 \
> +    git://github.com/schnitzeltony/xfce4-settings.git;protocol=3Dgit;bra=
nch=3Dfor-oe-4.12.4 \
>      file://0001-xsettings.xml-Set-default-themes.patch \
>      file://0002-Fix-linking-to-dbus-glib-bug-13633.patch \
>  "
> -SRCREV =3D "b701ac8b66b83c17469dd5009da51eeb59eba442"
> +SRCREV =3D "75d7c9b15e5ccce12b0864d3659ae9b6de96e245"
>  S =3D "${WORKDIR}/git"
> -PV =3D "4.12.3+git${SRCPV}"
> +PV =3D "4.12.4+git${SRCPV}"
>
>  EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
>
> --
> 2.14.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

