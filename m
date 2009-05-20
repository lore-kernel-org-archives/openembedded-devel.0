Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M6ra6-0006Yn-7S
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 21:36:02 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJY0071ZJF8BO56@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 May 2009 14:28:21 -0500 (CDT)
Received: from localhost (unknown [32.164.124.16])
	by gandalf.denix.org (Postfix) with ESMTPA id A82B314AF1F	for
	<openembedded-devel@lists.openembedded.org>; Wed,
	20 May 2009 15:28:19 -0400 (EDT)
Sender: denis@denix.org
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
MIME-version: 1.0
Message-id: <200905201528180000@3248121022>
X-Mailer: FlexMail 4
Date: Wed, 20 May 2009 15:28:18 -0400
Subject: Re: [STABLE][PATCH] kernel, module-base class, bitbake.conf: introduce MACHINE_KERNEL_PR
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
X-List-Received-Date: Wed, 20 May 2009 19:36:02 -0000
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 8bit

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ------- Original Message -------
> From: Koen Kooi <koen.kooi@gmail.com>
> To: openembedded-devel@lists.openembedded.org
> Sent: 20-May-09, 14:51:23
> Subject: [oe] [STABLE][PATCH] kernel, module-base class,bitbake.conf: introduce MACHINE_KERNEL_PR
> 
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  classes/kernel.bbclass      |    4 ++++
>  classes/module-base.bbclass |    4 ++++
>  conf/bitbake.conf           |    4 ++++
>  3 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 17e8941..954c407 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -64,6 +64,10 @@ export CMDLINE_CONSOLE = "console=${@bb.data.getVar("KERNEL_CONSOLE",d,1) or "tt
>  KERNEL_VERSION = "${@get_kernelversion('${S}')}"
>  KERNEL_MAJOR_VERSION = "${@get_kernelmajorversion('${KERNEL_VERSION}')}"
>  
> +# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> +# rebuilds for kernel and external modules
> +PR = "${MACHINE_KERNEL_PR}"
> +
>  KERNEL_LOCALVERSION ?= ""
>  
>  # kernels are generally machine specific
> diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
> index c98bace..bc53e1b 100644
> --- a/classes/module-base.bbclass


