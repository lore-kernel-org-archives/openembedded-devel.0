Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D321C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 20:06:20 +0000 (UTC)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
 by mx.groups.io with SMTP id smtpd.web10.4149.1707163573195542717
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 12:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=qUmatXhr;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.182, mailfrom: dev@g0hl1n.net)
Date: Mon, 5 Feb 2024 21:06:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707163571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SN/EgiWcWtakwR6uMPkKK+NkUqkMJL7mzr3YZoYdA4w=;
	b=qUmatXhrElNsV7b7dYzf9Pw//RXYi0GosDdo0CuxI2XxlHb61cvgoNUijipv0bHPKrIRBZ
	1WpUZa3Auk9b7XgFRjR9GzUHgNVQUAVDvP2XdLPhc7Av3HXRhtC6munHqovJslBnx+MmG+
	iuMobtH89gjsWlPxyp7w1jsOdVyARkk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH 0/5] Add python3-httpx support
Message-ID: <rt64rs5xzeqckjnw32bje2jcilxzxhn5ijxkwxklrg2tb35itz@5izrmc6blxcd>
References: <20240205125829.152301-1-dev@g0hl1n.net>
 <CANx9H-DF58NnD=2qWRsOCJENTy2H4700Ba1+TZMukrxB=woJFA@mail.gmail.com>
 <CAMKF1sqH8CHESnv+0XCMP-mui46OiVZ3ADbViEb7Mc6=twU5Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1sqH8CHESnv+0XCMP-mui46OiVZ3ADbViEb7Mc6=twU5Jg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 20:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108578

Hi Tim, Hi Khem,

thanks for your feedback!

On Mon, Feb 05, 2024 at 09:44:28AM -0800, Khem Raj wrote:
> On Mon, Feb 5, 2024 at 7:55=E2=80=AFAM Tim Orling <ticotimo@gmail.com> =
wrote:
> >
> >
> >
> > On Mon, Feb 5, 2024 at 4:58=E2=80=AFAM Richard Leitner via lists.open=
embedded.org <dev=3Dg0hl1n.net@lists.openembedded.org> wrote:
> >>
> >> This series adds support for python3-httpx and its dependencies.
> >>
> >
> > Can you look into adding ptest also for these new packages? It doesn'=
t necessarily block adding them, but we don't want to keep piling on tech=
nical debt of more recipes without ptest.
>=20
> I think this is a good idea. We run ptests for meta-python regularly
> as acceptance and do find issues these days. So adding ptest would
> be good here, perhaps for meta-python it could be made a needed thing
> for new recipes.

Sure. I will add them. Basically I totally agree on adding tests wherever
possible. So from my side making them a requirement (unless there is a
really good reason against) would be a good thing.

Should I send a v2 or a separate series for that?

As we are talking about "defaults" for python recipes. What is the
"policy" for native and nativesdk? Is there any? Or should they be just
added based on user needs/gut feeling?

regards;rl

>=20
> >
> >>
> >> Richard Leitner (5):
> >>   python3-socksio: add recipe for v1.0.0
> >>   python3-anyio: add recipe for v4.2.0
> >>   python3-sniffio: add recipe for v1.3.0
> >>   python3-httpcore: add recipe for v1.0.2
> >>   python3-httpx: add recipe for v0.26.0
> >>
> >>  .../python/python3-anyio_4.2.0.bb             | 23 ++++++++++
> >>  .../python/python3-httpcore_1.0.2.bb          | 26 +++++++++++
> >>  .../python/python3-httpx_0.26.0.bb            | 44 ++++++++++++++++=
+++
> >>  .../python/python3-sniffio_1.3.0.bb           | 12 +++++
> >>  .../0001-Unpin-flit-core-dependency.patch     | 21 +++++++++
> >>  .../python/python3-socksio_1.0.0.bb           | 10 +++++
> >>  6 files changed, 136 insertions(+)
> >>  create mode 100644 meta-python/recipes-devtools/python/python3-anyi=
o_4.2.0.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/python3-http=
core_1.0.2.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/python3-http=
x_0.26.0.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/python3-snif=
fio_1.3.0.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/python3-sock=
sio/0001-Unpin-flit-core-dependency.patch
> >>  create mode 100644 meta-python/recipes-devtools/python/python3-sock=
sio_1.0.0.bb
> >>
> >> --
> >> 2.40.1
> >>
> >>
> >>
> >>

