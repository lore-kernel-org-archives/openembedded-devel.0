Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.8803.1615558734245413920
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Dxnx85X2fz1qskB;
	Fri, 12 Mar 2021 15:18:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4Dxnx85L0Dz1qr5H;
	Fri, 12 Mar 2021 15:18:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id UaMeAUjUW2yq; Fri, 12 Mar 2021 15:18:51 +0100 (CET)
X-Auth-Info: Fg8VcUamUyzrMPK11inDEhWHpKMbQBd9c2Qxg9Ti+H8=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 12 Mar 2021 15:18:51 +0100 (CET)
Subject: Re: [meta-oe][dunfell][PATCH] freerdp: Add missing libxkbcommon WL dependency
To: openembedded-devel@lists.openembedded.org
References: <20201204234722.20315-1-marex@denx.de>
Cc: Armin Kuster <akuster808@gmail.com>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <df600449-0f38-223a-e91a-c2f9bb6bd51e@denx.de>
Date: Fri, 12 Mar 2021 15:18:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20201204234722.20315-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/5/20 12:47 AM, Marek Vasut wrote:
> The WL build depends on libxkbcommon, so add the dependency.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>   meta-oe/recipes-support/freerdp/freerdp_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> index 7cafbb799..82ef561fb 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
> @@ -40,7 +40,7 @@ PACKAGECONFIG ??= " \
>   
>   X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
>   PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
> -PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native"
> +PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native libxkbcommon"
>   PACKAGECONFIG[directfb] = "-DWITH_DIRECTFB=ON,-DWITH_DIRECTFB=OFF,directfb"
>   PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
>   PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
> 

+CC Armin, would be nice to have this picked up.
