Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SMLcf-0006ci-SR
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 17:56:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2012 08:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="135704794"
Received: from unknown (HELO helios.localnet) ([10.252.120.11])
	by orsmga002.jf.intel.com with ESMTP; 23 Apr 2012 08:46:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 16:46:41 +0100
Message-ID: <2199708.NNXS638hI1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
References: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Subject: Re: [meta-kde][PATCH] qt4-x11-free 4.8.0 bbappend: fix GLES configure switch and turn it on for AM335x SoCs as well
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
X-List-Received-Date: Mon, 23 Apr 2012 15:56:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 April 2012 16:25:35 Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-misc-support/qt4-x11-free_4.8.0.bbappend |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend index b5a3c16..4895893
> 100644
> --- a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> +++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> @@ -1,7 +1,8 @@
> -QT_GLFLAGS_omap3 = "-egl"
> +QT_GLFLAGS_omap3 = "-opengl es2 "
>  DEPENDS_append_omap3 = " libgles-omap3"
> +DEPENDS_append_ti33x = " libgles-omap3"
> 
>  # Needed by kdelibs
>  QT_DISTRO_FLAGS = "-accessibility -sm"
> 
> -PRINC := "${@int(PRINC) + 1}"
> \ No newline at end of file
> +PRINC := "${@int(PRINC) + 2}"

Can we avoid this machine-specific stuff creeping into software layers? At least 
in this case we're appending something in OE-Core so there should be no 
problem with this appearing in an append in the BSP(s).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


