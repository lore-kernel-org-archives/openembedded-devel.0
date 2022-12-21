Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB90C10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:48:43 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.17836.1671626915654306159
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:48:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=IwWwWGNx;
 spf=pass (domain: norberthealth.com, ip: 209.85.215.182, mailfrom: roger@norberthealth.com)
Received: by mail-pg1-f182.google.com with SMTP id v3so10338437pgh.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 04:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uDfgwbsFMs1jOChJdCInsoT5auKRDPF1ocu/rYVYiI8=;
        b=IwWwWGNxQIW06HrQ/8gHDVxziY+fqZKLEBAPWGwB6VEQ/m+eAYh23AsHh3gMwZz0gg
         dOvg9RiomNcokHojQsj+yopGnnJWpV+XGJiyo2w4KZzaGfraeuxwhlBhuovGW4KknYuD
         T7BqQkJldwAjtMoB+jh4dSSdObgbX4r8fSNN49Htrs48w6Z7syv0ZXZD6x18GJwef7qL
         0u5GZbBkXa4X9jeMwBaotBCM8aROMJHmru9EPLZ4KWe8UR1kgh5BkQEpJ0R0VZagloxG
         lVm2xaeOc8AiD7yN8P5XHSaN8QAuUs96st+Rgjw7q4v/QL1cJcm8oLYDk4AZXYV0rRt4
         abaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDfgwbsFMs1jOChJdCInsoT5auKRDPF1ocu/rYVYiI8=;
        b=JYcn8VyuVz3v3YSHwKoAfR6QcOFRZVw2enXfCCrYsK08HKvpOA0zIYYADrOtbhrYYl
         FXDtcJcjtrI8qZaxdTRDHJP0qE2esSKtNXReT/jLedlZW2f+nz/nOKgmvQe4WGbCShXn
         pum/HwUbVgQU9wBDW/m/XIPTWCQ2qFZBmDJ9zc8TU/6cx5ssipho3dUbakhhYez1iwcP
         D9ukWEF1T5jqSD1NG09UJVvk0u+hk8WRU6j0z0iuJArQeUeM16329spCvT1ty/MwPq73
         iaLtslZcRJw0MZU7oA6W1PiOLHn5SOWKhuCM4KnfDiKUUEte9vbbKVhLq7f2VNPj4OCl
         8Fgg==
X-Gm-Message-State: AFqh2kr9z6T67hYVertjSTifsxmwgcRy90srA9dnbj6Cfv0FfCSZk31Q
	1TORklLD92/cRAT3LBbSTGZuKaiccuYh/AijRCwG5Q==
X-Google-Smtp-Source: AMrXdXscfstJwMxWrGZjupzVn45WES1O5e2e6YVubD9+HFiLNk/gHndZcYJ+TMG6azy2iFzZ9ysO7InkVJTutmeNs5c=
X-Received: by 2002:a63:5d55:0:b0:478:b931:9388 with SMTP id
 o21-20020a635d55000000b00478b9319388mr101420pgm.400.1671626915014; Wed, 21
 Dec 2022 04:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20221213132244.22529-1-roger@norberthealth.com> <ae0b1740-e9d5-cd17-2cd3-2ddfd15eea23@gmail.com>
In-Reply-To: <ae0b1740-e9d5-cd17-2cd3-2ddfd15eea23@gmail.com>
From: Roger Knecht <roger@norberthealth.com>
Date: Wed, 21 Dec 2022 13:48:23 +0100
Message-ID: <CAO_iFwqhrsRuc1UNQt-oFyv34AgkP-wMskuKPVE7X3GKJ_KBdw@mail.gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH] yaml-cpp: dunfell backport
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Justin Bronder <jsbronder@cold-front.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 12:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100181

On Tue, Dec 20, 2022 at 4:07 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 12/13/22 8:22 AM, Roger Knecht wrote:
> > Backport yaml-cpp 0.7.0 to Dunfell
> >
> > Signed-off-by: Roger Knecht <roger@norberthealth.com>
>
> What is this fixing in Dunfell?  Adding new packages is outside the
> scope of our stable branch maint process.
>
> -armin
Hi Armin

I was not aware that backporting new recipes to stable branches is not accepted.
In that case you can ignore the patch.

Roger
> > ---
> >   .../recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb  | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >   create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
> >
> > diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
> > new file mode 100644
> > index 000000000..d3984abe8
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY = "yaml-cpp parser and emitter library"
> > +DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec."
> > +HOMEPAGE = "https://github.com/jbeder/yaml-cpp"
> > +SECTION = "devel"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
> > +
> > +# yaml-cpp releases are stored as archive files in github.
> > +# download the exact revision of release
> > +SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
> > +SRCREV = "0579ae3d976091d7d664aa9d2527e0d0cff25763"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +EXTRA_OECMAKE = "-DYAML_CPP_BUILD_TESTS=OFF -DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TOOLS=OFF"
>

