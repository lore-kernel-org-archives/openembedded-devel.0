Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667BEC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:56:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.286.1668027361009101532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=II/Jomhg;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id v1so27677353wrt.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=43yVUgfc4+sGUTscpI/vuiaZrbtdzb5phI/K07EpWag=;
        b=II/JomhgTvsy2KNGvnPZbb2DQuMLUd/2gkbcuf0oM1jJOuJ9KqwN28pbQqFekxQhnz
         6BMqH+xXwzL04zv0bnFb2PWZWU0UQMvZoXWaG+1EPTWPnUOdRXZCjzw9QDdak8rcazBt
         yPfXZcksTtR6N33noWwQ3VDMZvGjOlabuFfd0YcCgRZXyCk+y38YFH6c9J6P4mJIR7SQ
         T49ZceBEOfoMZSagQCAV+p52oD7kBMBrz5k9O/icI6CEzIFy/Cr3llrtkAHhvWwbxHtf
         mpoOW6izah7po3l75+UEROxtCW8/SMKJSPOmyQR2QA3xIuUoHfvgiEroHgMnIRHos2Yc
         uY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43yVUgfc4+sGUTscpI/vuiaZrbtdzb5phI/K07EpWag=;
        b=T0nspVmYUXG2fy7R3sajW21FbWb/sXMh1tvx26xo0Bujm22dQlxs2gaEozlOp9P22V
         xZg/yfhkjYXPngxGuitFv83fsthWnVOQ8DQBCuIx7v1G9JIREtk5gtn7gkNU6kfizv2b
         3aEGMx/6PtSxbDyf14L3P+DFTRXLg75FBqiEXbGktwrl97ghDSkBilPd53qtmILM5+F3
         t3Vu6qWg6YN9bKrmYJsJXVS1f7vCBOx8LQPOBrQ5AbXhFO8XxipHlgch45mdzWeyVqEs
         /hK0kUKElBZM7u1PZNHKS9gkBxYrGgTBXbfhx08Xhm87I1MCPidtDz8HpR4o15/ES1Nd
         dw7w==
X-Gm-Message-State: ACrzQf2HZaOlKxeM/WznhFTDb1RR3YmEY0K4VZefG/uvmGlmrhnOcOOt
	0TDa0xreZQ6kJFZ8haTmCYx/GBVm36ixsKTGqLc=
X-Google-Smtp-Source: AMsMyM7wnoyElm3zjxC4mRgQ4oFVHAayc/XZ9+L6C8wjKXHU/DjCG9+q6Qcii3nRU0WEcbJtsiKBG4qydF0dG4/ZXTc=
X-Received: by 2002:adf:f8c3:0:b0:236:9c97:6f6b with SMTP id
 f3-20020adff8c3000000b002369c976f6bmr38479975wrq.548.1668027359430; Wed, 09
 Nov 2022 12:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20221109200558.2034000-1-alex@linutronix.de> <20221109200558.2034000-2-alex@linutronix.de>
 <CA+chaQdcgf-CTZHQTNooWgYnM5HbJygXucGnizaKoqmbCcCvMw@mail.gmail.com>
 <CANNYZj-HjY+JdC39wPLC1v+o0VWcErY8ivPf1+bTGto0Ns1_NQ@mail.gmail.com>
 <CA+chaQddR_ytsNfV32fXUTNTWxHfuwiZac895Frv0MBrFD1KiA@mail.gmail.com> <CANNYZj_KWjtYpyQdhNWWjT_u4nPCdTGf6Gx4cfP_QoMiJDuifg@mail.gmail.com>
In-Reply-To: <CANNYZj_KWjtYpyQdhNWWjT_u4nPCdTGf6Gx4cfP_QoMiJDuifg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Nov 2022 21:55:47 +0100
Message-ID: <CA+chaQfd8CbNi0ziu+RJK5md31iUYqTopSgBqD6VtWUvPkjkwA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] lirc: correctly use PYTHONPATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000003c0d3005ed0fe219"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 20:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99514

--0000000000003c0d3005ed0fe219
Content-Type: text/plain; charset="UTF-8"

Well the obvious difference is that your commit which I was reviewing chows
11 changed lines, instead of just 1 added .patch file in SRC_URI.

Style changes shouldn't be applied together with functional changes,
especially when they make it worse.

On Wed, Nov 9, 2022 at 9:50 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This commit shows that at some point in the past you fixed up
> formatting to your preference. It does not set one way or another way
> as the 'correct' one, particularly as it is not mentioned anywhere in
> the layer.
>
> And honestly, I don't care if it's consistent or not, and neither
> should you or anyone else. It helps nobody to spend time and energy
> enforcing those 4 spaces throughout the layer, as opposed to some
> recipes having 4 spaces and some aligning with the value on the first
> line. What's so bad about that, seriously?
>
> If you feel strongly about this, you can just run a linter
> periodically to fix it up.
>
> Alex
>
> On Wed, 9 Nov 2022 at 21:37, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Style guide says:
> > "Some layers prefer to use four-space indentation on sucessive lines and
> prefer the closing quote as the first character"
> >
> > And this commit:
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=a45830a39bb47a9eab27980d52966226c9504ea4
> > shows that meta-oe/meta-* layers belong to this group.
> >
> > Yes, it's not 100% consistent, but lets not make it less consistent,
> just because "devtool finish" prepared such change.
> >
> > On Wed, Nov 9, 2022 at 9:32 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >>
> >> This was re-set by devtool modify/devtool finish, I didn't
> >> specifically adjust it.
> >>
> >> The styleguide says either way is ok. I'd suggest we spend our time on
> >> more important matters.
> >>
> >> Alex
> >>
> >> On Wed, 9 Nov 2022 at 21:16, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> >
> >> > Please don't change SRC_URI indentation, meta-oe uses 4 spaces for
> indentation with closing quote as the first character as described on
> https://www.openembedded.org/wiki/Styleguide
> >> >
> >> > On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >> >>
> >> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> >> ---
> >> >>  ...ot-clobber-PYTHONPATH-from-build-env.patch | 55
> +++++++++++++++++++
> >> >>  .../recipes-connectivity/lirc/lirc_0.10.2.bb  | 21 +++----
> >> >>  2 files changed, 66 insertions(+), 10 deletions(-)
> >> >>  create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> >> >>
> >> >> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> >> >> new file mode 100644
> >> >> index 000000000..089ed23c7
> >> >> --- /dev/null
> >> >> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> >> >> @@ -0,0 +1,55 @@
> >> >> +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00
> 2001
> >> >> +From: Alexander Kanavin <alex@linutronix.de>
> >> >> +Date: Wed, 9 Nov 2022 20:49:41 +0100
> >> >> +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from build
> environment
> >> >> +
> >> >> +This environment variable has special significance for python,
> >> >> +and so lirc's variable has to be named something else.
> >> >> +
> >> >> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> >> +---
> >> >> + Makefile.am       | 2 +-
> >> >> + pylint.mak        | 2 +-
> >> >> + tools/Makefile.am | 2 +-
> >> >> + 3 files changed, 3 insertions(+), 3 deletions(-)
> >> >> +
> >> >> +diff --git a/Makefile.am b/Makefile.am
> >> >> +index 6718af1..fae423e 100644
> >> >> +--- a/Makefile.am
> >> >> ++++ b/Makefile.am
> >> >> +@@ -128,7 +128,7 @@ endif
> >> >> +
> >> >> + pylint: .phony
> >> >> +       $(MAKE) -C tools pylint
> >> >> +-      -PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=pylint.conf \
> >> >> ++      -PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT) --rcfile=pylint.conf
> \
> >> >> +       --msg-template='$(pylint_template)' $(py_PYTHON)
> >> >> +
> >> >> + pep8: $(py_PYTHON)
> >> >> +diff --git a/pylint.mak b/pylint.mak
> >> >> +index bf427ab..2692951 100644
> >> >> +--- a/pylint.mak
> >> >> ++++ b/pylint.mak
> >> >> +@@ -1,5 +1,5 @@
> >> >> + PYTHONPATH1      = $(abs_top_srcdir)/python-pkg/lirc:
> >> >> + PYTHONPATH2      = $(abs_top_srcdir)/python-pkg/lirc/lib/.libs
> >> >> +-PYTHONPATH       = $(PYTHONPATH1):$(PYTHONPATH2)
> >> >> ++LIRCPYTHONPATH   = $(PYTHONPATH1):$(PYTHONPATH2)
> >> >> + PYLINT           = python3-pylint
> >> >> + pylint_template  = {path}:{line}: [{msg_id}({symbol}), {obj}] {msg}
> >> >> +diff --git a/tools/Makefile.am b/tools/Makefile.am
> >> >> +index 85d1fd0..96b17f8 100644
> >> >> +--- a/tools/Makefile.am
> >> >> ++++ b/tools/Makefile.am
> >> >> +@@ -142,7 +142,7 @@ force-pylint: .phony
> >> >> +
> >> >> + pylint: .pylint-stamp
> >> >> + .pylint-stamp: $(py_sources)
> >> >> +-      -PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=../pylint.conf \
> >> >> ++      -PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT)
> --rcfile=../pylint.conf \
> >> >> +       --msg-template='$(pylint_template)' $? && touch $@
> >> >> +
> >> >> + .phony:
> >> >> +--
> >> >> +2.30.2
> >> >> +
> >> >> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> >> >> index 234d347af..458d9d7cd 100644
> >> >> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> >> >> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> >> >> @@ -11,16 +11,17 @@ DEPENDS = "libxslt-native alsa-lib libftdi
> libusb1 libusb-compat jack portaudio-
> >> >>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >> >>
> >> >>  SRC_URI = "
> http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
> >> >> -    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
> >> >> -    file://fix_build_errors.patch \
> >> >> -    file://0001-mplay-Fix-build-with-musl.patch \
> >> >> -    file://lircd.service \
> >> >> -    file://lircd.init \
> >> >> -    file://lircexec.init \
> >> >> -    file://lircd.conf \
> >> >> -    file://lirc_options.conf \
> >> >> -    file://lirc.tmpfiles \
> >> >> -"
> >> >> +
>  file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
> >> >> +           file://fix_build_errors.patch \
> >> >> +           file://0001-mplay-Fix-build-with-musl.patch \
> >> >> +           file://lircd.service \
> >> >> +           file://lircd.init \
> >> >> +           file://lircexec.init \
> >> >> +           file://lircd.conf \
> >> >> +           file://lirc_options.conf \
> >> >> +           file://lirc.tmpfiles \
> >> >> +
>  file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch \
> >> >> +           "
> >> >>  SRC_URI[sha256sum] =
> "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a"
> >> >>
> >> >>  SYSTEMD_PACKAGES = "lirc lirc-exec"
> >> >> --
> >> >> 2.30.2
> >> >>
> >> >>
> >> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> >> Links: You receive all messages sent to this group.
> >> >> View/Reply Online (#99509):
> https://lists.openembedded.org/g/openembedded-devel/message/99509
> >> >> Mute This Topic: https://lists.openembedded.org/mt/94921643/3617156
> >> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> >> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> >> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> >>
>

--0000000000003c0d3005ed0fe219
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well the obvious difference is that your commit which I wa=
s reviewing chows 11 changed lines, instead of just 1 added .patch file in =
SRC_URI.<div><br></div><div>Style changes shouldn&#39;t be applied together=
 with functional changes, especially when they make it worse.</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Nov 9, 2022 at 9:50 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin=
@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">This commit shows that at some point in t=
he past you fixed up<br>
formatting to your preference. It does not set one way or another way<br>
as the &#39;correct&#39; one, particularly as it is not mentioned anywhere =
in<br>
the layer.<br>
<br>
And honestly, I don&#39;t care if it&#39;s consistent or not, and neither<b=
r>
should you or anyone else. It helps nobody to spend time and energy<br>
enforcing those 4 spaces throughout the layer, as opposed to some<br>
recipes having 4 spaces and some aligning with the value on the first<br>
line. What&#39;s so bad about that, seriously?<br>
<br>
If you feel strongly about this, you can just run a linter<br>
periodically to fix it up.<br>
<br>
Alex<br>
<br>
On Wed, 9 Nov 2022 at 21:37, Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Style guide says:<br>
&gt; &quot;Some layers prefer to use four-space indentation on sucessive li=
nes and prefer the closing quote as the first character&quot;<br>
&gt;<br>
&gt; And this commit:<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3Da45830a39bb47a9eab27980d52966226c9504ea4" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/meta-openembedded/commit/?id=3Da45830a3=
9bb47a9eab27980d52966226c9504ea4</a><br>
&gt; shows that meta-oe/meta-* layers belong to this group.<br>
&gt;<br>
&gt; Yes, it&#39;s not 100% consistent, but lets not make it less consisten=
t, just because &quot;devtool finish&quot; prepared such change.<br>
&gt;<br>
&gt; On Wed, Nov 9, 2022 at 9:32 PM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; This was re-set by devtool modify/devtool finish, I didn&#39;t<br>
&gt;&gt; specifically adjust it.<br>
&gt;&gt;<br>
&gt;&gt; The styleguide says either way is ok. I&#39;d suggest we spend our=
 time on<br>
&gt;&gt; more important matters.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 9 Nov 2022 at 21:16, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please don&#39;t change SRC_URI indentation, meta-oe uses 4 s=
paces for indentation with closing quote as the first character as describe=
d on <a href=3D"https://www.openembedded.org/wiki/Styleguide" rel=3D"norefe=
rrer" target=3D"_blank">https://www.openembedded.org/wiki/Styleguide</a><br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 =
+++++++++++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 .../recipes-connectivity/lirc/<a href=3D"http://lir=
c_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lirc_0.10.2.bb</a>=C2=A0 =
| 21 +++----<br>
&gt;&gt; &gt;&gt;=C2=A0 2 files changed, 66 insertions(+), 10 deletions(-)<=
br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 meta-oe/dynamic-layers/meta-pyth=
on/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPAT=
H-from-build-env.patch<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-c=
onnectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build=
-env.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/l=
irc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch<br>
&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; index 000000000..089ed23c7<br>
&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-connecti=
vity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.pa=
tch<br>
&gt;&gt; &gt;&gt; @@ -0,0 +1,55 @@<br>
&gt;&gt; &gt;&gt; +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17=
 00:00:00 2001<br>
&gt;&gt; &gt;&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt;&gt; +Date: Wed, 9 Nov 2022 20:49:41 +0100<br>
&gt;&gt; &gt;&gt; +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH =
from build environment<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +This environment variable has special significance for p=
ython,<br>
&gt;&gt; &gt;&gt; +and so lirc&#39;s variable has to be named something els=
e.<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:a=
lex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt;&gt; +---<br>
&gt;&gt; &gt;&gt; + Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; &gt;&gt; + pylint.mak=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt; &gt;&gt; + tools/Makefile.am | 2 +-<br>
&gt;&gt; &gt;&gt; + 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +diff --git a/Makefile.am b/Makefile.am<br>
&gt;&gt; &gt;&gt; +index 6718af1..fae423e 100644<br>
&gt;&gt; &gt;&gt; +--- a/Makefile.am<br>
&gt;&gt; &gt;&gt; ++++ b/Makefile.am<br>
&gt;&gt; &gt;&gt; +@@ -128,7 +128,7 @@ endif<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; + pylint: .phony<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C tools pylint<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(PYTHONPATH) $(PYLI=
NT) --rcfile=3Dpylint.conf \<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(LIRCPYTHONPATH) $(=
PYLINT) --rcfile=3Dpylint.conf \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0--msg-template=3D&#39;$(pylin=
t_template)&#39; $(py_PYTHON)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; + pep8: $(py_PYTHON)<br>
&gt;&gt; &gt;&gt; +diff --git a/pylint.mak b/pylint.mak<br>
&gt;&gt; &gt;&gt; +index bf427ab..2692951 100644<br>
&gt;&gt; &gt;&gt; +--- a/pylint.mak<br>
&gt;&gt; &gt;&gt; ++++ b/pylint.mak<br>
&gt;&gt; &gt;&gt; +@@ -1,5 +1,5 @@<br>
&gt;&gt; &gt;&gt; + PYTHONPATH1=C2=A0 =C2=A0 =C2=A0 =3D $(abs_top_srcdir)/p=
ython-pkg/lirc:<br>
&gt;&gt; &gt;&gt; + PYTHONPATH2=C2=A0 =C2=A0 =C2=A0 =3D $(abs_top_srcdir)/p=
ython-pkg/lirc/lib/.libs<br>
&gt;&gt; &gt;&gt; +-PYTHONPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(PYTHONPATH1)=
:$(PYTHONPATH2)<br>
&gt;&gt; &gt;&gt; ++LIRCPYTHONPATH=C2=A0 =C2=A0=3D $(PYTHONPATH1):$(PYTHONP=
ATH2)<br>
&gt;&gt; &gt;&gt; + PYLINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D pyth=
on3-pylint<br>
&gt;&gt; &gt;&gt; + pylint_template=C2=A0 =3D {path}:{line}: [{msg_id}({sym=
bol}), {obj}] {msg}<br>
&gt;&gt; &gt;&gt; +diff --git a/tools/Makefile.am b/tools/Makefile.am<br>
&gt;&gt; &gt;&gt; +index 85d1fd0..96b17f8 100644<br>
&gt;&gt; &gt;&gt; +--- a/tools/Makefile.am<br>
&gt;&gt; &gt;&gt; ++++ b/tools/Makefile.am<br>
&gt;&gt; &gt;&gt; +@@ -142,7 +142,7 @@ force-pylint: .phony<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; + pylint: .pylint-stamp<br>
&gt;&gt; &gt;&gt; + .pylint-stamp: $(py_sources)<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(PYTHONPATH) $(PYLI=
NT) --rcfile=3D../pylint.conf \<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(LIRCPYTHONPATH) $(=
PYLINT) --rcfile=3D../pylint.conf \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0--msg-template=3D&#39;$(pylin=
t_template)&#39; $? &amp;&amp; touch $@<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; + .phony:<br>
&gt;&gt; &gt;&gt; +--<br>
&gt;&gt; &gt;&gt; +2.30.2<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-c=
onnectivity/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">lirc_0.10.2.bb</a> b/meta-oe/dynamic-layers/meta-python/recipe=
s-connectivity/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">lirc_0.10.2.bb</a><br>
&gt;&gt; &gt;&gt; index 234d347af..458d9d7cd 100644<br>
&gt;&gt; &gt;&gt; --- a/meta-oe/dynamic-layers/meta-python/recipes-connecti=
vity/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">lirc_0.10.2.bb</a><br>
&gt;&gt; &gt;&gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-connecti=
vity/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">lirc_0.10.2.bb</a><br>
&gt;&gt; &gt;&gt; @@ -11,16 +11,17 @@ DEPENDS =3D &quot;libxslt-native alsa=
-lib libftdi libusb1 libusb-compat jack portaudio-<br>
&gt;&gt; &gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db23=
4ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://prdownloads.sou=
rceforge.net/lirc/lirc-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_bla=
nk">http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2</a> \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://0001-Fix-build-on-32bit-arches-with=
-64bit-time_t.patch \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://fix_build_errors.patch \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://0001-mplay-Fix-build-with-musl.patc=
h \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://lircd.service \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://lircd.init \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://lircexec.init \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://lircd.conf \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://lirc_options.conf \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 file://lirc.tmpfiles \<br>
&gt;&gt; &gt;&gt; -&quot;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix=
-build-on-32bit-arches-with-64bit-time_t.patch \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_buil=
d_errors.patch \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mpl=
ay-Fix-build-with-musl.patch \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.se=
rvice \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.in=
it \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircexec=
.init \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.co=
nf \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lirc_opt=
ions.conf \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lirc.tmp=
files \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Mak=
efile.am-do-not-clobber-PYTHONPATH-from-build-env.patch \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;3d44ec8274881cf262f160=
805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 SYSTEMD_PACKAGES =3D &quot;lirc lirc-exec&quot;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.30.2<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt;&gt; View/Reply Online (#99509): <a href=3D"https://lists.open=
embedded.org/g/openembedded-devel/message/99509" rel=3D"noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/995=
09</a><br>
&gt;&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.or=
g/mt/94921643/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/mt/94921643/3617156</a><br>
&gt;&gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner=
@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.o=
penembedded.org</a><br>
&gt;&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/=
openembedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin=
.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt;<br>
</blockquote></div>

--0000000000003c0d3005ed0fe219--

