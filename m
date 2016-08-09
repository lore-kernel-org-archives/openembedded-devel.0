Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEE8771DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 22:24:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1470781478; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=l0vAzxFOEl0Yjus05NO+7jx5Jgn+1Wtq4NLj0wmOrrU=;
	b=SIk8rAMPBQrppuyDtYVodbTwrE5DoV1ggI99IvYBDDeEXyawXvHfAL7xAPkixkZzxpThqAF0
	Wyb4005lIEGOkXzYYyPPSMTDdA9EW4unH2CEH7WHGIHVh7+EQAQjkTvyiDX/HGvURFNIBEfe
	qX2tC3zFU5f7zF9rhiszNQkXWU8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=EYf5XR/nSWKe3W0NnHx4VwaRwiVB9iXy7pScsSrCWOvIp9/k5qC1ameswi0xcV19XyThXA
	p5PqLqcze8p0TuSyxg1igSXtVgaOvE1SpK19aUwHV022ejdYaAt2ilhrMudRSoPdgXj68OSt
	mL0795JMYYHf51dU0BJoA480zX4nc=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mxa.mailgun.org with ESMTP id 57aa5826.7ff85471a370-in8;
	Tue, 09 Aug 2016 22:24:38 -0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id u186so24572386ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 15:24:38 -0700 (PDT)
X-Gm-Message-State: AEkoousAN1Rourpss3Cg4GxnAtycu9ze1uV5NOSRWwxt4WSHyJIjKRjyxlahFua/mtGxHaWpFyuYsGirFCpC+g==
X-Received: by 10.36.155.213 with SMTP id o204mr1637666itd.96.1470781478501;
	Tue, 09 Aug 2016 15:24:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Tue, 9 Aug 2016 15:24:38 -0700 (PDT)
In-Reply-To: <CALbNGRTzhUkgK71C5E1Fw6t20R4G45vz69sc7g0pRCAuAq=bhA@mail.gmail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
	<1469931304-13906-3-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQeTP0PgC1bSucTyQkt0=tAC0KcEmYA1mRL0Uu+xmu4zRA@mail.gmail.com>
	<CALbNGRSU0OHifH7801P_k0ig+QokGA_9=Ck=UZ2JGeSAWrdKag@mail.gmail.com>
	<CADNbA1qOkceqffLgwE+xZEWafxg+wr8VsLuZGFr9fgr3EPFrQA@mail.gmail.com>
	<CALbNGRTzhUkgK71C5E1Fw6t20R4G45vz69sc7g0pRCAuAq=bhA@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 9 Aug 2016 18:24:38 -0400
X-Gmail-Original-Message-ID: <CADNbA1oGRrg28mr4exDVA08YTe4A1ODZigijTJp6MATh2QwW1g@mail.gmail.com>
Message-ID: <CADNbA1oGRrg28mr4exDVA08YTe4A1ODZigijTJp6MATh2QwW1g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/5] libmbim: update to 1.14.0
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
X-List-Received-Date: Tue, 09 Aug 2016 22:24:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Will do.

On Tue, Aug 9, 2016 at 6:23 PM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com
> wrote:

> On Tue, Aug 9, 2016 at 11:47 PM, Derek Straka <derek@asterius.io> wrote:
> > All it takes to fix it is add an inherit for bash-completion.  I can
> submit
> > a patch to fix it if you'd like.
> >
> Would appreciate if you could test / send patch - thanks
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

