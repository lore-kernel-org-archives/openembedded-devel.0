Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327C0CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 03:37:19 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.12044.1761190638621867675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 20:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aLBv7ALg;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-35c80c1dc3fso161784fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 20:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761190638; x=1761795438; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfudgrGmw4cePls8xi6IL7T64n9/JFxWSxi33KaMofY=;
        b=aLBv7ALgxCtuboicKblBuyCgI0kE8FIVdd8QOwrBd8JF9f8mv3jVjG2ZE+1vOCnyUq
         Lu5dRZEsa2r9AVvAFcsFGFu69wLH7srtDHJpH4yEVZvU+sOfPZRkHz7y5fKrNbsPpeMg
         mMtjt4CT7PtKJbqMnDYDzuXqu1wpjxKk4wmOCRxioFaWwErWYvYYCsnYpCOlfNNj4TG4
         Exrmy0o911VEdoZ4vWztpiVyuH4qISEOFtD3PScsqr16Au69/0x9dBkPZMDTB4ZAyea7
         J0wln9C0y8FlLnXwlAT0Nb/NNr1W8jde72Zz4dfepmm8PjU71FtX+jGlnm5S55b7XtD1
         HpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761190638; x=1761795438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfudgrGmw4cePls8xi6IL7T64n9/JFxWSxi33KaMofY=;
        b=aNUW/SMpwk3Rb3elRtbaqI7PydlM9OYQNxOIZNQn2Hvizo+PnxERv2dlqaVtTOskZF
         1+PofsEHrxptvsYOm9RUhIEiAPwv89qCzlxZ99CkLrlAJcicdqyAlQDZszEkoHRxIL4q
         nbTOEZ1elLYoX06TZNiBcE/hP0N0lqMe047gx2hVatl7NOOBlc/mmK9kSJ/DqMNQn57Y
         aIdz2QP9/q057hVmeV0kP0bZ/u08lZO2hm73sf4ILZ7EWTwDRLMBcBE70KCMzq/kxQmV
         PljDApCKirWMwzbMb8i5qYu6rvF+gklIo0k2d3OHrpwwNK/t7BCJfq/gXHztqM4jOihw
         5yUA==
X-Gm-Message-State: AOJu0YxNFnSdOzRaWdLq/n9muVrQI2o8xBfzgLyk8VZvbwu0mlcDPI8a
	ySIRiFx0g2NYnCjkIGLhvzfHuvrscQHIick44pIIMmWFm0pHFl8G8XtaSq5LxtkMSpjC0vISkCC
	2PoxTr3qMHxGt9VsAvmPtnC2J3v+N82I=
X-Gm-Gg: ASbGncvQTaTNHI7bgsngeYWpBbQJmF0OYarg7CbRdgNgXnNQLCiBKa5D5K2L0OOJapi
	AMTeZ8l7LaQnrvq3hKJkPFpL0lbstddJYCQHD6MZzK87uSh6pbGEtwR0VUo5J4mL6ErznfLCzb2
	bwsV5D1cPpWpu4XXtd2N3DPcijT+qf4t/16tRmyIA9iYu+JiLWqMgNycQ4Y13pnUCII7a0OSdtW
	Jf1ZP2iYsXfoGmiCq266Zn4igeQsjs29qT5aT5leA/qwKwdVJ1QJDpjmhV7X9s=
X-Google-Smtp-Source: AGHT+IF9wMAMNQWFg9aleMH5s2WR1Oc8jpEetPhalZ00mTxaNEa+tWjN3619KxOmBnz9obN2wqDqoz8URwHH2uZxR6w=
X-Received: by 2002:a05:6870:548a:b0:3c9:74fb:a719 with SMTP id
 586e51a60fabf-3c98d11ed8amr8626059fac.39.1761190637828; Wed, 22 Oct 2025
 20:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251023025102.3182631-1-raj.khem@gmail.com>
In-Reply-To: <20251023025102.3182631-1-raj.khem@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 23 Oct 2025 16:37:07 +1300
X-Gm-Features: AS18NWBPDcb2FfdplLe8iYCpLQT8vyZ3JduQTyOEWZd3vYdC-7OXKdv2Hw872hs
Message-ID: <CADySD0E9EKMLCYJ89uEh8uVtnqnb_90LN8RJMtg-pgb8v_KB+A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-setuptools-git-versioning:
 Add recipe
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 03:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120913

On Thu, Oct 23, 2025 at 3:51=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Some packages e.g. python3-cytoolz are needing it now.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...python3-setuptools-git-versioning_2.1.0.bb | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-setuptool=
s-git-versioning_2.1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-v=
ersioning_2.1.0.bb b/meta-python/recipes-devtools/python/python3-setuptools=
-git-versioning_2.1.0.bb
> new file mode 100644
> index 0000000000..0da9d26dd3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioni=
ng_2.1.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Use git repo data for building a version number according P=
EP-440"
> +HOMEPAGE =3D "https://setuptools-git-versioning.readthedocs.io"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92e79e3a844e66731724600f3ac9c=
0d8"
> +
> +SRC_URI[sha256sum] =3D "6aef5b8bb1cfb953b6b343d27cbfc561d96cf2a2ee23c2e0=
dd3591042a059921"
> +
> +inherit pypi setuptools3
> +
> +PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG[python-version-smaller-3-dot-11] =3D ",,,python3-tomli"
> +
> +RDEPENDS:${PN} +=3D "python3-packaging python3-setuptools \
> +                   python3-core python3-datetime python3-logging \
> +                                  python3-packaging python3-pprint pytho=
n3-setuptools \

python3-packaging and python3-setuptools are already added

> +                                  python3-tomllib"
> +
> +PYPI_PACKAGE =3D "setuptools_git_versioning"
> +
> +BBCLASSEXTEND +=3D "native"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120911): https://lists.openembedded.org/g/openembedde=
d-devel/message/120911
> Mute This Topic: https://lists.openembedded.org/mt/115904614/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

