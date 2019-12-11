Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 141E27FA2C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1304240BF2;
	Wed, 11 Dec 2019 00:21:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eh8J_LmNF7ha; Wed, 11 Dec 2019 00:21:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4804409F0;
	Wed, 11 Dec 2019 00:21:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3F8E0174350; Tue, 10 Dec 2019 19:21:00 -0500 (EST)
Date: Tue, 10 Dec 2019 19:21:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191211002100.GG4735@denix.org>
References: <1576014699-29663-1-git-send-email-denis@denix.org>
	<CAMKF1sov90kwh_dy8UD-qob7UXTkeD2iL6=X2T+PHanFvVy7Pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sov90kwh_dy8UD-qob7UXTkeD2iL6=X2T+PHanFvVy7Pw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] netperf: add "intervals" and "histogram" PACKAGECONFIGs
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
X-List-Received-Date: Wed, 11 Dec 2019 00:21:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Dec 10, 2019 at 03:48:58PM -0800, Khem Raj wrote:
> On Tue, Dec 10, 2019 at 1:52 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > From https://hewlettpackard.github.io/netperf/doc/netperf.html:
> >
> > Other optional configure-time settings include --enable-intervals=yes to give
> > netperf the ability to “pace” its _STREAM tests and --enable-histogram=yes to
> > have netperf keep a histogram of interesting times.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-networking/recipes-support/netperf/netperf_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
> > index 8921ea7..f1f62df 100644
> > --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> > +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> > @@ -31,6 +31,8 @@ CFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', \
> >
> >  PACKAGECONFIG ??= ""
> >  PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,"
> > +PACKAGECONFIG[intervals] = "--enable-intervals,--disable-intervals,,"
> > +PACKAGECONFIG[histogram] = "--enable-histogram,--disable-histogram,,"
> >
> 
> now that they are explicitly disabled, Does it change the defaults ?

I don't know if there were any automatic checks under the hood to enable them 
by default (I don't believe so), but I needed to explicitly enable them in few 
of my builds to get them in.

-- 
Denys


> >  # autotools.bbclass attends to include m4 files with path depth <= 2 by 
> >  # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

