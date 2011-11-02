Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RLi3F-0007RA-Sy
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 22:08:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Nov 2011 14:02:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,445,1315206000"; d="scan'208";a="80600718"
Received: from unknown (HELO helios.localnet) ([10.252.121.83])
	by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2011 14:02:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 02 Nov 2011 21:02:37 +0000
Message-ID: <1691080.2lVjPomeYY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <1319524046-22472-1-git-send-email-Martin.Jansa@gmail.com>
References: <1319524046-22472-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-handheld] linux.inc: be more strict in CONF_SED_SCRIPT
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
X-List-Received-Date: Wed, 02 Nov 2011 21:08:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 October 2011 08:27:26 Martin Jansa wrote:
> * without this ARM_THUMB is also removing ARM_THUMBEE from
>   defconfig and not setting it back
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-kernel/linux/linux.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
> index 7a25b59..781d5ba 100644
> --- a/recipes-kernel/linux/linux.inc
> +++ b/recipes-kernel/linux/linux.inc
> @@ -24,7 +24,7 @@ LOCALVERSION ?= ""
> 
>  #kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
>  kernel_conf_variable() {
> -	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1/d;"
> +	CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
>  	if test "$2" = "n"
>  	then
>  		echo "# CONFIG_$1 is not set" >> ${S}/.config

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


