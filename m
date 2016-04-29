Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 48833605FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 08:30:56 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id u10so15814831igr.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QrGbY15mE94mPmsHUk7v4VItKGwlwWx9lZDHrt8u4Xo=;
	b=a0qxIcBYjvEOOLLDqvBmitXhWsyutQ3pDDLQOn5IWgeWZb17JqluqsnO8trq9ZWsYg
	05HwPExv0GbyfNTxXM+BzPhE5qDL712DR3w1MGQ+HL7k21DN/vs8IamfTG9oUNlrjEkp
	vNhM1QKp862maescfS4uaENPLQz+63Gp1Yx4bShtj2JmRYh9COVeFw17GpVd62P0VFkY
	++qY0r3lZMpfLITOWN5NteQz1H/cwxck9LAB0uGIVabVay+u1x3cf0xMOdR1NNfqqc8m
	w8OK9GlB+IRfUJBJoIAnIL7/ql9RypylB3Xp8J16kkfiDmEQL3WcHgMsTPuB9798sLPh
	xyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QrGbY15mE94mPmsHUk7v4VItKGwlwWx9lZDHrt8u4Xo=;
	b=lLsiTIGZQknN9izRt/Rvh6sv0bhGgWLZrrpLvWMurh3Vo7lBG/HTntFIwjBzWFYC0d
	T92OCqodRyn1T2xq9AadmVFANxDz7m6YwqApXZPnJr6e5PJaTwKG8AavXMfT65yGyvgk
	jmH+zeKYfZ54fD2FYnxLEsa6wLcol5UusBQsC9gNsWyPX1y1qWbF6wQanQJkBaGStCa4
	5LNcJPiYG185fBKjFvGD/5orQ1tqI3lwuk9hGIOezKQiWPOsDtS18Acb7Sddu5c4Rk5c
	NIzAHENv93uFrjHu4j2vLbSIBoT4fduc+ZikBFRh3rDappSpAcvcbOdjcnpxK1uD0Yvu
	sLfA==
X-Gm-Message-State: AOPr4FWKHNbD2RhyudXo/IHMRlZW1US0WXMuC4qmiYn7+78LAt3Lrk80Dg9F68tfMTe/TVBA/8h69FbO2xYUAiCL
X-Received: by 10.50.233.40 with SMTP id tt8mr3031998igc.78.1461918657572;
	Fri, 29 Apr 2016 01:30:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Fri, 29 Apr 2016 01:30:38 -0700 (PDT)
In-Reply-To: <2D704C56-775E-4E1A-BFBD-0C14455EFE1A@gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<246f9c39-736b-7ed6-b69a-69d8c4369236@windriver.com>
	<B59F2ADC-CB7F-44CF-9AD7-AD779FC2EEC9@gmail.com>
	<748495f9-7383-ce65-a41b-7343aa1c6004@windriver.com>
	<2D704C56-775E-4E1A-BFBD-0C14455EFE1A@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Apr 2016 09:30:38 +0100
Message-ID: <CAJTo0LZKvjbMQnbHXXYZqd8b=q8s=Rh-VAajj3xH3hLTN5sCrQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Fri, 29 Apr 2016 08:30:58 -0000
Content-Type: text/plain; charset=UTF-8

Took it for another ride on our AB last night:

http://errors.yoctoproject.org/Errors/Latest/?filter=ab893d4e1c3efc1ee73c6cfbbb9a64036c63d93c&type=commit

The systemd-sysusers stuff I failed to remove, and is broken.

There's a pango-native failure that appears to be caused by GIR.

And two SDK image test failures caused by transient network problems.

Looking good!

Ross

On 28 April 2016 at 16:29, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Apr 28, 2016, at 8:19 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> >
> > On 4/28/16 2:10 AM, Khem Raj wrote:
> >>
> >>> On Apr 27, 2016, at 11:06 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> >>>
> >>> On 4/27/16 12:53 PM, Khem Raj wrote:
> >>>> thanks I think most of them come to these categories. So any help in
> >>>> fixing them is welcome.
> >>>>
> >>>> 1. kernel older than 4.4, backport needed fixed into these branches or
> >>>> move to newer kernels.
> >>>> 2. uboot dont have gcc6 compiler header files, backport the needed
> fixes
> >>>> 2. meta-qt4 needs to use gnu++98
> >>>> 3. gcc6 providing its own stdlib.h in libstdc++
> >>>> 4. gcc6 swtiching to gnu++14 for C++ as default.
> >>>> 5. GPLv2-only versions of recipes are simply old will need fixing
> >>>
> >>> From a -very- brief look, I suspect each of these fixes will be fairly
> simple.
> >>> So as we move into the next oe-core phase, we should be able get
> through this
> >>> pretty quickly.
> >>
> >> I think yes, they are trivial, except the GPL-2.0 packages which might
> need patching
> >>
> >
> > Ha, actually that was what I was referring to.  The couple I looked at
> seemed to
> > be trivial.. :)
>
> yes they are just the fact that compiler has gone stricter compliance with
> standards compared
> to when code was written. In worst case we might downgrade -std for these
> recipe but that
> may not be enough in some cases
> >
> > If someone doesn't get to it first, I expect some of my guys will in
> about a month.
> >
>
> OK cool. I think we should make it merge worthy and get it early into
> master and fix the fallouts
>
>
> > --Mark
>
>

