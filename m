Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLZQD-0008Ds-RU
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 13:23:41 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id E400AEABBF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 13:20:50 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuYcAH22z01T4zkqPGdsb2JhbAAMmASODwEBAQE3vTMBjBiGGQSQEY53
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="188319948"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.247]) ([83.227.57.42])
	by ipb2.telenor.se with ESMTP; 15 May 2011 13:20:50 +0200
Message-ID: <4DCFB711.6020104@atmel.com>
Date: Sun, 15 May 2011 13:20:49 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305445399-4293-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1305445399-4293-1-git-send-email-ulf.samuelsson@atmel.com>
Subject: Re: [PATCH 1/3] at91: support linux-2.6.30 exp.4 patchset
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
X-List-Received-Date: Sun, 15 May 2011 11:23:42 -0000
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
>   recipes/linux/linux_2.6.30.bb |   62 ++++++++++++++++++++++------------------
>   1 files changed, 34 insertions(+), 28 deletions(-)
>
> diff --git a/recipes/linux/linux_2.6.30.bb b/recipes/linux/linux_2.6.30.bb
> index 4313e36..a49246c 100644
> --- a/recipes/linux/linux_2.6.30.bb
> +++ b/recipes/linux/linux_2.6.30.bb
> @@ -26,25 +26,51 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=ke
>              file://aufs2-30.patch \
>              file://defconfig"
>
> -SRC_URI_at91sam9m10ekes = " \
> +AT91_EXPERIMENTAL_4 = " \
>   	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
>   	   http://maxim.org.za/AT91RM9200/2.6/${PV}-at91.patch.gz;apply=no;name=at91patch \
>   	   ftp://www.at91.com/pub/linux/${PV}-at91/${PV}-at91-exp.${AT91_EXPERIMENTAL}.tar.gz;apply=no;name=at91exp${AT91_EXPERIMENTAL} \
> -	   file://at91/exp.${AT91_EXPERIMENTAL}/0001-Configurable-partition-size.patch;apply=yes \
> -	   file://at91/exp.${AT91_EXPERIMENTAL}/0002-mach-at91-KConfig-cleanup.patch;apply=yes \
> +	
...



