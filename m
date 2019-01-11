Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id F08276D74B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 00:59:35 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id n187so5221671yba.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 16:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yop/LAgNG/piLgarAjTV3NnahwCwgtRHL2skqkbGs/s=;
	b=I1emDHWluhamwGVh5mdv7zZGKdEiYtI5IXMO9jc4UQciwiCwLa46lA0HkWWOViyX1Y
	WXXogR2ZLrMG4ejy1DYgRsvxHER3jmCQgrv7gK/icPDwE7P6RrrKrx3OrrcQZTI+EM3S
	n/kmWgwH1DuRTnFCC9q1JK2zbtp2FwhviUvM3rCqKR1JPTWIDyN7Zn8SP267QCUOIRUH
	zKrKTgYG9bcIR3jfuEE0wnUambfOEXKR7eCWGrn/tFtlsEU9t0wMreTJRfhnsK1iFg3D
	R9jb3IcrQrpKbV91gjBxzdh9s6WOPYAQEaB0+PiBJNNdMcH3nRLCdE56C0ZuIqxKNdeS
	iHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yop/LAgNG/piLgarAjTV3NnahwCwgtRHL2skqkbGs/s=;
	b=ti+Xk633KIhs4MtKIqAnnjyuHSuIf2iebqg8+Y42tPPD5hlTb29yqwPsp68Tb60vlW
	2y8iuJsQ+JovXDwWFDNFnALn5nZzjxZDluJTRr0gCTpYKTDBszA+F8e9U/KhqC3N9ppL
	OA7t7NnKuWCrFtBDHDuWs5AEviFWU2nxgwJu0PN4Yb2UYxIOkY8Za9u3vpwMUAV5PHAy
	00NVbB8hdWQZlCBYSeKp82Wk3X0KY943XMtZmw/5h1WcZrnSF4bMzODuW0YZt/Kfbpb4
	kRb+3XCuS43e7OLs2hnmkR3b0vhHIFIdkj7se1PLnuQc+NpRBULRFuqIkXYjsUqs6qpS
	X6Tw==
X-Gm-Message-State: AJcUukcRSDovqULSFPHWyY+tmhpwoX1A6/FjKjRvTWiAUo+FO6pb1MhG
	qqDLh/pnXQUB2LFsosVuHQiB+KlRwScX5RNnZeZZYw==
X-Google-Smtp-Source: ALg8bN6FXB7kU8uD0sZ9bQhi7nZitwibhmThv/Q7BsldXgsof7v/X/FOpRpdSi7j8tyyAfK+roPZjW5KonL48I4nR5o=
X-Received: by 2002:a25:bb04:: with SMTP id z4mr12798683ybg.38.1547168376745; 
	Thu, 10 Jan 2019 16:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20190110094212.16763-1-richard@nod.at>
	<20190110094212.16763-2-richard@nod.at>
In-Reply-To: <20190110094212.16763-2-richard@nod.at>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 11 Jan 2019 01:59:24 +0100
Message-ID: <CALbNGRSKj12yY5NMN+msKbuKQTRcCOd3V5q196orVCTh8Mg6xg@mail.gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/6] [meta-gnome] wv: Don't use ${PN}
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
X-List-Received-Date: Fri, 11 Jan 2019 00:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 10:42 AM Richard Weinberger <richard@nod.at> wrote:
>
> Don't use ${PN} for the source dir, it will break multilib builds.
> The correct variable is ${BPN}.
>
> The bitbake defaults are:
> BP =3D "${BPN}-${PV}"
> S =3D "${WORKDIR}/${BP}"
>
> Therefore we can remove this line.
>
> Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  meta-gnome/recipes-gnome/wv/wv_1.2.4.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb b/meta-gnome/recipes=
-gnome/wv/wv_1.2.4.bb
> index 8ed1fcd15ca8..03ee5b4ac4aa 100644
> --- a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
> +++ b/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
> @@ -16,6 +16,4 @@ SRC_URI[sha256sum] =3D "673109910e22d4cf94cc8be4dcb9a0c=
41b5fbdb1736d4b7bdc7778894d
>
>  inherit autotools pkgconfig
>
> -S =3D "${WORKDIR}/${PN}-${PV}"
> -
>  EXTRA_OECONF =3D ""
> --
> 2.20.1
>
From a quick glance these patches look good to me - should invest more
on multilib tests...

Andreas

