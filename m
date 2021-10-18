Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C804C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 17:44:56 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.39884.1634579095598911091
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YXGh/VcW;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id f5so16930347pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=603CDHiXG7MwnOBSwe22m7CXIsaWK4hZVX8o5DJl7DQ=;
        b=YXGh/VcWS/M5duHgWf7olTjqNZqeWr76JcCcU3K03mI2rHpW2/lHUrGlvrWUVIP9RN
         TKBNbsWB6WDuasmYJh31KFEdb721gub+UVFgCM/VfSURq4EzJwAKnqtUsFx+9HQJ5FGN
         15puyBeIFv3vqcAr5BFB7Mhd+VIuelDaBfO181pyiVuz8JAWrH87ZU3Se5l2PWzXOm1z
         OySNiYTAxpBm/H4IBxr3lsSYBeX1RvRF+CE9wTyp9JnLSUT5j3zmABBcTGpy+m7svGJN
         6ZoLI/iQAPkS+jq5ASiC97X66na9HD06t5FSIFBCpyi/TfJAiLEjzUhrINjxFMFukMj2
         t5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=603CDHiXG7MwnOBSwe22m7CXIsaWK4hZVX8o5DJl7DQ=;
        b=ocn/XzfOLQYX8OGCMWZkwlczsRJKtYum3N3E0Sw320PEAP0D8iOrYLG09Pid+SjpoG
         u191i7XygVPNW+07D51RexrBPHYiLeFlFcwLdVaPFyKmssiSIs56wS3OSQqs/Olp/EXm
         KmMNRpj0d+mcB/cTKNQiG8CDFxdRQ8xE2J/vGLDxDPBHdxeIp2RIcMlvx4qwbOqVZWCQ
         GFHHNuaDqF0uSq9JmFqeV/TYPGyoT7s8XphSNLt+9s2ikMQ0vSZWnjLm9dNEN6C28wgz
         NUU9ZGDWpkf3cdVopZwUI4zYaGKocnnWU04L0GWuJaU3Vi0WxPJkP/hpaDLHTfOWl0wk
         oTyA==
X-Gm-Message-State: AOAM533RDJ3TXWQnFJyJpx5CVyO0CDAJKLf/EGjOfggq5XYlwDqcaddf
	WB7CorTHskxuu1tOstuP5SX7gcMSiaGH9R7H1Kg=
X-Google-Smtp-Source: 
 ABdhPJwKcLt2hReMjty98Gz8LrE0KfZHyg9y0mz5jwH7w6ab7dD2ERV0fI/ZO232LnQSHFw0J86ETcClXZC8nb+AIX0=
X-Received: by 2002:a05:6a00:2343:b0:44d:2e13:3edf with SMTP id
 j3-20020a056a00234300b0044d2e133edfmr29896140pfj.72.1634579094996; Mon, 18
 Oct 2021 10:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211018173750.3739908-1-JPEWhacker@gmail.com>
In-Reply-To: <20211018173750.3739908-1-JPEWhacker@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Oct 2021 19:44:42 +0200
Message-ID: 
 <CALbNGRRg=k_fJ6H93ViJOcV7V195w4aWecdyyTjeue5XhjkB7Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] mutter: Move gsettings to a separate package
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <ticotimo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 17:44:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93438

On Mon, Oct 18, 2021 at 7:37 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Move the mutter gsettings to their own package. Some other compositors
> (specifically, phoc) want to use the mutter provided gsettings to remain
> compatible. This allows those recipes to pick up the runtime settings
> without having to pull in all of mutter
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
But now just adding mutter to image looses gsettings. Could you add a
RDEPEND for mutter on mutter-gsettings?

Andreas
> ---
>  meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
> index 72e776719..1a81745f4 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
> @@ -73,7 +73,9 @@ do_install:append() {
>      done
>  }
>
> -PACKAGES =+ "${PN}-tests"
> +GSETTINGS_PACKAGE = "${PN}-gsettings"
> +
> +PACKAGES =+ "${PN}-tests ${PN}-gsettings"
>
>  FILES:${PN} += " \
>      ${datadir}/gnome-control-center \
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93437): https://lists.openembedded.org/g/openembedded-devel/message/93437
> Mute This Topic: https://lists.openembedded.org/mt/86420550/3617609
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [schnitzeltony@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

