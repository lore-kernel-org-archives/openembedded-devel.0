Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF1DD6C29B
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 21:10:22 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.32820.1732050615058750193
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 13:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHx4xSXV;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7180bd5b79dso1156246a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 13:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732050614; x=1732655414; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31dzdEwdWwFmtGLU8vZKJQYNCIDhhApAS/FVALMwJXM=;
        b=fHx4xSXVQ9fYaBDxYMqzXI0XO0ZFZXyWczj/wfENKdrJfz7A4hHQSJfQxh+zpejNcy
         ht6WaJTpRjMRmks+oyvXnsUJNsDQX8NUJ5AxUbTkK6SJa1/m2D1F1fN1GAY+LlZPZJys
         QbqdG6R5VqHNkAhhfHgCXcn7WLMaEK/xnNLZA3bj2nNCXeoi1wn29hG830C0QTzxA+m+
         0zqf4Qf3PabmFtexjrTMu541NZf4vJI1N45LhwC53sbjnYie7Byeuzaz0PYs3dxhHZ0y
         +A5ebLGx+ZjvK7qorFpWs8bO6muo8UTqy8byXtaWyrA55eKQVBH3N0x6Qztme9qMwGSN
         s52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732050614; x=1732655414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31dzdEwdWwFmtGLU8vZKJQYNCIDhhApAS/FVALMwJXM=;
        b=DdZJ/Tuwq7adFBeHN0YRCwRthV9rhuqGQapRNOdrnumIcQsg/KDILh7+WYcEQdJn4s
         SD0QkwHL9xGn51LaxkNHJvUSQoV4LWLbFiUn0uU6Qie8jLjO1qTD4A2+cqjj1gMT4HMG
         RqeMc73Yy/lmjiu/V3vNwvKLkjRZaYmt/C9+FXMOzWRw4Nsn5ggbNh5LfWCwZhJZrSQN
         Dkn5kmZwrE7BdZ/XzbqZoFqcE5vJkf8i/Ql1i3S0l+cZvMkuKvUkz4dG5ul0ocIMxtso
         5TzHrXKCN0ADkQ2f8WbbcmRFm7rrJaYGH8LDRf9DlMHKm1UXDFu0VVDRR9m8lFLWY4Y4
         2i9g==
X-Gm-Message-State: AOJu0YxQ/CZwcfRA7Eh58PKDxWoTg3qwcmJqMvZcXdMoEPJUMlHmFfVB
	+BcshUaxrhHyUXvNXO0fep8UFlv0NGzlEj88RkzZloSyemGuXm9szKvi/w052mwEqAhwzLChU+/
	wrcPvXpF2LvWVUu2CtO/GrjnS8tM=
X-Google-Smtp-Source: AGHT+IHFdMBO3GISCewHQmuA60gOk0yaCUJWG3Rt+DYGr2ceLlw/HiDrhCj5hOg+d4FywNXWxmCtdHfpQ7Gkhr8uffY=
X-Received: by 2002:a05:6830:2a06:b0:718:12aa:f7b5 with SMTP id
 46e09a7af769-71ab314d135mr423435a34.12.1732050614019; Tue, 19 Nov 2024
 13:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20241109132009.78919-1-jan.vermaete@gmail.com>
In-Reply-To: <20241109132009.78919-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2024 13:09:48 -0800
Message-ID: <CAMKF1sqhg7rdgEdV08y6noadFvc66LFKdnxJa5JXKcW+3xcNEQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-xmlschema: adding ptest
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 21:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113916

Thanks for adding ptests support to this recipe. However, I have
merged the upgrade to 3.4.3 today which was queued in master-next for
a while. Please rebase this patch on top of master or master-next as
of today and resend a v2 please.

On Sat, Nov 9, 2024 at 5:20=E2=80=AFAM Jan Vermaete via lists.openembedded.=
org
<jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:
>
> Running them in qemu took about 6m.
>
> A few tests are ignored with the -k option of pytest.
>   * Because some input files where missing
>   * Windows only tests (although with a skip in the pytest)
>   * tests that needed input()
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../include/ptest-packagelists-meta-python.inc     |  1 +
>  .../python/python3-xmlschema/run-ptest             |  9 +++++++++
>  .../python/python3-xmlschema_3.4.2.bb              | 14 +++++++++++++-
>  3 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-xmlschema=
/run-ptest
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index ee8f957cc..72b4ef5ad 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -91,6 +91,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-wrapt \
>      python3-wsproto \
>      python3-xlrd \
> +    python3-xmlschema \
>      python3-xmltodict \
>      python3-xxhash \
>      python3-yarl \
> diff --git a/meta-python/recipes-devtools/python/python3-xmlschema/run-pt=
est b/meta-python/recipes-devtools/python/python3-xmlschema/run-ptest
> new file mode 100644
> index 000000000..971b45be4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-xmlschema/run-ptest
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +# List of test not to run at ptest
> +#   SKIP: tests/test_locations.py:TestLocations.test_normalize_url_with_=
base_unc_path_on_windows # SKIP Run only on Windows systems
> +#   FAIL: tests/test_package.py:TestPackaging.test_version
> +#   FAIL: tests/test_package.py:TestPackaging.test_elementpath_requireme=
nt
> +#   FAIL: tests/test_package.py:TestPackaging.test_forgotten_debug_state=
ments
> +
> +pytest --automake -k 'not TestLocations and not TestPackaging'
> diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.=
bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
> index b29862b1d..388f69c7c 100644
> --- a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
> @@ -5,11 +5,23 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D26aa26eda991=
a3a2b61c11b62d3fda65"
>
>  SRC_URI[sha256sum] =3D "d35023ea504ea46127302d1297b046d023b96fec5fe4b4b6=
90534ea85b5e9bf8"
>
> -inherit pypi python_setuptools_build_meta
> +SRC_URI:append =3D " file://run-ptest"
> +
> +inherit pypi python_setuptools_build_meta ptest
>
>  RDEPENDS:${PN} +=3D "\
>      python3-elementpath \
>      python3-modules \
>  "
>
> +RDEPENDS:${PN}-ptest +=3D "\
> +    python3-pytest \
> +    python3-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113770): https://lists.openembedded.org/g/openembedde=
d-devel/message/113770
> Mute This Topic: https://lists.openembedded.org/mt/109480868/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

