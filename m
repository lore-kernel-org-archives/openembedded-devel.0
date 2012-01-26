Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RqEIN-0006WW-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 02:38:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Jan 2012 17:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="60061961"
Received: from unknown (HELO helios.localnet) ([10.252.122.222])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Jan 2012 17:30:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jan 2012 01:30:44 +0000
Message-ID: <1665976.dBvtkiHpGU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
References: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld] [PATCH 0/3] do not force build of linux-kexecboot
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
X-List-Received-Date: Thu, 26 Jan 2012 01:38:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 January 2012 00:52:56 Andrea Adami wrote:
> * This patchset makes minor changes to the initramfs-kexecboot images
> * in order to make clear there are two binaries inside.
> * Following patches are Zaurus-specific and allow to build generic images
> * without building zaurus-installer (which builds linux-kexecboot)
> 
> Andrea Adami (3):
>   initramfs-kexecboot(-klibc)-image: explicitly install kexec(-klibc)
>   kexecboot-cfg: Inhibit toolchain dependencies and echo
>     $DISTRO_VERSION
>   zaurus.inc: decouple build of zaurus-installer (and linux-kexecboot)
> 
>  conf/machine/include/initramfs-kexecboot.inc       |   18
> ------------------ conf/machine/include/zaurus.inc                    |  
> 14 +++++++++----- recipes-bsp/images/initramfs-kexecboot-image.bb    |    2
> +-
>  .../images/initramfs-kexecboot-klibc-image.bb      |    2 +-
>  recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb         |    6 ++++--
>  5 files changed, 15 insertions(+), 27 deletions(-)
>  delete mode 100644 conf/machine/include/initramfs-kexecboot.inc

Merged to meta-handheld after some minor reworking of 3/3.

Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


