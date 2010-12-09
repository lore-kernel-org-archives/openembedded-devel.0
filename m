Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PQhYc-0000Wa-0q
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 15:33:18 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PQhX6-0004eb-3R by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 15:31:49 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PQhX4-0007Yn-C5
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 15:31:42 +0100
Date: Thu, 9 Dec 2010 15:31:41 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101209143141.GB29826@excalibur.local>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
	<1291732373-17953-2-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1291732373-17953-2-git-send-email-GNUtoo@no-log.org>
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
Subject: Re: [PATCH 1/4] Add initial support for iphone3g(machine config and kernel)
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
X-List-Received-Date: Thu, 09 Dec 2010 14:33:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-12-07 at 15:32, Denis 'GNUtoo' Carikli wrote:
> Android was ported to Apple's iDevices including the iPhone3G by the
> iDroid Project ( http://www.idroidproject.org/wiki/Main_Page )
> Their kernel is standard enough to be able to run GNU/Linux distributions
>   such as SHR
> 
> Signed-off-by: Chris 'Lopi' Spehn <chris.spehn@gmail.com>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
>  conf/machine/iphone3g.conf                    |   27 +
>  recipes/linux/linux-iphone/iphone3g/defconfig | 1570 +++++++++++++++++++++++++
>  recipes/linux/linux-iphone_git.bb             |   15 +

I usually split this up in twpo commits. One for the amchine file the other one
for the kernel. No strong feelings on this though.

>  3 files changed, 1612 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/iphone3g.conf
>  create mode 100755 recipes/linux/linux-iphone/iphone3g/defconfig
>  create mode 100644 recipes/linux/linux-iphone_git.bb
> 
> diff --git a/conf/machine/iphone3g.conf b/conf/machine/iphone3g.conf
> new file mode 100644
> index 0000000..f2c3196
> --- /dev/null
> +++ b/conf/machine/iphone3g.conf
> @@ -0,0 +1,27 @@
> +#@TYPE: Machine
> +#@NAME: iPhone3G
> +#@DESCRIPTION: Machine configuration for the iPhone3G
> +
> +TARGET_ARCH = "arm"
> +
> +require conf/machine/include/tune-arm1176jzf-s.inc
> +
> +MACHINE_DISPLAY_WIDTH_PIXELS = "320"
> +MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
> +MACHINE_DISPLAY_ORIENTATION = "0"
> +
> +MACHINE_FEATURES = "kernel26 touchscreen screen wifi ext2 phone gps usbgadget bluetooth"

For what do you need ext2 here? Is the project that far that it actually
reflashes the device to run ext2 on the internal nand or does the iphone has a
secret SD controller I don't know about? :)

Machine and kernel recipes are looking good.

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


