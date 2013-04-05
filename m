Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOGIg-0000TQ-Es
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:44:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2013 16:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,418,1363158000"; d="scan'208";a="317640515"
Received: from unknown (HELO helios.localnet) ([10.255.13.194])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2013 16:26:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Sat, 06 Apr 2013 00:26:47 +0100
Message-ID: <1905062.yRs8T87gNI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 0/6] minor fixes for Zaurus
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
X-List-Received-Date: Fri, 05 Apr 2013 23:44:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 06 April 2013 00:00:30 Andrea Adami wrote:
> Spring-cleanings of obsolete variables and removal of machines
> which can be built as spitz or c7x0
> 
> Andrea Adami (6):
>   linux-yocto-3.8: remove cruft (to-do about regulators)
>   zaurus: remove u-boot remnants from akita/spitz/c7x0 configs
>   zaurus: remove obsolete ROOT_FLASH_SIZE
>   zaurus: add note about mtdparts of tosa
>   zaurus: remove configurations of models aliased by c7x0 and spitz
>   zaurus: add README.zaurus, about flashing kernel, JFFS2 and UBIFS
>     images
> 
>  README.zaurus              | 88
> ++++++++++++++++++++++++++++++++++++++++++++++ conf/machine/akita.conf    |
>  5 ---
>  conf/machine/borzoi.conf   |  2 --
>  conf/machine/boxer.conf    |  2 --
>  conf/machine/c7x0.conf     |  8 -----
>  conf/machine/collie.conf   |  2 --
>  conf/machine/corgi.conf    |  3 --
>  conf/machine/husky.conf    |  2 --
>  conf/machine/poodle.conf   |  2 --
>  conf/machine/shepherd.conf |  3 --
>  conf/machine/spitz.conf    |  9 -----
>  conf/machine/terrier.conf  |  2 --
>  conf/machine/tosa.conf     |  3 +-
>  13 files changed, 90 insertions(+), 41 deletions(-)
>  create mode 100644 README.zaurus
>  delete mode 100644 conf/machine/borzoi.conf
>  delete mode 100644 conf/machine/boxer.conf
>  delete mode 100644 conf/machine/corgi.conf
>  delete mode 100644 conf/machine/husky.conf
>  delete mode 100644 conf/machine/shepherd.conf
>  delete mode 100644 conf/machine/terrier.conf
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/REGULATORS

Merged these six and the mtd-rw patch, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


