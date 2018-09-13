Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E859D7988F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 08:27:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8D8REPR007238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 01:27:14 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 13 Sep 2018 01:27:13 -0700
To: <mingli.yu@windriver.com>, <openembedded-devel@lists.openembedded.org>,
	<raj.khem@gmail.com>
References: <20180913082343.435508-1-mingli.yu@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
Date: Thu, 13 Sep 2018 16:32:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180913082343.435508-1-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [meta-networking][PATCH] postfix: fix pkg_postinst_${PN}
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
X-List-Received-Date: Thu, 13 Sep 2018 08:27:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2018 04:23 PM, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> "exit 0" will break the postinst logic
> below the line "exit 0" such as:
> ===
> update-alternatives --install /usr/sbin/sendmail sendmail /usr/sbin/sendmail.postfix 120
> update-alternatives --install /usr/bin/mailq mailq /usr/bin/mailq.postfix 120
> update-alternatives --install /usr/bin/newaliases newaliases /usr/bin/newaliases.postfix 120
> ===
>
> It's enough to call "$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}"
> , so remove it to guarantee the postinstall logic is correct
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta-networking/recipes-daemons/postfix/postfix.inc | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 49f9f7b1f..71d7ef5df 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -246,7 +246,6 @@ pkg_postinst_${PN} () {
>           # This can fail depending on host setup
>           if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>               $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
> -            exit 0
>           fi
>           touch $D/etc/postfix/virtual_alias
>           postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
I guess you need to use the if...else... block here.

Regards,
Chen Qi

