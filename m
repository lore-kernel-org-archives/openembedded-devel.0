Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A8FE63F12
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 20:04:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5510.1771185850178958695
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Feb 2026 12:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fMbTorpE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-437711e9195so1727993f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Feb 2026 12:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771185848; x=1771790648; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCtEWEdCp4K1pHxo42Hiz6T/pWnIu02V0GBBi8J2ENc=;
        b=fMbTorpEmc21VIwQ3sCLotB7oGAomv43VAGDidSCMtxemjHfuTFdU2abS4URyOJ3FX
         9SWm6EV2HJn+80qL44wTZrKNq0pnB1lubRYIAwL+j+qag8bcoVCIiLisMc7gwL9apBN/
         xooSsXSNrq2onWhXYZ5vb2LNg/+5rAAhSaGBrkIec7oYgs4u0H/KDgd/nWfV4h7Vq2eV
         1Y60iBBVGp+jv4yAJGK7n8u+Wmn1L5K1DywUrMUjjj58YHPC29avtHM4mlSfbNw7zats
         LhWbNq++6+yrDeBYGV5MkMzQVsLkL463dGS8hdNkSqDH1YFK7gNkgvW2rHXNk5BiJcc+
         G9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771185848; x=1771790648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCtEWEdCp4K1pHxo42Hiz6T/pWnIu02V0GBBi8J2ENc=;
        b=idCZVsGr8Y1opRKWp+I9Mcn1TflPNAXcuCD3WYmIOEy5I0k9RYA8rDVmeGp0tGRCvT
         qPSUJgUCJdIFmBeXmlxqMR64DacrRt96ZD0efwQrByd9qWBvOwzJbuQ4dnO1sZWNMxsT
         Rnl2yZ1Pjxy0yNhPHemh+L7Ma1TteD6lKap/3v6gipl7Mkd+QGoUN9na5pa2ZjjO3nle
         rLIJXC0W7oh4O5qugTT1rnEaAFtFFf527JbKj/GeREMQ5BxUJRBtUL8B1Uc4+PYibrEZ
         U+xpdqPf3tBu6K5I4sEbBjE0WLLAEhzg3NVkngtfunGzmwZXLZqHHe1SP7Z0ufzKWFRJ
         fdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr8+m7DBfntmWZjjRAYkzOtccRjODh2+9j5+vg6dBGqyHT9msCBz+ps+sxrqst8zsvUnJyino1fzDb9Q1kbj/b9QI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzM8cSVfDXO+1biTZ7uJgNUtDTyl0v9kQUHRRdmy4RZVoofbiAA
	ZyGTyuvESaFPbBRFtXiNC3zpU5zDcFy4eCFScRIHidIZmJj7MKusV+6D
X-Gm-Gg: AZuq6aLEdZ0xqb0VM9N7aijNLTE7qXUjfNRMfSn2c8yIHGmuKTRpB4O30hU28hNsK01
	cb/UgJy/4bXC/+6xaxx/pSk3N/3QbjNGa+4uchk5MdtClK62t6cr1e3YQ136mP98zt8hscbNXGI
	aqETNmaM9LyPOOsAqSEeMpGPKg4b5CsHbFap3s1hZkM6uU1yaqMA5RRLhpN+/XFBO83rk+Gp6Ie
	PDnDHR/ejFi0BSxToTOS2u4ET9coV/+OWC+Z31BcZOtb1h7/r4nVB4/EdVnjVjb99N0YuQmgpLY
	a5Qz+liiO3Myb1fuuxSc+jO9O0W98H52SJPMsCXzqnFOX5Lv1KHtrjDRkkH9u1ttc6vV3WUNvaG
	Zc3c/Jdwcaj4b6OqV0RKJbIFM2WXS5EL5iRixZSa+KQ5G9ktRm3j6jzde9LqYZRK1clH1h8+eVk
	KiaB+PBq1/jy7yTC9gPaAU4Yyrmm9HNoM=
X-Received: by 2002:a05:6000:26c6:b0:437:6ca8:3ee3 with SMTP id ffacd0b85a97d-43796ab18e8mr17396820f8f.5.1771185848332;
        Sun, 15 Feb 2026 12:04:08 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc9b2sm20030901f8f.21.2026.02.15.12.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 12:04:07 -0800 (PST)
Message-ID: <e9706102-3c2d-4173-99ab-32116e0a49ce@gmail.com>
Date: Sun, 15 Feb 2026 21:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260214013547.22916-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260214013547.22916-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Feb 2026 20:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124406

On 2/14/26 02:35, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> Fix the following error:
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['tigervnc'] have failed. If the intention is to defer them to first boot,
> then please place them into pkg_postinst_ontarget:${PN} ().

How could I reproduce this?
I added tigervnc to IMAGE_INSTALL, and built it once with systemd as
INIT_MANAGER and once with sysvinit (also added systemd/sysvinit to
DISTRO_FEATURES), but the build succeeded in both cases.
Am I missing some config step?

> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
> index a5413a9108..12854632d5 100644
> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
> @@ -95,6 +95,7 @@ FILES:${PN} += " \
>  "
>  
>  SYSTEMD_SERVICE:${PN} = "vncserver@.service"
> +SYSTEMD_AUTO_ENABLE:${PN} = "disable"
>  
>  CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
>  CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124400): https://lists.openembedded.org/g/openembedded-devel/message/124400
> Mute This Topic: https://lists.openembedded.org/mt/117803450/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


