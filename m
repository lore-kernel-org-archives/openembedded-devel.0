Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BC8C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 21:02:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.381.1668027749550883273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 13:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jcvwALzx;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id a29so9348829lfj.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 13:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oECdSdPzgfzy12UFSCBGkpNNzKq02nKOloSvcjxrAks=;
        b=jcvwALzxhAPdd1nP/X8Lbd+Jq2tGCV4z+tYWGjwTxf/tfsXBro18M4z1R3GeHPEnHo
         hL2NIdG5mdS608cDLH1S0X/Nehk1qHRHLTvqvou5mhpyIRbtcyH+HkeJfUvF1GxCRS4N
         D6JwoYI4rulCZMYKFCBA+A5/g2NEbBC0N3N5Bhv8g3tqutRfRbyaaHWCWyFFlH1uYwtJ
         DtUvo+E03ryC0nQqEee9+WYt5oWmW/C+OcH7F/D1O+Eldu9oQwHirrGkr04HgaYn6uEb
         BTXZWtAOFTVMiZl7k3Qg1uvN46QX1Rw+GE31RuzKgsB3vAsGjR8QxgWnRNYqA6fCB/8k
         sE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oECdSdPzgfzy12UFSCBGkpNNzKq02nKOloSvcjxrAks=;
        b=TtzvcHEmhtbd/0lyW+vXUGygqmoRxU2H4RJrpLvCMY7D/BdgVI9YokwPVwlNURG1Xp
         m0WEw9vZAk5G8FmO+/I2SwhsDEUQJNA4jWf7R3A9U49CazfIRGe2ylqVn1Pn042OYZV3
         qJQeq0MWV1XsPmKLvPbPYNCNL1/sBv9c94DNLJVjVnqwhvkjOq1gnr0pQUWcKsdl+RB2
         TsnJ/ykgmlzQzSk5SkehGeq+OCidAEkVruylsgmU2HqR7/l8vl6PO+s8fcnOL6UTJZ2u
         804rPNgPrYY7eIOgVoJGjsqaXwURi/TxoXFceV1214saCu7DpkNocZbov/x/JOddOjfX
         jJMA==
X-Gm-Message-State: ACrzQf274TjS9/HY9mJglJhNr4fNMWLMgSewq8FjupLyJbv9qKjpUuUl
	tcg1yU8T2l4s0DbIn/qgr4A9AR+w9Oib/Zv56+0=
X-Google-Smtp-Source: AMsMyM4GPwdGENmaYb2kRwWZ8bkXfeGrC24SypTkZ51biUvKhjhUXlS4YRsCybuwH7ho+mgm37Vm12y+B4jkO1YwaSg=
X-Received: by 2002:a19:4f18:0:b0:4a2:4aad:8fff with SMTP id
 d24-20020a194f18000000b004a24aad8fffmr788515lfb.445.1668027747568; Wed, 09
 Nov 2022 13:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20221109200558.2034000-1-alex@linutronix.de> <20221109200558.2034000-2-alex@linutronix.de>
 <CA+chaQdcgf-CTZHQTNooWgYnM5HbJygXucGnizaKoqmbCcCvMw@mail.gmail.com>
 <CANNYZj-HjY+JdC39wPLC1v+o0VWcErY8ivPf1+bTGto0Ns1_NQ@mail.gmail.com>
 <CA+chaQddR_ytsNfV32fXUTNTWxHfuwiZac895Frv0MBrFD1KiA@mail.gmail.com>
 <CANNYZj_KWjtYpyQdhNWWjT_u4nPCdTGf6Gx4cfP_QoMiJDuifg@mail.gmail.com> <CA+chaQfd8CbNi0ziu+RJK5md31iUYqTopSgBqD6VtWUvPkjkwA@mail.gmail.com>
In-Reply-To: <CA+chaQfd8CbNi0ziu+RJK5md31iUYqTopSgBqD6VtWUvPkjkwA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Nov 2022 22:02:16 +0100
Message-ID: <CANNYZj8S+tTOcxK=h3J4LuK5fx-BOL-jbqXdkjgp29UfcM94Ng@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] lirc: correctly use PYTHONPATH
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 21:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99515

That I can certainly agree with. Still, the problem is that devtool
knows only one style of formatting and resets to it, and I'm not sure
it's a good use of time to implement auto-detection of the other style
when modifying recipes.

Alex

On Wed, 9 Nov 2022 at 21:55, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Well the obvious difference is that your commit which I was reviewing cho=
ws 11 changed lines, instead of just 1 added .patch file in SRC_URI.
>
> Style changes shouldn't be applied together with functional changes, espe=
cially when they make it worse.
>
> On Wed, Nov 9, 2022 at 9:50 PM Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>
>> This commit shows that at some point in the past you fixed up
>> formatting to your preference. It does not set one way or another way
>> as the 'correct' one, particularly as it is not mentioned anywhere in
>> the layer.
>>
>> And honestly, I don't care if it's consistent or not, and neither
>> should you or anyone else. It helps nobody to spend time and energy
>> enforcing those 4 spaces throughout the layer, as opposed to some
>> recipes having 4 spaces and some aligning with the value on the first
>> line. What's so bad about that, seriously?
>>
>> If you feel strongly about this, you can just run a linter
>> periodically to fix it up.
>>
>> Alex
>>
>> On Wed, 9 Nov 2022 at 21:37, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>> >
>> > Style guide says:
>> > "Some layers prefer to use four-space indentation on sucessive lines a=
nd prefer the closing quote as the first character"
>> >
>> > And this commit:
>> > https://git.openembedded.org/meta-openembedded/commit/?id=3Da45830a39b=
b47a9eab27980d52966226c9504ea4
>> > shows that meta-oe/meta-* layers belong to this group.
>> >
>> > Yes, it's not 100% consistent, but lets not make it less consistent, j=
ust because "devtool finish" prepared such change.
>> >
>> > On Wed, Nov 9, 2022 at 9:32 PM Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
>> >>
>> >> This was re-set by devtool modify/devtool finish, I didn't
>> >> specifically adjust it.
>> >>
>> >> The styleguide says either way is ok. I'd suggest we spend our time o=
n
>> >> more important matters.
>> >>
>> >> Alex
>> >>
>> >> On Wed, 9 Nov 2022 at 21:16, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> >> >
>> >> > Please don't change SRC_URI indentation, meta-oe uses 4 spaces for =
indentation with closing quote as the first character as described on https=
://www.openembedded.org/wiki/Styleguide
>> >> >
>> >> > On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>> >> >>
>> >> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> >> >> ---
>> >> >>  ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 ++++++++++++++=
+++++
>> >> >>  .../recipes-connectivity/lirc/lirc_0.10.2.bb  | 21 +++----
>> >> >>  2 files changed, 66 insertions(+), 10 deletions(-)
>> >> >>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-con=
nectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-e=
nv.patch
>> >> >>
>> >> >> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patc=
h b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-=
Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
>> >> >> new file mode 100644
>> >> >> index 000000000..089ed23c7
>> >> >> --- /dev/null
>> >> >> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc=
/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
>> >> >> @@ -0,0 +1,55 @@
>> >> >> +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00=
 2001
>> >> >> +From: Alexander Kanavin <alex@linutronix.de>
>> >> >> +Date: Wed, 9 Nov 2022 20:49:41 +0100
>> >> >> +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from buil=
d environment
>> >> >> +
>> >> >> +This environment variable has special significance for python,
>> >> >> +and so lirc's variable has to be named something else.
>> >> >> +
>> >> >> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> >> >> +---
>> >> >> + Makefile.am       | 2 +-
>> >> >> + pylint.mak        | 2 +-
>> >> >> + tools/Makefile.am | 2 +-
>> >> >> + 3 files changed, 3 insertions(+), 3 deletions(-)
>> >> >> +
>> >> >> +diff --git a/Makefile.am b/Makefile.am
>> >> >> +index 6718af1..fae423e 100644
>> >> >> +--- a/Makefile.am
>> >> >> ++++ b/Makefile.am
>> >> >> +@@ -128,7 +128,7 @@ endif
>> >> >> +
>> >> >> + pylint: .phony
>> >> >> +       $(MAKE) -C tools pylint
>> >> >> +-      -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3Dpylint.co=
nf \
>> >> >> ++      -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=3Dpylin=
t.conf \
>> >> >> +       --msg-template=3D'$(pylint_template)' $(py_PYTHON)
>> >> >> +
>> >> >> + pep8: $(py_PYTHON)
>> >> >> +diff --git a/pylint.mak b/pylint.mak
>> >> >> +index bf427ab..2692951 100644
>> >> >> +--- a/pylint.mak
>> >> >> ++++ b/pylint.mak
>> >> >> +@@ -1,5 +1,5 @@
>> >> >> + PYTHONPATH1      =3D $(abs_top_srcdir)/python-pkg/lirc:
>> >> >> + PYTHONPATH2      =3D $(abs_top_srcdir)/python-pkg/lirc/lib/.libs
>> >> >> +-PYTHONPATH       =3D $(PYTHONPATH1):$(PYTHONPATH2)
>> >> >> ++LIRCPYTHONPATH   =3D $(PYTHONPATH1):$(PYTHONPATH2)
>> >> >> + PYLINT           =3D python3-pylint
>> >> >> + pylint_template  =3D {path}:{line}: [{msg_id}({symbol}), {obj}] =
{msg}
>> >> >> +diff --git a/tools/Makefile.am b/tools/Makefile.am
>> >> >> +index 85d1fd0..96b17f8 100644
>> >> >> +--- a/tools/Makefile.am
>> >> >> ++++ b/tools/Makefile.am
>> >> >> +@@ -142,7 +142,7 @@ force-pylint: .phony
>> >> >> +
>> >> >> + pylint: .pylint-stamp
>> >> >> + .pylint-stamp: $(py_sources)
>> >> >> +-      -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3D../pylint=
.conf \
>> >> >> ++      -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=3D../py=
lint.conf \
>> >> >> +       --msg-template=3D'$(pylint_template)' $? && touch $@
>> >> >> +
>> >> >> + .phony:
>> >> >> +--
>> >> >> +2.30.2
>> >> >> +
>> >> >> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connect=
ivity/lirc/lirc_0.10.2.bb
>> >> >> index 234d347af..458d9d7cd 100644
>> >> >> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc=
/lirc_0.10.2.bb
>> >> >> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc=
/lirc_0.10.2.bb
>> >> >> @@ -11,16 +11,17 @@ DEPENDS =3D "libxslt-native alsa-lib libftdi l=
ibusb1 libusb-compat jack portaudio-
>> >> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263"
>> >> >>
>> >> >>  SRC_URI =3D "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.t=
ar.bz2 \
>> >> >> -    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch=
 \
>> >> >> -    file://fix_build_errors.patch \
>> >> >> -    file://0001-mplay-Fix-build-with-musl.patch \
>> >> >> -    file://lircd.service \
>> >> >> -    file://lircd.init \
>> >> >> -    file://lircexec.init \
>> >> >> -    file://lircd.conf \
>> >> >> -    file://lirc_options.conf \
>> >> >> -    file://lirc.tmpfiles \
>> >> >> -"
>> >> >> +           file://0001-Fix-build-on-32bit-arches-with-64bit-time_=
t.patch \
>> >> >> +           file://fix_build_errors.patch \
>> >> >> +           file://0001-mplay-Fix-build-with-musl.patch \
>> >> >> +           file://lircd.service \
>> >> >> +           file://lircd.init \
>> >> >> +           file://lircexec.init \
>> >> >> +           file://lircd.conf \
>> >> >> +           file://lirc_options.conf \
>> >> >> +           file://lirc.tmpfiles \
>> >> >> +           file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from=
-build-env.patch \
>> >> >> +           "
>> >> >>  SRC_URI[sha256sum] =3D "3d44ec8274881cf262f160805641f0827ffcc20ad=
e0d85e7e6f3b90e0d3d222a"
>> >> >>
>> >> >>  SYSTEMD_PACKAGES =3D "lirc lirc-exec"
>> >> >> --
>> >> >> 2.30.2
>> >> >>
>> >> >>
>> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >> Links: You receive all messages sent to this group.
>> >> >> View/Reply Online (#99509): https://lists.openembedded.org/g/opene=
mbedded-devel/message/99509
>> >> >> Mute This Topic: https://lists.openembedded.org/mt/94921643/361715=
6
>> >> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> >> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/u=
nsub [Martin.Jansa@gmail.com]
>> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >>

