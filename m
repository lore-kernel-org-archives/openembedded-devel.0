Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B754D25030
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 06:08:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27690.1768198104419378432
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 22:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gZCcmM52;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso24789365e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 22:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768198103; x=1768802903; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSGNK8VVyR3Nknf/eZJWoh9xljviFweVCcQEFek1584=;
        b=gZCcmM52fDMLffA10FtNHi3xytxMFx0DNdUUFx1s40RLbqqLQgyT2dRuC5jFULPCx4
         HqnojDWPeF0wb26jPk4mncEEHpnQFKjFjb6CcTKXRA0+PqgRkdwV5doIk8USEeDWszMD
         LLhiv7YjLVT8V8ng77bUQIs9wedrpK3BhJeey5JVV5B4Ga7uKiYhvW1ci4XdFi7tdbyF
         Usgi0u2OB2l60P3cyunb7JumRJib287t7mtyOaQTxCbWVCXFGvFtnHYhpNrdRUx9VJ+i
         VE/3EFqUJRMA4tVwws1w8Dko++VJqqbvAkAKyvq4jdZq4MKMlQtY7X20FxWFy9vGe0U9
         mE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768198103; x=1768802903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSGNK8VVyR3Nknf/eZJWoh9xljviFweVCcQEFek1584=;
        b=AGgViZVJ8BbhzTpmLO8NUIq+Oxaw5DZoEB7J2QPBXNc55hDii+W8vmtVFGJhZuINMX
         W0bj1A0JnEV1745hwiP8m4HW7W33bGZEw5vzajFrjPc4jzxZutY6FFDrAv/Kigc2XXvd
         19mub0cg6dtLJKJ+PCQmWbDvpzw28DdFF9nM0G2lygCzLY1MB4CdfR/7D8+7nFO+Ti2p
         GaujI+URzQLR5K7DcgrYdFE6IkGda0LgRE6wQOS+FxvgXHsvMxcSLVlSZBGXHMVMerLB
         f72tYBF+/Bs3W/Wujg83vEB7J3SYBqk2DC8zPoy6LRqgqOYU6pcdt9XI/E1EVkmGNhmB
         iuKg==
X-Forwarded-Encrypted: i=1; AJvYcCWaofkByE1RlLF7POSovY5rBQBV1VXK/M18yYBgglGiChg/3hQQFbhCT61trVcW2ZBGZHFGuk0drU8EDcWFHtNen2s=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxu7pPf6t4Me8HN4C5r6P69iKKmw7sQcCSYlRhErWgV71aVePC5
	e7k56kXuXPW8rXVvlNCYEQNcvQAhgmnVdqRX7nKhjA2guJYlCY0/ChTP
X-Gm-Gg: AY/fxX7PNAAtCM+EljfINtigEsw9xFVTeENORTF0SvPKFNRFSKNmdfXpvbEc64sEsv3
	bQeZ//NiQ40tXReJV8GWhibtAeV7uEZtIdSORkU5CRZDCciOfY+JevyJVSjAZMXvWeJIZ+SiDnQ
	It6bBr2XeyRkhB8PMHDJw2bSETcV6wuIMAGpDONvTZrb3jUs9KEC2cPDQq6XMQxGk1bWHV8Bh9l
	gL5fv7m4FHN5DPU7RMN/zFTUYbLfqXLsp4nPv9FqC64LWZhPyN2ntV8K6OmlyMNwjZKGLswSiFg
	j6xZR++INZOzeMxHQ0BcdsotX2m725oCbtl/Bajuo75lupj4/KJMP1pJlj3jTiCN8yDyPVZR41u
	s87WJzAcgb32pE04LeEDN4WJnfd/CfimfgGV7pFzHt864krQeJBvFoHaABa2axyZoI229JoQ8XD
	izoMGWYfp1CiBcFgXAhS4=
X-Google-Smtp-Source: AGHT+IFVDwLFLJf8W4iiuQyHHERB4KVdf63RGpsf7XeDIQFto3R2xD/49Eeti7aOGdUT5z6Xf4YMKQ==
X-Received: by 2002:a05:600c:8b6c:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47d8486ccebmr162728375e9.11.1768198102520;
        Sun, 11 Jan 2026 22:08:22 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8384646fsm304081955e9.15.2026.01.11.22.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 22:08:21 -0800 (PST)
Message-ID: <7f535a1b-9fd8-4966-b521-d77790726916@gmail.com>
Date: Mon, 12 Jan 2026 07:08:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/5] freerdp3: ignore
 CVE-2025-68118
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 06:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123356

At this time this CVE is both ignored and patched[1] - I think the patch
could be dropped.

[1]:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=anujm/scarthgap&id=19d7eedf67ea1b8fe27790366d98a7e888cb839a

On 1/10/26 11:37, Ankur Tyagi via lists.openembedded.org wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Only affects Windows and can be ignored.
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> index b9ec75236b..6e27efb5ce 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> @@ -74,3 +74,5 @@ do_configure:append() {
>  }
>  
>  FILES:${PN} += "${datadir}"
> +
> +CVE_STATUS[CVE-2025-68118] = "not-applicable-platform: only affects Windows"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123320): https://lists.openembedded.org/g/openembedded-devel/message/123320
> Mute This Topic: https://lists.openembedded.org/mt/117189431/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


