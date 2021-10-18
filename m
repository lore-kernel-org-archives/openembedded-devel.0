Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439AAC433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:53:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.38348.1634572409243594375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YpcQfWpM;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id q19so15043029pfl.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=CjhSJ7PgwGxl6Ctimgq/RMTcESuQzfgP7tAZvrMGPB0=;
        b=YpcQfWpMyU/WL6lFzXfWZYHPe21ZBLH+z5QY5r/QGNFBq/OgFRW+kDZT+nupWxuY7G
         2m23kg8MKtjJttvztNpjxK5HViKbE1oCDslcry29n/1V9ActwLBghrhjJn7pWx9WogQY
         BaBZMyWuiTVU/NpMgO8f4XCLPe2RpStzn8ftPRPJj54oQOrLoBeQ/74+s/WeWrGnElCT
         sMlIMYvLahE2wOIxmaP3DoBSNnJ8QneLsp09sY/AOX9oPSvAH9o1yNrn+XyDW9GFVj3s
         6BFJN5SxRUgTMUO1PjNUsY4Sg6y0MRlo9HGhL6X/uIUCeRE+XmQz2loKshDh46GkQwmL
         LyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=CjhSJ7PgwGxl6Ctimgq/RMTcESuQzfgP7tAZvrMGPB0=;
        b=tA5OZQa+hUxaVtID8H80ukYe69bGVF30G+a8aH056SAdVK7Z720Ii4MVkCnNOBThT2
         LOm3pm2MY0KK7Lk1Znp9d8kV1Bp2lG4rQOMQscTo3K4l+g/jKV7LysiF5+pAhJ0+WYje
         UB4pfjVEiC/rMMiJ4mhnjfereJhiGrWNcp26Tu1UiYFZDAcO3dXNk7XoosgFpY2BJc4N
         Kn18glLjTf4cvJGlBWBYQ1xzf9M0MSD6WJUw8Bv0gHPhTpiiKVVREH8Npcon9Elj3Maf
         7AUa5o3KkOlYi8u0J47xWWLzTOr0zmB9Avq4tabu3zlYrTYOp1Ix7xU37L3ysQWCifrP
         YK3w==
X-Gm-Message-State: AOAM532h/vJw5h8oEtB+vGXk7D5E8bMzxe3ALWcWmmcZyP6V3zjd4Pib
	A8bhUygEdoP1wNxhk42x6UI=
X-Google-Smtp-Source: 
 ABdhPJzOX4mO2ZnNLblZFizsfrOYC6MKgfg+LzF4NHL0YV+QloUGWw6YDj8dn5TNg4sciwvo0jYDWg==
X-Received: by 2002:a05:6a00:a23:b0:43d:e856:a3d4 with SMTP id
 p35-20020a056a000a2300b0043de856a3d4mr29842590pfh.17.1634572408644;
        Mon, 18 Oct 2021 08:53:28 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:9d56:a24c:bb34:792d?
 ([2601:646:9200:a0f0:9d56:a24c:bb34:792d])
        by smtp.gmail.com with ESMTPSA id
 u16sm4674007pfi.73.2021.10.18.08.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 08:53:28 -0700 (PDT)
Message-ID: <1bfddba8-01e0-1bc7-c6d7-2a1f1ec65f7a@gmail.com>
Date: Mon, 18 Oct 2021 08:53:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [meta-networking][PATCH] bluepy_git.bb: Added recipe for
 BluePy - Python interface to Bluetooth LE on Linux
Content-Language: en-US
To: Marco Cavallini <koansoftware@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
References: <20211018142247.32594-1-koansoftware@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211018142247.32594-1-koansoftware@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 15:53:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93430



On 10/18/21 7:22 AM, Marco Cavallini wrote:
> From: Marco Cavallini <m.cavallini@koansoftware.com>
> 
> Signed-off-by: Marco Cavallini <koansoftware@gmail.com>
> ---
>   .../recipes-connectivity/bluepy/bluepy_git.bb    | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> 
> diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> new file mode 100644
> index 000000000..651a75254
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Python interface to Bluetooth LE on Linux"
> +HOMEPAGE = "https://github.com/IanHarvey/bluepy"
> +SECTION = "devel/python"
> +
> +DEPENDS = "${PYTHON_PN} glib-2.0"
> +RDEPENDS_${PN} = "bluez5"
> +
> +LICENSE = "GPLv2"

It also has pubic domain licensed code as I see in 
https://github.com/IanHarvey/bluepy/blob/master/LICENSE.txt so perhaps 
PD would also need to be added here.

> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +
> +inherit setuptools3
> +
> +SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09"
> +S = "${WORKDIR}/git"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"

do we know why this is needed ?
is it ignoring LDFLAGS ?

> \ No newline at end of file
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93424): https://lists.openembedded.org/g/openembedded-devel/message/93424
> Mute This Topic: https://lists.openembedded.org/mt/86415050/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

