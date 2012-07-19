Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Srtcn-0006Rw-40
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 18:30:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Jul 2012 09:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124407203"
Received: from unknown (HELO helios.localnet) ([10.252.121.21])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Jul 2012 09:19:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:19:24 +0100
Message-ID: <3279127.EVWoIJEKcV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1342430720-4501-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342430720-4501-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] recipes: svn SRC_URI s/proto=/protocol=/g
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
X-List-Received-Date: Thu, 19 Jul 2012 16:30:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 16 July 2012 11:25:20 Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-bsp/ezx/ezx-gpiotool_svn.bb |    2 +-
>  recipes-bsp/ezx/ezxd_svn.bb         |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ezx/ezx-gpiotool_svn.bb
> b/recipes-bsp/ezx/ezx-gpiotool_svn.bb index 2d403de..ed733a2 100644
> --- a/recipes-bsp/ezx/ezx-gpiotool_svn.bb
> +++ b/recipes-bsp/ezx/ezx-gpiotool_svn.bb
> @@ -7,7 +7,7 @@ SRCREV = "1877"
>  PV = "${SRCPV}"
>  PR = "r1"
> 
> -SRC_URI =
> "svn://svn.openezx.org/trunk/src/userspace;module=gpiotool;proto=http"
> +SRC_URI =
> "svn://svn.openezx.org/trunk/src/userspace;module=gpiotool;protocol=http" S
> = "${WORKDIR}/gpiotool"
> 
>  do_compile() {
> diff --git a/recipes-bsp/ezx/ezxd_svn.bb b/recipes-bsp/ezx/ezxd_svn.bb
> index f738b5f..6dbcd0f 100644
> --- a/recipes-bsp/ezx/ezxd_svn.bb
> +++ b/recipes-bsp/ezx/ezxd_svn.bb
> @@ -7,7 +7,7 @@ SRCREV = "2513"
>  PV = "0.0+svnr${SRCPV}"
>  PR = "r4"
> 
> -SRC_URI =
> "svn://svn.openezx.org/trunk/src/userspace/;module=ezxd;proto=http \
> +SRC_URI =
> "svn://svn.openezx.org/trunk/src/userspace/;module=ezxd;protocol=http \
> file://ezxd.init \
>            "

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


