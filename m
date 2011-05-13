Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QKwum-0004QS-VW
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:16:40 +0200
Received: from p4fc7654c.dip.t-dialin.net ([79.199.101.76]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QKws3-0003u5-4O by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 13 May 2011 20:13:53 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>)
	id 1QKws1-0002Di-B1; Fri, 13 May 2011 20:13:49 +0200
Date: Fri, 13 May 2011 20:13:48 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110513181348.GJ29302@excalibur.local>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-10-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290588-7057-10-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH 12/12] bug20.conf: switch to the 2.6.35 linaro kernel
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
X-List-Received-Date: Fri, 13 May 2011 18:16:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-05-13 at 14:43, Denis 'GNUtoo' Carikli wrote:
> This kenrel supports more features/devices:
>  * wifi power management works
>  * it supports more BMI modules(for instance bugsound, bugsense etc...)
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

> ---
>  conf/machine/bug20.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
> index 95ce49c..97369e3 100644
> --- a/conf/machine/bug20.conf
> +++ b/conf/machine/bug20.conf
> @@ -20,7 +20,7 @@ GUI_MACHINE_CLASS = "bigscreen"
>  
>  require conf/machine/include/omap3.inc
>  
> -PREFERRED_PROVIDER_virtual/kernel = "linux-omap-hah"
> +PREFERRED_PROVIDER_virtual/kernel = "linux-bug20-linaro"
>  
>  IMAGE_FSTYPES += "tar.bz2 ubi"
>  EXTRA_IMAGECMD_jffs2 = "-lnp "
> -- 
> 1.7.0.4
> 


