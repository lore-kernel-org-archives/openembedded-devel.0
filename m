Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1B17979479
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 19:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CDA320CEB;
	Mon, 15 Oct 2018 19:34:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OLUvvzpYl8Cv; Mon, 15 Oct 2018 19:34:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D42B120CDF;
	Mon, 15 Oct 2018 19:34:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6DC8C164805; Mon, 15 Oct 2018 15:34:37 -0400 (EDT)
Date: Mon, 15 Oct 2018 15:34:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20181015193437.GI7186@denix.org>
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
	<b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
	<CAM_RqkOLurOJ7DSHwAeQ3OzXE4u-mVGDE02Vc5izuRgRU=SXEg@mail.gmail.com>
	<CAMKF1spEdZOse-9yh6f3ia+evHJ_+6OJni+FePF_jEDSXvE4vg@mail.gmail.com>
	<20181015031245.GB7186@denix.org>
	<CAM_RqkPb0pFu57guB7gL5NLni-+pvdwqyLS2vL1rB8-q8Jbimg@mail.gmail.com>
	<20181015181410.GF7186@denix.org>
	<CAMKF1srW5-fDXbsEsFYS3Dj1AAPCCNfEhVpeYzBod66jaZu=EA@mail.gmail.com>
	<20181015190052.GG7186@denix.org>
	<CAJTo0LYk2Z866pnf7gAt=JaqrfF+f857SDet0G-iLssvp44fVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYk2Z866pnf7gAt=JaqrfF+f857SDet0G-iLssvp44fVA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 15 Oct 2018 19:34:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 15, 2018 at 08:07:06PM +0100, Burton, Ross wrote:
> On Mon, 15 Oct 2018 at 20:01, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > > > > > > +do_install () {
> > > > > > > > > > +     install -d ${D}${includedir}/CL/
> > > > > > > > > > +     for f in ${S}/CL/*.h; do
> > > > > > > > > > +             install -m 0644 $f ${D}${includedir}/CL/
> > > > > >
> > > > > > Single file install? Not very optimized...
> > > >
> > > > > Its not a single file, Installing all the header files.
> > > >
> > > > It's a single file install in a for loop, hence my comment about being
> > > > unoptimal. Why not use "cp *.h"?
> > >
> > >  I agree its suboptimal use here. May be
> > >
> > > install [OPTION]... -t DIRECTORY SOURCE
> > >
> > > could be tamed to make it better.
> > > however cp messes the file permissions up if not used with right opts.
> > > So I would not prefer it unless used with right
> > > options to respect the file perms. Install does it correctly,
> >
> > Agree, cp would require passing correct options, but there are plenty of
> > examples alreay.
> 
> If we're bikeshedding a micro-optimisation then surely this is optimal:
> 
>   install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
> 
> That combines the mkdir and cp in one command.

+1
And who said bikeshedding is a waste of time? :)

-- 
Denys

