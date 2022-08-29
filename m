Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F7AECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:44:26 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.72213.1661787866398679361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hbSy3Oyu;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-333a4a5d495so205329527b3.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Zhi/5Up7ZAgFZbZxiPD8ks1lwdoqYzO7hQnPooWVIgI=;
        b=hbSy3Oyurvfx5JBOO9QKamFqHVpOdQa1X2HJB4bOTkjhtr76XaEBKMW3bTenWwK54+
         ob+iSWJxyueuJ84ya1arso5FUR2rjFFwXnd4q25FVzu+0r56h6ju3uJ6DuvGjwKibgQt
         kVlD7cXX7ndosrvxtmLXKLTRmJw3tSEcpjBuDnGWgx8pkQfdPLYfq9fjrAfrHMMYaSAi
         urZ8+jVdpdr74nUJkgTTyvPqrY5g6a7ANjg/cdM9Elma8jxQxcGnopJ1eVWTjpWIBebf
         wh3imvipMSI59yjXn+8XQVaYlTUoJonMsRVuBqy6eBYCmdwjI7/s41vncCkKc3rWopCG
         kl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Zhi/5Up7ZAgFZbZxiPD8ks1lwdoqYzO7hQnPooWVIgI=;
        b=S6pK3FxzWpJ1oGwO0l7PPqwTTZnAOD1du1CuahzhCV4LKgSvLIMYh2ykXv58Svz4PA
         Pbt/lfeV/waogSct2Hgevlp2tA53y9+tiKdm9VNt++rZtLyNWbTVaPBJYELpmc3ivKnj
         N5dp1Wx8TniA2MQ0mjCqw4cNU3Xh3rtOdlVgSokzOp/pPhtL3hpnfcao3d8b8vDO85Wv
         PCiYuCZI2sOAoQoKr4M8O6Zo4xW+YJufs343t1XSKODAeNqOEdXMyEeY3WgubmGnA1aS
         0SxXSagYD8jo4GKh9A7EOyuYSpxD3ZkiohA+7ucHskb2KHd96/avV6TgV2EO1U/6Jqim
         1/sQ==
X-Gm-Message-State: ACgBeo2aIO3I9H/AQ/sJq9HiLXpfmyWJjRgm+zmDNs4t+5vxTkQYt71C
	EIvqFhq6BggV2zDCgwLfwN1haAftn9+v/1+i7BM=
X-Google-Smtp-Source: 
 AA6agR5zmHbEiospccxtMD1YmWGDMDdkEWX4xmAhciGtyxb6fkYN2FJOHdAEsa93W/ISnBhoa1RSovoZZUmG/CLNvQA=
X-Received: by 2002:a5b:107:0:b0:67c:4077:17f0 with SMTP id
 7-20020a5b0107000000b0067c407717f0mr8035271ybx.363.1661787865512; Mon, 29 Aug
 2022 08:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
 <1661755059-4785-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1661755059-4785-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Aug 2022 08:43:59 -0700
Message-ID: 
 <CAMKF1spSPRB2RcaaVf6HeMNssaf7yPK9aFdiiQ7Nu1w5m+_D4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] fmt: upgrade 8.1.1 -> 9.1.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:44:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98535

gerbera fails to build with this upgrade see
https://errors.yoctoproject.org/Errors/Details/670367/

On Sun, Aug 28, 2022 at 11:38 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> similarity index 90%
> rename from meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> rename to meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> index c53dd38901..34896153c2 100644
> --- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> @@ -5,7 +5,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
>
>  SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
> -SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
> +SRCREV = "a33701196adfad74917046096bf5a2aa0ab0bb50"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98507): https://lists.openembedded.org/g/openembedded-devel/message/98507
> Mute This Topic: https://lists.openembedded.org/mt/93321367/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

