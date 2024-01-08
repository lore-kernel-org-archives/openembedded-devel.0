Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1A1C47DAF
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.31442.1704682022171685531
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e48yK9N2;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d3e6c86868so11773315ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682021; x=1705286821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+iuYPbVtLEcsj2s/MN9tAQQDAm2ntr8UXFdQXdOsAM=;
        b=e48yK9N20H/y+kxWhWOAdooz0y2Wui50h2mGYypCLyYt0nY2UIKCl7jiGlhTS52Yhm
         HMffu6/U/aW8LT38KtEn0ki+z8/rlTFqULEzKqGlLoHfOSIndGbCXoGqU+X5Cz7soUw9
         PnOpDEvB9ALdbCQ3pEXDAD4g7pWVyeQdjXbpcJgySRuu3paC+2qMfttqOTLBhuVdJ3I7
         pNhJELJn44Vce6RGio4dh9b3X1L+ZU0T17FshxXpHsQu3t3LafTSZvK5udY/olQhDd6t
         mRZmDiWLeDm4r+Dpf8KbH/on7JFX5LC3zqjmeN45HtB4DP/vTCPL/bFhfYMRVbMVc4TY
         vzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682021; x=1705286821;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+iuYPbVtLEcsj2s/MN9tAQQDAm2ntr8UXFdQXdOsAM=;
        b=HNNJYOGzx9ynZ4eFYGqHlXjvXnf0s5dcYM0ysiACpDLilmGG2IJSBHX2pagCqGpiEl
         F+RWMXUqJgv9m1WqOFl24oMtTNip7SeBC+ijoWIpVeKdf8GePsexWEqMD0R7qLgSYyq4
         MpOkXeX2QUYod2usaVe4/qtGDCy9KMQYF6asdWP4Pswi6Km1HgjjDfLxr4MXbUIiIQyE
         IEcHcmsehLGEcqWq9s6JyJF1jc7nxHWxBN430lb0QU26kRLD4iTdqLI2THe9YZoWPXU0
         v0eQgVpraI9JmC0n6chK+EgoILnFZjoeuzAOmg6Ymsxep8wYGXsOskvAL2lPjrWBRSH0
         RueA==
X-Gm-Message-State: AOJu0Yxwo7ZJM+lPEisY9ItkHWvjXVExpHd3r1DIMagOeQRT1oO2bEvc
	+mMVYV6qWcDJOS4EJUTojGoQ45E8eZw=
X-Google-Smtp-Source: AGHT+IHA9BTJixi2yPWnCSjbGMJztNGsR/pRsDmmkWSC8/AHTfNvjUQ9+boh2GHKttQaKmey7TQ8UQ==
X-Received: by 2002:a17:903:644:b0:1d4:87c8:40f9 with SMTP id kh4-20020a170903064400b001d487c840f9mr3297754plb.84.1704682021617;
        Sun, 07 Jan 2024 18:47:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <20240102110400.1707120-1-leon.anavi@konsulko.com>
References: <20240102110400.1707120-1-leon.anavi@konsulko.com>
Subject: Re: [meta-oe][PATCHv2] ssd1306_git.bb: Add ssd1306_linux
Message-Id: <170468202099.912276.15986773580801476780.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108106


On Tue, 02 Jan 2024 13:04:00 +0200, Leon Anavi wrote:
> Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
> the i2c library libi2c from i2c-tools. Example usage for a
> compatible display with resolution 128x64 pixels:
> 
> ssd1306_bin -n 1 -I 128x64
> ssd1306_bin -n 1 -c
> ssd1306_bin -n 1 -r 0
> ssd1306_bin -n 1 -x 1 -y 1
> ssd1306_bin -n 1 -l "Hello World"
> 
> [...]

Applied, thanks!

[1/1] ssd1306_git.bb: Add ssd1306_linux
      commit: 13a1b1b1a56b41d23933ee5113a338ad5e5156fc

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


