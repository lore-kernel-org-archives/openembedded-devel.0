Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813DCC4707B
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.98043.1703665280141157436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MasDPn1a;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5947cf2a4f6so1577122eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665279; x=1704270079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTvrCqnZ+DGXkz1GJkJlyZxLU8i65DhCqqazVKsky+c=;
        b=MasDPn1aWVzikTZ3xuDHQQOtd3tCQBr2EqPMRe3C/Sjz8Vc0IJp2MkRGS6GswjFgxN
         bQEhfnVi+grIObbFxLtmwbJCB439qXn/TEDNXU1XbThqkoW1xcoMQajUmZID3VVisWqT
         VskHZGYUP/wirLs7VtqRCdnhLRYlOLSyQchQwhgCKfs5N865PwaWh+rJioy4DMjbcZc3
         84UXUH60qgyGqyWBpGzn9vjiI8/xx/cJIeFw5NqsGIQw94R9s3YMeFbhhwyFvKWqDVVd
         unY+UocOgk/YQoLzs5dos2SiuPqqV6pLWkneP7VpsSorYxDCnby8jqvcTbNoNxqIi1DF
         MjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665279; x=1704270079;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTvrCqnZ+DGXkz1GJkJlyZxLU8i65DhCqqazVKsky+c=;
        b=w3WeyiSv6xDQz8hZwVk3OiVtfp5b33uIU6t079I0FMpPcrXPlg/dD5JSnf+xy2QBzy
         F8R61gIFOuZyyR4AhRz76RXLdYUMd5f9RCRjrlImz0oKu8uVW3GDct4Z/o4/xn2gtPwE
         QshsRSuv9UJU9KOsP2K1njAc9NL8XEPJDnVfRzLJU6588bq+r5iOYSteVt52SVhxBxW9
         yHpWr0LvEtbcrAzxU68Ha0ooSkH2S99cPSxeOLpdARopfdd6wB8tnIf468QKheNtxbUs
         v/AVxOOAlTWeMryYAEE/aJpJVTx868YfkTW4FCFu9tc3Bejv2d0VW+YCGljY/jxs12/r
         0SwA==
X-Gm-Message-State: AOJu0YwlJRPxDop59zrTxD/2QygxXYwAINetjXspLIZVR5guP2TzEbKQ
	7Ts/Rf2k6Rv6PWQAv2o7lyI=
X-Google-Smtp-Source: AGHT+IE4cs9w8HTAHlhj8BaUNIoS5dYQ/eaOhV+UBnNyEl9cr7FRpy4Q5VxnQ02zI2lO+zD07pHHoQ==
X-Received: by 2002:a05:6359:4588:b0:174:f21e:786a with SMTP id no8-20020a056359458800b00174f21e786amr5867073rwb.43.1703665279286;
        Wed, 27 Dec 2023 00:21:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220220733.3787024-1-derek@asterius.io>
References: <20231220220733.3787024-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-ninja: update to version 1.11.1.1
Message-Id: <170366527847.1947762.99652674417536421.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107823


On Wed, 20 Dec 2023 22:07:33 +0000, Derek Straka wrote:
> Changelog
>   fix(wheels): link libstdc++ statically on manylinux1 by @mayeut in #159
>   chore(wheels): link libstdc++/libgcc statically on musllinux by @mayeut in #160
>   chore: add Windows ARM support by @henryiii in #169
>   chore: continue testing with python 2.7 by @mayeut in #199
>   chore: move to setuptools_scm by @henryiii in #170
>   chore: switch to ruff by @henryiii in #174
>   chore: use trusted publisher deployment by @jcfr in #191
>   chore: use wheel tags cli by @mayeut in #84
>   ci: allow setting a version by @henryiii in #171
>   ci: cancel on repeated pushes by @henryiii in #177
> 
> [...]

Applied, thanks!

[1/1] python3-ninja: update to version 1.11.1.1
      commit: d8637f07a28128f42c69e397b1ddd4ca0e053060

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


