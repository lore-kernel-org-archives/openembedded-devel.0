Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RmA7i-0007SK-Mp
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jan 2012 21:22:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2012 12:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="96520603"
Received: from unknown (HELO helios.localnet) ([10.252.122.112])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2012 12:15:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 14 Jan 2012 20:15:09 +0000
Message-ID: <2408912.CWDOmQDkdr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <cover.1326481985.git.Martin.Jansa@gmail.com>
References: <cover.1326481985.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 0/4] Kernel upgrade and small fixes
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
X-List-Received-Date: Sat, 14 Jan 2012 20:22:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 January 2012 20:40:47 Martin Jansa wrote:
> The following changes since commit d76030c7744dfb480c8d43073762d11dcae4893a:
> 
>   linux(-kexecboot): upgrade from 3.1.6 to 3.1.7 (2012-01-05 08:49:23 +0000)
> 
> are available in the git repository at:
>   git://gitorious.org/shr/meta-handheld jansa/pull
> 
> Martin Jansa (4):
>   zaurus.inc: weak assignment to IMAGE_FSTYPES
>   linux(-kexecboot)-git: upgrade to 3.2.0-rc7
>   linux(-kexecboot)-3.2: add 3.2.1 for spitz
>   linux(-kexecboot)-3.1: move common stuff like SRC_URI and checksums
>     to .inc file
> 
>  conf/machine/include/zaurus.inc                    |    2 +-
>  recipes-kernel/linux/linux-3.1.inc                 |   19 +
>  recipes-kernel/linux/linux-3.2.inc                 |   14 +
>  recipes-kernel/linux/linux-3.2/spitz/defconfig     |  384
> ++++++++++++++++++++ recipes-kernel/linux/linux-git.inc                 |  
>  4 +-
>  .../linux/linux-kexecboot-3.2/spitz/defconfig      |  128 +++++++
>  recipes-kernel/linux/linux-kexecboot_3.1.bb        |   21 +-
>  recipes-kernel/linux/linux-kexecboot_3.2.bb        |    5 +
>  recipes-kernel/linux/linux-kexecboot_git.bb        |    2 +
>  recipes-kernel/linux/linux/spitz/defconfig         |    7 +
>  recipes-kernel/linux/linux_3.1.bb                  |   21 +-
>  recipes-kernel/linux/linux_3.2.bb                  |    4 +
>  recipes-kernel/linux/linux_git.bb                  |    2 +
>  13 files changed, 570 insertions(+), 43 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-3.1.inc
>  create mode 100644 recipes-kernel/linux/linux-3.2.inc
>  create mode 100644 recipes-kernel/linux/linux-3.2/spitz/defconfig
>  create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
> create mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bb
>  create mode 100644 recipes-kernel/linux/linux_3.2.bb

Merged to meta-handheld master, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


