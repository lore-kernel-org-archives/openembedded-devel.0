Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C699EC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.31457.1704682036223977949
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NTwX6KWu;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d4a980fdedso12384695ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682035; x=1705286835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHYeMN7tHB9GfglWc38oaDcmrax8bZvGCi2yzCYVBm4=;
        b=NTwX6KWuxiWL0gKWVu5b6HPJ/f9YaQq7AQNKChCvv3Lyv+TxmlLSlC7FpbzD1W/4Sk
         AP3vVHgS9ue9gS4EB79X3OCcB/Cw9esywZfvBVq3yTdWm5Pp4UWD924nDwp8QMvP4GYd
         /7QtncI75MSdzsDnP40RTlW/VDVxIxQqGHK8VbqU3oMxcCda1+3//pyknSDB3aibAjxV
         nAWqxDo1u37xDp8QxZ0IMgc1LNp72GBRQGiuKHwjnjQdhM61EiRYXcVlSPrlgv4PFEuF
         ULLGYTPAa1o72FoDGzPwCSOMVNzmeCiaGvGipFW69/Men7VjARq7TdIk7Sf7zs05jYA0
         WtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682035; x=1705286835;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHYeMN7tHB9GfglWc38oaDcmrax8bZvGCi2yzCYVBm4=;
        b=LKQt9v0+rwSkAjyFC7B+jKz6lxcdX0jGBM8nOyXVa6eLTKq9+2eWRhlcKw9NowiPS+
         2vMxkWtdWbI/kpsnr7NS4er21HbOq6EuAbnvSCm/PoCHdMBP8g5zl2bBePbldi5pDdwQ
         ezWhonKkgsHHVAvwWBklWmzNoLkWZJwzyMs2XE+P0OBBhWNUUZ3FwUwzIrn6CFZRgKke
         BIgXpbhbGO22pT4rYdMDeO9QeLEW3yfFLV8Bt/dZn1OZo3b09mGqDKEbK6LED+h1Bbll
         Aw3kHBgbEOLRFcpNhB9JMXLyuw/WuXiEFH5Yc9m68ujVl6e5wP4vcmAQ6KyinSlPR68Z
         5oCw==
X-Gm-Message-State: AOJu0YzHaT1QGTXWFY5Io3V6HTPawkGEfj6FO4uX6+ppNjddbUnk+zEJ
	+f0MnGAQO7z2WIrMO4gILOwN98ZqrKo=
X-Google-Smtp-Source: AGHT+IF7y/y/kfIT/JTj2rBQEm/aVK6+ctCc4DEp2cCNcZugqznLEhC+mv1AXiw9l6iQnTQ2bOEAPQ==
X-Received: by 2002:a17:902:7ec9:b0:1d4:8fdf:644b with SMTP id p9-20020a1709027ec900b001d48fdf644bmr3061733plb.57.1704682035635;
        Sun, 07 Jan 2024 18:47:15 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20240104084458.308808-1-alperyasinak1@gmail.com>
References: <20240104084458.308808-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] onig: upgrade 6.9.8 -> 6.9.9
Message-Id: <170468203504.912276.13513968615831682131.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108120


On Thu, 04 Jan 2024 11:44:58 +0300, alperak wrote:
> Changelog:
> 
> * Update Unicode version 15.1.0
> * NEW API: ONIG_OPTION_MATCH_WHOLE_STRING
> * Fixed: (?I) option was not enabled for character classes (Issue #264).
> * Changed specification to check for incorrect POSIX bracket (Issue #253).
> * Changed [[:punct:]] in Unicode encodings to be compatible with POSIX definition. (Issue #268)
> * Fixed: ONIG_OPTION_FIND_LONGEST behavior
> 
> [...]

Applied, thanks!

[1/1] onig: upgrade 6.9.8 -> 6.9.9
      commit: a7bbf879b5a085199132d0b385161b8c5a29660e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


