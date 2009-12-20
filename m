Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NMCPW-0000xe-2I
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 04:24:49 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3FAE21B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 03:18:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Dec 2009 04:22:50 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
	<1261261596-19241-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1261261596-19241-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200912200422.50437.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 3/3] minimal: Add 'mplt' to DISTRO_FEATURES.
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
X-List-Received-Date: Sun, 20 Dec 2009 03:24:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 19 December 2009 23:26:36 Khem Raj wrote:
> * As minimal-uclibc includes minimal conf the
>   distro features get inherited. mplt is not
>   supported on uclibc yet. So we should disable
>   it for uclibc/mips based distros.

>  require conf/distro/minimal.conf
> +
> +# FEATURE SELECTION
> +##########################################################################
> ### +# We want images supporting the following features (for task-base)
>  +DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget
>  usbhost pci" +# Following features are for ARM and E500 based machines
> +DISTRO_FEATURES += "eabi"

maybe you want to use the oe filterout thing?


