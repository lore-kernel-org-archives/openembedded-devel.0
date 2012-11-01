Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TTrqc-0004Fn-J3
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 11:18:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Nov 2012 03:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,692,1344236400"; d="scan'208";a="213898576"
Received: from unknown (HELO helios.localnet) ([10.252.122.134])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2012 03:04:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Xin Ouyang <Xin.Ouyang@windriver.com>
Date: Thu, 01 Nov 2012 10:04:20 +0000
Message-ID: <96557201.USfTQflqlK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1351734166-8711-2-git-send-email-Xin.Ouyang@windriver.com>
References: <1351734166-8711-1-git-send-email-Xin.Ouyang@windriver.com>
	<1351734166-8711-2-git-send-email-Xin.Ouyang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking 2/2] netperf: uprev to 2.6.0
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
X-List-Received-Date: Thu, 01 Nov 2012 10:18:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 01 November 2012 09:42:46 Xin Ouyang wrote:
> Also fix license, summary and patches.
> 
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>

These two patches should really be squashed into one - this is the convention 
we've established for importing recipes from OE-Classic (as long as "Import 
from OE-Classic" or similar is mentioned somewhere in the commit message).

> --- a/meta-networking/recipes-support/netperf/netperf_2.4.4.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -1,14 +1,19 @@
> -DESCRIPTION="Network performance benchmark including tests for TCP, UDP,
> sockets, ATM and more."
> +SUMMARY = "A networking benchmarking tool"
> +DESCRIPTION = "Network performance benchmark including tests for TCP, UDP,
> sockets, ATM and more."
> SECTION = "console/network"
>  HOMEPAGE = "http://www.netperf.org/"
> -LICENSE = "netperf"
> -PR = "r3"
> +LICENSE = "HP"

There's no standard license known as "HP" so "netperf" for LICENSE is correct 
- it means it's a license specific to the netperf software package.

> +LICENSE_FLAGS = "commercial"

Good point - I think many would miss the non-commercial use only clause in the 
license otherwise.

> +SRC_URI[md5sum] = "9654ffdfd4c4f2c93ce3733cd9ed9236"
> +SRC_URI[sha256sum] =
> "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"

I think we prefer to put these next to SRC_URI these days (or at least I do).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


