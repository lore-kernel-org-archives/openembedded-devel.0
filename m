Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 659C860043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 12:39:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 18 Aug 2015 05:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,701,1432623600"; d="scan'208";a="627654474"
Received: from jburrows-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.34])
	by orsmga003.jf.intel.com with ESMTP; 18 Aug 2015 05:39:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Amit Chaudhuri <amit.k.chaudhuri@gmail.com>
Date: Tue, 18 Aug 2015 13:39:15 +0100
Message-ID: <119994489.EziVMMmOMT@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.4-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAH=VbNdYaP+Q7e0JduUG9i7i64hZjre3bPZLaWErhDXW1KHwTQ@mail.gmail.com>
References: <CAH=VbNdYaP+Q7e0JduUG9i7i64hZjre3bPZLaWErhDXW1KHwTQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] inconsistency between autotests and ssh support
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
X-List-Received-Date: Tue, 18 Aug 2015 12:39:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Amit,

On Tuesday 18 August 2015 09:34:44 Amit Chaudhuri wrote:
> I am experimenting with tools-profile and qemux86 and qemuarm. Autotest
> failures make me think there is an inconsistency in the recipes and
> possibly also somewhere in the docs.
> 
> I was under the impression (from docs?) that core-image-base would add ssh
> support so I switched from core-image-minimal. Whether I was looking in the
> wrong version of docs or not, the failure of the autotests makes me think
> there is a problem. Examining the ssh log listed in the test output I can
> see multiple "connection refused on port 22" messages" and there is clearly
> no ssh server in the image. The test output shows that some tests are
> indeed skipped because the system knows ssh is not present. But multiple
> other tests are not skipped.
> 
> Same experience on both qemuarm and qemux86.
> 
> After greping to find ssh-server in a .bb file I switched again to
> core-image-full-cmdline and am now able to ssh in. I still get an error
> relating to something else, but ssh works fine.
> 
> With fido version:
> 
> meta              = "fido:6546771a502a09c63e33679be8784818be0ef93b"
> 
> The main changes I have made are to local.conf where I have:
> 
> MACHINE ??= "qemuarm"
> ....
> EXTRA_IMAGE_FEATURES = "dbg-pkgs tools-profile tools-debug debug-tweaks"

Since you're already setting EXTRA_IMAGE_FEATURES, just add 
"ssh-server-dropbear" or "ssh-server-openssh" to its value and you'll have SSH 
server support no matter which image you build.

I'm not sure where we'd have documented that core-image-base has an SSH server 
- at least I can't find such a reference.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

