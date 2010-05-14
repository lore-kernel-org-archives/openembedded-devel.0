Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OCtuS-0005XZ-BH
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 14:22:32 +0200
Received: from p5b035847.dip.t-dialin.net ([91.3.88.71] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OCtqe-000718-6w by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 14:18:38 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OCtqd-00088d-0V
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 14:18:35 +0200
Date: Fri, 14 May 2010 14:18:34 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100514121834.GG3507@excalibur.local>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5 v2] xilinx-ml507: add screen option
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
X-List-Received-Date: Fri, 14 May 2010 12:22:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-05-13 at 08:46, Adrian Alonso wrote:
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  conf/machine/xilinx-ml507.conf |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
> index 693f904..8c888b2 100644
> --- a/conf/machine/xilinx-ml507.conf
> +++ b/conf/machine/xilinx-ml507.conf
> @@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx-ml507"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> -MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
> +MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet screen"
>  MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
>  
>  UBOOT_ARCH = "ppc"
> @@ -30,7 +30,7 @@ PREFERRED_VERSION_u-boot_xilinx-ml507 = "git"
>  # XILINX_BOARD = "ml507"
>  
>  # Don't use tty1
> -USE_VT = "0"
> +# USE_VT = "0"

This unrelated hunk not mentioned in the changelog. Is it there by mistake?

If there is a reason for it please state it in the changelog and resend.

regards
Stefan Schmidt


