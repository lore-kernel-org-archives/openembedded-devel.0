Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB856D64092
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 08:31:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10199.1765960293694145715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 00:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YMXi2kZa;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so43078035e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 00:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765960292; x=1766565092; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tB96ESD7ikGvbqJz5zc61rV0dD7cwDMPKVx3LIkLnBc=;
        b=YMXi2kZaNiwwx0U82DQCEvMC4ytPHVV/2ozhcWeBumi4Rne/qjDSrEqI5JBD9iDjUR
         eAha0Occ+SnLCyWWB//eHiyZgnOIjKWLoctUByJg9FNUf51UUFYmOQMnt4lcChsRgcfi
         UaumGzF4ThX4B7M13Svvp8XcB5i7J8witehHZCJPtQUTFvXopHtL3aLB8BK5HHle4GBc
         kFgjK/Jg+tfchPAEowbQI/1bn6T/5YPYXoKGZsYVJuGhrEUeRjW8nXyXoq7NjsTUiAeb
         2JWVPgiuqJD3mLDYeBBfYl7ih3N6AmXqcXv3YF/KdEYuaAqThLTiac9iclmP/62tPLYj
         V5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765960292; x=1766565092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB96ESD7ikGvbqJz5zc61rV0dD7cwDMPKVx3LIkLnBc=;
        b=PRaaNHa41CCL49ZPyxQK/0RSk/glbqEEviwmCOzuPU01BVMtYUIV+V34xzoRleETog
         sp88ce8bccBgFOCGIg06cqZaFU4mGqcHVmvr2KudxJrB8/Uw+raQmPiRvHGiIW47EbCy
         4kI7kiTNbtDLuyjx9reSZ1+qVEEIPZtGEE26yFzbhoyNpYgrIu6UWsY1TVFz5RZfxbxZ
         Z0F0VzsIIVDY7HiAz0zxxTYMnu8cka/ghUjz+sUFt55ED+DJIWQt6OS1sopZYu728kXW
         7cxlZJYJJ9NdH/7JV9LGkp7tYG8LjOcy0YXOUHYusH9Pld9CY58cnQqjwlQE+NBFkkO8
         6YfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1PfQIK1ZYNhnChtM1ZkKgLJQwFQyVviRy35iExGVkhOQUTvVDjL/AdN+xG8UrTzkn3AgmmfkkEBl5MJlmbaGC4U=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmpEtek9qCiH9g0zkP0rLJ5FXBE9Laat8K2qAifQqocBoBpB9t
	TJ3r2dgH558UUaFXGPFPaFYgaMZMQyz8ZVe8+hoax3xHd3VeY0Rikmf8
X-Gm-Gg: AY/fxX4QWnjV4hwqjQLgh4faGFMSRjbw3qPGaujODZ1aVvd+RBK31sw+Vv8EPDHGTbo
	XtUUUDOjM7KFgLNryMKKlY4d/dUWRMdAY7YIHrZRQ2l5o4D5OUxyXqL5mj+yKOR1QXdRl1Q+ND7
	kQstqtfcszIEnwnvwaFcCCCB8tfz8+EVf/uyd3qzu5kuxaIj+f+vbalaxmh5JVlHCnB+oPI+LoS
	WO59GzxZBERuGQpOnhItWiGs1LqSRnkjRLWrRaOY1agnZDqfOY2mCba9b1eVUbypdu4B5dUsI22
	It5pvhhVcImUkwLeD5OHx+i1ZKb6xVtfFLjXeNQuwGqV6gLp/8d9T7u/XaNf4CBbWN5yFpBA0Xt
	1YOHGPOA09s9f6rKSF75iKIoWTcQkNAhg4EUyIYZuZ8Txk5iUJLCzbeR4WqRwV7ZsChVED6OJSG
	Mjfn1E0RxFFHqu1PaCqlY=
X-Google-Smtp-Source: AGHT+IG7tq2UbB9uVRrGQn6fqALJ/b/T1TuQIwMIsOXY1DxiJfgB9c1A2vzV3gpkgPJGZxlLDFRA4w==
X-Received: by 2002:a05:600c:828f:b0:477:55ce:f3bc with SMTP id 5b1f17b1804b1-47a8f907063mr180358635e9.19.1765960291609;
        Wed, 17 Dec 2025 00:31:31 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adad2c8sm3353161f8f.13.2025.12.17.00.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 00:31:31 -0800 (PST)
Message-ID: <25185c66-9452-428b-9b33-97f7270d1cde@gmail.com>
Date: Wed, 17 Dec 2025 09:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][krikstone][PATCH] python3-django: fix
 CVE-2025-64459
To: Haixiao.Yan.CN@windriver.com, openembedded-devel@lists.openembedded.org
References: <20251217064521.288044-1-haixiao.yan.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251217064521.288044-1-haixiao.yan.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 08:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122719

On 12/17/25 07:45, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> +---
> + django/db/models/query_utils.py | 11 ++++++++++-
> + tests/queries/test_q.py         |  6 ++++++
> + 2 files changed, 16 insertions(+), 1 deletion(-)
> +
> +diff --git a/django/db/models/query_utils.py b/django/db/models/query_utils.py
> +index f6bc0bd030de..e612ee8b1a44 100644
> +--- a/django/db/models/query_utils.py
> ++++ b/django/db/models/query_utils.py
> +@@ -52,11 +52,20 @@ class Q(tree.Node):
> +     # Connection types
> +     AND = 'AND'
> +     OR = 'OR'
> ++    XOR = 'XOR'
> +     default = AND
> +     conditional = True
> ++    connectors = (None, AND, OR, XOR)

Thank you for this. I think it needs a bit of modification:
xor support was added in 4.1, so I believe it would be appropriate to
adapt the patch by omitting this operator from this version of the
recipe. What do you think?


