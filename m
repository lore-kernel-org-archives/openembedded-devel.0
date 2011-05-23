Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QOZIQ-0000R9-Kq
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 19:52:02 +0200
Received: from p4fc769fe.dip.t-dialin.net ([79.199.105.254]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QOZFW-0005fm-8L by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 19:49:04 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>) id 1QOZFV-0007Ax-GS
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 19:49:01 +0200
Date: Mon, 23 May 2011 19:49:01 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110523174901.GC23439@excalibur.local>
References: <1305984274-18073-1-git-send-email-GNUtoo@no-log.org>
	<1305984274-18073-2-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305984274-18073-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 2/2] bug20.conf: override the omap3 kernel PR and bump PR
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
X-List-Received-Date: Mon, 23 May 2011 17:52:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2011-05-21 at 15:24, Denis 'GNUtoo' Carikli wrote:
> The bug20 uses a different kernel than the one defined in omap3.inc
>   So the PR should be independant of omap3.inc.
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

> ---
>  conf/machine/bug20.conf |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
> index 97369e3..2d80e82 100644
> --- a/conf/machine/bug20.conf
> +++ b/conf/machine/bug20.conf
> @@ -21,6 +21,7 @@ GUI_MACHINE_CLASS = "bigscreen"
>  require conf/machine/include/omap3.inc
>  
>  PREFERRED_PROVIDER_virtual/kernel = "linux-bug20-linaro"
> +MACHINE_KERNEL_PR = "r102"
>  
>  IMAGE_FSTYPES += "tar.bz2 ubi"
>  EXTRA_IMAGECMD_jffs2 = "-lnp "

regards
Stefan Schmidt


