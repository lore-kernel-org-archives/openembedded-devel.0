Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QTDpr-0003aW-9Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 15:57:47 +0200
Received: (qmail invoked by alias); 05 Jun 2011 13:54:32 -0000
Received: from p5796359E.dip.t-dialin.net (EHLO localhost.localdomain)
	[87.150.53.158]
	by mail.gmx.net (mp072) with SMTP; 05 Jun 2011 15:54:32 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+MHEwxV8WMZJK0OMi37gutKsRUdPsupjpGk2mxc+
	FN6fPSEqNowlsD
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 5 Jun 2011 15:55:44 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-91.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <1306618191-3066-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1306618191-3066-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201106051555.45155.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] mx28evk: correct settings to make machine work
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
X-List-Received-Date: Sun, 05 Jun 2011 13:57:47 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday, May 28, 2011 11:29:51 PM Andreas Mueller wrote:
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  conf/machine/include/imx28.inc |    4 ++--
>  conf/machine/mx28evk.conf      |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/conf/machine/include/imx28.inc
> b/conf/machine/include/imx28.inc index 38248a8..b50f000 100644
> --- a/conf/machine/include/imx28.inc
> +++ b/conf/machine/include/imx28.inc
> @@ -10,8 +10,8 @@ MACHINE_KERNEL_PR = "r0"
> 
>  KERNEL_IMAGETYPE = "uImage"
> 
> -UBOOT_ENTRYPOINT = "0x8000"
> -UBOOT_LOADADDRESS = "0x8000"
> +UBOOT_ENTRYPOINT = "0x40008000"
> +UBOOT_LOADADDRESS = "0x40008000"
> 
>  EXTRA_IMAGEDEPENDS += "u-boot"
> 
> diff --git a/conf/machine/mx28evk.conf b/conf/machine/mx28evk.conf
> index e093ffa..823b502 100644
> --- a/conf/machine/mx28evk.conf
> +++ b/conf/machine/mx28evk.conf
> @@ -17,7 +17,7 @@ XSERVER = "xserver-kdrive-fbdev"
>  require conf/machine/include/imx28.inc
> 
>  # used by sysvinit_2
> -SERIAL_CONSOLE = "115200 ttymxc0"
> +SERIAL_CONSOLE = "115200 ttyAM0"
> 
>  ROOT_FLASH_SIZE = "128"
Can someone please take a care for this?

regards

Andreas


