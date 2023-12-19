Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC94C4706F
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.6780.1702967278789000158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kx6GEMYK;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso1429800a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967278; x=1703572078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hga3PAKIReFMpbI67S7XU6u9UiTPNYqf+qEuzoaCLxw=;
        b=Kx6GEMYKTk9e6t6T7J7ucXAWEBTI7KbfWhC6qqsS7hoq4vLKfbX5SmgbC2BrD7+dn6
         xl2bZTux4Izy9DziGH0ix1iviF2I76O0hUwgGLPWTuP6yQu/BadRnSmGmhRz30X3Lld7
         fMdzjM2KemgYPQetSY8U3dZMELJd3ELqEAINIFtFeDJS3Xa1Fd5OA5DJAy13U2GY41k4
         SG2rYRZUodVDbYHzxW86QkRA/rXDcX+HAT24EirwQn34vwl9X9tSCUqjFgfhsO02BqNe
         qIK67KEosPIhhU7QojDZIBJ3KY7WwzfBRLTpcj/Oi46WGGkwwXM4j5tz2tZ/KWqIzqpm
         0RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967278; x=1703572078;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hga3PAKIReFMpbI67S7XU6u9UiTPNYqf+qEuzoaCLxw=;
        b=rUqQIfmIQ3m+Km0J4z4TZFToAz55pkrFfv8pCmbnPoDsXPnwYwXAqoyJgzbp0ICNnB
         vfhygnJaxrpJWz3XKhFIBakloNEmy3zIXzJOUjrWloK6Od8SydT7NY1NqcsKGWeURXlr
         bDWSnEhqk5h6EhNzXm+TXTad9U1/BgT5XCX1VaBXdM0q3ApS5asVHN4n2Mf/jdF0Pgnn
         FFHaZ/oDD6nPXvi4FnjXss+49gkPAJPihpvDge/CU6HIGft9uri9Y7zKqOiGJHPXgS1Q
         VgiASU1mlPU+pSl2HaHFEFrBzFZKhtUEUmkPPjD3aaddiHz5T2t9xH9z9Ze3ky9sLC2b
         A3lg==
X-Gm-Message-State: AOJu0YzmQYUivgGzx/EAEZ2M/89t9z1R3xGNQkcEpjyc2IPQHcE6pWPv
	/nZOOd120gq9eQp0RnHrVvxedRLW8Qc=
X-Google-Smtp-Source: AGHT+IE12gC8gnq6Jpwhtf3Yb+Y0+j+vs3vDCNdiqCHFjmqk8jWOJFHOSHKaB52JGZ0BaZKd3aH8qw==
X-Received: by 2002:a05:6a20:7d93:b0:18f:f637:99d1 with SMTP id v19-20020a056a207d9300b0018ff63799d1mr10619989pzj.57.1702967278246;
        Mon, 18 Dec 2023 22:27:58 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702619845-4275-1-git-send-email-wangmy@fujitsu.com>
References: <1702619845-4275-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] webkitgtk3: upgrade 2.42.2 -> 2.42.3
Message-Id: <170296727749.1627685.404335118008804263.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107621


On Fri, 15 Dec 2023 13:57:25 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
>  - Fix flickering while playing videos with DMA-BUF sink.
>  - Fix color picker being triggered in the inspector when typing "tan".
>  - Do not special case the "sans" font family name.
>  - Fix build failure with libxml2 version 2.12.0 due to an API change.
>  - Fix several crashes and rendering issues.
> 
> [...]

Applied, thanks!

[1/1] webkitgtk3: upgrade 2.42.2 -> 2.42.3
      commit: 1a474db2702c59702c414f4c8ed4487251f10df6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


