Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BA2D132AD
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 11:03:02 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.55099.1730718174766321128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 03:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeWeo+BQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso35568961fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730718173; x=1731322973; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXwwtWp0R+e0f0njxIVv67PcGDUdefQmjOXwk4fgqwk=;
        b=NeWeo+BQ5FRxaYGuSAn46Sd7xBIBXJ19qXgxUp1b8nak6dMGNlUibovkGqn+i5UBU8
         uEa75XMG2FcUGX2+n1ifoZUbP5ZhPiLBwH1Q0S0fp9F6qpFV6CIQ9Ix8jI3YfZs0UO8n
         Sz2Ao5kZTF+ybOUTo+B9RbELFVuJSdJQDgP6zG/LcaKPE1VXdMT3k+gosrbwNgQ6E5UP
         zQk+HTmRB/M2XkdNDYVRNeFPQv9aWEh2rO6E3gZnINr7wedt7Yj85F9ymorVM+XJ+qAj
         apaSG36EtA2BkDRX7FFjbxeHLD9cVm3w/+V+/K+yb+u/Rj1SSC3fdZ2bG5+nvm5gaJ3b
         Msnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718173; x=1731322973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXwwtWp0R+e0f0njxIVv67PcGDUdefQmjOXwk4fgqwk=;
        b=bcoz9/KahHDk1uu5Eqw1ofJb06hzCEGuN0GPbmGb45A8ROw3PihSnCyDBk1YvgTcRf
         IM61Oxze3d8y4MqlXfUjOqTa5LX0RxIBdOxFXKwlKVf2EpDzFheCeA+zkJa1FLZiJIHy
         e0wiF5+oNTUgyJNly4pcA59xad8Sa1OO6wCeUe+vlQdgWXGpqDFSJnR3C2h3e1m/v92O
         knqFl1wJk1mDIKhZPtBzqAXheFiHKzcMNvcSTnEe61uXnyEJK1YLlHtpMW+z8mb7cO7x
         T6VOBDfFUt63GJ+0oMw+btBolJr25QdlhWemT3FtDEcaD6ARJFguMxUBL1bIku6G30CG
         WlXA==
X-Forwarded-Encrypted: i=1; AJvYcCVL+D1lKnxtRuWhjKq/Wic9S51WWTI7pMF+Yz35S9vg5LuRAYBj3Ws8eG3/9POmJIMGiCNqovyipJD3z/p4vn7jzEs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPAQeydLYmSCBw9QSRNPLLrb35Ql1f1Y7BhTY9/FiwtnkHkaub
	rkyqFeUorHMH7wqeVRFtuNwD4znK/5MoZio7DVnDMMtJ+Wds6QpJkFSkXIe9dmtbM9IRVpNYqmo
	yeu/ZHikox53csBTCxG/PLROerNU=
X-Google-Smtp-Source: AGHT+IEWGCWOOZwYNX93XPgRnJvAoX66ZQl7hJt5vj/uwYi2R6tCYt8684pTUoWWCzkOAokfJFDR2wk2gPHPOcLRRZs=
X-Received: by 2002:a05:651c:505:b0:2f5:abe:b6bd with SMTP id
 38308e7fff4ca-2fcbe099636mr141355221fa.42.1730718172515; Mon, 04 Nov 2024
 03:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20241017061710.1108077-1-raj.khem@gmail.com> <18026D239C42081A.19860@lists.openembedded.org>
 <18046FA91741B6C6.30502@lists.openembedded.org>
In-Reply-To: <18046FA91741B6C6.30502@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 4 Nov 2024 12:02:39 +0100
Message-ID: <CA+chaQf8PVtew-TCxXxs4oTEYiy11mCUkM0MDyFq5bhdE0e0Pw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: Fix race condition triggered
 during symlink creation
To: martin.jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 11:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113404

For libutil++ it calls "all" and "libxmlrpc_util++.so" only, but for
libutil it calls "all" and then 13 times libxmlrpc_util.so
(after-clean-j1.log is the make output with -n and -j1 instead of
-j70), still trying to figure out why, my autofoo is rusty :).

martin@jama /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/g=
it/stable
$ grep -A 1 lib/libutil++/Makefile after-clean-j1.log
make -C libutil++/ -f
/OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/li=
b/libutil++/Makefile
\
    all
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil++/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil++/Makefile
\
    libxmlrpc_util++.so
martin@jama /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/g=
it/stable
$ grep -A 1 lib/libutil/Makefile after-clean-j1.log
make -C libutil/ -f
/OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/li=
b/libutil/Makefile
\
    all
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so
--
make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/s=
table/lib/libutil/
-f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable=
/lib/libutil/Makefile
\
    libxmlrpc_util.so

On Sun, Nov 3, 2024 at 11:48=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Looks like I spoke too soon, got the same build failure 3 more times
> in last 2 days.
>
> rm -f libxmlrpc_util.so.4 && ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.=
so.4
> rm -f xmlrpc_util++.pc
> rm -f libxmlrpc_util.so && ln -s libxmlrpc_util.so.4 libxmlrpc_util.so
> Echoes to 'xmlrpc_util++.pc' suppressed here ...
> make[3]: Entering directory 'xmlrpc-c/1.60.03/git/stable/lib/libutil'
> rm -f libxmlrpc_util.so && ln -s libxmlrpc_util.so.4 libxmlrpc_util.so
> make[3]: Leaving directory 'xmlrpc-c/1.60.03/git/stable/lib/libutil'
> ln: failed to create symbolic link 'libxmlrpc_util.so': File exists
> make[3]: *** [xmlrpc-c/1.60.03/git/stable/unix-common.mk:65:
> libxmlrpc_util.so] Error 1
>
> Looks like it calls:
>
> make -C xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f
> xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
>     libxmlrpc_util.so
>
> twice and the added && isn't enough to avoid the race between the 2.
>
> On Sun, Oct 27, 2024 at 10:40=E2=80=AFPM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > Thanks Khem!
> >
> > On Thu, Oct 17, 2024 at 8:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > This should fix race condition sometime seen in highly parallell buil=
ds
> > >
> > >    | rm -f libxmlrpc_util.so.4
> > >    | rm -f libxmlrpc_util.so.4
> > >    | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
> > >    | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
> > >    | rm -f libxmlrpc_util.so
> > >    | ln: failed to create symbolic link 'libxmlrpc_util.so.4': File e=
xists
> > >    | make[2]: *** [/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux=
/xmlrpc-c/1.60.03/git/stable/unix-common.mk:72: libxmlrpc_util.so.4] Error =
1
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  ...nsuring-Sequential-Execution-of-rm-a.patch | 46 +++++++++++++++++=
++
> > >  .../xmlrpc-c/xmlrpc-c_1.60.03.bb              |  1 +
> > >  2 files changed, 47 insertions(+)
> > >  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-u=
nix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
> > >
> > > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-com=
mon.mk-Ensuring-Sequential-Execution-of-rm-a.patch b/meta-oe/recipes-devtoo=
ls/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-r=
m-a.patch
> > > new file mode 100644
> > > index 0000000000..02b5244f3a
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-=
Ensuring-Sequential-Execution-of-rm-a.patch
> > > @@ -0,0 +1,46 @@
> > > +From c9bd05e8f0ad805b81625cfa717d06071cfd9b48 Mon Sep 17 00:00:00 20=
01
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Wed, 16 Oct 2024 22:52:38 -0700
> > > +Subject: [PATCH] unix-common.mk: Ensuring Sequential Execution of rm=
 and ln commands
> > > +
> > > +With high parallel execution, it results in race condition where
> > > +its trying to create symlink while the original symlink while rm is
> > > +not done deleting the existing file yet.
> > > +
> > > +force sequential execution by adding dependencies between the steps
> > > +or combining them into a single shell command
> > > +
> > > +Here, && ensures that the ln -s command only runs after rm -f target
> > > +successfully completes.
> > > +
> > > +Similar error reported here [1]
> > > +
> > > +[1] https://bugs.gentoo.org/932835
> > > +
> > > +Upstream-Status: Pending
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + unix-common.mk | 6 ++----
> > > + 1 file changed, 2 insertions(+), 4 deletions(-)
> > > +
> > > +diff --git a/unix-common.mk b/unix-common.mk
> > > +index 6954faf5..983c48cd 100644
> > > +--- a/unix-common.mk
> > > ++++ b/unix-common.mk
> > > +@@ -62,14 +62,12 @@ SHLIB_CMD =3D $(CCLD) $(LADD) $(LDFLAGS_SHLIB) -=
o $@ $^
> > > + SHLIB_LE_TARGETS =3D $(call shliblefn, $(SHARED_LIBS_TO_BUILD))
> > > +
> > > + $(SHLIB_LE_TARGETS):%:%.$(MAJ)
> > > +-      rm -f $@
> > > +-      $(LN_S) $< $@
> > > ++      rm -f $@ && $(LN_S) $< $@
> > > +
> > > + SONAME_TARGETS =3D $(SHLIB_LE_TARGETS:%=3D%.$(MAJ))
> > > +
> > > + $(SONAME_TARGETS):%:%.$(MIN)
> > > +-      rm -f $@
> > > +-      $(LN_S) $< $@
> > > ++      rm -f $@ && $(LN_S) $< $@
> > > +
> > > + .PHONY: $(SHLIB_INSTALL_TARGETS)
> > > + .PHONY: install-shared-libraries
> > > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb b/=
meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > > index a34256c275..f5ee920cad 100644
> > > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > > @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Daefbf8=
1ba0750f02176b6f86752ea951"
> > >
> > >  SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=3Dmaster;pr=
otocol=3Dhttps \
> > >             file://0001-test-cpp-server_abyss-Fix-build-with-clang-li=
bc.patch \
> > > +           file://0001-unix-common.mk-Ensuring-Sequential-Execution-=
of-rm-a.patch \
> > >             "
> > >  # one more commit after Release 1.60.03 in the Stable series
> > >  SRCREV =3D "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113395): https://lists.openembedded.org/g/openembedde=
d-devel/message/113395
> Mute This Topic: https://lists.openembedded.org/mt/109059191/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

