Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538EFC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:51:07 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.253.1668027058659493313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MWeEn1s6;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id a29so9294770lfj.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyskmlRjkHS/s3VC81XfdH16CWAns6nrMWGxH4PjKL0=;
        b=MWeEn1s6PejH3uzsaf1IEsJO6mCDYPgD77UjuCF/xVdPezI+HUkNOKRqSPLcrPrPFp
         AzWLeTSxmsvxbmUwwdbj6hfS/+oIw5oDfRT4JomsL+jTm3tcske1Bfasavg3+fg1GN62
         f3K2WU8imNepCsFYbz9JTMJSHusGEgfHl3AGrF5kKYvM2JdEqHhAyza9wrorH8JfZ9yp
         PhElMqYEF8h+Y55ftASTTNbYnMtycXI98AM3Q5woPoJE5AC/b5cu+d2hVKjozNBnOxUB
         zUkIZfXoVEwNmvnz9tkGIKMjBhLI8xYyLN93COqrrssqfWuU1EIbLeKVCMCYYWkrZNoM
         4Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyskmlRjkHS/s3VC81XfdH16CWAns6nrMWGxH4PjKL0=;
        b=TVWu9RhSe00Vl/hr0j6cnyhBpJd5vjZmIZR0sL1EH3982qVJU2jDeb4mNHsNZf/J5Z
         pEuOKOS6+PWo+bFeHe7mlxhZAybU5ikIPmrRidKdMhbhUNIYCSgYUvsoR8NDZ8N4x3ig
         JR7yLdbu6CNDIedb4NufN5zdZy1JCw2SlhWNMcvtUHBOfFH/y/LuUJkX7JC0+zQ3Y/tZ
         P0QWGNQv57Ir5u1DTJFHYBaxYyqQXUZcbsWGhll6rsSu/B8V3pT/SeFi6X7Hxm2eoxeV
         J08/UYQ0HlkYOIBWegjpy4LS8wXltYIHhLvy0QrkdNkstv4rpBJc/3VGq91G2E6chOu6
         CdhQ==
X-Gm-Message-State: ANoB5plfjTBXrhehVa6PujAoWVFnzOptBiAq2xIe9ZtYU9Ayj0EmAVw1
	oIWsdXyaQ2I/VXWlREPRrchS5fA6YpJ4kUrxJ0I=
X-Google-Smtp-Source: AA0mqf714Y6s17JhbfcJnGgXI/1V8kqPVZTIehHYWMYAKsSSR8cSsJKjVsRfsXDKr1zVvDF6BcqwBBdd+FQC1WnVojs=
X-Received: by 2002:a19:5f4f:0:b0:4b4:121a:bc81 with SMTP id
 a15-20020a195f4f000000b004b4121abc81mr2306146lfj.445.1668027056922; Wed, 09
 Nov 2022 12:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20221109200558.2034000-1-alex@linutronix.de> <20221109200558.2034000-2-alex@linutronix.de>
 <CA+chaQdcgf-CTZHQTNooWgYnM5HbJygXucGnizaKoqmbCcCvMw@mail.gmail.com>
 <CANNYZj-HjY+JdC39wPLC1v+o0VWcErY8ivPf1+bTGto0Ns1_NQ@mail.gmail.com> <CA+chaQddR_ytsNfV32fXUTNTWxHfuwiZac895Frv0MBrFD1KiA@mail.gmail.com>
In-Reply-To: <CA+chaQddR_ytsNfV32fXUTNTWxHfuwiZac895Frv0MBrFD1KiA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Nov 2022 21:50:45 +0100
Message-ID: <CANNYZj_KWjtYpyQdhNWWjT_u4nPCdTGf6Gx4cfP_QoMiJDuifg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] lirc: correctly use PYTHONPATH
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 20:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99513

This commit shows that at some point in the past you fixed up
formatting to your preference. It does not set one way or another way
as the 'correct' one, particularly as it is not mentioned anywhere in
the layer.

And honestly, I don't care if it's consistent or not, and neither
should you or anyone else. It helps nobody to spend time and energy
enforcing those 4 spaces throughout the layer, as opposed to some
recipes having 4 spaces and some aligning with the value on the first
line. What's so bad about that, seriously?

If you feel strongly about this, you can just run a linter
periodically to fix it up.

Alex

On Wed, 9 Nov 2022 at 21:37, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Style guide says:
> "Some layers prefer to use four-space indentation on sucessive lines and =
prefer the closing quote as the first character"
>
> And this commit:
> https://git.openembedded.org/meta-openembedded/commit/?id=3Da45830a39bb47=
a9eab27980d52966226c9504ea4
> shows that meta-oe/meta-* layers belong to this group.
>
> Yes, it's not 100% consistent, but lets not make it less consistent, just=
 because "devtool finish" prepared such change.
>
> On Wed, Nov 9, 2022 at 9:32 PM Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>
>> This was re-set by devtool modify/devtool finish, I didn't
>> specifically adjust it.
>>
>> The styleguide says either way is ok. I'd suggest we spend our time on
>> more important matters.
>>
>> Alex
>>
>> On Wed, 9 Nov 2022 at 21:16, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>> >
>> > Please don't change SRC_URI indentation, meta-oe uses 4 spaces for ind=
entation with closing quote as the first character as described on https://=
www.openembedded.org/wiki/Styleguide
>> >
>> > On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
>> >>
>> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> >> ---
>> >>  ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 +++++++++++++++++=
++
>> >>  .../recipes-connectivity/lirc/lirc_0.10.2.bb  | 21 +++----
>> >>  2 files changed, 66 insertions(+), 10 deletions(-)
>> >>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connec=
tivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.=
patch
>> >>
>> >> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/=
lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch b=
/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Mak=
efile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
>> >> new file mode 100644
>> >> index 000000000..089ed23c7
>> >> --- /dev/null
>> >> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/li=
rc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
>> >> @@ -0,0 +1,55 @@
>> >> +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00 20=
01
>> >> +From: Alexander Kanavin <alex@linutronix.de>
>> >> +Date: Wed, 9 Nov 2022 20:49:41 +0100
>> >> +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from build e=
nvironment
>> >> +
>> >> +This environment variable has special significance for python,
>> >> +and so lirc's variable has to be named something else.
>> >> +
>> >> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> >> +---
>> >> + Makefile.am       | 2 +-
>> >> + pylint.mak        | 2 +-
>> >> + tools/Makefile.am | 2 +-
>> >> + 3 files changed, 3 insertions(+), 3 deletions(-)
>> >> +
>> >> +diff --git a/Makefile.am b/Makefile.am
>> >> +index 6718af1..fae423e 100644
>> >> +--- a/Makefile.am
>> >> ++++ b/Makefile.am
>> >> +@@ -128,7 +128,7 @@ endif
>> >> +
>> >> + pylint: .phony
>> >> +       $(MAKE) -C tools pylint
>> >> +-      -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3Dpylint.conf =
\
>> >> ++      -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=3Dpylint.c=
onf \
>> >> +       --msg-template=3D'$(pylint_template)' $(py_PYTHON)
>> >> +
>> >> + pep8: $(py_PYTHON)
>> >> +diff --git a/pylint.mak b/pylint.mak
>> >> +index bf427ab..2692951 100644
>> >> +--- a/pylint.mak
>> >> ++++ b/pylint.mak
>> >> +@@ -1,5 +1,5 @@
>> >> + PYTHONPATH1      =3D $(abs_top_srcdir)/python-pkg/lirc:
>> >> + PYTHONPATH2      =3D $(abs_top_srcdir)/python-pkg/lirc/lib/.libs
>> >> +-PYTHONPATH       =3D $(PYTHONPATH1):$(PYTHONPATH2)
>> >> ++LIRCPYTHONPATH   =3D $(PYTHONPATH1):$(PYTHONPATH2)
>> >> + PYLINT           =3D python3-pylint
>> >> + pylint_template  =3D {path}:{line}: [{msg_id}({symbol}), {obj}] {ms=
g}
>> >> +diff --git a/tools/Makefile.am b/tools/Makefile.am
>> >> +index 85d1fd0..96b17f8 100644
>> >> +--- a/tools/Makefile.am
>> >> ++++ b/tools/Makefile.am
>> >> +@@ -142,7 +142,7 @@ force-pylint: .phony
>> >> +
>> >> + pylint: .pylint-stamp
>> >> + .pylint-stamp: $(py_sources)
>> >> +-      -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3D../pylint.co=
nf \
>> >> ++      -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=3D../pylin=
t.conf \
>> >> +       --msg-template=3D'$(pylint_template)' $? && touch $@
>> >> +
>> >> + .phony:
>> >> +--
>> >> +2.30.2
>> >> +
>> >> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/=
lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/lirc/lirc_0.10.2.bb
>> >> index 234d347af..458d9d7cd 100644
>> >> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/li=
rc_0.10.2.bb
>> >> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/li=
rc_0.10.2.bb
>> >> @@ -11,16 +11,17 @@ DEPENDS =3D "libxslt-native alsa-lib libftdi libu=
sb1 libusb-compat jack portaudio-
>> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
>> >>
>> >>  SRC_URI =3D "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.=
bz2 \
>> >> -    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
>> >> -    file://fix_build_errors.patch \
>> >> -    file://0001-mplay-Fix-build-with-musl.patch \
>> >> -    file://lircd.service \
>> >> -    file://lircd.init \
>> >> -    file://lircexec.init \
>> >> -    file://lircd.conf \
>> >> -    file://lirc_options.conf \
>> >> -    file://lirc.tmpfiles \
>> >> -"
>> >> +           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.p=
atch \
>> >> +           file://fix_build_errors.patch \
>> >> +           file://0001-mplay-Fix-build-with-musl.patch \
>> >> +           file://lircd.service \
>> >> +           file://lircd.init \
>> >> +           file://lircexec.init \
>> >> +           file://lircd.conf \
>> >> +           file://lirc_options.conf \
>> >> +           file://lirc.tmpfiles \
>> >> +           file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from-bu=
ild-env.patch \
>> >> +           "
>> >>  SRC_URI[sha256sum] =3D "3d44ec8274881cf262f160805641f0827ffcc20ade0d=
85e7e6f3b90e0d3d222a"
>> >>
>> >>  SYSTEMD_PACKAGES =3D "lirc lirc-exec"
>> >> --
>> >> 2.30.2
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#99509): https://lists.openembedded.org/g/openembe=
dded-devel/message/99509
>> >> Mute This Topic: https://lists.openembedded.org/mt/94921643/3617156
>> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [Martin.Jansa@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>

