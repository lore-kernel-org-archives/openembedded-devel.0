Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D03A5701D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 15:47:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2014 08:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,685,1400050800"; d="scan'208";a="458651980"
Received: from davidgil-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.201])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2014 08:47:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Jul 2014 16:47:05 +0100
Message-ID: <3213210.CHQ3fqQ60H@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140717144038.GL2433@jama>
References: <cover.1405465524.git.TicoTimo@gmail.com>
	<1546726.9iZKeAkyu0@peggleto-mobl5.ger.corp.intel.com>
	<20140717144038.GL2433@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] meta-python: move recipes from meta-oe
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
X-List-Received-Date: Fri, 18 Jul 2014 15:47:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 July 2014 16:40:38 Martin Jansa wrote:
> On Thu, Jul 17, 2014 at 03:20:51PM +0100, Paul Eggleton wrote:
> > On Thursday 17 July 2014 07:07:01 Tim Orling wrote:
> > > Well, that's embarrassing. Thank you, Martin. Obviously, I forgot to
> > > push a
> > > local commit. I guess I'd better move to the back of the bus!
> > > 
> > > 
> > > On Wed, Jul 16, 2014 at 5:50 AM, Martin Jansa <martin.jansa@gmail.com>
> > > 
> > > wrote:
> > > > On Tue, Jul 15, 2014 at 04:32:34PM -0700, Tim Orling wrote:
> > > > >      * Move recipes from meta-openembedded/meta-oe that are not
> > > > >      
> > > > >        depended upon by recipes already in meta-oe (e.g. gateone,
> > > > >        anki)
> > > > >      
> > > > >      * Recipes NOT moved:
> > > > >        python-futures
> > > > >        python-pyopenssl
> > > > >        python-simplejson
> > > > >        python-tornado
> > > > >        python-pyqt
> > > > >        python-sip
> > > > > 
> > > > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > > > ---
> > > > > 
> > > > >  .../recipes-devtools/python =>
> > > > >  meta-python/recipes-python}/pyrtm_0.2.bb
> > 
> > I just noticed, this doesn't fit the normal pattern of
> > recipes-xyz/something/*.bb - there's a missing directory level. It's
> > entirely cosmetic, but if we do want to fix it we ought to do so now.
> 
> I've fixed it already (in master-next) and it's not just cosmetic,
> because without the directory it's not included in BBFILES pattern.

I wasn't clear on what you'd fixed - I assumed you'd just changed BBFILES to 
match the structure rather than the other way around.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

