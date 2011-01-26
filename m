Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiB40-0005kJ-QF
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:29:57 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PiB3E-0005pX-O3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:29:08 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 11:29:08 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 12:29:07 -0700
Message-ID: <4D4075FF.2080104@mentor.com>
Date: Wed, 26 Jan 2011 12:29:03 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
	<1296066116-10466-2-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1296066116-10466-2-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 26 Jan 2011 19:29:07.0529 (UTC)
	FILETIME=[4CB7FB90:01CBBD8F]
Subject: Re: [PATCH 2/2] busybox: 2.4 module support for kernel24	MACHINE_FEATURES
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
X-List-Received-Date: Wed, 26 Jan 2011 19:29:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 11:21 AM, Bernhard Reutner-Fischer wrote:
> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/busybox/busybox-config.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/busybox/busybox-config.inc b/recipes/busybox/busybox-config.inc
> index 723ec0e..d4454b1 100644
> --- a/recipes/busybox/busybox-config.inc
> +++ b/recipes/busybox/busybox-config.inc
> @@ -18,6 +18,7 @@ def features_to_busybox_settings(d):
>   	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
>   	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>   	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
> +	busybox_cfg('kernel24', machine_features, 'CONFIG_FEATURE_2_4_MODULES', cnf, rem)
>   	return "\n".join(cnf), "\n".join(rem)
>   # X, Y = ${@features_to_uclibc_settings(d)}
>   # unfortunately doesn't seem to work with bitbake, workaround:


-- 
Tom Rini
Mentor Graphics Corporation


