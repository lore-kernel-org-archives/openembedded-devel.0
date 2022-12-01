Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB1CC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:59:52 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.43937.1669903188709992153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uNUXdbbQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id s8so2607403lfc.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 05:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N260q/61QrgHvQ7Od8XoU5GaOdNWbxXWLxsg+pXLWFY=;
        b=uNUXdbbQxJBShPISdpmM5RX/DmF95DrcicW2vx3jr1CWInwIQuCwJ+LXpd8kBrhdAA
         /hKIFbMA7O5vFFsJiRaoJMPAN7uzfFWzOkW3y3fTSBm+zBi6L+xnBRxUvXZlhWwUt9pO
         4U7KbBiBirOhwHNnUkIshOaOoYzaIWZ4endfB9HrqPYd9WblipEHYEUlPJaE7V4s2iki
         7X+HYSw2X2TLuGBfjFQErcFaBpRie2WqZlNuy2dVzJzEAmc7BRZAMSbS2gZh3TqOVENp
         pWYcrG/Loq4nP8VFi67W/TjjHOaAqruqLbPpEoeS5awUQpQnR7EcawPmFNiPXrdWlqws
         UvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N260q/61QrgHvQ7Od8XoU5GaOdNWbxXWLxsg+pXLWFY=;
        b=mBPCOBuLrkbMYBBHfksv5GepJQ3NjK0MavY0Jp+pVGddBx6HmwQp0zNKgm/tePHtbT
         YzFAXwm6koZsPkYb07tzSPsSbVkI/+Uk/gZkCtQSBfp/gVoYHW56GrVz33vyRvehVQQo
         6Q1CYQisSenTnNR4biyNTLrh2yYbMUCtRlHtsh+yW0NT0Sv/QRCHO2C0DnQiD/e1L5/4
         RMuQ5ZtECjQEF1buHsQ2uxOWkJamincNDO0AZLiXHIyxAZvMNGYkXQ0H/opgxLt4Glrf
         cGLAdvODI0M8MAlLU6NSwcHw9OCWsgh4qQLUpjNehIZr5BsSGOVBYMt4coiP1SPf6Hdr
         pfhQ==
X-Gm-Message-State: ANoB5pknOdD1iAGxGna1K117wzTQAT2mOS9VnuupRwdVttFWyj3Hbc55
	PhywGL3pn0Qfac5oAtHr6ypJ0dMPGiVmpcZb
X-Google-Smtp-Source: AA0mqf626tJZNO7d8mfiu3kwZKH8gtL/pwlxM7bXoXa8iDJzWrTqT0EyHAavufkSCBUo4rltTl5SRg==
X-Received: by 2002:ac2:5d2b:0:b0:4b4:baee:a5fb with SMTP id i11-20020ac25d2b000000b004b4baeea5fbmr19513997lfb.567.1669903187121;
        Thu, 01 Dec 2022 05:59:47 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id m15-20020a0565120a8f00b004b4930d53b5sm656564lfu.134.2022.12.01.05.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:59:46 -0800 (PST)
Date: Thu, 1 Dec 2022 15:59:44 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-devel@lists.openembedded.org, schnitzeltony@gmail.com
Subject: Re: [oe][meta-gnome][PATCH 3/3] gvfs: use native ssh client
Message-ID: <Y4izUPTB/BlGf+vU@nuoska>
References: <20221201134148.116754-1-alex.stewart@ni.com>
 <20221201134148.116754-4-alex.stewart@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201134148.116754-4-alex.stewart@ni.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 13:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99891

Hi,

On Thu, Dec 01, 2022 at 07:41:48AM -0600, Alex Stewart wrote:
> When the `sftp` option is enabled in gvfs, meson tries to find a valid
> `ssh` binary in the build host's PATH during do_configure. If a -native
> implementation is not found, meson will try to satisfy the binary using
> the build machine's hosttools directly - which is generally undesirable.
> 
> DEPEND on openssh-native, so that an ssh client implementation is always
> in the PATH during configuration.

This sounds wrong. Why doesn't meson look into the sysroot and add the
dependency to target "openssh" (or "virtual/ssh-client")?

If the path to the binary will be hard coded, then that needs to be
fixed to be the path in expected target system rootfs.

Cheers,

-Mikko

> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> ---
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
> index 4c251d2f4..9e29afd48 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
> @@ -12,6 +12,7 @@ DEPENDS += "\
>      gsettings-desktop-schemas \
>      libgudev \
>      libsecret \
> +    openssh-native \
>      shadow-native \
>  "
>  
> -- 
> 2.38.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99888): https://lists.openembedded.org/g/openembedded-devel/message/99888
> Mute This Topic: https://lists.openembedded.org/mt/95382229/7159507
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


