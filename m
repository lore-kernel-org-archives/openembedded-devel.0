Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF44DC77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 19:21:50 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.118452.1683573709770216462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 12:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XXZLsYlR;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1929d8c009cso3937858fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683573709; x=1686165709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZV5ZXxXAt41WgmuH1PaForOVjlRe81YuVLJw+OXkoM=;
        b=XXZLsYlReS4Uxf+PDFGlhOkB2E/wIK/WMyYFSNg8eQGLDRG6UJmt+HFA3gUflm0Wlk
         senpfL2TVC/cLDei4rrbPq0cgRl5+YHyab2L750uPgLQJrAwLRtft19u1J9T2e9oXcFK
         IYCs4C54/hk3cc4ajSfhrAIhtLKZyyiXK8HjQZBus2JVxWey2TAIeNqUxk6P/kcNiRw5
         hKDAlTA5j+oMqO3p9MW7n9Nem7Vus4PRNyEhhKm8BmzJOjuBdd4+mdki21pfqED6aULC
         pwrc0DhL1h1kkHZWP9mSDA0HC5qdTYNWeggFjJUNWRrvgo3BpF8Hucm6Gz2YqqYGuMG5
         aeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683573709; x=1686165709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZV5ZXxXAt41WgmuH1PaForOVjlRe81YuVLJw+OXkoM=;
        b=eJuivsyH52VZTglO778kPwV8yAmL4BbIo3DwNQLDfmS4mR3dsJqYK7YvZebOhrXPlx
         Z7OojFBbkl1tbBdyDlUsVMon50jTyOOj1iwt0MvcoDevQ9gKehRizpzfFSpJlUNnyOAJ
         cuBtD5CuZJgWDP6tQxnRMq+xy4WoxN452YPPHu7m6mIULKLhUPtyvXErczHVYlRtcX5D
         ZLZsfMo9FIkn9IEvSuAQXpugb97JkvqKsFJL82x5wE5VrsrACD6gu6LOkrxzTd+w1WkA
         rLEGCAwK2t0xFrZrvmCz6cUHppgULYQAoRFbW/YSvSZLP/LGXn21xreyBA+pLFZpnq5w
         pfig==
X-Gm-Message-State: AC+VfDyj2YbBxXcOy/q8MBF9obtS6QoltboOE0QbJpxOcQG1ONTzhJgr
	zjJBMLZufTp/OaalYdhRwdWHzbgcoQ6ZmamustnbfbcENJM=
X-Google-Smtp-Source: ACHHUZ4WYoqt6fhpX6DkWSB79CJBadn3hjn+kVSidiLypI/tzc4GyJ1Fs7FOcZb/4cEA4f+DDt/YU2ggyOqVIpTW1Qk=
X-Received: by 2002:a05:6808:6348:b0:38d:eb54:7ccf with SMTP id
 eb8-20020a056808634800b0038deb547ccfmr103399oib.23.1683573708792; Mon, 08 May
 2023 12:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com> <1683541424-25761-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1683541424-25761-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2023 12:21:22 -0700
Message-ID: <CAMKF1srVxqYkQ7we22O+ZVFMUPnVYom=J7xa+W5eHy7+GwWx8Q@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-requests-toolbelt: upgrade
 0.10.1 -> 1.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 19:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102444

I am seeing test failures on musl

testseries | result_id : oeqa |
runtime_meta-python-ptest-image-python3-requests-toolbelt_qemux86-64_202305=
08161830
    ptestresult.python3-requests-toolbelt.tests/test_dump.py::TestDumpRealR=
esponses::test_dump_all
    ptestresult.python3-requests-toolbelt.tests/test_dump.py::TestDumpRealR=
esponses::test_dump_response
    ptestresult.python3-requests-toolbelt.tests/test_sessions.py::TestBased=
Session::test_prepared_request_override_base
    ptestresult.python3-requests-toolbelt.tests/test_sessions.py::TestBased=
Session::test_prepared_request_with_base
    ptestresult.python3-requests-toolbelt.tests/test_sessions.py::TestBased=
Session::test_request_override_base
    ptestresult.python3-requests-toolbelt.tests/test_sessions.py::TestBased=
Session::test_request_with_base


you can run ptests by enabling ptests distro feature in your build and
then running

bitbake meta-python-ptest-image-fast
bitbake -ctestimage meta-python-ptest-image-fast

On Mon, May 8, 2023 at 3:24=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>     Removed Google App Engine support to allow using urllib3 2.0
>     Ensured the test suite no longer reaches the Internet
>     Added explicit support for Python 3.11
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ts-toolbelt_0.10.1.bb =3D> python3-requests-toolbelt_1.0.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.=
10.1.bb =3D> python3-requests-toolbelt_1.0.0.bb} (90%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbel=
t_0.10.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt=
_1.0.0.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/python3-requests-toolbelt=
_0.10.1.bb
> rename to meta-python/recipes-devtools/python/python3-requests-toolbelt_1=
.0.0.bb
> index b1399c3ed5..6e5491e36e 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.=
1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0=
.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6f14302a4b4099=
009ab38b4dde5f1075"
>  SRC_URI =3D "file://run-ptest \
>            "
>
> -SRC_URI[sha256sum] =3D "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b133=
7626b2abb628a63d"
> +SRC_URI[sha256sum] =3D "7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc=
3921ce23c88d5bc6"
>
>  inherit pypi setuptools3 ptest
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102425): https://lists.openembedded.org/g/openembedde=
d-devel/message/102425
> Mute This Topic: https://lists.openembedded.org/mt/98758070/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

