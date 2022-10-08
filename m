Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC03C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 18:49:04 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web08.6772.1665254939323909953
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 11:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HZYREvRI;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1322d768ba7so8810117fac.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NaZKypnzTG0n0Z14qJ0niYRHbPVLhrnGgMPejM4Creo=;
        b=HZYREvRI+vdygUfu2LikrlA+ej8I99YoBpfwV4Dy4vyyKm4TMR57Rpv7zxsHfkmTtn
         BNutkn8TF1DDwOji4cWDh354aZyrRx3ZJs9YiuKR550P7OgOR6ibTB1MO9u5CulRlWPZ
         9OZ4EQn9Ql7l+vvTWXUA1kVlshbqWiufCN/4EMt+6GJLgSMYSBYlsgOS8vxaUQL45uC9
         HK39KNHLxX9u+/gMRx2vV74KCu/+DSOcLVe4w3BOfK0Xycb10xt703sKj3VmySwPTI1I
         kJufKkDfzvHXFSUrMrgK9oSp7+xl48e3ewFZrjdi4wlyVmiJOkAlhdgnSBK0O0GHDxDC
         wbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaZKypnzTG0n0Z14qJ0niYRHbPVLhrnGgMPejM4Creo=;
        b=o/gTc5E1RWhojLljJBwIdRdjowbbTuWh+fnJc/eTSmNr4kyf9InAieYMsPzHeWlc+X
         E8uQ8qNgXh+0lbZrbTt4vmrQOSa/j46bI3Ca3818+HkzwviIjPKbpqgyvbKxrtgJNqjJ
         WA2fdl3p0RljsiS6lqkh/OozVC/DPxKwwR3F0G62yLLRtYLGYk91W/bPpYCoknhkBkMT
         z83G0eYUpiQFPmfM3BSRTMUfH7Oi1A3+uvqYr7wDxr9BQ+C/vJrhqn4TC3TcK/GT2KYH
         UTiCkehEMKQMuqf5d3LtIM4dqnk9U9GJZ6rl3EVcJXTwFWFDCF/VuL0SYGXvpvwY9mSs
         jzjg==
X-Gm-Message-State: ACrzQf13RR9LMHiMttlKd6hbDGEmFTgdZN3CuIc5SKRZgohruaD+dS/d
	sspSpwzut2Ih43K1j5F6iufIGFt4ao2aFcbCSGY=
X-Google-Smtp-Source: 
 AMsMyM5YtcxzYFspEJLE+Dmgt6DFE0LjetcD0c/rcMz55WIXvIv91xh6E0VrZQlskUOO1lz3Cr7rU4aha8Nwevi/g2U=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr10815714oae.262.1665254938469; Sat, 08
 Oct 2022 11:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221008112024.39451-1-devendra.tewari@gmail.com>
In-Reply-To: <20221008112024.39451-1-devendra.tewari@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Oct 2022 11:48:32 -0700
Message-ID: 
 <CAMKF1srRYuRWDuis7OAyuyV4PFs5gC+hRUPc5M9X-z3dhhTKUw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: Bump SRCREV and add
 libyaml to DEPENDS
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 18:49:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99098

can you rebase this on master and resend?

On Sat, Oct 8, 2022 at 4:20 AM Devendra Tewari
<devendra.tewari@gmail.com> wrote:
>
> Remove boost from DEPENDS because it is no longer needed.
>
> Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> index 0b9f3f7a5d6..53cd94cbf0e 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> @@ -12,13 +12,13 @@ SRC_URI = " \
>          git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
>  "
>
> -SRCREV = "acf8d028edda0a59b10e15962c2606137a4940af"
> +SRCREV = "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
>
>  PV = "202105+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> -DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent"
> +DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
>
>  PACKAGES =+ "${PN}-gst"
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99096): https://lists.openembedded.org/g/openembedded-devel/message/99096
> Mute This Topic: https://lists.openembedded.org/mt/94197373/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

