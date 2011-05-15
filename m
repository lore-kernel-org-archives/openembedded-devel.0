Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLZQW-0008EL-Oc
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 13:24:00 +0200
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id B4259EA8A1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 13:21:06 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AoQ0AH22z01T4zkqPGdsb2JhbAAMiROOcY4PAQEBATeJIsAqhhkEkBGOdw
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="1729887995"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.247]) ([83.227.57.42])
	by ipb4.telenor.se with ESMTP; 15 May 2011 13:21:06 +0200
Message-ID: <4DCFB721.1030502@atmel.com>
Date: Sun, 15 May 2011 13:21:05 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305445399-4293-1-git-send-email-ulf.samuelsson@atmel.com>
	<1305445399-4293-2-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1305445399-4293-2-git-send-email-ulf.samuelsson@atmel.com>
Subject: Re: [PATCH 2/3] at91: Add support for at91cap9stk
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
X-List-Received-Date: Sun, 15 May 2011 11:24:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-05-15 09:43, ulf.samuelsson@atmel.com skrev:
Pls ignore this, since this patchset is the result of a flawed script.
BRE
Ulf Samuelsson

> From: Ulf Samuelsson<ulf.samuelsson@atmel.com>
>
> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@atmel.com>
> ---
>   conf/machine/at91cap9stk.conf |   21 +++++++++++++++++++++
>   1 files changed, 21 insertions(+), 0 deletions(-)
>   create mode 100644 conf/machine/at91cap9stk.conf
>
> diff --git a/conf/machine/at91cap9stk.conf b/conf/machine/at91cap9stk.conf
> new file mode 100644
> index 0000000..5a6385f
> --- /dev/null
> +++ b/conf/machine/at91cap9stk.conf
> @@ -0,0 +1,21 @@
> +#@TYPE: Machine
> +#@Name: Atmel AT91CAP9STK Development Platform
> +#@DESCRIPTION: Machine configuration for the at91cap9stk board with a at91cap9 processor
> +
> +include conf/machine/include/at91-2.6.38.inc
> +include conf/machine/include/at91-lcd.inc
> +
> +# Has linux config file in OpenEmbedded
> +#
> +# LINUX26_DEFCONFIG = "at91cap9stk_defconfig"
> +
> +
> +# Supported u-boot machines
> +UBOOT_MACHINE = "at91cap9adk_config"
> +
> +UBOOT_MACHINES = " at91cap9adk "
> +
> +AT91BOOTSTRAP_BOARD = " at91cap9stk at91cap9stkdf at91cap9stkf "
> +
> +MACHINE_FEATURES += " usbhost "
> +



