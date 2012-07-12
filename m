Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sp7SY-0003iE-2s
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 02:40:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jul 2012 17:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121372236"
Received: from unknown (HELO helios.localnet) ([10.252.121.5])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jul 2012 17:29:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jul 2012 01:29:30 +0100
Message-ID: <13982356.l2K7RH0GMd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1342050050-8381-1-git-send-email-andrea.adami@gmail.com>
References: <1342045981-29287-1-git-send-email-andrea.adami@gmail.com>
	<1342050050-8381-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-initramfs][PATCH v2] formfactor: fix sed expression
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
X-List-Received-Date: Thu, 12 Jul 2012 00:40:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 July 2012 01:40:50 Andrea Adami wrote:
> * a last-minute check was added...with a missing '*'
> * don't add newline so we can easily test -s
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-bsp/formfactor/formfactor_0.0.bbappend |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> b/recipes-bsp/formfactor/formfactor_0.0.bbappend index e888ec1..b509028
> 100644
> --- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> +++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> @@ -1,11 +1,10 @@
> -PRINC := "${@int(PRINC) + 2}"
> +PRINC := "${@int(PRINC) + 3}"
> 
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> 
>  do_install_prepend () {
>  	# provide machine-specific /etc/rotation for psplash
> -	sed -n 's/^[ \t]DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc
> '[0-9]' > ${S}/rotation -	printf "\n" >> ${S}/rotation
> +	sed -n 's/^[ \t]*DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc
> '[0-9]' > ${S}/rotation }
> 
>  do_install_append () {

I've now merged the v2 into meta-handheld (not meta-initramfs) master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


