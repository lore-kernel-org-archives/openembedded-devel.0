Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.578.1602606695136598149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 09:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4C9gzS72jMz1r760;
	Tue, 13 Oct 2020 18:31:32 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4C9gzS6nzVz1sM9c;
	Tue, 13 Oct 2020 18:31:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id msZL5lgCQt5S; Tue, 13 Oct 2020 18:31:32 +0200 (CEST)
X-Auth-Info: yYiORXORTN7frGMPQbJx+dIzBCLsk5rhXY4GdK5cLCs=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 13 Oct 2020 18:31:32 +0200 (CEST)
Subject: Re: [meta-oe][PATCH] freerdp: Add missing libxkbcommon WL dependency
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20200824155337.9092-1-marex@denx.de>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <cce025f9-708a-cd03-d66d-8ab7b9d0c2a8@denx.de>
Date: Tue, 13 Oct 2020 18:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200824155337.9092-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/20 5:53 PM, Marek Vasut wrote:
> The WL build depends on libxkbcommon, so add the dependency.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
> index 6a97c24c2..d446a31a5 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
> @@ -38,7 +38,7 @@ PACKAGECONFIG ??= " \
>  
>  X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
>  PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
> -PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native"
> +PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native libxkbcommon"
>  PACKAGECONFIG[directfb] = "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
>  PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
>  PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"

Can this patch be applied ?
