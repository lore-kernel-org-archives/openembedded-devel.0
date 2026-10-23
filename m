Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1378.1792736666451029388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r+02zpPa;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so546205a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792736665; x=1793341465; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0jD2NrBm2uafqZDMBRlpbUHZ4FuyKWeSOP/ErTMSj0=;
        b=r+02zpPaYl3A3/nbOtes0JaK1iMQubWK6g/P3z2bdO9Czuf9I+bXYkWsdV9TVtjQZo
         kM5w08zWjOuOcsqiaV78qHfYRSNM65xENihTI3EZ8G2GiLUroQ1nZwN/r5XGyAoEJQNH
         qv9NnG1a3q/nssWafBRf+e2Si2YBrvTR0VXhrpq6y4c8XfoIJeopSAqOWWBiX7XOSVvE
         rXLpatBPeBj17iZABS1qHQ/aGBl3U+HbJ4B60p9cUJeehQ4usHHbkxBcR6/C1HI2Vt8G
         pGMNoIiLgOKT1SLaPsijJUBMUJQRdpQnAFHu+iAMjhYvI3qj4/WDiKoaUwj/Mzy7wTsX
         TXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792736665; x=1793341465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0jD2NrBm2uafqZDMBRlpbUHZ4FuyKWeSOP/ErTMSj0=;
        b=r9xzDc3ffpEKNGTvq1BjvctIQXYU5ca0jC2CecziXTvGxRLbGxp+ylcVTdDhif8LHy
         s4l4VyVXZwZFuhdLhh5oouN3mU4OIZBf0m55arIjoFHfO713qPQGApaMgdYYwS7RvErd
         tBxJGqsShP9ZTqHjGAlzgTumdWfkzA5QYhLn7UqVbKOfhCQa7RuAH5QX1MAW/ebRCg3d
         hKmrmHdFG9OoOwQFl6DeCrmWsJJRMwUHOH81JTbIO6jZtlBuDubW6ldUy7nkijqdzzHh
         g9prd75iwFB+S38T/xzeD0nRAYuRUnPpf5FGGxqYLV2x0kicwVNiTm4RXzxReMjY7gvq
         kWqA==
X-Forwarded-Encrypted: i=1; AKwUvBwVHC8SwMRZrP0ndk9NUxTFe67Lx4YorZZS8C7m+7imiNr37cOOyZApTb+a5pUGc6MBa7tYixaaecLSGHEOuNNihGE=@lists.openembedded.org
X-Gm-Message-State: AFq9FYLQcpLbLd5SHeg+icq31U7OLwypr3vo+xy9lAYEzeEJ7f2FHzM5
	XsPtKqq2ogqGi3LP/8R8udpd2A2Mp9LfviCR1CRsBNcszVVdsXxbp7Jh
X-Gm-Gg: AYBFou2GcWvlj+aIJuE8vTnIUf6lbjKARx6a4Dax0mjXgpLmtOnD9rm0E/zbl6hz7e9
	KCkFo0Bkap1sjfzxPJZmEE/g+ZV6Wu3ZjuWfUIzVu2T9Vp3yxAUysg+y9NnMHQKSa0OqKcqSnSw
	kISdsLZE7WwFcJSZwW/N9KamW4p38Dyk3cvyQz9HrjbpMlwpNnJfv/V0iKZzETY60UqQBBH375G
	GrVR5WFTF4hR6m1azkqtelV/bZY7XLN4g61NAtRZwEaj1Rnn5reO/A5JGmpcOaVCh5UzG0ljRDQ
	m9q2xcejadbG6GJJaN3cwhQrs0Hd3EwaxtdD/PEJ65LB4ZHVC7UcZZGGi7oAAHawmJKOEiqGl5g
	LQMiz5Qrr7S/7ltVB5XeomEhi8rDZuWyHdTuYQxM45EVCs2qra9sqJMyY9n5NoyeM0A8OYwr+5g
	ip7eRswmJVez4ozRwezlh6EWZVV2Kf7Zm2iNjsSUQbm7+QVw+RWKSTbuPjtfs+3sbrppshiRKrU
	VMfS0bFhCkqy7AwCbaAOFde5gdmrjzlasOB4XkxrrXTdaVZWHfPvcHhsr5pm4nfX5d1sdIr
X-Received: by 2002:aa7:de02:0:b0:6b4:20bc:fac with SMTP id 4fb4d7f45d1cf-6b432ba88f6mr1611801a12.10.1792736664349;
        Thu, 22 Oct 2026 23:24:24 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from [10.54.10.247] ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432cb3456sm689570a12.20.2026.10.22.23.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 23:24:23 -0700 (PDT)
Message-ID: <282c4aa2-503e-4d5a-bf52-2434667ccfc6@gmail.com>
Date: Fri, 23 Oct 2026 08:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on
 configure
To: Marek Vasut <marek.vasut@mailbox.org>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Ankur Tyagi <ankur.tyagi85@gmail.com>, Khem Raj <khem.raj@oss.qualcomm.com>
References: <20261021135357.14928-1-marek.vasut@mailbox.org>
 <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com>
 <d1168121-cced-4238-8dee-9c1b1169e484@mailbox.org>
 <5a50bdd9-6d29-4066-82f0-c13811810760@gmail.com>
 <0eba48ad-5c1f-4041-8f8b-c261f18d29d6@mailbox.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <0eba48ad-5c1f-4041-8f8b-c261f18d29d6@mailbox.org>
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131324
Content-Type: text/plain; charset="utf-8"; format="flowed"

On 22.10.2026 17:13, Marek Vasut wrote:
> Can you try this:
>
> "
> # conf/local.conf
> MACHINE ??= "qemux86-64"
> USER_CLASSES ?= "buildstats"
> PATCHRESOLVE = "noop"
> BB_DISKMON_DIRS ??= "\
>     STOPTASKS,${TMPDIR},1G,100K \
>     STOPTASKS,${DL_DIR},1G,100K \
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>     STOPTASKS,/tmp,100M,100K \
>     HALT,${TMPDIR},100M,1K \
>     HALT,${DL_DIR},100M,1K \
>     HALT,${SSTATE_DIR},100M,1K \
>     HALT,/tmp,10M,1K"
>
> CONF_VERSION = "2"
> "
>
> "
> # conf/bblayers.conf
> LCONF_VERSION = "7"
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
> BBLAYERS ?= " \
>   /oe-core___wrynose-6.0/meta \
>   /meta-openembedded___wrynose-6.0/meta-oe/ \
>   /meta-openembedded___wrynose-6.0/meta-python/ \
>   /meta-openembedded___wrynose-6.0/meta-networking/ \
>   /meta-openembedded___wrynose-6.0/meta-filesystems/ \
>   "
> "
>
> $ . oe-init-build-env /path/to/builddir
> $ MACHINE="qemux86-64" DISTRO="nodistro" bitbake -c configure 
> overlayfs-tools
>
> ?
>
> Also, please run 'which sudo' and check whether sudo isn't actually 
> installed on your build machine (it is NOT installed on mine, because 
> it is a minimal container)

Thanks, I guess the container without a `sudo` is the reason (somehow I 
always had it in mines).

If you are OK with this fix 
https://github.com/kmxz/overlayfs-tools/pull/34 , we can bump a revision 
after that.

Slava
