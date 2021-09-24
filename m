Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.4040.1632457768696084788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 21:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qaNfiHWP;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 81so5169978pgb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 21:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=olPxty5hYtWik487FoN7+rIMxmrkvQY8pmN4ISVe5qc=;
        b=qaNfiHWPFAAqZSXHp4qy94z+4wc9WJKMBf164AeGJzcPbnG/WpLn1H7o8g244ma0zy
         zCUwWdfnaXI0ElhkPcNAANAtub/l4Z2EMlhMjwHjpOIwnv6wxf+3WpMIRCp4+w9Of2I+
         GLOjTiqEfo4c3CMj1nwH/PATjMJ7XXJdxQ1jxio8qOFkmDrwmGav31VGKvNdmb4dZ2vm
         7T3wO/+lNRHDqxUCTKIjdJkGO1k9jWkNDKXcz/kyhZnhj1vcDnweNg+y5sGgWS5Q9vlJ
         HMPJHuihzDD2cqmNmNh044ZDVKYSDN+LRqENzrQA129rI+gTg6WPLWYrjGtskalfEskl
         ewNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=olPxty5hYtWik487FoN7+rIMxmrkvQY8pmN4ISVe5qc=;
        b=mWzQ5zU4Sdoz6+1+i9BoxbR+jRK21pSkw4+YGSTAFLHYxpeJUpY33fySU6PjnODJ1C
         +me0v006gUkMxmEiNPMd2qFLuUqX/5xsed+Mrcz/96ux9iNS5hBr+kIYhFOatQr/DJUb
         NVyEoMC1qpLX28FB2fSG5dGQ0LIjGR//HdGFJRl51pkaVNtuv0JZe9EMTJry2rripTFn
         WER1PbDMjvmxE8dPkP2JJQ33BmR2CDk1r/Zh04NBteynXwAYKLzooZdYWeR9KGrGnp3J
         jOfS6FWOYPMACrFiE3bjETBWPekDBQdaCfP+y6fKH5+g04ld8UY4Q1Fw5UPMky2uMCNE
         jWjQ==
X-Gm-Message-State: AOAM530sUOs9E9iOZTw3E56fTchWlOMnSzfULAytfDTktSGtyGzjZb60
	V65m4wqegw5QyDdBfuH3W+0=
X-Google-Smtp-Source: ABdhPJx+lstCfj6gukNurJeYK58eJ9+jildgq9idrxB7Es7dpZASVVDpkD8DiQODl2G/djWCK1VI4w==
X-Received: by 2002:a63:7402:: with SMTP id p2mr2066462pgc.472.1632457768062;
        Thu, 23 Sep 2021 21:29:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0::d11e? ([2601:646:9200:a0f0::d11e])
        by smtp.gmail.com with ESMTPSA id t6sm7153406pfh.63.2021.09.23.21.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 21:29:27 -0700 (PDT)
Message-ID: <5b7e2d77-85f7-cc88-5260-05e6b012f3ad@gmail.com>
Date: Thu, 23 Sep 2021 21:29:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [oe] openssh-dev package and populate_sdk conflicts
To: Matt Johnston <matt@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/21 20:08, Matt Johnston wrote:
> Hi OE list,
> 
> Recently OpenBMC merged a change to install openssh-sftp-server package
> alongside dropbear sshd [1]. That caused a conflict in "populate_sdk" which
> installs all available -dev packages [2]. 'openssh-dev' pulls in an
> 'openssh' -> 'openssh-sshd' dependency which conflicts with 'dropbear' [3].
> 
> What would be the recommended way to handle that situation? For now OpenBMC
> has merged a change to disable building openssh-dev (it's empty since
> openssh doesn't have libraries) [4].
> 
> Should non-library packages handle -dev packages differently? The default
> -dev package comes from bitbake.conf .
> 

perhaps set

RDEPENDS:${PN}-dev = ""

in openssh

> Cheers,
> Matt
> 
> [1]
> https://github.com/openbmc/openbmc/commit/26dbcdbd917e4f22fb400153da0d3e7255c8e646
> [2]
> https://github.com/openbmc/openbmc/blob/49465582e16221caf74cbdea11c87600a02bf47b/poky/meta/classes/populate_sdk_base.bbclass#L5
> 
> [3] https://github.com/openbmc/openbmc/issues/3819
>   *   - package openssh-8.7p1-r0.arm1176jzs conflicts with dropbear provided
> by dropbear-2020.81-r0.arm1176jzs
>   *   - package openssh-dev-8.7p1-r0.arm1176jzs requires openssh = 8.7p1-r0,
> but none of the providers can be installed
> 
> [4] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47089
> 
> 
> 
> 
> 
