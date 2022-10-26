Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1D9C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:04:04 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web09.8038.1666793040203650021
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Oct 2022 07:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nFL8018B;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13ba9a4430cso11390758fac.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Oct 2022 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gYlmBcVEpn4nh/38MfN15WVtHTGJhAjL/ntMZRbeAtM=;
        b=nFL8018B6H1j54B5DooZQMMXoaDa1rO281Au67usj2dyL2Cn3D2oStFlY42ZME/sl1
         boNC1Onf5Vnoj3K2kOS/pdn+XBlCEWiGCxzYQAJn85gW0M9IsDFfpN+XEhHW7fcp3FDt
         mH7MzAvXJYfanxuT0u7TYrbDdGYxpKHj4IrrNkTmr6Zc21MfEqPJjatrnsjnhi4xlS+0
         IaqduSizFH3QTsvPhPb2p9l6H4JrM2fz0belPRKklwVgZsqcP8kmu+jyy+VgDHWqoIwq
         OOc+xAZPfo9L/R49fYzKh78bAciIebIPzrbUb0LDM1SYXbTU92C/yQ5lZjlIZk4aK1aV
         sdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYlmBcVEpn4nh/38MfN15WVtHTGJhAjL/ntMZRbeAtM=;
        b=0loonA3vIWpC1ihOJLLEm2DUuyndRp8fTT7o32roBz2ck+aLd2XYek9hb4rI9Pu4l/
         AxeeCTzEk6GNCw9d1ztUSDWWMlmsyQpj+TAvZY28+hdVRhhcxbbScw0you/yQb9WZBcH
         YuAnsGMsC0cg3tASdm+BbfmW5SrMiohTT51uD6v89GvQ2nSNV6JICsVCCf59IW3a/Acy
         q+4jch4Q/YrWfHJdGYlQXZM7sK6Bb9SH1ExqAIY6FzunOXfunopU9/hAhEWfIyLcvRyA
         /5dpsMq6btscdk0Uld3vc2J9pHAfiRRgFvjmBnrZuyxdG4q7EpexegQz7r2fwHAYPpsA
         mAHw==
X-Gm-Message-State: ACrzQf1ueIMyd45PJ4AicTOqYfglUYs9tQ+/qAS1Vx9RahGSHmqiYF3i
	YP8OS8hfexcUmZHCqU4ejhqRqgzRcAAni4wc/4Q=
X-Google-Smtp-Source: AMsMyM7XpOIHUfRCl445Iss402kYNnBB3X+i0drrKDOzi5SHK2LnoS6MD9na9OV7mkywsFSZxEkJmpZ9N3kkMUarWIY=
X-Received: by 2002:a05:6870:80cd:b0:13b:9ee7:34cc with SMTP id
 r13-20020a05687080cd00b0013b9ee734ccmr2158693oab.55.1666793038019; Wed, 26
 Oct 2022 07:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6RADDDwCV8mnAzL68r2X28yJHXnk-Rcxh9MzqCZVXg6GOrFQ@mail.gmail.com>
In-Reply-To: <CAD6RADDDwCV8mnAzL68r2X28yJHXnk-Rcxh9MzqCZVXg6GOrFQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Oct 2022 07:03:31 -0700
Message-ID: <CAMKF1sqDAHBX6t-zeeBrorf6CSio0qPhVXte=UJJJaL6A9x7Xg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] jwt-cpp: add recipe
To: Meier Boas <boas.meier@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Oct 2022 14:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99314

the patch seems to not apply perhaps due to malformed characters in
it. Can you check and see if your mailer is ok

On Tue, Oct 25, 2022 at 11:27 PM Meier Boas <boas.meier@gmail.com> wrote:
>
> From 02b6a81c2a98bcc0a643f20d1e96d14b4269db30 Mon Sep 17 00:00:00 2001
> From: Boas Meier <boas.meier@siemens.com>
> Date: Tue, 25 Oct 2022 11:28:40 +0200
> Subject: [PATCH 1/1] jwt-cpp: add v0.6.0
>
> Signed-off-by: Boas Meier <boas.meier@siemens.com>
> ---
>  .../recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
>
> diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
> new file mode 100644
> index 000000000..8929115fd
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "A header only library for creating and validating json web tokens in c++"
> +HOMEPAGE = "https://thalhammer.github.io/jwt-cpp/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
> +
> +SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
> +            "
> +
> +SRCREV = "4a537e969891dde542ad8b1a4a214955a83be29f"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "openssl"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF -DJWT_CMAKE_FILES_INSTALL_DIR=${libdir}/cmake"
> --
> 2.30.2
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99310): https://lists.openembedded.org/g/openembedded-devel/message/99310
> Mute This Topic: https://lists.openembedded.org/mt/94576306/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

