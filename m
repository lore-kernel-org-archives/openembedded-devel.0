Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6F7C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 08:07:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.9877.1706515623937652885
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jan 2024 00:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=IACADuBJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso35421515e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706515622; x=1707120422; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4m5FJg3uXRcPr42JBUlcKEUdi/V98CEJkCGhM2+I5s=;
        b=IACADuBJAnvK5b0Hg+v8px0EG1tAJScmZphIOAFUqnE9QK1/rVNPQ5tV3pJAmldCuv
         MQrMrmxtbSLN5JH2MLrPityugKLEkyGCAEqkFm2oPpfcajaik7p+QK6gcSGFPrNoh8eU
         paF2Q6y+nBBbvEYmCrCnWqEXp9VtT1Xt+OHEfEmAHwsRg2F2lNlZqXZdU2PrTkPv5lxe
         sYibJ1ewH13ShU0HRc0jpTtwfyxLqSYaSo+KqxPA6g+Tyx3zl/A0SyE02zYZ9Yc1Nb3j
         1zeArxHK6YSrwYp5yr/UbvEtRByzKyZUgsQLdXcuuOkqc8qgSrGUeuYWHc6UhnWXeBFK
         DnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706515622; x=1707120422;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4m5FJg3uXRcPr42JBUlcKEUdi/V98CEJkCGhM2+I5s=;
        b=U0xlt+YYVhAp1/tINYZ0dZKCB9S15qtWzS4ZUl4SiMIBHMEtyfGeCYRvPwo5dEA5aJ
         zo3A1HfG8y+z9zgab9jOb/EX2h8fowOQjAG/LNj6onn1amCZuOk1JfGSqXfiWyfNObzq
         Yg5KJF/8FiVotTxA3kevCd7C7R19GLOouSTUEdDxT5z08y92MgXjxW61qjhG8G897pNB
         HCJrwLe4yy0VsbUXGFtu2iKq63RvAJFtpadzVpLOGECwUJlukf6aMFgTCElmQs96iyUG
         47xsPbMFgBWiAtoQeov9+tKYxMMfpy+fj2SdnJXzDbaspbbl2TQYMyknhcWlS+Qoxhb9
         T2Kg==
X-Gm-Message-State: AOJu0Yy5oSyhNwt1Lrk9BIu/Fz6J7KL9Wm9xGEMhAZXFTWOxwn+cEEPL
	TVVj+k/tEkDzNPX4buYCs+CyMBi9zKXOFLOhrFsTNJKfJQZKGoJyIC0Cn+hItCpN38+6P79vnW4
	J/hk=
X-Google-Smtp-Source: AGHT+IFk+lgK0eQIk6NucHJea4ExcGT+L4IXjuSimzDUqKNFQnt85PfuLPi7e0qRDJwq30oNExEQTg==
X-Received: by 2002:a05:600c:420a:b0:40e:d30b:6129 with SMTP id x10-20020a05600c420a00b0040ed30b6129mr4184030wmh.13.1706515622141;
        Mon, 29 Jan 2024 00:07:02 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id a5-20020a05600c348500b0040e48abec33sm13110010wmq.45.2024.01.29.00.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 00:07:01 -0800 (PST)
Message-ID: <7d95b6d4-12bc-4f00-a391-b9c31d19e818@smile.fr>
Date: Mon, 29 Jan 2024 09:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] radvd: add '--shell
 /sbin/nologin' to /etc/passwd
Content-Language: en-US
To: li.wang@windriver.com, openembedded-devel@lists.openembedded.org
References: <20240129062328.1689458-1-li.wang@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240129062328.1689458-1-li.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 08:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108483

Hi,

Le 29/01/2024 à 07:23, Li Wang via lists.openembedded.org a écrit :
> the default setting USERADD_PARAM of yocto:
> -s /bin/sh
> 
> follow redhat policy:
> radvd/redhat/systemd/radvd.spec
>   useradd ... -s /sbin/nologin ...
> 
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Can this fix this error from autobuilder by any chance?
  stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot: radvd: useradd command did not succeed.
  stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot: ExecutionError('/home/pokybuild/yocto-worker/reproducible-meta-oe/build/build/build-st-meta-networking/build-st/reproducibleA/tmp/work/core2-64-poky-linux/radvd/2.19/temp/run.useradd_sysroot.818430', 1, None, None)

Link : https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/9/steps/29/logs/errors

Thanks!

> ---
>  meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
> index 219d88f49..5da31b3f0 100644
> --- a/meta-networking/recipes-daemons/radvd/radvd.inc
> +++ b/meta-networking/recipes-daemons/radvd/radvd.inc
> @@ -59,7 +59,7 @@ do_install:append () {
>  
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM:${PN} = "--system nogroup"
> -USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
> +USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup --shell /sbin/nologin radvd"
>  
>  pkg_postinst:${PN} () {
>      if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108480): https://lists.openembedded.org/g/openembedded-devel/message/108480
> Mute This Topic: https://lists.openembedded.org/mt/104026959/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

