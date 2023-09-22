Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B41ECD4F45
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 09:47:59 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.17622.1695376074963166826
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 02:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=SEycuZMI;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.215.176, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-578b4997decso1396882a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1695376074; x=1695980874; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvlrG5s5/11SrXPTeOgvFI1416wGnr+bCLg6d3wUJpY=;
        b=SEycuZMIt7/z1OCucpMs/9T5pa54xySYsJHSaNId53JoSp0C21NV8JDq0RSaOhcPyZ
         mhAfyNwLYfAMweo2dRuKdmk9Byht9ckB+SuER7g+8n8UYqhpZjH8JtZt05fKaeZw1/PT
         z0vxuuUzNo4KDr8+8FmX52KXS2OaQS8sZFwOnrK7lFX/tMqZoH6D/W11yyA5YH1h9v63
         UFZSWDujTQsEcRMV39n6ogpUdnC7F+foCP4a+PUXnKRAPw8JftKgW9A02BbURhai1ucQ
         1p6a/zIpKw5+eQNh3EZFUWQvPtKoqbfh1uT/cxUwqZ9AETe1KLEWNbv+amGFYw8kP9I0
         rRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695376074; x=1695980874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvlrG5s5/11SrXPTeOgvFI1416wGnr+bCLg6d3wUJpY=;
        b=f8M45GAWAkeDPoUEhnyAcFSb1k/0ST98kptMimTYcW91IY/zzy9+YHLo1EfvlpDtYD
         f+391glrBJGnDX9yFNIbf1+aJNGokz4/gIl9cylGTK5e9bigT3DlYFiivTo4zEyhJckN
         cMXMwvYKV+Pbu+E30JFqSQLLTdXyXXsDIIbra9WJ5M3zHLLOZfsbINgZqCFMa+Y+CBfj
         bDLDDelIN/o+herHAXARmdtqrKZECPHIsB9vDHxJxvDDHYVHrXzszJ2yBaGHn6CtS4fT
         jyVzU7s2hIcavUiqlX23/tirZ4zjptxM4igmTOlsZYP8knVyZCjBsUcgmq4cxdRjo9EE
         Yv4Q==
X-Gm-Message-State: AOJu0YzpnyXcj0zMReT86nv4Em451pvPzu3CguEC7FZ0eoenqLEe03IR
	CkD1Q7JUmDtgj+iM0p++HTg9LO7mbVzPUZOhMFBeRHXmG1CSA5ZZYtRVmwif1+4LbXrXiLkHJcz
	yB14l/5sjxQP+dmOF+apFkZTcd57kq4RRKw0qcuDMUicJRM4ZEUM=
X-Google-Smtp-Source: AGHT+IFaulLWgkHFtd5ZIudzrYhXVDxcAEh/YnNc7YGgPrCv9JuHNN+GWMpXNnwSTEG/OXRStpAEKNfFzJrcCtYbd5M=
X-Received: by 2002:a17:90a:598f:b0:268:5620:cfc7 with SMTP id
 l15-20020a17090a598f00b002685620cfc7mr7214705pji.30.1695376074256; Fri, 22
 Sep 2023 02:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230921091109.6998-1-jonas.gorski@bisdn.de> <CAMKF1so8xbfMejCfV_2O8LjX6PyGqHZ_1Ooso6=6PeChsPV9mw@mail.gmail.com>
 <CAJpXRYSt8ZFpMFZ0Luo14nr7cZjH6hvXu9ry_t-sGA4YAEiFpA@mail.gmail.com>
In-Reply-To: <CAJpXRYSt8ZFpMFZ0Luo14nr7cZjH6hvXu9ry_t-sGA4YAEiFpA@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Fri, 22 Sep 2023 11:47:42 +0200
Message-ID: <CAJpXRYT6RYuDGQbRYDM86MhcrmaQWRC-Krx+JncLEeMPgE3PAA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] frr: upgrade 8.4.4 -> 9.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 09:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105048

Am Fr., 22. Sept. 2023 um 10:25 Uhr schrieb Jonas Gorski
<jonas.gorski@bisdn.de>:
>
> Hi,
>
> Am Do., 21. Sept. 2023 um 23:34 Uhr schrieb Khem Raj <raj.khem@gmail.com>=
:
> >
> > seeing a build error on AB
> >
> >  | vtysh/vtysh_cmd.c:9:8: error: 'VTYSH_LIB' undeclared here (not in a
> > function); did you mean 'VTYSH_RIPD'?
> >   |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd_v=
tysh,
> >   |       |        ^~~~~~~~~
> >   | ./lib/command.h:250:27: note: in definition of macro 'DEFUN_CMD_ELE=
MENT'
> >   |   250 |                 .daemon =3D dnum,
> >                     \
> >   |       |                           ^~~~
> >   | ./lib/command.h:320:9: note: in expansion of macro 'DEFSH_ATTR'
> >   |   320 |         DEFSH_ATTR(daemon, cmdname, cmdstr, helpstr, 0)
> >   |       |         ^~~~~~~~~~
> >   | vtysh/vtysh_cmd.c:9:1: note: in expansion of macro 'DEFSH'
> >   |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd_v=
tysh,
> >   |       | ^~~~~
> >   | make[1]: *** [Makefile:10563: vtysh/vtysh_cmd.o] Error 1
> >   | make[1]: Leaving directory
> > '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-pok=
y-linux/frr/9.0.1/git'
> >
> >
> > See
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3155/=
steps/15/logs/stdio
>
> Weird, didn't happen for me, though admittedly, I used kirkstone for
> the (unmodified) recipe, since our distro is based on this.
>
> That line looks like this in my build:
>
> DEFSH (VTYSH_EIGRPD|VTYSH_OSPF6D|VTYSH_RIPD,
> accept_lifetime_day_month_day_month_cmd_vtysh,
>
> So it looks like something went wrong in generating that file.
>
> I'll (temporarily) switch our layers to master and try to replicate it th=
ere.

Could reproduce.

Comparing e.g. the frr.xref generated on kirkstone and master shows this:

@@ -3,7 +3,7 @@
     "accept_lifetime_day_month_day_month_cmd": {
       "lib/libfrr.la": {
         "defun": {
-          "file": "lib/keychain.c",
+          "file": "/usr/src/debug/frr/9.0.1-r0/lib/keychain.c",
           "func": "accept_lifetime_day_month_day_month",
           "line": 620
         },

so I guess somewhere there is now an absolute path instead of a
relative path, and it doesn't find the files anymore, breaking stuff.

Now to find out where that value comes from ...

Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=C2=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=C3=B6psel


Commercial register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=C2=A0DE283257294


