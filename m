Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB2EC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:16:57 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.14663.1708006607025527073
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 06:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ApbcDY2W;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3832ef7726so117127366b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708006605; x=1708611405; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IuUzv9xpChBMF/DQzqxAIZRFLLqT5Kd/rQCTZyII94U=;
        b=ApbcDY2WLmKmKirXAUB1BL3cFD5MojKt8ezKrH+W0rixgUGZCGd+HElWl6fGEUtV9e
         KxiX0q/lv71IB1dEg7uxlCXluGUA4ldH2qlBs5WHlxyrSPeBItDXaiD1Lhtr7dXQUoHp
         IA0nakczUkbjArCEfbP7QtCHGgv7fn1e2QmniR7R5vKZFBq8qN+YQ4Tv3HOgEwliY3IM
         TlkQGt8mXCeh/DXLX3cy+7d7zZiSsn8e8X2BfBebcJro86V0AKqaFo9BshDVkkL6BV8w
         VjhLYFfxKpPxh7Jy/D2TF4UC/2v/BE8pbx8hBmwojTYqbmRzkHK9QPHPSbad9yg68dhp
         PD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006605; x=1708611405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuUzv9xpChBMF/DQzqxAIZRFLLqT5Kd/rQCTZyII94U=;
        b=cfYqOyssF+bEl4gz39j/1L42203aKFENu1Ull7EYp2vrEDDTyE0gn8uDHE/o/Su5gC
         JZTt8y1Mm+y/CW9Oy2qV9y2Y779XKcyt9ACtqeBsCgPeHqEu42smUIPfvpfOCetOpqI9
         FTQZ9HCTRpg5S+rvrr+yMe66QD/BkP6uvhViCDjxt3+NH71ZiWEWMZG7rSnCDyh1kReV
         rwLnhmOxzVx4F3LizzMDkCh7COu+d6zX/qN0ekQv+CV7cFTfCmzoYKNlSSEtN/j+plJU
         0CRnw4uvRGKpmHfLwSM8ml8A26gTDqd20R3bGGfwFIl84+29i+XlAT1nE00mntWd8zN4
         wKKw==
X-Gm-Message-State: AOJu0YzYO1UbzBhfRHN2SFak5G9u/qu+p1gFuXEEHq52QbScckC/oVrJ
	2E5zc6tDUW+t3k+hbHt7s8ifRMF1CR3FWxiH5t7D6g5U3Na6iYcYvaMb/YxT
X-Google-Smtp-Source: AGHT+IHHI89wuRfCjVYqdDaprrwYgR02kUk02knRzLK8uhBgMKti+Q+By10w/PTHfovUJqOtz8UIQQ==
X-Received: by 2002:a17:906:5fc5:b0:a38:7171:e832 with SMTP id k5-20020a1709065fc500b00a387171e832mr1189758ejv.32.1708006605253;
        Thu, 15 Feb 2024 06:16:45 -0800 (PST)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id cu11-20020a170906ba8b00b00a3d9b0e41e6sm486587ejd.205.2024.02.15.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:16:44 -0800 (PST)
Date: Thu, 15 Feb 2024 15:16:43 +0100
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH 2/2] libusbgx: uprev to the latest commit
Message-ID: <Zc4cyxt-05mSp25z@toolbox>
References: <20240215140714.2106808-1-max.oss.09@gmail.com>
 <20240215140714.2106808-2-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215140714.2106808-2-max.oss.09@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 14:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108753

On Thu, Feb 15, 2024 at 03:07:14PM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Uprev libusbgx to ec0b01c to get following fixes:
> ```
> ec0b01c Merge pull request #83 from mgrzeschik/uac2-controls
> cbf1750 uac2: add additional configuration controls
> 81d7c05 load libcomposite kernel module
> caad244 Fix: Memory leak config label
> 51abbfd Automake: fix distclean of tests
> 3cc5af7 Added printer function header to installed headers
> adc45af Added missing extern C closing brace
> ```
> 
> Refresh 0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch.

I missed to add the changed patch file to the commit, v2 to follow shortly.
Sorry about that.
Max
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> index 484110561..a20ff4eea 100644
> --- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  inherit autotools pkgconfig systemd update-rc.d update-alternatives
>  
>  PV = "0.2.0+git"
> -SRCREV = "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
> +SRCREV = "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
>  SRCBRANCH = "master"
>  SRC_URI = " \
>      git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH};protocol=https \
> -- 
> 2.42.0
> 
> 

