Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE320607BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 08:36:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 01:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,467,1427785200"; d="scan'208";a="698209058"
Received: from lpobrien-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.32])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2015 01:36:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Boszormenyi Zoltan <zboszor@pr.hu>
Date: Thu, 21 May 2015 09:36:22 +0100
Message-ID: <7272346.ToWr0aoBxb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <20150520124134.GA2386@jama>
References: <555C7731.40605@pr.hu> <20150520124134.GA2386@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How can I disable automatic subpackage naming
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
X-List-Received-Date: Thu, 21 May 2015 08:36:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 May 2015 14:41:34 Martin Jansa wrote:
> On Wed, May 20, 2015 at 01:59:45PM +0200, Boszormenyi Zoltan wrote:
> > it seems that if bitbake finds a subpackage in the PACKAGES
> > variable that contain a single library, a new, automatic
> > subpackage gets created that will have the name "libxxxxN"
> > with libxxxx being the library name and N being the SO version.
> > With this, bitbake overrides my set of subpackages.
> > 
> > How can I disable this in Daisy, i.e. bitbake 1.22.0, so I get the
> > explicit package name I added to PACKAGES?
> 
> Remove "debian" from INHERIT variable.

To be a little more specific, by default it gets added to INHERIT_DISTRO in 
meta/conf/distro/defaultsetup.conf; you can set this to your own preferred 
value in your configuration if you like.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

