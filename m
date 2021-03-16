Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.188.1615914744694844370
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 10:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FB1040C1C;
	Tue, 16 Mar 2021 17:12:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4I51RChziURF; Tue, 16 Mar 2021 17:12:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C60A40A47;
	Tue, 16 Mar 2021 17:12:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A29A6174544; Tue, 16 Mar 2021 13:12:18 -0400 (EDT)
Date: Tue, 16 Mar 2021 13:12:18 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster808 <akuster808@gmail.com>,
	"Bajjuri, Praneeth" <praneeth@ti.com>,
	Changqing Li <changqing.li@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][dunfell PATCH] thin-provisioning-tools: switch branch from master to main
Message-ID: <20210316171218.GD18041@denix.org>
References: <20210315011408.6604-1-praneeth@ti.com>
 <d3134ab9-7a6f-584d-0e92-4ab1bccaba36@gmail.com>
 <CAMKF1srYtLnpvQxkHoX--kFiyOL32jR4RLnjH2U4zhSXckzWrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srYtLnpvQxkHoX--kFiyOL32jR4RLnjH2U4zhSXckzWrg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks!

On Tue, Mar 16, 2021 at 09:37:55AM -0700, Khem Raj wrote:
> seems fine.
> 
> On Tue, Mar 16, 2021 at 8:41 AM akuster808 <akuster808@gmail.com> wrote:
> >
> >
> >
> > On 3/14/21 6:14 PM, praneeth via lists.openembedded.org wrote:
> >
> > ah, the subject messed with my filters. I need to fix that
> >
> > Khem,
> >
> > I am going to fast track this to dunfell.
> >
> > -armin
> > > From: Changqing Li <changqing.li@windriver.com>
> > >
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > [cherry pick commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfell]
> > > Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> > > ---
> > >  .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> > > index 9f89bac22..3f82734ac 100644
> > > --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> > > +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> > > @@ -7,7 +7,7 @@ SECTION = "devel"
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > >  S = "${WORKDIR}/git"
> > >
> > > -SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
> > > +SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
> > >             file://0001-do-not-strip-pdata_tools-at-do_install.patch \
> > >             file://use-sh-on-path.patch \
> > >  "
> > >
> > > 
> > >
> >
