Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id ED4F2719B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 21:53:31 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id p2-v6so27084087otf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=vPER/Ccqw+WgCF2Qguw0i4U/fpvdt6QStOwKF5WLIVw=;
	b=IMrZ8fcN0PbuXSymfGM4OZbfIwhud/+sA2nzt+QxxrRGxETwNXDuqBZ/VUx5YNJiY2
	Gxb2G8we1rAQ3InJbJc+yNsTGn9fOLoc+1paYjXsOMCSoZR8Srq0kU0BXalRs0zxzAKA
	WJqTX0ceB2cntqt/juX/fgnI+jhO2PfU79+pMBBV8mhsHwSFaDMpTY3TjVpwM4kQWmwz
	q3F8fAZZ3ny4GQjcNGCCixeXNmo0GCWUW6NY/A/kCqtza93qnOrRNc3NqxQ7XhaLT97m
	3kSF3/eaxo8oVOS++dfHfM4+YwgWI3JRw+LioSb/lvyM/IPeLxkpaj63UPMjDoodKhgJ
	VxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=vPER/Ccqw+WgCF2Qguw0i4U/fpvdt6QStOwKF5WLIVw=;
	b=prQCiPkHKmIHAWFvU5SzSH6eqPjVhGl+in2MlpDK0DqgtjmSqxba+3ItBAHk1wP/I4
	XcNU7YqwaZjHy6F5LM88Dh7jhJZ9qPg02dg9oEjMf76KLZ4Waz8IpN/ITHqMKdMatTkl
	alLksn4drXSVzPQtV6698D9SFzX5BnMIcR+Uy08MOg0/qHuVfVVBMWfDp662E2D+mglj
	QTdlZG+hsejTQSM3TctswRJsZEPU3KRjOAssZEHbJhxdQ3Vt7z+Je3WoFGtDEtQLP0w+
	a+cAxJQGjAf/eaFLPqZkcMHa2H8WbtNHVZ1uJfKF/gCdoNS1isuzG1U5/0ZUjkOaxDFF
	p3Ig==
X-Gm-Message-State: ALQs6tDX6reHjuXFoIlJQ/Jvou8UVO/65qJaIxg1IiisAB2RBj70l+UD
	6XihvFUutvsBvku0x+9mJHcqtdighTmE2B2owBU=
X-Google-Smtp-Source: AIpwx4/tykDgqAaD8HKAI3SxIEd1UqvFE8CO+85UZ6LzKuOokpemZZxSiBOXXxHQZB4u1NELEpCR8KiCkvpI5V6gRrU=
X-Received: by 2002:a9d:7247:: with SMTP id
	a7-v6mr22162067otk.220.1524693212213; 
	Wed, 25 Apr 2018 14:53:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Wed, 25 Apr 2018 14:53:31 -0700 (PDT)
In-Reply-To: <20180417161648.14722-2-schnitzeltony@gmail.com>
References: <20180417161648.14722-1-schnitzeltony@gmail.com>
	<20180417161648.14722-2-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 25 Apr 2018 23:53:31 +0200
Message-ID: <CALbNGRRth5DHnSrbNeOW7MRfis553A9P-vD_449BXUDRUh=rLw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libtevent: add libtirpc to DEPENDS
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
X-List-Received-Date: Wed, 25 Apr 2018 21:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 6:16 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> musl build fails with:
>
> | Checking for header rpc/rpc.h                                : no
> | Checking for header rpc/nettype.h                            : no
> | Checking for libtirpc headers                                : not foun=
d
> | Checking for libntirpc headers                               : not foun=
d
> | ERROR: No rpc/rpc.h header found, tirpc or libntirpc missing?
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.36.b=
b b/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
> index a83851ea4..c91b221b1 100644
> --- a/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
> +++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.36.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://tevent.samba.org"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPLv3+"
>
> -DEPENDS +=3D "libtalloc"
> +DEPENDS +=3D "libtalloc libtirpc"
>  RDEPENDS_python-tevent =3D "python"
>
>  SRC_URI =3D "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
> --
> 2.14.3
>
ping?

