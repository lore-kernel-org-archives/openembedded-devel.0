Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TAfAv-0002Yz-E0
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 12:55:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Sep 2012 03:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,394,1344236400"; d="scan'208";a="190822922"
Received: from unknown (HELO helios.localnet) ([10.252.121.165])
	by orsmga001.jf.intel.com with ESMTP; 09 Sep 2012 03:43:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 09 Sep 2012 11:43:06 +0100
Message-ID: <6071251.PkDIszpbs0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347171642-22926-1-git-send-email-raj.khem@gmail.com>
References: <1347171642-22926-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] task-opie: Adjust for nativesdk renaming
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
X-List-Received-Date: Sun, 09 Sep 2012 10:55:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 08 September 2012 23:20:42 Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../tasks/task-opie-toolchain-host-nativesdk.bb    |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
> b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb index
> 5ca80e6..42138f1 100644
> --- a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
> +++ b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
> @@ -1,8 +1,8 @@
> -require recipes-core/tasks/task-sdk-host-nativesdk.bb
> +require recipes-core/tasks/nativesdk-task-sdk-host.bb
> 
>  DESCRIPTION = "Host packages for Opie SDK"
>  PR = "r2"
>  LICENSE = "MIT"
>  ALLOW_EMPTY = "1"
> 
> -RDEPENDS_${PN} += "qmake-nativesdk uicmoc-nativesdk"
> +RDEPENDS_${PN} += "nativesdk-qmake nativesdk-uicmoc"

This patch got merged to meta-opie master 5 days ago as 
180d4b32d553baf4de152c601f6ccc72a84aee73. Did you mean to send a different 
patch?

FYI I have some packagegroup renaming fixes queued, should be pushing today.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


