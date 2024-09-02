Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA71CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 09:20:27 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.34751.1725268822067022760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 02:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W21gJ5yB;
 spf=pass (domain: smile.fr, ip: 209.85.218.54, mailfrom: alexandre.truong@smile.fr)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a83562f9be9so366004666b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725268820; x=1725873620; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Oj6MjzmYNYdPWQJtqkJf9nlHBcegwrxa5lcbLibFPI=;
        b=W21gJ5yByljVE946D5Nx3nXCEo281YKYpiSNG9dMoFagK+P9ZIinwvp2mUSF3GvRU5
         cCSxIJ3nOHDBdyVAdFlytf1LvCGKd72FRDCHFJMfZxYGrlXAILwLasdmaTtUai+5+Bc0
         FWq3f+yWwM9xbxT3My5dbWl4ccpDG2wAqilM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725268820; x=1725873620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Oj6MjzmYNYdPWQJtqkJf9nlHBcegwrxa5lcbLibFPI=;
        b=DUWTr6MhwSCagZ9cH7f1kwZA7X3rqfQbLaoNrZAHldzqGnl7vG0rjHOnsdr/7Q4hee
         YLKwdxhHqTHCwh9e6kFN4RWts1EYoQedDu0ixlqZno30cLDi1NZHmcn6AkcRqQbiFGz5
         hk+1zM/1yXVUxuujn40ReQBzRz24sQINi6sH24OA3Dy/ni0RDme/WDq6zsNyjEQQt3T7
         Z/ioYJKg0Ql6PO2cMiYpplwyGuy8vGsH87YEqm8Hd+BanMDT7UtBJmoVLGyPUJEHPE52
         JI8CsQFxY0OaSVwLK3UhQcerYrCBuwSMr7bX+XR64Zqt4ow/vdKWzKO2Anygo5bjSmPC
         35eA==
X-Gm-Message-State: AOJu0YxcQwhNHKVk8L81R3yUxu08tvAyVag3CXMbnxTCZYqO9qyXLbgb
	wCy/Ph3KFlm13f5bV6WlTQI0s/hEjZ0r8yh47WEcYgQFCQfDPtrdsQXOufxwc4bYCIe27av0sm2
	kDfDboPAvmC42JCSbFVsIev7eznNeIOwmXvNfug==
X-Google-Smtp-Source: AGHT+IF3grTitsfTVN90OuKrKZrkifY/Uuq3hzoCuDxOnpTyHixb5phDMr06hxDyIgLDFe2/UNcY4PWrxvVodYJAu70=
X-Received: by 2002:a17:907:2da4:b0:a7a:9447:3e8c with SMTP id
 a640c23a62f3a-a89b93dc610mr489889566b.3.1725268819937; Mon, 02 Sep 2024
 02:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240829162046.49426-1-alexandre.truong@smile.fr> <CAMKF1sobQkKho_g5ZBXG+qESxf-8bhsyqgfv=uBSh6mG_8hV+g@mail.gmail.com>
In-Reply-To: <CAMKF1sobQkKho_g5ZBXG+qESxf-8bhsyqgfv=uBSh6mG_8hV+g@mail.gmail.com>
From: Alexandre TRUONG <alexandre.truong@smile.fr>
Date: Mon, 2 Sep 2024 11:20:09 +0200
Message-ID: <CAN21hX7iggNQgfzLOhJm72=uwGSm2w3CsMKnM8pTnx3DRw9rTw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pegtl: add ptest support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="00000000000027a97e06211f7339"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 09:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112068

--00000000000027a97e06211f7339
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your reply, here is how I'm running it:

I'm running the test on meta-oe-image-ptest-pegtl.

I'm doing
runqemu nographic slirp
./tmp/deploy/images/qemux86-64/meta-oe-image-ptest-pegtl-qemux86-64.rootfs.=
qemuboot.conf

then ptest-runner pegtl

Alexandre Truong

Le jeu. 29 ao=C3=BBt 2024 =C3=A0 18:36, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :

> Thanks for adding to ptests, it's quite an important part of the project
> Its not clear if the test was run on recipe specific ptest image or
> part of some larger general purpose image.
>
> e.g. for MACHINE=3Dqemux86-64
>
> bitbake meta-oe-image-ptest-pegtl
>
> would build it and
>
> bitbake meta-oe-image-ptest-pegtl -ctestimage
>
> would run it.
>
> This is to ensure that recipe includes all the needed rdeps for ptests to
> run
>
> On Thu, Aug 29, 2024 at 9:21=E2=80=AFAM Alexandre Truong via
> lists.openembedded.org
> <alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > From: Alexandre Truong <alexandre.truong@smile.fr>
> >
> > Test added to the fast-list.
> >
> > Result of ptest-runner:
> >
> > root@qemux86-64:~# ptest-runner pegtl
> > START: ptest-runner
> > 2024-08-29T13:57
> > BEGIN: /usr/lib/pegtl/ptest
> > PASS: src/test/pegtl/pegtl-test-action_enable
> > PASS: src/test/pegtl/pegtl-test-action_match
> > PASS: src/test/pegtl/pegtl-test-actions_one
> > [...]
> > PASS: src/test/pegtl/pegtl-test-utf8_general
> > PASS: src/test/pegtl/pegtl-test-visit
> > PASS: All 128 tests passed
> > DURATION: 4
> > END: /usr/lib/pegtl/ptest
> > 2024-08-29T13:57
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > NB: two tests are being skipped with a exception raised as support is
> disabled
> >
> > Exception support disabled, skipping test...
> > PASS: src/test/pegtl/pegtl-test-internal_file_mapper
> > Exception support disabled, skipping test...
> > PASS: src/test/pegtl/pegtl-test-internal_file_opener
> >
> > Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> > Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  .../include/ptest-packagelists-meta-oe.inc    |  1 +
> >  .../recipes-extended/pegtl/pegtl/run-ptest    | 23 +++++++++++++++++++
> >  meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb | 15 ++++++++++--
> >  3 files changed, 37 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-oe/recipes-extended/pegtl/pegtl/run-ptest
> >
> > diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > index 01bf975a15..0ea43f5972 100644
> > --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > @@ -33,6 +33,7 @@ PTESTS_FAST_META_OE =3D "\
> >      nodejs \
> >      onig \
> >      oprofile \
> > +    pegtl \
> >      protobuf \
> >      pv \
> >      python3-pefile \
> > diff --git a/meta-oe/recipes-extended/pegtl/pegtl/run-ptest
> b/meta-oe/recipes-extended/pegtl/pegtl/run-ptest
> > new file mode 100644
> > index 0000000000..e819628c9f
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/pegtl/pegtl/run-ptest
> > @@ -0,0 +1,23 @@
> > +#!/bin/sh
> > +
> > +fail_count=3D0
> > +all_count=3D0
> > +
> > +for test_suite in src/test/pegtl/pegtl-test-*
> > +do
> > +    if "./$test_suite"
> > +    then
> > +        echo "PASS: $test_suite"
> > +    else
> > +        echo "FAIL: $test_suite"
> > +        fail_count=3D$((fail_count + 1))
> > +    fi
> > +    all_count=3D$((all_count + 1))
> > +done
> > +
> > +if [ $fail_count -eq 0 ]
> > +then
> > +    echo "PASS: All $all_count tests passed"
> > +else
> > +    echo "FAIL: $fail_count of $all_count tests failed"
> > +fi
> > diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
> b/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
> > index 237828dbfc..2e32e3e788 100644
> > --- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
> > +++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
> > @@ -3,11 +3,22 @@ HOMEPAGE=3D"https://github.com/taocpp/PEGTL"
> >  LICENSE=3D"MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddccf35ef30bf912bb07b01d4699=
65293"
> >
> > -SRC_URI =3D "git://github.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=
=3D3.x"
> > +SRC_URI =3D " \
> > +       git://github.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=3D3.x=
 \
> > +       file://run-ptest \
> > +"
> > +
> >  SRCREV =3D "cf639f7f4ee125f68e1ccfba8d99ebc0de57b9fe"
> >
> > -inherit cmake
> > +inherit cmake ptest
> >
> >  S =3D "${WORKDIR}/git"
> >
> > +do_install_ptest () {
> > +    install -d ${D}${PTEST_PATH}/src/test/pegtl/data
> > +    install -m 0755 ${B}/src/test/pegtl/pegtl-test-*
> ${D}${PTEST_PATH}/src/test/pegtl
> > +    install ${S}/src/test/pegtl/file_*.txt
> ${D}${PTEST_PATH}/src/test/pegtl
> > +    install ${S}/src/test/pegtl/data/*.json
> ${D}${PTEST_PATH}/src/test/pegtl/data
> > +}
> > +
> >  CXXFLAGS +=3D " -Wno-error=3Dtype-limits"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112035):
> https://lists.openembedded.org/g/openembedded-devel/message/112035
> > Mute This Topic: https://lists.openembedded.org/mt/108164523/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000027a97e06211f7339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for your reply, here is how I&#39;m running it=
:<br></div><div><br></div>I&#39;m running the test on meta-oe-image-ptest-p=
egtl.<div><br><div>I&#39;m doing=C2=A0</div><div>runqemu nographic slirp ./=
tmp/deploy/images/qemux86-64/meta-oe-image-ptest-pegtl-qemux86-64.rootfs.qe=
muboot.conf</div></div><div><br></div><div>then ptest-runner pegtl</div><di=
v><br></div><div>Alexandre Truong</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 29 ao=C3=BBt 2024 =C3=
=A0=C2=A018:36, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Thanks for adding to ptests, it&#39;s quite an impor=
tant part of the project<br>
Its not clear if the test was run on recipe specific ptest image or<br>
part of some larger general purpose image.<br>
<br>
e.g. for MACHINE=3Dqemux86-64<br>
<br>
bitbake meta-oe-image-ptest-pegtl<br>
<br>
would build it and<br>
<br>
bitbake meta-oe-image-ptest-pegtl -ctestimage<br>
<br>
would run it.<br>
<br>
This is to ensure that recipe includes all the needed rdeps for ptests to r=
un<br>
<br>
On Thu, Aug 29, 2024 at 9:21=E2=80=AFAM Alexandre Truong via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;alexandre.truong=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" t=
arget=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Alexandre Truong &lt;<a href=3D"mailto:alexandre.truong@smile.fr=
" target=3D"_blank">alexandre.truong@smile.fr</a>&gt;<br>
&gt;<br>
&gt; Test added to the fast-list.<br>
&gt;<br>
&gt; Result of ptest-runner:<br>
&gt;<br>
&gt; root@qemux86-64:~# ptest-runner pegtl<br>
&gt; START: ptest-runner<br>
&gt; 2024-08-29T13:57<br>
&gt; BEGIN: /usr/lib/pegtl/ptest<br>
&gt; PASS: src/test/pegtl/pegtl-test-action_enable<br>
&gt; PASS: src/test/pegtl/pegtl-test-action_match<br>
&gt; PASS: src/test/pegtl/pegtl-test-actions_one<br>
&gt; [...]<br>
&gt; PASS: src/test/pegtl/pegtl-test-utf8_general<br>
&gt; PASS: src/test/pegtl/pegtl-test-visit<br>
&gt; PASS: All 128 tests passed<br>
&gt; DURATION: 4<br>
&gt; END: /usr/lib/pegtl/ptest<br>
&gt; 2024-08-29T13:57<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
&gt;<br>
&gt; NB: two tests are being skipped with a exception raised as support is =
disabled<br>
&gt;<br>
&gt; Exception support disabled, skipping test...<br>
&gt; PASS: src/test/pegtl/pegtl-test-internal_file_mapper<br>
&gt; Exception support disabled, skipping test...<br>
&gt; PASS: src/test/pegtl/pegtl-test-internal_file_opener<br>
&gt;<br>
&gt; Signed-off-by: Alexandre Truong &lt;<a href=3D"mailto:alexandre.truong=
@smile.fr" target=3D"_blank">alexandre.truong@smile.fr</a>&gt;<br>
&gt; Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
 target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
&gt;=C2=A0 .../recipes-extended/pegtl/pegtl/run-ptest=C2=A0 =C2=A0 | 23 +++=
++++++++++++++++<br>
&gt;=C2=A0 meta-oe/recipes-extended/pegtl/<a href=3D"http://pegtl_3.2.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">pegtl_3.2.7.bb</a> | 15 ++++++++++--<=
br>
&gt;=C2=A0 3 files changed, 37 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl/run-ptes=
t<br>
&gt;<br>
&gt; diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/met=
a-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; index 01bf975a15..0ea43f5972 100644<br>
&gt; --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; @@ -33,6 +33,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nodejs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 onig \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oprofile \<br>
&gt; +=C2=A0 =C2=A0 pegtl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 protobuf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pv \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-pefile \<br>
&gt; diff --git a/meta-oe/recipes-extended/pegtl/pegtl/run-ptest b/meta-oe/=
recipes-extended/pegtl/pegtl/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e819628c9f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/pegtl/pegtl/run-ptest<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +fail_count=3D0<br>
&gt; +all_count=3D0<br>
&gt; +<br>
&gt; +for test_suite in src/test/pegtl/pegtl-test-*<br>
&gt; +do<br>
&gt; +=C2=A0 =C2=A0 if &quot;./$test_suite&quot;<br>
&gt; +=C2=A0 =C2=A0 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $test_suite&quot;<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $test_suite&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_count=3D$((fail_count + 1))<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 all_count=3D$((all_count + 1))<br>
&gt; +done<br>
&gt; +<br>
&gt; +if [ $fail_count -eq 0 ]<br>
&gt; +then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;PASS: All $all_count tests passed&quot;<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 echo &quot;FAIL: $fail_count of $all_count tests failed=
&quot;<br>
&gt; +fi<br>
&gt; diff --git a/meta-oe/recipes-extended/pegtl/<a href=3D"http://pegtl_3.=
2.7.bb" rel=3D"noreferrer" target=3D"_blank">pegtl_3.2.7.bb</a> b/meta-oe/r=
ecipes-extended/pegtl/<a href=3D"http://pegtl_3.2.7.bb" rel=3D"noreferrer" =
target=3D"_blank">pegtl_3.2.7.bb</a><br>
&gt; index 237828dbfc..2e32e3e788 100644<br>
&gt; --- a/meta-oe/recipes-extended/pegtl/<a href=3D"http://pegtl_3.2.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">pegtl_3.2.7.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/pegtl/<a href=3D"http://pegtl_3.2.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">pegtl_3.2.7.bb</a><br>
&gt; @@ -3,11 +3,22 @@ HOMEPAGE=3D&quot;<a href=3D"https://github.com/taocp=
p/PEGTL" rel=3D"noreferrer" target=3D"_blank">https://github.com/taocpp/PEG=
TL</a>&quot;<br>
&gt;=C2=A0 LICENSE=3D&quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddccf35ef30bf912b=
b07b01d469965293&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/taocpp/PEGTL.git=
;protocol=3Dhttps;branch=3D3.x" rel=3D"noreferrer" target=3D"_blank">github=
.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=3D3.x</a>&quot;<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/taocpp/=
PEGTL.git;protocol=3Dhttps;branch=3D3.x" rel=3D"noreferrer" target=3D"_blan=
k">github.com/taocpp/PEGTL.git;protocol=3Dhttps;branch=3D3.x</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 SRCREV =3D &quot;cf639f7f4ee125f68e1ccfba8d99ebc0de57b9fe&quot;<=
br>
&gt;<br>
&gt; -inherit cmake<br>
&gt; +inherit cmake ptest<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; +do_install_ptest () {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/src/test/pegtl/data<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${B}/src/test/pegtl/pegtl-test-* ${D}${=
PTEST_PATH}/src/test/pegtl<br>
&gt; +=C2=A0 =C2=A0 install ${S}/src/test/pegtl/file_*.txt ${D}${PTEST_PATH=
}/src/test/pegtl<br>
&gt; +=C2=A0 =C2=A0 install ${S}/src/test/pegtl/data/*.json ${D}${PTEST_PAT=
H}/src/test/pegtl/data<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 CXXFLAGS +=3D &quot; -Wno-error=3Dtype-limits&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#112035): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/112035" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/112035</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10816452=
3/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/108164523/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000027a97e06211f7339--

