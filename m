Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AFAF46C14C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 23:32:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2019 16:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,254,1549958400"; d="scan'208";a="309294187"
Received: from pyeoh1-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.177.212])
	by orsmga005.jf.intel.com with ESMTP; 21 Mar 2019 16:32:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 22 Mar 2019 12:32:06 +1300
Message-ID: <1698450.TmOFBMJAC0@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CAMKF1sprBWXWR2b13ARFOK8LYSjrkbiyx_cWDfKXUktUhZOzdQ@mail.gmail.com>
References: <cover.1534182463.git.paul.eggleton@linux.intel.com>
	<6a15a264cf5e3cbe0df1614387cd2eb9fc421ac7.camel@gmail.com>
	<CAMKF1sprBWXWR2b13ARFOK8LYSjrkbiyx_cWDfKXUktUhZOzdQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/4] faad2: set LICENSE_FLAGS
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
X-List-Received-Date: Thu, 21 Mar 2019 23:32:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 22 March 2019 10:29:13 AM NZDT Khem Raj wrote:
> On Thu, Mar 21, 2019 at 2:09 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > On Mon, 2018-08-13 at 19:50 +0200, Paul Eggleton wrote:
> > > Commercial usage requires a license according to the homepage, so set
> > > LICENSE_FLAGS = "commercial" to indicate that.
> > >
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > ---
> > >  meta-oe/recipes-multimedia/faad2/faad2_2.7.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-
> > > oe/recipes-multimedia/faad2/faad2_2.7.bb
> > > index b777831ad..9e5a3817a 100644
> > > --- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> > > +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> > > @@ -5,6 +5,8 @@ LICENSE = "GPLv2"
> > >
> > >  LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
> > >
> > > +LICENSE_FLAGS = "commercial"
> > > +
> >
> > My understanding was that faad2 was GPLv2, but you could *optionally*
> > get a commercial license for it if you needed one. Is the LICENSE_FLAG
> > necessary in that case? It seems like the default license of GPLv2
> > would apply unless you worked something out with them to get a
> > commercial license?
> 
> Sometimes the use determines the license enforcement. e.g. it might
> be GPLed for personal use but not for selling products.

Also, the GPL unfortunately is not the only concern if you read the full 
upstream README.  I think it's best to err on the side of caution, after all 
there is the ability for to set LICENSE_FLAGS_WHITELIST signifying "yes I have
checked and my usage is OK".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



