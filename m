Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 28550796E4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 20:40:15 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l9-v6so11548357qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 13:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=inTZ+jtiIq3wlowoaKzL6UmzUmMFYBez0qhut03kU54=;
	b=NUqzq3+pQCeYecuPyVnCIahVzzHVcS4/nmWh/I7NxC9Y9oBr5agQMjYhHWKIoO/LbQ
	NoXll5BOv7jguTITabFMfBlMC48xWz/U60PEbbUHxbf0mVC24suVS9P8YovXvX0eFlPj
	Zw0KZYjXTEYAVHWf5BpI59+bXWdbjAHDuNnRL7yTNrDuW0pLrf6B4w4zWVTacH3lfKba
	apaIqAb5Fw2ERPrJEEZ+5B7iOK9h+6G5ttG451J4XPxvkIJiZPTp0PI4xZ4k/ayzRwBT
	bq3M4F9851tJuBOxmK3ZUjSZK+Qd0cBEq6XrqujMDFZKXfO6eFfEJ0C5cXe1UPHl8cLD
	zdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=inTZ+jtiIq3wlowoaKzL6UmzUmMFYBez0qhut03kU54=;
	b=ZQRjcxEBuPVqP+xJ52Yi5PNj35UfES66em72YA4VUdAyLDcjEv0lVnbJQ5Pv+rYNYq
	0ie6+OMCHBToqvfR8YVQdhovSRldtapgON+qxJlxwv/x4q5vqsYbj1i/xbTQfrAC8niw
	dGNCfHAqgKwgGEvvw+RCOza/lu/zwvaa+z9VR7MuS5VaOZxMkobf5nnzkrGptvtjFM0c
	MZlyMEJDQtPUr1ALh8/J/PM1Ei2WjYiC1L1ROgF+lTcSjOZHoqsLDVB/4nKCPynnS17D
	+9B+PXY/yfWiibi+/DyzovDZJ2J6lGntCdLJmQ7+rsY/JpoY6zkJZWLBd7y6y6VNTPV7
	vb/Q==
X-Gm-Message-State: AGRZ1gJ+gIlHxcS7R6izri+/Q+J2bcwBhIB0Ykf5n3FqSAiq9e62Vzlc
	aJ/WLdUTfuxU99ANJuRfLYO1eJQCDcYkGB1E2Ec=
X-Google-Smtp-Source: AJdET5c4fGb/t0q2ZkiaRQRmPT0YtNiaJshgX1JadfZ7xfFoE2hC2yRYygwmfi1R8OYIyrJXNy9DW+hjFSr3O0GZLHU=
X-Received: by 2002:ac8:16e4:: with SMTP id
	y33-v6mr729445qtk.253.1540500015730; 
	Thu, 25 Oct 2018 13:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181024084359.26705-1-max+openembedded@blarg.de>
	<20181024084359.26705-2-max+openembedded@blarg.de>
In-Reply-To: <20181024084359.26705-2-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Oct 2018 21:39:49 +0100
Message-ID: <CAMKF1soDenc53hMO1mNvxfq4xG8FVWigink4GAgF1D=MKJrDGA@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: Max Kellermann <max.kellermann@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mpd: update to 0.20.22
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
X-List-Received-Date: Thu, 25 Oct 2018 20:40:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 24, 2018 at 9:44 AM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> ---
>  .../musicpd/{mpd_0.20.21.bb => mpd_0.20.22.bb}                  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.20.21.bb => mpd_0.20.22.bb} (98%)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
> similarity index 98%
> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
> index d4edd5b31..504b9ef56 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
> @@ -20,7 +20,7 @@ SRC_URI = " \
>      git://github.com/MusicPlayerDaemon/MPD;branch=v0.20.x \
>      file://mpd.conf.in \
>  "
> -SRCREV = "98afae2520fbe5a322f803335b3142612fda4762"
> +SRCREV = "9274bc15bc41bbe490fde847f8422468cc20375d"


Fails to build
http://errors.yoctoproject.org/Errors/Details/197399/

>  S = "${WORKDIR}/git"
>
>  EXTRA_OECONF = "enable_bzip2=yes"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

