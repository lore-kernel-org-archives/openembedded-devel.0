Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C40CC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 07:44:36 +0000 (UTC)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
 by mx.groups.io with SMTP id smtpd.web11.54577.1723103067127434283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 00:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=SB/ETC6N;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.178, mailfrom: dev@g0hl1n.net)
Date: Thu, 8 Aug 2024 09:44:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1723103064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+/x9JJMiJRHExDIUbfkQIbUf+/fWMlbJqiD0xLk7Ls=;
	b=SB/ETC6NQ1C6UJ7qPBqOseF/Ooo+crY6CR33oTpBHIZmV6pn/L+mmxLcc462JVt+Jghr/c
	xliqSlj7ePcM0XL0KWQ0lKtV4izDGfq3MpOZzw1GfU7iZp8SZHXb0833GvKb0tlAHDtS6O
	1f8PDNX0AjUjYThU8tHY10LxVr0BAb8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: debrabander@gmail.com, akuster808 <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org, tim.orling@konsulko.com
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
Message-ID: <sewubxpvgxzg52shb7erornf3llh7u4zuvpifiqz3hg53ekelw@axibx56xtnae>
References: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
 <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com>
 <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 07:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111646

On Tue, Aug 06, 2024 at 01:09:10PM GMT, Khem Raj wrote:
> On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via
> lists.openembedded.org <debrabander=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> >
> >
> > > Op 3 aug 2024 om 18:51 heeft akuster808 <akuster808@gmail.com> het =
volgende geschreven:
> > >
> > > =EF=BB=BF
> > >
> > >> On 7/31/24 4:07 AM, Frank de Brabander wrote:
> > >> I was unaware of this discussion when I created the fix for master=
.
> > >> Note that I've silenced the TMPDIR QA message, this still needs a
> > >> proper fix in master as well.
> > >>
> > >> This indeed needs to be fixed in scarthgap as well, since the
> > >> incompatible versions do break some code. My two cents for the ava=
ilable
> > >> options:
> > >>
> > >>  - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
> > >>  - Update pydantic-core to 2.18.1
> > >>  - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
> > >>
> > >> Would only downgrade if this is the *only* allowed option accordin=
g to
> > >> the LTS branch policy. Version 2.7.x includes new features compare=
d to
> > >> 2.6.4. Removing these with a downgrade would violate the LTS patch=
 policy
> > >> of not merging "ABI/API breakage".
> > >
> > > We have had this type of situation with a pkg (A) update in master =
and then new lts was branched. We found out other later additional pkgs n=
eeded to updated to work with pkg (A). pydantic update was in Master befo=
re scarthgap was branched.
> > >>
> > >> Option 2 or 3 are my preferred choices and they fall within the
> > >> "fixes for bugs" category of the LTS patch policy. Option 2 is the=
 smallest
> > >> change to fix the problem, but option 3 includes some additional u=
pstream
> > >> fixes with the update from 2.7.0 to 2.7.3.
> > >
> > > Master should be failing so if Master gets a revert of pydantic bac=
k to 2.6.4, then Scarthgap will follow. Is this an option? - Armin
> >
> > As far as I know master works now, so a revert would make no sense in=
 that case.
>=20
> Hi Armin
>=20
> scarthgap is relatively new and I think I would be in favor of making
> an exception for this one case.

Hi Khem,
thanks. Sounds good to me.

Do you prefer going to the same pydantic{,-core} version as master,
or stick with 2.7.0 and update only pydantic-core to 2.18.1?.

regards;rl

