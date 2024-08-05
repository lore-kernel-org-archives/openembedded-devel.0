Return-Path: <mr.scada@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE0DC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 18:57:42 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.309.1722884258554926961
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 11:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EFMV6Ozh;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: mr.scada@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-70942ebcc29so6923120a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 11:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722884257; x=1723489057; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvvVe5nJ1id9Mtraoivczy1XFW3icLBz1anVqd9sIFo=;
        b=EFMV6Ozh41bidLAMdD6Y4/iuTFqEMohGmAjSmThXPyn7xXXNcX/ZYz0O1fFRWjSWdJ
         QAHN6N2+doOUWkCXejekkYmYKM5CDNodEVgA400DkV+2Q9ni1bLnesXgu/y3MgG0ehyo
         WFYre6Dos9DkExnERpScHeMtACJuronrk+XFENPDXQwpzETSEFJqIuZBAtDEslTxsx88
         9yNoiaGRsHWRJBOX0iGSHKGyAw3gZKTWLB5nqI0DhpsUyxonzt0clD4ORscbfWIBmUCG
         Pecws9VwBBmJuUIYWr7y9VHww91zZmN9OI6QmJLSty55Q4bk7zPbneLIDn8hxsdS+fsr
         UyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722884257; x=1723489057;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvvVe5nJ1id9Mtraoivczy1XFW3icLBz1anVqd9sIFo=;
        b=bdBCllAsPugL2IvsAsB1zyNM8SVW47W0W3VAIzv6DbwL+6+FJDfWuWu92kl320UQAh
         /BOdegO026gT5B9OVC2ep6hCM9VZV6T3/PrdvsUoVJuYHbN7PAUSsjDFri8rkAcU2M/A
         SwLADiEz0HcOdoxM/LT9ZFjCBtMsOuHqIYwfax25fS7D2v1XJX+n/8VvUUF2oQ4meAJv
         lWi+8EbpDXAKdE3Qc+aOCziwL62jGheIAQb2pjemyerZUvxsU0LNWS0Kv7Eb5wYnO5qJ
         DuzPlR7cNsWthwxTseZk/qKty9UGh7nxA5ZXME+pc4Cx49Nwvl7vu8TYe6ysMeDoanDr
         Jq0g==
X-Gm-Message-State: AOJu0YyfSH2Pi6hb81qe/JPEv74tftL50ZZaxf8BHvn/brgQ8QwovXk5
	bPZT/6/5oi2LgIGMgkrNrpMgfrFGB7O1vFLi2c5+Uof9VbMvEqENgb62FhHxDnMTipSAA49hJvr
	eHrIep3sj2SeOFKrGSlCVZC4O8e97U8G/
X-Google-Smtp-Source: AGHT+IHWfxSl20AvQuojQGZpGlSqnt3k7Tr85kPUl0IJ1pUyWX+3amQQh+D0Wzx8sZ3UlSlKPrE/X4/ZBOCn/gNaQpA=
X-Received: by 2002:a05:6830:6e05:b0:703:63d3:9ef7 with SMTP id
 46e09a7af769-709b322e163mr23222511a34.14.1722884257518; Mon, 05 Aug 2024
 11:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240730203342.5123-1-mr.scada@gmail.com> <3A5FE38C-91A9-44E0-9D27-3F6D229B26C0@arm.com>
In-Reply-To: <3A5FE38C-91A9-44E0-9D27-3F6D229B26C0@arm.com>
From: Barry G <mr.scada@gmail.com>
Date: Mon, 5 Aug 2024 11:57:26 -0700
Message-ID: <CAFrvcAqg+aJD-r1T6Rpw9KAE6Axx+A-QiOn6mr2uX4ixufbKSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] postgresql: Break perl RDEPENDS
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 18:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111515

On Mon, Aug 5, 2024 at 8:20=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:

> > On 30 Jul 2024, at 21:33, Barry Grussling via lists.openembedded.org <m=
r.scada=3Dgmail.com@lists.openembedded.org> wrote:
> > -DEPENDS =3D "libnsl2 readline tzcode-native"
> > +DEPENDS =3D "libnsl2 readline tzcode-native perl=E2=80=9D
>
> This is a mandatory dependency on target perl, even if perl isn=E2=80=99t=
 enabled.  Is this actually needed, as there=E2=80=99s a dependency on targ=
et perl in the perl PACKAGECONFIG already.

Currently, perl appears to be a build dependency for Postgresql. With
the PACKAGECONFIG disabling perl, and without the perl DEPENDS, I get:

Can't locate Config_heavy-target.pl in @INC (@INC entries checked:
/srv/tmp/work/[snip]) at
/srv/tmp/work/cortexa72-cortexa53-poky-linux/postgresql/16.3/recipe-sysroot=
-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.2/x86_64-linux/Conf=
ig.pm
line 88.

WARNING: Backtrace (BB generated script):
    #1: autotools_do_configure,
/srv/tmp/work/cortexa72-cortexa53-poky-linux/postgresql/16.3/temp/run.do_co=
nfigure.2395430,
line 246
    #2: do_configure,
/srv/tmp/work/cortexa72-cortexa53-poky-linux/postgresql/16.3/temp/run.do_co=
nfigure.2395430,
line 165
    #3: main, /srv/tmp/work/cortexa72-cortexa53-poky-linux/postgresql/16.3/=
temp/run.do_configure.2395430,
line 356

The postgresql install-requirements
(https://www.postgresql.org/docs/current/install-requirements.html)
says
Perl 5.14 or later is needed under various circumstances. I'm guessing auto=
tools
is trying to run perl for something.

I agree that removing the perl DEPENDS is an additional goal.

Barry

