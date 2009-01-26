Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LRXqE-0002DJ-6J
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 21:13:54 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LRXix-0004o3-MV
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 20:06:23 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 20:06:23 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 20:06:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jan 2009 21:06:09 +0100
Message-ID: <gll53i$5s3$1@ger.gmane.org>
References: <f96d234e0901261011x1708a5cbra3334ceb18821f08@mail.gmail.com>	<glkvmu$gff$1@ger.gmane.org>
	<f96d234e0901261124j4352f43ar7c8fa936a59514bf@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <f96d234e0901261124j4352f43ar7c8fa936a59514bf@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: rm_work and building kernel modules
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
X-List-Received-Date: Mon, 26 Jan 2009 20:13:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-01-09 20:24, Cliff Brake wrote:
> On Mon, Jan 26, 2009 at 1:34 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 26-01-09 19:11, Cliff Brake wrote:
>>> I'm noticed a little glitch with rm_work and building kernel modules
>>> with OE.  Typically, kernel module builds require the kernel source to
>>> be intact, which gets removed if rm_work is enabled.
>> Which is why it's getting staged to STAGING_KERNEL_DIR, see module.bbclass.
>
> ok, thanks.  After digging a little more, it appears I developed this
> recipe on an older OE snapshot that did not have support for the new
> location of the asm/arch headers in 2.6.27.  Everything seems to work
> now.
>
> Would anyone be offended if I commit the below patch?  There may be
> some false positives, but would at least hopefully cut down on people
> copying the use of KERNEL_SOURCE for new module recipes.

Looks OK to me.

regards,

Koen

>
> Thanks,
> Cliff
>
> diff --git a/packages/ark3116/ark3116_0.4.1.bb
> b/packages/ark3116/ark3116_0.4.1.bb
> index 629c50a..33962ff 100644
> --- a/packages/ark3116/ark3116_0.4.1.bb
> +++ b/packages/ark3116/ark3116_0.4.1.bb
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   DESCRIPTION = "Driver for usb serial cables based upon ArkMicroChips
> 3116s chip"
>   HOMEPAGE = "http://avr.auctionant.de/ark3116_linux_driver/"
>   PRIORITY = "optional"
> diff --git a/packages/char-driver/char-driver.bb
> b/packages/char-driver/char-driver.bb
> index e6458b5..25245af 100644
> --- a/packages/char-driver/char-driver.bb
> +++ b/packages/char-driver/char-driver.bb
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   DESCRIPTION = "char-driver and userspace program"
>   PRIORITY = "optional"
>   SECTION = "base"
> diff --git a/packages/dri/drm-kernel_cvs.bb b/packages/dri/drm-kernel_cvs.bb
> index 7e0bddf..ee68bac 100644
> --- a/packages/dri/drm-kernel_cvs.bb
> +++ b/packages/dri/drm-kernel_cvs.bb
> @@ -1,3 +1,6 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory.  see modules.bbclass
> +
>   SECTION = "x11/base"
>   PR = "r3"
>   LICENSE = "MIT"
> diff --git a/packages/geode-drivers/geode-modules.inc
> b/packages/geode-drivers/geode-modules.inc
> index adaf885..9e78556 100644
> --- a/packages/geode-drivers/geode-modules.inc
> +++ b/packages/geode-drivers/geode-modules.inc
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   # Linux kernel modules OE build files for the AMD Geode GX5535/LX5536
>   # Copyright (C) 2005-2006, Advanced Micro Devices, Inc.  All Rights Reserved
>   # Released under the MIT license (see packages/COPYING)
> diff --git a/packages/gpio-event/gpio-event.bb
> b/packages/gpio-event/gpio-event.bb
> index afb2a77..52a5414 100644
> --- a/packages/gpio-event/gpio-event.bb
> +++ b/packages/gpio-event/gpio-event.bb
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   DESCRIPTION = "gpio-event driver and userspace program"
>   PRIORITY = "optional"
>   SECTION = "base"
> diff --git a/packages/pcmcia-cs/pcmcia-cs_3.2.8.bb
> b/packages/pcmcia-cs/pcmcia-cs_3.2.8.bb
> index 018f335..18a40c7 100644
> --- a/packages/pcmcia-cs/pcmcia-cs_3.2.8.bb
> +++ b/packages/pcmcia-cs/pcmcia-cs_3.2.8.bb
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   DESCRIPTION = "Utilities and system configuration files for the Linux
> PCMCIA card services"
>   SECTION = "base"
>   PRIORITY = "required"
> diff --git a/packages/pvrusb2-mci/pvrusb2-mci_20060903.bb
> b/packages/pvrusb2-mci/pvrusb2-mci_20060903.bb
> index 5bd4ea2..af877e2 100644
> --- a/packages/pvrusb2-mci/pvrusb2-mci_20060903.bb
> +++ b/packages/pvrusb2-mci/pvrusb2-mci_20060903.bb
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   require pvrusb2-mci2.inc
>
>   RRECOMMENDS = "kernel-module-tveeprom \
> diff --git a/packages/pvrusb2-mci/pvrusb2-mci_20080210.bb
> b/packages/pvrusb2-mci/pvrusb2-mci_20080210.bb
> index 5bd4ea2..af877e2 100644
> --- a/packages/pvrusb2-mci/pvrusb2-mci_20080210.bb
> +++ b/packages/pvrusb2-mci/pvrusb2-mci_20080210.bb
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   require pvrusb2-mci2.inc
>
>   RRECOMMENDS = "kernel-module-tveeprom \
> diff --git a/packages/pwc/pwc_10.0.12-rc1.bb b/packages/pwc/pwc_10.0.12-rc1.bb
> index af1d5f5..85e6ade 100644
> --- a/packages/pwc/pwc_10.0.12-rc1.bb
> +++ b/packages/pwc/pwc_10.0.12-rc1.bb
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   DESCRIPTION = "Philips USB Webcam driver for Linux that supports VGA
> resolution"
>   HOMEPAGE = "http://www.saillard.org/linux/pwc"
>   PRIORITY = "optional"
> diff --git a/packages/wifistix/wifistix-modules_5.0.16.p0.bb
> b/packages/wifistix/wifistix-modules_5.0.16.p0.bb
> index 0eb6877..f9e8503 100644
> --- a/packages/wifistix/wifistix-modules_5.0.16.p0.bb
> +++ b/packages/wifistix/wifistix-modules_5.0.16.p0.bb
> @@ -1,3 +1,6 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
>   DESCRIPTION = "Linux Driver for Marvel 88W8385 802.11b/g Wifi Module
> used in Gumstix daughtercards"
>   SECTION = "base"
>   PRIORITY = "optional"
> diff --git a/packages/wlan-ng/wlan-ng-modules.inc
> b/packages/wlan-ng/wlan-ng-modules.inc
> index 6dbadce..55fd026 100644
> --- a/packages/wlan-ng/wlan-ng-modules.inc
> +++ b/packages/wlan-ng/wlan-ng-modules.inc
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   DESCRIPTION = "linux-wlan-ng (prism2.x, prism3, pcmcia, pci, usb)
> driver for 11Mbps wireless lan cards"
>   HOMEPAGE = "http://www.linux-wlan.org"
>   SECTION = "kernel/modules"
> diff --git a/packages/wlan-ng/wlan-ng-utils.inc
> b/packages/wlan-ng/wlan-ng-utils.inc
> index 72976ce..92f25dc 100644
> --- a/packages/wlan-ng/wlan-ng-utils.inc
> +++ b/packages/wlan-ng/wlan-ng-utils.inc
> @@ -1,3 +1,7 @@
> +# FIXME, consider using kernel staging directory instead of
> KERNEL_SOURCE which is
> +# located in the work directory. see module.bbclass
> +
> +
>   DESCRIPTION = "linux-wlan-ng userland utilities"
>   HOMEPAGE = "http://www.linux-wlan.org"
>   SECTION = "kernel/userland"
>
>




