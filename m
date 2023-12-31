Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08780C47079
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.198905.1703983106304579527
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iF1Eo4Cz;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d4b28a4054so1177025ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983105; x=1704587905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR1TQtaJvb/3SdRLOEJlCD1FuNFrwrN6S6kKqEGuvMU=;
        b=iF1Eo4Czfz4m3zspR8DFfwV5a/FVhKZ9BUbquy8wEGlvuyCMdNnuh/TuCrl35V+SkP
         9yMn1EQYleO40Cq1Amk0ZGTZaR5bsj758l/Z2iTgr3QX+N1fJ3SCUt33obBacYJE7ZX9
         NcKonBYIJw6s5S/6J8XI2B5JDhztkBVbSMQDUmJ4XEAXHLWDb+nl7zmxXrndCYRTJvCq
         cXAloSfnn0WLWSoqAsOKW80us3KJEDTCbGtAqngtFnhJgXAE/LE6AlVvC7abqCztGfLg
         wSrVw5l2QzaoACbqODqzxf2CCaRqOmaBoen/4nWMVmg/FmeYAZUra8eM3cGEz85v9eWP
         vGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983105; x=1704587905;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR1TQtaJvb/3SdRLOEJlCD1FuNFrwrN6S6kKqEGuvMU=;
        b=fqUauIHIiuoyjfizApfid2UfuQwt8MoM5Heyc3TIwg2G7+ZofVPfTFmLM6C88ueiI/
         jRG8RA1IMwlhWp/7e0KUKLzQrjT7L7MhYQ9A5oDayANUCs5tx0NHH0uFyB0eQih+ginz
         j5RN434y1wcTvfbEIRVdQQXrFdV7ugR7N0G4kaivJGVippIFcweEuupQ2Mufg2i7nWAT
         lXnWZMSzP3StRy6m6XU/Y9eqZ38/mAz40Iw4MaSRbHTxDljG5SbA5bF1mosBX+KtIjKL
         d4tOl2AO3yE0iUUaYaotVw2Z2QQIz19x5Yj/u8FaaXdHB6zrnLo1aEtXKLxdnVAKgmIL
         pqmw==
X-Gm-Message-State: AOJu0Yzm7lXzlmx/28s1cYyN8+7JojI85RC0lUzJ0L8WobJ/LfdAMsmd
	JlzN3GulHtewt3TKdQ2R7BaqMof+cTQ=
X-Google-Smtp-Source: AGHT+IFFR5VaLZtV3IKisleWa2c6AQOLOuaYh7sp+15ja/o2bDyGsDsnziwGimdBPxKHqdITAELqXQ==
X-Received: by 2002:a17:903:64f:b0:1d3:f3c1:57a5 with SMTP id kh15-20020a170903064f00b001d3f3c157a5mr14051926plb.86.1703983105455;
        Sat, 30 Dec 2023 16:38:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703573942-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1703573942-12664-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] uftp: upgrade 5.0.2 -> 5.0.3
Message-Id: <170398310455.873206.16898127803392056229.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107920


On Tue, 26 Dec 2023 14:59:02 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -A memory leak fix in the prior version wasn't applied correctly, resulting
>  in an invalid memory access causing a crash.
> 
> 

Applied, thanks!

[1/1] uftp: upgrade 5.0.2 -> 5.0.3
      commit: 5d050f078afcb24d0532367592b074ae0787b06f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


