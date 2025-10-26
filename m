Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B776CCF9E9
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 21:30:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.18832.1761514249956472108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 14:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=haqTlPTI;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so29339645e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761514248; x=1762119048; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TI2nPwpHwltoDM1s3/+T/WUKPnO6HBVI/lwRjY/ahN8=;
        b=haqTlPTIzWazDCktNnywkvdG3veonDHMidZDlCDHJK++axiqotNvKMXsPUZ3Ad9KJm
         yRxRrauqCaOUDJ2ZDu+ELSF/10wrvTQVonBYD4XQJKoSUegcWBQUW5MKXs8QOByxASvz
         D0Kgf6Fe2BVQ6JxE9C4nq6qvJLFru55Qi4Mh5H8/h4KNgR0BQ1BhBFpxy5z+tIX9ohzI
         QIiRnzGxlCH446ulIyFP8Rf/iWHz6OvifUMDjzsvtL9XxLxWlz4We5JxSinDE40bB64V
         s7IW9m1zJoZOST3ewGEQrindkJ0k7cmzzv6eVmDNRQI9l1saVv7DvCRbVwHhGf5IvR70
         fJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761514248; x=1762119048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TI2nPwpHwltoDM1s3/+T/WUKPnO6HBVI/lwRjY/ahN8=;
        b=gUF5zOwjRTiCDEDHf3sab7v09cKMrwwwVx8IUD5EPP24AEeFu8cobPeO8Q1ttzHS0D
         r2h/J9AZ/Qc0T9HNvb6pxhGfVlwn+Ft03wFCDwjEhjKvGEDnSO6tHJtAKJv9sQBbzp8s
         BlHjCAdX6YEv0/lRBZQP6wex7DgCb17O/2enQ5Wnf8ZEDQzvaiqAowtbvcdSgIPAo0ll
         y07GD1myt956ZbH6EPqbdAvpyUo2LxFq7yNccHptWN5U0A5sWb8OQeem+k+lj80g8Ric
         2xyL3+qfT+ft1/N2c7BTpHoGRPZPJ8F2ac0Bm3UU0CO3b3ojO43R4ibAgBwfH/qpGpGn
         tEYQ==
X-Gm-Message-State: AOJu0YzlNpZYNWDITY4nHxPq1gVGXOyVm4/gkDxFG5Tk3UqT5x0My5Iz
	CwB993aUekr8vwVe4iNsV4p2+WdCrEo6AnY8y5d7scT4X0ERF3XnPd8fP+CVZQ==
X-Gm-Gg: ASbGncsxr6jV5rRFLVr2ckK9KkIBl9IUjrUaEen7wlqJQgE0wgTjCPbYdhc4PDWYHUi
	qQU11/XgZvhdQ/vY6W+dWhghq4RFFKP0QE4BE2sTnU3mHzB6c+XEH2lQY3iNrnQFCVNXv0VyoKW
	y5+v0+iM//U/VBbeYdjhX5Qc2xepFqlPJ4+KFcfYWnrJQpYI2pHsx+Y2gJl9rN6MPUIlT4x2fwG
	eTQNA8qI02oyqsTRWNia6kf3iWhskxD/RX9dLXCYMj+glroXR1wTK13q4eifNc8l7xVzLN+Re2I
	1eNHXuZjcFSEh/Wak3kLMHZf2GudfYuKS6vAJnspe0Yuk0XPlxSo+gQwXZDfiXpuUtm9rVLObW7
	8DuRCGs1Q+YKbm7wZf0Ggg4s3Y5FZe3ivKNDvZnbZRzX70NbAD19whELsB863h5tv8DBJV4P3CI
	9lwqRq2c5d/rRgw6ZoH+s=
X-Google-Smtp-Source: AGHT+IENuy1e6qH1pnyoQ4SC7x1Gfhj1zewZcopQqF5NHA/vstlxTVxi3TqWAB8/x4Yqnb9jEvWvpg==
X-Received: by 2002:a05:600c:41c3:b0:46f:b42e:e363 with SMTP id 5b1f17b1804b1-475d244d75emr51807415e9.20.1761514248079;
        Sun, 26 Oct 2025 14:30:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dcbe5587sm112051185e9.0.2025.10.26.14.30.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 14:30:47 -0700 (PDT)
Message-ID: <31d2492d-e8ab-4343-ab2e-73a49b14ce1a@gmail.com>
Date: Sun, 26 Oct 2025 22:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 1/3] lksctp-tools: move ptest from
 problem-list to slow-list
To: openembedded-devel@lists.openembedded.org
References: <187225B9582EBD41.2174@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <187225B9582EBD41.2174@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121018

I missed that I have sent this particular patch already, sorry for that.
Please ignore it, it is identical to the earlier sent version.

On 10/26/25 21:51, Gyorgy Sarvari via lists.openembedded.org wrote:
> The tests execute and pass successfully - I managed to run them
> successfully, without a change on x86-64 and aarch64.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../conf/include/ptest-packagelists-meta-networking.inc         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
> index 1cdb6d1811..408b559da2 100644
> --- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
> +++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
> @@ -34,12 +34,12 @@ PTESTS_FAST_META_NETWORKING:remove:libc-musl = "\
>  # firewalld currently hangs forever so disable it for now
>  #    firewalld
>  PTESTS_SLOW_META_NETWORKING = "\
> +    lksctp-tools \
>      net-snmp \
>      openvpn \
>  "
>  
>  PTESTS_PROBLEMS_META_NETWORKING = "\
> -    lksctp-tools \
>      nftables \
>      python3-scapy \
>  "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121015): https://lists.openembedded.org/g/openembedded-devel/message/121015
> Mute This Topic: https://lists.openembedded.org/mt/115964507/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


