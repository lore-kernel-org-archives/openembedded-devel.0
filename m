Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Txg6C-0002Us-43
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:49:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2013 07:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,515,1355126400"; d="scan'208";a="250726095"
Received: from unknown (HELO helios.localnet) ([10.252.123.171])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2013 07:33:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 22 Jan 2013 15:33:47 +0000
Message-ID: <1428986.60Q97QIsKC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 0/5] linux-yocto* recipes refinements
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
X-List-Received-Date: Tue, 22 Jan 2013 15:49:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 20 January 2013 23:11:26 Andrea Adami wrote:
> Apply some minor fixes as seen in oe-core an
> fix some wrong splitting for mtd fragments.
> 
> Andrea Adami (5):
>   linux-yocto-3.2: remove yaffs2 references from poodle.cfg
>   linux-yocto_3.2: convert ktype/standard to explicit
>     ktypes/standard/standard.scc
>   linux-yocto_3.4: convert ktype/standard to explicit
>     ktypes/standard/standard.scc
>   linux-kexecboot_3.2: convert ktype/tiny to explicit
>     ktypes/tiny/tiny.scc
>   linux-yocto_3.4: minor config cleanings towards 3.8
> 
>  .../linux/linux-yocto-3.2/akita/akita-standard.scc    |  2 +-
>  .../linux/linux-yocto-3.2/c7x0/c7x0-standard.scc      |  2 +-
>  .../linux/linux-yocto-3.2/collie/collie-standard.scc  |  2 +-
>  .../linux/linux-yocto-3.2/poodle/poodle-standard.scc  |  2 +-
>  .../linux/linux-yocto-3.2/poodle/poodle.cfg           |  1 -
>  .../linux/linux-yocto-3.2/spitz/spitz-standard.scc    |  2 +-
>  .../linux/linux-yocto-3.2/tosa/tosa-standard.scc      |  2 +-
>  .../linux/linux-yocto-3.4/akita/akita-standard.scc    |  2 +-
>  .../linux/linux-yocto-3.4/c7x0/c7x0-standard.scc      |  2 +-
>  .../linux/linux-yocto-3.4/collie/collie-standard.scc  |  2 +-
>  .../linux/linux-yocto-3.4/collie/collie.cfg           | 19
> ++++++++++++++----- .../linux/linux-yocto-3.4/poodle/poodle-standard.scc  |
>  2 +-
>  .../linux/linux-yocto-3.4/spitz/spitz-standard.scc    |  2 +-
>  .../linux/linux-yocto-3.4/tosa/tosa-standard.scc      |  2 +-
>  .../linux/linux-yocto-3.4/zaurus-hardware.cfg         |  9 ++++++---
>  .../linux/linux-yocto-3.4/zaurus-non-hardware.cfg     |  9 ++++++++-
>  .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg       | 10 ----------
>  .../akita/akita-tiny.scc                              |  2 +-
>  .../linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc |  2 +-
>  .../collie/collie-tiny.scc                            |  2 +-
>  .../poodle/poodle-tiny.scc                            |  2 +-
>  .../spitz/spitz-tiny.scc                              |  2 +-
>  .../linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc |  2 +-
>  23 files changed, 46 insertions(+), 38 deletions(-)

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


