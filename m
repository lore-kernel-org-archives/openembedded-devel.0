Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3ED36079F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 22:33:30 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l12so3274327qtq.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E/MR3YeDUr6+E7ZqUTkTWZHtCOdX+3ay6/P8E+9DqA4=;
	b=X0ecHRHYcXcKDcc/ImWyJLxgRAzIzlVJ7CTkw4i6yOtE7QysYWdhLVanii7Dz78K1+
	B7V1XWCETijbDW/iIurzoWyYysJWCGfy8gZLvVkXl4Yb5ChK/43BCF1yBA0qd41t5to9
	eLQtZ5ZJ4q9I8G76z+VRBpudwv9RQtY3cEyDzQQUeyb4Bbd9iyH/9IMQhHY4XVPhi7Bs
	i5ZkKjt2G3X985kjsLmSvL9JOGj60t2HkoWxmO8P1SnihZQ8dDF8CGYOmeBbOZ9PZMW7
	gweunIrosz8QOrtMbPRAsJR5FyIwQKkYR/V+4/6oZTjxvCprUVLyMLXsyxxrq/NnN21S
	L/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E/MR3YeDUr6+E7ZqUTkTWZHtCOdX+3ay6/P8E+9DqA4=;
	b=OiV2GQu3ZQ5vu45RT8maajVQpnhdavJClAynNR9dQzyje6gZj4Ge2GVIHzAbeibIVq
	1oVSJSAkf8bX4lnWsLdlRDuHeeHg3oSqqTCq0E4tQb1Lf44SySvni2KiYpVViDLLw+CJ
	qAQJeAeH0zsCmPhuN2CsdO1Ze1cM0PXXsc4vRtm9hweG/lRopMBNIhWwIPcY7pGOEmiz
	VOPLbvtrqr138MpjWWCkZm3pGOVC0f1FCvbu35i8W0ZwpZVbhPf+4ueTEP36X4UXnb75
	BlrXj7+Tp4DrKJ1MGpGKyR27TxLBruT/QgGFimbzwDzEORVyn+V8UPBe8wLMz/9Hfhi6
	gMiA==
X-Gm-Message-State: APjAAAW4+8V6qTaTlIfEoqXqNtoKoL5K8NwA8Gfrjs7uA+vgypiVrMEt
	PUJjx27clPblMbOMu524X7B7QsugjgyZuL+9wVE=
X-Google-Smtp-Source: APXvYqylk0lCUXmucabYEW5p5W7m4gKXMsIrNbtINIiiOGFDpWnrx0i1IpoG8y9GgMie5AU+duKGIO4sDCZPDQGAUC8=
X-Received: by 2002:ac8:145:: with SMTP id f5mr4366169qtg.194.1576708410854;
	Wed, 18 Dec 2019 14:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20191218143106.128574-1-alex.kanavin@gmail.com>
	<20191218143106.128574-2-alex.kanavin@gmail.com>
	<CALbNGRTvSNapgjBavAE7S4N0ETWpthMG3XPv=g7_sekCE3vnmw@mail.gmail.com>
	<CANNYZj8ir8Btnhx_Fthd-5O9455aqSEHpRarPTfG+ZHHa+Lqng@mail.gmail.com>
In-Reply-To: <CANNYZj8ir8Btnhx_Fthd-5O9455aqSEHpRarPTfG+ZHHa+Lqng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Dec 2019 14:33:04 -0800
Message-ID: <CAMKF1spUERVV_MxunrwmD1=3-7bHickd4Fim3EuxOPrcO+KOWQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sysprof: update to 3.34.1
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
X-List-Received-Date: Wed, 18 Dec 2019 22:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this fails to build

https://errors.yoctoproject.org/Errors/Details/298857/

and I think moving to meta-gnome is good


On Wed, Dec 18, 2019 at 9:01 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 18 Dec 2019 at 16:01, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
> wrote:
>
> >
> > > +On uclibc elf.h does not have GNU extentions but we need this define
> > > +so we define it locally if its not getting it from elf.h
> > uclibc is long gone. Is this stlll necessary for musl?
> >
>
> Actually it altogether fails to build on musl. I think we should leave th=
e
> fixing up to the interested parties, or mark the recipe as incompatible.
>
>
> > >
> > Maybe I missed something but the only (optional) dependency left is
> > mutter. Shouldn't sysprof go into meta-gnome?
> >
>
> This decision I leave up to you :-)
>
>
> Alex
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

