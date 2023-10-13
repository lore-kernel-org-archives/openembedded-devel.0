Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C413DCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:15:51 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.44555.1697217350452918861
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YhHS/0lM;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so1342982fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697217349; x=1697822149; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUyBCVkjKcyEqPFGAAoAB5vM601fuICEFfyClVYQtfs=;
        b=YhHS/0lMov7226ERHIse3vfkKU2adWQ5rmZ0TusfnAHwQzb73ImoAoxKa/mvvVBMaF
         bCz2URP9OJRz601iavztB7uT5pvoDSSnk49VyO2K5rcCrEbMxkUoGO2NPxSI7rxAMHrC
         lzKSCxfgq5mZKdinFFpIjekWXvDIsZ1pLCFFkwwErmTDgDgk22+88Mj8CRyTwuyKr3Ak
         YfsKjE47+zxfdzMYQFBJ+U6YYD2i+82wTeLRSuVOUKj/hlPpjdtn2Wsc75OhzlEaVIx2
         W0fwp7yBrX2jEWhnbw53QCvZlXXBhpIGApaXB7E2U2YwwErLcv+cCZiEuym82wzPNMzc
         4/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697217349; x=1697822149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUyBCVkjKcyEqPFGAAoAB5vM601fuICEFfyClVYQtfs=;
        b=qFEXIO4PajE3Id5XjKk3l8ExUUozmi/M/SwqdV9GfU/gOiIJM53ugFcxUBHc3UkdF7
         stgljQIEqmKj3NfvL4z50swUOOM4nQn4nxOvzyO8xBbjn0LI5rJJfVp0njkMIxVZrgDo
         KFus33oeVK9iu/lIiTADd/T20/Z/sy1vnaVdSa5dE6SS1aHr5Ndqu3vsIGdYPdHc33HF
         2XnATQFyndJAUxfbHxeTWFzN3YMXbJnj0rhJc1pnJeJbftfgxpQtLix+CGa8uRTZ2fG+
         3T4AlteHNWGUBi16TXFrl4HArYAX40U9L12N3fxRayLLVNRnto5isPEYMgEjbsrFoWJS
         UZnA==
X-Gm-Message-State: AOJu0YzWWOQB22ZD/3WKE41h1l2kq24n3JM0uzpSjblrrU+d52VcsEDn
	jrgf7Pp52Ov5Msil9tq0spS6o6Lnec4PWT70CL4=
X-Google-Smtp-Source: AGHT+IG0fcNtiKJ3b31cZ+6AIc3wT8/Wzt/Wu5MkObhGzkkZrPtoBnJn8b2L5B8/f0dieskKaPGKcx/mlhHZDxeHaBo=
X-Received: by 2002:a05:6871:106:b0:1e9:af65:5612 with SMTP id
 y6-20020a056871010600b001e9af655612mr6965157oab.42.1697217349623; Fri, 13 Oct
 2023 10:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231013170801.3966008-1-tgamblin@baylibre.com> <20231013170801.3966008-4-tgamblin@baylibre.com>
In-Reply-To: <20231013170801.3966008-4-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 10:15:23 -0700
Message-ID: <CAMKF1sosN6zU2raudiYFbDwCAixjdqApWPWR2yYDBpdY-2egMw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-pytest-mock: disable broken ptests
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105485

On Fri, Oct 13, 2023 at 10:08=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.=
com> wrote:
>
> Two introspection-related ptests are consistently failing. For now,
> disable them so that a clean ptest run is available.
>
For regular runs can we  move it out of PTESTS_PROBLEMS_META_PYTHON into
either PTESTS_FAST_META_PYTHON or PTESTS_SLOW_META_PYTHON

> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...t_mock-skip-args-introspection-tests.patch | 38 +++++++++++++++++++
>  .../python/python3-pytest-mock_3.11.1.bb      |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mo=
ck/0001-test_pytest_mock-skip-args-introspection-tests.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/0001=
-test_pytest_mock-skip-args-introspection-tests.patch b/meta-python/recipes=
-devtools/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-intros=
pection-tests.patch
> new file mode 100644
> index 0000000000..f024e79d93
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_p=
ytest_mock-skip-args-introspection-tests.patch
> @@ -0,0 +1,38 @@
> +From e184fb950ad3b52c5c16438d39fe4d516c784e30 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Thu, 12 Oct 2023 17:32:40 -0400
> +Subject: [PATCH] test_pytest_mock: skip args introspection tests
> +
> +Disable these two tests for now so that python3-pytest-mock can have
> +successful ptest runs.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + tests/test_pytest_mock.py | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
> +index 3d53241..157b6c3 100644
> +--- a/tests/test_pytest_mock.py
> ++++ b/tests/test_pytest_mock.py
> +@@ -581,6 +581,7 @@ def test_assert_called_wrapper(mocker: MockerFixture=
) -> None:
> +     stub.assert_called()
> +
> +
> ++@pytest.mark.skip("Async not correctly detected, skip for now")
> + @pytest.mark.usefixtures("needs_assert_rewrite")
> + def test_assert_called_args_with_introspection(mocker: MockerFixture) -=
> None:
> +     stub =3D mocker.stub()
> +@@ -597,6 +598,7 @@ def test_assert_called_args_with_introspection(mocke=
r: MockerFixture) -> None:
> +         stub.assert_called_once_with(*wrong_args)
> +
> +
> ++@pytest.mark.skip("Async not correctly detected, skip for now")
> + @pytest.mark.usefixtures("needs_assert_rewrite")
> + def test_assert_called_kwargs_with_introspection(mocker: MockerFixture)=
 -> None:
> +     stub =3D mocker.stub()
> +--
> +2.41.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11=
.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
> index 69d74567c3..7fd998edc6 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D " \
>  SRC_URI =3D " \
>      git://github.com/pytest-dev/pytest-mock;branch=3Dmain;protocol=3Dhtt=
ps \
>      file://run-ptest \
> +    file://0001-test_pytest_mock-skip-args-introspection-tests.patch \
>  "
>
>  SRCREV ?=3D "d3e73f2e93f7b93eba0a36e17e43bafd969da4fe"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105483): https://lists.openembedded.org/g/openembedde=
d-devel/message/105483
> Mute This Topic: https://lists.openembedded.org/mt/101944758/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

