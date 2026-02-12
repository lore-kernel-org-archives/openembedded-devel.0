Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9C9EEA851
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 21:09:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56037.1770930595043569507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 13:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmT0jCLw;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483337aa225so1244505e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 13:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770930593; x=1771535393; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pznz9PStk0tTOhVOSTt2EBC0qs7JqWgXu6eNhpHd77M=;
        b=mmT0jCLwqaTx2naT94nxANWYCLX9b2NSCtMqTb2QdFqTpffVliIDiBnh6izouSV9H/
         4h7mIzRKWTOl/VHaTZq9eC8hWQotI8fccv1W3Gxqsb66CxYZ9Kl0qUj5ZZCe10vZbGpL
         4dIL4cTU77eiFZEQOiOkUjZCyAcrJM4/c6CFMdE7OhY+ZH97p2Qf61ToFjcYxEwsm3Fa
         VkTcsPERhIXuf9S9kTHBAH39dBwW3zMKp/tJnn++jHprFRlKvxzbnV2e+TpZw38Tyn5G
         hr9AddDHUhU0IgiKC8mvmwmTPj0RxRfs182XlHBl4KMNfOBhDktRQ8yJjsTld2yzDQIi
         naTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770930593; x=1771535393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pznz9PStk0tTOhVOSTt2EBC0qs7JqWgXu6eNhpHd77M=;
        b=Buw4FFyLuuD8cfXB/GX4T4bim70nc2KLiRxQpbz4mXX9Mptd9t2immm9ScAs0KMTXM
         pSqCtkUmKAWBZhkeCbGEhIDEFzfFGRX2QHZ6Fo7h3TCTKro4jrckI2qL6J2Ke2CxNQ65
         K1+o2AOX95zrdgtfJGVZEHNgt6YxPzTW14SM2s/DGGsO9znzHbjrr77ejEpNRM7VITT0
         aYdogFB5Sag+HVPAKSxgdNN5BONIBeTxWQGhPg5dYNjH80LGjW3qrxdY0F8bqp3WlHg0
         5OReXs/rFSLOWJ3JQrfsjvABvDKK1DL4wBjx3O8NI8oXiwJG8aoLRBQ2wb7RGcZApRQG
         /kkw==
X-Forwarded-Encrypted: i=1; AJvYcCUCE4iD3C740imzhE8QAGV2uMTXEV0t9YjQX/KRhBUqjsbsHhHhrdzaLsgSD74c0DZquZ2aOm3b/0NqxdgDIrH+Z5g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyiRt0i+RvjvgZzHEEX0LuPEWhxLZP/ssz+dcVplfURzFlgCYEp
	ZL14M9pqMmRZuPVtZzS1lAl1qLcc2fj1AmYsmSUUCwvxsyODQXjK6siW
X-Gm-Gg: AZuq6aLBcfeRr5t+c4f4KzjVYlwA1W39F47hyypDA55jWdralRa2w5EvcrONQmiMW0B
	gQw5BMg/nimMuVgZR88rVaY5vZo/OjHUp/Y4s2dOxyK6iYDlEvLH04aOorXWi69OoeLZkiPu31G
	cA2GiKFnlQbW1RadZd+z5TXmAP+VKLYtLxg+00jtGDJGiLKNaxEUM9itBe4/SaxihQ3w/i58Lc5
	rtlDybzRhwMy75bRZxlX7nPEMXqjV0e8rZGZ8YjfdZq5EmRLRHFKZjBq+IUoWFUtQzMonUU6w0j
	9W9skiiPgp/7yhAROxRUWYHD2moruTzN76yjhnULy7wkcpaaNAn8bH+7IKOzT+Dtqd25Z3iTQ+/
	tu7ORz6Pczs0qMJLoq6Zx9dYxoc4FYlRa8UNWvo7IMgSHYQTdMsrUnb/fPLietihM3J11aWT0IW
	lu/KEEX+L2jjQpKs6TFYuDUmuPYuIaQos=
X-Received: by 2002:a05:600c:4e4f:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-48370e2357amr7146885e9.14.1770930593204;
        Thu, 12 Feb 2026 13:09:53 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a02a79sm3654605e9.3.2026.02.12.13.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 13:09:52 -0800 (PST)
Message-ID: <37d180d3-f3d5-41ab-afdf-9850a69717ca@gmail.com>
Date: Thu, 12 Feb 2026 22:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] redis: Remove debug paths to avoid
 TMPDIR [buildpaths] errors
To: eric.meyers15310@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
References: <20260212182929.8047-1-eric.meyers@arthrex.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260212182929.8047-1-eric.meyers@arthrex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 21:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124361

On 2/12/26 19:29, Eric Meyers via lists.openembedded.org wrote:
> Takes similar approach to valkey recipe seen here:
>
> https://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c881822beb9057162dc67ecb386
>
> Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
> ---
>  meta-oe/recipes-extended/redis/redis_7.2.12.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> index 8abf758930..589ffd6fb2 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> @@ -52,6 +52,11 @@ do_compile:prepend() {
>  }
>  
>  do_install() {
> +    # Remove debug paths to avoid TMPDIR [buildpaths] errors
> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-benchmark
> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-server
> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-cli
> +

If I check the file type of these files, I get this:
https://gist.githubusercontent.com/OldManYellsAtCloud/5892bde7408475a93d2faa699ae65aea/raw/3309eb40e0467bd7e2a2bcbd540c822b071242d4/gistfile1.txt

These are binary files, cutting out parts with sed will break them most
probably. I think this will need another solution (will take a look at
valkey also, if it has the same)



>      export PREFIX=${D}/${prefix}
>      oe_runmake install
>      install -d ${D}/${sysconfdir}/redis
> @@ -71,6 +76,8 @@ do_install() {
>      fi
>  }
>  
> +INSANE_SKIP:${PN} += "already-stripped"
> +
>  CONFFILES:${PN} = "${sysconfdir}/redis/redis.conf"
>  
>  INITSCRIPT_NAME = "redis-server"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124360): https://lists.openembedded.org/g/openembedded-devel/message/124360
> Mute This Topic: https://lists.openembedded.org/mt/117779563/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


