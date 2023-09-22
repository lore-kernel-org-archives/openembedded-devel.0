Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877BDE7109D
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:21:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.20223.1695385262279149170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=oeS9ybEO;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.216.48, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-27666e94ad7so1692916a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1695385261; x=1695990061; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0lxAh51IoqH82X+wlRdERisKNX+bmZievxcqzxg3Sw=;
        b=oeS9ybEONRt3tfMX3JqwXd+m3gEOuPcnl3yx8Kya/Jb+0QU+D/oKYY2htuVt804l9k
         0N0B4o1qJQylELIXWiAs9qpEmyx7k7DvMTAUb6H1WAPvfummijTxtBmkp55uxwe+p/CL
         c4kh6OxLN9flF/6J7CGkW3maukcsIjiouCUwkNSr8UR2jS63DWSGj0/MJKrjQYeJE/z4
         Yyg5KHPT42dJGtTLda3gb8qHEUVMlFDE1in3UFeLHFWTit2sDqdaTNU2/E2FIWy76R/e
         sthI2h8PpjTN0V3ige5LAvrsPOvqoHIiNuIeEkHCivSTjU9rAFquKzk1rgk9+aUjUvqG
         Pe9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695385261; x=1695990061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0lxAh51IoqH82X+wlRdERisKNX+bmZievxcqzxg3Sw=;
        b=lauyT/3KZFUTmsaeVxhtGu24s2zrRIMqpxk5OlHM5BmKU9xk6zEEDUxQuYie2J7GaR
         D/GFEAeGO7Jhfs6eGhjYABsu153XkCaYws5nHwUpn7LN3S4dLyF/9PCtHiFx/PZheTWR
         XbDqvgIW0VSIajavMV68xA8SiY8sJOwPcEFX7V186YYghsM9+eQpaZa92RW5TFuh39k1
         uxZprtZgqNpgJlkat/4UqyMHy0LKjo6cyPl+HOAcEDCdpQipjhrJlWYU+kUj2fNtVtHa
         U0Sb55Ako+94d+kWqtkFwjVozl6NNXwDPQesdtW4c85GU1KG+/7IUelzKQeDISuk4iTH
         0MHg==
X-Gm-Message-State: AOJu0YwzcteizDJ37nqEGZfXobvOb3I67Rh+LazPPSGvbYP1Mzb9Cvsy
	165MVyI+sup0UNCLrlqGplGA/6mcJ6C8S+OeNSmvvZ+EQF+xwPgtGLJly9ZRWkAFcyMCUVRSFZn
	ui8GcIEpLqLrIgGw775XCP47DmWPtCW7BejjsE9VYYPjU1rJdEk0=
X-Google-Smtp-Source: AGHT+IF7IxglczSPSL9oISvmCLyoYVDtGDZPH7bPrecWEsTsS1FtnF+Nn3jGYtzYY3MmkEbshtsH0mAjfJr745tAAk8=
X-Received: by 2002:a17:90b:1b06:b0:26b:374f:97c2 with SMTP id
 nu6-20020a17090b1b0600b0026b374f97c2mr3793863pjb.6.1695385261209; Fri, 22 Sep
 2023 05:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230921091109.6998-1-jonas.gorski@bisdn.de> <CAMKF1so8xbfMejCfV_2O8LjX6PyGqHZ_1Ooso6=6PeChsPV9mw@mail.gmail.com>
 <CAJpXRYSt8ZFpMFZ0Luo14nr7cZjH6hvXu9ry_t-sGA4YAEiFpA@mail.gmail.com> <CAJpXRYT6RYuDGQbRYDM86MhcrmaQWRC-Krx+JncLEeMPgE3PAA@mail.gmail.com>
In-Reply-To: <CAJpXRYT6RYuDGQbRYDM86MhcrmaQWRC-Krx+JncLEeMPgE3PAA@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Fri, 22 Sep 2023 14:20:49 +0200
Message-ID: <CAJpXRYQanu1FbcW2vSNZ-Re--PXCetdo_rsazXnZ1xWRcEkEAA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] frr: upgrade 8.4.4 -> 9.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105063

Am Fr., 22. Sept. 2023 um 11:47 Uhr schrieb Jonas Gorski
<jonas.gorski@bisdn.de>:
>
> Am Fr., 22. Sept. 2023 um 10:25 Uhr schrieb Jonas Gorski
> <jonas.gorski@bisdn.de>:
> >
> > Hi,
> >
> > Am Do., 21. Sept. 2023 um 23:34 Uhr schrieb Khem Raj <raj.khem@gmail.co=
m>:
> > >
> > > seeing a build error on AB
> > >
> > >  | vtysh/vtysh_cmd.c:9:8: error: 'VTYSH_LIB' undeclared here (not in =
a
> > > function); did you mean 'VTYSH_RIPD'?
> > >   |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd=
_vtysh,
> > >   |       |        ^~~~~~~~~
> > >   | ./lib/command.h:250:27: note: in definition of macro 'DEFUN_CMD_E=
LEMENT'
> > >   |   250 |                 .daemon =3D dnum,
> > >                     \
> > >   |       |                           ^~~~
> > >   | ./lib/command.h:320:9: note: in expansion of macro 'DEFSH_ATTR'
> > >   |   320 |         DEFSH_ATTR(daemon, cmdname, cmdstr, helpstr, 0)
> > >   |       |         ^~~~~~~~~~
> > >   | vtysh/vtysh_cmd.c:9:1: note: in expansion of macro 'DEFSH'
> > >   |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd=
_vtysh,
> > >   |       | ^~~~~
> > >   | make[1]: *** [Makefile:10563: vtysh/vtysh_cmd.o] Error 1
> > >   | make[1]: Leaving directory
> > > '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-p=
oky-linux/frr/9.0.1/git'
> > >
> > >
> > > See
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/315=
5/steps/15/logs/stdio
> >
> > Weird, didn't happen for me, though admittedly, I used kirkstone for
> > the (unmodified) recipe, since our distro is based on this.
> >
> > That line looks like this in my build:
> >
> > DEFSH (VTYSH_EIGRPD|VTYSH_OSPF6D|VTYSH_RIPD,
> > accept_lifetime_day_month_day_month_cmd_vtysh,
> >
> > So it looks like something went wrong in generating that file.
> >
> > I'll (temporarily) switch our layers to master and try to replicate it =
there.
>
> Could reproduce.
>
> Comparing e.g. the frr.xref generated on kirkstone and master shows this:
>
> @@ -3,7 +3,7 @@
>      "accept_lifetime_day_month_day_month_cmd": {
>        "lib/libfrr.la": {
>          "defun": {
> -          "file": "lib/keychain.c",
> +          "file": "/usr/src/debug/frr/9.0.1-r0/lib/keychain.c",
>            "func": "accept_lifetime_day_month_day_month",
>            "line": 620
>          },
>
> so I guess somewhere there is now an absolute path instead of a
> relative path, and it doesn't find the files anymore, breaking stuff.
>
> Now to find out where that value comes from ...

So after an (automated) bisection I landed on [1] for FRR where stuff
started to break with master, while inversely going through the CFLAGs
passed, I landed on [2] which "broke" things. Reverting that commit
makes FRR 9.0 compile in master.

So I guess I'll add

DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"

for now and send a v3.

Best Regards,
Jonas

[1] https://github.com/FRRouting/frr/commit/89cb86aeb0262e17ee39c1d791effe9=
515bd0dc8
[2] https://git.openembedded.org/openembedded-core/commit/?id=3Dabe97fa74b1=
0c2c71d79bc3573d4edb509b111f5
b
>
> Jonas

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


