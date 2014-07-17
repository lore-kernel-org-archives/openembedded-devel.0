Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 26AA3705F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:23:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2014 07:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,678,1400050800"; d="scan'208";a="574687590"
Received: from ldsaruwe-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.2])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2014 07:20:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jul 2014 15:20:51 +0100
Message-ID: <1546726.9iZKeAkyu0@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <CANx9H-BSe-REicRzcAgcv5=dLx3S8w7ysqgiwhtrC4U0z8P4Pg@mail.gmail.com>
References: <cover.1405465524.git.TicoTimo@gmail.com>
	<20140716125007.GV2433@jama>
	<CANx9H-BSe-REicRzcAgcv5=dLx3S8w7ysqgiwhtrC4U0z8P4Pg@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 17 Jul 2014 14:23:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 July 2014 07:07:01 Tim Orling wrote:
> Well, that's embarrassing. Thank you, Martin. Obviously, I forgot to push a
> local commit. I guess I'd better move to the back of the bus!
> 
> 
> On Wed, Jul 16, 2014 at 5:50 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Tue, Jul 15, 2014 at 04:32:34PM -0700, Tim Orling wrote:
> > >      * Move recipes from meta-openembedded/meta-oe that are not
> > >      
> > >        depended upon by recipes already in meta-oe (e.g. gateone,
> > >        anki)
> > >      
> > >      * Recipes NOT moved:
> > >        python-futures
> > >        python-pyopenssl
> > >        python-simplejson
> > >        python-tornado
> > >        python-pyqt
> > >        python-sip
> > > 
> > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > ---
> > > 
> > >  .../recipes-devtools/python => meta-python/recipes-python}/pyrtm_0.2.bb

I just noticed, this doesn't fit the normal pattern of 
recipes-xyz/something/*.bb - there's a missing directory level. It's entirely 
cosmetic, but if we do want to fix it we ought to do so now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

