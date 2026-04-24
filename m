Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C97DFDEE5F
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 02:37:54 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13104.1776998269529938921
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 19:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rfIUjOBq;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ea611d1a4so2714158fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 19:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776998269; cv=none;
        d=google.com; s=arc-20240605;
        b=ahq/ff9h44QUdg+5UJ0LuCV75s4vW4V6X1H2en1LPCfuxYYOTo9ZwfsdSytA2590ZY
         NLZ01tddmwm6KxYYA8QAwf7YCqSXP/WBVlJVatQJ6f3NcjZ65orQo81QMNeJMFmk7aQ7
         bGLKrol8x8TYlnQU+0zo51ZDSAQtSciSVrvkmiTSJgmMj3Ej5eYm5RR43LGD3OtVX87N
         7SqKTLFEbxoCPMlUIHN3i0N90r33AEV0/tpmqnnLdVwzl0A0BGovJaWsw9FD53YklBRz
         8beJj00gO5ARukE2iZ1SKWehjmbGlQBdPbj7VkWUFvbDovnWvcLoB/XIwNW5jAXKgJAs
         dW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CI/vAmPiCGB0wvh0O51oAOwVOzxMcZGYtlEmvSOIrXM=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=hIApaPu9vRF5ZOLvvmIsH/loz/bSc7dDcZeJU5qNu7mFXmhrT+ZHa5IPQ8coD5vekC
         4QaNw5LayiCcToYW6JcWu3dr2g8MonMt/5Z5FBZscxCn+aa0IPgEp6JbpW9yq7HuQWNM
         i09f74dwHn6R6ckjfqrlweo3I2WMFiAz/RCgWhbt4VtwsGIrwj7yLkIOwU3UJnHLvQEV
         wW0iBlm8EbigUghrovTF2LzSrcwKqZT0DYqijD+SXT3vO4Tt43xR8kXOdC6e7Z5jLtGz
         mk7+TaNNYJLgQhKpx3PtgfPu6J5W/7iDflVxkbvdm/OfQA+YrrCe7bQ1SUv98tiVnR6h
         fImg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776998269; x=1777603069; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI/vAmPiCGB0wvh0O51oAOwVOzxMcZGYtlEmvSOIrXM=;
        b=rfIUjOBq+ax3E6la/GOcQ5elAm2l8u02bcObDnzhabOcg1m/bx/geHrTP39dY+0yjs
         21WcLgYEimljkrtyC3fvaROfgUKU8IrqHDYVALyQ4TcRGAl3Pazj+YLqNr1ifKB/vvNG
         ijLsbw0Jyv+Bp7kYO3ICj3lfWb0RtxbdtO9aJlQQMHPAi70XdCt+GuUmCnaKwloFF2YQ
         xCgHh1VIaTqSbyDbWqAYuDiQkgp5H+F+RZdIfUHGXLoECDxcYEQYCo91jM0mzxaqOo1B
         fWaSTG1FIdelOlk1BF3LNjmoIKasOnnKNgBQCJIURMoDZVantWchfh+Hg2zRhXEFagvs
         3/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776998269; x=1777603069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CI/vAmPiCGB0wvh0O51oAOwVOzxMcZGYtlEmvSOIrXM=;
        b=pfrLD2Cu1qkTLgk2UnhCD4ryBzf4fjKXjECTwB22B02SCAKRFzHqtAIXd+7n5Xw7ui
         31Aq+4nvx7YffgJBRSWCBabtqOPmqao4IGIwh5rpePfnRwSw2Dyf5OFt82oH7lQmcPHN
         b0aqFUgk7pz/AVV7UZnwRsL6MbMLyDJgDNBCqYSyBEaDPAsO9tCcLnXxVGZQF1EbfJqN
         g33dUnM0FPFbHXfg+CXukEoqb5JMUHT3s1tXov6vdz5MBCG7h+liDg0osYkWi9mYAn6p
         khfjFqLOrZD5U2rp8fJWXSxRKifbPPu2sWVs1k4tpLUeRx6kj5nZGNiSy30Jy/4u0g9N
         0fww==
X-Gm-Message-State: AOJu0Yx5BoJ7H3nXs6CSJyflx8c4nYzZPO3LujULR9xiPIcYM7e0OhZn
	jyXhscKS+qSbKvVGxZwjpJnlD8EJ+vzQ1ixmMy0M6FGIlZgZNJ/rBGg6woqjMz9GTdguxMdjgvw
	ZFeOMePfkDjdr1Uu2i+14x+OnNZ9yRn8=
X-Gm-Gg: AeBDievOSvbVHd2HWBWE7xcYE/ngPnNP7OQUNS/yXxlKpu9O/PbrFveAxyIyPK2bNP1
	TUciJsOIBvSAdRwKbAndw3+EE9Cjarlndxdr6zBu80YjHtnIN4k05x8gigGN9YFFVTqCrLtrTIG
	VZL2WPeZvyz5cgR80krJ8R+L33MCttTwHyrJrsJGKJj9aF6zza0Wz8G1LSjdwU0ane0drPCZJLH
	t5PzH6R3iL2deRY0QhLfGGE51QwShwP0NCNRMhuwrjDtqs+lf/F0rFu16+EQ95N6T7XZusKhCzG
	2xk0BMX7lF1WOIlnGJUC
X-Received: by 2002:a05:6870:5cce:b0:42c:dea:d370 with SMTP id
 586e51a60fabf-42c0dead818mr12103618fac.12.1776998268602; Thu, 23 Apr 2026
 19:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com> <CA+s=J=xTyGhOKuQjRyAJyzh7UCW4PSntZPimbpN0eCa8K71TOw@mail.gmail.com>
In-Reply-To: <CA+s=J=xTyGhOKuQjRyAJyzh7UCW4PSntZPimbpN0eCa8K71TOw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 24 Apr 2026 14:37:37 +1200
X-Gm-Features: AQROBzC2MM-WbZv6WM9D9VcNjnPidyJyvZVcr3VbGM7WIK7dS905S4Yda1yUutk
Message-ID: <CADySD0FVz7RYV-XMJ-HqQ-f-pJVkGASr++JFEfKXf6kS8SJSLw@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 1/19] jq: Use Git to fetch the code
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 02:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126599

On Fri, Apr 24, 2026 at 1:45=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> Hi Ankur,
>
> Thank you for sending these. I had already picked a lot of these in my
> branch for pull request I'd like to send today. I will take the rest
> in next and final series for whinlatter.

Sounds good. What's your plan for the final cut-off to accept patches
for whinlatter?

>
> On Thu, Apr 23, 2026 at 8:48=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Peter Kjellerstedt <pkj@axis.com>
> >
> > There is a bug (see https://github.com/jqlang/jq/issues/434), which
> > results in an empty version being used if autoreconf is run on the jq
> > sources when using a release tar ball. The incorrect assumption is that
> > autoreconf is only used when fetching the code using Git.
> >
> > The empty version results in an incorrect libjq.pc file being created
> > where the version is not set, which results in, e.g.,
> > `pkgconf --libs 'libjq > 1.6'` failing even if version 1.8.1 of jq is
> > actually installed.
> >
> > Switch to fetching the code using Git to workaround the bug.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > (cherry picked from commit ed33569f822a3a8d41f82f6980a046d17aca37d5)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  ...-with-disable-maintainer-mode-and-so.patch | 44 +++++++++++++++++++
> >  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       | 14 +++---
> >  2 files changed, 52 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-buildin=
g-with-disable-maintainer-mode-and-so.patch
> >
> > diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-=
disable-maintainer-mode-and-so.patch b/meta-oe/recipes-devtools/jq/jq/0001-=
Support-building-with-disable-maintainer-mode-and-so.patch
> > new file mode 100644
> > index 0000000000..12a64a75ed
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable=
-maintainer-mode-and-so.patch
> > @@ -0,0 +1,44 @@
> > +From 27f417f4812e688a59fc5186b7768cec004cd6e5 Mon Sep 17 00:00:00 2001
> > +From: Peter Kjellerstedt <peter.kjellerstedt@gmail.com>
> > +Date: Wed, 8 Apr 2026 05:58:49 +0200
> > +Subject: [PATCH] Support building with --disable-maintainer-mode and s=
ource !=3D
> > + build dir (#3518)
> > +
> > +If --disable-maintainer-mode is enabled, then the rules for generating
> > +parser.[ch] and lexer.[ch] did nothing. This worked fine if the source
> > +and build directories are the same as the pre-generated parser.c and
> > +lexer.c files would suffice. However, if the build directory is not th=
e
> > +same as the source directory, then the rest of the Make rules expect
> > +parser.[ch] and lexer.[ch] to have been created in the build directory
> > +if their source files (parser.y and lexer.l) are newer than the target
> > +files, which can happen in case the source is fetched using Git.
> > +
> > +Avoid the problem by copying the files to the build directory if neede=
d.
> > +
> > +Co-authored-by: Peter Kjellerstedt <pkj@axis.com>
> > +Upstream-Status: Backport [https://github.com/jqlang/jq/commit/27f417f=
4812e688a59fc5186b7768cec004cd6e5]
> > +---
> > + Makefile.am | 9 +++++++--
> > + 1 file changed, 7 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index 96d6038..acb9443 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -41,9 +41,14 @@ src/lexer.h: src/lexer.c
> > + else
> > + BUILT_SOURCES =3D src/builtin.inc src/config_opts.inc src/version.h
> > + .y.c:
> > +-      $(AM_V_YACC) echo "NOT building parser.c!"
> > ++      $(AM_V_YACC) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(@F) $@
> > ++      $(AM_V_YACC) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(*F).h $*.h
> > ++      $(AM_V_YACC) touch $@ $*.h
> > ++
> > + .l.c:
> > +-      $(AM_V_LEX) echo "NOT building lexer.c!"
> > ++      $(AM_V_LEX) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(@F) $@
> > ++      $(AM_V_LEX) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(*F).h $*.h
> > ++      $(AM_V_LEX) touch $@ $*.h
> > + endif
> > +
> > + # Tell YACC (Bison) autoconf macros that you want a header file creat=
ed.
> > diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-=
devtools/jq/jq_1.8.1.bb
> > index b9383c76f7..6eaa2de6df 100644
> > --- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> > +++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> > @@ -8,15 +8,17 @@ SECTION =3D "utils"
> >  LICENSE =3D "MIT & BSD-2-Clause"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf7fcb0a1def4a7ad62c028f7d0=
dca47"
> >
> > -GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
> > -SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar=
.gz \
> > +SRCREV =3D "4467af7068b1bcd7f882defff6e7ea674c5357f4"
> > +
> > +SRC_URI =3D " \
> > +    git://github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;ta=
g=3Djq-${PV} \
> >      file://run-ptest \
> > -    "
> > -SRC_URI[sha256sum] =3D "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc2=
08a311dc33ca837eb0"
> > +    file://0001-Support-building-with-disable-maintainer-mode-and-so.p=
atch \
> > +"
> >
> > -inherit autotools github-releases ptest
> > +inherit autotools ptest
> >
> > -UPSTREAM_CHECK_REGEX =3D "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
> > +UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
> >
> >  PACKAGECONFIG ?=3D "oniguruma"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126577): https://lists.openembedded.org/g/openembed=
ded-devel/message/126577
> > Mute This Topic: https://lists.openembedded.org/mt/118970752/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

