Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B85DC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:34:39 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.1589.1646087678741276113
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DgyhfifZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id f21so11568344qke.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K88x5gEa66oHQnGAfVMfl92HvcqTHAxc0oTYxMAvk1o=;
        b=DgyhfifZhbdlDr9xhdyPaF/aOcCyv9sOroYfYdTl6tsG39BE1uAV8rBt2tjOkQEeYp
         tEwTEebYMME3rq9wd4TyLsSWF+Z44st/6EKvd4Pn1z1bOfzqaSDtfKJTIrk73pcqUmkF
         Ons+UOL3fBWvo2SIUDS5CTaVlrnj9zCqYnTXsVoyb5J+HTPW55dvSlXLdpYxdCNO4xF0
         0fyg06ahl2ObAQ0tJhBfN+olJyJA9l5E/q170MUnUziSvwwPqqT5+oKb03Zi9ySe5T+i
         UzwXRmpOlAcrF6n2PRExX97c9QIWpcleFqOjUVd2cyAcx5AaFc1r/fKuSY13Bj/MIEm6
         Fa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K88x5gEa66oHQnGAfVMfl92HvcqTHAxc0oTYxMAvk1o=;
        b=UB7HnI8zwNjKZPa6Z15k25edA3jc6Uz9M6Fy/UuxmmqsVKMkRe5G9uFjaMXzGU/Wze
         tSphDmtl840zlCpErl3KQ6ne/yscFhP0WuuhTpL1/Wmm61E7lS3NTo32GMBzY7GjgMsx
         kMF3FxpADOsxjMRG1LEM/49aLdPCFTT8C0RQ6KC/Qk+aXMf9Ac69571l7CRoS09/5bui
         rvq+fNEt8jQ2uphQ3BbfwDD6BiwfboODg4h1WTrTi0kNwFuDesb1ddzkTTdSbBgmV3li
         loYm5eLJ9vRlvcOOI3guioyXDqg4RmCA/sm/NPZHKN5XvUexHXLPvZxVcMDEGG34BwrW
         h8Sg==
X-Gm-Message-State: AOAM533xU1t06IqwLAUcz64kSLFIamaTHWkxs0MvjWuXCN+Wx/Qt+Wij
	bynJpp6XqJh4weqrABrtXfkv29EegXluSvQY2ps=
X-Google-Smtp-Source: 
 ABdhPJwlY1EsCMXQS57IaIHTN6OTKr8E5+q880oVKHmm3/NQBFQKi1QUc4ZRYG9212CMe81XFwjIul56Xs+3zzS6ilg=
X-Received: by 2002:a05:620a:1593:b0:60a:b223:893a with SMTP id
 d19-20020a05620a159300b0060ab223893amr12634419qkk.72.1646087677736; Mon, 28
 Feb 2022 14:34:37 -0800 (PST)
MIME-Version: 1.0
References: <20220228215547.17414-1-jsbronder@cold-front.org>
In-Reply-To: <20220228215547.17414-1-jsbronder@cold-front.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 14:34:11 -0800
Message-ID: 
 <CAMKF1soSRc1dFegS7Me0xcjJU3NfO2BCH-=o-wawjBHSnb4dqA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-termcolor: drop recipe
To: Justin Bronder <jsbronder@cold-front.org>,
 Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:34:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95603

Hongxu added this recipe in 2019, I would like to hear from him. Maybe
he has future plans for this recipe.

On Mon, Feb 28, 2022 at 1:55 PM Justin Bronder <jsbronder@cold-front.org> wrote:
>
> No releases since 2011, no upstream repository and does not build with
> bdist_wheel.  If you depend upon this recipe, please work with upstream
> to update the package to PEP-517 packaging.
>
> Note that there are alternatives on PyPI and numerous forks on github,
> but none appear to have become canonical.
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  .../packagegroups/packagegroup-meta-python.bb        |  1 -
>  .../python/python3-termcolor_1.1.0.bb                | 12 ------------
>  2 files changed, 13 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 9626231bba..dbfa991ebe 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-sympy \
>      python3-tabulate \
>      python3-term \
> -    python3-termcolor \
>      python3-textparser \
>      python3-texttable \
>      python3-thrift \
> diff --git a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> deleted file mode 100644
> index 17df7f983d..0000000000
> --- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "ANSII Color formatting for output in terminal"
> -HOMEPAGE = "https://pypi.python.org/pypi/termcolor"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
> -SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
> -
> -BBCLASSEXTEND = "native"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95597): https://lists.openembedded.org/g/openembedded-devel/message/95597
> Mute This Topic: https://lists.openembedded.org/mt/89462395/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

