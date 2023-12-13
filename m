Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879F2C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:50 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.31076.1702451261661972364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XVx7zOg2;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-20316647099so542175fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451261; x=1703056061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBbkFPKFSl40N9FUOromZ7+RqVIJ8u6egduiCqAT4eg=;
        b=XVx7zOg2LD5ZuQi3WST5/QH0QSCk2ivVRT1/qI5cUkwPI823lpmDVTa2UUiw1N93Ha
         wClVGK9Ierk8jjvLMzUksCDGLulGba8J26UI3PbqBlRW0qWbZdbE6UykKjXdpNR0h8tA
         ii+J0NRy9yTKIt/ZZ6xFu6BsiIDUtwhL4zfY4QR/s4ZqCuiY2ZG480Gkkflp185dGtLV
         n8Lwn8Mdko51f4BFjpIHG+/pNm6qqrVsOCVXxLqjRHEyIe0AgNZkA4OZI12f2Irw+/zk
         KQZvNA1c6P+q4fN1anPHc/Q+lLnANZpqooeZYA5PgI6vltWhQ8svuh4A7MWzycrg7CsH
         2UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451261; x=1703056061;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBbkFPKFSl40N9FUOromZ7+RqVIJ8u6egduiCqAT4eg=;
        b=grXJZjdGW3QR40xHcfiLnhtbvGn9ZLzLpNqzDA1ClDNraAb7DgzGJhTEkF+a4zOQq5
         cerJ/O3hEBH8Ol6vpY3szE+KWgF/ONoCW7hS42S3TR7zC0fUyGtFCvx5mpA6qXPoVcfP
         K0nobTz2HMsi8V7oX57NzjxsHnKcyboV4+UwwGgo90/hMcmHEw6gIpmdvOlHIbnuSDEn
         y8d+9G5Md9tqEMf1mRk+hQZmSRVisNtaqRYHbvwy3wn14F3e1HrjqbUwn51DUEEZaPjW
         Bn3p3o3ZP913HOoqOullsNMpb0fJfLWK0b1/1+34OXRrGnEUbXZxA7TnYKFpNb+otmUP
         E3NQ==
X-Gm-Message-State: AOJu0YxMq5tYCmCDNVQwGq7MijtuDApwErqqntB/7QMj4VxMaNM4/yeM
	oQcvx3sUzzFIofD+Xphn93v71XUy8AE=
X-Google-Smtp-Source: AGHT+IGNOkJ4Yo23ZCD2wsLT82zRCHJtkilmZxJDz2ufIZIZjtMCm/q5Fc4XdDdtoHasI/DywNapsA==
X-Received: by 2002:a05:6870:e38c:b0:1fb:75a:de6a with SMTP id x12-20020a056870e38c00b001fb075ade6amr8986487oad.88.1702451260706;
        Tue, 12 Dec 2023 23:07:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231208125633.336439-1-alperyasinak1@gmail.com>
References: <20231208125633.336439-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv4] xsetroot: upgrade 1.1.2 -> 1.1.3
Message-Id: <170245126008.133993.2214507292598979645.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107379


On Fri, 08 Dec 2023 15:56:33 +0300, alperak wrote:
> By default, xsetroot depends on libxmu and xbitmaps
> 
> xsetroot dependencies -> https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/configure.ac?ref_type=heads#L41
> 
> xbitmaps has no dependency on libxmu but it was added as a dependency in version 1.1.2. When upgrading xbitmaps to version 1.1.3, libxmu removed from the dependencies
> Since xsetroot depends on xbitmaps, and libxmu was removed from xbitmaps dependencies, encountered missing libxmu dependencies error.
> 
> [...]

Applied, thanks!

[1/1] xsetroot: upgrade 1.1.2 -> 1.1.3
      commit: 1a84a1ebbe197552077b4610c6fdcd459532113e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


