Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5D6C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:18:53 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.319.1643051932455319083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QlWtmR7l;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id d11so21484848qkj.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LGL7xo3ky53CM7DFN2zttMN79/fCB61cwb11z2qL6sY=;
        b=QlWtmR7l14HEqBg/NGKsuGpXiUnuFIYu7P9y1aQCAoebEdVcWcJ9OYg/a6MqXEr9Sf
         vk62estL1zuvhkDBqDNffXjVv5M2WeQnqc9PSI/uPKQYwy9c2DL7p2QZhAIfiHLX8QDW
         c3T1U/o/ZDAb75xn5LeWfHWEo5S9oYAiYz/XqyQjCa4xoMZ6W/CueXhmVBSSllJRE4SM
         P9KR6E3uT49WCSuQxZZSDLqk/evMSzlsthEyavpJHzUSu7D2C+nTkEgDc7pJ0F+a3ua9
         oBTNhvQUeib5jXMWlW3UyHgjHKfGggptuo4T+7P/h2uIL8nvlo38mZD03XtYLi3qTP4P
         NnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LGL7xo3ky53CM7DFN2zttMN79/fCB61cwb11z2qL6sY=;
        b=3DmV0ZeY+jO/8PlDbLs7lEe50GM34taqtPgr4/gCGARkhnAe0KYA2mkyLqz30iRq2r
         pDwG3qyHlWAWLg1MmrqgbuJngV8qikI0QbKAt8OngE3wI/ybPsHRxxGd+JxswffMpPic
         3O2IjKVEVtEUrtpZW9vnGRIRsEfVyUWYUuMdC4fZRs7K1Q3231hnoSN1cOuoKT+cO/Ex
         xPPlht5cnl4rpH+ymONV/95nWhng9dEMTirzEuMuq7jgW9Sq57AYEW5Z1R5/v61Rh8XX
         zWpaUaDRnfg4r93GQeQaPpHwgoZ8NIa3dZh5iskCXVuYC9Lcoit0Ma9J2Y2nreN2hSuW
         P9+A==
X-Gm-Message-State: AOAM531BIXuo8QVcjIIow2/vYzj4lMWkj4DxzTPokDUzUoivAbPqhuxg
	vVZnmVlmlrztF9eDqSzRCNV/qS/R+V0SpGU7KTw=
X-Google-Smtp-Source: 
 ABdhPJw5wN0zUXWAaMMdqiKaVO5jobNj/BKjDqg4pWOoPsGAoo99uBpv8JFKfN8eva3UkEbyGpY28nofpNs6LYfeTnY=
X-Received: by 2002:a05:620a:208e:: with SMTP id
 e14mr12331505qka.227.1643051931372;
 Mon, 24 Jan 2022 11:18:51 -0800 (PST)
MIME-Version: 1.0
References: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2022 11:18:25 -0800
Message-ID: 
 <CAMKF1spOo2GfuBaCdztx9wtTe-OaCXmZhpQpyLFUXa_-2fyvzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] fmt: upgrade 8.0.1 -> 8.1.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 19:18:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95046

since we use external fmt in spdlog this update regresses gerbera see
https://errors.yoctoproject.org/Errors/Details/623452/

On Thu, Jan 20, 2022 at 4:36 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Changelog:
> =========
> Restored ABI compatibility with version 8.0.x
> Fixed chrono formatting on big endian systems
> Fixed a linkage error with mingw
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/fmt/{fmt_8.0.1.bb => fmt_8.1.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fmt/{fmt_8.0.1.bb => fmt_8.1.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/fmt/fmt_8.0.1.bb b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> similarity index 90%
> rename from meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> rename to meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> index ee14ad55b..c53dd3890 100644
> --- a/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
>
>  SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
> -SRCREV = "d141cdbeb0fb422a3fb7173b285fd38e0d1772dc"
> +SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94963): https://lists.openembedded.org/g/openembedded-devel/message/94963
> Mute This Topic: https://lists.openembedded.org/mt/88573659/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

