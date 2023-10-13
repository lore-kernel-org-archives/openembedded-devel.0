Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61786CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:12:31 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.42893.1697213544970122602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 09:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZrcC3odE;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1e1b1b96746so1273140fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697213544; x=1697818344; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khNMUqM87240oKxcCphVjYSSw23BZQqaFVILEVGH1YM=;
        b=ZrcC3odEXfUUpXoj58cmKoavkVHoWNQrK+JPb7i/z9n2CN52bG+YXUeIm1LNl6gO3d
         GQvI47Kpu+f8jOD6iLRpkfnY6ZNdIzS+Hqnjv7H2RyOWUl1oXgikmmZdM4D3maBrVCF5
         nct7JaXLS8cAhiXTT3NqvS3gnc9qqnIanbcZkaKfGio0Ym0GyZr2QokCAKcwjfzzfR7v
         upu7ua2QtnktfEWttSIRelXfcOzOkf5pSFYiJ+d93dpTx7UnlC2GmGxnkExlVcrdnQBt
         FQLg+nksUZ0AeeKCeU9Gr/fvVWA2fS5wGO7AUFj56P6eoFa1Csb6jdUwq0rF1a01Vkvv
         yVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697213544; x=1697818344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khNMUqM87240oKxcCphVjYSSw23BZQqaFVILEVGH1YM=;
        b=iGfY53x1mB9B7aaRPBrvSZw/hiazTOpsv9CN0XYaSi5QMOa5dSURQTXjvLKEi5tf8d
         PEcT/foDlSr+7rVvtBvY0Fh8ljKVs/yAo2hcrLcGd25/pc7OX34kXtC5GHphiynybu7n
         tWsVnpW44QxJ7x2KNYmGieCOBl2djJ6fH9J2Bx27VbL4whFmQtu+NT4xMyQBPlkfsq6V
         i8INBvD3AXbUh4/7MfNCXZElQCq75XYp9rzLBySvdUSCsQ4+zNMgnx4XUjXN+yIwzbIF
         K/0p0Lnsq/sjjQ+q4AlKmrPzMCVYF+fh6a4sS/l84iD5OyQYmmbdjbFbQLkZEAPsBUYT
         ymJA==
X-Gm-Message-State: AOJu0YznI+fBL3gRC1ySR0dYmbLSScS2wuK0xYPGvV/qvE8Dmt81e7Cd
	rtrCAzwiIWBhlPUnbuwAT20MshxYm5t4efNOQUI=
X-Google-Smtp-Source: AGHT+IG9Oz+0XRds4GBunvYHC3BEHuAWcpyf9TjfeEsR7l3iobf/z+OiAI1W7AR4J4b+PAEaCalmbkBw0zTGnzSvlDs=
X-Received: by 2002:a05:6871:1d2:b0:1d5:a85a:13b6 with SMTP id
 q18-20020a05687101d200b001d5a85a13b6mr30357260oad.45.1697213544091; Fri, 13
 Oct 2023 09:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231013153951.2166008-1-david.pierret@smile.fr>
In-Reply-To: <20231013153951.2166008-1-david.pierret@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 09:11:58 -0700
Message-ID: <CAMKF1srw3o95qQt9dZJVcXtuiH3D__spomnG2JJ6yAc1qRABgg@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH] libtext: add ptest
To: David Pierret <david.pierret@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, 
	Hongxu Jia <hongxu.jia@windriver.com>, Tim moto-timo Orling <ticotimo@gmail.com>, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 16:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105479

it will be good to also make it part of PTESTS_FAST_META_PERL or
PTESTS_SLOW_META_PERL
in meta-perl/conf/include/ptest-packagelists-meta-perl.inc

so we can run it as part of ptest image in CI

On Fri, Oct 13, 2023 at 8:49=E2=80=AFAM David Pierret <david.pierret@smile.=
fr> wrote:
>
> Signed-off-by: David Pierret <david.pierret@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../libtext/libtext-diff-perl/run-ptest       | 19 +++++++++++++++++++
>  .../libtext/libtext-diff-perl_1.41.bb         | 11 +++++++++--
>  2 files changed, 28 insertions(+), 2 deletions(-)
>  create mode 100644 meta-perl/recipes-perl/libtext/libtext-diff-perl/run-=
ptest
>
> diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest b=
/meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest
> new file mode 100644
> index 000000000..c65b6cf8e
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +
> +for case in `find t -type f -name '*.t'`; do
> +    perl $case >$case.output 2>&1
> +    ret=3D$?
> +    cat $case.output
> +    if [ $ret -ne 0 ]; then
> +        echo "FAIL: ${case%.t}"
> +    elif grep -i 'SKIP' $case.output; then
> +        echo "SKIP: ${case%.t}"
> +    else
> +        echo "PASS: ${case%.t}"
> +    fi
> +
> +    rm -f $case.output
> +done
> +
> +
> +
> diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b/m=
eta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> index afdf63ede..9dfadde8e 100644
> --- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> +++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> @@ -11,17 +11,24 @@ HOMEPAGE =3D "http://search.cpan.org/~ovid/Text-Diff/=
"
>  LICENSE =3D "Artistic-1.0 | GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D385c55653886acac3821999a3ccd1=
7b3"
>
> -SRC_URI =3D "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz"
> +SRC_URI =3D "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.gz =
\
> +           file://run-ptest \
> +          "
>  SRC_URI[md5sum] =3D "30d56e6dd5551ca16b8e16cc7299dc21"
>  SRC_URI[sha256sum] =3D "a67f50a48e313c1680cc662109ce5f913ea71454db355d0c=
f4db87ac89d2d2fa"
>
>  S =3D "${WORKDIR}/Text-Diff-${PV}"
>
> -inherit cpan
> +inherit cpan ptest
> +RDEPENDS:${PN}-ptest +=3D "perl-module-test perl-module-test-more"
>
>  RDEPENDS:${PN} =3D " libalgorithm-diff-perl \
>                     perl-module-extutils-makemaker \
>                     perl-module-exporter \
>  "
>
> +do_install_ptest () {
> +    cp -r ${B}/t ${D}${PTEST_PATH}
> +}
> +
>  BBCLASSEXTEND =3D "native"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105478): https://lists.openembedded.org/g/openembedde=
d-devel/message/105478
> Mute This Topic: https://lists.openembedded.org/mt/101942826/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

