Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12532CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 04:58:06 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.26267.1759726680219171453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 21:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KwAQBnx7;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d5fb5e34cso60234777b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 21:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759726679; x=1760331479; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FPgpovGKRK6mHDk0yEk9vbGZ5HC/w8gm3QXhfX10lg=;
        b=KwAQBnx7nVyohCfcgs2Tg2B5416kvmCbKZR61iwAcciS2ZIFdQaFQPLduPu4qa/zea
         feYa0qtCI2ZnZ0JEO6Vz/EkjigrYjerZz5YPkcN43jouBWgpVruVlROB0vXlRTR+p/XD
         skdpLha9wB19SzVOJXtEHNU4FMKjcQmoLpCDsSWzxTeqFwManJNbzDdKEvfT+pnLx+HV
         KuHKPOpNiDHQ01YTjjE5gDvPVG4uVxnc1XTG+KXIDir1enbjlAoHpOP+f8LbIaC/qAuG
         AwFcn5IWIxXkz8goVQIVHP0e6NwhLSLQ/uIxO14K+dv1byn3xGLjgxCCC0LyrFIPmNd2
         hGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759726679; x=1760331479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FPgpovGKRK6mHDk0yEk9vbGZ5HC/w8gm3QXhfX10lg=;
        b=w11ehwAqvYUtOVDDikiEQ9Kg9DhSBsNQr+4ALeC4lbU6w+y2EuTojG2zxxCHp2Kf1i
         6tww4TKhLbyZeK7CEkfy6MwQhigCMyJWMc6XIGzV86EIAJpiBlkO6z4vg9aBPTqVAXyf
         w3DaV/DmPDkawSzLfxhpb/aZ2a4uC/q1/eUFB+7pdFeSsDhJGsYdfruFL+GCLqHsLpjh
         rVI7dk033qK3kb647F2YR4DE7BjiqHigxCMJAbMWQqjxMiTqNtALB/Ja6NiJgTs107mL
         e+J0rziLRf8F3NPzpn1rSssq//nvyjun4TeAfnXPeGawB7okyhZpqwNcVKFGa/tFR7kU
         XE3g==
X-Gm-Message-State: AOJu0YwXltE7sH4yNSIHDT2rt/8XIZ27PWNlkooJpbDNk0shjIkNMS0K
	8CX92rh6eiHvNjvEyxC1mTdTxQ5B4EcEANlDPO6YUG2MWF3Z83xztxWbvX6oJRWf7aSEijpBcym
	qsemL0SwD9DIKWNtqNiprVDv4pdu0uzo=
X-Gm-Gg: ASbGncvSHXM99N+Yy433jYkkWJfWmJfa89Hx2OnJLwmm+ZPZKArLXkNRK3E9HtFNICi
	tRZCwD6wSrO3k+FzRJt6LXxKTG/EZRs12ZeuMVO5TZrq0Y34ok348ceMjPNUobU9/AgDPR1GbG2
	MEPSIDmPvdrWExoTRwJKAV2LX2hxeko9lQCZ+dJpNBJxsRygeW3fJ0evNBAOaT57968xZQVp8uk
	mylBcivljHvloDd5fvZ+YbO0O2Ymedyq45+NoxpM19jhnQ2UBQ2AUf+9OOZxtCLhf2N7H6HQo4S
	m/mibTkZ7rBp9fnzs8Y6n1SsMi/mPjyY30+K+quudafvMr8AZRdmTClAkAwZHD4=
X-Google-Smtp-Source: AGHT+IFniyUCwi1gr1qJ49tHtzn30wgwlQ+J7eoXb9OFzmSoCSuOlOwYHWztvquf4lEWCkEd4BHudb2CBS7cQtzGInU=
X-Received: by 2002:a53:db12:0:b0:635:4ed0:5720 with SMTP id
 956f58d0204a3-63b9966f63cmr9154406d50.24.1759726679149; Sun, 05 Oct 2025
 21:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251006035312.563935-1-zboszor@gmail.com>
In-Reply-To: <20251006035312.563935-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Oct 2025 21:57:32 -0700
X-Gm-Features: AS18NWDZT6MLmsl__Mcilu_TeLlUYa8A5PD_ouCVUuMN7QsTD93sV9Nx_Y7W5vo
Message-ID: <CAMKF1spsp9bJj+GqFL65XCGMwqQmyVgvQQVTY5e5UMGzoHFzLw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-odfpy: New recipe for version 1.4.1
To: zboszor@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 04:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120271

is there unit tests with this package ? if so I would love to have it
added along with recipe as well.

On Sun, Oct 5, 2025 at 8:53=E2=80=AFPM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> It's an optional dependency for pandas to provide ODS reader
> and writer support. It complements spreadsheet support along
> with python3-xlrd and python3-openpyxl, both of which are
> part of meta-python already.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../recipes-devtools/python/python3-odfpy_1.4.1.bb  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-odfpy_1.4=
.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb b=
/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
> new file mode 100644
> index 0000000000..1b943e535e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Python API and tools to manipulate OpenDocument files"
> +LICENSE =3D "Apache-2.0 | (GPL-2.0-or-later & LGPL-2.0-or-later)"
> +LIC_FILES_CHKSUM =3D " \
> +       file://APACHE-LICENSE-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57 \
> +       file://GPL-LICENSE-2.txt;md5=3D751419260aa954499f7abaabaa882bbe \
> +"
> +
> +PYPI_PACKAGE =3D "odfpy"
> +
> +inherit pypi setuptools3
> +SRC_URI[sha256sum] =3D "db766a6e59c5103212f3cc92ec8dd50a0f3a02790233ed0b=
52148b70d3c438ec"
> +
> +RDEPENDS:${PN} =3D "python3-defusedxml"
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120268): https://lists.openembedded.org/g/openembedde=
d-devel/message/120268
> Mute This Topic: https://lists.openembedded.org/mt/115612512/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

