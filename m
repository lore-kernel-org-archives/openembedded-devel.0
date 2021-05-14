Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.9205.1621002119348756867
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FKsXz8Wh;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id e19so6473266pfv.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oVOKekxm5vuWt2qCtk/KdM9DOKQkIYa3h23a7+AH/gg=;
        b=FKsXz8WhVGmi7tSstJOC7d9iJ+8xpfUxVuTLu5TPV8hilcmUyxF2KksxIaWF2B9Y8S
         iQ2Be/ef9l990Zam3vsV6eY0/Pw10JgFYarz8Y8xmcnrN2+BhOgKp1W5Rwr8FkVYlyE5
         UI9RHk4ba6GO+e2AJMgVCC61fvMGiZo84JcYS1GDfaBe8QiRXwHxzNkGFKWFtDwX6wSd
         PwP7ow+YKb7QsiQmHMGU8PmSi8xlVvcG3sK9Wv8NsTpNHQzxlqcDT6xhxOAnCS0HKpX6
         G3/3z3MLIkTZf7CteefO/ol8reVEuSqTJvkBrxoyy/J3navl8+MWoQgVNgVCmHhnb1fi
         ce5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oVOKekxm5vuWt2qCtk/KdM9DOKQkIYa3h23a7+AH/gg=;
        b=GXCfWmugYm00WV8ZlhoKvewLAW7HZiVpYt4UawjGMFMofCSoQOji1ziTwQbvEHAUaf
         vn5kUViI2LVg6TrhdpaNQ+bXyyItdTxKO1xzYV6H+wH5wWr69U8SZZzXKrEhn+72smTn
         qYMY8bNPRweXEQyrzITZ+fDiLPaRh8gzEIIfTENjUfUvxjZ5+J3yIurKXvqTUdzrvTEn
         FFNe4GAtMjh3R5p7aFrktCiLcB885VRj+DIUlOTHkq3vwaAIDtr+s7OD1G3bplpr+xsI
         x6itACPlIhk4zYM8xH5JG5660qiZJNCBLRgxM+GKPaFDXJmoNw5uZC6D6Cp8yWEffQD3
         WItw==
X-Gm-Message-State: AOAM530Nw+Y2iMsSQpCYLH2CkYDrXDHt6eORNp7cPtxumXjw9GqeBZ1S
	Wu/C+Zwzp48COP/qiTpt1W4=
X-Google-Smtp-Source: ABdhPJyTOFfwf7EOBVzke9BDlC9HF0tDdMOc+9iKBBuPnT+8YaArAahqwQlNOnFUsWSJ2iaSgJQJOA==
X-Received: by 2002:aa7:90d4:0:b029:28e:b912:acf with SMTP id k20-20020aa790d40000b029028eb9120acfmr47583879pfk.43.1621002118871;
        Fri, 14 May 2021 07:21:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::9c7a? ([2601:646:9200:a0f0::9c7a])
        by smtp.gmail.com with ESMTPSA id h36sm4617887pgh.63.2021.05.14.07.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 07:21:58 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH] wireguard-tools: change path for wg-quick systemd unit
To: Adrian Thomasset <athomasset@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Adrian Thomasset <adrian.thomasset@doulos.com>
References: <20210514140722.3503198-1-adrian.thomasset@doulos.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c9a6745e-f7ef-74c9-5333-9a447dd14bdd@gmail.com>
Date: Fri, 14 May 2021 07:21:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514140722.3503198-1-adrian.thomasset@doulos.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello Adrian

this is already fixed in master via commit 
https://git.openembedded.org/meta-openembedded/commit/?id=84681a31cfd3f7aa8cc89181c2c87ffffcbc261b
if you are proposing it for backport then add branch name in subject and 
CC armin

On 5/14/21 7:07 AM, Adrian Thomasset wrote:
> Fix error when enabling the wg-quick unit:
> 
> % systemctl enable wg-quick@wg0
> Failed to enable unit: Unit file wg-quick@wg0.service does not exist
> 
> The wg-quick@.service template unit needs to be in /lib/systemd/system
> 
> Signed-off-by: Adrian Thomasset <adrian.thomasset@doulos.com>
> ---
>   .../recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> index f698b9a9a..e769f44b7 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> @@ -9,7 +9,7 @@ DEPENDS += "wireguard-module libmnl"
>   
>   do_install () {
>       oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
> -        SYSTEMDUNITDIR="${systemd_unitdir}" \
> +        SYSTEMDUNITDIR="${systemd_unitdir}/system" \
>           WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
>           WITH_BASHCOMPLETION=yes \
>           WITH_WGQUICK=yes \
> 
> 
> 
> 
> 
