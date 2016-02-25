Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 045A9772B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 13:39:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2016 05:39:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="54606968"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2016 05:39:17 -0800
To: openembedded-devel@lists.openembedded.org
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
	<20160224164704.GH2560@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56CF0363.5070207@linux.intel.com>
Date: Thu, 25 Feb 2016 15:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160224164704.GH2560@jama>
Subject: Re: [PATCH 00/34] Initial gobject introspection support for meta-openembedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 13:39:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2016 06:47 PM, Martin Jansa wrote:
>
> Many people aren't using poky and don't want to play with combo-layer or
> format-patch/am combo to reapply the patches from poky repo to oe-core
> repo.
>
> As you're definitely used to such strange environment, can you please
> push corresponding branch for oe-core to openembedded-core-contrib repo
> as well?
>
> Thanks!
 >
> I should start reading the cover letters :), will remove this from
> master-next until openembedded-core-contrib branch is available.

I think you misunderstood my intent somewhat. I don't want you to queue 
these patches anywhere, they are preliminary. Their purpose is twofold:

1) People interested in playing and testing that poky branch with 
introspection may want to use recipes or whole layers from meta-oe as 
well (gupnp for instance).

2) I'd like to demonstrate to you that meta-oe will be taken care of 
when introspection lands in oe-core, because historically there's been 
some bad blood regarding those disruptive oe-core changes :)

However, I'm reluctant to provide the patchset for oe-contrib. The 
reason is that I've been maintaining the poky patchset since November; 
it's more or less rebasing, merge conflicts fixing and world rebuilding 
once every one or two weeks. I wouldn't want to duplicate this ongoing 
work for oe-contrib as well, and keep the two branches in sync, because 
I don't actually know when these patches make it to master. So if you 
want to try them out against pure oe-core, you have to extract and apply 
them by hand, I'm afraid. As a one-off task, it should not be complicated.

Alex

