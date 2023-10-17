Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2DDCDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:41:05 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.199293.1697510461887513021
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Oct 2023 19:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SqOfkqp1;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6c4bad60a1aso3114726a34.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 19:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697510461; x=1698115261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDZKyvMs6DqdHyvliAUzopn0t4KFePsQ3wE39S9Y5XI=;
        b=SqOfkqp1fOkL6T+FxAGMekvRelH6ea3kEVAapKgstRoCsS2GypAYs7Qie78KVh/mR2
         U9Q6E52uWwhUsd2BkElGq9UPHkBIWpCgb+Z7wORKUMQ56Dln64stDhByI5ghwWz6cD+q
         E9RsyuF32CddCwr4dbx0MufQGNYnG8e4brzTnE5/cQAt957Xl0odATDFQ8kf257hb7bQ
         CRKzLKqSJs2E8vYkHjxXt5rdTc7tWCKCht43NLNoaOp83RwEfgdZhcNHprInBnH75pzA
         9PZaODZ6pXY1tbt+NCAaXTpmHaDk0vlnFSKD5A7LPbF85V816J+GXXG/fOlt8MedCFNk
         JAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697510461; x=1698115261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDZKyvMs6DqdHyvliAUzopn0t4KFePsQ3wE39S9Y5XI=;
        b=ktiEBegYw5u3u2/ApoFFdFBhgOdwf+dfTDBJ4xgH3tuhA1evSGWtgOXRy398mtB3fX
         3c8rUoV616sx8K/cQJATOoR0OPm+TGz4FK2kyWCDAA2/ufgb5stAsB4Iz5jrDWwmP3i9
         1Mg/slswUSdg0HRDWA6GOBkIti5rnRp3cCd96nHM+FCjmsRFyNdhtHAFV617hKupVU45
         IzCZgC7ZmSPu3IUm9B6qNfYu3y+qQgp9+HH9HyK9oqqezoxEto933udbJ2CMZE15+TQv
         lIfB2NTv4FZ7/Z+njdgXA80m9u0mjvjWqMQ9iiemqRuLe53hG0c5KQ/SWceic+orKfyC
         kKlA==
X-Gm-Message-State: AOJu0YzeMGHCAIDjInHhLaam4KEOesur4VzMrdgSnJCl1oAuongkQWsp
	6aaJdb6DyYNKose7TMzStsDUiigW5vA7x1lf5783ShFbD+w=
X-Google-Smtp-Source: AGHT+IEyeMIpZ25HJq9TOaUDwWM/ZOI59I3CBAEh/GvD1urNE+rJSC0X/YSDhG/FrRWG1Ce4uQJOS8YLStFjhKaNV+w=
X-Received: by 2002:a05:6870:ac8f:b0:1e9:9376:2b36 with SMTP id
 ns15-20020a056870ac8f00b001e993762b36mr1019619oab.36.1697510460953; Mon, 16
 Oct 2023 19:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231017011718.144753-1-chi.xu@windriver.com> <CAMKF1srPUnze5t5win9RhH_XOfC+dcCxafsz_v7dtmkZduCErQ@mail.gmail.com>
 <DM4PR11MB53905F02ADA3D27604B7CF1B9AD6A@DM4PR11MB5390.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB53905F02ADA3D27604B7CF1B9AD6A@DM4PR11MB5390.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Oct 2023 19:40:34 -0700
Message-ID: <CAMKF1sp+6T7BrnspZruhKJuN=neLzDhpdi8CeCQKAPU8a9teJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] re2: Add ptest support
To: "Xu, Chi" <Chi.Xu@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 02:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105549

On Mon, Oct 16, 2023 at 7:00=E2=80=AFPM Xu, Chi <Chi.Xu@windriver.com> wrot=
e:
>
> Get it.
> Can I understand that if all the test cases pass, we should add pteat to =
PTESTS_SLOW_META_OE or PTESTS_FAST_META_OE in the patch?

if it can finish running in less than 30s then its considered to be fast fa=
mily.

>
> Thanks,
> Chi
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Tuesday, October 17, 2023 9:52 AM
> > To: Xu, Chi <Chi.Xu@windriver.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] re2: Add ptest support
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and
> > know the content is safe.
> >
> > Thanks for adding ptest, I see that it passes all tests but runs for lo=
nger.
> > Maybe add it to PTESTS_SLOW_META_OE as well.
> >
> > On Mon, Oct 16, 2023 at 6:17=E2=80=AFPM Chi Xu <chi.xu@eng.windriver.co=
m> wrote:
> > >
> > > From: Chi Xu <chi.xu@windriver.com>
> > >
> > > Test results:
> > > root@qemux86-64:~# ptest-runner re2 -t 7200
> > > START: ptest-runner
> > > 2023-10-16T08:36
> > > BEGIN: /usr/lib/re2/ptest
> > > PASS: charclass_test
> > > PASS: compile_test
> > > PASS: filtered_re2_test
> > > PASS: mimics_pcre_test
> > > PASS: parse_test
> > > PASS: possible_match_test
> > > PASS: re2_test
> > > PASS: re2_arg_test
> > > PASS: regexp_test
> > > PASS: required_prefix_test
> > > PASS: search_test
> > > PASS: set_test
> > > PASS: simplify_test
> > > PASS: string_generator_test
> > > PASS: dfa_test
> > > PASS: exhaustive1_test
> > > PASS: exhaustive2_test
> > > PASS: exhaustive3_test
> > > PASS: exhaustive_test
> > > PASS: random_test
> > > DURATION: 2085
> > > END: /usr/lib/re2/ptest
> > > 2023-10-16T09:11
> > > STOP: ptest-runner
> > > TOTAL: 1 FAIL: 0
> > >
> > > Signed-off-by: Chi Xu <chi.xu@windriver.com>
> > > ---
> > >  meta-oe/recipes-support/re2/re2/run-ptest     |  3 +++
> > >  meta-oe/recipes-support/re2/re2_2023.03.01.bb | 16 +++++++++++++---
> > >  2 files changed, 16 insertions(+), 3 deletions(-)  create mode 10064=
4
> > > meta-oe/recipes-support/re2/re2/run-ptest
> > >
> > > diff --git a/meta-oe/recipes-support/re2/re2/run-ptest
> > > b/meta-oe/recipes-support/re2/re2/run-ptest
> > > new file mode 100644
> > > index 000000000..8bd5fd1ef
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/re2/re2/run-ptest
> > > @@ -0,0 +1,3 @@
> > > +#!/bin/sh
> > > +
> > > +ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Te=
st
> > +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"=
);
> > print $6": "$4; fflush();}'
> > > diff --git a/meta-oe/recipes-support/re2/re2_2023.03.01.bb
> > > b/meta-oe/recipes-support/re2/re2_2023.03.01.bb
> > > index 78bf695a4..fe210d510 100644
> > > --- a/meta-oe/recipes-support/re2/re2_2023.03.01.bb
> > > +++ b/meta-oe/recipes-support/re2/re2_2023.03.01.bb
> > > @@ -6,17 +6,27 @@ LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D3b5c31eb512bdf3cb11ffd5713963760"
> > >  # tag 2023-03-01
> > >  SRCREV =3D "241e2e430836e80f93d704d1f06cd3e7fe3100f5"
> > >
> > > -SRC_URI =3D "git://github.com/google/re2.git;branch=3Dmain;protocol=
=3Dhttps"
> > > +SRC_URI =3D "git://github.com/google/re2.git;branch=3Dmain;protocol=
=3Dhttps \
> > > +           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-pt=
est', '', d)} \
> > > +          "
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > -inherit cmake
> > > +inherit cmake ptest
> > > +RDEPENDS:${PN}-ptest +=3D "cmake sed"
> > >
> > >  EXTRA_OECMAKE +=3D " \
> > >         -DBUILD_SHARED_LIBS=3DON \
> > > -       -DRE2_BUILD_TESTING=3DOFF \
> > > +        ${@bb.utils.contains('PTEST_ENABLED', '1',
> > > + '-DRE2_BUILD_TESTING=3DON', '-DRE2_BUILD_TESTING=3DOFF', d)} \
> > >  "
> > >
> > > +do_install_ptest () {
> > > +    cp -r ${B}/*_test ${D}${PTEST_PATH}
> > > +    cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
> > > +    sed -i -e 's#${B}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name
> > CTestTestfile.cmake`
> > > +    sed -i -e 's#${S}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name
> > > +CTestTestfile.cmake` }
> > > +
> > >  # ignore .so in /usr/lib64
> > >  FILES:${PN} =3D "${libdir}"
> > >  INSANE_SKIP:${PN} +=3D "dev-so"
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#105545):
> > > https://lists.openembedded.org/g/openembedded-devel/message/105545
> > > Mute This Topic: https://lists.openembedded.org/mt/102010115/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> > devel/unsub
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

