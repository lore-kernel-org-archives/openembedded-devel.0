Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 977F47DF54
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 22:41:54 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z4so116831iol.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2019 15:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l6QkkzZKOY32GIQrGwCYPNF3uBmOWTSSrxenfprR784=;
	b=fe/ioZpWQkKmDq9tnKWv6jilqjNlnGRxvCZKNPaqRzlI26YqmvxQj1FUSFQlooCuVC
	GrCUFAwie+X62vSyzljNuC+2AiBPC1dW0ZNzN4FEiJn2KJArSuuXKGb/AZkJfi9c/fLD
	bMLKzEAYWvyz7JoovZaIkOqNQbaoKRbVUhMwNNzdaTlZZ54M/zioxh1GG2OPACH3XVk5
	ZNlt8zQcFREdQybi8XGSCPowJtSBzZigzYsxgWyC3pbMWzl+fvFtVElr2XaY2SU/uoKL
	sn3pdXEqmpx/scDUa0LUkCb8mzqTHFk7X1C9x7C6zY9WmqyoMdDKK4zWUc8QzN3fppjg
	xHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l6QkkzZKOY32GIQrGwCYPNF3uBmOWTSSrxenfprR784=;
	b=pY6QGfiy8CHFaP8ZUB6DPa8iAJ3dIyaMTf5fxDX82iEVYqU/Nnu2L5ovZyu5Bf2zJ8
	KZ4vdrMh069/TlG8VCqce/DkrnyFqBNWWjmFUTAnOxgTyl5q03MhFLLwA1Ctc1YiHxC2
	JolPeyz+iLPoCOJx9BUoFiyilBHsDcav6xknzoBLOLOCDIf/bl9TBTe2rXT69cSUAeWP
	pZvsDI8Yfjs1JKrqJ+azyt8fzh2Z4U6kvmGH5SexMSJjwgvL0yRtyavM/bR3B9XsFW67
	YtFnP+0T5aI8V7sQtRdixm6JnOkqKmOM5Si16Jh0GY9jU9jbJHNE8u5LE41kzlgTdTzV
	othA==
X-Gm-Message-State: APjAAAWTTpOk7ewCbRJBPXVhcx2564jt4DFc3uTCWPG8uqdwBfnjj7k6
	3yTIlKiukDOq9/S2l2hrnkAGfRCojQJbce3XXZ88Oj6WmH8=
X-Google-Smtp-Source: APXvYqwKy8Gd/F6eR4cdImZUIZkKmm8mrQ/L+6bOECQAzKrv+DFFfSflZlNKcGg8TuNacgFZgHjiyORTMHnDJfj4roA=
X-Received: by 2002:a6b:740a:: with SMTP id s10mr297619iog.99.1557355315306;
	Wed, 08 May 2019 15:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <155735130373.6243.13450815632034893448@git.openembedded.org>
	<20190508213504.26FC4234A1D@git.openembedded.org>
In-Reply-To: <20190508213504.26FC4234A1D@git.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 May 2019 00:41:43 +0200
Message-ID: <CALbNGRRq5NnZ0GXihZU=kNNfBjOUg6Ep83eM8A7FTDWhkpACaA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [oe-commits] [meta-openembedded] 04/06: fluidsynth: Explicitly disable readline support
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
X-List-Received-Date: Wed, 08 May 2019 22:41:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 11:35 PM <git@git.openembedded.org> wrote:
>
> This is an automated email from the git hooks/post-receive script.
>
> khem pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 07f0d6fed45f6f6148b5e6634e543c9fff0e1fbd
> Author: Adrian Bunk <bunk@stusta.de>
> AuthorDate: Wed May 8 22:58:51 2019 +0300
>
>     fluidsynth: Explicitly disable readline support
>
>     readline is GPL, so make it explicit that it shouldn't
>     be enabled accidentally.
>
>     Signed-off-by: Adrian Bunk <bunk@stusta.de>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> index 4f600a2..9a8cb87 100644
> --- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> +++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
> @@ -8,7 +8,7 @@ SRC_URI += " \
>      file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
>  "
>
> -EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
> +EXTRA_OECMAKE = "-Denable-floats=ON -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} -Denable-readline=OFF"
>
>  do_configure_append() {
>      make_tables.exe ${B}/
>
Have to be more clear here:

NAK

It removes history functionality from fluidsynth console. This is
extremely useful for benchmarking because results vary and entering
same commands over and over again is just tedious waste of time (did
that for the NEON patch)

Unfortunately this code is part of the library so just not installing
fluidsynth-bin won't help.
So pleaaaaase add a PACKAGECONFIG for this (with whatever default - I
am tired of strange priorities in here)

Andreas

