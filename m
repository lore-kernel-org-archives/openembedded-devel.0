Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DA4108E1F6
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:40:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8982.1773920429694796729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCsE67NA;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4915161fso739213f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920428; x=1774525228; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WmrgA2llNKdbKejldDVh10fv28K8+wJ489P6sdgrlUk=;
        b=YCsE67NAn/UcJZpZ7J3dpBUo1RCFXf8wgwTr7LSXuJ4+6HhHj0jXokG1mBzMO06FfJ
         IbItZ9etLrrWiIraek20m0LA/nzQhS3Ko/JbPzX8nfjYJvfiT8nNpSXc1gwvFlOECSYs
         98uy1D3hiAgmH+vdM6RPNDjjNSJY6aXEPrCMO2PcfDryrsYe8FBtAs3/Lyz+64kaF6tu
         ZqX6czekwAQLY8DV053AW/0FffWT4nJYBjlIPf/7Tt3wMqFXgJFuaeLl0EqAdXhqKKVG
         AdP+C0AoSjWNuAwnU/H7etfQmuT2Z4XvM7bHxElXtBLyXye6Dxr2skxiZRX7fJhgkl/i
         fFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920428; x=1774525228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmrgA2llNKdbKejldDVh10fv28K8+wJ489P6sdgrlUk=;
        b=F5HTlOv/CQzC2+SYREmfjarni6pJy32CPJCfbUqeb3CHURbcTh13eA9sckO4NU8+D3
         XnNVu8bQahJv0K1OJnqHiHFxXtSB+sAZl22hQ8V5LVU0xm5qC9nPXr2VE1a+pYqv3pUX
         CzgN/byA8SGswLXGLzqo9LhuBgGWWy0pkKuVubcd6PLA3GiGfNSMiyA4BDvvc1bJQLWU
         hAj8hpYH5vxTfqjX7YW1t2eAlb7GOvaVgKY3LvrebWJn56KQbYh1GH4+5LMEs7xxTiD5
         tw+/lUIVFZjnGfoRy98kjdIm03oMaEKLZVUWist+PMFJeySr/eSsKN7aYI2O9jXeUqfJ
         ZSGw==
X-Gm-Message-State: AOJu0Yyo7S4B8aZ6JWkrxGaGdnz01VVtgdA4ak8ay5Y1G/p/SxsmHxjv
	jdwjUadywl0t5711RjG8o4fb+0oixqiuVurwlGu4kEUOwHDeMM6y1E1LrPzMTQ==
X-Gm-Gg: ATEYQzzzJjrvs+cjYycQCa8Qi7N1HY419xfs5V/twOrhLh4WdvF3DaA6mk8vsoyTsl9
	sC0wwjtuk3OKVxcGtoe0puZPlobkyg798JqOeZ2+gvcCRyPlqb1BZqMJ3Bjio7K+SzSLe3vTPgR
	U5OFD0VgFJm2+QwxkXB7r3SOn9C3MiJUWl8nZmes9vskwVpRr3QwY2/wLjii+bybJ3fw7WI9/3c
	epen90HejRLkzDP0CH6TUGTT/mh0JCygB4oVE6SS6tFGGQw2cKdGv4gpWWQwNhUZcdw+4VT7Cog
	zXT9+b5AR9ev1x180FAnrmyiV5zhecFuphITcg9rUg7eYBmGT+GwZIl0ZRWTNpePZgXw9F+LsCJ
	qRkMTZHiuBvfdWO7g/bvyubfwMhIU2NZ0r8KvyiufMSaE0o3JAIte4ksgmbNSO0cEvMFcwnlsX+
	KCQ6t2E4JvlSn/KxP0aEHnf7LR81vS1Ss=
X-Received: by 2002:a05:6000:4205:b0:43b:4396:674c with SMTP id ffacd0b85a97d-43b527d2324mr11824076f8f.55.1773920427755;
        Thu, 19 Mar 2026 04:40:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852a64sm15861814f8f.14.2026.03.19.04.40.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:40:27 -0700 (PDT)
Message-ID: <2f6d1b8f-43e2-4fa4-ba2d-ef3fb77583a3@gmail.com>
Date: Thu, 19 Mar 2026 12:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] conserver: Add recipe for remote console server
To: openembedded-devel@lists.openembedded.org
References: <ada1edc64fc422e4e638c4a98613bd86f321f321.1773917242.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <ada1edc64fc422e4e638c4a98613bd86f321f321.1773917242.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 11:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125396

On 3/19/26 11:47, Jörg Sommer via lists.openembedded.org wrote:
> From: Jörg Sommer <joerg.sommer@navimatix.de>
> 
> The patches are required to build with detached build directory and
> cross-compiling.
> 
> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../conserver/conserver/conserver.service     |  58 +++++++++
>  .../conserver/conserver/run-ptest             |  21 ++++


Ptests are always nice to see. Could you please also add it to the
meta-oe/conf/include/ptest-packagelists-meta-oe.inc list? That should
allow it to run regularly with CI.


