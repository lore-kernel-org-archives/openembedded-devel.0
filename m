Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4777ECA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 10:35:05 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.61568.1756204504523173683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 03:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VcBPddUM;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78f5df4so921678066b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756204503; x=1756809303; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ow6h4xIoG+bKfz21fLYBx6s7gBRwH/6U9BvBWw0HGoE=;
        b=VcBPddUMRpToHUYZNA3vvFB4hSSEnjQ+a6sERpdpaJ4GAE+eaoyX9X+n3p2mONqTCC
         pzT3Ua5QzQukxMzj/9qvN3q8GnlYQK3IcyKJsooIzwiXSX9Ksm3k+kccSIRm/4i5ttRg
         Xul564wnyVJGJ8iYkaE+2fCw19sSXFZbCAbTHwkpcGxNJ2iwf2wjoDwi7w4ZprRR7kOx
         Kts0g+m/ElxGJy23eobYKVJI6NDBumPXFuGenJRrpEjdt9E7I+EKEWpoCe/m+osrzcnE
         vz1fh6+DuoKxoG0H7IaEFi2zwZsmTe6c34Jj9ADAK9QmRAUzdp7BpAuyaA978c3sUbmL
         0gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756204503; x=1756809303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ow6h4xIoG+bKfz21fLYBx6s7gBRwH/6U9BvBWw0HGoE=;
        b=u03zNMG6Wmev+kXyXMPufijTOWRjWsG99+vQuU891G1beuy4owSRrNSgSmb0L05WUA
         ne1KQ6RUd8SO/8iT0bSvIop6BfiXsaDpaFY9pDdcuSXqfEm6wbYNA1s8DEkMy3R9AMGh
         L6MMGPorvG/Zsy0T/UGgNTAS9KonUifp8DB7yjxAP+RiWdCXvtlpwhVt9gkaWamAGndT
         j4AMWwr6bmPPkDDUz9UMv1RxItKN0u/3lSH4xiPttYtov3wgIsqp5avcoOyDvrrjwVRp
         RWZ+oWBUJwbAys8QBx/Vc0mMkdG0ChX0xP2Mlxb9lGRE0df46tCz58HfztnRdf/r2aZH
         gL8g==
X-Gm-Message-State: AOJu0YxFIYVMvsLOJtTJjZjQynhqUp0gIz6AuCSXQgZa7fT2O/eo8a/i
	LpUi8+ck668uKe5WbBdFC/3wP+TQmFo8zT3a1QwFzVYOepoBAzds2dgZ
X-Gm-Gg: ASbGncuARGi6zi3MiHxsUchTUNb/mIlztf1+TGWfjXtq40gpfSH4d5GimPsNVn58fdu
	daQwpVKMnTnBxBt/mMjy3lGjiZPboXCFxBEtcUr5yvPzx4B1UAFJITYZAg/9yu1fGiij+hi7Rh1
	yp8eJQ9kaC2FmqHiLm8+KOZDrYbIq3Alx+ou29hPOSjrFzRm/js3L9FnKkIyg85TZfrllkAyfmT
	xsL3hDxWROJtfhY7ZZp96kYFPx9biIBU/Cfo4KqfXUuiRXDxIt/nvXAyKXswUQcdSFUsfHOWgXR
	U0t33xUP63i8J2RQJOY1I0jTZo+0esIjpTJ0Ec5BABgxtvOmPn0zUtB6Sec7nTageKsRGC7ek/8
	+9sk3cWSaOEELJZtFvDXNhyyDDsaQGG4=
X-Google-Smtp-Source: AGHT+IFzotIZ8jhzzzoLeMRKdM3LtN2bHxddOxknj3PKi1VNTs/yW8myKQTL4+FyE245ObyPHLV6sw==
X-Received: by 2002:a17:907:3fa6:b0:ae6:abe9:4daa with SMTP id a640c23a62f3a-afe29017828mr1539024066b.27.1756204502558;
        Tue, 26 Aug 2025 03:35:02 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe77c2b758sm469728866b.84.2025.08.26.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 03:35:02 -0700 (PDT)
Message-ID: <8631735b-3dbd-4e0d-8315-e265eb064672@gmail.com>
Date: Tue, 26 Aug 2025 12:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] smbclient hangs in interactive mode after readline: 8.2.13
 -> 8.3
To: liuyd.fnst@fujitsu.com, Khem Raj <raj.khem@gmail.com>,
 Yi Zhao <yi.zhao@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <OSRPR01MB11597E2995D5DD5B55A24F5769B39A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <OSRPR01MB11597E2995D5DD5B55A24F5769B39A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 10:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119115

By any chance, have you tried this patch[1] with readline?
Someone reported[2] a very similar issue with the latest release of
readline, and this patch was the result.

[1]:
https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/?id=15970c431517a046099d8294c91d778b1da9b29d
[2]: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00011.html

On 8/26/25 11:53, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
>
> Hi All,
>
>  
>
> Our team found smbclient hangs in interactive mode after readline:
> 8.2.13 -> 8.3
>
>  
>
> When downgrade readline to older : 8.2.13, everything works fine.
>
>  
>
> Here “hang” means “terminal accepts no input after login”
>
>  
>
> Reproduce steps:
>
>  1. Add samba to core-image-minimal
>
>  
>
> diff --git a/meta/recipes-core/images/core-image-minimal.bb
> b/meta/recipes-core/images/core-image-minimal.bb
>
> index 84343adcd8..661d6ca904 100644
>
> --- a/meta/recipes-core/images/core-image-minimal.bb
>
> +++ b/meta/recipes-core/images/core-image-minimal.bb
>
> @@ -1,6 +1,7 @@
>
> SUMMARY = "A small image just capable of allowing a device to boot."
>
>  
>
> -IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
>
> +IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}
> samba“
>
>  
>
>  2. $ runqemu core-image-minimal snapshot nographic
>  3. $ cat /etc/samba/smb.conf
>
> [global]
>
>    workgroup = MYGROUP
>
>    server string = Samba Server
>
>    security = user
>
>    hosts allow = 192.168.2.16
>
>    load printers = yes
>
>    log file = /var/log/samba/log.%m
>
>    max log size = 50
>
>    interfaces = localhost
>
>    dns proxy = no
>
>  
>
> [test]
>
>    comment = samba server
>
>    path = /home/test/samba
>
>    writable = yes
>
>    browseable = yes
>
>    guest ok = yes
>
>    public = yes
>
>  4. systemctl restart smb
>  5. root # smbclient //192.168.2.16/test -N
>
>        Try "help" to get a list of possible commands.
>
>       smb: \>
>
>  
>
> The current Samba version appears to have compatibility issues with
> the newer readline library.
>
> However, upgrading to the latest stable release (4.22.4) introduced
> multiple build errors that are beyond my current troubleshooting scope.
>
>  
>
> I'm reaching out to the community for assistance. Does anyone have
> proven solutions or workarounds for this issue?
>
>  
>
>  
>
> Liu Yiding
>
>  
>
>  
>
>  
>
>  
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119114): https://lists.openembedded.org/g/openembedded-devel/message/119114
> Mute This Topic: https://lists.openembedded.org/mt/114897135/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


