Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2076F708D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 21:54:48 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SLsnbI030721 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 16:54:50 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072816544996-334878 ;
	Mon, 28 Jul 2014 16:54:49 -0500 
Date: Mon, 28 Jul 2014 16:54:37 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140728215437.GB13093@bshelton-desktop>
References: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
	<1406575596-15006-3-git-send-email-ben.shelton@ni.com>
	<CAMKF1srMsLU11_YQVdXksRmmQAT2Hw6TzNoNgmT8=5Weyn+tfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srMsLU11_YQVdXksRmmQAT2Hw6TzNoNgmT8=5Weyn+tfw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 04:54:49 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 04:54:50 PM,
	Serialize complete at 07/28/2014 04:54:50 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: Re: [meta-oe][PATCH 3/3] xorg-fonts-misc: add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 21:54:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/28, Khem Raj wrote:
> On Mon, Jul 28, 2014 at 12:26 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> > Adding a packagegroup recipe to build both the misc-misc and cursor-misc
> > X.org fonts.
> >
> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> > ---
> >  meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb
> >
> > diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb
> > new file mode 100644
> > index 0000000..b2d1db7
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb
> 
> For packagegroups the naming convention is to have packagegroup
> somewhere in name and probably put it under recipes-core/packagegroups
> 

Now that I think about it, a packagegroup with only two packages in it
doesn't make much sense.  I'll drop this one.

Thanks,
Ben


