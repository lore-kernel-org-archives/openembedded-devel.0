Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A92C77B75
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 00:28:16 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.5229.1683678486353557340
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 17:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jmCb0kWx;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-393ffb310d0so1077050b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 17:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683678485; x=1686270485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnnMw8ddXJvduVCSYgMoEbmr+3NY53reYb52L9IfOPU=;
        b=jmCb0kWxWrZSLJCUbjRt+xoyhMoMZVOaD0HvCTik9D//if7moSH26PHF7+riXh+dni
         3HnNDay9OfWeFdPK7iqjQkJXcxMO50CWraDFfu4cid1L6oiAT8jmwWxLRMAc577/QYc8
         Tqv4NMh7p/Z1MracX4cFDqCtFU0N0ppv/YpLZDZP4EnQGaKwaguZB/6q7KQMNYbTr9Zf
         URrWRWos87sdMb8gILkveM4jujtXHCb4SawuMSa3/ya3o9Nff0vQqgVYkJujN4lP8/5k
         y1aBLGXSlttqirXWZMhny0V3UL9am8rf3FxANoLuOecyVs6gcFYsPfLjolE7/dFtc1xZ
         Ju8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683678485; x=1686270485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnnMw8ddXJvduVCSYgMoEbmr+3NY53reYb52L9IfOPU=;
        b=EMfnMGlC4wn/kQLCZY/s1g45ljuc3TFFfKNK/dXTzkBW6ehuuzzPZ+BX4j9PGp1MH6
         yd52efOvweY2xepKHbWz7gnyu1lLG+IgE0QM4hoWikC99SdYKwUkmwKTNmn0hE4HSQOZ
         jUbMpP9KeMIA7sqIpwzm1SXK7Lboni6RqBmrxQ/DAMVIgE+P27p5SWPv6ec6Gz38DAZh
         xa60BZVzHvS+z8q0Qxj7TOWe4RTtcV+GXYLtETXNnupLvi19wEK1qLzCdLi/BVdrceHm
         ZxwEqf4y6or4p14WpepIrrYwbV5af/ifux4kCtich+Y/UvLFIFR6R3uEtr71dohZ9Dhi
         s65w==
X-Gm-Message-State: AC+VfDw6OVotAjLZwzjMsWm1lahJIQLXNQSAWvKdzEvAdSKBylorbXpH
	ANbQM+GS6EPj0X4uLQtQwWpDC7RV2pw/UdEajg8=
X-Google-Smtp-Source: ACHHUZ7GEHqW4vhOvpjK/yQX8UITJRqIxSXJ92b9c+Obe8GrmdXp22KwAO7wZbJYb8iBrwI3199zUDMdxq02Z//JQtU=
X-Received: by 2002:a05:6808:628a:b0:387:4754:107f with SMTP id
 du10-20020a056808628a00b003874754107fmr2079601oib.51.1683678485519; Tue, 09
 May 2023 17:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230509065940.1584276-1-jun.nie@linaro.org> <20230509065940.1584276-2-jun.nie@linaro.org>
In-Reply-To: <20230509065940.1584276-2-jun.nie@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2023 17:27:39 -0700
Message-ID: <CAMKF1srFj1enrOfDR=X0Q+ue8OMKyEX8iJV_NcK6QuXoLoDOiw@mail.gmail.com>
Subject: Re: [meta-oe 1/3] libcbor: Add initial support
To: Jun Nie <jun.nie@linaro.org>
Cc: richard@hughsie.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 00:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102517

On Mon, May 8, 2023 at 11:58=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrote:
>
> To handle the general-purpose schema-less binary data format
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  meta-oe/recipes-extended/libcbor/libcbor_git.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100755 meta-oe/recipes-extended/libcbor/libcbor_git.bb
>
> diff --git a/meta-oe/recipes-extended/libcbor/libcbor_git.bb b/meta-oe/re=
cipes-extended/libcbor/libcbor_git.bb
> new file mode 100755
> index 0000000000..53ba230533
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libcbor/libcbor_git.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "library for CBOR"
> +DESCRIPTION =3D " C library for parsing and generating CBOR, the general=
-purpose schema-less binary data format."
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D6f3b3881df62ca763a02d359a6=
e94071"
> +
> +SRC_URI =3D "git://github.com/PJK/libcbor.git;protocol=3Dhttps;branch=3D=
master"
> +SRCREV =3D "efa6c0886bae46bdaef9b679f61f4b9d8bc296ae"
> +

Please rename the recipe to reflect version libcbor_0.10.2.bb, you are
using the right SHA1 for SRCREV above

> +S =3D "${WORKDIR}/git"
> +PV =3D "git${SRCPV}"

Setting PV is not needed if its using a SRCREV corresponding to a release t=
ag

> +
> +inherit cmake
> --
> 2.34.1
>

