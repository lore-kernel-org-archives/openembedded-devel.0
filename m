Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id BB9CE60034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:51:50 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so5736879ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2oGaLur8Kv/0cHQBNjE2gyzrwwrmrJqLThijyhT6j8A=;
	b=Y/5sQ2DjilVp9WqMaUeI1R+oOiMke/T6IMi77gKm9uaHBFBToauahqWoQ0vK6+JTAh
	VJiC+uFGK5vWY26B3O70E2CE9bf1EtoBTZHtb20nCitjoPdgD2VTTzlvieH5xsZ3JTOX
	MlZ0w5s61pAX3yxYWfNJJtqM765Op/puJg5oUzqFeqkzxS32Ps8R94BehxvMKzt3QzwA
	faGb0P3rXkHoP+Iyy78CFL0a9NXGD1p6XAUR8RkmjCGq18NwS3+XPdpVJEEJuwytS6TU
	SObCvq4J7jdFJADrovK11tZSM1Rt+pQgBYICEKouI88gQEwO4zXarWaNA28upLJiUHh9
	AYKw==
MIME-Version: 1.0
X-Received: by 10.42.89.72 with SMTP id f8mr27839604icm.24.1427223111168; Tue,
	24 Mar 2015 11:51:51 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Tue, 24 Mar 2015 11:51:51 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Tue, 24 Mar 2015 11:51:51 -0700 (PDT)
In-Reply-To: <CAP9ODKqL1d447vjyEv6wQvJzS_uz1wFFmgOOjh+MKv83xsjTkg@mail.gmail.com>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
	<CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>
	<CAP9ODKoFdepGX7OZu8XxMQVr-ssUCG_Ndyyj6GROOACViiMhEw@mail.gmail.com>
	<8A51FBCF-FD07-4A7A-9829-14964E58A121@gmail.com>
	<CAP9ODKqL1d447vjyEv6wQvJzS_uz1wFFmgOOjh+MKv83xsjTkg@mail.gmail.com>
Date: Tue, 24 Mar 2015 11:51:51 -0700
Message-ID: <CAMKF1sqf=txyROy9rQ0qyPgD5iM+YV358X3-Z3kVmCrg1t+U+w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Mar 2015 18:51:51 -0000
Content-Type: text/plain; charset=UTF-8

On Mar 24, 2015 9:36 AM, "Otavio Salvador" <otavio@ossystems.com.br> wrote:
>
> On Tue, Mar 24, 2015 at 12:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Mar 24, 2015, at 4:56 AM, Otavio Salvador <otavio@ossystems.com.br>
wrote:
> >>
> >>
> >> I'd prefer to do it once and avoid adding another recipe and handle
> >> same problems we had solved there. Also this allows for example the
> >> use of i.MX patches on meta-fsl-arm.
> >
> > My usecase is not i.MX moreover I do not have i.MX h/w to test as well,
current set work fine for the architectures I need it for, if someone wants
to help in testing on other machines, its welcome. however as I said, it
will be in subsequent work to unite both recipes due to the overhead as
explained in last email.
>
> I am not asking you to test cef3 on i.MX, this is fine. I don't want
> another giant build recipe with duplication.

I am aware of that. This let's other folks hands on it with a working
version. Moving cef to latest chromium is a bigger exercise and will delay
this. That's the motivation.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

