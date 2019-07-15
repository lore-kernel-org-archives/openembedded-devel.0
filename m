Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5362E7C5F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:18:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6F8IFHj005508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:18:25 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 15 Jul 2019 01:18:04 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1563167394-21650-1-git-send-email-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <d7bfafd7-4e01-1de4-e3c9-a74207ff7003@windriver.com>
Date: Mon, 15 Jul 2019 16:30:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1563167394-21650-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [meta-networking][PATCH] postfix: fix postinstall to avoid do_rootfs failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2019 08:18:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch.
I'll send out a new solution.

Regards,
Chen Qi

On 07/15/2019 01:09 PM, Chen Qi wrote:
> When lsb is enabled, that is, 'linuxstdbase' is in OVERRIDES,
> do_rootfs would fail if both 'msmtp' and 'postfix' are installed.
> This is because they both try to create /usr/lib/sendmail link if
> it does not exist. So we need to fix the check to avoid non-zero
> exit status.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 3d4f1df..021129c 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -221,7 +221,7 @@ pkg_postinst_${PN} () {
>       else
>           if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
>               # /usr/lib/sendmail is required by LSB core test
> -            [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
> +            [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/ || true
>           fi
>   
>           touch $D/etc/aliases



