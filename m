Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAAC65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 01:57:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAC1vf5D011402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 17:57:41 -0800 (PST)
Received: from [128.224.163.178] (128.224.163.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Nov 2014 17:57:41 -0800
Message-ID: <5462BE93.1010001@windriver.com>
Date: Wed, 12 Nov 2014 09:57:39 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1415351679-6838-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1415351679-6838-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] ebtables: make it be able to work on 64bit kernel with 32 bit userspace
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
X-List-Received-Date: Wed, 12 Nov 2014 01:57:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please drop this, I have a refine patch for this issue.

-Roy

On 2014年11月07日 17:14, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
>
> KERNEL_64_USERSPACE_32 should be enabled for 64bit kernel with 32 bit userspace,
> otherwise, the date struct(struct ebt_replace, struct ebt_entry_match) have
> different alignment size, will make it unable to work.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index 32cfc75..9b04d1b 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -27,6 +27,16 @@ S = "${WORKDIR}/ebtables-v${PV}"
>
>   inherit update-rc.d systemd
>
> +python __anonymous () {
> +    import re
> +
> +    multilib=d.getVar('MLPREFIX', True) or ""
> +    searchstr = "lib.?32"
> +    reg = re.compile(searchstr)
> +    if reg.search(multilib):
> +        d.appendVar('CFLAGS' ,' -DKERNEL_64_USERSPACE_32 -DEBT_MIN_ALIGN=8')
> +}
> +
>   EXTRA_OEMAKE = " \
>           BINDIR=${base_sbindir} \
>           MANDIR=${mandir} \
>

-- 
Best Reagrds,
Roy | RongQing Li

