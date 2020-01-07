Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 42E6F7FDCA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 15:30:35 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id g1so47926qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2020 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E06iDFIJl5BuEUqiae3fQl3+FYQwEycptzYtxN05ksE=;
	b=lxzPLYmIoR4nzUuPfIE3VB2C2c963J3s5bodkcTBW+vGGJdjh7I/IrsVY5KpGVTSsU
	hBJEa/vR8TrOXEO0gwdrrRdsaKksbEnfwbKoggZTJ+VfBe6h0d8w6bL8EB4BQwo7bCHu
	/TSrOuH6KzFsryzC5bb5qWAIO/cLlyDzu3deW089X5iiaNw0rZYtIXxAWHjSH3/CvSlr
	UswEq5cPF8V9L0TS5vDIFpTemn1lGWn0acP5RD5swgK+86n0z9SrAbfSDWiWrZNq+8XX
	NyujCteTnTul5mANAUJ8rYbhdN9bw/ECjDuGmAcale0gf6SpSpwSqFAhivLRAgb3qkBC
	TdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E06iDFIJl5BuEUqiae3fQl3+FYQwEycptzYtxN05ksE=;
	b=W9AcEeLJzQcnMO07VBupBuFltpfgUtYiwbMkb64cS91lkEhDnAgGQ69aGFU1QsE91e
	EADC5obTyVtcdo3OZacrofxd4KqKPyTdJuvx0OKFe4LP5IwGnAh/mJoYEHQJkJSjA3bc
	R8xSRI0UmnydPihbO5tW4jWrS5yEGx6wnqU8fRkxweyBPYYtrRDe33SKRnk44gDw/6dk
	DF7733m9glD5iCkPLCnl5mi512jXedgrvpjblPdzPeThPNWS2p5/XT64Rpc1BmsENkWu
	ddAQdigSCG3H9YiygDbVHPlMbABYm2NseTik6cYbcD5OAq3F2a6LEOAZjAfZjd93hOBH
	DpLw==
X-Gm-Message-State: APjAAAXCgn47P3oZiNajpvx6gKh+M1Ceg84Jm9LTHPw+OM5HSD0szaUk
	Hr+dh1cFhX77C8WB6kxaW1h8DjneCaJg2LqdDbsGLPXl
X-Google-Smtp-Source: APXvYqzHJxGNUN2QfhSLdjr0g/ITW3AlppBfn+HjLLRXXOGW/d+9tsTy2aRXCDeTxbKbq8RfJeiFkU8x+SQf0/tlCWc=
X-Received: by 2002:aed:2c03:: with SMTP id f3mr63507133qtd.80.1578411035694; 
	Tue, 07 Jan 2020 07:30:35 -0800 (PST)
MIME-Version: 1.0
References: <e41daa42-7588-c966-9121-1478afd8b869@skidata.com>
	<CAMKF1sr4dadjU+=qMnc-XT_UQVGutN=ffZP=uMtcfs=J4D3vdA@mail.gmail.com>
	<c478e005-9d39-9715-f62f-c4019b1ed405@skidata.com>
In-Reply-To: <c478e005-9d39-9715-f62f-c4019b1ed405@skidata.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jan 2020 07:30:24 -0800
Message-ID: <CAMKF1sr3=wTatzZUBMX_grN9eow4sxZTxqF2c5EkDbNiB3R39g@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Darcy Watkins <dwatkins@sierrawireless.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][warrior][PATCH] Revert "openjdk-8: disable, stringop-overflow compiler errors"
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
X-List-Received-Date: Tue, 07 Jan 2020 15:30:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 6, 2020 at 10:12 PM Richard Leitner <richard.leitner@skidata.com>
wrote:

> Hi,
>
> On 04/01/2020 03:29, Khem Raj wrote:
> > On Fri, Jan 3, 2020 at 2:24 PM Richard Leitner
>
> ...
>
> >> -# WORKAROUND: disable the "specified bound depends on the length of the
> >> source argument"
> >> -# compiler error until we update openjdk8 to a fixed version
> >> -BUILD_CFLAGS_append = " -Wno-error=stringop-overflow"
> >> -TARGET_CFLAGS_append = " -Wno-error=stringop-overflow"
> >> -
> >
> > perhaps as distro integrator, its better for us to disable all
> > warning-as-error settings
> > which should work across all gcc versions and warnings will still be
> > there if someone
> > is interested in fixing them.
> >
> > something like below might work.
> >
> > BUILD_CFLAGS_append = " -Wno-error"
> > TARGET_CFLAGS_append = " -Wno-error"
>
> If that's acceptable for a OE/YP layer I'll gladly do this for meta-java.
> I always wondered why so much effort is put into fixing new warnings in
> "old" versions of software.


Yes it is acceptable. Fixing warnings is useful if it finds a bug which was
otherwise latent

>
>
> Thanks & regards;rl
>
> >
> > other options is to add -Wno-unknown-warning which will not break
> > build when a warning is not known
>
> ...
>

