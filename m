Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49402C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3215.1699900430017599211
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bn3dFryw;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so4771246b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900429; x=1700505229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WajxkI2EZLlzh90X1A8Ub/pwE09KcldDQZNq7CBJDss=;
        b=bn3dFrywJpf6hvltf1a8EnzCuO2WdfJFlkA1toRImmf2OKIBriC7Uum+IRibBMOfFX
         uDnElTbnVUEVRvCNUC2kawtRKQRoFcPsVY0+AeEybvFzlsqzq2T0L8+IwkaXQGVvHD3W
         jTJq8vZhZOoxOunOktKMf4ceZrrh82MuezhKcEIWTTmv/s6myuXF0hDhUPPeUB/MRgZ3
         sjfkiAVB4AidDiUtGrFhWLBnDMsOITf/aqvl/mqmthcsSDcyNt0047CRJ1Yqw0I4sftj
         pe1F35sjo9C00cs5fieLLRuV2BMaZwlK5fshrmA3B+VtaxouEInmjb3Pc/aYtLFIT9/a
         Q1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900429; x=1700505229;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WajxkI2EZLlzh90X1A8Ub/pwE09KcldDQZNq7CBJDss=;
        b=JDNohTJ8Dc0C8FIi78FdJIgSTgFqBwBIfyac/s8owicPZJalrBfI38woq4kU1M+gUM
         ma4kGw567c+4f2glfBAKzYEVm7lp5FGu74IlCTWYYJPC9sYiYmoHybqwkqvm0j9jlG/Q
         PkHieJdper2AwmdCgV7yx0zB+b09LM1O8r0JAz3u4LcGrmTJZrg9MhU4onFzQs5KJV3U
         B3Z3MuDtBXFTYC0WlTjAoTcOGljYvMviifWlopSAtzJTnhwyOI5ai0eiNrhYOECu9VrJ
         ujNayqnOXAVQ3vKefE5mIUfg98uXRlZt6iNrXUcpre4lKJogpGe8+YLjdqQn+g+TThpT
         w4xw==
X-Gm-Message-State: AOJu0YxySldVfSz8ul4OVJQDsY/jF6VKaj80wbQWnLyVbikPO70YiEOu
	dq6XftJJ/OpLp6eQlcDAZ4KmnwuK1AyT2g==
X-Google-Smtp-Source: AGHT+IGaPWOyXCs4nfVSv07b6mXJvREWmAiNzo99qcKhicQRGKNaGFBlS6MiUX3HZETWwVMQ6DuU1Q==
X-Received: by 2002:a05:6a00:1492:b0:6c2:c8d2:94de with SMTP id v18-20020a056a00149200b006c2c8d294demr9356628pfu.3.1699900429172;
        Mon, 13 Nov 2023 10:33:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112081748.69354-1-alperyasinak1@gmail.com>
References: <20231112081748.69354-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] libupnp: upgrade 1.14.6 -> 1.14.18
Message-Id: <169990042802.4418.2312264047676042815.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106653


On Sun, 12 Nov 2023 11:17:48 +0300, alperak wrote:
> Changelog:
> 
> github.com/pupnp/pupnp/blob/branch-1.14.x/ChangeLog
> 
> 

Applied, thanks!

[1/1] libupnp: upgrade 1.14.6 -> 1.14.18
      commit: 6908f7fcb825b896fcea102ae75dab2a6122b42a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


