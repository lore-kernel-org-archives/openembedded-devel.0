Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5543FC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:43:41 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.116.1646671420198005657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m8AmHU7K;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id b67so1555677qkc.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IB6+oBKJCHsNRdcjaR/GVbJkWHJ04++zf+TyRYyhsTk=;
        b=m8AmHU7K9zlJUIoD9lr4zEXjMgEEdOWPbL9giQzr5YYaOTcsKMUkhuSiiMl4Y00eFg
         cF1XFYwHv0lxOudg/Qr38Gh1UIHsMocT24VF37FHDDIgEgpHLppzl30jbWnyBjZKZWhN
         7r1+u3jMtKON88cMXAy1Y9nO4MBq36un58BDugWP6kEo2H5TmVlqOngtviX1FmNc9T/0
         xGG+qyJpA/YhNAtozlaPx5l3E9SmmW9jU4baFFG19r93e3Tmv3/oNUdDvllZAigQpHnV
         wUQa/PrIom1ohptnfzGVxNzSnSkVAbil6IJGAUaJpW6UokS8qEvk/Qst44Q+8UBVv1Xm
         VwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IB6+oBKJCHsNRdcjaR/GVbJkWHJ04++zf+TyRYyhsTk=;
        b=6z2iUy3juyZbhaDMTaAnGHxImInaYG5CqALHgImKrrHV0bmBgQ2btY/AB3S8Qv1VLY
         VxfPDPg+TDV3/j+Ga8nUY17GQyad6cExQSPPWvrKO/hJRLPCJXeKSrHX5w8gm2mCoak9
         i3eHZoCOAvcT2zggHJ398fquXfgH01K0KbTgCi4nOd/et53ouHciCqwE8lUy/InrjAmS
         0WkW1Ks+pgsz9TNor6lGnYw7VfMKjCG/i++zuX/MGJbFZbD3+9R8qyc+gGj8wd2QPExb
         vEV9QmbF01/TaTdBvWRHXbs7p82ho4XQZqVApecoOKsA++7XD6g3VZiJbDmfdW9cfxs+
         qZYg==
X-Gm-Message-State: AOAM532L8LQLVvvsj0MFe8yFULmu7RvXfrEK256seMscNO8eU41kP75J
	2HDevi4Qa4WhqeDYz4ZiRmwp/fXHkoDPxNSQ+o4U3QAxPAw=
X-Google-Smtp-Source: 
 ABdhPJyR5gNDWXqySDbqNUDfyEc2BNID8fKdgxCTTivx2PeM8WiJTJvIDKERpCr2ZXeLJxZsioJ98YMEPhSvTNMghwg=
X-Received: by 2002:a05:620a:372c:b0:67a:de08:875e with SMTP id
 de44-20020a05620a372c00b0067ade08875emr7527120qkb.149.1646671419160; Mon, 07
 Mar 2022 08:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20220307121112.1844760-1-ross.burton@arm.com>
 <20220307121112.1844760-2-ross.burton@arm.com>
In-Reply-To: <20220307121112.1844760-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2022 08:43:13 -0800
Message-ID: 
 <CAMKF1soroDYZze1Ry9XUHvypKvQoqCbva+UmMBX=pzkdrS9UNg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] python3-blivet: use setuptools_legacy
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 16:43:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95862

please rebase on master-next

On Mon, Mar 7, 2022 at 4:11 AM Ross Burton <ross@burtonini.com> wrote:
>
> The setup.py installs to arbitrary target paths, so can't use the new
> bdist_wheel installation method.
>
> Reverts daba6521f which was a sympton of the bad usage.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../python-blivet/python3-blivet_3.4.3.bb                 | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
> index fcadf130c9..bd57604f26 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
> @@ -19,16 +19,10 @@ SRC_URI += "\
>  "
>  SRC_URI[sha256sum] = "1b05b77f3ee35d82c7a577a168c9ba0204d3e9a87eb1975e5f9af47700eeff48"
>
> -inherit pypi features_check systemd setuptools3
> +inherit pypi features_check systemd setuptools3_legacy
>
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
> -do_install:append() {
> -    mv ${D}${PYTHON_SITEPACKAGES_DIR}${exec_prefix}/* ${D}${exec_prefix}
> -    mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir} ${D}
> -    mv ${D}${PYTHON_SITEPACKAGES_DIR}${base_libdir} ${D}
> -}
> -
>  RDEPENDS:${PN} += "python3-pykickstart python3-pyudev \
>                    parted python3-pyparted multipath-tools \
>                    lsof cryptsetup libblockdev \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95848): https://lists.openembedded.org/g/openembedded-devel/message/95848
> Mute This Topic: https://lists.openembedded.org/mt/89610238/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

