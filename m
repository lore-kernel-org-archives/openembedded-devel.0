Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 931F4755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 17:01:25 +0000 (UTC)
Received: by lbbec13 with SMTP id ec13so33665829lbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=a2OIV0bBFz3ITpGzyiqamkd48mjVY/YEMg1HgO4wBnY=;
	b=OAJoUaIJhLNdCJChz9A5bi+gSh/n6UPKk9iyXaaNzT0UWR/d044HcErJxAbiQW1nLa
	SmPWGUqsxWrkv69duSCcBax9FtaIMF8XKTHnwpuC5schocI2Br/1WJfrM8tcvoUN7W1B
	qrBVLbxjyO1usurExVOhDGaLSRJ390Byyejvqah2FXVJ8pBKeHZAR424UHzgcIKqrF5T
	NLzZYhfrpiphWbiBYiMh2FsP1j2qTUYdMR4uzt5i7HFtxV5UrYqEzSAUmYCbdCjVNxZU
	eU8JObK59NWTytU2QHmm2HK3wGQy1ZIqMjS6PYJhT1aDNvD8deSnvY2gWhXrBn3d40Oo
	VKEQ==
MIME-Version: 1.0
X-Received: by 10.112.11.163 with SMTP id r3mr1587979lbb.8.1446138084704; Thu,
	29 Oct 2015 10:01:24 -0700 (PDT)
Received: by 10.25.34.202 with HTTP; Thu, 29 Oct 2015 10:01:24 -0700 (PDT)
In-Reply-To: <1446137120.5251.111.camel@pbcl.net>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<1446137120.5251.111.camel@pbcl.net>
Date: Thu, 29 Oct 2015 10:01:24 -0700
Message-ID: <CANx9H-BLJNKouUAidFAfMmTEQ3mtL34Hp+zCZQHm7WZuB1wOJg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [OE-core] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Thu, 29 Oct 2015 17:01:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 9:45 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Thu, 2015-10-29 at 08:42 -0700, Khem Raj wrote:
>
> > I would like to make a proposal for 2.1 release where
> >
> > 1. Drop kconfig support in glibc and we become inline with upstream
> > 2. Move musl support to OE-Core from meta-musl
> > 3. Drop uclibc or leave it in current broken state, I would like to
> > pull it out into a layer in meta-openembedded and we can leave the
> > core plumbing as it is in OE-Core
> > 4. Poky-tiny switches to use musl
>

In the past we have had issues with iconv support when using musl. Any
experience good or bad with that?

