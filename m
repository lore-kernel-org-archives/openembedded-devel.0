Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id 54A3F795F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 19:07:17 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id u74-v6so15967955oia.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iQ0JTkfYJ/O9j20fOAZUzMs5do66986tjdd92Qa/g2w=;
	b=Pv840+NWJplLBWAaBdmOmn++D7BEgisnMykzOHehGTJuFQ5bcTr+EYikVwNbcfJpta
	jUTJNgeSTMuivdEnoVotdqJeOrERE8i4rdvd6xUpUqeBRWQ9tbTklYKYTYOt8Mjg3RsZ
	Xblb4KKEMiN2xwO8Uyj52hczSougvmVlXsdq+1XaAAlpPULoK0wI7tLSDynIrcW7jHGi
	DpV3gfy3LTGj9fE7RxAld2BRYDtg0ZwtGsiZAG8azM2gpAWp/EdmQUqNX5baS5MFIlvQ
	wM7VFc2Jcci3mOqRvNvGFPUd58dR7B8BwzL+u6nUZtk34Yct+gORbbdkWCXtMiN/KpnY
	AutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iQ0JTkfYJ/O9j20fOAZUzMs5do66986tjdd92Qa/g2w=;
	b=XfREHtXxXqHbEhLijtePcuKAPcO3wBogktNcGyaH79YPh2lwIsJl7O7tPSCo0iyJjn
	jGUj3Ng9RSrcqIp+Ps9gKh9xbRSTajBgEPWRDofMYQcCGdBFK7V2rBxHSn8HQI9b9N/Z
	6SLtgawRm0dDyS2riXbYXk03SyLdWF/9vLMCMG9UCXJkQud6crtpTjn2t40ETiZaz5MW
	cT5N7bPqxxZ5olaCABAclOdVpdkBQD5Lsmybx0pfFPpCNmmbAtV7+nbdAZ1bkV7XIueV
	9iXEM1d6A9/wyyFm2xqDcYgYFaOd9G1OYuQ5txbN185zlaeTqLywBL10IuToPRC8ZE0w
	awNA==
X-Gm-Message-State: ABuFfog7Xhna1CIDT4lhG0p/QBikA0ynrwt3ovfDir+/EsoizNElN3lT
	+kj4cdvhgUbMJdX414Eg7VYC/7FxahF2aVa0MrQF6A==
X-Google-Smtp-Source: ACcGV61Ez0n0wPaRbbnNRZNBxItE/RECwXiPsCFvCssJAqE7GgaI7Fpx82JqwAaS9SMiT0Iify7kbGiMV7XCrGi5xy4=
X-Received: by 2002:aca:bbc5:: with SMTP id
	l188-v6mr5764852oif.340.1539630438288; 
	Mon, 15 Oct 2018 12:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
	<CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
	<20181015031245.GB7186@denix.org>
	<CAM_RqkPb0pFu57guB7gL5NLni-+pvdwqyLS2vL1rB8-q8Jbimg@mail.gmail.com>
	<20181015181410.GF7186@denix.org>
	<CAMKF1srW5-fDXbsEsFYS3Dj1AAPCCNfEhVpeYzBod66jaZu=EA@mail.gmail.com>
	<20181015190052.GG7186@denix.org>
In-Reply-To: <20181015190052.GG7186@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Oct 2018 20:07:06 +0100
Message-ID: <CAJTo0LYk2Z866pnf7gAt=JaqrfF+f857SDet0G-iLssvp44fVA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Mon, 15 Oct 2018 19:07:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Oct 2018 at 20:01, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > > > > > +do_install () {
> > > > > > > > > +     install -d ${D}${includedir}/CL/
> > > > > > > > > +     for f in ${S}/CL/*.h; do
> > > > > > > > > +             install -m 0644 $f ${D}${includedir}/CL/
> > > > >
> > > > > Single file install? Not very optimized...
> > >
> > > > Its not a single file, Installing all the header files.
> > >
> > > It's a single file install in a for loop, hence my comment about being
> > > unoptimal. Why not use "cp *.h"?
> >
> >  I agree its suboptimal use here. May be
> >
> > install [OPTION]... -t DIRECTORY SOURCE
> >
> > could be tamed to make it better.
> > however cp messes the file permissions up if not used with right opts.
> > So I would not prefer it unless used with right
> > options to respect the file perms. Install does it correctly,
>
> Agree, cp would require passing correct options, but there are plenty of
> examples alreay.

If we're bikeshedding a micro-optimisation then surely this is optimal:

  install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h

That combines the mkdir and cp in one command.

Ross

