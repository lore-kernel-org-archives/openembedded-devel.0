Return-Path: <brgl@bgdev.pl>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 46C156BA10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 16:26:38 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id c9so28640176itj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z0a5MQDBCYKssv7uGEDrm0PAi9tLE3Klei4YK0Axhsg=;
	b=xIPrq8k7Su9C8MvJzJXpY3HAIPtOuqq6dRwJgydfZubhZi/gGIrpu6b571J3BDJ/jC
	j2jonqnN0ZccXvstmrxW5zxLNmQSgeyfSSvpkVI1OtmXeQ16LSbt7d2GBPe5AelzFKGw
	BpEt1MKe747npo+40x+rFM84v78cJdfD9dDlsQzE+gmppHkrLOhCfkVSrc96I6MWSD6L
	370AnWZKP9YjPrdQF/fa90XJeLw1g2dtlap11md+vPqOMjgvwE1s59CWpsO2zE5lf1Tj
	MmaQaUhPRlgzP/r4h4hxVJiQL/eszZROJre+t6eSvRZbWu+d/ExcS+DuTTyPJHEc4X80
	Uqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z0a5MQDBCYKssv7uGEDrm0PAi9tLE3Klei4YK0Axhsg=;
	b=FQDBGZ3LIy0NKAfAFIsLM3udruOeZRaKIOJS/FNCEJF5BkZY846ieSbfeCR1OfHDpt
	OgV6m+ThfsEQLWFGE4R7bE3Z2fSCE4dpRv+h7WUoEXbL/32OGq9MXYBosos4KSob1Q5Z
	fuIb9Cj7ubwnWauuCaj9RedxXL6qDwbsAtpSMmNevR/dLGXpNrCx1IBBz4G1s0rlDKV1
	PyVY/vH7vbxxjYkbYX+fhulDZm71J1OA8z6J8LKDgtQFEoGTo1xmho7db7XJ/eZHon2X
	qb8Penhb24JRjh0HaemYxt5pA6vwitRfY5g/S5YpPvwdQE3o8+JlYRrV4bhN+NFlm4sa
	ebYw==
X-Gm-Message-State: AA+aEWYFkusVLwOYUlmgDVaZWowye3a7tttr0Pm2K0Z0SayyhoFeKeuk
	XDrlmhvf6KUmJ5Uqhl40pLWaWos6zrdqYf0TH6FUvQ==
X-Google-Smtp-Source: AFSGD/XFuccSSOI1Nmeyg1SAMTdCTZkCQvY0L4XcijPrD73RCYqinUAXR5iPcGoEJcoCxiuhd482eJqHgCm0q6YYlkg=
X-Received: by 2002:a24:7284:: with SMTP id x126mr7832073itc.96.1543249599270; 
	Mon, 26 Nov 2018 08:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
	<CALbNGRR8iKjx6PW52HjmPVi-DeyOG2L41==Tnj3AjZaFFrxR5g@mail.gmail.com>
	<CAMRc=MdVJYYBcB0NkQpE2O3qQ=c+mnj6+ktsxRMdjBpPALOgZw@mail.gmail.com>
	<CALbNGRRqeSVDzM8tn36t01YiAS0DJE_ExSXNRupp6esOEF7oKA@mail.gmail.com>
In-Reply-To: <CALbNGRRqeSVDzM8tn36t01YiAS0DJE_ExSXNRupp6esOEF7oKA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Nov 2018 17:26:27 +0100
Message-ID: <CAMRc=MeRzY9U89thd5CV4GZFdq2TzCFP609vOuvcnQkJhxeTnw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2018 16:26:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sob., 24 lis 2018 o 22:37 Andreas M=C3=BCller <schnitzeltony@gmail.com> nap=
isa=C5=82(a):
>
> On Sat, Nov 24, 2018 at 9:11 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > pt., 23 lis 2018 o 22:00 Andreas M=C3=BCller <schnitzeltony@gmail.com> =
napisa=C5=82(a):
> > >
> > > On Fri, Nov 23, 2018 at 4:39 PM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > > >
> > > > This series adds recipes for libsigrok and accompanying libraries a=
nd
> > > > tools. The eventual goal is to add pulseview - the graphical interf=
ace
> > > > for sigrok - to meta-qt5-extra.
> > > I had started this at meta-qt5-extra but... Did you prepare already
> > > something for sigrok? If yes: Would be happy to receive your patches =
-
> > > if no I can try the recipe already started together with the recipes
> > > you sent here.
> > >
> > > Andreas
> >
> > I'm not sure I understood you - do you mean if I prepared something
> > for pulseview for meta-qt5-extra or if I want to put libsigrok
> > packages in meta-qt5-extra? For the latter: I think that the right
> > place for those packages in meta-openembedded and only pulseview
> > should go into meta-qt5-extra. For the former: I'll be creating the
> > recipe for pulseview on Monday probably.
> >
> > Bart
> I meant first option. Like your suggestion you prepare and I wait - no
> need to get my unfinished work polished.
>
> Andreas

This[1] recipe is enough to build pulseview, but I'm not sure how to
go about requiring libsigrok to have cxx set in PACKAGECONFIG. Should
I add a bbappend for libsigrok that would do PACKAGECONFIG_append =3D "
cxx"?

Bart

[1] https://github.com/brgl/meta-qt5-extra/commit/06852587c29de7039098f9dfc=
e52b6b4ba13b766

