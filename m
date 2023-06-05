Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830F9C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 18:09:44 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.16234.1685988583948954122
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 11:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GRFHhUOT;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5559cd68b67so3515093eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 11:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685988583; x=1688580583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwJzWPsBWv9Y5SssaHsNLBIADjwV06A7620s/IVvpAE=;
        b=GRFHhUOTofTkFAIPra9Yz9ksKQsiVQm7yd44VWZ7x7nnPXI7rGk/ymSiftwH+48oPr
         94AWrG/FF251YsxBhNCfl8xxfzwcvur2gH0phz51gsPVD3EvUsGbr0QzYFdHUl3r+i3K
         DbmKtip0SVxlCjHDlzZlbMau+e4RSkspMCfjRJ+UGfYjYStcBkPz0vtbSKd30hQl7vxf
         3YK6DvXkc6zGxHVm5DR9cQ7NnMzOJ93YKxASkuyO6kvXzuvR5ID00qQFgcwRWj+jL61v
         mKqiLKzzuoaqfy8sxdp2Qet44QsSulA9CrH1DYpr6gM18e3PZd7sa5UMQudxGVzXCoGO
         3C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685988583; x=1688580583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwJzWPsBWv9Y5SssaHsNLBIADjwV06A7620s/IVvpAE=;
        b=TrLkmTtpVvj+r02jBTVX5C9w+jCSv/6RpgBp25dU+g6YSCnoRvPZZOGXmWdRCTrLQl
         gmvjepBbYkxcs/6rpr7SQ172Hs9polopgdscCkYmgOn8w5Usg6GZBo0W5bWErmCNaXv5
         giCclu06kQTh3B/pj233P+kRzeLEqpBFqyFy2yKT5D9436tKfFxRpR7Iuz/wZyxQk/Hh
         lfFOzyq4WbDA7aDJ8VYwMlQfg3LVi2Ys4nwspHgbjVRq49GOgeBb2GR+2VTKcZsLKR3e
         LLkwqrV/t1/rxlgGYbtxBgsGlnqreqGPRMaEU5bUe7VMo4jEyFYFFc/qesu5hgp/LjTE
         FEEw==
X-Gm-Message-State: AC+VfDw3wRy4+uEvux25PEfBCxzyYl1feDDGfBl0jH/Nb8vexMddby4A
	opvjb0K9h+ioH5MfE/I77TocitHpavUAzweNLQM=
X-Google-Smtp-Source: ACHHUZ6keReCSOztcBOoG75O7dDwF41X7+WeRAqiGAiZk2462v/90mmpTX61cTasUrgpIB8h3op1JQZEWnOljDqF8Pw=
X-Received: by 2002:a4a:d5cc:0:b0:558:a42c:3337 with SMTP id
 a12-20020a4ad5cc000000b00558a42c3337mr433374oot.8.1685988583091; Mon, 05 Jun
 2023 11:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082437.10646-1-brgl@bgdev.pl> <20230531082437.10646-64-brgl@bgdev.pl>
In-Reply-To: <20230531082437.10646-64-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Jun 2023 11:09:17 -0700
Message-ID: <CAMKF1squM9TKU8g1G2-AEEt7sQHeTYZM=g+zfLSvHx8=EMsttQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH 063/149] python3-pytest-mock: add missing
 run-time dependencies
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 18:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103130

on qemux86-64/glibc I am seeing

AssertionError:
Failed ptests:
{'python3-pytest-mock':
['tests/test_pytest_mock.py::test_assert_called_args_with_introspection',

'tests/test_pytest_mock.py::test_assert_called_kwargs_with_introspection',

'tests/test_pytest_mock.py::test_detailed_introspection_async',
                         'tests/test_pytest_mock.py::test_plain_stopall',

'tests/test_pytest_mock.py::test_used_with_class_scope',

'tests/test_pytest_mock.py::test_used_with_module_scope',

'tests/test_pytest_mock.py::test_used_with_package_scope',

'tests/test_pytest_mock.py::test_used_with_session_scope']}


Cannot run ptests without @expectedFailure as ptests are expected to fail

On Wed, May 31, 2023 at 1:26=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add missing RDEPENDS for this package.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../recipes-devtools/python/python3-pytest-mock_3.10.0.bb   | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10=
.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
> index c4e672f33..bf5bc250a 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
> @@ -18,6 +18,12 @@ inherit setuptools3 ptest
>
>  DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
>
> +RDEPENDS:${PN} +=3D " \
> +    python3-asyncio \
> +    python3-pytest \
> +    python3-unittest \
> +"
> +
>  S =3D "${WORKDIR}/git"
>
>  do_install_ptest() {
> --
> 2.39.2
>

