Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E9CCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:25:42 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.17705.1759325139622732661
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDW1tMRL;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d5088259eso601693366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759325138; x=1759929938; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LalV4CuwCI1dIq5196VMwAB6Xf/APXPmogBtSlXrEeU=;
        b=NDW1tMRLnqzEtVsDw5OgUCLED0VskIuiZxAth9cmLvQVdsYmWVv8/R/ZbcMJr8sjNI
         cmn57hTFqgdXDmWKd5gAIj5VM4ENusx1p1MHSBSpI0M0EFRXg1dE/lZzpYnYuczToabj
         dlOLEIS2oEzn9QzzoAqA5MEeBMw3OaZo4v/f0kmRKjtmiXNWu0f9boCtLYQQ6P+PzKI1
         MDAxxpQ0ep5duMbaBOq0pvTVonwMU/fYqTCFJvpLDGsoyvCUUyLF4JUyMJbeasEccpyD
         CoOICHDK4f9Qycpu3VXhI5QhCyNcx5ePi7DMqAPpUdPVf/x/dMtaRe8rMo0oHUGNvim6
         nh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759325138; x=1759929938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LalV4CuwCI1dIq5196VMwAB6Xf/APXPmogBtSlXrEeU=;
        b=u2HNNjjtVf+YY4G3TEIfjvVyloKJaTsFFkd56qIIhwKQ4ntEiFY4FLuOjc4Rqz1zN4
         zmuOFZSuPEunOcnxZJt9XwMNaGro3+gF09PjI/BupRCNwiV6X1iUEee8Gl/sayUijrkx
         hGTmOXoAegd0Xu44VcTZ9V1ZRs1CceFITFkkALFzrypWzPJtbRf5qgxcbBcTOrATtxNh
         nWTrHAYoUZbo/uSiblkWsf26BpWAAo16IExZv9QESGRmosOpY+k1+KPQmW89hVsN97hB
         M2qh8DootA4R6z7VSBJ/f5FqJHZ+2sNoJYIAniD8gk20ZXu9O+BP4GsieCU4MPPkWuL4
         6FUg==
X-Forwarded-Encrypted: i=1; AJvYcCVuLOhHHAjYNGIpfBiEMiqRpWRuUr5CcefuShVIMqnIY4x72C30Xiaxwj8Dcidk4neZ1m86Y45kW9Hy8xxxnv9PzTE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYH6USv/wRRhqWE32lwamHswYhBdbh/EmUGYjvA2wv+wzKPdFv
	xrxnMM0VeoMbDNoTA/VnFY46t5XkevNaFq6D2JQTXuUkdlwCJQ/g9Eyt
X-Gm-Gg: ASbGnctai6DGUsL1ayFK63DlwNo7oQ+YhRNvk+mVIGugMyii2FIMX4sZbxaO0C2a/kz
	jUytWNDbUaCGLUn66zDXIyQnz8BOrcV+ayQxWArWneMTdeXvKefubRPblwBzlaHhXtwZtOZb++L
	/4iHRhUhCSjEwzVPztDuHfVvLWF1QtJMQp0BkN9Ixhtn9YoobCF2QkLTTJEx/Z16ho1SBNHJGPi
	8iMoBbzNQNDrKwD3Vr8mBELS6Y2F9hq57yKQE8eIcGSWdwdVHQxQiEFTBdTDPOmMWnqGnsyvTkw
	KawDQw+KPvNi1aM/3mll0LVqT1fOLQGmWDArY6HhmJAr/9YKNkn7iYEHMsIq+kowqzBY4c3xRxV
	XiKBqXb/ZyojgkKSoQ6zic6/qMiZfp0qUkbKls75fPy7N4HWo5GeFHBc=
X-Google-Smtp-Source: AGHT+IGa5yYjw7MUBuRK8fvw2jjP0zQTbA3J/IaPN5kzVh5duGZpXLmwY6fucPJZkx7nNUXQ+r+uXQ==
X-Received: by 2002:a17:907:9447:b0:b46:9a2d:9ef with SMTP id a640c23a62f3a-b46e6a08184mr420784566b.63.1759325137682;
        Wed, 01 Oct 2025 06:25:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98d7fsm1377416366b.100.2025.10.01.06.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:25:37 -0700 (PDT)
Message-ID: <a5530b60-d03c-4c7e-a465-f0ebb24295b9@gmail.com>
Date: Wed, 1 Oct 2025 15:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] 1/2] systemd: backport fix for handle USE_NLS
 from master
To: AshishKumar Mishra <emailaddress.ashish@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20250926164850.40701-1-emailaddress.ashish@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250926164850.40701-1-emailaddress.ashish@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120107

Note that systemd is in oe-core, and I am not able to apply it - the
correct mailing list for this would be
openembedded-core@lists.openembedded.org

On 9/26/25 18:48, AshishKumar Mishra wrote:
> From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
>
> Do not build translations when NLS is disabled.
> (From OE-Core rev: 83795ef6c3fa12a863cd20b7ec1a2607606987b6)
>
> This change corresponds to upstream d848b454e64ffbd642590b4bbc378619e1547ad3
> from master .
> Since the systemd version are different between master & kirkstone
> applied the patch manually
>
> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_250.14.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-core/systemd/systemd_250.14.bb
> index 66d20a46fd..087c0035eb 100644
> --- a/meta/recipes-core/systemd/systemd_250.14.bb
> +++ b/meta/recipes-core/systemd/systemd_250.14.bb
> @@ -235,6 +235,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
>                    -Dmode=release \
>                    -Dsystem-alloc-uid-min=101 \
>                    -Dsystem-uid-max=999 \
> +                  -Dtranslations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
>                    -Dsystem-alloc-gid-min=101 \
>                    -Dsystem-gid-max=999 \
>                    "


