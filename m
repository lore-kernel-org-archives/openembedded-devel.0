Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0274CFCB602
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:09:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39057.1772978978719774642
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYrEUznw;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so7101655e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 07:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772978977; x=1773583777; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79RjVOUdHGmSyjoX0xsCvuIpaHLTSXbszWhTPfPmA64=;
        b=hYrEUznwqImjyxYhH84mP6GvVw32DN4+yBAb8aTpR+vIuOv/loiCA9uFqXAfzWKyB8
         tmS3EHYYJDvnJMfNn3OPORMDWbwkGIq+rVUzjn5gN2FYEENqiA+ShgcOnIRoOEbbF7Zs
         uLCqo7Oe/3nqLbyDd8NyG1iaxsnC1V+AN/0/zj6rU4ef9QCdSZRND/e1pfMkaCqQi4Gg
         U/Vr0R93U8xa8E6bQKAbIi0w7ZoupIT6NR8RRQPvUA99oR5EoNMj1zPn2+dBawF7CK4N
         IiRqGURkAJcP7j3qbn4Bb1SQdqPL1TTPKGupQxeWdOmCCpGM/920KqCi4uM7FKUbrQ+K
         mMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772978977; x=1773583777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79RjVOUdHGmSyjoX0xsCvuIpaHLTSXbszWhTPfPmA64=;
        b=IoZLD1zai3gFfqfmJyLvblUog0LgqjnMm/7DYqqMSrD8LVV7rjaNNp5/jE5Yy/rBsv
         ihJ+6RbGVjhPHKjlV2Rb7LykwD94RV7zRGwDr5eJAQzYEdcnaHBW1qUciCSaVNjioQW4
         nLo0OoBMOXPhVCh0MgSdzuTrrbzj2Dp2n8UE7u0w/YWldVEzJA35vkvibnrUtitV7NNj
         chTFQ/0nq/kAuT0KQlZIvrPQbCI23M2b5PuB+nUqkJIoygfVS9q7hjbyK1brbk7OQJAE
         26FT1c/qFPl7cfI80TEf5iOkNrncy8QojZG263N0XkesbFdsLKM2+Glw9tlY3MxQHeuQ
         8hDw==
X-Gm-Message-State: AOJu0YybMpScuZ5k6EoODOrI5NYZVR8nFuyddhE/2IcSO+i1KybpCQMe
	mv0qiECZZfknz4pkjqam341v/idY0jwIF68pOvSbm7dU0xOmGxXQCYZPXnOzPQ==
X-Gm-Gg: ATEYQzzI4xoID5po2x7rFDQaeonJWDU6MZAG4a6F/4M+X+HzUSVmouKKaiM9X3Hkjbw
	4a4ZwrtGoHXUe9I3ATccTeiv8KzKTmzDvi/3ou27AxCJIuvnXnmFtOAgsIeOn/5yuJEiNPMQQzW
	AOTnv/6onKEpLKMZTRiD76+GAfeiWp3apW+5aUmuVOyg+ecAJLzRfGGX1SdzFO6KbxmecLz/y+Y
	itptHiDDOA+4gPofw0+Dzkv5Up0zVOomvEWgFMeLuCL5tgKUouYi6NDdyKnb8x4wsktCkKoOXUz
	NRTehaa/9V6AZW9cL48xF4YZp81E0Q6Kvj3t8oPjBYWA4swvM3Q/X1zEvcFc3ckXUAEL+rrux0z
	FQ334oNFkaB76kkHrFG654amDlkDiyeVRlkGQo1z4qwGRxWR8h1srASS/5Lc7DDs2yiqX85KGkJ
	8Srexl+88Pub57VgchJcFHtAFxODa8J58=
X-Received: by 2002:a05:600c:3b9e:b0:483:498f:7953 with SMTP id 5b1f17b1804b1-48526966364mr145152475e9.28.1772978976980;
        Sun, 08 Mar 2026 07:09:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853044d849sm174283315e9.11.2026.03.08.07.09.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 07:09:36 -0700 (PDT)
Message-ID: <0b75f36f-2ae6-4b17-a460-bc5ed687af8a@gmail.com>
Date: Sun, 8 Mar 2026 15:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][kirkstone][PATCH] gimp: ignore irrelevant CVEs
To: openembedded-devel@lists.openembedded.org
References: <189AE2B53D66B5A4.2182444@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189AE2B53D66B5A4.2182444@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 14:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124940

On 3/8/26 15:04, Gyorgy Sarvari via lists.openembedded.org wrote:
> These CVEs are not affecting the recipe, because they were introduced
> later, in v3.0.
>
> The commits the introduced the vulnerabilities:
> CVE-2025-14423: https://gitlab.gnome.org/GNOME/gimp/-/commit/222bef78c71ed8562a610f6863d56c0b3e2bef68
> CVE-2025-14424: https://gitlab.gnome.org/GNOME/gimp/-/commit/a0fc5a025ae3579609730ebabc3c84146385da76
> CVE-2025-2047: https://gitlab.gnome.org/GNOME/gimp/-/commit/00232e17875d4676a2c797a429db23b1a9815db8
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
> index ad9d34ef6d..4d2771e551 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
> @@ -75,3 +75,6 @@ RDEPENDS:${PN} += "mypaint-brushes-1.0"
>  
>  # It has been fixed in version 2.2.16
>  CVE_CHECK_IGNORE += "CVE-2007-3741"
> +
> +# These vulnerabilities were introduced in v3.0
> +CVE_CHECK_IGNORE += "CVE-2025-14423 CVE-2025-14224 CVE-2025-2047"
>
Sorry, made a typo, the last one should be CVE-2026-2047, in the commit
message also. Going to fix it manually during apply (unless someone
vetoes this patch, or wants a v2)

