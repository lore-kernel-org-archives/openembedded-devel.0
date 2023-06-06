Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF31C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 15:10:40 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.1204.1686064237497154855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 08:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AIAihBvX;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-43b2fb0afa6so1378010137.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686064236; x=1688656236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W/wAOWCzaeqwOrQn7oW6SeNWvWVRSzbbGbyoGUOTxlg=;
        b=AIAihBvXzE7BHiF9IJMP+9RXLZ2iWC42QIyvilltBoKH23ao0l7GfollbI1lbOkFkw
         7kKH/Uc1ynRSV/dpdP0BU8z/hrxkuhhyYu+//sYkP9iqvGRVfyIgqsLkJlT3Vh7Q2qJN
         X/fI7F2KNMwbReJRiwJUg67g+Z70Q2UlbsswF/EpWa4DGVOTlkwc8S44SWvQ+5pcOaVI
         nablac50dUs95GuBhbQG+1mYSoDc/9jdmmf+JUciXfGVus0qVX+vtTrUxPGJgU7WHUPy
         JS2dkc8HPNGjMVKr+CnX5zUhAEzo7NM3AOvtCbtNCyQ7e1Xtkz/TPojqIeXtSYIaFZZg
         3kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064236; x=1688656236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/wAOWCzaeqwOrQn7oW6SeNWvWVRSzbbGbyoGUOTxlg=;
        b=S/fouxao/4D8ib5RG5nlGl+CjxDkNBkC4q2nYcZCRYBb173JIXDFabsAIbipeO0QgY
         q6v6D6TMrovlITD73OFhbCmmagKgPKFaMHQIijTomc8WGvWNav2HxZlfFYraJ6kJHyTf
         +P/N5GQRL9gTd49NbdpZarNpSEgpCiT8uHzrvRCboQdCTgeUYmPgkBos0dhF0fXkkc8O
         cK6OiDddk9eXBGv+YQqXN1DL2L7Yk6FPilRzlJvv8PbEnyng3AZD2DiNDoyWncTpIcRb
         panOpJNsHJAm7REtAPTTbwqzxd3mBhqKOPr9bbmabDLJk9k5pPh2+FaWnSQSkl6l+MK7
         PUAg==
X-Gm-Message-State: AC+VfDwAPuarsIhWBOJ+KNljMrh27LMsVfZMhjoo84NbCFZIQSih96FJ
	Nt2DW05SeHiF5cv2julJXbF74XwImnAJVUFjUmI=
X-Google-Smtp-Source: ACHHUZ5CdQoqDxbrC0hlBJj9VyZIlZ9aSzGa0P7FrdZWOSAG7jUQHco1WanESeb2iFS0WyZ7ZpNQph2186srIMiizZ4=
X-Received: by 2002:a67:f850:0:b0:43b:16cf:1dda with SMTP id
 b16-20020a67f850000000b0043b16cf1ddamr1235520vsp.27.1686064236344; Tue, 06
 Jun 2023 08:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082437.10646-1-brgl@bgdev.pl> <20230531082437.10646-64-brgl@bgdev.pl>
 <CAMKF1squM9TKU8g1G2-AEEt7sQHeTYZM=g+zfLSvHx8=EMsttQ@mail.gmail.com> <CAMRc=Md49MHXQxxY3w_=Uhn1BpyScu1196BWM7OR_4KMp_kCnw@mail.gmail.com>
In-Reply-To: <CAMRc=Md49MHXQxxY3w_=Uhn1BpyScu1196BWM7OR_4KMp_kCnw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2023 08:10:25 -0700
Message-ID: <CAMKF1spCj3MRURdXzVy-HU=0O+4n5pse5hxb6vBx2A9s+frbdw@mail.gmail.com>
Subject: Re: [meta-python][PATCH 063/149] python3-pytest-mock: add missing
 run-time dependencies
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e03b3f05fd776b09"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 15:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103147

--000000000000e03b3f05fd776b09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 2:05 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Mon, Jun 5, 2023 at 8:09=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > on qemux86-64/glibc I am seeing
> >
> > AssertionError:
> > Failed ptests:
> > {'python3-pytest-mock':
> > ['tests/test_pytest_mock.py::test_assert_called_args_with_introspection=
',
> >
> >
> 'tests/test_pytest_mock.py::test_assert_called_kwargs_with_introspection'=
,
> >
> > 'tests/test_pytest_mock.py::test_detailed_introspection_async',
> >                          'tests/test_pytest_mock.py::test_plain_stopall=
',
> >
> > 'tests/test_pytest_mock.py::test_used_with_class_scope',
> >
> > 'tests/test_pytest_mock.py::test_used_with_module_scope',
> >
> > 'tests/test_pytest_mock.py::test_used_with_package_scope',
> >
> > 'tests/test_pytest_mock.py::test_used_with_session_scope']}
> >
> >
> > Cannot run ptests without @expectedFailure as ptests are expected to fa=
il
> >
>
> I'm not sure I follow. Without this patch the ptests can't even be
> started as pytest is not available for import, so it's not really a
> regression.


That=E2=80=99s fine all we need it disable from auto run

>
>
> Bart
>
> > On Wed, May 31, 2023 at 1:26=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl>
> wrote:
> > >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Add missing RDEPENDS for this package.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  .../recipes-devtools/python/python3-pytest-mock_3.10.0.bb   | 6
> ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-mock_3.10.0.bb b/meta-python/recipes-devtools/python/
> python3-pytest-mock_3.10.0.bb
> > > index c4e672f33..bf5bc250a 100644
> > > --- a/meta-python/recipes-devtools/python/
> python3-pytest-mock_3.10.0.bb
> > > +++ b/meta-python/recipes-devtools/python/
> python3-pytest-mock_3.10.0.bb
> > > @@ -18,6 +18,12 @@ inherit setuptools3 ptest
> > >
> > >  DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> > >
> > > +RDEPENDS:${PN} +=3D " \
> > > +    python3-asyncio \
> > > +    python3-pytest \
> > > +    python3-unittest \
> > > +"
> > > +
> > >  S =3D "${WORKDIR}/git"
> > >
> > >  do_install_ptest() {
> > > --
> > > 2.39.2
> > >
>

--000000000000e03b3f05fd776b09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 6, 2023 at 2:05 AM Bartosz Golaszewski &lt;<a h=
ref=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Mon, Jun 5, 2023 at 8:09=E2=80=AFPM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; on qemux86-64/glibc I am seeing<br>
&gt;<br>
&gt; AssertionError:<br>
&gt; Failed ptests:<br>
&gt; {&#39;python3-pytest-mock&#39;:<br>
&gt; [&#39;tests/test_pytest_mock.py::test_assert_called_args_with_introspe=
ction&#39;,<br>
&gt;<br>
&gt; &#39;tests/test_pytest_mock.py::test_assert_called_kwargs_with_introsp=
ection&#39;,<br>
&gt;<br>
&gt; &#39;tests/test_pytest_mock.py::test_detailed_introspection_async&#39;=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;tests/test_pytest_mock.py::test_plain_stopall&#39=
;,<br>
&gt;<br>
&gt; &#39;tests/test_pytest_mock.py::test_used_with_class_scope&#39;,<br>
&gt;<br>
&gt; &#39;tests/test_pytest_mock.py::test_used_with_module_scope&#39;,<br>
&gt;<br>
&gt; &#39;tests/test_pytest_mock.py::test_used_with_package_scope&#39;,<br>
&gt;<br>
&gt; &#39;tests/test_pytest_mock.py::test_used_with_session_scope&#39;]}<br=
>
&gt;<br>
&gt;<br>
&gt; Cannot run ptests without @expectedFailure as ptests are expected to f=
ail<br>
&gt;<br>
<br>
I&#39;m not sure I follow. Without this patch the ptests can&#39;t even be<=
br>
started as pytest is not available for import, so it&#39;s not really a<br>
regression.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That=
=E2=80=99s fine all we need it disable from auto run=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex" dir=3D"auto"><br>
<br>
Bart<br>
<br>
&gt; On Wed, May 31, 2023 at 1:26=E2=80=AFAM Bartosz Golaszewski &lt;<a hre=
f=3D"mailto:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt; From: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.golaszews=
ki@linaro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Add missing RDEPENDS for this package.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.=
golaszewski@linaro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</a=
>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-pytes=
t-mock_3.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-mock_=
3.10.0.bb</a>=C2=A0 =C2=A0| 6 ++++++<br>
&gt; &gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-pytest-mock_3.10.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-pytest-mock_3.10.0.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pytest-mock_3.10.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-pytest-mock_3.10.0.bb</a><br>
&gt; &gt; index c4e672f33..bf5bc250a 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-pytest-mock_3.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyte=
st-mock_3.10.0.bb</a><br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-pytest-mock_3.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyte=
st-mock_3.10.0.bb</a><br>
&gt; &gt; @@ -18,6 +18,12 @@ inherit setuptools3 ptest<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS +=3D &quot;${PYTHON_PN}-setuptools-scm-native&quot;=
<br>
&gt; &gt;<br>
&gt; &gt; +RDEPENDS:${PN} +=3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-asyncio \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-unittest \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_install_ptest() {<br>
&gt; &gt; --<br>
&gt; &gt; 2.39.2<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000e03b3f05fd776b09--

