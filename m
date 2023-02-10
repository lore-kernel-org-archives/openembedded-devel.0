Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02384C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 22:58:15 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.9093.1676069893903901968
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Feb 2023 14:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ac8i1D91;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-16aa71c1600so8574848fac.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Feb 2023 14:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1gf5SIKWSSUlsXRkuFbEEf2NwoAxxYGlWD5TmOWI1oA=;
        b=ac8i1D91pTNg3G18xthvnt2VHJOJTinn1FazIOtg+JP+2KOpuUuX3p4PJ6BlY3i5V/
         unRANvsA9INUNAgBRaCitklG9EmD6wQ04MpJE+bDR3jJknUnYXEZZumo+6tzRJyxMr8E
         QfVEbxNA5mu/0Nu399ik9QK+JryeFSLoHJY0xiHvZQLo536WhBdixmFJLkc+wsqRhQRZ
         k0eXDIOFIrqM9pkCHAV+jaSJHFx9Ubgvo8HJ78l25s8DURr6B/9ndc+qDH80Sl/vte6d
         rTZFhdWfz7pFtWO9Ht6aH6ZdYalkBApVuquoThWmmo7Evo1fFnuhvIM2+txLg+RJjgp+
         cG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gf5SIKWSSUlsXRkuFbEEf2NwoAxxYGlWD5TmOWI1oA=;
        b=fNIXY6pcJ/BKgS8QYv7+d4DsaIGrfeVNfWNwGiiLFltzx8bl+j7o0EtmsYzSM5CReu
         c+lWnOVRO//1npqjuwQoq6COERROh7gMxgfEx2TeiUKgDRCIYD9EcGehPd8BXEfpjaZg
         cv8Yn8E+NzAjLYCCNbMthTMEX5qrTpgPQT6icR83/uYWzbFqNsAwfYHsDd1aHke0lKmU
         dm8cbRJe7/uxCBcJr1t5nuQGkTetVu+AhBwROyqCRJHWH8qdMgWCBXafPuJiVqRAEuJH
         VOpRsBVGexqurWBsgr6G/zNFCgnRJIw6Rk63bLzKsMhc5MQUHvdZpU6mZttid01hkaHj
         phIw==
X-Gm-Message-State: AO0yUKXL2gmJIsIzSQqbMrsltSPKYvChIuETqI4MSU3AHNvwOGf5P0rW
	rfDt6Xh96X0oYVCoWNYAbMhALG83rxUJWDhQbN0=
X-Google-Smtp-Source: AK7set+TD+bpXwq2otMy3Fm3/XHXtfCO0VRpjDv1Kmp2hs5TBFaKrXn5FbuesVpAOZgKzZZkU0cKNrrr4kNNvVkbWUM=
X-Received: by 2002:a05:6870:96a3:b0:163:d288:863 with SMTP id
 o35-20020a05687096a300b00163d2880863mr1442743oaq.55.1676069892162; Fri, 10
 Feb 2023 14:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20230210100240.2839345-1-chee.yang.lee@intel.com>
In-Reply-To: <20230210100240.2839345-1-chee.yang.lee@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Feb 2023 14:57:46 -0800
Message-ID: <CAMKF1so4KOwQZF7-i4pXt4+9nhJTisTyV0zJuaure3_QCp=aGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch] tmux: update to tmux_3.3a
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Feb 2023 22:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101018

On Fri, Feb 10, 2023 at 2:02 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  meta-oe/recipes-extended/tmux/{tmux_3.1c.bb => tmux_3.3a.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/tmux/{tmux_3.1c.bb => tmux_3.3a.bb} (84%)
>
> diff --git a/meta-oe/recipes-extended/tmux/tmux_3.1c.bb b/meta-oe/recipes-extended/tmux/tmux_3.3a.bb
> similarity index 84%
> rename from meta-oe/recipes-extended/tmux/tmux_3.1c.bb
> rename to meta-oe/recipes-extended/tmux/tmux_3.3a.bb
> index c9859b386b..e5784be518 100644
> --- a/meta-oe/recipes-extended/tmux/tmux_3.1c.bb
> +++ b/meta-oe/recipes-extended/tmux/tmux_3.3a.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
>  DEPENDS = "ncurses libevent"
>
>  SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
> -SRC_URI[md5sum] = "7301d3fa12f35051edb185496766c745"
> -SRC_URI[sha256sum] = "918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386"
> +SRC_URI[md5sum] = "8eee5883b9f6550fa4efaad0c9ec38f3"

you can drop md5sum now a days, sha256 is enough.

> +SRC_URI[sha256sum] = "e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f"
>
>  UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
>
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101017): https://lists.openembedded.org/g/openembedded-devel/message/101017
> Mute This Topic: https://lists.openembedded.org/mt/96873587/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

