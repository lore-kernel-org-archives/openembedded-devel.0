Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8oln-0001M9-I8
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Sep 2012 10:46:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2012 01:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,366,1344236400"; d="scan'208";a="188635097"
Received: from unknown (HELO helios.localnet) ([10.252.121.161])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2012 01:33:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 04 Sep 2012 09:33:39 +0100
Message-ID: <4375313.se78X6u4nf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1346733813-30069-1-git-send-email-raj.khem@gmail.com>
References: <1346733813-30069-1-git-send-email-raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 04 Sep 2012 08:46:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 21:43:33 Khem Raj wrote:
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

Merged to meta-opie master with a PR bump, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


