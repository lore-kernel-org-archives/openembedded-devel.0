Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155C4C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 16:05:14 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.11801.1719504311718838206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 09:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ZyjkRdp4;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 88B6988256;
	Thu, 27 Jun 2024 18:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719504309;
	bh=XBIFE6dIv+l0b6lQMqfBHdweqsWESgJ/W6ERebJwPzw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZyjkRdp4jZ/ufqXrnk1MsdQIWenulV7dx437WcuOmv8dww9yEV8SbGDpjQcrhF0P1
	 6beitHZ9k86VYeHPNfNmvBNlFaFYyJn7k3iz9gT05OUzmgXGmrbuV8zxT5DateMrld
	 a+BTJ2F+rZUtYv/8n9rsTEo6/qVh3Bl17s7wNeXmvOrJxIcrZUrcBp8jXqeLDaQXFY
	 GSiu/6e32nt7wsw6/NF1a5pUB+x0ba0nwRFPjGyPGzqO05uN6VtWYJi0qQDhELyQJu
	 mW+Se1I0O21UaijtN5AFbJNtRDLab9GlWNFdU6pueMIP5k4squ7LZm82Dw2ur9fy+C
	 V9biu9XnGllYQ==
Message-ID: <27544fd6-1a6f-4a6e-b71b-89b04f9ef49a@denx.de>
Date: Thu, 27 Jun 2024 17:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 2/2] lvgl: update upstream-status of all patches
To: Christian Eggers <ceggers@arri.de>,
 openembedded-devel@lists.openembedded.org
References: <20240627085256.21526-1-ceggers@arri.de>
 <20240627085256.21526-2-ceggers@arri.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240627085256.21526-2-ceggers@arri.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 16:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111129

On 6/27/24 10:52 AM, Christian Eggers wrote:
> All patches have been integrated meanwhile and should appear in the next
> release.
> 
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>   ...2-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch | 2 +-
>   ...3-Make-fbdev-device-node-runtime-configurable-via-envi.patch | 2 +-
>   .../lvgl/files/0004-Factor-out-fbdev-initialization-code.patch  | 2 +-
>   .../lvgl/files/0005-Add-DRM-KMS-example-support.patch           | 2 +-
>   .../lvgl/files/0006-Add-SDL2-example-support.patch              | 2 +-
>   .../0007-fix-cmake-generate-versioned-shared-libraries.patch    | 2 +-
>   .../files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch   | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

