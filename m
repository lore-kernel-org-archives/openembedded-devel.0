Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8591C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.14752.1701215731652876591
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iUBNhDyt;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5b9a456798eso3655024a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215731; x=1701820531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XLWjLtWm/dPR/ngtm9nvLHS8zVVxJ/p6Ol7wjMMMQA=;
        b=iUBNhDytNE5MiIAk7EfJ3Jiq9i6WxFK1BXkdJQlGhDAm1h3URnIUOHH393gMw7M67C
         htiy3KlQvoG41CRABOZsa2tWzoZLKdWKEQX40nQqQr/rxu8iSzz5xaCJBYO3qp7RDcMa
         tamnbR62BJX2RiSnk3pAXQROITu/jWq41L5kRdod93RrIW+IXX9z2MkxA/RippTZhpVa
         4FfH4KPZU0qL1Yglwak+fRnwHa3iIt9ClL4NU4pu8DgGCYsQu4ccEhu90rWQFJQuRyd7
         tQppoEaaGdcumxWD0UVmw+Ufhf4tjWylKmow5meLMA9B8U3ouJ8xH0Glz7VxOLMx2V5F
         sbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215731; x=1701820531;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XLWjLtWm/dPR/ngtm9nvLHS8zVVxJ/p6Ol7wjMMMQA=;
        b=B0ECVdDnUu6TWfmhUJqk9/heYqbT/kUuYEOay4cFLvOL6SOxYPgi1CZa827x6KVr4u
         3nWf5vSRCoPBZmKlWdLCOwgcL6fhaCSbp2k4tujLhUbW0fj7/O8d+STLVjuOQ3ig9sPE
         gzNRzEK97KQcPoLxtv986GDj+zw/L+/2ekChcEuZwxsDAJhoz/FuBY3/CA6oWEKv7xln
         ZihmYopf70Cw2OCvZXW/e6cbV50D4rSO9YXmBbe2REbb3+uVbGkgEJfIEzNzDbrl/NW0
         M3ug1hdluP9q4ZL6G2tBexMIZV7uUZ4AWNRvs8QzDe4U3xAcdDpdPWV2bCKiA2s02QGp
         KoeA==
X-Gm-Message-State: AOJu0YzxBzYzzVCWX4OKphH2tVP4y15iV4FJ2WJBzleipkr0fVARiJyh
	inSrOC83U87ZHOSWVZ0JLBgWufB5Tcg02w==
X-Google-Smtp-Source: AGHT+IHONyJ4U5KRlWvxaNsnbgaXgu4w1O6k3OlGUEMaV+wxZ0OmrvjnX8kUu6lJBNTklZVHDfKm3A==
X-Received: by 2002:a05:6a20:258e:b0:18c:1019:3e21 with SMTP id k14-20020a056a20258e00b0018c10193e21mr12760942pzd.39.1701215730831;
        Tue, 28 Nov 2023 15:55:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160643-28354-1-git-send-email-wangmy@fujitsu.com>
References: <1701160643-28354-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade
 13.0.7 -> 13.0.8
Message-Id: <170121572980.1187527.18086392221444618099.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107116


On Tue, 28 Nov 2023 16:37:23 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Change BBC Sounds app_id
> 
> 

Applied, thanks!

[1/1] python3-pychromecast: upgrade 13.0.7 -> 13.0.8
      commit: d9a5eaf0f18c4f4499a85413857becd7768c3b5e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


