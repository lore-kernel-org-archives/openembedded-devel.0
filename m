Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806E4C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:40:50 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.69914.1747118446273828528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 May 2025 23:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MY/vlD/O;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72ec4634414so3633735a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 23:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118445; x=1747723245; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOFWPjRCDzUlKWhJSXgZ+8bFv7xlv6tVH/OjIRiH+Gw=;
        b=MY/vlD/OHCeuC1U56msMj5kBUG9iyiFxnJ34mqrSiHZF60tQuqsyUF0eG+M8+eb+b/
         7u2WbEtOz1Klxpr6kKwBQj38wC6ECKasFS5+381muKh1s24YFy7tert83OmW4CZsVbwB
         ocTmlMJ61BIbt6Cc37QjklnfBKBPrpXsNsuAGnv65oXyOYFbpYlMhtpqyZakAbo1NBCJ
         8clyvRbKAtMgkmiU1IXcFhv1fQI3/+sIrGmbTqUyIuno0fkBz6Fp/WuCtXf9fEQFkbRp
         VaBwM4/HslrKh/RCcnBXZhmWbvp+pK5ShIKycMluqF0qgOA0BIzdf7+wE5lOAaHSZo0t
         algw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118445; x=1747723245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOFWPjRCDzUlKWhJSXgZ+8bFv7xlv6tVH/OjIRiH+Gw=;
        b=lX+scI4ZIKLI1atrW5dT/lkGkB/8WUZ0IjOYQwHHkfZUOnEm2nNhgOalrZ3SCdLIZK
         etSxvTW2HNzcijfaVSJvkVJ5wrW25elbfjizBKjgt/Q+vhV6FE8Idr28b6tDHTlHIQ3U
         ies8/l8L6IJ3D9zi7G+xWNP1fVnOumJcY5IVD39Cc/u6OyDb56QebWbxoRlsWVzZ3dPL
         nXTn4w7rEet3oN/1i1fuakQ9FgHM2jvxqHv1qjHnu8ZAUgojXWgiMM9jWfNvit26Rjtm
         nkCP1fSN68JyJ74hRO2AgiG6t9H4z8WCfu3kS9UOvwgWQTB+BZHAzfu9EBblOraOimlM
         5ORw==
X-Gm-Message-State: AOJu0YwbNCda+vakFuuGi4XrHxHBIuIxgyT+x8HiHB46E8YREh38BfvE
	gzMYGI0oHCCYfS+PMm0bGkEujGNeL4/zeMhZW6Ly5FvkVo+TeqFHYsnB305uv2uI5m74vE70Dl+
	cBq1mMwFs6AAC4jk0/H4FMpWKzMw=
X-Gm-Gg: ASbGnctRwaMMsM44jZFN99AX5n8ak6XUHrYVIH5QLZpIvzxTpBXV2OpRtCX9aFLqFul
	yIMMqO/5XYo2lUI/E89huBVGDxaSdoK4phmHS826cFAqReEdk1sKHjsuXJEXKfC8f4POcyB95qo
	c56j3riyFUyryE9c1tzh5m4tqMTJ4rySQv
X-Google-Smtp-Source: AGHT+IH7mIAgBnJDRO0JxLSJET04GY2bxPELAtraV4+Ip2kJuUkmYtUMDze/vVPIowomq48WgMawHuxRtz41PkcaxNI=
X-Received: by 2002:a05:6830:d86:b0:72a:48d4:290b with SMTP id
 46e09a7af769-73226b2cc90mr11111056a34.26.1747118445251; Mon, 12 May 2025
 23:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250513060149.3971753-1-dmukhin@ford.com>
In-Reply-To: <20250513060149.3971753-1-dmukhin@ford.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 May 2025 23:40:18 -0700
X-Gm-Features: AX0GCFuFhMDUUQJSPelZgqlFg8dM_yz0ATDpaLyrLxi8rMYNyEjLaQLB1PZA8u0
Message-ID: <CAMKF1srPZJ7=AmVVyp6Y7b3AsJAy4jjqeV+iaOgApF0phXmOxA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v1] dediprog-flasher: enable native builds
To: dmkhn@proton.me
Cc: openembedded-devel@lists.openembedded.org, tymoteusz.burak@3mdeb.com, 
	Denis Mukhin <dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 06:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117394

On Mon, May 12, 2025 at 11:04=E2=80=AFPM <dmkhn@proton.me> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Update dediprog-flasher recipe to support native class variants.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  .../dediprog-flasher/dediprog-flasher_1.14.20.bb      | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.2=
0.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> index 83a88ab75f..4c6d6bf6f1 100644
> --- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> @@ -12,18 +12,23 @@ SRC_URI =3D " \
>      file://0002-Makefile-add-conditional-stripping.patch \
>      "
>
> -EXTRA_OEMAKE =3D "NOSTRIP=3D1"
> +EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D${prefix}"
>
>  PV =3D "1.0+${SRCPV}"
>
>  S =3D "${WORKDIR}/git"
>
> -do_install () {
> -    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install
> +do_install() {
> +    oe_runmake install
>  }
>
> +# NB: /etc/udev/rules.d is packaged outside of ${prefix}
>  FILES:${PN} +=3D " \
> +    /etc/udev \

Please use ${sysconfdir} here instead of hardcoding /etc

> +    ${bindir} \
>      ${datadir}/DediProg \
>  "
>
>  inherit pkgconfig
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>

