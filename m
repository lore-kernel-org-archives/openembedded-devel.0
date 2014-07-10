Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 27BE46FC62
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 13:16:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jul 2014 06:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,637,1400050800"; d="scan'208";a="571127275"
Received: from jrissane-mobl.ger.corp.intel.com (HELO [10.237.67.153])
	([10.237.67.153])
	by orsmga002.jf.intel.com with ESMTP; 10 Jul 2014 06:16:20 -0700
Message-ID: <1404998180.9749.53.camel@jrissane-mobl.ger.corp.intel.com>
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jul 2014 16:16:20 +0300
In-Reply-To: <20140710120659.GA2433@jama>
References: <1404990575-2064-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1404990575-2064-2-git-send-email-jukka.rissanen@linux.intel.com>
	<20140710120659.GA2433@jama>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 2/2] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Thu, 10 Jul 2014 13:16:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On to, 2014-07-10 at 14:06 +0200, Martin Jansa wrote:
> On Thu, Jul 10, 2014 at 02:09:35PM +0300, Jukka Rissanen wrote:
> > Use the latest version of usb-modeswitch (2.2.0) and
> > usb-modeswitch-data (20140529). The data package depends
> > on new usb-modeswitch version so upgrade both of them at
> > the same time.
> > 
> >  
> > -RDEPENDS_${PN} = "usb-modeswitch"
> > +RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
> 
> Do we really need the version here?
> 
> If yes then add comment explaining why.


Hmm, I thought the commit message already states that. Do you want that
also in the recipe itself?


Cheers,
Jukka



