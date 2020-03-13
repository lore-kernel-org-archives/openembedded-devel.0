Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id DCC3C60F93
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:05:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h8so9686693iob.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=80p5SOgBwUDnsJ3OjAYYKwshPt+RtJFUk96b3j6xW3A=;
	b=Ah2SSXMumRvx3ncPHGewwD57oF6TeNB7Nr5jp+LFL2JVHlcwBYYHcyz/01jC6ElMC8
	Jq9S6gmJtWf/58F4jx41H3NZAqRq1ElQzpwfYbiKr7lzVdtPYuDAphOPKmiVULt45VfE
	PUk9EKjgNaV7d4U5KoW6W035Wwp+O1g5xM43sr+BJQhcPU00ymOyygZs2CpLLm4ZfncZ
	o6YZ7biAdvuDMK9al5vAo3Rj1RSJcHzPzYMmwE4L5jrYnWdhjmWdxRtjUvLgqPNklaqn
	lD+++dNJnlP1ghTmktXmAi1uJl8fhxCLzL61Kzwt4VArTn45Cp2GIE9ysZf92kOn+rYK
	/IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=80p5SOgBwUDnsJ3OjAYYKwshPt+RtJFUk96b3j6xW3A=;
	b=hXKXutIz6Gqrc4ZaytiAJfiz0PsTpk7RqufThlGCkz3CVpkqRmxzwMPV0SX0nVLszi
	OwfhAFmyijPWKKvWtvO2B09zbdTpmIG/E4J+XLLZh58N165vigoYlj5RPU7yTuajfJoU
	V60MOhDxMct0OZM33sMOdOqnLfTkkZv4xz8Uw8Xuej8DQQlUnjIOMhNiY00Vgxm18Dee
	NTsTGGNtpetXyYOicN0/2CuZgqtpRqq899dEmBzHThptk6B9vlDt2CKEPRSn3oVeIjOS
	EA0lIZxUKYsovgcCisl43Yr9a/ZknGLUX3nSqDhccGcRElmyT+a3QAxWv2sqPc2rjjff
	eC/A==
X-Gm-Message-State: ANhLgQ22FcDbyGag62dtBOdYOp04O2QzqWsqDeWIDTO0PgXYcDDb6XCt
	hObbh6IbzqtQWGUeCk7TzQK/JHTM7+t+mUZdawRGRg==
X-Google-Smtp-Source: ADFU+vvkRfm9pakjdCNjmnCilCoZWVCQC38eZsVfZ/EuHX/z9Pi7aOE+ewc1u5TvTMRirmEZYvPVMZxQnoxN71cIXCU=
X-Received: by 2002:a02:cbc3:: with SMTP id u3mr12887604jaq.114.1584111948686; 
	Fri, 13 Mar 2020 08:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
	<dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
	<CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
	<CAMRc=MehBSu1RpPkzP=xiFqt3wpJrf4FhV889jcPxUHPnf0GLg@mail.gmail.com>
	<CAP71Wjz1n_Csm762xbsxUK-3i3OYm-rfh=9Ccf28USLgJjRiFQ@mail.gmail.com>
	<CAMRc=Md1Udxq0eOUzNH=Pr3corUEa88_wdTJJFyurjMvJcfaAQ@mail.gmail.com>
	<CAMKF1spHPHW7xk5icpG5qVhYTSjuawWidw24o=tVWEve8_MDkg@mail.gmail.com>
In-Reply-To: <CAMKF1spHPHW7xk5icpG5qVhYTSjuawWidw24o=tVWEve8_MDkg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 13 Mar 2020 16:05:38 +0100
Message-ID: <CAMRc=McjtuhBVSzFyXvQCNq9Y2mUSH6-_WrF06b0xJuRyd8YXQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Fri, 13 Mar 2020 15:05:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 12 mar 2020 o 19:13 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
> > >
> > > it depends what you mean here.
> > >
> > > 1. Hosting on git.yoctoproject.org is mostly for layers supported by =
YP membership, these layers are under the responsibility of the YP TSC [1]
> > > 2. Hosting on git.openembedded.org is under the responsibility of the=
 OE TSC [2]
> > >
> >
> > I'm not sure what that means exactly in terms of making a layer
> > official. I can only guess that non-members can't make their layers
> > part of the project for political reasons.
>
> I would suggest to send the proposal to oe-tsc mailing list
> tsc@lists.openembedded.org
>

Thanks. I'll do this as soon as I have more things to show in this layer.

Bartosz

