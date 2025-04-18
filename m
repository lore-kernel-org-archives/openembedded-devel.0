Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B08EC369CB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:28:36 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.9617.1744975710927153634
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=niNOGlq9;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so2748378a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975709; x=1745580509; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9NrQeeggTAf0Q1m0PJHuTNFCb6AKANcIjVR4mHHK0RU=;
        b=niNOGlq9a1fR5UDyioPyjbY0arTVNl9FgcgLblyhlhND4MEUx1sqUE2zruSFTyE0jf
         bzSDfNdqMAvJsISx2CaOf75f2oJvCwJxMxul1eRkkjukzRvxz7u39/7gUMh+rEyBokMo
         zlHn7XiZXzhWpYypp+Rku52W7+yZedhGifTacwg/LY9OoqsN8+5xrwZqH4sOkpmfBmkD
         5+ImMZZJ2bomWCvk6v4IwafQ8GFyZwX3xYsstA884AuJGky0rxsrgHFEgw+LbyVNJKW8
         XEIMTTgaupSW6QEeo0o1AG35pjXZVQK+QdTzun/+lsz+Tn1JoWYQg6VSW7bQ7aGf7+X8
         IE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975709; x=1745580509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NrQeeggTAf0Q1m0PJHuTNFCb6AKANcIjVR4mHHK0RU=;
        b=mAaMAq+1BKESgfa96keSWeiYLT8/+aKMsZaAN7DxVjcWLWHMhk1wG3sWxbEFaOJVrr
         tAH7TQwJ4caFGMgkQF/mv3GLuXcrspaco0TokP8hxAEYTtOZ9CG0fpmQ2gKPFbrR/Psp
         BzHvTVh9EtRJiS1pSL9SQK1/w3U7EfCNWBo6RM5AjiKUAgzPpLDQdLVVE5BDw9GTITmN
         qPdkbEc38Ey8q8/WTGXCLckCTv9L15suplM9lg8leAB5l91DrVEBy5YkB+QNVniEqUAa
         dYTWEmyP0wM98xkwq+jW03kzZHsAfeZpuY1auW3uaefH8ZT8JIhvFFr2fyZOFQnvRk26
         OqhA==
X-Forwarded-Encrypted: i=1; AJvYcCWc3aNq/ZO7q+jxQLo5Dpu/oEb4RFBA5oaGR3fnC4kgRJVyNzkH4DbIxGvt5nHUK9UezzFYTWPkj0qps1sMWQp4ULU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmuIioj52Nj2oXsnNcwhwulhrL07Re8HOXXgRhwUSWQ5ljovig
	My2jLkba6aawSto5yuJrMHotTR/508iSc0pNxGl6MGGpRktmm2dT
X-Gm-Gg: ASbGncvaoSC9rqIZGoKmEd/21Xl5prN2Uc0CYKUn95Sk6knhoXWU9tTf+bizWqy7Ei+
	ewEV229DJ54dROG0KlbJA2JFAzMjrxPgU6hbuMUeM9DAme7sJo0qYCitsShP+VfOmNuGcxNiiqL
	EJxPcbTA303MgsMXwEyLwWm11gVORTNHRnvfWklInBzC+d4u48g6+jh4qI/Ko4OiH463Y/0nFGr
	9M31JN2CAoDKNzT9ywVZ/5TM4KSeO+lAyWpfZ34UsSiZOWB1K/BWgPJ/sBXX3qYrQWWiW62xqMC
	2bI2zEf6R3Kop1y3BFg1eTrDFCvqRdOOnZcjcubs8gb4IYU2rV/AjCav+FM=
X-Google-Smtp-Source: AGHT+IHlf6u9QH1UlivtS9yscAAxzne4B8gg53Iouy6hbncywuHpa+io4aSk4EAbrnq5WVKHOoPfIg==
X-Received: by 2002:a17:907:d7cb:b0:ac8:17a1:e42 with SMTP id a640c23a62f3a-acb74b1ddbamr211684766b.22.1744975709121;
        Fri, 18 Apr 2025 04:28:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef426c4sm107255666b.131.2025.04.18.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 04:28:28 -0700 (PDT)
Message-ID: <6aea3e42-82db-466a-b271-bd190df0a631@gmail.com>
Date: Fri, 18 Apr 2025 13:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-initramfs][PATCH] klibc.bbclass: Add spaces around
 assignment
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250418014123.3684623-1-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250418014123.3684623-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116949


On 4/18/25 03:41, Khem Raj via lists.openembedded.org wrote:
> +LDFLAGS=" ${TUNE_CCARGS}"
> +LDFLAGS[export] = "1"
That space is still off by one in the upper line.

