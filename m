Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3B827755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 20:20:43 +0000 (UTC)
Received: by lffz202 with SMTP id z202so24196334lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UlkqC69XxxOAgRh0Bpbo0SpO/xYTd+P9IPkzSnCHlBw=;
	b=rE30DHXilggiQUL0bePaJzjXDqB8waU95LFdFI9OtbKxSFmTgfbpQo4y0JsTMKjHhd
	khP5M/CKdugmSA424frN46cEpNN5rUQbBYBsuha3C4mJ2dNrIQC1x3b80JG0CMOwHA3O
	WlxAFdps61ucciVr9zOxvZ2Sp+yFjygZj01rZm8I3snvzvBhlVEuujrKJVN5+L/LYnx3
	Ritd7fRf5qzrYX5Zg87ekPS5b53zxYCuHJ73rDG7BCu+Mkjxn4ItWcxKF8dFBQi1CuJc
	TgKnhFk/77HyXDq2uXuHIFPrAGYSY3mKxs7ZrRjfGxA0bXzexetavoyzlyptxJtluelC
	pesg==
MIME-Version: 1.0
X-Received: by 10.25.212.8 with SMTP id l8mr1292935lfg.118.1446150042394; Thu,
	29 Oct 2015 13:20:42 -0700 (PDT)
Received: by 10.25.34.202 with HTTP; Thu, 29 Oct 2015 13:20:42 -0700 (PDT)
In-Reply-To: <CAMKF1sq0Xz74tUMyHvpjq6iOrtRjbFdV7u6XtenoCXTq__fYzw@mail.gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<1446137120.5251.111.camel@pbcl.net>
	<CANx9H-BLJNKouUAidFAfMmTEQ3mtL34Hp+zCZQHm7WZuB1wOJg@mail.gmail.com>
	<CAMKF1sq0Xz74tUMyHvpjq6iOrtRjbFdV7u6XtenoCXTq__fYzw@mail.gmail.com>
Date: Thu, 29 Oct 2015 13:20:42 -0700
Message-ID: <CANx9H-DP8BUaQ5zbu2X-yviM2=8popyM4F9AtWRdWhMSHVkoiw@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Oct 2015 20:20:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 1:09 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Oct 29, 2015 at 10:01 AM, Tim Orling <ticotimo@gmail.com> wrote:
> > On Thu, Oct 29, 2015 at 9:45 AM, Phil Blundell <pb@pbcl.net> wrote:
> >
> >> On Thu, 2015-10-29 at 08:42 -0700, Khem Raj wrote:
> >>
> >> > I would like to make a proposal for 2.1 release where
> >> >
> >> > 1. Drop kconfig support in glibc and we become inline with upstream
> >> > 2. Move musl support to OE-Core from meta-musl
> >> > 3. Drop uclibc or leave it in current broken state, I would like to
> >> > pull it out into a layer in meta-openembedded and we can leave the
> >> > core plumbing as it is in OE-Core
> >> > 4. Poky-tiny switches to use musl
> >>
> >
> > In the past we have had issues with iconv support when using musl. Any
> > experience good or bad with that?
>
> it has got a lot better in locale area off late. I dont know what
> issues you were facing though.
>

I am referring to this thread:
https://lists.yoctoproject.org/pipermail/yocto/2014-March/018818.html

I just happened to come across that thread today. No personal experience
with musl yet.

