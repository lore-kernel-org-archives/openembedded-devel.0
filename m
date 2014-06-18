Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0136FD62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 10:01:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Jun 2014 02:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,499,1400050800"; d="scan'208";a="559472331"
Received: from tlankage-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2014 03:01:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eduardo Silva <eduardo@monkey.io>
Date: Wed, 18 Jun 2014 11:01:55 +0100
Message-ID: <6717041.FlKhvNlNB6@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.7-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <7089991.I2xES8Z8LK@peggleto-mobl5.ger.corp.intel.com>
References: <1403042333-15020-1-git-send-email-eduardo@monkey.io>
	<20140618081256.GH2117@jama>
	<7089991.I2xES8Z8LK@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] monkey: new v1.5.1 release (v2).
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
X-List-Received-Date: Wed, 18 Jun 2014 10:02:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 18 June 2014 10:18:56 Paul Eggleton wrote:
> On Wednesday 18 June 2014 10:12:56 Martin Jansa wrote:
> > On Tue, Jun 17, 2014 at 03:58:53PM -0600, Eduardo Silva wrote:
> > > This patch add the minor release fix of Monkey HTTP Server v1.5.1. It
> > > fixes
> > > some problems when switching user when started as root.
> > 
> > (v2) belongs to subject tag (so it's stripped in "git am") , subject
> > should
> > be
> > 
> > [PATCHv2][meta-webserver] monkey: upgrade to 1.5.1
> 
> I will correct this on merging, but if you could remember this for future
> patches Eduardo that would be great.
> 
> > > monkey/yocto: 7a702d00c5e48d1e03d8bbd2c7bd93a0d26f701e
> > 
> > ^ what's this?
> 
> I suspect it corresponds with the layer that Eduardo is maintaining on
> github. For meta-webserver I'm not too concerned if these sorts of things
> are in the commit message if it helps for future reference, so I'm happy
> for it to stay.

Actually, I just tested this it seems clear that this recipe has not actually 
been build-tested - the issue pointed out earlier with the errant space in 
EXTRA_OECONF (between "--datadir=" and "${localstatedir}/www/monkey/" is still 
present, so do_configure fails immediately.

Eduardo could you please fix this as part of this upgrade, test it and send a 
v3?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

