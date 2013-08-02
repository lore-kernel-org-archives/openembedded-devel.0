Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 028AD6B2CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2013 11:05:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Aug 2013 04:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,800,1367996400"; d="scan'208";a="380072180"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2013 04:05:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 02 Aug 2013 12:05:18 +0100
Message-ID: <3966426.4gyULApAnq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130801103252.GL3280@jama>
References: <91586D499ADFD74FBCFB8425266A5DE40153ADA9D291@pluto.melinkcorp.local>
	<20130801103252.GL3280@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: opkg: How to make package signal reboot required?
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
X-List-Received-Date: Fri, 02 Aug 2013 11:05:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 01 August 2013 12:32:52 Martin Jansa wrote:
> I don't know about the feature to do the reboot, but we were using extra
> metadata flags for .ipk to mark packages which need the reboot (so that
> package manager can query updated packages and decide if it's needed).
> 
> See
> http://patches.openembedded.org/patch/39181/
> http://patches.openembedded.org/patch/39183/
> 
> I don't know why this wasn't ever merged in oe-core
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/031856.
> html doesn't have any negative review AFAIK.

I recall seeing these, I'm not sure why they weren't accepted either, but it 
might have had something to do with wanting more specific feature 
implementation(s) rather than a generic way to pass anything through to the 
package manager. The best thing would probably be to ask Richard directly when 
he returns.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

