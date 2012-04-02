Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEfTO-0001rc-0f
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 13:30:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Apr 2012 04:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84277737"
Received: from unknown (HELO helios.localnet) ([10.252.123.252])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Apr 2012 04:21:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <Martin.Jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 02 Apr 2012 12:21:45 +0100
Message-ID: <3224381.VXlW3TLL1y@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
References: <cover.1333002899.git.Martin.Jansa@gmail.com>
	<082c61be8baa1e3b863ef083ff98ac97a6c594aa.1333002899.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 1/2] linux-git: drop setversion fix, it's fixed in kernel.bbclass now
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
X-List-Received-Date: Mon, 02 Apr 2012 11:30:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 29 March 2012 08:35:57 Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-kernel/linux/linux_git.bb |    9 ---------
>  1 files changed, 0 insertions(+), 9 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux_git.bb
> b/recipes-kernel/linux/linux_git.bb index 00d2d52..222df31 100644
> --- a/recipes-kernel/linux/linux_git.bb
> +++ b/recipes-kernel/linux/linux_git.bb
> @@ -18,15 +18,6 @@ SRC_URI =
> "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;
> 
>  S = "${WORKDIR}/git"
> 
> -do_configure_prepend() {
> -#otherwise it gets extra '+' "2.6.37+"
> -#because:
> -#$ scripts/setlocalversion . => +
> -#$ make kernelversion => 2.6.37
> -#$ make kernelrelease => 2.6.37+
> -  rm -rf ${S}/.git
> -}
> -
>  SRC_URI_append_akita = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
>  SRC_URI_append_c7x0 = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
>  SRC_URI_append_collie = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "

I've merged this one; the other seems a little contentious still so I'm 
leaving it for now.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


