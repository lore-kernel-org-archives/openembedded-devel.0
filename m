Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CB522619DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 09:40:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2013 02:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,668,1367996400"; d="scan'208";a="370386661"
Received: from unknown (HELO helios.localnet) ([10.252.122.64])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2013 02:40:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jul 2013 10:40:45 +0100
Message-ID: <2963462.utSmEIFUfo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAP9ODKqOJLBwUNHG7ungbU_+sY4HD4_66COMMvSSSa798dv-bA@mail.gmail.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
	<5eac17e51739330054a2dfb9d651bc0a2b931329.1373726565.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqOJLBwUNHG7ungbU_+sY4HD4_66COMMvSSSa798dv-bA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 3/3] mosh: add new recipe for version 1.2.4
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
X-List-Received-Date: Mon, 15 Jul 2013 09:40:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 July 2013 00:54:32 Otavio Salvador wrote:
> On Sat, Jul 13, 2013 at 11:47 AM, Paul Eggleton
> > +# Note: the server also requires a UTF-8 locale, but there's no way
> > +# to add a dependency for this
> 
> I'd put this as a WARNING and on the top of the recipe or something so
> it is easily visible.

OK, I've moved the comment to the top and reformatted it slightly on the 
branch. Note that it's not a disaster if the user forgets to do this - they'll 
soon find out at runtime when it doesn't work, and the error mosh produces is 
thankfully clear on what is missing.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

