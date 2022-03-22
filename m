Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E31C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:41:31 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.12445.1647967290294746966
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZNR2VHG;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id kc20so10286176qvb.3
        for <Openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pdczK4xovc9fMzMEAORJiLJ6Z8TkS6BeSeX8GV775C0=;
        b=mZNR2VHGh4oKGbbybplCRsX6KRH4VObKa5xXcUg0Dxn1X9IG3Vh8UTjIVk19GP913y
         NKQkbareI/mHW/mBou9n++9Wyuk8UFur9krEP5PPTMlDhq9nTLoevV+focE2aXtwkVUk
         MPdQTlevLfcrIZ3EnGLYOLes/c33sgK2l8JciF4ZdqgSy2EuFEwj56ueBVg0gYi+2y6y
         lVpN8ZORzHrjghsYN9dPgXovcMABvHE53aAKx6Lw/6R7c1/cGqVQkm3PjNl0BYpbWiS7
         38EKfvcqzm/0k7e9AjMMPxbGA7ppn+Zd5wYSsgwbte6uaSwzbZaLPNhiHyHuhsfmMeQM
         ZXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdczK4xovc9fMzMEAORJiLJ6Z8TkS6BeSeX8GV775C0=;
        b=YDLcB6ua+1WN5KMb/TrNCqE5Tl+4qKWGXUX1DBMwHYn6aUseTil4jvINWkYV8Ec7kZ
         9KfHwoFTR+2GL0nO1/UAFXOLaHE+VZNsjtJJDho7PlZo5NeUyHCNYJcaPXcvSRV1REot
         QiVZJp7qgM/k84D+i7qtxJnZPG5rvTDq6+rpQtue5zcdOicxXB/YrW+yRDWoji4EnUhY
         M6XRskONmuVKJlax3dM5k2ALeabjqrxAk3OIOjinvEpLMgVfX5ATA9giidM206MFtDnU
         8uB8liV9nwTSUMunH8jJB4nSj7vFPX1Ps1u1Lus6GYZ7XIXbtpxXdnMAj86mvgTY0ypF
         FeZA==
X-Gm-Message-State: AOAM530gIGHNV12Lmd3T1ug4F6zFfIFLTHH94Oefbgaf6rXR0/JwzIqL
	hDYnmp1rXPplaIH6XX2yhjFLNSVBEqC04zV7dCc=
X-Google-Smtp-Source: 
 ABdhPJwN2qsJzHzFa9MNhpGLJSu0c/JFYIkMViMRGO0rSZvO885G8ix0QZM9T3B4duyDo/y48FfAqRJwxxjvXbENP+I=
X-Received: by 2002:a05:6214:27cc:b0:441:499f:76ac with SMTP id
 ge12-20020a05621427cc00b00441499f76acmr2367113qvb.36.1647967289314; Tue, 22
 Mar 2022 09:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220322162913.1150789-1-preeti.sachan@intel.com>
In-Reply-To: <20220322162913.1150789-1-preeti.sachan@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Mar 2022 09:41:03 -0700
Message-ID: 
 <CAMKF1sqdVYHZz46z4MV_XTzQriUFgqqjBy7nK-G0BRH1sEdtmg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] live555: Allow output package if it is
 empty
To: preeti.sachan@intel.com
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 16:41:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96147

On Tue, Mar 22, 2022 at 9:30 AM <preeti.sachan@intel.com> wrote:
>
> From: Preeti Sachan <preeti.sachan@intel.com>
>
> Allow to create package for empty live555 as needed by
> live555-dev.
>
> Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
> ---
>  meta-oe/recipes-multimedia/live555/live555_20210824.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> index 0e0229779..2061173bc 100644
> --- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> +++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> @@ -55,6 +55,7 @@ do_install() {
>      install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
>  }
>
> +ALLOW_EMPTY:${PN} = "1"

Perhaps setting DEPENDS:${PN}-dev = "" is better here.

>  PACKAGES =+ "live555-openrtsp live555-playsip live555-mediaserver live555-examples"
>  FILES:live555-openrtsp = "${bindir}/openRTSP"
>  FILES:live555-playsip = "${bindir}/playSIP"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96145): https://lists.openembedded.org/g/openembedded-devel/message/96145
> Mute This Topic: https://lists.openembedded.org/mt/89956283/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

