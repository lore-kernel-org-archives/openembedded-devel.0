Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id CB2706FC3E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jun 2014 10:48:08 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hn18so1772131igb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jun 2014 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lHDpC4SRPFzJk5JPsr35PSXWIIGPL9yQtE3kpuBiRRc=;
	b=eFpzPUtluWTuB/30wurtoosB7Z+4mhohz+WPA53rqNwxVbqC5Yfz4MErr4bY7uy1c7
	Urtr92k9+XyMVPADK4WNLGdBCzIWQ2oWutDuXGMhSkdmP56MnDQT1S04uOWpRNN7c1o3
	uBkgzYQso9tkz9jrUC0+xosHGKiXfrntYb3G/7MPa4+PosWdNVUGqU1TsfXXSJ/MTl8g
	LL77Z0LA8qgaIlTmvq77r9pYWoaJF8g8//ua4YcEqBPmK/nbYXYup6oMMeuuNZU32baT
	LMMVoWwuVLzvMoY9n6NgzUXKO/Zup6GxHSl0eaR/0aqJjAaZxGUNvALiI5+CJm3vO9wX
	5+2g==
X-Received: by 10.43.62.204 with SMTP id xb12mr13194443icb.51.1402138088759;
	Sat, 07 Jun 2014 03:48:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.6.197 with HTTP; Sat, 7 Jun 2014 03:47:37 -0700 (PDT)
In-Reply-To: <1e3e1440af55f551685afb9d79e47d71@mail.familyhonor.net>
References: <1e3e1440af55f551685afb9d79e47d71@mail.familyhonor.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Jun 2014 03:47:37 -0700
Message-ID: <CAMKF1sprt8aH5SzK9rcyrKdWpeaezqqox3DDP4N=ucp1VJY6Fw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: multi-threaded core dump issues when threading symbols missing
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
X-List-Received-Date: Sat, 07 Jun 2014 10:48:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 6, 2014 at 8:58 PM, blloyd <blloyd@familyhonor.net> wrote:
> I originally tried to solve this problem a long time ago by changing the gdb
> package to depend on the selected libc debug packages.  That never did get
> to a state that was accepted for commit.
>
> However, even if it did, I've come to realize that it wouldn't really fix
> the problem.
>
> Basically, core dumps do not generate valid dumps for multiple threads when
> the threading debug symbols are not available.  This includes automatically
> generated core dumps when an application segfaults while running (kernel
> generated dumps).
>
> Two possible solutions for the problem which will ensure core dumps work
> when enabled is to:
> 1.  not strip the libc packages.  Since this would mean more loaded into
> memory all the time, I can understand why this may not be desirable.
> 2.  Include the debug symbols for either all of libc or just the specific
> libc debug symbols needed for a valid core dump so that core dumps work.
>      a.  Just have eglibc depend on eglibc-dbg and uclibc depend on
> uclibc-dbg.  Easy.  For eglibc, this adds @35mb to a system
>      b.  Split the required *.so.debug out from the rest of the dbg, and
> have the -dbg package and base package depend on the new package.  I believe
> the minimal required is libpthread-*.so.debug, which for the eglibc case
> adds less than 1MB to the image.
>
> Testing would be required to ensure the right subset is selected for 2.b,
> but when I originally did this just adding that one debug file caused the
> generated images to work for all my debugging needs.
>
> Are either of the above possible solutions likely to get approved?  I don't
> mind implementing either, but as they effectively affect every image made, I
> would like to discuss before implementing one of the solutions.
>
> Without this change, a debug dump will have only one viewable thread.  It is
> not usually the crashing thread.  With the required debug symbols in place,
> crash dump debugging (including on a development box with the device SDK
> installed) appears to function properly.
>
>
> Any suggestions about what can be done that could be accepted for inclusion
> into the mainline after completion would be appreciated.

what happens if you install eglibc-thread-db ? does that solve the problem

>
> Is 1MB worth worrying about?  I know some images that are generated are very
> small, but I don't usually get things smaller than 200MB where 500K is just
> noise.
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

