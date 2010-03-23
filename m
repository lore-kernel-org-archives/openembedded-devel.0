Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttPL-0003PZ-Bg
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 02:59:52 +0100
Received: (qmail 3236 invoked by uid 1003); 23 Mar 2010 01:56:41 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 01:56:41 -0000
Message-ID: <4BA81FD7.3030204@balister.org>
Date: Mon, 22 Mar 2010 21:56:39 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269255790-13046-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269255790-13046-2-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269255790-13046-2-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] bug20: initial configuration for BUG 2.0 device
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
X-List-Received-Date: Tue, 23 Mar 2010 01:59:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 03/22/2010 07:03 AM, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> Currently it is at prototype phase so company internal only.
>
> Kernel recipe will not be added into OE for now.
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> ---
>   conf/machine/bug20.conf |   47 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 files changed, 47 insertions(+), 0 deletions(-)
>   create mode 100644 conf/machine/bug20.conf
>
> diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
> new file mode 100644
> index 0000000..dbc1faf
> --- /dev/null
> +++ b/conf/machine/bug20.conf
> @@ -0,0 +1,47 @@
> +#@TYPE: Machine
> +#@NAME: BUG 2.0
> +#@DESCRIPTION: Machine configuration for the BUG 2.0 board (OMAP3530 based)
> +TARGET_ARCH = "arm"
> +
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +XSERVER = "xserver-xorg \
> +           xserver-xorg-extension-dri \
> +           xserver-xorg-extension-glx \
> +           xf86-input-evdev \
> +           xf86-input-mouse \
> +           xf86-video-omapfb \
> +           xf86-input-keyboard"
> +
> +# Only has DVI connector for external screen
> +GUI_MACHINE_CLASS = "bigscreen"
> +
> +require conf/machine/include/omap3.inc
> +
> +# this kernel is not provided in OE yet
> +PREFERRED_PROVIDER_virtual/kernel = "linux-omap-hah"
> +
> +IMAGE_FSTYPES += "tar.bz2"
> +
> +SERIAL_CONSOLE = "115200 ttyS2"
> +
> +UBOOT_MACHINE = "omap3_bug_config"
> +
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# From dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: logical eraseblock size:    129024 bytes
> +# from ubiattach stdout:
> +# UBI device number 0, total 1996 LEBs
> +MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
> +
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# from dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> +# UBI: sub-page size:              512
> +UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
> +
> +PREFERRED_VERSION_u-boot = "git"
> +
> +# and sdio
> +MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"


