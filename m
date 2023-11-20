Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A3FC5CFC2
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:55 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.43598.1700452246838375419
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nfw/r+FF;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d33298f8fdso2442129a34.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452246; x=1701057046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSxbBOJhocg68Y6ba7ZN63yFylKjEForbvDwCd2kpqA=;
        b=nfw/r+FFYwa0lG4gkuRmZom7N1L8u/kIRvHE5AMXgOb7aXR3pA9l7eXDtbBlYELHIf
         Cu7iHkizP0LOFPagEMHNkOuSZIRf3VgZoTzqnlEaUng0JAx2qqNig6errOFYLzbZuNM3
         VnLMllZKmpVr9bgjgQsGPJVqVvAGhwqGU6WPQl49SePExw8jL627j+3hFUVR+0OBlxep
         IpXc1R9HvSKo4GNbSBMJfuZwCwseQbdwnuwvuwz/aSHsu/ED7ohZeh8ykxvOU1R1ZPA9
         BgzuzQigZteb7+d3KXKB6c8UFdNbLYu0tAoN+D+7rOTVjbtRn3Z7pmX3qNeM8ESmZiQp
         TKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452246; x=1701057046;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSxbBOJhocg68Y6ba7ZN63yFylKjEForbvDwCd2kpqA=;
        b=Mpic7G/Pwr8sRZQNUPIWk8aAq+msalblFdCWQAbitx4N78rX5tcZ5RoZ9rBvtGd4Ot
         QyA24NHvTJ0+yr0Pc2++yMsLsbEdvF3tGTLDtWGmTqp6yQazLyz5ltpEXzJnxV47A0AR
         C/6tM2q6/Ib1sY5Jw7q6f5eKEGnb+qcQ9eVZjHxIorCvjboh9VIovv5f/6uslfUp3Y13
         eewVQH5HmY8pZFowNGGn+V8KoAHBDRPEhBvVKxI7O349CRmq066oqDdKLgaW8YHY53t0
         xXDIl+FFBFcz/s/++QeVKGb2MPO6k2hxWm77X29v/NkWmcKya931wLDdkWGBZQxAMNwD
         DKBg==
X-Gm-Message-State: AOJu0YyphkzWrTYrgjlFtH0Zm3BSri49LtlBU2QFmcw5rXEg1KB3eyBL
	8RUrg0wWpEzHIyrDxrFoQDI=
X-Google-Smtp-Source: AGHT+IGW/3fcwyA3lZ7qHcKJI5luxUtmOmLBAH0DaNz9MARFmnWhuFzR8ltSprDy+2d3+8DYcBYKcg==
X-Received: by 2002:a05:6871:22c7:b0:1f9:4afd:e3c9 with SMTP id se7-20020a05687122c700b001f94afde3c9mr442493oab.1.1700452245968;
        Sun, 19 Nov 2023 19:50:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700121683-21697-1-git-send-email-wangmy@fujitsu.com>
References: <1700121683-21697-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-hexbytes: upgrade 0.3.1 ->
 1.0.0
Message-Id: <170045224482.1416826.4971776248096742698.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106903


On Thu, 16 Nov 2023 16:01:23 +0800, wangmy@fujitsu.com wrote:
> License-Update: Copyright year updated to 2023.
> 
> Changelog:
> =============
> -Move HexBytes prepend of 0x from hex method to __repr__ to not break hex of
>  parent bytes class
> -Drop python 3.7 support
> -Added missing build dependency.
> -Add build.os config for readthedocs
> -Change to using pre-commit to manage linting tools
> -Merge project template updates and bump mypy to v1.5.1
> -Merge template - .gitignore updates and other fixes
> -Merge template updates, including additional linting, move most lint config to
>  pyproject.toml
> 
> [...]

Applied, thanks!

[1/1] python3-hexbytes: upgrade 0.3.1 -> 1.0.0
      commit: 1ae54de6945432d8fb1a460c0b067f0b2869601d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


