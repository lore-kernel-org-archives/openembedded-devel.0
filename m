Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6A86B5B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 10:19:57 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2013 03:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,919,1367996400"; d="scan'208";a="284257481"
Received: from unknown (HELO helios.localnet) ([10.252.122.243])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2013 03:19:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 11:19:42 +0100
Message-ID: <4150203.tKR683lnPA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAJTo0LYFNSGhEjjMLTO4zTSTMXQC+vnxada0nb+EaVWWnn9Rxw@mail.gmail.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<5211762A.3020201@windriver.com>
	<CAJTo0LYFNSGhEjjMLTO4zTSTMXQC+vnxada0nb+EaVWWnn9Rxw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC PATCH 01/13] meta-filesystems creation
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
X-List-Received-Date: Tue, 20 Aug 2013 10:19:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ross,

On Tuesday 20 August 2013 09:36:59 Burton, Ross wrote:
> On 19 August 2013 02:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> > gitpkgv.bbclass is in meta-oe.
> 
> Is this the only part of meta-oe that meta-filesystems needs?  If it's
> genuinely useful should we this be considered for oe-core?

FYI, Richard rejected this class going into OE-Core some time ago. The correct 
way to get this functionality supported in the core is to add the 
functionality to the fetcher:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2872

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

