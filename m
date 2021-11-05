Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8481FC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 04:39:46 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.1449.1636087185911642584
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 21:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IKPeX2C0;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id p17so6706889qkj.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 21:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2ja46j5o/hwvReqCcH0YljSDj6MRem4C1i/ygR2o98=;
        b=IKPeX2C0wJZQcdVZFhNUFXJnxLfsrvKucOOPMQ01Mn0v5GOSTgX65vHUd/KXMGRWyI
         DhTPAFQuCugfoYp9r4EMWu3PoV1PYXTz4fapDZvL7f93ICwCIVOBoE1aDtzpIQ+s9Tg3
         nENlIUBfPXvq23r+M0B2DyhsPuDJcfLlawpQ0mTI382+OWPWKMGBlQLc9htfXDDHOMoh
         gyKJB4RFmd+uigQb3uqG+Ad7Wr6OuVKs/Zg7kmbJAZwcv9KnzPPmhU4z4eN5+f6pL/wm
         4H//L8brB1TJpYDf5qGBMfO6SDLcQ1PnvsTeijcMmdBMEBy//j78X/fvXL+C6h/6mkxp
         agdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2ja46j5o/hwvReqCcH0YljSDj6MRem4C1i/ygR2o98=;
        b=zZ2G5K02FrhIprYtt5jxtVltH9Azx5jh8i29+N19kU6rlQFFTLI4oF3URcvdJHGGWw
         egGcPMImZwN41zIp7YP5OVKIPh7EY5BmOuWL/PQhW2Ys0BJ9IYq32Hp+7B+LVx054/4V
         M+vPkxFrrB8t+wsvoDXGQQR329M7w5Lx1zCDHPjfrcAu8K3aQiCMyReFcP8pBBQDZRMN
         f/EJJUzQ2Q8CdZTWayQ1aQDYyA8qERUW2PjJMgPKbxQtGe+gyrflQqYYAScBGw83z9lo
         MihidYRMJZwoo7OgIgWi81Koj49K9pHSbnKcxq2SipFdEYbtd7gqwcCrE2yclY1p1gi8
         vEcQ==
X-Gm-Message-State: AOAM533OSFCk4POrEoAQzDiGM4MgwMFaKJUyTJ1MdT/pxfoVzzr/DfRd
	Z+BhtJ4XLZoerKYRyLwSHMC14DTi3YhpXfUdiXc=
X-Google-Smtp-Source: 
 ABdhPJyD2JnckM+iIk706w6mea2M/VF9R4YmqOCVGBL7ffmq5K0TUA+9rTHoZk8tbIoYl6vaU/IdaTaK4gqMfcpgKKg=
X-Received: by 2002:ae9:dc84:: with SMTP id
 q126mr46611630qkf.128.1636087184929;
 Thu, 04 Nov 2021 21:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <d7764d31-fe66-9515-f889-938cb44054ee@gmail.com>
In-Reply-To: <d7764d31-fe66-9515-f889-938cb44054ee@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Nov 2021 21:39:18 -0700
Message-ID: 
 <CAMKF1soUwah90vFfyHXyXsh2xmsqCqWyYBCk+K4M19HgpRuvsA@mail.gmail.com>
Subject: Re: hardknott merge request Nov 4th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 04:39:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93827

merged thanks

On Thu, Nov 4, 2021 at 9:12 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit d378e4293d18e374f5d1494a88bfc3caee4d02df:
>
>   postgresql: upgrade 13.3 -> 13.4 (2021-10-23 07:39:43 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to 0b0ab6a2d227f22374268d29fcb8e4f9dab5374b:
>
>   android-tools: Define SRCREV_FORMAT (2021-11-02 05:57:09 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>       Apache: Several CVE fixes
>
> Changqing Li (2):
>       redis: fix sereval CVEs
>       redis: upgrade 6.2.2 -> 6.2.6
>
> Khem Raj (2):
>       gst-shark: Define SRCREV_FORMAT
>       android-tools: Define SRCREV_FORMAT
>
> Richard Purdie (1):
>       gattlib: Place pkgconfig file in correct package
>
>  .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb           |   2 +-
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             |   2 +-
>  .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   |   1 +
>  .../redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch          |  10 +-
>  meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch       | 257
> ----------------------------
>  meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch   |  35 ----
>  meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch   |  42 -----
>  meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch   |  61
> -------
>  .../recipes-extended/redis/{redis_6.2.2.bb => redis_6.2.6.bb}   |   9 +-
>  .../apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb}            |   2 +-
>  10 files changed, 10 insertions(+), 411 deletions(-)
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
>  delete mode 100644
> meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
>  rename meta-oe/recipes-extended/redis/{redis_6.2.2.bb =>
> redis_6.2.6.bb} (83%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb =>
> apache2_2.4.51.bb} (99%)
>

