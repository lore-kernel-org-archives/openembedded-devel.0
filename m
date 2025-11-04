Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D761CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:10:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13064.1762243809620153550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=asAT07u5;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so2670789f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 00:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762243808; x=1762848608; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4dxtCI3haVh/dXL0xFlfO1nGitVEyZz3bq5Av3kKpM=;
        b=asAT07u5HuvpfRbI+jE98r9GIrKy2Z5CgiP2NuVSgskUQhSq8W4uCIDA2QIL18b9+B
         1wlVMLuFxOkENOhySn3czAMNWwuoRZxR0V/fcXrqXzZB4J8B9vrvcm6lFKlxRTnj3sLX
         UcFR3Nwc/ntnTLAXtlxfMDW9pyP0j16w7l5nbh/fXzLyT9noXaCC1kGfT5YlyMCj0yNM
         ZTjdoP5DCl43QUdKD6jh0QaVsLmDlgo3pUi4IP/mDc0tkQftjXxSaRW5GCaadAJ+8s9C
         BJZCoV6dXt6bZ2nd4aZCNlHzEloUTaeOXWb4voPF1BseFVNivsgz+I6ifPZwPRrh5jDT
         NJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243808; x=1762848608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4dxtCI3haVh/dXL0xFlfO1nGitVEyZz3bq5Av3kKpM=;
        b=dQa3ZB8n9lTyIjtUyiZ/7Nexl80IcuTrQ4424/dSufj5gvUZwDg3aaJ8Iffy1+UqNG
         xvsS3L464DNwT6twSQ4u0TjTbBCbvZLTzlm//8np1m9M2xIgVM1yBv+ynSP+2a8Y6JoP
         UmhU+dlUiBey1rVUuEr+QLZ7W2qB5iYmlvH8uDxPVfPzW/Zp3Nk+ti7QD5pq6jqeI2dv
         G4ev/rDLZFwlO3689reQKMjIWj+o1rxm7b1uLZijSvEzxt2W9W8sya60QgQ3OKP6Ebur
         IaIwXpIMC9dFlPm0yQfWjxKl9lVKmZAt5Khw7hoF1pNCMN4LimuG+xKq+ty4uYaayS+v
         htwg==
X-Forwarded-Encrypted: i=1; AJvYcCWWNZUMZUBqgEgXpFP8Ae4tGDDrHJvt82GyiZ+2VE4IbNvq/O0r1jn0x71+QoNGWEnu3NVE6BBYWpWJO6RXnGxtDaM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxSfmYf+S8+xnkiRwDD6/IGrVyb8GL6jz42c9fZ21pjBdsRB7KC
	O+dExSxcOd5XLGXWqXuEALYOcZSjRyFdl+nv5DBYTBtD97/ZpKrkLFl/Uf9vtTwk
X-Gm-Gg: ASbGnctIzHQomnYDnPrkjqCOlDC5T/ouWKpp3zaNeFxgV/8BWzCqkj4Upao1zdjEdik
	/b7Nd+Wv/C9Qf8OAadwFVB6UbZw9mzaUkR9+MgMN7eX61ZdGlShCdpEFiZsu2HoUrAOMOSvEB4C
	1wLYLNiL+GhauAa2Yo/Nx5qxCfAkiScBKXjq2RK+9EwQUahW3ypSW3it0bYTfGuPuZvDjB9VcSf
	I8o1mHAwaA9Ottg2OhvIe/LfQEKTAUGS0jk8FQhzGARoi3HoknGs7GwXuEmxBjPrvHvZMms6Xy6
	Epi/82wFb8M+BFufBItnfRXtBfKlvfYAqUbwiCmL4NxsTF3l3LLet/0rdgUf84Usr2QKLo+OPmT
	w7LRc9sBINm4BEsVZR3qnZlKaGlXnHzvyBV/g9CDUndbWw9/Lv+5yCuqQBe/CEhegfdGMvnjgp4
	9sQHMQ7MhJxGyaCiHcCR8=
X-Google-Smtp-Source: AGHT+IG47jU6dYy9oYPssOKo9PhqBZwOdC2/MwYsKA82fppIoCQyFTmgy/Ie/a2V+d6yD8T7XGy39w==
X-Received: by 2002:a05:6000:310b:b0:429:d161:ec9f with SMTP id ffacd0b85a97d-429d161ee2cmr5270404f8f.45.1762243807442;
        Tue, 04 Nov 2025 00:10:07 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fda36sm3030440f8f.40.2025.11.04.00.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 00:10:07 -0800 (PST)
Message-ID: <e3f7c470-18cd-4fe8-985d-90c10e0955a7@gmail.com>
Date: Tue, 4 Nov 2025 09:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] protobuf: Remove embedded
 runpath
To: nikhil.r@bmwtechworks.in, openembedded-devel@lists.openembedded.org
References: <20250923062715.2563476-1-nitin.wankhade333@gmail.com>
 <142688.1762237042454868535@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <142688.1762237042454868535@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 08:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121290

On 11/4/25 07:17, Nikhil R via lists.openembedded.org wrote:
> Hi Anuj,
>  
> Could you please consider this patch for integration into Scarthgap?
> Please let me know if you have any feedback.
>

It looks that this isn't in master branch. If it is applicable to
master, it should go there first. If it isn't, could you please include
some note about this in the commit message?

