Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F682C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 18:28:38 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.25413.1691692115851616773
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 11:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UFNMog52;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1bfc2b68090so1009386fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691692115; x=1692296915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4DIEwU0nGvEm2XQEXDoVqzxLDparMlJQojqmw62HX8=;
        b=UFNMog52sV03fzwIYe3+YWMt60AIgmWTlU/uzBOQ2YJsZoH/25Be3PEDMjerK0A4c7
         VwSsax5YORUDmortlHns2Gtdu3cPVjhje2CefCFr8CytrOKEPbq0I+PITsTTM93LxDhG
         np29yrP3bTm9ZuknulAkDM6eiRgLtMrXIbW8NdDWITmFSOH4f59nNGzslEhmhsOety48
         3HR/z2BpDSuUbeyVj/BchFu840Q/is4mkYupQs7Ehc3dp+b7sQQKPlxg6JJ9MI3xnUGN
         kIYdNtVtYRFO1Jd9jUtYnepiH5JwCAH+9kTaX0gJqqwCHkMak0yMctnJKQH1gduNSIFZ
         YF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691692115; x=1692296915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4DIEwU0nGvEm2XQEXDoVqzxLDparMlJQojqmw62HX8=;
        b=DkzRgIBvN2i7gYhE98NdPcvsfCLWb8UZ9ciGkBSnon2Gpc4LZczJTnY6ypI8x4NA5i
         hNzZwLg01os9P3jGTGpQ+06SOIrQfIdZuFjEB9a9TyXj/CKiErUrO4+Fd2ERYF+Ug+Cy
         RDsiCoE191f7dpVBYjqwOUb0bOPWSEeQQP3GRBhPne1HUxIY6zi7Pv2JtpdemMYNcqpP
         O+bPWMM5UtEOM4W1awUcVOLVlpMJVI5kkctFrG048+lfx5aj1HBQ5+P3PD18eEI+iYBt
         r6tc2pGrksUSRrbD6ooVoGRzfZ+P5mNHK8mmAq1HligrTDupnN5aNsHltTJY1GqOxRfg
         GtsQ==
X-Gm-Message-State: AOJu0YwxLlHLU12340U3N1+wTSLKdwfW0N2POWn8vu/Omr2MfogvrAEU
	+FUR699uZmMMpYZIqRZKezmbgEmLCVuRP6bHTMM=
X-Google-Smtp-Source: AGHT+IGcruv6cck8XjrplRa+Ix3SxpG5/eqdDtBs0lFK38NTqt1b7qqInEp/k7s78oZYCYZpwKagVVt3iiTpViMiM50=
X-Received: by 2002:a05:6870:239e:b0:1be:f23f:99b with SMTP id
 e30-20020a056870239e00b001bef23f099bmr3695601oap.42.1691692115051; Thu, 10
 Aug 2023 11:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230810153953.17293-1-jsbronder@cold-front.org> <20230810153953.17293-5-jsbronder@cold-front.org>
In-Reply-To: <20230810153953.17293-5-jsbronder@cold-front.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Aug 2023 11:28:08 -0700
Message-ID: <CAMKF1sp5R+_mL2bm-0oaaY_VE4yzzfVoaY0B=TN9pzrvfgby-Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-typed-ast: remove EOL package
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 18:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104330

Thanks for cleanup, I wish we did this with more recipes in this repo.
Its a lot of energy to keep these going with newer toolchain and etc.

On Thu, Aug 10, 2023 at 8:40=E2=80=AFAM Justin Bronder <jsbronder@cold-fron=
t.org> wrote:
>
> No longer required by python3-mypy and no longer maintained upstream.
> https://github.com/python/typed_ast/issues/179
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  .../packagegroups/packagegroup-meta-python.bb        |  1 -
>  .../python/python3-typed-ast_1.5.4.bb                | 12 ------------
>  2 files changed, 13 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-typed-ast=
_1.5.4.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 9500f80e0..f75007e13 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -437,7 +437,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>      python3-txaio \
>      python3-txdbus \
>      python3-txws \
> -    python3-typed-ast \
>      python3-typeguard \
>      python3-tzlocal \
>      python3-u-msgpack-python \
> diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.=
bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb
> deleted file mode 100644
> index e6c1746a8..000000000
> --- a/meta-python/recipes-devtools/python/python3-typed-ast_1.5.4.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY =3D "Modified fork of CPython's ast module that parses `# type:`=
 comments"
> -HOMEPAGE =3D "https://github.com/python/typed_ast"
> -LICENSE =3D "Apache-2.0 & MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D97f1494e93daf66a5df47118407a4=
c4f"
> -
> -PYPI_PACKAGE =3D "typed_ast"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[sha256sum] =3D "39e21ceb7388e4bb37f4c679d72707ed46c2fbf2a5609b8b=
8ebc4b067d977df2"
> -
> -BBCLASSEXTEND =3D "native"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104329): https://lists.openembedded.org/g/openembedde=
d-devel/message/104329
> Mute This Topic: https://lists.openembedded.org/mt/100665774/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

