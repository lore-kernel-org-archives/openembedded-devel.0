Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.751.1585774933451031482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 14:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RJA7/5Qh;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id i6so1694447qke.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2020 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=eYgfoLVQOy56NKxXMKOUA5eOC2Br/YYPY/lRXIqLf6g=;
        b=RJA7/5QhPIXi29afXL9e9t6nKJDaMQNHKi0ZsURRXosVd3zEYxO2dmA/jtS3ODP97m
         6e+uv1Q0jrygICIiasyqP6N+j+cQEVDpQCBDZotHbmv177PvumuXzsE3uTUNWDEsGbaE
         lh7g0Ez/JwVVNhgZ2yQaZzc9xBnkgVMck+GP5kaaj1CWSrEmsHCWO0tZO6rUn6GTuvOM
         h/OydMzy2d86JkVY++JQDi0oy7MzCepCeRxuBLD0ncGXRJpIGttf69QGe2sAJ1J0MzET
         C3DJ6xSWM9Zwj7W8l4KyeUmSrcfXt7V66TMHHBSBUGm86abyUp6l2ji5jQniEBuEzVYt
         ZW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eYgfoLVQOy56NKxXMKOUA5eOC2Br/YYPY/lRXIqLf6g=;
        b=elF3qi1xOk0i77y/acL+iN9ce915ATdW4L1TD6ssIeD5aB80volHsyeJSdMcm4CQxJ
         1F1xA9X51+3Lt3ymi6Csyv3Ah7udQYyGsIfCJ4A4wKhQlGtc5yo974ii8xo54dOBfzu4
         B860gZFy9/KgHA8xPu8/jasN7jybZzTsVuxI85Xug8+83D6xdVpqEFRccJluYRsHhMC2
         3Wrgz4/TVkdgNtjguu4/AKhXZzOGkwlAxNkVtvvwSpbji65L1bsKvRNCt0tiL+/PF0V2
         xKaRdCK0VOFYOA/HzLjyjiyOoMouBhY87jk0g8dLxBjiTeXZ0DIZVzbzIkteOX8qM38Y
         XOSw==
X-Gm-Message-State: AGi0PuZvRgNVv9rbD8tDVBZdE+YXdaaUTpm1tAcfzhemBLnPEoW7jdHI
	0YHVMqDMjAVUh17lyiVakWIXTCWzJeY=
X-Google-Smtp-Source: APiQypKDTmgPDD8EDqW4GQMyefU33WDoGmPHr1X4P7gLZFeFz1tn4dmY9UYC6Ouk3RQPlVHObETHgg==
X-Received: by 2002:a05:620a:539:: with SMTP id h25mr179861qkh.395.1585774932170;
        Wed, 01 Apr 2020 14:02:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:3c0f:54c2:33b2:61a7? ([2601:646:9200:4e0:3c0f:54c2:33b2:61a7])
        by smtp.gmail.com with ESMTPSA id l13sm1990772qke.116.2020.04.01.14.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 14:02:11 -0700 (PDT)
Subject: Re: [oe] Regarding poppler auto PACKAGECONFIG when qt5-layer exists
To: Matthew <matthew.zeng@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <87o8sbf8e4.fsf@windriver.com> <87k12zeyre.fsf@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <4bb66aea-66e2-7810-4986-f3ea63ed7992@gmail.com>
Date: Wed, 1 Apr 2020 14:02:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87k12zeyre.fsf@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/1/20 1:28 PM, Matthew wrote:
> 
> Hello,
> 
> In meta-oe/recipes-support/poppler/poppler_0.85.0.bb line 17, there is the line
> 
>      PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
> 
> Let's say I add meta-qt5 to bblayers.conf, but I don't plan to use it immediately in a build. Therefore I haven't make any additional change to local.conf.
> 
> However I will be receiving the following error when starting a build:
> 
>      WARNING: qtbase is not whitelisted, figuring out PNWHITELIST...
>      ERROR: Nothing PROVIDES 'qtbase' (but .../meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.85.0.bb DEPENDS on or otherwise requires it)
> 
> because PACKAGECONFIG is changed so it assumes I'll be using qt5. Is this reasonable?
> 

Yeah I think here the choice is dynamic, what happens if you add a 
bbappend where you do PACKAGECONFIG_remove = "qt5" does that work ?

> 
> --
> Mingde (Matthew) Zeng
> 
> 
> 
> 
