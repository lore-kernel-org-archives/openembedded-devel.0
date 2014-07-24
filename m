Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id DBAD360065
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:48:18 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so3350775wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Iu+FNoU9uQiQGoRbB2stvfRuTpBWSSmevMlg2897L1Q=;
	b=rDWflpkDMJLF5+Zj7x/gBgYb+bODdbeWUnyMjNThNTa5ONsL7X8iDpAsGhluQqFLj3
	mdKlqBrrDLH+KrVyF9J7MIRV+Pa26nQ5E7nyAlTVkSa/HYX/mxFo8mQGoNlblvPXoP8u
	Snk1ENGKAXERNDSxbgLG7KSZ8JmPUt3HW9PQhWTuN2zjPJgZl8IdPnKi5c4goCDPQr6b
	vnmzgjGYN0hV71xyY08Z34VTy5vAPmsW2qBswf1XWO2y1LBVpEF/hpoEfBv/pEwfUxEy
	h4257m9fK9RFmzUwbJNA/Tg/+6bPBPFFKaU35uxPZK9IWexkZ3l0sQPS4WblSL/wQg9n
	dIqg==
X-Received: by 10.194.62.140 with SMTP id y12mr16028113wjr.27.1406234899241;
	Thu, 24 Jul 2014 13:48:19 -0700 (PDT)
Received: from nbbrfq.cc.univie.ac.at
	(91-119-84-122.dynamic.xdsl-line.inode.at. [91.119.84.122])
	by mx.google.com with ESMTPSA id
	wu6sm18883339wjb.46.2014.07.24.13.48.16 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jul 2014 13:48:17 -0700 (PDT)
Date: Thu, 24 Jul 2014 22:48:14 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Carmelo Amoroso <carmelo73@gmail.com>
Message-ID: <20140724204814.GE13324@nbbrfq.cc.univie.ac.at>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
	<CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
	<20140721204239.61b225fe@free-electrons.com>
	<CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
	<20140721212700.41e29653@free-electrons.com>
	<A7BE1426-88C8-457E-8FE5-0427CC5B1D72@workware.net.au>
	<53CF9F9D.60903@jodybruchon.com>
	<14764ab3680.2772.7d831ebe34b31eacf7a4325c447c5923@gmail.com>
MIME-Version: 1.0
In-Reply-To: <14764ab3680.2772.7d831ebe34b31eacf7a4325c447c5923@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openwrt-devel <openwrt-devel@openwrt.org>,
	uclibc-mailing list <uclibc@uclibc.org>,
	Jody Bruchon <jody@jodybruchon.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	buildroot <buildroot@buildroot.org>, Waldemar Brodkorb <wbx@uclibc-ng.org>
Subject: Re: [OpenWrt-Devel] uClibc-ng
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
X-List-Received-Date: Thu, 24 Jul 2014 20:48:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 23, 2014 at 09:20:51PM +0200, Carmelo Amoroso wrote:
> 
> 
> Il 23 luglio 2014 13:42:38 Jody Bruchon <jody@jodybruchon.com> ha scritto:
> 
> >On 7/22/2014 11:30 PM, Steve Bennett wrote:> I would like to add my
> >support to Thomas' position.
> > > Regardless of what happens with glibc and/or musl, an active community
> > > supporting regular releases of uClibc is a good thing.
> > > Time has spoken that we can't expect this to happen unless something
> >changes.
> >
> >I agree. It is better to have a responsive maintainer releasing periodic
> >"stable" versions than to have what is essentially no maintainer and
> >sustained long-term fragmentation of what "uClibc" really is. If the
> >uClibc maintainer wakes up in the future and begins releasing again, the
> >new project's changes can always be merged back to the parent, as they
> >did with eglibc and glibc. For now we need to focus on making a stable
> >release, something which is grossly overdue and harms all projects
> >currently using uClibc.
> >
> >I also agree that musl is an interesting project with a bright future
> >(and a bright present for that matter), but it does not cover all of
> >what uClibc covers and the number of projects that already require
> >uClibc is too large to simply drop uClibc and move to musl.
> >
> >-Jody Bruchon
> 
> Gents,
> Are we considering anyway that Bernard has recently restarted with patches
> review and commit without no contribution from the other co-maintainers
> (myself the first) ?
> Likely Bernard is already preparing a release !

Yea, but very very slowly, i know.
I just started preparing a meta-changelog for the release notes and
then we'll call it an official tarball.

Lots of changes, about 10% done, approx. 1h left before bedtime.

Any prominent changes we should make absolutely sure to mention?

