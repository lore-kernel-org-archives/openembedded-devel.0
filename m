Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OUllg-0002YM-H2
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 21:19:21 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OUlh3-0000OM-Bf from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 12:14:33 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 2 Jul 2010 12:14:32 -0700
Received: from [172.30.80.212] ([172.30.80.212]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 2 Jul 2010 13:14:31 -0600
Message-ID: <4C2E3A92.7010504@mentor.com>
Date: Fri, 02 Jul 2010 12:14:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <> <1278091939-24947-1-git-send-email-jims@russound.com>
In-Reply-To: <1278091939-24947-1-git-send-email-jims@russound.com>
X-OriginalArrivalTime: 02 Jul 2010 19:14:32.0110 (UTC)
	FILETIME=[CD01A4E0:01CB1A1A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] allow KERNEL_IMAGEDEST to be redefined
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
X-List-Received-Date: Fri, 02 Jul 2010 19:19:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jim Sheldon wrote:
> Signed-off-by: Jim Sheldon <jims@russound.com>
> ---
>  classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index b0c6534..d9c9eed 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -59,7 +59,7 @@ KERNEL_LD = "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
>  
>  # Where built kernel lies in the kernel tree
>  KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> -KERNEL_IMAGEDEST = "boot"
> +KERNEL_IMAGEDEST ?= "boot"
>  
>  #
>  # configuration

OK, so there's nothing wrong with how this or the u-boot one are done, 
but why?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


