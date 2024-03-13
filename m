Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214A3C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 23:17:50 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.10946.1710371869085147417
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 16:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kz/hr3g4;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-609fb19ae76so4307047b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710371868; x=1710976668; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rWBcAuMVdM8tJlOJBaylj1IasXP4e/van639rGiKMpg=;
        b=kz/hr3g4qtYNyfMHhl5mK73exTA5gReCqyT79KauZsQ/6AJ+1Za0FjTzNFN4FUtbpM
         utRQTl+SpUImboGujbAccreF15faUh25rs07m1/baZk1fd1TgMEuZVkxdscivQbQV8Yu
         I0xPxGMCbDHqGntTCLdNrcupEwt5AkMRwiwLvxtgVRb3RE48vRuJPbtjs3q5BsO/8+2B
         W43Hguzwtb4tjvwMHF0vzQCl4IfYHhh5z79NGC+m6FNkt1SlpNwMRTUParzAmEsxZ6Gs
         qoo6bE7XVsA4jEvZj/VETNWIFnNaMzh0ihxTPT98HsOlAQKe8ttMPFhpRID3BCh87DWL
         ttIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710371868; x=1710976668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWBcAuMVdM8tJlOJBaylj1IasXP4e/van639rGiKMpg=;
        b=Ab5dA0GT1qLStNi1wYDZCQOfN6aUD0m03HwxqSCl+s1ldWDYRyU7Wi+yGfBZIhDnwv
         7UaK2+qkdCd41HoHD+54/27iy6nweXku9h9y3nQ4w7VvBlThx0qvmeSZYnXQHkj5t/at
         KfGYoMYQadlA9z07BIw36hp2kqP0nYTmgdJkcW6sNTcWzBb2e3zAbKatWSqvaUtswCqr
         B5nRzEj9p4Y2FcK+E5Rc4tHMsk4D3blMst0XLKdCVJ3ECtdLTqZQsCxujL7/xveRJVSP
         AjsNkJOs1aRy0SKdNzwAwZKsEfutKH3r41HESD6IUOG3twTdftnR7C5m0k09kFXiz0KC
         SXjA==
X-Gm-Message-State: AOJu0YwR3Dcqbk2+hkqxojmcUmeUq7YhTl1cSdEO44DliZaUMXCKcejg
	j5ThFiBY8jWCxvzBPGlSVAzdKL7qSPOi4E5xhuBqDCfXFJF/crqCp42pTXyB8vjqtYRy+/ZTYFx
	UO/krSDp0D49vHk3oK0xI0tyNECo=
X-Google-Smtp-Source: AGHT+IGG6eaLovpP9WS/CNUlPrVgnvZ8dpMUgEqsQctBhKjUsUfYV/uLOWuUydfmabOWNR+/f9U2b6GxgQuYqhahx+M=
X-Received: by 2002:a5b:b0f:0:b0:dc7:4c21:fbd5 with SMTP id
 z15-20020a5b0b0f000000b00dc74c21fbd5mr201418ybp.0.1710371868081; Wed, 13 Mar
 2024 16:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <17BC6F8FA315450E.6045@lists.openembedded.org> <CACS+7ZQ4YqOW15qiempOViFLPuSGD8sRE=8E6QNK93dJG2JCMg@mail.gmail.com>
 <CAMKF1sqohdi2+3J3wtZwHmKLT=8qV_DZmgCA_QuqbdXM08XNnw@mail.gmail.com>
In-Reply-To: <CAMKF1sqohdi2+3J3wtZwHmKLT=8qV_DZmgCA_QuqbdXM08XNnw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 13 Mar 2024 17:17:35 -0600
Message-ID: <CACS+7ZS4d=2-pwn798EfPrbWPzWP03PwttE_91_dF9NBBcA3tQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pylint: Fix ptest failures
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Dan McGregor <dan.mcgregor@vecima.com>
Content-Type: multipart/alternative; boundary="000000000000a18655061392fbbd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 23:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109301

--000000000000a18655061392fbbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Trying that out now, but it looked like it had some tests that depended on
line endings.

Worst case I put the change up at
https://git.openembedded.org/meta-openembedded-contrib/ on the dankm/pylint
branch.

On Wed, Mar 13, 2024, 16:33 Khem Raj <raj.khem@gmail.com> wrote:

> maybe this recipe needs to inherit dos2unix ?
>
> On Wed, Mar 13, 2024 at 3:05=E2=80=AFPM Dan McGregor <danismostlikely@gma=
il.com>
> wrote:
> >
> >
> >
> > On Wed, Mar 13, 2024, 15:17 Dan McGregor via lists.openembedded.org
> <danismostlikely=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Dan McGregor <dan.mcgregor@vecima.com>
> >>
> >> Due to the way we install ptests, some imports switch from
> >> first party to third party. Update test expectations
> >>
> >> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> >> ---
> >>  ...1-Adjust-test-expectations-for-ptest.patch | 44 ++++++++++++++++++=
+
> >>  .../python/python3-pylint_3.1.0.bb            |  1 +
> >>  2 files changed, 45 insertions(+)
> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expec=
tations-for-ptest.patch
> >>
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-exp=
ectations-for-ptest.patch
> b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-exp=
ectations-for-ptest.patch
> >> new file mode 100644
> >> index 00000000000..8edecbf1bd1
> >> --- /dev/null
> >> +++
> b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-exp=
ectations-for-ptest.patch
> >> @@ -0,0 +1,44 @@
> >> +From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 200=
1
> >> +From: Dan McGregor <dan.mcgregor@vecima.com>
> >> +Date: Wed, 13 Mar 2024 14:08:25 -0600
> >> +Subject: [PATCH] Adjust test expectations for ptest
> >> +
> >> +Because of the way we install ptests, some first party imports
> >> +became third party. Reflect that in the test case.
> >> +
> >> +Upstream-Status: Inappropriate (embedded specific)
> >> +Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> >> +---
> >> + tests/functional/w/wrong_import_order.txt | 22 +++++++++++----------=
-
> >> + 1 file changed, 11 insertions(+), 11 deletions(-)
> >> +
> >> +diff --git a/tests/functional/w/wrong_import_order.txt
> b/tests/functional/w/wrong_import_order.txt
> >> +index 068d2140d..9594ff9e0 100644
> >> +--- a/tests/functional/w/wrong_import_order.txt
> >> ++++ b/tests/functional/w/wrong_import_order.txt
> >> +@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import
> ""sys"" should be placed before
> >
> >
> > Hmm, is there a way to specify line endings? This patch needs CRLF line
> endings, and it looks like that either didn't make it to the list, or
> didn't get applied correctly.
> >
> >> + wrong-import-order:15:0:15:15::"standard import ""datetime"" should
> be placed before third party imports ""six"",
> ""astroid.are_exclusive""":UNDEFINED
> >> + wrong-import-order:18:0:18:22::"third party import
> ""totally_missing"" should be placed before local import
> ""package.Class""":UNDEFINED
> >> + wrong-import-order:20:0:20:14::"third party import ""astroid"" shoul=
d
> be placed before local imports ""package.Class"", "".package""":UNDEFINED
> >> +-wrong-import-order:22:0:22:22::"first party import
> ""pylint.checkers"" should be placed before local imports
> ""package.Class"", "".package"", "".package2""":UNDEFINED
> >> +-wrong-import-order:23:0:23:25::"first party import ""pylint.config""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> >> +-wrong-import-order:24:0:24:17::"first party import ""pylint.sys""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> >> +-wrong-import-order:25:0:25:28::"first party import
> ""pylint.pyreverse"" should be placed before local imports
> ""package.Class"", "".package"", "".package2""":UNDEFINED
> >> +-wrong-import-order:30:0:30:40::"third party import
> ""six.moves.urllib.parse.quote"" should be placed before first party
> imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys"",
> ""pylint.pyreverse"" and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> +-wrong-import-order:31:0:31:23::"first party import
> ""pylint.constants"" should be placed before local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> >> +-wrong-import-order:32:0:32:19::"standard import ""re"" should be
> placed before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"", ""totally_missing"", ""astroid"",
> ""six.moves.urllib.parse.quote"", first party imports ""pylint.checkers""=
,
> ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"",
> ""pylint.constants"", and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> +-wrong-import-order:32:0:32:19::"third party import ""requests""
> should be placed before first party imports ""pylint.checkers"",
> ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"",
> ""pylint.constants"" and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> +-wrong-import-order:33:0:33:24::"first party import
> ""pylint.exceptions"" should be placed before local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> >> +-wrong-import-order:34:0:34:21::"first party import ""pylint.message"=
"
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> +-wrong-import-order:35:0:35:11::"standard import ""time"" should be
> placed before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"" (...) ""astroid"", ""six.moves.urllib.parse.quote"",
> ""requests"", first party imports ""pylint.checkers"", ""pylint.config"",
> ""pylint.sys"" (...) ""pylint.constants"", ""pylint.exceptions"",
> ""pylint.message"", and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> ++wrong-import-order:22:0:22:22::"third party import
> ""pylint.checkers"" should be placed before local imports
> ""package.Class"", "".package"", "".package2""":UNDEFINED
> >> ++wrong-import-order:23:0:23:25::"third party import ""pylint.config""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> >> ++wrong-import-order:24:0:24:17::"third party import ""pylint.sys""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2""":UNDEFINED
> >> ++wrong-import-order:25:0:25:28::"third party import
> ""pylint.pyreverse"" should be placed before local imports
> ""package.Class"", "".package"", "".package2""":UNDEFINED
> >> ++wrong-import-order:30:0:30:40::"third party import
> ""six.moves.urllib.parse.quote"" should be placed before local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> >> ++wrong-import-order:31:0:31:23::"third party import
> ""pylint.constants"" should be placed before local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> >> ++wrong-import-order:32:0:32:19::"standard import ""re"" should be
> placed before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"" (...) ""pylint.pyreverse"",
> ""six.moves.urllib.parse.quote"", ""pylint.constants"" and local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> >> ++wrong-import-order:32:0:32:19::"third party import ""requests""
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> ++wrong-import-order:33:0:33:24::"third party import
> ""pylint.exceptions"" should be placed before local imports
> ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"",
> "".package4"", ""package4.Class4""":UNDEFINED
> >> ++wrong-import-order:34:0:34:21::"third party import ""pylint.message"=
"
> should be placed before local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> ++wrong-import-order:35:0:35:11::"standard import ""time"" should be
> placed before third party imports ""six"", ""astroid.are_exclusive"",
> ""unused_import"" (...) ""requests"", ""pylint.exceptions"",
> ""pylint.message"" and local imports ""package.Class"", "".package"",
> "".package2"" (...) ""package3.Class3"", "".package4"",
> ""package4.Class4""":UNDEFINED
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-pylint_3.1.0.bb b/meta-python/recipes-devtools/python/
> python3-pylint_3.1.0.bb
> >> index 49f0b3eb6e4..12f4f908af7 100644
> >> --- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> >> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> >> @@ -4,6 +4,7 @@ LICENSE =3D "GPL-2.0-only"
> >>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e9c9"
> >>
> >>  SRC_URI +=3D "git://
> github.com/pylint-dev/pylint;branch=3Dmaintenance/3.1.x;protocol=3Dhttps =
\
> >> +           file://0001-Adjust-test-expectations-for-ptest.patch \
> >>             file://run-ptest \
> >>             "
> >>  SRCREV =3D "053c2c3a25f97f043e10cdd41d2609e495a68f57"
> >> --
> >> 2.41.0
> >>
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109299):
> https://lists.openembedded.org/g/openembedded-devel/message/109299
> > Mute This Topic: https://lists.openembedded.org/mt/104914934/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000a18655061392fbbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Trying that out now, but it looked like it had some tests=
 that depended on line endings.<div dir=3D"auto"><br></div><div dir=3D"auto=
">Worst case I put the change up at=C2=A0<a href=3D"https://git.openembedde=
d.org/meta-openembedded-contrib/">https://git.openembedded.org/meta-openemb=
edded-contrib/</a> on the dankm/pylint branch.</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 13, 2024, 1=
6:33 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">maybe this recipe ne=
eds to inherit dos2unix ?<br>
<br>
On Wed, Mar 13, 2024 at 3:05=E2=80=AFPM Dan McGregor &lt;<a href=3D"mailto:=
danismostlikely@gmail.com" target=3D"_blank" rel=3D"noreferrer">danismostli=
kely@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Mar 13, 2024, 15:17 Dan McGregor via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.open=
embedded.org</a> &lt;danismostlikely=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openem=
bedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com" =
target=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Due to the way we install ptests, some imports switch from<br>
&gt;&gt; first party to third party. Update test expectations<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vec=
ima.com" target=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&g=
t;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...1-Adjust-test-expectations-for-ptest.patch | 44 +++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pylint_3.1.0.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">python3-pylint_3.1.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 2 files changed, 45 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pytho=
n3-pylint/0001-Adjust-test-expectations-for-ptest.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-pylint/00=
01-Adjust-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/=
python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000000..8edecbf1bd1<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adju=
st-test-expectations-for-ptest.patch<br>
&gt;&gt; @@ -0,0 +1,44 @@<br>
&gt;&gt; +From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com"=
 target=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 13 Mar 2024 14:08:25 -0600<br>
&gt;&gt; +Subject: [PATCH] Adjust test expectations for ptest<br>
&gt;&gt; +<br>
&gt;&gt; +Because of the way we install ptests, some first party imports<br=
>
&gt;&gt; +became third party. Reflect that in the test case.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Inappropriate (embedded specific)<br>
&gt;&gt; +Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@ve=
cima.com" target=3D"_blank" rel=3D"noreferrer">dan.mcgregor@vecima.com</a>&=
gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + tests/functional/w/wrong_import_order.txt | 22 +++++++++++------=
-----<br>
&gt;&gt; + 1 file changed, 11 insertions(+), 11 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tests/functional/w/wrong_import_order.txt b/tests/fu=
nctional/w/wrong_import_order.txt<br>
&gt;&gt; +index 068d2140d..9594ff9e0 100644<br>
&gt;&gt; +--- a/tests/functional/w/wrong_import_order.txt<br>
&gt;&gt; ++++ b/tests/functional/w/wrong_import_order.txt<br>
&gt;&gt; +@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::&quot;standard i=
mport &quot;&quot;sys&quot;&quot; should be placed before<br>
&gt;<br>
&gt;<br>
&gt; Hmm, is there a way to specify line endings? This patch needs CRLF lin=
e endings, and it looks like that either didn&#39;t make it to the list, or=
 didn&#39;t get applied correctly.<br>
&gt;<br>
&gt;&gt; + wrong-import-order:15:0:15:15::&quot;standard import &quot;&quot=
;datetime&quot;&quot; should be placed before third party imports &quot;&qu=
ot;six&quot;&quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;&quot;:UND=
EFINED<br>
&gt;&gt; + wrong-import-order:18:0:18:22::&quot;third party import &quot;&q=
uot;totally_missing&quot;&quot; should be placed before local import &quot;=
&quot;package.Class&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; + wrong-import-order:20:0:20:14::&quot;third party import &quot;&q=
uot;astroid&quot;&quot; should be placed before local imports &quot;&quot;p=
ackage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;&quot;:UNDEFINED<=
br>
&gt;&gt; +-wrong-import-order:22:0:22:22::&quot;first party import &quot;&q=
uot;pylint.checkers&quot;&quot; should be placed before local imports &quot=
;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&=
quot;.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:23:0:23:25::&quot;first party import &quot;&q=
uot;pylint.config&quot;&quot; should be placed before local imports &quot;&=
quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&qu=
ot;.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:24:0:24:17::&quot;first party import &quot;&q=
uot;pylint.sys&quot;&quot; should be placed before local imports &quot;&quo=
t;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;=
.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:25:0:25:28::&quot;first party import &quot;&q=
uot;pylint.pyreverse&quot;&quot; should be placed before local imports &quo=
t;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;=
&quot;.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:30:0:30:40::&quot;third party import &quot;&q=
uot;six.moves.urllib.parse.quote&quot;&quot; should be placed before first =
party imports &quot;&quot;pylint.checkers&quot;&quot;, &quot;&quot;pylint.c=
onfig&quot;&quot;, &quot;&quot;pylint.sys&quot;&quot;, &quot;&quot;pylint.p=
yreverse&quot;&quot; and local imports &quot;&quot;package.Class&quot;&quot=
;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.package2&quot;&quot; (...=
) &quot;&quot;package3.Class3&quot;&quot;, &quot;&quot;.package4&quot;&quot=
;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:31:0:31:23::&quot;first party import &quot;&q=
uot;pylint.constants&quot;&quot; should be placed before local imports &quo=
t;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;=
&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, =
&quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&=
quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:32:0:32:19::&quot;standard import &quot;&quot=
;re&quot;&quot; should be placed before third party imports &quot;&quot;six=
&quot;&quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;un=
used_import&quot;&quot;, &quot;&quot;totally_missing&quot;&quot;, &quot;&qu=
ot;astroid&quot;&quot;, &quot;&quot;six.moves.urllib.parse.quote&quot;&quot=
;, first party imports &quot;&quot;pylint.checkers&quot;&quot;, &quot;&quot=
;pylint.config&quot;&quot;, &quot;&quot;pylint.sys&quot;&quot;, &quot;&quot=
;pylint.pyreverse&quot;&quot;, &quot;&quot;pylint.constants&quot;&quot;, an=
d local imports &quot;&quot;package.Class&quot;&quot;, &quot;&quot;.package=
&quot;&quot;, &quot;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.=
Class3&quot;&quot;, &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4=
.Class4&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:32:0:32:19::&quot;third party import &quot;&q=
uot;requests&quot;&quot; should be placed before first party imports &quot;=
&quot;pylint.checkers&quot;&quot;, &quot;&quot;pylint.config&quot;&quot;, &=
quot;&quot;pylint.sys&quot;&quot;, &quot;&quot;pylint.pyreverse&quot;&quot;=
, &quot;&quot;pylint.constants&quot;&quot; and local imports &quot;&quot;pa=
ckage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pac=
kage2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&quo=
t;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UNDE=
FINED<br>
&gt;&gt; +-wrong-import-order:33:0:33:24::&quot;first party import &quot;&q=
uot;pylint.exceptions&quot;&quot; should be placed before local imports &qu=
ot;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot=
;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;,=
 &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;=
&quot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:34:0:34:21::&quot;first party import &quot;&q=
uot;pylint.message&quot;&quot; should be placed before local imports &quot;=
&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&q=
uot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &q=
uot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&qu=
ot;:UNDEFINED<br>
&gt;&gt; +-wrong-import-order:35:0:35:11::&quot;standard import &quot;&quot=
;time&quot;&quot; should be placed before third party imports &quot;&quot;s=
ix&quot;&quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;=
unused_import&quot;&quot; (...) &quot;&quot;astroid&quot;&quot;, &quot;&quo=
t;six.moves.urllib.parse.quote&quot;&quot;, &quot;&quot;requests&quot;&quot=
;, first party imports &quot;&quot;pylint.checkers&quot;&quot;, &quot;&quot=
;pylint.config&quot;&quot;, &quot;&quot;pylint.sys&quot;&quot; (...) &quot;=
&quot;pylint.constants&quot;&quot;, &quot;&quot;pylint.exceptions&quot;&quo=
t;, &quot;&quot;pylint.message&quot;&quot;, and local imports &quot;&quot;p=
ackage.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.pa=
ckage2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&qu=
ot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UND=
EFINED<br>
&gt;&gt; ++wrong-import-order:22:0:22:22::&quot;third party import &quot;&q=
uot;pylint.checkers&quot;&quot; should be placed before local imports &quot=
;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&=
quot;.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:23:0:23:25::&quot;third party import &quot;&q=
uot;pylint.config&quot;&quot; should be placed before local imports &quot;&=
quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&qu=
ot;.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:24:0:24:17::&quot;third party import &quot;&q=
uot;pylint.sys&quot;&quot; should be placed before local imports &quot;&quo=
t;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;=
.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:25:0:25:28::&quot;third party import &quot;&q=
uot;pylint.pyreverse&quot;&quot; should be placed before local imports &quo=
t;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;=
&quot;.package2&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:30:0:30:40::&quot;third party import &quot;&q=
uot;six.moves.urllib.parse.quote&quot;&quot; should be placed before local =
imports &quot;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&q=
uot;, &quot;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&q=
uot;&quot;, &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&=
quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:31:0:31:23::&quot;third party import &quot;&q=
uot;pylint.constants&quot;&quot; should be placed before local imports &quo=
t;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;=
&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, =
&quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&=
quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:32:0:32:19::&quot;standard import &quot;&quot=
;re&quot;&quot; should be placed before third party imports &quot;&quot;six=
&quot;&quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;un=
used_import&quot;&quot; (...) &quot;&quot;pylint.pyreverse&quot;&quot;, &qu=
ot;&quot;six.moves.urllib.parse.quote&quot;&quot;, &quot;&quot;pylint.const=
ants&quot;&quot; and local imports &quot;&quot;package.Class&quot;&quot;, &=
quot;&quot;.package&quot;&quot;, &quot;&quot;.package2&quot;&quot; (...) &q=
uot;&quot;package3.Class3&quot;&quot;, &quot;&quot;.package4&quot;&quot;, &=
quot;&quot;package4.Class4&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:32:0:32:19::&quot;third party import &quot;&q=
uot;requests&quot;&quot; should be placed before local imports &quot;&quot;=
package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&quot;.p=
ackage2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &quot;&q=
uot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&quot;:UN=
DEFINED<br>
&gt;&gt; ++wrong-import-order:33:0:33:24::&quot;third party import &quot;&q=
uot;pylint.exceptions&quot;&quot; should be placed before local imports &qu=
ot;&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot=
;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;,=
 &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;=
&quot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:34:0:34:21::&quot;third party import &quot;&q=
uot;pylint.message&quot;&quot; should be placed before local imports &quot;=
&quot;package.Class&quot;&quot;, &quot;&quot;.package&quot;&quot;, &quot;&q=
uot;.package2&quot;&quot; (...) &quot;&quot;package3.Class3&quot;&quot;, &q=
uot;&quot;.package4&quot;&quot;, &quot;&quot;package4.Class4&quot;&quot;&qu=
ot;:UNDEFINED<br>
&gt;&gt; ++wrong-import-order:35:0:35:11::&quot;standard import &quot;&quot=
;time&quot;&quot; should be placed before third party imports &quot;&quot;s=
ix&quot;&quot;, &quot;&quot;astroid.are_exclusive&quot;&quot;, &quot;&quot;=
unused_import&quot;&quot; (...) &quot;&quot;requests&quot;&quot;, &quot;&qu=
ot;pylint.exceptions&quot;&quot;, &quot;&quot;pylint.message&quot;&quot; an=
d local imports &quot;&quot;package.Class&quot;&quot;, &quot;&quot;.package=
&quot;&quot;, &quot;&quot;.package2&quot;&quot; (...) &quot;&quot;package3.=
Class3&quot;&quot;, &quot;&quot;.package4&quot;&quot;, &quot;&quot;package4=
.Class4&quot;&quot;&quot;:UNDEFINED<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-pylint_3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">p=
ython3-pylint_3.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-pylint_3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">python3-pylint_3.1.0.bb</a><br>
&gt;&gt; index 49f0b3eb6e4..12f4f908af7 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pylint_3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
pylint_3.1.0.bb</a><br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pylint_3.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
pylint_3.1.0.bb</a><br>
&gt;&gt; @@ -4,6 +4,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc107cf754550=
e65755c42985a5d4e9c9&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pylint=
-dev/pylint;branch=3Dmaintenance/3.1.x;protocol=3Dhttps" rel=3D"noreferrer =
noreferrer" target=3D"_blank">github.com/pylint-dev/pylint;branch=3Dmainten=
ance/3.1.x;protocol=3Dhttps</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Adjust-test-=
expectations-for-ptest.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 SRCREV =3D &quot;053c2c3a25f97f043e10cdd41d2609e495a68f57&qu=
ot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.41.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#109299): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/109299" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/109=
299</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10491493=
4/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/104914934/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000a18655061392fbbd--

