Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 07DE26C2EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 10:34:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42vPBC6GLHz1qyLq;
	Tue, 13 Nov 2018 11:34:11 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42vPBC5fzgz1qr32;
	Tue, 13 Nov 2018 11:34:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 8YRpbcB6Fqz9; Tue, 13 Nov 2018 11:34:11 +0100 (CET)
X-Auth-Info: JivnNK0GZ4Uxzo/GQ13AD1dTST0NNwGWOK9AOugJQKE=
Received: from antares.denx.de (unknown [62.91.23.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 13 Nov 2018 11:34:11 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <CA+chaQe-odXPBtfwRY3-SVJkexAa2WzyekTe-4w4z8tPPNAuEw@mail.gmail.com>
	<20181113095536.7256-1-Martin.Jansa@gmail.com>
	<20181113095536.7256-2-Martin.Jansa@gmail.com>
From: Parthiban Nallathambi <pn@denx.de>
Message-ID: <767ea36a-9594-d28c-0e8a-5ebf951c4426@denx.de>
Date: Tue, 13 Nov 2018 11:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181113095536.7256-2-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe 2/2] xscreensaver: add distro_features_check for x11
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
X-List-Received-Date: Tue, 13 Nov 2018 10:34:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/13/18 10:55 AM, Martin Jansa wrote:

I Agree!
Reviewed-by: Parthiban Nallathambi <pn@denx.de>

> ---
>   meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> index 0a884e98b4..6ebf3c798c 100644
> --- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> @@ -17,7 +17,9 @@ DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native
>   # These are only needed as part of the stopgap screensaver implementation:
>   RDEPENDS_${PN} += "xserver-nodm-init liberation-fonts"
>   
> -inherit systemd perlnative pkgconfig gettext autotools-brokensep
> +inherit systemd perlnative pkgconfig gettext autotools-brokensep distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
>   
>   do_install_append() {
>       install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
> 

