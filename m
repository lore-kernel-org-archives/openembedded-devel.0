Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TZ1XI-0003V7-Nz
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 16:39:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2012 07:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,258,1352102400"; d="scan'208";a="242712572"
Received: from unknown (HELO helios.localnet) ([10.252.122.197])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2012 07:25:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
Date: Thu, 15 Nov 2012 15:25:24 +0000
Message-ID: <1413640.UNPzzlppx2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <50A4F6E6.9040507@nedap.com>
References: <50A4F6E6.9040507@nedap.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: llvm issue
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
X-List-Received-Date: Thu, 15 Nov 2012 15:39:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 15 November 2012 15:06:30 Jaap de Jong wrote:
> when I checkout openjdk-7 on meta-java and bitbake <anything> I get
> these errors:
> 
> ERROR: Unable to parse
> /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm
> 2.9_2.9.bb
> | ETA:  00:00:15
> 
> ERROR: Command execution failed: Exited with 1
> NOTE: Error expanding variable populate_packages
> NOTE: Error during finalise of
> /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm
> 2.8_2.8.bb NOTE: Error expanding variable populate_packages
> NOTE: Error during finalise of
> /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm
> 2.9_2.9.bb

Are you using the denzil branch of OE-Core perhaps? I suspect meta-java has 
been updated to use spaces for python function indentation which only works 
with danny/master. I don't see a denzil branch in meta-java, perhaps it would 
be worth adding one...?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


