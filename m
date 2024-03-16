Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66598C54E69
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6054.1710623338730381796
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=d8CVLcBz;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 503DE87F88;
	Sat, 16 Mar 2024 22:08:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623333;
	bh=q6yTITYnZibNRVVP6S/9SoSyqtT9wUoU6p8Mb1qCmSI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d8CVLcBzU175ve5/gHvatWEfIAZd+j0Ri91uqTO/qYHYrcxY8s0pbwY0qoIR5Xdyo
	 MGpeR+bDfRdQAtSQrF0HqFZYCXp6SdMyJm88ugZl+h2ETG7MSKyv0VRkMTGS5gtmTI
	 OsHuOjJyWeslWN8PVXI9iVaH0zGCGJe5ejE+wlqHf46sOBMo+jrGccIqYk/+qfREf9
	 osWQuIjpLzXJrY+dtXeieWtP6eAL+qmkkpK1TMbo+3k6ZYwbp/t6DyYOlO7tcI0EY8
	 jIvLaDj3cT0IMacZa3xDT0fyu4O9vSRn98ync7pXKbm616YoIpNGVOQvnubUUMHrAF
	 Bcna5CrYb7oBA==
Message-ID: <6a591af2-3a00-468d-b9d7-1ff0368b5065@denx.de>
Date: Sat, 16 Mar 2024 21:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-6-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240316100056.409758-6-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109371

On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> When DRM is activated for LVGL, it adds a dependency on drm.h.
> As for lvgl-demo-fb, add an include path to fix this usecase.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> index 8bd718efd..6a9a7411b 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> @@ -21,6 +21,8 @@ inherit cmake
>   EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${baselib} -DBUILD_SHARED_LIBS=ON"
>   S = "${WORKDIR}/git"
>   
> +TARGET_CFLAGS += "-I${STAGING_INCDIR}/libdrm"

Shouldn't this be conditional only if PACKAGECONFIG contains 'drm' ?

