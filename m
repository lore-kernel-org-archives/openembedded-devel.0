Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RmpMF-0005Ae-Nq
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 17:24:38 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jan 2012 08:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107614231"
Received: from unknown (HELO helios.localnet) ([10.252.122.171])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2012 08:16:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jan 2012 16:16:43 +0000
Message-ID: <2636293.vMRAZY5Chk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
References: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld] [PATCH 0/3] [zaurus] rely on devtmpfs in kernel
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
X-List-Received-Date: Mon, 16 Jan 2012 16:24:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 16 January 2012 01:12:08 Andrea Adami wrote:
> * No need for static device tables when using devtmpfs.
> * The /dev directory must exist, though: kexecboot provides it
> * Bump to latest kexecboot to manage the empty /dev and
> * increase PR of linux-kexecboot to keep in synch.
> 
> Andrea Adami (3):
>   kexecboot_git: move to 8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7
>   linux-kexecboot: bump INC_PR to follow kexecboot upgrade
>   zaurus.inc: don't install device nodes, rely on devtmpfs
> 
>  conf/machine/include/zaurus.inc              |    2 ++
>  recipes-bsp/kexecboot/kexecboot-klibc_git.bb |    4 ++--
>  recipes-bsp/kexecboot/kexecboot.inc          |    3 ++-
>  recipes-bsp/kexecboot/kexecboot_git.bb       |    4 ++--
>  recipes-kernel/linux/linux-kexecboot.inc     |    2 +-
>  5 files changed, 9 insertions(+), 6 deletions(-)

Merged to meta-handheld master, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


