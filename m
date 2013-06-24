Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A3A1661485
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 08:41:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Jun 2013 01:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,927,1363158000"; d="scan'208";a="321583707"
Received: from unknown (HELO helios.localnet) ([10.252.122.47])
	by azsmga001.ch.intel.com with ESMTP; 24 Jun 2013 01:41:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Jun 2013 09:41:24 +0100
Message-ID: <8218654.XxdZjXFRDz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <20130624081700.GL14021@jama>
References: <cover.1371984424.git.paul.eggleton@linux.intel.com>
	<df55c6cbc892939729f0713513dc8dba6f5b9751.1371984424.git.paul.eggleton@linux.intel.com>
	<20130624081700.GL14021@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] pinpoint: fix and update
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
X-List-Received-Date: Mon, 24 Jun 2013 08:41:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 24 June 2013 10:17:00 Martin Jansa wrote:
> On Sun, Jun 23, 2013 at 11:49:00AM +0100, Paul Eggleton wrote:
> > * Fix for update and PN change of clutter in OE-Core
> > * Fix SRC_URI
> > * Use +git instead of +gitr in PV
> 
> isn't version going backwards because of that? I think so, you should
> bump PE if you really hate +gitr so much.
> 
> We still have more +gitr then +git:
> OE @ ~/meta-openembedded $ git grep 'gitr${SRCPV}' | wc -l
> 24
> OE @ ~/meta-openembedded $ git grep 'git${SRCPV}' | wc -l
> 21

Alright then, I'll leave it as is. v2 coming.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

