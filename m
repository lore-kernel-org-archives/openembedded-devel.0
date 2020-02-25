Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id C96B7616C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:13:54 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a2so224178qko.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vrZXxyxviziuHeM/PqdxhPz0HpPi2mmpOMQnxl3vOCU=;
	b=dc+u7b/b3yyRmUv+hCEnjrSY4rSNt0DWujaL0GximQYmJRV51VKJfqHqNdYrZHjN/4
	2F8AuHZSivqxm9Oyk7FjKlbvTOtNI7Gz2FPCGi1TgdsxUPDawt22iPFVZOgW5NCtyG2Z
	XNO3Sf/fVtRsiCdZ0b8PGaxbEtKw6aPnHTXJBllsvgrGTL1x96eTweN4889D3G0XxLVf
	3IkSWMPX4eUc3SEJEp75J2azJtVCc2iRCq6Pog9xGLa0uAXFJz1pBH+o+N3yKK5P2j5G
	7bZlbTrixGks78CFYWs7mnPJn1hbtBy+Ld8qIsjN6rWAqjZhXNXRnu8RYczJoHKYRO2j
	LNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vrZXxyxviziuHeM/PqdxhPz0HpPi2mmpOMQnxl3vOCU=;
	b=GiUsyQe2wxq+HPsrLUo4cya0KDhFpGYM9ffL4v5lc9ieMj+04AhJr4Qyj+5Rm6uDU3
	56crHpqSyCNLcn/PvO+MdepP1JlE3h7BjyBjrYI/xid3T9Ds+mOAqUS+mcA5EcYIB0Q8
	avCCzOyuOmVRo/TE4HxWJFOYETZV/iDyOpajPiKx1yHUomgiSulaUcyAd53kvdwU9jz6
	YRzPgXHQ7yDG49CN1IKoQUXZPCpaZQE2lWq1PSjjado5jHBDlG9A+SS8xIQxIKMCqoT1
	mg72Heaf/8uIxGIf0Cgc1ix/o2KztjOGlA+8RM7kEpw5zO6EGaQVMwy97yQgm7ehjqZD
	TgPw==
X-Gm-Message-State: APjAAAXRIHGtxJI6LBwwTqxvPCEUp5zcpfS2EDJKnohkGAqYBkrpRtUu
	LnyhUzpU5JV0OFJjvpTYYZT/rwnPebdLCItUmrQ=
X-Google-Smtp-Source: APXvYqxUteFTnbBw0RQRS7JjX0fqyILkSdiJw+w+3YDY3SZht1ti72UclE6IqyZkjJvD/CpDz4H07fgCa2byRZeaiDc=
X-Received: by 2002:a37:e317:: with SMTP id y23mr329143qki.431.1582658035397; 
	Tue, 25 Feb 2020 11:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20200225190710.3928-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200225190710.3928-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2020 11:13:42 -0800
Message-ID: <CAMKF1spuk9oPW-9e6OVW0=O-MUWHM_0tOc35ZT4P5_qneXo8Aw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] nodejs: don't enable ares support by default
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
X-List-Received-Date: Tue, 25 Feb 2020 19:13:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 11:07 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * c-ares is in meta-networking and meta-oe doesn't depend on meta-networking
> * fixes:
>   ERROR: Nothing PROVIDES 'c-ares' (but meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb DEPENDS on or otherwise requires it)
>   in builds without meta-networking
>

this patch makes me thing if c-ares is better suites for meta-networking

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> index 6eb52c209a..9f91a3f4dd 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> @@ -51,7 +51,7 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
>  GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
>  ARCHFLAGS ?= ""
>
> -PACKAGECONFIG ??= "ares icu libuv zlib"
> +PACKAGECONFIG ??= "icu libuv zlib"
>  PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
>  PACKAGECONFIG[gyp] = ",,gyp-py2-native"
>  PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

