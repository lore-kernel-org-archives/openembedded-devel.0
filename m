Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F55EC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 10:27:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.33545.1741775248169708470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 03:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aGSXRT4z;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so5734855a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 03:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741775246; x=1742380046; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AV0peXkdX+3z8cO3boEr0qtslD610Ue0Y4z5Ohrij0Q=;
        b=aGSXRT4zyWDyjpGqUt1XH+KtfNf8+xSAuX/AXC7B/j3bsU2Agb/vU9KUTWqyBMv2jM
         ZLFJs4foW+OCcGSWN40CnRBxJbcWh5aVU0Ha8atODLky8eA6tSZ5eb/XrVDnKLO2D93/
         v1XwkKZ9E7WVPNJEMh7Q4VvZonDVhWCe9K5yie9tKUxPOX4i2fl85JLSb2Nl4X1vMKbV
         GC9fHO0HRh8VjASmT6oKbU5bGNhoJJrzGghrl1e7Ew88m2ysecAb32gT9yICWQUHLs5+
         FqNget/GK833mWROQccFiu546PbO3LPn3xhUo2pIZaAIrLt2YrQpou9WWjxdMaAL65Av
         QLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741775246; x=1742380046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AV0peXkdX+3z8cO3boEr0qtslD610Ue0Y4z5Ohrij0Q=;
        b=jTPalO4Owq9h4mOGBEKYNGmbWxdQb+fJ8i8iLrd2Ut7Isyu852Rjr7p/tEHmJooKOZ
         PtU/DxDm9fC6V+IpFvfN8T778aQwkDsu8UCZZTZGP/pRFI/yV2ys8zCQqMVv3d2Rlu72
         IPZQCUvMApmo5PP7aVOsIjLZk1v4IpmaRD7yEEs5fbKXsABzJVMUotw/wGkpAfl0xbbV
         8QaS3gOEiAAKvyyD0hSNAr6PpQ1u+1p44GtBL3fbmQPdoa5i2CGotmuA9HASCm9FBG+8
         VVuMPSAMd3z9Bqsz2R+zEK61l0m/fNhExLZwsDjARg/M0eIG+akzvJIvR2kWxXY7YOZu
         NWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbfrCNRKYHUIlyTN8CMYXZriZR4KlUCCJHzud28cI0n4iiG6ae3Soo9kwPxK+N7mMW6Dv6Ue2xyI+07AUyh0AGsSg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTi/oqV6cVS81vCKLgVv/h13KyQooVadcdT1FaPnMxWwi1xrRO
	tt4B3Ey+/MPJtZgG5Id7IcwrMHd8C6DPpjnfOEO1Mt3TkKUFLxQYkIY4sg==
X-Gm-Gg: ASbGnctb7TS9TCmVTm8Ku/hw98J0mF4N2AOnWtmiJMKeM2jHaZVska6rtthCHDIpR4i
	vxiKVxZv9mzqR2sJr+JFje3C3GRMxt7j3YCgsaFz6UChVPiu/MnLYM/oi3p6EMaGHpd9P0AQ+8M
	dwFG2/InUk0VNrA1Y/Xn3pukHLEjjSp6phGTfJN/zGyZ5RrnSd0SSLkJ9iJSpKRX8TAvLJj3KYW
	lV5c5yw5/0cz1+JXvE+ucjGSbf4r7RTsFUpbWcNHKk0d7jIhe61GAAqdqst9ocQJej5q1HWFjrF
	wmw5BSkVlP8eAYP71UXAYbnKUScaLKdZ18cyuLjmB32off0b8FH2
X-Google-Smtp-Source: AGHT+IF0QqrUy2WHzJgV8lmNnXXXAQ1vgL1lyqYsp682H6e27Iwz0EKoSYbuqlmSCDjCpVR6ANzITg==
X-Received: by 2002:a17:907:1b05:b0:abf:6e22:cac7 with SMTP id a640c23a62f3a-ac252607bd5mr446722166b.15.1741775246170;
        Wed, 12 Mar 2025 03:27:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438230sm1053112166b.9.2025.03.12.03.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 03:27:25 -0700 (PDT)
Message-ID: <5d9ed679-129f-4e5f-b33f-818bb471a17a@gmail.com>
Date: Wed, 12 Mar 2025 11:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone] netcat0.7.1 segfault
To: Jinfeng.Wang.CN@windriver.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <da5b94df-7153-4e2d-9f28-261d5f97c940@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <da5b94df-7153-4e2d-9f28-261d5f97c940@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 10:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115919

Unfortunately gnu netcat has seen better days - last release 20 years
ago, last change 10 years ago.
Is using netcat-openbsd out of question for you? It's also in meta-oe.

On 12.03.25 09:17, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
> Hi all,
>
>   I found there is a segment fault in gnu netcat 0.7.1. I can reproduce 
> it in kirkstone.
>
>
>    root@qemux86-64:~# netcat -nlvp 12347 -T
> Connection from 127.0.0.1:52236
> [   87.252879] netcat[242]: segfault at 55b9310e0000 ip 000055b9310b9d3e 
> sp 00007ffcac0fa530 error 6 in netcat[55b9310b5000+5000]
> [   87.254051] Code: e8 57 b6 ff ff 31 f6 83 c3 01 39 dd 7e 68 48 63 c3 
> 41 0f b6 54 05 00 48 63 05 b2 45 00 00 80 fa ff 74 04 85 c0 74 e0 8d 48 
> 01 <41> 88 14 06 44 8d 66 01 85
> Segmentation fault
>
>
> Reproduce steps are as belows:
>
>     1. git clone https://git.openembedded.org/meta-openembedded
>      git checkout kirkstone
>
>      git clone https://git.yoctoproject.org/poky
>      git checkout kirkstone
>      cd poky
>      source oe-init-build-env
>      bitbake-layers add-layer 
> /mydir/workspace/poky22/meta-openembedded/meta-oe/
>      bitbake-layers add-layer 
> /mydir/workspace/poky22/meta-openembedded/meta-python/
>      bitbake-layers add-layer 
> /mydir/workspace/poky22/meta-openembedded/meta-networking/
>
>      vi conf/local.conf
>         INIT_MANAGER='systemd'
>         EXTRA_IMAGE_FEATURES += "package-management debug-tweaks"
>         BB_NUMBER_THREADS = "32"
>         PARALLEL_MAKE = "-j 16"
>         IMAGE_INSTALL:append = " netcat ssh"
>
>      bitbake core-image-minimal
>
>      2.###on the target run:
>      netcat -nlvp 12347 -T
>
>      ssh login:
>      run the following test.py:
>
>         import socket
>
>         RHOST = "127.0.0.1"
>         RPORT = 12347
>
>         print("[+] Connecting to %s:%d" % (RHOST, RPORT))
>         s = socket.create_connection((RHOST, RPORT))
>         s.send(b"\xFF") # Telnet control character
>         print("[+] Telnet control character sent")
>         print("[i] Starting")
>         try:
>             i = 0
>             while True: # Loop until it crashes
>                 i += 1
>                 s.send(b"\x30")
>         except:
>             print("[+] GNU Netcat crashed on iteration: %d" % i)
>
>
> Any suggestion?
>
>
> Regards,
>
> Jinfeng
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115916): https://lists.openembedded.org/g/openembedded-devel/message/115916
> Mute This Topic: https://lists.openembedded.org/mt/111656319/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

