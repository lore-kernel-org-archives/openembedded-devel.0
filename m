Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.12760.1618933538341265008
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 08:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SxNZMQrC;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id v13so6298231ple.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s3tktC7HeKgqQoxHoWLFjuQODz51kEf+0ZtANxG76HM=;
        b=SxNZMQrC25LQOrjEf2EiLTMppHyBealUGmdFWVcbSxK7/LYHVTTsfDhq5NIF+4dL56
         +jPebm7GFsuCSxJEMV+t3Xq7qMd4JbAxiHdZZ+iyUc4429BZzYMfI1KnoaZ+P+GTZK6w
         lBt4hHGL6BId3PS1sfl/wyvyqmlcumqMj79DfQTChkCdpTrAi/BUA8v8O/oJLalMLLJU
         R0xw3GO/bJqZEfk6nOSFVkjeb4RjxS/wlNe7flF7yj3GrGqTO+Kug2v6sbsmC96O7y7m
         oXV/ESWZP3R0jS2NPly5CZi/hm351PSeRJl8gblm4SjcAGdmli1m+IGf0BFQXuEUc/9b
         t9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=s3tktC7HeKgqQoxHoWLFjuQODz51kEf+0ZtANxG76HM=;
        b=mPnKzGDFw0MbJiMQmr2i2061bJCPQm9vDUz8nqI9gB2zc9cJ8rBh6xk3EaN9AmeU0c
         4672JD6c93z2jpM0PrAeY9wGPZtwW3wLwBGvDuaJ7gry9zL5sY9OfgnAgGc9pnOPKFzz
         W/+s+PUTBOfy3H2idJInrUq8RjDg0NTC1dNmyeWRoEMo5Z47vlX0qigITY42aJARw9Wl
         oofS5C1m7FZNdjzHDdzyFCKgLKalsu6fGg0hyS4lHYMJfKm7gRzBf36n8CxfGJ9UAUHA
         eVJ5+YaAp61w61V3KBdIM7ilqo9hB2Q01gLPSc3IUk+TWvU28wq8iXwelCTUa+V2ka0z
         X+Xw==
X-Gm-Message-State: AOAM531KTwjOjINrqnlxi/mTshiWlY9ie5vd2c4uzo5MXLJt8e2eFxuD
	6Ve9KunzJ40otWXwANpPZR9ezwLVszw6ZQ==
X-Google-Smtp-Source: ABdhPJzTvZEd1qQg7Gvzl+5pubyvgwX5kDOrkstQxOlrUVjRpSe9DGdHLgXhzt6BhNHI9lKG14DJaw==
X-Received: by 2002:a17:902:e8d5:b029:e6:cabb:d07 with SMTP id v21-20020a170902e8d5b02900e6cabb0d07mr29286239plg.3.1618933537609;
        Tue, 20 Apr 2021 08:45:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id l22sm2739223pjc.13.2021.04.20.08.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:45:37 -0700 (PDT)
Subject: Re: Hardnott-next merge request April 20th
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <74386e21-3620-1920-df78-d0225a66ea24@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f869996e-bcd7-a722-44d8-db045b01f06e@gmail.com>
Date: Tue, 20 Apr 2021 08:45:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <74386e21-3620-1920-df78-d0225a66ea24@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

merged thanks.

On 4/20/21 6:44 AM, akuster808 wrote:
> The following changes since commit 94fe80ce8609d62e51cc190595a9f0c2a4a5a89e:
> 
>    xterm: upgrade 366 -> 367 (2021-04-08 13:13:29 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded hardknott-next
> 
> for you to fetch changes up to 2297d4ee04b47bc574f8879732d9e213ab7bf685:
> 
>    wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)
> 
> ----------------------------------------------------------------
> Andreas Müller (2):
>        catfish: add python3-dbus to RDEPENDS
>        fluidsynth: upgrade 2.1.7 -> 2.2.0
> 
> Armin Kuster (1):
>        wireguard: update to v1.0.20210219 +1
> 
> Hongxu Jia (1):
>        debootstrap: 1.0.67 -> 1.0.123
> 
> Joe Hershberger (1):
>        strongswan: Make PACKAGECONFIG a default value
> 
> Kamil Dziezyk (1):
>        bats: upgrade 1.1.0 -> 1.3.0
> 
> Khem Raj (6):
>        tbb: Fix build with musl
>        core-image-minimal-xfce: Use graphical.target as default
>        vnstat: Disable install parallism to fix a potential install race
>        open-vm-tools: Fix build with gcc 11
>        nss: Re-enable -Werror
>        gimp: Disable vector icon generation on mips/glibc too
> 
> Leon Anavi (23):
>        python3-ruamel-yaml: Upgrade 0.17.2 -> 0.17.4
>        python3-croniter: Upgrade 1.0.10 -> 1.0.11
>        python3-decorator: Upgrade 5.0.5 -> 5.0.6
>        python3-grpcio-tools: Upgrade 1.36.1 -> 1.37.0
>        python3-speedtest-cli: Upgrade 2.1.2 -> 2.1.3
>        python3-python-vlc: Upgrade 3.0.11115 -> 3.0.12117
>        python3-robotframework: Upgrade 4.0 -> 4.0.1
>        python3-grpcio: Upgrade 1.36.1 -> 1.37.0
>        python3-cerberus: Upgrade 1.3.2 -> 1.3.3
>        python3-humanize: Upgrade 3.3.0 -> 3.4.0
>        python3-monotonic: Upgrade 1.5 -> 1.6
>        python3-sqlalchemy: Upgrade 1.4.6 -> 1.4.7
>        python3-typed-ast: Upgrade 1.4.2 -> 1.4.3
>        python3-backports-functools-lru-cache: Upgrade 1.6.3 -> 1.6.4
>        python3-xmlschema: Upgrade 1.6.0 -> 1.6.1
>        python3-pyroute2: Upgrade 0.5.17 -> 0.5.18
>        python3-sympy: Upgrade 1.7.1 -> 1.8
>        python3-pandas: Upgrade 1.2.3 -> 1.2.4
>        python3-humanize: Upgrade 3.4.0 -> 3.4.1
>        python3-decorator: Upgrade 5.0.6 -> 5.0.7
>        python3-colorlog: Upgrade 4.8.0 -> 5.0.1
>        python3-google-api-python-client: Upgrade 2.1.0 -> 2.2.0
>        python3-croniter: Upgrade 1.0.11 -> 1.0.12
> 
> Martin Jansa (2):
>        opencv: fetch wechat_qrcode files used by dnn PACKAGECONFIG
>        opencv: link sfm module with Glog
> 
> Naveen Saini (2):
>        tbb: upgrade 2020.3 -> 2021.2.0
>        ocl-icd: upgrade 2.2.14 -> 2.3.0
> 
> Randy MacLeod (1):
>        open-vm-tools: upgrade 11.0.1 -> 11.2.5
> 
> Ross Burton (1):
>        fwts: upgrade to 21.03.00
> 
> Stefan Ghinea (1):
>        hostapd: fix CVE-2021-30004
> 
> Vinícius Ossanes Aquino (2):
>        modemmanager: upgrade 1.14.10 -> 1.16.2
>        libqmi: upgrade 1.26.6 -> 1.28.2
> 
> Yi Fan Yu (4):
>        redis: upgrade 6.0.9 -> 6.2.1
>        syslog-ng: upgrade 3.24.1 -> 3.31.2
>        syslog-ng: remove CONFIG_TLS override for arm DEBUG_BUILD
>        syslog-ng: Drop an obsolete patch to add --enable-libnet
> 
> persianpros (5):
>        PEP8 double aggressive E701, E70 and E502
>        PEP8 double aggressive E20 and E211
>        PEP8 double aggressive E22, E224, E241, E242 and E27
>        PEP8 double aggressive E301 ~ E306
>        PEP8 double aggressive W291 ~ W293 and W391
> 
> wangmy (1):
>        uftrace: Fix error on aarch64 when binutils update to 2.35.1
> 
> zangrc (5):
>        fuse3: upgrade 3.10.2 -> 3.10.3
>        cifs-utils: upgrade 6.12 -> 6.13
>        dnsmasq: upgrade 2.84 -> 2.85
>        nbdkit: upgrade 1.25.5 -> 1.25.6
>        wolfssl: upgrade 4.7.0 -> 4.7.1
> 
> zhengruoqin (5):
>        python3-absl: upgrade 0.10.0 -> 0.12.0
>        python3-astroid: upgrade 2.5.2 -> 2.5.3
>        python3-bitarray: upgrade 1.9.1 -> 1.9.2
>        irssi: upgrade 1.2.2 -> 1.2.3
>        librsync: upgrade 2.3.1 -> 2.3.2
> 
