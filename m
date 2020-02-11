Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 78B7D60B17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 00:18:49 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d5so6695684qto.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 16:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5UelbZmqTZ+Q5wmlMyENxlgwJwKADTPRkXaj+jNA6mA=;
	b=HHbhxvcwxbLyKYvX+PwRatC9fzzBo/27E79egFBBChnlViEqbcrlbZcWTeK582NlJZ
	2czaxDIM2pl20gD+6SkZE0x8oply7jrEzVGJH3uvuInq58S9Xv1D+UDsLVWXYcTe5Q5j
	p2EV5U6GGNot7bepdUygFI9OhxXQLp0/YSREwjg/WI70FM1WwhjKTYNROUauhCb7RPcI
	W2f6EL+pfwoDXZWal6r8D2eiK/dhqcsB58Lf4UylO8OQj7W7boIHsrbF/G1QHA8xKoJy
	7mSOv5/L9+UcJ9esdAznn4D8WIrbVusz2S8uXugJT/WXC/KKgrFQgeKa5S9oj5RFM0MR
	APug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5UelbZmqTZ+Q5wmlMyENxlgwJwKADTPRkXaj+jNA6mA=;
	b=peW1Eod9+wrhP5gKBE0dFy9XukCx4mY4o0YZCnwJyUPhwncn+nsBfPxUfxM+TmaUA/
	JJxL0ozCQRg+Qg/w0rYRuwMFjE7tVqRqIk16mJe9gsuhOKWGS0QACLfNs4bNpfXxfB7e
	SWnnKk4zSvO/zzf7g6kiYFS83HUS+Q6gaMVAInOSapPGo6SsFyUuHxo2hTjcHbUrdUmJ
	cjgiqVtVliCtS0iQR+NueJDI304DSuB7IePTLLCSGHAJV5jimpA3opf7L5XkWK8t0kXP
	j0H1zCmhT2Cqt7qf9qEzIQxtcw2lXjHuFeZ0zbYAv0xUEFE3yWD4EDr6qPePBe41BmFd
	r5gA==
X-Gm-Message-State: APjAAAWUqXt9ZOrK7BNWOJ9RWb5ODa30bPOdJCsJ/N/F+8GtNaPOEIjD
	CXB66lfVKklMV/lrYeEja/V576MvYnIMalmx43g=
X-Google-Smtp-Source: APXvYqwg5jKOZSDCh8gsrKO/A1b5jRNOVGmcJ66EYvJxPQiwclU80FSfj7CjIqclZiTbaSdWmHWc/5W+Hu07W5WTJGk=
X-Received: by 2002:ac8:145:: with SMTP id f5mr204559qtg.194.1581380329455;
	Mon, 10 Feb 2020 16:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20200210232215.8815-1-schnitzeltony@gmail.com>
In-Reply-To: <20200210232215.8815-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2020 16:18:23 -0800
Message-ID: <CAMKF1soQO7pPfaCYdQTvAqJoj9LdRieqAQniqL+6brjptBYG7A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mozjs: Fix python3 build with gold
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
X-List-Received-Date: Tue, 11 Feb 2020 00:18:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will take this one instead of patch I posted. Thanks for quick response

On Mon, Feb 10, 2020 at 3:22 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Fixes [1]
>
> [1] http://errors.yoctoproject.org/Errors/Details/390559/
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../mozjs/mozjs/0001-Port-build-to-python3.patch      | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-pyth=
on3.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3=
.patch
> index 695dd97f6..e525047df 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.pat=
ch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.pat=
ch
> @@ -35,7 +35,7 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
>   build/moz.configure/init.configure            |  31 +-
>   build/moz.configure/keyfiles.configure        |   4 +-
>   build/moz.configure/old.configure             |  32 +-
> - build/moz.configure/toolchain.configure       |  16 +-
> + build/moz.configure/toolchain.configure       |  18 +-
>   build/moz.configure/util.configure            |   9 +-
>   build/moz.configure/windows.configure         |  10 +-
>   build/templates.mozbuild                      |   2 +-
> @@ -451,6 +451,15 @@ index fc640c75e..c5508dfb7 100755
>   def pgo_flags(compiler):
>       if compiler.type in ('gcc', 'clang'):
>           return namespace(
> +@@ -1517,6 +1517,8 @@ def enable_gnu_linker(enable_gold_option, c_compil=
er, developer_options, build_e
> +         gold =3D check_cmd_output(*detection_cmd).strip()
> +         if not gold:
> +             return
> ++        if isinstance(gold, bytes):
> ++            gold =3D gold.decode('utf-8')
> +
> +         goldFullPath =3D find_program(gold)
> +         if goldFullPath is None:
>  diff --git a/build/moz.configure/util.configure b/build/moz.configure/ut=
il.configure
>  index 3284fd8b5..218813e2d 100644
>  --- a/build/moz.configure/util.configure
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

