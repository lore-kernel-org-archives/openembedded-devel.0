Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA6EC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 15:39:31 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.102727.1701790762441197237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 07:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=N9H1KRvB;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-332fd81fc8dso4749274f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 07:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701790761; x=1702395561; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lswvK3aDE47pWF+beeMw4SWltSVUM4RQZeWo8MH9/qI=;
        b=N9H1KRvBUdEgsJPO75PskdPdr2g/G5NPzLd/+4LONKqvGJELx82fCn33+RBd48Owl0
         JNlvcrXL2k6BVFUlYMFcUExJNQI2L+/OkAkQ2rg5fnvExtx6zkmB58flIIRcJ9L5pUcB
         e4jLhZoYBbjszcqz5o4bg0TcVKmBMmd4vOmT1Nvk+8SgI5AZ8YI7e7YvQ9SBSqnKRH6w
         cslr289Q1NlWvF9dfXTX+yRD5aXrh5cVkVGVmqzmQymN9Uv1DVtP+fgDZ/t1jxza7at0
         sW6jwW0P+m8Vnf9IsA//6tewubprOEB2ZXYIQWVN0+JY0zPOvt8yHrZtxzlT1GOXXeoM
         hikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701790761; x=1702395561;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lswvK3aDE47pWF+beeMw4SWltSVUM4RQZeWo8MH9/qI=;
        b=M6vdUAlQxdgJmJDScUcdip5i2C+JnM0uLA7nHHeQRNu/BKG/eQReMYXDSxMf/bThIJ
         sQpnNrCyOyHhVI3phA+2BWyTrRCUwaxBlA8BcZlH8iiVrMy4ewRsfA9cEqmsoaxrDSxw
         nd59+DKoP0Joq7+N43K+WNPlp77x/6ieYOpJaOgIYsZ30HZESZOS8Xfdgn75+F4rOkHg
         JkVDAEY2ZTrmbGS6kcjITADRA+xiI6S1Sk0WsBS/qvuBtNyfOMK1gWZcoCQLfwlI9630
         sprtPI4jZHfgLVClP9nuipiwdSBJ72cN/T+qlZyrd+UfFXJWZMsvxKqhZUntrYHPh712
         lXQQ==
X-Gm-Message-State: AOJu0YyCxTgPls8ZYLdzPOV4hW9vHGkStp3IRCiSrEDA2jUoijP1uoD+
	P1N82WtK1j2kez1IAAp8NRNZP27YGZFRvM7XFmc=
X-Google-Smtp-Source: AGHT+IGGgF+zVICfjruoYGI5AtM7UZd1S84pUXk8k3q66hHkJ/7pgBcqZIGuvsmQXg8vaFHYe6CUNA==
X-Received: by 2002:a05:6000:14e:b0:332:e3f1:9656 with SMTP id r14-20020a056000014e00b00332e3f19656mr3384239wrx.35.1701790760699;
        Tue, 05 Dec 2023 07:39:20 -0800 (PST)
Received: from [192.168.0.21] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o1-20020a5d6481000000b003334992c578sm6023903wri.10.2023.12.05.07.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 07:39:20 -0800 (PST)
Message-ID: <f506e187-e533-416a-b4d7-4fce48ffc494@smile.fr>
Date: Tue, 5 Dec 2023 16:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyudev: provide native
To: Kai Kang <kai.kang@eng.windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20231205145032.1116030-1-kai.kang@windriver.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20231205145032.1116030-1-kai.kang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 15:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107227

Hi,

Le 05/12/2023 à 15:50, Kai Kang a écrit :
> From: Kai Kang <kai.kang@windriver.com>
> 
> Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which is
> required by lvm2 when package config 'dbus' is enabled.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> index 6fcf346bc..8bc3afdb5 100644
> --- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> @@ -20,3 +20,5 @@ RDEPENDS:${PN} = "\
>      ${PYTHON_PN}-fcntl \
>      libudev \
>  "
> +
> +BBCLASSEXTEND = "native"
> 
> 

On my setup, this fails with:
 $ bitbake python3-pyudev-native
Loading cache: 100% |##########################################################################################################################################################| Time: 0:00:00
Loaded 4996 entries from dependency cache.
Parsing recipes: 100% |########################################################################################################################################################| Time: 0:00:59
Parsing of 3129 .bb files complete (98 cached, 3031 parsed). 4997 targets, 140 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'libudev-native' (but virtual:native:/.../yocto/poky/meta-openembedded/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'libudev-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libudev-native']
ERROR: Required build target 'python3-pyudev-native' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-pyudev-native', 'libudev-native']

FYI, the native support was removed precisely to avoid this error on the autobuilder. 
See:
https://git.openembedded.org/meta-openembedded/commit/?id=d4aa17dc436beb96a804860bc6d18cf72283709e

In this case, I suppose, we would need to either add -native support for libudev or somehow cut the dependency python3-pyudev->libudev.

Maybe this is something you have locally and not pushed yet?

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

