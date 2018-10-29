Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61E4879C64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 23:10:04 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id f21-v6so5583865oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WWyr1ZfXpeEjE5XFtOIfWPCWQTTut3zwS/jKnIsZDkY=;
	b=LEN5egl0glgRXZYy53HcWYSI1GA25Yd9Q8eBDc10/8S1ojswke/7g8jhfCO+MLfqds
	god1IzHufaD4lpr5KlOeo1Ndw702sFUaCNd6z4VSXBvoUZ2q/qntcXs497G+c79pXF7N
	IaxcAk8hQjr/WSq681FEkx5URsPsGewUf7CGJNDOZjjTgQhCEr79kR5kqxeKpSumwDn9
	9+GwPCK1MGNrUEODTBCHubcysB/XTW9gZZb8V/CnI10/W2OX/K4k/Ep2nlsXWYVID94R
	t8A9dQplyp/NwqUZQu9c8VpEG3tPIOAbFPlDeMgpWPCAksIw9qDTjKKLBVtg3pwfyKqy
	Xpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WWyr1ZfXpeEjE5XFtOIfWPCWQTTut3zwS/jKnIsZDkY=;
	b=GmUeB5EzNDEMlRl88Zhsed/rEde9pAEEBzcRpMfJZx7mraEyYwUTmZveMGoeYzf+jk
	KhriWQxAl9aDR4/yiwgOP6954+zzVcKZbJtMLGeTR/1hvzy4x8G+pDLkiStN63+7appC
	LG13mzbsLxO8OLksIw/u7ErfGn1SsoacG1ompSAB0Joao6bmpFk2XMqgLipEINJ3b44c
	CmgAkc5dK23yNNOdqEyHaRNJeJ1jOlFEMeWI87aKTIUMpeNffMvBU9jTp7azwSvIuJUN
	UqIcog2zFle0kyvmSTPugog37wmz8skRKgeXXHDEM4R6EvCk7imSdltC/TXRtwGgUnfZ
	Ojmw==
X-Gm-Message-State: AGRZ1gJPBLFln5JeWp2mw/v/uC1O5A9BuAFmp7OXh/j9B+qDe2u5A5zN
	hMj+oifzlgJOcoDYC/FAMmF4tOmTX5wNWujg3FE=
X-Google-Smtp-Source: AJdET5cWIxjYHnhDB7U9P5L0jWXKG21Xh2LTHujcBCOERZw8EV4oUtDHLOlQam1hWbHdku1xP27iT5rtad4dmBUifE0=
X-Received: by 2002:aca:2b0a:: with SMTP id i10-v6mr9968920oik.7.1540854605390;
	Mon, 29 Oct 2018 16:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<dd28c909c895c7e30064a9646f5ccbde1414d3fa.1540830650.git.brendank310@gmail.com>
In-Reply-To: <dd28c909c895c7e30064a9646f5ccbde1414d3fa.1540830650.git.brendank310@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 30 Oct 2018 00:09:52 +0100
Message-ID: <CALbNGRRuq_=ZFWu_Bv_TR=sWUh6u3TuJSbrKzjPJ9L_8DZDCww@mail.gmail.com>
To: brendank310@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 16/16] gnome-tweak-tool: add recipe for the GNOME Tweak tool
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
X-List-Received-Date: Mon, 29 Oct 2018 23:10:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:42 PM brendank310 <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by:  Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../recipes-gnome/gnome3/gnome-tweaks_git.bb  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb b/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
> new file mode 100644
> index 000000000..fe305c922
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/gnome-tweaks_git.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "GNOME Tweaks"
^ Maybe I have missed this in other patches: SUMMARY is default short
description
> +LICENSE = "GPLv2"
> +DEPENDS = " \
> +            gnome-shell \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://LICENSES/GPL-3.0;md5=9eef91148a9b14ec7f9df333daebc746"
> +
> +SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-tweaks.git;protocol=http;branch=master;tag=3.30.1 \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN} += "${libdir}"
> +FILES_${PN} += "${datadir}"
^ again libdir necessary? / one staetment / end of recipe
> +
> +inherit pkgconfig meson gobject-introspection gettext
> +
> +
> --
> 2.17.1
>

