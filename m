Return-Path: <denis@denix.org>
X-Greylist: delayed 3603 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Dec 2014 17:56:21 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id AE27C72499
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 17:56:21 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGB00NILR1K1Z40@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	09 Dec 2014 10:56:09 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MJ3XQ3dg c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=alK4_DS-AAAA:8 a=r-cks3CD4q_1itvUsqgA:9	a=CjuIK1q_8ugA:10
	a=jxC1yY7ND0kA:10 a=LklqTVxV3E0A:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2C89B20190; Tue,
	9 Dec 2014 11:56:07 -0500 (EST)
Date: Tue, 09 Dec 2014 11:56:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20141209165607.GI13319@denix.org>
References: <1415923750-17942-1-git-send-email-denis@denix.org>
	<20141124194833.GC25432@denix.org> <20141208232826.GH13319@denix.org>
	<CAP9ODKp9S0==V9=nWYD2yFGpd2K5+nBDxRwqrZN92p4h2mvV-g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKp9S0==V9=nWYD2yFGpd2K5+nBDxRwqrZN92p4h2mvV-g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qtbase_git: re-add OEQt5Toolchain to SRC_URI
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
X-List-Received-Date: Tue, 09 Dec 2014 17:56:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 09, 2014 at 10:57:23AM -0200, Otavio Salvador wrote:
> The patch needs rebase; can you update it and resend? I promise to
> look at it right away :D

rebase? why? master hasn't changed in months...


> On Mon, Dec 8, 2014 at 9:28 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > ping^2
> >
> > On Mon, Nov 24, 2014 at 02:48:33PM -0500, Denys Dmytriyenko wrote:
> >> ping
> >>
> >> On Thu, Nov 13, 2014 at 07:09:10PM -0500, Denys Dmytriyenko wrote:
> >> > From: Denys Dmytriyenko <denys@ti.com>
> >> >
> >> > The file is expected by do_install(), but _git version resets SRC_URI.
> >> >
> >> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> > ---
> >> >  recipes-qt/qt5/nativesdk-qtbase_git.bb | 7 ++++++-
> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> >> > index 96d86db..095bee7 100644
> >> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> >> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> >> > @@ -25,13 +25,18 @@ SRC_URI += "\
> >> >  # common for qtbase-native and nativesdk-qtbase
> >> >  SRC_URI += " \
> >> >      file://0011-Always-build-uic.patch \
> >> > -"
> >> > +"
> >> >
> >> >  # specific for nativesdk-qtbase
> >> >  SRC_URI += " \
> >> >      file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
> >> >  "
> >> >
> >> > +# CMake's toolchain configuration of nativesdk-qtbase
> >> > +SRC_URI += " \
> >> > +    file://OEQt5Toolchain.cmake \
> >> > +"
> >> > +
> >> >  SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
> >> >
> >> >  LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
> >> > --
> >> > 2.1.2
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 
> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

