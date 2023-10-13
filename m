Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B8DCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 18:08:32 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.45958.1697220510805256139
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 11:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dkqWwxaI;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6c4c594c0eeso1522198a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697220510; x=1697825310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmWmrQdLFnvehJkiebc3aFiQPN0yUIN6IrgQMkCJ+js=;
        b=dkqWwxaIFEp5cWhNHYliEQC2RmPCzlmkNfBR2YQzwQzGSI+DgOEMuOAVv/ARwjsPso
         N542THCcrHjHLTCgpojBT5FuwSKtn/z9CYtJGHLfBsX2nKBrYDii54X7n9P1aLgjU9Gq
         slnRjJO0w+7l+UzukljaRf5XQ3ebZ52bl35uLGpQ01u7fzi9f0WOrCOWGbTN0Hjv+DGK
         h0B3L/B8KO3dVcl/L0BBTytOT/EYSBf08RBN1Ff97GVPu2wPF+BTLHQyR9kf4JO9d1hh
         bvTt90Jad/lnKGDUsQDzmMwCvbLNyHDRacw7gGyaX4FAbwWrT6BGeznVl1nwnPUqFwQQ
         SsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697220510; x=1697825310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmWmrQdLFnvehJkiebc3aFiQPN0yUIN6IrgQMkCJ+js=;
        b=Rn6XxnjqAYZqtWnb4EDXgWwy918iZFjzHY1ZjxyzgbDuzlB2J4lZj70g1oZlRpBW/W
         Syx5bNqXiovPYREPHsQQXlYvGaJiDZV1vEUYXJBXNg2syF2KgSC+q/a1i2s6PjWFdbmH
         HlDlbuWDs7Xc2rOuVJfRxmjPtY3Es3yVpZcIHxyEaF//tDI801hKP/ZLNrsbbqtYNnDz
         UcD4AIoGyGziqd/5VnQ3vmfuUiKAm24bUCPdxIOLFkiPa1buDvtsnV0JGkyxkf51mPca
         4KvFjk5loc5GhyfQa1541Z4JBEZIl8Npz7EhcbRowaP75agpNMXkmxw1un8TCgUWRpjE
         w4nA==
X-Gm-Message-State: AOJu0YzCUuI4knvGEAGPdQak79bNHAaPE77FJxkqsEgnPqXMuNasWZht
	DyW3RcqoauSpgxniui7pF7/H8Re2YCjACzevzkLmbe7hOUxAFw==
X-Google-Smtp-Source: AGHT+IG5F+m8TjQcngvN2eE8ITE9uePN2MaEKNzwc/Tb04sgXgq5HFCmzC8kkScFmIVr59280t3GHHyE7xZgUBQumYg=
X-Received: by 2002:a05:6870:11d0:b0:1e9:d158:2465 with SMTP id
 16-20020a05687011d000b001e9d1582465mr4237711oav.17.1697220508469; Fri, 13 Oct
 2023 11:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231013170801.3966008-1-tgamblin@baylibre.com>
 <20231013170801.3966008-4-tgamblin@baylibre.com> <CAMKF1sosN6zU2raudiYFbDwCAixjdqApWPWR2yYDBpdY-2egMw@mail.gmail.com>
 <dcb57c79-2849-5b8b-b85c-3d584f98df95@baylibre.com> <9a8c5041-6e21-4bb9-91cc-a6bd3b931d47@gmail.com>
In-Reply-To: <9a8c5041-6e21-4bb9-91cc-a6bd3b931d47@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 11:08:02 -0700
Message-ID: <CAMKF1sqk_v12GA186K5t2NZx27yUYdzDy-guxwGmqnY8=+8Z3w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-pytest-mock: disable broken ptests
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 18:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105490

Fails for me

AssertionError:
Failed ptests:
{'python3-pytest-mock':
['tests/test_pytest_mock.py::test_detailed_introspection_async',
                         'tests/test_pytest_mock.py::test_plain_stopall',

'tests/test_pytest_mock.py::test_used_with_class_scope',

'tests/test_pytest_mock.py::test_used_with_module_scope',

'tests/test_pytest_mock.py::test_used_with_package_scope',

'tests/test_pytest_mock.py::test_used_with_session_scope']}

here is detailed ptest log
https://snips.sh/f/abkZuQSUsK

On Fri, Oct 13, 2023 at 10:33=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On 10/13/23 10:30 AM, Trevor Gamblin wrote:
> >
> > On 2023-10-13 13:15, Khem Raj wrote:
> >> On Fri, Oct 13, 2023 at 10:08=E2=80=AFAM Trevor Gamblin
> >> <tgamblin@baylibre.com> wrote:
> >>> Two introspection-related ptests are consistently failing. For now,
> >>> disable them so that a clean ptest run is available.
> >>>
> >> For regular runs can we  move it out of PTESTS_PROBLEMS_META_PYTHON in=
to
> >> either PTESTS_FAST_META_PYTHON or PTESTS_SLOW_META_PYTHON
> > Done, sent a patch to move both recipes.
>
> Thanks, it will start running in my regular CI jobs now.
>
> >>
> >>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >>> ---
> >>>   ...t_mock-skip-args-introspection-tests.patch | 38 ++++++++++++++++=
+++
> >>>   .../python/python3-pytest-mock_3.11.1.bb      |  1 +
> >>>   2 files changed, 39 insertions(+)
> >>>   create mode 100644
> >>> meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_pyt=
est_mock-skip-args-introspection-tests.patch
> >>>
> >>> diff --git
> >>> a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_p=
ytest_mock-skip-args-introspection-tests.patch b/meta-python/recipes-devtoo=
ls/python/python3-pytest-mock/0001-test_pytest_mock-skip-args-introspection=
-tests.patch
> >>> new file mode 100644
> >>> index 0000000000..f024e79d93
> >>> --- /dev/null
> >>> +++
> >>> b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-test_p=
ytest_mock-skip-args-introspection-tests.patch
> >>> @@ -0,0 +1,38 @@
> >>> +From e184fb950ad3b52c5c16438d39fe4d516c784e30 Mon Sep 17 00:00:00 20=
01
> >>> +From: Trevor Gamblin <tgamblin@baylibre.com>
> >>> +Date: Thu, 12 Oct 2023 17:32:40 -0400
> >>> +Subject: [PATCH] test_pytest_mock: skip args introspection tests
> >>> +
> >>> +Disable these two tests for now so that python3-pytest-mock can have
> >>> +successful ptest runs.
> >>> +
> >>> +Upstream-Status: Inappropriate [OE-Specific]
> >>> +
> >>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >>> +---
> >>> + tests/test_pytest_mock.py | 2 ++
> >>> + 1 file changed, 2 insertions(+)
> >>> +
> >>> +diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
> >>> +index 3d53241..157b6c3 100644
> >>> +--- a/tests/test_pytest_mock.py
> >>> ++++ b/tests/test_pytest_mock.py
> >>> +@@ -581,6 +581,7 @@ def test_assert_called_wrapper(mocker:
> >>> MockerFixture) -> None:
> >>> +     stub.assert_called()
> >>> +
> >>> +
> >>> ++@pytest.mark.skip("Async not correctly detected, skip for now")
> >>> + @pytest.mark.usefixtures("needs_assert_rewrite")
> >>> + def test_assert_called_args_with_introspection(mocker:
> >>> MockerFixture) -> None:
> >>> +     stub =3D mocker.stub()
> >>> +@@ -597,6 +598,7 @@ def
> >>> test_assert_called_args_with_introspection(mocker: MockerFixture) ->
> >>> None:
> >>> +         stub.assert_called_once_with(*wrong_args)
> >>> +
> >>> +
> >>> ++@pytest.mark.skip("Async not correctly detected, skip for now")
> >>> + @pytest.mark.usefixtures("needs_assert_rewrite")
> >>> + def test_assert_called_kwargs_with_introspection(mocker:
> >>> MockerFixture) -> None:
> >>> +     stub =3D mocker.stub()
> >>> +--
> >>> +2.41.0
> >>> +
> >>> diff --git
> >>> a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
> >>> b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
> >>> index 69d74567c3..7fd998edc6 100644
> >>> --- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.=
bb
> >>> +++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.=
bb
> >>> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D " \
> >>>   SRC_URI =3D " \
> >>>
> >>> git://github.com/pytest-dev/pytest-mock;branch=3Dmain;protocol=3Dhttp=
s \
> >>>       file://run-ptest \
> >>> +    file://0001-test_pytest_mock-skip-args-introspection-tests.patch=
 \
> >>>   "
> >>>
> >>>   SRCREV ?=3D "d3e73f2e93f7b93eba0a36e17e43bafd969da4fe"
> >>> --
> >>> 2.41.0
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#105483):
> >>> https://lists.openembedded.org/g/openembedded-devel/message/105483
> >>> Mute This Topic: https://lists.openembedded.org/mt/101944758/1997914
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe:
> >>> https://lists.openembedded.org/g/openembedded-devel/unsub
> >>> [raj.khem@gmail.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>

