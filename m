Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id E55C56133B
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:26:56 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id s6so2153170qvq.4
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZjVtcbEhSgqd44Mw2Iir+tBCExU4yJI097/eRGWrDrk=;
	b=isBKvwR0sHR4I/yzJ/xQGerheJhVhW+KZKhitgJB6NqpSGhjSBBynZ1ugY5wLMUhfb
	bYCOUlziCll2dVTd7rzpfdHBTWYa9YIPdxZuwv+XD2rye56wqPDK3Ryqwkwvmcp/hsWg
	+IKVQXw06ncVtT9GIm3xPgmFITOVWLeK5geKOhD4eSMH8kFOGc7imNOlopt3VF/lQ/oR
	4jy8sTDn1+bVyTSa3EC/YIwFjDNvaESU2iI0T6FBoi0l/TeIKfpTg+0Xvf0+7N35sMDv
	LkBdTnve5c4sNsvWzWDY5DAXT6r3Q4qqcWbRQy+rDuPYiQ6IZd0Aa8y7BJKzXxQuuxRG
	LadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZjVtcbEhSgqd44Mw2Iir+tBCExU4yJI097/eRGWrDrk=;
	b=HMvYB9meAK9d5tv6NyiehrPU4l6qQCfdNWJGY0L7050gkFV+6za5Ixg+ev/2Q1/E2G
	3neBLtQMLnkQxA380sZU9b0Co3+5GYY8AwvLROnn/0yuXNbEOoe1HSWa2gn0SKovFkmf
	oBXZ1Fwsk2ieGuq+kdyb2ZUwYbjznstD0SRo+gfTh1GqJ1Tu0j95AmyzDzaLQB0F5UQA
	pZ5bhywXZbq53RvyuFF4zVaFdnrOxqm9J10m1Fb+z8HhV4X2QmHHQKvIicbJnDJA8BiT
	oELZP1OiGXlW0eUyBccc+Hb+bmfL7Z46zm27aPxsizbcipbIEVec1tKlpj1Ra2eOgx+H
	wuag==
X-Gm-Message-State: APjAAAW/6S9zEo7BBsu+OIoDdhtp3SZHlJWHgKaADKk7Vlr3C10s+sKb
	gYc7Wy8wAldNo7i5WbKBfypk7hU6J0vj6ouw2Dw=
X-Google-Smtp-Source: APXvYqyAXUAk+V6NsoLLJPmESwOzvHmmy0R+ftRnTdlWdQChsbfdJo9q5JYxXF6Uee+0KKsqQjir95xxIGSegU7m97o=
X-Received: by 2002:a05:6214:524:: with SMTP id
	x4mr26657655qvw.4.1582216017463; 
	Thu, 20 Feb 2020 08:26:57 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
	<20200220151620.GA30034@localhost>
	<20200220153758.o25tn46hhewgmasd@jama>
In-Reply-To: <20200220153758.o25tn46hhewgmasd@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Feb 2020 08:26:30 -0800
Message-ID: <CAMKF1srwogKz+CU1Ca+WixZ_zKoZTbaPYzHH0O1s_wBAHAtFzQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: S variable for svn fetcher Was: State of OE world - 2020-02-18
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
X-List-Received-Date: Thu, 20 Feb 2020 16:26:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 20, 2020 at 7:38 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Thu, Feb 20, 2020 at 05:16:20PM +0200, Adrian Bunk wrote:
> > On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
> > >...
> > > Any idea why these aren't shown in our build?
> > >...
> >
> > What is your mirror configuration?
> >
> > Default configuration downloads the tarball from [1].
>
> Maybe I'm missing your point, but these aren't fetch issues.
>
> Even when bitbake fetches the tarball (with the svn repo), svn fetcher
> will still do the actual checkout to WORKDIR, so it will fail the same
> when fetching from upstream repo with svn or when using tarball.
>

they could have been fetched long time ago, perhaps it changed in this
area after that
when fetching fresh repos, just guessing

> Cheers,

