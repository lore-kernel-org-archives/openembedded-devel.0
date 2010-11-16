Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PISuT-0003b1-3N
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 22:17:50 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PIStN-00035H-4n from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 13:16:41 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 16 Nov 2010 13:16:40 -0800
Received: from [172.30.7.13] ([172.30.7.13]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 16 Nov 2010 14:16:39 -0700
Message-ID: <4CE2F4B4.5000105@mentor.com>
Date: Tue, 16 Nov 2010 14:16:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1289935585-26798-1-git-send-email-msmith@cbnco.com>
In-Reply-To: <1289935585-26798-1-git-send-email-msmith@cbnco.com>
X-OriginalArrivalTime: 16 Nov 2010 21:16:39.0178 (UTC)
	FILETIME=[8EDF3EA0:01CB85D3]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux 2.6.32: update from 2.6.32.9 to 2.6.32.25
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
X-List-Received-Date: Tue, 16 Nov 2010 21:17:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2010 12:26 PM, Michael Smith wrote:
> Signed-off-by: Michael Smith<msmith@cbnco.com>

While I like this conceptually, did you confirm that all of the machines 
that have additional patches still patch cleanly?

> ---
>   recipes/linux/linux_2.6.32.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/linux/linux_2.6.32.bb b/recipes/linux/linux_2.6.32.bb
> index f1f4cc8..0122759 100644
> --- a/recipes/linux/linux_2.6.32.bb
> +++ b/recipes/linux/linux_2.6.32.bb
> @@ -20,13 +20,13 @@ DEFAULT_PREFERENCE_bluepro = "1"
>   DEFAULT_PREFERENCE_topas910 = "1"
>
>   SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
> -           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.9.bz2;apply=yes;name=stablepatch \
> +           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.25.bz2;apply=yes;name=stablepatch \
>              file://defconfig"
>
>   SRC_URI[kernel.md5sum] = "260551284ac224c3a43c4adac7df4879"
>   SRC_URI[kernel.sha256sum] = "5099786d80b8407d98a619df00209c2353517f22d804fdd9533b362adcb4504e"
> -SRC_URI[stablepatch.md5sum] = "7f615dd3b4a3b19fb86e479996a2deb5"
> -SRC_URI[stablepatch.sha256sum] = "8aeb15c31fb09c769f004c8dc51e29aa26be8e84d70db418af70ecefc463459a"
> +SRC_URI[stablepatch.md5sum] = "d8fff54efff6c5f7b07e5370a5e9f119"
> +SRC_URI[stablepatch.sha256sum] = "402f740b25c6e69344219164250a1181c74bbc8bb25149b3a0fa8d818706f32f"
>
>   SRC_URI_append_at91sam9g45ek = " \
>   	file://at91/linux-2.6.32-001-configurable-nand-partitions.patch \


-- 
Tom Rini
Mentor Graphics Corporation


