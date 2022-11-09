Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEC7C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:37:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.86.1668026259329279948
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TfOhT0Lg;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso3258444wmb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d+V18rRE06vDsWwZsMhtqNw1aQGP8fEFXULi83tQtZM=;
        b=TfOhT0Lgm80cN03yC+KUAQuxiFWamZWA46b6S5HKV0nbdECkLXDZlZvheS8qdObp3F
         L4rQQWZrlioTI0itPWijuU4vUtxr7Fue7rNWvlcfx+tUg08te/gQzVf9WKm0mRuMAUg5
         BrbYOM4ADyEqZcxKjgrvmVnr/baATVdVjX0k2MKczaKCaI1oajsSUAdCmZTYFRGSsgji
         r0Z63sZbBMkS8wtYNSaA1UBU+j036uRV/L1mFa2C+xTjntBxZDIMGsRr5y7zMxfTWFLG
         5Amr/8Jl6JA57Jbie9mLLHXndPhEPrVKwcTIUsnhygrUDJdsHVDuJbYrHmw7ir3PYEgE
         dXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+V18rRE06vDsWwZsMhtqNw1aQGP8fEFXULi83tQtZM=;
        b=OCUH4KJc0nB5g8laU+Tgc3OUSU/sQfaQhq525E4R7solIoC2kf9B3da5+ufgRaBKQe
         Wr4Z4bxAQ1aWKFX/Jc9Kr7lSpimoumcjdReYaBjFUh07bR0y5KOc/IZ46p/o83eSuf0Q
         giNh8kS7anIjpvuJvBDj6LnTr9gUQcSERjgQsd0QD4OIpflkU10nAuehpQ2flkl2Rhhx
         YmkR5D0rGAmwf4uXgjdj6NZCcXEf5LAselsSlufNQU8ZY54zZD2xoPu+gg8oHCTEP9rv
         hq6gdWItieSlbhYxGCmK4V+Lc79vH0tmGcE1iiQo68hvZvKxaVtEp33ghoXjD7ck13uY
         UhIw==
X-Gm-Message-State: ACrzQf2UeLikeSq1w+jfqH2WFT5PNdR10/v/IWZYNF0mt5mQDYTCu31T
	6aFBbbb7/FZEl8P6TE8dcxDrBGBa4YdlSSCsT+w=
X-Google-Smtp-Source: AMsMyM5iP/KSGcaQ+Lyl8JKWRnJNMGmtre6sANi+hKWvxLcVAtanv6fxdi5n/kkakKmpPsPgrrlaWU0mrwo1cG2PyeI=
X-Received: by 2002:a05:600c:4313:b0:3cf:894d:1d05 with SMTP id
 p19-20020a05600c431300b003cf894d1d05mr26466091wme.32.1668026257739; Wed, 09
 Nov 2022 12:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20221109200558.2034000-1-alex@linutronix.de> <20221109200558.2034000-2-alex@linutronix.de>
 <CA+chaQdcgf-CTZHQTNooWgYnM5HbJygXucGnizaKoqmbCcCvMw@mail.gmail.com> <CANNYZj-HjY+JdC39wPLC1v+o0VWcErY8ivPf1+bTGto0Ns1_NQ@mail.gmail.com>
In-Reply-To: <CANNYZj-HjY+JdC39wPLC1v+o0VWcErY8ivPf1+bTGto0Ns1_NQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Nov 2022 21:37:26 +0100
Message-ID: <CA+chaQddR_ytsNfV32fXUTNTWxHfuwiZac895Frv0MBrFD1KiA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] lirc: correctly use PYTHONPATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000091951905ed0fa0d7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 20:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99512

--00000000000091951905ed0fa0d7
Content-Type: text/plain; charset="UTF-8"

Style guide says:
"Some layers prefer to use four-space indentation on sucessive lines and
prefer the closing quote as the first character"

And this commit:
https://git.openembedded.org/meta-openembedded/commit/?id=a45830a39bb47a9eab27980d52966226c9504ea4
shows that meta-oe/meta-* layers belong to this group.

Yes, it's not 100% consistent, but lets not make it less consistent, just
because "devtool finish" prepared such change.

On Wed, Nov 9, 2022 at 9:32 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This was re-set by devtool modify/devtool finish, I didn't
> specifically adjust it.
>
> The styleguide says either way is ok. I'd suggest we spend our time on
> more important matters.
>
> Alex
>
> On Wed, 9 Nov 2022 at 21:16, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Please don't change SRC_URI indentation, meta-oe uses 4 spaces for
> indentation with closing quote as the first character as described on
> https://www.openembedded.org/wiki/Styleguide
> >
> > On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >>
> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> ---
> >>  ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 +++++++++++++++++++
> >>  .../recipes-connectivity/lirc/lirc_0.10.2.bb  | 21 +++----
> >>  2 files changed, 66 insertions(+), 10 deletions(-)
> >>  create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> >>
> >> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> >> new file mode 100644
> >> index 000000000..089ed23c7
> >> --- /dev/null
> >> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> >> @@ -0,0 +1,55 @@
> >> +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00 2001
> >> +From: Alexander Kanavin <alex@linutronix.de>
> >> +Date: Wed, 9 Nov 2022 20:49:41 +0100
> >> +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from build
> environment
> >> +
> >> +This environment variable has special significance for python,
> >> +and so lirc's variable has to be named something else.
> >> +
> >> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> +---
> >> + Makefile.am       | 2 +-
> >> + pylint.mak        | 2 +-
> >> + tools/Makefile.am | 2 +-
> >> + 3 files changed, 3 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/Makefile.am b/Makefile.am
> >> +index 6718af1..fae423e 100644
> >> +--- a/Makefile.am
> >> ++++ b/Makefile.am
> >> +@@ -128,7 +128,7 @@ endif
> >> +
> >> + pylint: .phony
> >> +       $(MAKE) -C tools pylint
> >> +-      -PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=pylint.conf \
> >> ++      -PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT) --rcfile=pylint.conf \
> >> +       --msg-template='$(pylint_template)' $(py_PYTHON)
> >> +
> >> + pep8: $(py_PYTHON)
> >> +diff --git a/pylint.mak b/pylint.mak
> >> +index bf427ab..2692951 100644
> >> +--- a/pylint.mak
> >> ++++ b/pylint.mak
> >> +@@ -1,5 +1,5 @@
> >> + PYTHONPATH1      = $(abs_top_srcdir)/python-pkg/lirc:
> >> + PYTHONPATH2      = $(abs_top_srcdir)/python-pkg/lirc/lib/.libs
> >> +-PYTHONPATH       = $(PYTHONPATH1):$(PYTHONPATH2)
> >> ++LIRCPYTHONPATH   = $(PYTHONPATH1):$(PYTHONPATH2)
> >> + PYLINT           = python3-pylint
> >> + pylint_template  = {path}:{line}: [{msg_id}({symbol}), {obj}] {msg}
> >> +diff --git a/tools/Makefile.am b/tools/Makefile.am
> >> +index 85d1fd0..96b17f8 100644
> >> +--- a/tools/Makefile.am
> >> ++++ b/tools/Makefile.am
> >> +@@ -142,7 +142,7 @@ force-pylint: .phony
> >> +
> >> + pylint: .pylint-stamp
> >> + .pylint-stamp: $(py_sources)
> >> +-      -PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=../pylint.conf \
> >> ++      -PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT) --rcfile=../pylint.conf
> \
> >> +       --msg-template='$(pylint_template)' $? && touch $@
> >> +
> >> + .phony:
> >> +--
> >> +2.30.2
> >> +
> >> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> >> index 234d347af..458d9d7cd 100644
> >> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> >> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> >> @@ -11,16 +11,17 @@ DEPENDS = "libxslt-native alsa-lib libftdi libusb1
> libusb-compat jack portaudio-
> >>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >>
> >>  SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2
> \
> >> -    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
> >> -    file://fix_build_errors.patch \
> >> -    file://0001-mplay-Fix-build-with-musl.patch \
> >> -    file://lircd.service \
> >> -    file://lircd.init \
> >> -    file://lircexec.init \
> >> -    file://lircd.conf \
> >> -    file://lirc_options.conf \
> >> -    file://lirc.tmpfiles \
> >> -"
> >> +
>  file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
> >> +           file://fix_build_errors.patch \
> >> +           file://0001-mplay-Fix-build-with-musl.patch \
> >> +           file://lircd.service \
> >> +           file://lircd.init \
> >> +           file://lircexec.init \
> >> +           file://lircd.conf \
> >> +           file://lirc_options.conf \
> >> +           file://lirc.tmpfiles \
> >> +
>  file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch \
> >> +           "
> >>  SRC_URI[sha256sum] =
> "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a"
> >>
> >>  SYSTEMD_PACKAGES = "lirc lirc-exec"
> >> --
> >> 2.30.2
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#99509):
> https://lists.openembedded.org/g/openembedded-devel/message/99509
> >> Mute This Topic: https://lists.openembedded.org/mt/94921643/3617156
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [Martin.Jansa@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

--00000000000091951905ed0fa0d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Style guide says:</div><div>&quot;<span style=3D"font=
-family:sans-serif;font-size:14px">Some layers prefer to use four-space ind=
entation on sucessive lines and prefer the closing quote as the first chara=
cter&quot;</span></div><div><span style=3D"font-family:sans-serif;font-size=
:14px"><br></span></div><div><span style=3D"font-family:sans-serif;font-siz=
e:14px">And this commit:</span></div><a href=3D"https://git.openembedded.or=
g/meta-openembedded/commit/?id=3Da45830a39bb47a9eab27980d52966226c9504ea4">=
https://git.openembedded.org/meta-openembedded/commit/?id=3Da45830a39bb47a9=
eab27980d52966226c9504ea4</a><br><div>shows that meta-oe/meta-* layers belo=
ng to this group.</div><div><br></div><div>Yes, it&#39;s not 100% consisten=
t, but lets not make it less consistent, just because &quot;devtool finish&=
quot; prepared such change.</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 9, 2022 at 9:32 PM Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
This was re-set by devtool modify/devtool finish, I didn&#39;t<br>
specifically adjust it.<br>
<br>
The styleguide says either way is ok. I&#39;d suggest we spend our time on<=
br>
more important matters.<br>
<br>
Alex<br>
<br>
On Wed, 9 Nov 2022 at 21:16, Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please don&#39;t change SRC_URI indentation, meta-oe uses 4 spaces for=
 indentation with closing quote as the first character as described on <a h=
ref=3D"https://www.openembedded.org/wiki/Styleguide" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.openembedded.org/wiki/Styleguide</a><br>
&gt;<br>
&gt; On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutr=
onix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 +++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../recipes-connectivity/lirc/<a href=3D"http://lirc_0.10.2.=
bb" rel=3D"noreferrer" target=3D"_blank">lirc_0.10.2.bb</a>=C2=A0 | 21 +++-=
---<br>
&gt;&gt;=C2=A0 2 files changed, 66 insertions(+), 10 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-oe/dynamic-layers/meta-python/recipe=
s-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-bu=
ild-env.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patc=
h b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-=
Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000..089ed23c7<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc=
/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch<br>
&gt;&gt; @@ -0,0 +1,55 @@<br>
&gt;&gt; +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; +Date: Wed, 9 Nov 2022 20:49:41 +0100<br>
&gt;&gt; +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from buil=
d environment<br>
&gt;&gt; +<br>
&gt;&gt; +This environment variable has special significance for python,<br=
>
&gt;&gt; +and so lirc&#39;s variable has to be named something else.<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; + pylint.mak=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt; + tools/Makefile.am | 2 +-<br>
&gt;&gt; + 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/Makefile.am b/Makefile.am<br>
&gt;&gt; +index 6718af1..fae423e 100644<br>
&gt;&gt; +--- a/Makefile.am<br>
&gt;&gt; ++++ b/Makefile.am<br>
&gt;&gt; +@@ -128,7 +128,7 @@ endif<br>
&gt;&gt; +<br>
&gt;&gt; + pylint: .phony<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C tools pylint<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcf=
ile=3Dpylint.conf \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) -=
-rcfile=3Dpylint.conf \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0--msg-template=3D&#39;$(pylint_templat=
e)&#39; $(py_PYTHON)<br>
&gt;&gt; +<br>
&gt;&gt; + pep8: $(py_PYTHON)<br>
&gt;&gt; +diff --git a/pylint.mak b/pylint.mak<br>
&gt;&gt; +index bf427ab..2692951 100644<br>
&gt;&gt; +--- a/pylint.mak<br>
&gt;&gt; ++++ b/pylint.mak<br>
&gt;&gt; +@@ -1,5 +1,5 @@<br>
&gt;&gt; + PYTHONPATH1=C2=A0 =C2=A0 =C2=A0 =3D $(abs_top_srcdir)/python-pkg=
/lirc:<br>
&gt;&gt; + PYTHONPATH2=C2=A0 =C2=A0 =C2=A0 =3D $(abs_top_srcdir)/python-pkg=
/lirc/lib/.libs<br>
&gt;&gt; +-PYTHONPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(PYTHONPATH1):$(PYTHON=
PATH2)<br>
&gt;&gt; ++LIRCPYTHONPATH=C2=A0 =C2=A0=3D $(PYTHONPATH1):$(PYTHONPATH2)<br>
&gt;&gt; + PYLINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D python3-pylin=
t<br>
&gt;&gt; + pylint_template=C2=A0 =3D {path}:{line}: [{msg_id}({symbol}), {o=
bj}] {msg}<br>
&gt;&gt; +diff --git a/tools/Makefile.am b/tools/Makefile.am<br>
&gt;&gt; +index 85d1fd0..96b17f8 100644<br>
&gt;&gt; +--- a/tools/Makefile.am<br>
&gt;&gt; ++++ b/tools/Makefile.am<br>
&gt;&gt; +@@ -142,7 +142,7 @@ force-pylint: .phony<br>
&gt;&gt; +<br>
&gt;&gt; + pylint: .pylint-stamp<br>
&gt;&gt; + .pylint-stamp: $(py_sources)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcf=
ile=3D../pylint.conf \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) -=
-rcfile=3D../pylint.conf \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0--msg-template=3D&#39;$(pylint_templat=
e)&#39; $? &amp;&amp; touch $@<br>
&gt;&gt; +<br>
&gt;&gt; + .phony:<br>
&gt;&gt; +--<br>
&gt;&gt; +2.30.2<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">lirc_0.10.2.bb</a> b/meta-oe/dynamic-layers/meta-python/recipes-connect=
ivity/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_=
blank">lirc_0.10.2.bb</a><br>
&gt;&gt; index 234d347af..458d9d7cd 100644<br>
&gt;&gt; --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc=
/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lir=
c_0.10.2.bb</a><br>
&gt;&gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc=
/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lir=
c_0.10.2.bb</a><br>
&gt;&gt; @@ -11,16 +11,17 @@ DEPENDS =3D &quot;libxslt-native alsa-lib libf=
tdi libusb1 libusb-compat jack portaudio-<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://prdownloads.sourceforge.=
net/lirc/lirc-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http:=
//prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://0001-Fix-build-on-32bit-arches-with-64bit-ti=
me_t.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://fix_build_errors.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://0001-mplay-Fix-build-with-musl.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://lircd.service \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://lircd.init \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://lircexec.init \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://lircd.conf \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://lirc_options.conf \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://lirc.tmpfiles \<br>
&gt;&gt; -&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-on=
-32bit-arches-with-64bit-time_t.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_build_errors.=
patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mplay-Fix-bu=
ild-with-musl.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.service \<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.init \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircexec.init \<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.conf \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lirc_options.conf=
 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lirc.tmpfiles \<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-=
do-not-clobber-PYTHONPATH-from-build-env.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;3d44ec8274881cf262f160805641f08=
27ffcc20ade0d85e7e6f3b90e0d3d222a&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SYSTEMD_PACKAGES =3D &quot;lirc lirc-exec&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.30.2<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#99509): <a href=3D"https://lists.openembedded.=
org/g/openembedded-devel/message/99509" rel=3D"noreferrer" target=3D"_blank=
">https://lists.openembedded.org/g/openembedded-devel/message/99509</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9492=
1643/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/94921643/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--00000000000091951905ed0fa0d7--

