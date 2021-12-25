Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B3FC433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 19:04:20 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.10013.1640459059462591003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fdLHjFaD;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 131so10964703qkk.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZtlguc5S6hW8dTrbmZccvhqSWuuO7EWVHC2qAYzpWU=;
        b=fdLHjFaD3UOmH23vGoY/8/H26lqaimWTPAJb3nM8o+7O5qczmJjLO6DaQ6PwxGdcxZ
         HLIa2EvrHlYA1ecy7hgoKYwQ+Oxr+ODLpwdmSdb2gnGboA8HawH2m5HHxktb8tU8WpaO
         cxYmGIzAf6ZocJqIDrx281x9HtxYPlifi1/h+s62HHLIfqT79zBhhdI2vkxxJuIkmRrx
         WcClMu53/KHZm2MVBMUAfMO+7epGTzX7mnA0sjS/4dLqeJLhAVzsaOIOLtLeIlXserw4
         uWJM+jiTbigWJ5arQ/ae+7kolsHBs9eb/dPskT+GuKFYwT25cA/6LCKiht0QDsCTVSgq
         k0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZtlguc5S6hW8dTrbmZccvhqSWuuO7EWVHC2qAYzpWU=;
        b=f+BJdhMOVecNaLAD9/qaZFflJvcwvYMcUcyX+SgDZ4Tc5tGqbYMeW0t3Xw02tqNGlZ
         ZjL/I+vCTywhBrdARbUZgcJun1qsPHhOgMuRDmeh9cr+609Q8UvAyyMLPuF0w0/rPOzv
         dmVcAlRXp5U99SLPTRpZxEzOLg8st4SkRdFIsuR3Vv2ihaNQ7Y1RVzneuSp14ehOQZ2s
         yT9NoETjnRTO9YTsSF82iG9dWXiEQv80MOkNuOWJSEs1QXrdjAunPitNDFFcemUpFtWd
         Jg0E5Ayg6XzD8L74TaEhBWQh5tAcEEN0MGtl8BoKqwb+n3hXojVz60S83/OM1yxA5SRH
         zKBg==
X-Gm-Message-State: AOAM533awVSzohX75ai/mj8fjXSWk3zDmRWkz111ysTdQOUytcKThM+6
	gPXlAkcnSrWpElUfH/bl/jKz4/a3XdynKgz3CP8=
X-Google-Smtp-Source: 
 ABdhPJyh/b8VO40wehUZLxytvSW18H3frsJGd1BbUnaFHuJewt4Xqps/6LWgRzEg8cCwRyvNUkM8x6X+1vpSLUz7sss=
X-Received: by 2002:a05:620a:1496:: with SMTP id
 w22mr7855092qkj.463.1640459058458;
 Sat, 25 Dec 2021 11:04:18 -0800 (PST)
MIME-Version: 1.0
References: <1640156479-18846-1-git-send-email-xuhuan.fnst@fujitsu.com>
 <1640156479-18846-2-git-send-email-xuhuan.fnst@fujitsu.com>
In-Reply-To: <1640156479-18846-2-git-send-email-xuhuan.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Dec 2021 11:03:52 -0800
Message-ID: 
 <CAMKF1spm31RDgEU4xbj-WLT3898BwB4DAveu8b_tHFqjpFGxSw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-h5py: upgrade 3.5.0 -> 3.6.0
To: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Dec 2021 19:04:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94496

see this failure

https://errors.yoctoproject.org/Errors/Details/620174/

we need to move this downloading into do_fetch task from do_configure.

On Tue, Dec 21, 2021 at 11:02 PM xuhuan.fnst@fujitsu.com
<xuhuan.fnst@fujitsu.com> wrote:
>
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
>
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> ---
>  .../python/{python3-h5py_3.5.0.bb => python3-h5py_3.6.0.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-h5py_3.5.0.bb => python3-h5py_3.6.0.bb} (90%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
> index aad2f91777..5b0510f710 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
>
> -SRC_URI[sha256sum] = "77c7be4001ac7d3ed80477de5b6942501d782de1bbe4886597bdfec2a7ab821f"
> +SRC_URI[sha256sum] = "8752d2814a92aba4e2b2a5922d2782d0029102d99caaf3c201a566bc0b40db29"
>
>  SRC_URI:append = " \
>             file://0001-setup_build.py-avoid-absolute-path.patch \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94481): https://lists.openembedded.org/g/openembedded-devel/message/94481
> Mute This Topic: https://lists.openembedded.org/mt/87894018/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

