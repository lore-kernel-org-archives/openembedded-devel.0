Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 668F0601F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 07:35:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S7ZMjT029935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 00:35:22 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 00:35:06 -0700
Message-ID: <55B730B8.7040607@windriver.com>
Date: Tue, 28 Jul 2015 15:35:20 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <Liezhi.Yang@windriver.com>
References: <1435820534-32452-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1435820534-32452-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] hiawatha: fix the installation failure due to no /var/run dir
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
X-List-Received-Date: Tue, 28 Jul 2015 07:35:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年07月02日 15:02, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> after cmake is upgrade to 3.2.2, the /var/run dir is not created, so
> not need to remove it.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> index b9fa5cd..31293e4 100644
> --- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> +++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
> @@ -53,7 +53,6 @@ do_install_append() {
>           install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
>       fi
>
> -    rmdir "${D}${localstatedir}/run"
>       rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>   }
>
>

-- 
Best Reagrds,
Roy | RongQing Li

