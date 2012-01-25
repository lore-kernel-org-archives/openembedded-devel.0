Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rq34k-0001ZD-8M
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 14:39:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2012 04:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115965433"
Received: from unknown (HELO helios.localnet) ([10.252.122.164])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2012 04:48:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 12:48:11 +0000
Message-ID: <1592899.mTy93uB97i@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
MIME-Version: 1.0
Subject: Splitting meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 13:39:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

The meta-oe layer [1] is becoming the home for additional recipes that we miss 
from OE-Classic that don't have another obvious layer to go into, and this is 
a good thing. However I think that meta-oe is already in a state where quite a 
few people feel the new structure is not working for them.

As I see it, meta-oe is trying provide the following:

 1) Additional recipes that are not in OE-Core

 2) Additional functionality for OE-Core recipes that we can't enable in OE-
Core itself (e.g. enabling postgres support in Qt) - mostly just a side-effect 
of #1

 3) A place to preserve old versions of recipes that have been removed from 
OE-Core in favour of newer versions

 4) Newer less-well tested versions of recipes

I think what most people want when they enable meta-oe in their layer 
configuration is #1, and it's probably OK to get #2 along with it. They do not 
however expect versions of toolchains, eglibc or other fairly fundamental bits 
and pieces that might cause their build to fail when everything worked fine 
just building with OE-Core (#4). Equally I expect there will be some people 
who want just #3 and nothing else.

I understand there is significant value in providing all of these things, I 
just think we shouldn't be trying to do them all in one largely indivisible 
layer. In our new layer structure we should be able to find a way to split the 
metadata so that people who want any combination can still have what we have 
in meta-oe today, and yet those who just want one of them don't get unexpected 
build failures or older/newer versions being built.

Thoughts?

Cheers,
Paul

[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe

-- 

Paul Eggleton
Intel Open Source Technology Centre


