Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1C4C54EE9
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 02:04:29 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web09.1778.1662689063377119169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 19:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CwbSvNYS;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-127f5411b9cso478549fac.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 19:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=c4NXDtJcYQBlR8C16bEUUm6JYQ+bo0XxVWlsuRUn9IE=;
        b=CwbSvNYS7FgmlE5uuV+oY5+RpRXilsvJfJe5ObieJUZAE2MzXc94bEbzw3C0MyhQSR
         QNMtjE8gGV+a/bOlD4MXWDSUAacpKPKUX09vXuIXDESwtkriFHuhi3Yj9Z/J67WX/KmI
         xNKSARX7bbkon3wvHiFiutWW7guRKGBQeuJEdnEoXk07ZL1V55CSjkvDR1GO6l7UH15D
         3H2nk0uM34AlR4HdpWOreb4Zc+acGFYOQrckBpf29X8eMm+R2zHR3fzGf4l4v7zJBexh
         Tpd4MQbwwWBFvrwBG3Kp353z7sUVhIjocDsckeYqkx8liB4wrK/FTCCWvv7fp7stNz1b
         8aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=c4NXDtJcYQBlR8C16bEUUm6JYQ+bo0XxVWlsuRUn9IE=;
        b=kt3rUl1h5WWI1Ls7P6v1oZDLUpIvx1Z6egnTuXoRRMryyeJVQc1UqNXPNW1DkB+VB7
         J2oIvKf7C8vuEZ6IrnIipl9gRkH8giX88VSQEGixlD6fElcy35Dtd3UxnQCfha6pfJnj
         m48gX/fPNLCMUz8/kWLBOnRL431TJLgL7FQ4sr1Jh92w0pzBotO8aR+9GmigFRHsUJ+d
         t5O4opFP/3EmAPfxlTytZXzKTVcBXXMbrEAgND2dJRFtcjHEH86FZwgd+1V1lwIS1MW4
         eA1kLZyf5VbBwaqPrUJMBAwgvvTotf+RH+jhEwyftR+Vg9KK3m8V+Er3xg3FZv1vl1K6
         PyKw==
X-Gm-Message-State: ACgBeo2PW+4teoxxKB32gFgxN6ctZKD/mKXWl9rszxdHzP5Y6SbSNqPW
	Bfa24w61tMu7bRAjmMmPoIjMbTtW0yeORZGMLJk=
X-Google-Smtp-Source: 
 AA6agR6cmwFb24vH/lwLh9nnwmADry+y91XZ9FXbpVgXw/yvCmhUap2T/TrjzqRbBn8Nn3gD/HNx6R3/aLYTmdmFAA0=
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id
 t34-20020a056870f22200b0010b732618c2mr3502986oao.55.1662689062653; Thu, 08
 Sep 2022 19:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <1662686742-2535-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1662686742-2535-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Sep 2022 19:03:56 -0700
Message-ID: 
 <CAMKF1sraD0tGFQ2MD4Sc+yEhQkxxAHgb==i2QfMMN39R37dXrA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-transitions: upgrade 0.8.11 ->
 0.9.0
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Sep 2022 02:04:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98730

This is already proposed here

https://patchwork.yoctoproject.org/project/oe/patch/20220908094951.594032-2-leon.anavi@konsulko.com/

I will drop this one.

On Thu, Sep 8, 2022 at 6:25 PM zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:
>
> License-Update:
> =========================================
> format of LICENSE changed from
> ASCII text, with CRLF line terminators
> to
> ASCII text
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...on3-transitions_0.8.11.bb => python3-transitions_0.9.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-transitions_0.8.11.bb => python3-transitions_0.9.0.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb b/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
> rename to meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
> index 14189424a2..980351bf14 100644
> --- a/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
>
>  inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "7b20d32906ea4d60ee6f6c1f5dc9c9f178802425c5b155213eb0f25c277f04e4"
> +SRC_URI[sha256sum] = "2f54d11bdb225779d7e729011e93a9fb717668ce3dc65f8d4f5a5d7ba2f48e10"
>
>  RDEPENDS:${PN} += "python3-six python3-logging"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98728): https://lists.openembedded.org/g/openembedded-devel/message/98728
> Mute This Topic: https://lists.openembedded.org/mt/93563945/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

