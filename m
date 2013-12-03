Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB236DDFD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 11:02:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Dec 2013 03:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,817,1378882800"; d="scan'208";a="445948673"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.200])
	by orsmga002.jf.intel.com with ESMTP; 03 Dec 2013 03:02:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ChenQi <Qi.Chen@windriver.com>
Date: Tue, 03 Dec 2013 11:02:27 +0000
Message-ID: <27180610.K2R9aiVLnQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <529DB651.2080505@windriver.com>
References: <1385087849-30272-1-git-send-email-Qi.Chen@windriver.com>
	<6163089.YiV9QuLgku@helios> <529DB651.2080505@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] webmin: fix failures in do_install task
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
X-List-Received-Date: Tue, 03 Dec 2013 11:02:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 03 December 2013 18:45:37 ChenQi wrote:
> On 12/03/2013 06:19 PM, Paul Eggleton wrote:
> > On Friday 22 November 2013 10:37:29 Qi.Chen@windriver.com wrote:
> >> -    export perl=perl
> >> +    export perl=${OECMAKE_PERLNATIVE_DIR}/perl
> > 
> > I'm afraid I don't like the look of this - OECMAKE_PERLNATIVE_DIR is set
> > for use by cmake, and perlnative.bbclass should be putting our perl
> > binary into PATH so it should be run anyway. Is this change actually
> > necessary?
> 
> Please drop this patch. I found that the do_install task in webmin runs
> some perl scripts (e.g. postinstall.pl and enable-collections.pl) that
> are supposed to be run on target. I suspect webmin has never worked
> correctly on target as a result. I'm gonna propose another fix. The goal
> is to make it work on target.

I can assure you that it has worked on the target; at least it did about 6 
months ago (perhaps more by chance rather than design though).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

