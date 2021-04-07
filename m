Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.276.1617836112842342680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fMZ0PBhh;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id nh5so91045pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eDNQV/YmlPTGeiUH/JCXUUypAWxS4AofC6IklC+jnmI=;
        b=fMZ0PBhhltRrQLiRnsEAt1Tlq3nLvS66DCIQaoon/ZfUetb8sXmUhNtWhtZyTK9Qs7
         zICV3sGFFYqAwAnUv0etgxFSGux2Kpfz0gp0ICyCGVQvyUDudSMGUdPLuvEbA0j7zUx8
         dqWm1g4MXQavC1c5QCeTOsi9y9nvkrnq8FKsaPmpPMh4lpWvMGHii6LynpD1Pgn3dG9X
         u832mq2xFJ+hzhiJyc4ITgTtznXOEg3sPsyjoXqFQohhmZDvTYGpH34gLEEdGnSxFl/3
         o+XA82vYBmtMcJr8lmxfNx1GU2rXtI36fzBNpn8jlsa10ZW+id13ZleXhrvOnMxiOWU9
         znXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eDNQV/YmlPTGeiUH/JCXUUypAWxS4AofC6IklC+jnmI=;
        b=sz1u3AfVc5mZyaaHlwaCPOxvAWmH7XJ6XYcwv9ZRUnA7+43+utUQeazae3Z7LSmZSv
         EwhkUotfAzMnktwmv5vljg4emfzPQrodNFGmnMYbcdtqSA71F6g5AvUCsCcYST9ZRtt1
         j61hdFtitczrFTNkMWQwDy+WZAWfN+TXqXCbFXGZrRvffzQpj5z6ij2HmrXt4MVkZ8Y4
         cfBc9QLXJWEabKdrVAiCvFxHvnbaIY8Bs+jF/Xy55UnaSQN4xJxltgdrzT6AghHNvUzy
         S7YYmE92XdyNSJk1f8wXSq94B3PxFECeB5dth/VDzdIrLlG7MgrWm6O3GZr/NIkiTnOc
         epCQ==
X-Gm-Message-State: AOAM532hrJWYZpk8o1EW5L6ZwLgqZHWrHE2+zuXyU8I5V5u/DNDyC9mY
	DSJV/0ItYdidF0tAdKx/X1s7wJjhmZhavw==
X-Google-Smtp-Source: ABdhPJx3bHpbMbo3RDrolPVCvLlpw/uuGkQQpmkmynIVRLWZiPml4qQ3n7VRzjDsSyq3L7bVl02xQA==
X-Received: by 2002:a17:902:122:b029:e8:bde2:7f6c with SMTP id 31-20020a1709020122b02900e8bde27f6cmr5028307plb.29.1617836112070;
        Wed, 07 Apr 2021 15:55:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6? ([2601:646:9200:a0f0:b8fd:d0e9:5b84:68b6])
        by smtp.gmail.com with ESMTPSA id d123sm3380360pfa.108.2021.04.07.15.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 15:55:11 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] libssh: add gcrypt to PACKAGECONFIG
To: Valentin Longchamp <valentin@longchamp.me>,
 openembedded-devel@lists.openembedded.org
References: <20210407212337.2307476-1-valentin@longchamp.me>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a07e006e-9c1b-abc4-e156-029bb5a7b713@gmail.com>
Date: Wed, 7 Apr 2021 15:55:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407212337.2307476-1-valentin@longchamp.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

the last patch you send it  already in see
https://git.openembedded.org/meta-openembedded/commit/?id=86eb692a4e96b77857a4160a12625fc694812d52

if there are change on top of v1 then please rebase and send them seprately.

if you wan to send a reminder just reply to original patch

On 4/7/21 2:23 PM, Valentin Longchamp wrote:
> This would allow to build it without libgcrypt (relying instead on
> libcrypto).
> 
> Enable it by default to keep the recipe behaving the same wihtout a
> configuration change.
> 
> Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
> ---
>   meta-oe/recipes-support/libssh/libssh_0.8.9.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> index 39ed8a8fb..2aff2c878 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
>   
> -DEPENDS = "zlib openssl libgcrypt"
> +DEPENDS = "zlib openssl"
>   
>   SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
>   SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> @@ -13,13 +13,13 @@ S = "${WORKDIR}/git"
>   
>   inherit cmake
>   
> -PACKAGECONFIG ??=""
> +PACKAGECONFIG ??= "gcrypt"
>   PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
> +PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=1, -DWITH_GCRYPT=0, libgcrypt, "
>   
>   ARM_INSTRUCTION_SET_armv5 = "arm"
>   
>   EXTRA_OECMAKE = " \
> -    -DWITH_GCRYPT=1 \
>       -DWITH_PCAP=1 \
>       -DWITH_SFTP=1 \
>       -DWITH_ZLIB=1 \
> 
> 
> 
> 
> 
