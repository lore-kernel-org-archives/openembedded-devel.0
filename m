Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89E1C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 11:06:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.9608.1646305614986326115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:06:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=vxTKu9WN;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so3907009wms.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NGkOgNM/mRV57JRIR/649qmBdbcDE80mU96A0xBnxRs=;
        b=vxTKu9WNOnB6jiB0Hiv79WY5uuYpDA2Zdwx16xEER2leUjzEyBBkVsUlG2LQdIcRZ7
         nMABAGed1uJ87bBVmyrZ8HEv6JtWFtN0Mt5HQ9k2NyHsDtVCVi+Pp6R/cU0dxOYhDJYJ
         868p1+sQWhWb0tBxqXvNUtortre3KKsmF/D18p3dVeWVGROEXMKzJ7oF4tsNEGVrSi+w
         G1444y0JUv8q8prvxcigWwWPJz2Zw0eI8SPWoFJ3Jtw31GwjAUvqSt0s+L6/zkCpTIpF
         Ivu0kCjXFsbi63vNUCJNR1X+cDAjB1U9UIY0rQT/ZHhDJSE/e8GMPnDQ2LI/NBOMjYt0
         QeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NGkOgNM/mRV57JRIR/649qmBdbcDE80mU96A0xBnxRs=;
        b=dR7MAycqgyYs9ipfodMd3GJ1wzbZRqwJpw1GX5T0QAoXWxiVsbvUPr8GMbYOwOTND/
         BhIjHqdsjfenX/rqKyY30Bi/SJxhfocAhvPF4WAvNuSOS0MDan+2Fn8AKPUnN38cvNAx
         TincxiFwMqSdsmyDZ+Av8/SG7Klc7kbmZQivn8YPzxW2I9/Kii4Jzu8ZlQzOcvpEtcMa
         KOLB56e88RG/OAAGk3zVqPLPZkMLw9QqAeLnmUGoQomf3J4V0tV0OHrC7LmRcCtA6Rbj
         yDB8k5sqraOg6Gkhge5O6bcWHJ51w10P9Ph69tDYxKQ+L73JprS6+vQ9RzhnOzEmKDPl
         RgRw==
X-Gm-Message-State: AOAM5301DrRMyPhYtYCPZFIVgz3AIiIeyALanXEjwohfxITZfto3yrGa
	4vF49S3c19ImJDRVKO9DztIY6M6uEqZvSAzJz4IYEA==
X-Google-Smtp-Source: 
 ABdhPJxcqWgzaYgmGZZcVLA+J9UDuFKtV0V6cZsd61Ub5kzPE1P5d8fpsA8tAWMkL2ciZHQgSgjJE0LPWU2mW6UMHQw=
X-Received: by 2002:a7b:c5d5:0:b0:37b:fda9:a5e2 with SMTP id
 n21-20020a7bc5d5000000b0037bfda9a5e2mr3368087wmk.62.1646305613265; Thu, 03
 Mar 2022 03:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20220303040416.874842-1-raj.khem@gmail.com>
In-Reply-To: <20220303040416.874842-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 3 Mar 2022 11:06:42 +0000
Message-ID: 
 <CAAnfSTtoszebXPuh-0T4qXRo7Tu=MUFdF5mCYRLuSNzkiTOGAQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-blivet: Adjust install location
 for binaries and systemd units
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 11:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95738

FWIW, this happens with ufw too when it's ported to use setuptools.

Ross

On Thu, 3 Mar 2022 at 04:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> With wheels changes it is also getting installed under PYTHON_SITEPACKAGES_DIR
> perhaps something to fix in setup.py but this fix works better from a
> packager point of view.
>
> Moves the systemd unit files and daemon into /usr/lib and /usr/libexec
> dirs
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-extended/python-blivet/python3-blivet_3.4.3.bb  | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
> index d79fc7d003..85575df7b5 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
> @@ -23,6 +23,12 @@ inherit pypi features_check systemd setuptools3
>
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
> +do_install:append() {
> +    mv ${D}${PYTHON_SITEPACKAGES_DIR}${exec_prefix}/* ${D}${exec_prefix}
> +    mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir} ${D}
> +    mv ${D}${PYTHON_SITEPACKAGES_DIR}${base_libdir} ${D}
> +}
> +
>  RDEPENDS:${PN} += "python3-pykickstart python3-pyudev \
>                    parted python3-pyparted multipath-tools \
>                    lsof cryptsetup libblockdev \
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95725): https://lists.openembedded.org/g/openembedded-devel/message/95725
> Mute This Topic: https://lists.openembedded.org/mt/89519129/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

