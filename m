Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D50E4714D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 00:32:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ0WkZ2022006
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 16:32:47 -0800 (PST)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 16:32:46 -0800
Message-ID: <546BE52D.50003@windriver.com>
Date: Wed, 19 Nov 2014 08:32:45 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1416352369-166176-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1416352369-166176-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [meta-networking][PATCH] ebtables: make it be able to work on 64bit kernel with 32 bit userspace
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Nov 2014 00:32:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2014年11月19日 07:12, Mark Hatle wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
>
> [ This patch is being sent up for Yocto Project compliance.  I'm not sure it's generally applicable. ]
>

This patch has been merged into meta-oe, but it lead to x86-64 with 32bit
user space unable to work, I am see the root cause.


-Roy

>
> Some structs, which is used to communicate between user space and kernel,
> have the alignment issue on 64bit kernel with 32 bit userspace. To fix
> this issue, ebtables redefines these struct, not use the kernel(sysroot)
> include/uapi/linux/netfilter_bridge/ebtables.h, like ebt_entry_target:
>
> The kernel's:
> struct ebt_entry_target {
>          union {
>                  char name[EBT_FUNCTION_MAXNAMELEN];
>                  struct xt_target *target;
>          } u;
>          /* size of data */
>          unsigned int target_size;
>          unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
> };
>
> The ebtables:
> struct ebt_entry_target
> {
>          union {
>                  char name[EBT_FUNCTION_MAXNAMELEN];
>                  struct ebt_target *target;
>          } u;
>          /* size of data */
>          unsigned int target_size;
> |#ifdef KERNEL_64_USERSPACE_32
>          unsigned int pad;
> |#endif
>          unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
> };
>
> To make it work on 64bit kernel and 32bit userspace, KERNEL_64_USERSPACE_32
> is needed to be enabled.
>
> If the MLPREFIX of package matchs "lib.?32", the 32bit multilib  package on
> 64bit kernel is being built.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   recipes-filter/ebtables/ebtables_2.0.10-4.bb | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index 32cfc75..ca084e3 100644
> --- a/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -27,6 +27,17 @@ S = "${WORKDIR}/ebtables-v${PV}"
>
>   inherit update-rc.d systemd
>
> +python __anonymous () {
> +    import re
> +
> +    multilib = d.getVar('MLPREFIX', True)
> +    if multilib:
> +        searchstr = "lib.?32"
> +        reg = re.compile(searchstr)
> +        if reg.search(multilib):
> +            d.appendVar('CFLAGS' ,' -DKERNEL_64_USERSPACE_32 -DEBT_MIN_ALIGN=8')
> +}
> +
>   EXTRA_OEMAKE = " \
>           BINDIR=${base_sbindir} \
>           MANDIR=${mandir} \
>

-- 
Best Reagrds,
Roy | RongQing Li

