Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED51CC3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 11:07:15 +0000 (UTC)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
 by mx.groups.io with SMTP id smtpd.web11.53825.1722251226495969902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 04:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=tMQ3JDCU;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.178, mailfrom: dev@g0hl1n.net)
Date: Mon, 29 Jul 2024 13:07:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1722251224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dB4/0A3ISV02Nd+dPkzVLxjChqeaCmP1EQ2+jF94ucg=;
	b=tMQ3JDCUNssCXU7c7pNofcmKQfOdPuIAvtC4ovhVnR+SP0qae4naf0r+FPmKXtWH8gYmT2
	0wBuD34HgkXGm5QlrTI8Bb8rpnghwl77pidgmgRKRo7VOFxmgCV4ZhTAwYB0wscV1WG5RY
	cAaMR6p5wjIa3ShkaSCoKmOQUgQlxQQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: Tim Orling <tim.orling@konsulko.com>
Cc: akuster808 <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
Message-ID: <deurtntaw6lr4jmfgn5ugtzrgb33ql5hndroqafp6q5o74zefd@3gc5rd42xlmh>
References: <20240706180810.1707296-1-dev@g0hl1n.net>
 <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
 <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj>
 <CAOyo-87-wojy-WxNs98qWp9kev2Dpui-Nk8ffLzwWQbmsvpvjQ@mail.gmail.com>
 <CAOyo-86Zds3bvy0GvmiBEDRignUn2Z509SkD7Lw1xZ-0Ky30bg@mail.gmail.com>
 <lhsjaroyl6ivizrhqd6dmwtibvcgjynf756u5o6turi7aqxzb6@cdl46qnvnn4t>
 <CAOyo-87sBZUxfGGzK2zio2kBkRCZYrExjYcGNSnNZyRMf3EnaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOyo-87sBZUxfGGzK2zio2kBkRCZYrExjYcGNSnNZyRMf3EnaQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 11:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111453

On Thu, Jul 18, 2024 at 08:27:50AM GMT, Tim Orling wrote:
> On Thu, Jul 18, 2024 at 7:49=E2=80=AFAM Richard Leitner <dev@g0hl1n.net=
> wrote:
> > On Wed, Jul 10, 2024 at 12:10:01PM GMT, Tim Orling wrote:
> > > On Wed, Jul 10, 2024 at 8:14=E2=80=AFAM Tim Orling <tim.orling@kons=
ulko.com>
> > wrote:
> > > > On Tue, Jul 9, 2024 at 5:54=E2=80=AFAM Richard Leitner <dev@g0hl1=
n.net> wrote:
> > > >> On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:
> > > >> > Hello Richard,
> > > >> >
> > > >> > On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org
> > wrote:
> > > >> > > The currently available python-3-pydantic v2.7.0 requires
> > > >> > > python3-pydantic-core to be updated to v2.18.1.
> > <snip>
> > Do you got failing ptests for scarthgap (with this patch applied) too=
?
> > Or did you just tested master?
> >
>=20
> I won't try any stable branches until I get it fully functional on mast=
er.
> The challenge is time and the fact that Rust is injecting TMPDIR into t=
he
> .so
> Given that master now makes [build-paths] QA WARNING an ERROR, we need =
to
> fix this.

True. So will you follow up on the pydantic/core update for
master as soon as there is a fix for this issue?

How to proceed with scarthgap? As we are definitely shipping
non-compatible versions of pydantic/pydantic-core currently.

>=20
> I suspect, but have not proven, that it was already a problem with the
> original python3-pydantic-core before any of these upgrades.

...

