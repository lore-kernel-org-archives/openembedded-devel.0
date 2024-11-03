Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DE4E6F06C
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 10:48:55 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.33814.1730630928418974330
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 02:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kIVpBEGz;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so33556821fa.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 02:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730630926; x=1731235726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pR+upPC8s037B0KTDrzdMGOKUXTl7pC/NPgLkxTg30k=;
        b=kIVpBEGzJcIDZ6c9ifik6GK7K3Mt0Szinve7ilmZXEr07ck6U+hGa/az9xixCDY+p3
         QAMOIhwhocVgH9xMndbr8ksWM1OyV3g6vl4BdhQ7qvJbSAtwcIpUR1JzGsupLDC2MCak
         d4GcbFNK3MwMKfZEIsj5SKw1ZiaWQRghZrYqOiEBnYx09ZwOcby4kqX3DhRjTN7ygy09
         uAOgd+YPE8NBTOm/tSY1Dyz8FShjMb+lBcuuzwoMaz5dFhCUE3bNyybTBR1QjbOBIC3/
         5fIk6TdQduVWtp1lH1OUpdTumqPW8p9I+5rfwoPRec2XDtibkcb6VYyUo4HC7/FZ7LC5
         durQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730630926; x=1731235726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pR+upPC8s037B0KTDrzdMGOKUXTl7pC/NPgLkxTg30k=;
        b=MOtZ7T2Ncqpe/9eEByxHjStSModg8P6pehKS8a+oB2rjxQVSLD4fPCK7fsnGoEywYl
         XSCLXlmACwUYBtD/Sr/wbn5lI6d8wFZd4WrdyyH6/e5IhDnMcPgcQ69ovtY5aprfI02e
         ZnM/gp9+FRFDWfD8HDJOWf7Sayxf9gTE01Ke0nJToXW3Di6wLJTOWmv/qw4uE6Gbcd6O
         k6AlLpidxLYZQh2Qf4HXx1xmDaxKfCVF4c9sM+84SfHXbyPng/tMcdupu99AgG0B9AGo
         9e0weXdldNb6hfe8DGSortIw82ElnaeLWpw2vnHgxA26GIg7rKe6AipZ9HJQwaYrdvJU
         rDIw==
X-Forwarded-Encrypted: i=1; AJvYcCWrz39UJ1UQuVWDcHPEycSJbqeF+3dhqyyM3ww8QOMF8OttVEwMMlVICzrGYeEUMiH+/JuGL5wtNn0xR0qCqsUncPo=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxwv6k8rsFsmTaxMHIlIA8QnLLn826ApZhdCMHEk1eAlQ+6v6bZ
	DC707eshITHQSaF3PErv+YQyEFkyhwUwlrrIy/M5sAWJvKJFHS8qD5taW81EptJ/2n2BMHDvBxb
	XoojOR9tbtXih/ajG8KCHLAe+kkE=
X-Google-Smtp-Source: AGHT+IFcPiRqb6ZA5PUfOx6Rg5xTCbLadrKXZ8MUD8yGQjn74KyMEK/P9lgzYbfkEn8lLXQqLs3d0Fjt2hPwBCLq45Y=
X-Received: by 2002:a05:651c:994:b0:2fb:5504:794d with SMTP id
 38308e7fff4ca-2fedb7ecb76mr38381661fa.44.1730630926080; Sun, 03 Nov 2024
 02:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20241017061710.1108077-1-raj.khem@gmail.com> <18026D239C42081A.19860@lists.openembedded.org>
In-Reply-To: <18026D239C42081A.19860@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 3 Nov 2024 11:48:34 +0100
Message-ID: <CA+chaQdnF2LhKjKuaErwVDYvVvFUqo2DsL=2XBeap0fe9HbWOQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: Fix race condition triggered
 during symlink creation
To: martin.jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 10:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113395

Looks like I spoke too soon, got the same build failure 3 more times
in last 2 days.

rm -f libxmlrpc_util.so.4 && ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so=
.4
rm -f xmlrpc_util++.pc
rm -f libxmlrpc_util.so && ln -s libxmlrpc_util.so.4 libxmlrpc_util.so
Echoes to 'xmlrpc_util++.pc' suppressed here ...
make[3]: Entering directory 'xmlrpc-c/1.60.03/git/stable/lib/libutil'
rm -f libxmlrpc_util.so && ln -s libxmlrpc_util.so.4 libxmlrpc_util.so
make[3]: Leaving directory 'xmlrpc-c/1.60.03/git/stable/lib/libutil'
ln: failed to create symbolic link 'libxmlrpc_util.so': File exists
make[3]: *** [xmlrpc-c/1.60.03/git/stable/unix-common.mk:65:
libxmlrpc_util.so] Error 1

Looks like it calls:

make -C xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f
xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
    libxmlrpc_util.so

twice and the added && isn't enough to avoid the race between the 2.

On Sun, Oct 27, 2024 at 10:40=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Thanks Khem!
>
> On Thu, Oct 17, 2024 at 8:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > This should fix race condition sometime seen in highly parallell builds
> >
> >    | rm -f libxmlrpc_util.so.4
> >    | rm -f libxmlrpc_util.so.4
> >    | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
> >    | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
> >    | rm -f libxmlrpc_util.so
> >    | ln: failed to create symbolic link 'libxmlrpc_util.so.4': File exi=
sts
> >    | make[2]: *** [/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/x=
mlrpc-c/1.60.03/git/stable/unix-common.mk:72: libxmlrpc_util.so.4] Error 1
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...nsuring-Sequential-Execution-of-rm-a.patch | 46 +++++++++++++++++++
> >  .../xmlrpc-c/xmlrpc-c_1.60.03.bb              |  1 +
> >  2 files changed, 47 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-uni=
x-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
> >
> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-commo=
n.mk-Ensuring-Sequential-Execution-of-rm-a.patch b/meta-oe/recipes-devtools=
/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-=
a.patch
> > new file mode 100644
> > index 0000000000..02b5244f3a
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-En=
suring-Sequential-Execution-of-rm-a.patch
> > @@ -0,0 +1,46 @@
> > +From c9bd05e8f0ad805b81625cfa717d06071cfd9b48 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 16 Oct 2024 22:52:38 -0700
> > +Subject: [PATCH] unix-common.mk: Ensuring Sequential Execution of rm a=
nd ln commands
> > +
> > +With high parallel execution, it results in race condition where
> > +its trying to create symlink while the original symlink while rm is
> > +not done deleting the existing file yet.
> > +
> > +force sequential execution by adding dependencies between the steps
> > +or combining them into a single shell command
> > +
> > +Here, && ensures that the ln -s command only runs after rm -f target
> > +successfully completes.
> > +
> > +Similar error reported here [1]
> > +
> > +[1] https://bugs.gentoo.org/932835
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + unix-common.mk | 6 ++----
> > + 1 file changed, 2 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/unix-common.mk b/unix-common.mk
> > +index 6954faf5..983c48cd 100644
> > +--- a/unix-common.mk
> > ++++ b/unix-common.mk
> > +@@ -62,14 +62,12 @@ SHLIB_CMD =3D $(CCLD) $(LADD) $(LDFLAGS_SHLIB) -o =
$@ $^
> > + SHLIB_LE_TARGETS =3D $(call shliblefn, $(SHARED_LIBS_TO_BUILD))
> > +
> > + $(SHLIB_LE_TARGETS):%:%.$(MAJ)
> > +-      rm -f $@
> > +-      $(LN_S) $< $@
> > ++      rm -f $@ && $(LN_S) $< $@
> > +
> > + SONAME_TARGETS =3D $(SHLIB_LE_TARGETS:%=3D%.$(MAJ))
> > +
> > + $(SONAME_TARGETS):%:%.$(MIN)
> > +-      rm -f $@
> > +-      $(LN_S) $< $@
> > ++      rm -f $@ && $(LN_S) $< $@
> > +
> > + .PHONY: $(SHLIB_INSTALL_TARGETS)
> > + .PHONY: install-shared-libraries
> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb b/me=
ta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > index a34256c275..f5ee920cad 100644
> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Daefbf81b=
a0750f02176b6f86752ea951"
> >
> >  SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> >             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc=
.patch \
> > +           file://0001-unix-common.mk-Ensuring-Sequential-Execution-of=
-rm-a.patch \
> >             "
> >  # one more commit after Release 1.60.03 in the Stable series
> >  SRCREV =3D "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113253): https://lists.openembedded.org/g/openembedde=
d-devel/message/113253
> Mute This Topic: https://lists.openembedded.org/mt/109059191/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

