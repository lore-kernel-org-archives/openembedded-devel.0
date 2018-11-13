Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 11A9A6C28F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 10:33:34 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42vP9W4RsZz1qyLq;
	Tue, 13 Nov 2018 11:33:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42vP9W4Fzmz1qr2g;
	Tue, 13 Nov 2018 11:33:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id IlPzzE4JLU-d; Tue, 13 Nov 2018 11:33:33 +0100 (CET)
X-Auth-Info: iRbegLj5DfEj2NmCApjpUPw/leov5BxsVsfYkGpbQCU=
Received: from antares.denx.de (unknown [62.91.23.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 13 Nov 2018 11:33:33 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <CA+chaQe-odXPBtfwRY3-SVJkexAa2WzyekTe-4w4z8tPPNAuEw@mail.gmail.com>
	<20181113095536.7256-1-Martin.Jansa@gmail.com>
From: Parthiban Nallathambi <pn@denx.de>
Message-ID: <b794f58b-092c-9527-c8c9-54dd483ae757@denx.de>
Date: Tue, 13 Nov 2018 11:33:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181113095536.7256-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe 1/2] xscreensaver: fix indentation and use BPN/BP in SRC_URI
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
X-List-Received-Date: Tue, 13 Nov 2018 10:33:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/13/18 10:55 AM, Martin Jansa wrote:

Works for me,
Reviewed-by: Parthiban Nallathambi <pn@denx.de>

> ---
>   .../xscreensaver/xscreensaver_5.39.bb                | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> index e7f97b61a4..0a884e98b4 100644
> --- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> @@ -1,15 +1,17 @@
>   SUMMARY = "X screen saver and locker"
> +
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=e141ab5822fb2d43694e1e47b59fc0df"
> -SRC_URI = "https://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.gz"
> +
> +SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
>   SRC_URI[md5sum] = "a5da62b91271f4e8afcc73d44697364b"
>   SRC_URI[sha256sum] = "48ce1880f18b5321182be0c033aeceb5ec5628a1505b9d1ff69dbf06093c2426"
>   
>   SRC_URI += " \
> -	file://xscreensaver.service \
> -	file://fix-buildscripts.patch \
> -	file://tweak-app-defaults.patch \
> -	"
> +    file://xscreensaver.service \
> +    file://fix-buildscripts.patch \
> +    file://tweak-app-defaults.patch \
> +"
>   
>   DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native"
>   # These are only needed as part of the stopgap screensaver implementation:
> 

