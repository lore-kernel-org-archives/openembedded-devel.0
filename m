Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A8EC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:12:31 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.11286.1743606748226157841
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=knk8fQ++;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6040465b9e2so259651eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743606747; x=1744211547; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47fE/anGo8RIfpTpR4YZ+oY+JkA5aNjcJPjjDaNh6mM=;
        b=knk8fQ++hsuHEPDrpOjKYiyXl1kUD0YQF8gJhfTsrV+gw/AxVNNiGXsj6BHmiI0uKB
         QuwmicgiGJgFCBOgutA8hMRkJIxtp0zmu+PQP9XorPilfMVD3D8PjjyW94HBHJChIAZ+
         3Sga1g+Ivtdnpaqm/C6tnGx9VDLxR56yjtdHKrRPeyp4uOPw2nd7Q006DeL3BZzemhVs
         O/ySkJ2x4dqta1O3wTcAvf3Ag4iE1axK9836xzwl+OZuYaD6+S10+2+wXvl5c0OFK/i8
         euoc7U/aHRIor3Q9HgTzMwWiz7RDrStFqOiJg647ownhuOJ8B0BApxYyVU+34BvnU9FK
         P6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606747; x=1744211547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47fE/anGo8RIfpTpR4YZ+oY+JkA5aNjcJPjjDaNh6mM=;
        b=aFaZc0S/Z8cWQytwLdzBU+rPibs2N044Bh42MeV3ljEVH5TgtO8DSLXt6iqRbqi2WS
         j86Q7hTgE2Zuy2YR5ff/a+MCTmmdk+DeyzsrtS6gNgzz1FGaVYDxAaPLqu6p+aevOIyk
         VQvZXg0aoJaDQannMUcAjLAbwYijuZDjapHS6WZc4p1VxDGT7fzbAzX4NvDMofwN+adR
         XbltY1ciKQXO9NRUXOskvDJNU6MwipWy4QsBHe6TusVxvXAmiprb7t+aLFsyNNmWlEOF
         eyHAUv6Uz7HWb/5SDR1Q5FudkmporUAHUzTDpTEZuCy2pAABeDMbzG2E9t0oQzpRtuC1
         VoRw==
X-Gm-Message-State: AOJu0YwIiKd+QRLb8ltbH65spyJ5FigIizrglXHY9vXxuRM9zvip4Is8
	YVnEOWCBbKxhQhLJStGl+DWFKbWM0j6aWb7S5eRH4WvXwfTqXQQH45rASoDbzSIwJCfPh93pSP+
	qPqcAC0SGBV3TZ+W3vao1thtxMwU=
X-Gm-Gg: ASbGncuQSUtupqXKDqGzzHzk/r6eu2n1AgtV0dTyBQ1q7M4gAViIJd1I1avfd0vXIGf
	TvjBn01HYT2CZaD0P0GhRq/vpz3aQ2WLk3BylQZVD7i1FtWhXzIWYRiFGkQaYG4mbrcshkKs+LQ
	Z3sJLrVcDRTYggDhgS4bVs5LlNdQ==
X-Google-Smtp-Source: AGHT+IEbq8kzaMRVE9WQCYDVXt/O8ewkQ1Eo/z8Cw1ZX5rD4LRVrBgBkV/36jBF1T8I1K+2rGKVRmDBGVCiudAgmJU0=
X-Received: by 2002:a05:6820:3085:b0:603:f2f6:fd41 with SMTP id
 006d021491bc7-603f2f6ffdfmr3742298eaf.3.1743606747324; Wed, 02 Apr 2025
 08:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250330194034.371789-1-jan.vermaete@gmail.com>
In-Reply-To: <20250330194034.371789-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Apr 2025 08:12:01 -0700
X-Gm-Features: AQ5f1Jp3eWUKsyMFGtcVphO-dGu4yGkyP3BkbSsze07rMWFT0W_2v6sKaWHYc_k
Message-ID: <CAMKF1srFs26QnAmY9jyk-7tws4pXih-BZcH2-TOwcUFu=Wkc7A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-breathe: new recipe version 4.36.0
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 15:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116526

On Sun, Mar 30, 2025 at 12:40=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Breathe is a Sphinx plugin providing beautifully integrated Doxygen outpu=
t in your user-facing documentation
>
> Added to ptest list.
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../recipes/devtool/python3-breathe/run-ptest |  3 +++
>  .../recipes/devtool/python3-breathe_4.36.0.bb | 22 +++++++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 meta-python/recipes/devtool/python3-breathe/run-ptest
>  create mode 100644 meta-python/recipes/devtool/python3-breathe_4.36.0.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 101d39d969..fc71eb4003 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -14,6 +14,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-aspectlib \
>      python3-bleak \
>      python3-blinker \
> +    python3-breathe \
>      python3-cachetools \
>      python3-cbor2 \
>      python3-configobj \
> diff --git a/meta-python/recipes/devtool/python3-breathe/run-ptest b/meta=
-python/recipes/devtool/python3-breathe/run-ptest
> new file mode 100644
> index 0000000000..8d2017d39c
> --- /dev/null
> +++ b/meta-python/recipes/devtool/python3-breathe/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes/devtool/python3-breathe_4.36.0.bb b/meta=
-python/recipes/devtool/python3-breathe_4.36.0.bb
> new file mode 100644
> index 0000000000..dc14f1ce1c
> --- /dev/null
> +++ b/meta-python/recipes/devtool/python3-breathe_4.36.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Sphinx Doxygen renderer"
> +DESCRIPTION =3D "Breathe is a Sphinx plugin providing beautifully integr=
ated Doxygen output in your user-facing documentation."
> +HOMEPAGE =3D "https://www.breathe-doc.org/"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9e49eecf36fc015de7c61a0247df7=
5d6"
> +
> +SRC_URI[sha256sum] =3D "14860b73118ac140b7a3f55446890c777d1b67149cb02427=
9fe3710dad7f535c"
> +
> +inherit pypi python_flit_core ptest
> +
> +SRC_URI:append =3D " file://run-ptest"

Seeing ptest failures

=E2=94=82   {'python3-breathe': 'START: ptest-runner\n'

          =E2=94=82
=E2=94=82                       '2025-04-02T14:56\n'

          =E2=94=82
=E2=94=82                       '/usr/lib/python3-breathe/ptest/run-ptest:
line 3: pytest: '
              =E2=94=82
=E2=94=82                       'not found\n'

          =E2=94=82
=E2=94=82                       '\n'

          =E2=94=82
=E2=94=82                       'ERROR: Exit status is 127\n'

          =E2=94=82
=E2=94=82                       'DURATION: 0\n'}

          =E2=94=82
=E2=94=82

          =E2=94=82

I think rdeps for PN-ptest are not complete
secondly try inheriting ptest-python-pytest instead of ptest it
provides more boilerplate code for python testing
> +
> +RDEPENDS:${PN} =3D "python3-sphinx"
> +
> +PYPI_PACKAGE =3D "breathe"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +BBCLASSEXTEND =3D+ "native"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116391): https://lists.openembedded.org/g/openembedde=
d-devel/message/116391
> Mute This Topic: https://lists.openembedded.org/mt/111992087/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

