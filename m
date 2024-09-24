Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30154CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 05:28:21 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.7010.1727155693117883729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 22:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IDHbjCFG;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1b50fea4bso2940661eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 22:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727155692; x=1727760492; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVU/0ddP5wqDOW7luAUwP8gGHePueScRtKo7R1ED+gg=;
        b=IDHbjCFGkpig3FZwvQXaN0ifLImMRtyZEbcI7LxWsq98iCZQieSep8+q33NgGHYjgE
         JMSVVAraQ4OvVIyNVOIhNrrAkgP9VQtlDnED6kJKezblvQmG6fBG6oEoepLkA/qs62eL
         9PSsO2h6MzeliUFOHbhBgS2SZeg7P++wCm/lVUWu3oUoVOiE2hUFLhYHAKC6K9HKoIAN
         Iwvu0bnuN1xzv1+9NEjKOapxeejbMmFxse1yfC26lDU147rfWL0Dk5ZGwstbMIkOiekD
         Xjd55QmgvMRJ3Y+vSUvQgVHviek40xJuFZWh//u+98VjmtOIGNsYagmIok1ghLcce0pC
         hchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727155692; x=1727760492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVU/0ddP5wqDOW7luAUwP8gGHePueScRtKo7R1ED+gg=;
        b=wexwq6Ul2Zr2ShbSzw0njbMxrAFU1RbeZa10DpiROH0jH8C2mSXEYQf9ZwLKpnuzXc
         72fBGQsLS45JkGotlGtQM8JGcgADscDBL7PycoW3hNUJZP2MGpXYqq2vhrxspDmQt42y
         1KBZA80s9Bp249Bm8MsOFCvkXbNH7BaTKPPaXnAT7qwyE0aKKYNojPpv4w5/G0ADFKWa
         1NVTFy9RaPsNLeLXYws21OoEi/Z2cGmp2BPP7x+2Mmkb9fC9nbvP703Vj8MreIPB7Jue
         A3hd29X3FJQPsdyrIXDFVUWRbzvXaS05uNqD/QvCIa7RcAPSVU5RyXc9Lcgoz3mWBjEq
         hAPw==
X-Gm-Message-State: AOJu0YxlRqXDmD8kT9Kt9rC4+ZzX0Z18C5UGYMkUeJt0VGDMaOwFIeFG
	fVxTBCWVI4VFbsClTyuZ6HmJY8Fqg4qPE0eXZ0cn6+DkRxKLN6jEJdQNiFxNOQKLFKxTZpK7Sm8
	UuKPExI+lDP1G7LD/zfZkWG4ZoRY=
X-Google-Smtp-Source: AGHT+IExnisKZWJUBQlfYBr0I93zVc1UuSod8sI+f6XWzGaZSA9kSw70FSVfXY1JWnxy08SjY5Q5/0MEsCBmvmWZ1zM=
X-Received: by 2002:a05:6820:551:b0:5e5:b882:fd94 with SMTP id
 006d021491bc7-5e5b882ff8bmr820196eaf.7.1727155692202; Mon, 23 Sep 2024
 22:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240924051709.1651709-1-mingli.yu@windriver.com>
In-Reply-To: <20240924051709.1651709-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2024 22:27:46 -0700
Message-ID: <CAMKF1sq7w_FWfwK-3BEM2PQpHDZWE1ee8nix999XeL1CHuFQmQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-setproctitle: Add new recipe
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 05:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112469

On Mon, Sep 23, 2024 at 10:17=E2=80=AFPM Yu, Mingli via lists.openembedded.=
org
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> A Python module to customize the process title.
>  # ./run-ptest
> PASS: tests/module_test.py:test_no_import_side_effect
> PASS: tests/module_test.py:test_version
> PASS: tests/module_test.py:test_c_extension_built
> PASS: tests/setproctitle_test.py:test_runner
> PASS: tests/setproctitle_test.py:test_init_getproctitle
> PASS: tests/setproctitle_test.py:test_setproctitle
> SKIP: tests/setproctitle_test.py:test_setproctitle_darwin # SKIP Mac only=
 test
> PASS: tests/setproctitle_test.py:test_prctl
> PASS: tests/setproctitle_test.py:test_getproctitle
> PASS: tests/setproctitle_test.py:test_kwarg
> PASS: tests/setproctitle_test.py:test_environ
> PASS: tests/setproctitle_test.py:test_issue_8
> PASS: tests/setproctitle_test.py:test_large_cmdline
> PASS: tests/setproctitle_test.py:test_weird_args
> PASS: tests/setproctitle_test.py:test_weird_path
> PASS: tests/setproctitle_test.py:test_embedded
> PASS: tests/setproctitle_test.py:test_embedded_many_args
> PASS: tests/setproctitle_test.py:test_noenv
> PASS: tests/setproctitle_test.py:test_large_env
> PASS: tests/setproctitle_test.py:test_clear_segfault
> PASS: tests/setproctitle_test.py:test_fork_segfault
> PASS: tests/setproctitle_test.py:test_thread_fork_segfault
> PASS: tests/setthreadtitle_test.py:test_thread_title_unchanged
> PASS: tests/setthreadtitle_test.py:test_set_thread_title
> PASS: tests/setthreadtitle_test.py:test_set_threads_title
> SKIP: tests/test_win32.py:test_setproctitle # SKIP Windows only test
> SKIP: tests/test_win32.py:test_setthreadtitle # SKIP Windows only test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Testsuite summary
>  # TOTAL: 27
>  # PASS: 24
>  # SKIP: 3
>  # XFAIL: 0
>  # FAIL: 0
>  # XPASS: 0
>  # ERROR: 0
>

Thanks for adding ptests along,

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../python/python3-setproctitle/run-ptest     |  4 +++
>  .../python/python3-setproctitle_1.3.3.bb      | 28 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-setprocti=
tle/run-ptest
>  create mode 100644 meta-python/recipes-devtools/python/python3-setprocti=
tle_1.3.3.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 92e64908b..e500843e8 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -67,6 +67,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-semver \
>      python3-serpent \
>      python3-service-identity \
> +    python3-setproctitle \
>      python3-simpleeval \
>      python3-smpplib \
>      python3-soupsieve \
> diff --git a/meta-python/recipes-devtools/python/python3-setproctitle/run=
-ptest b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
> new file mode 100644
> index 000000000..e29e57ee3
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +# https://github.com/dvarrazzo/py-setproctitle/issues/141
> +pytest --automake -k 'not test_unicode'
> diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3=
.3.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
> new file mode 100644
> index 000000000..dcae6b468
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "A Python module to customize the process title"
> +DESCRIPTION =3D "The setproctitle module allows a process to change its =
\
> +title (as displayed by system tools such as ps, top or MacOS Activity \
> +Monitor)."
> +HOMEPAGE =3D "https://github.com/dvarrazzo/py-setproctitle"
> +BUGTRACKER =3D "https://github.com/dvarrazzo/py-setproctitle/issues"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D86d2d41b5f4f023f43466f8cb7a=
debaa"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI[sha256sum] =3D "c913e151e7ea01567837ff037a23ca8740192880198b7fbb=
90b16d181607caae"
> +
> +SRC_URI +=3D " \
> +    file://run-ptest \
> +"
> +
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
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112468): https://lists.openembedded.org/g/openembedde=
d-devel/message/112468
> Mute This Topic: https://lists.openembedded.org/mt/108623524/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

