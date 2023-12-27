Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943EFC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.97654.1703665288697640594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kB6aEEtH;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28be52a85b9so2418118a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665288; x=1704270088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJbn2/JtLnv6b8XutEBqxytTcXTaaeDiTgBl6d+8C5M=;
        b=kB6aEEtHNjsZ9c4MotxejDgFQFofy7bXVNgTXtnkTvn/KaaeJ/aJldFzFRixjm/ZmH
         0Xl2xvWuOEVs3A+VCzz7bl2/YP7bZUa7eIRFGGbqyvaml6LzIwbgeSOE3b9UwnyKijzm
         80w1EEFWB8IphYrJhI6sudnnowBerA1iMkuhTV+fdjtMVT8uRTdRKANDzQENC6UkMUUA
         WOzZZiiso0Ph56MxnIBdElNgRH31yHfZ8f7hZUPWh7U0vT7H1/auSKvtkZR74eB/rkPU
         kPFu6dpDTV+2RYBFZxwRsGjGuqbYVZVEUri+3Te59AQBT8hmeOpvzCqTIP0Kr1xNd47H
         zLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665288; x=1704270088;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJbn2/JtLnv6b8XutEBqxytTcXTaaeDiTgBl6d+8C5M=;
        b=kVG0uIC4x5uQA2TBIHaFxBhktu8gLanL+0J3+3OQ8dlMPJJQ2RdZXdeUzVOr1J2nrc
         Cy5w2fFEC4RsuCyyHWUKxIRn/Kfoh5WY1OgFa/+/Jk3y+AP7tkigROusoIf7L0/XlDww
         Qup9nZONnbATrs0f7l0DXdg3gBzj2FzgM4Ck5JQhA6LZBZ/1hLIYnfQCm4L5+gLGYMP1
         uJGo9QLdVV7xtgks6SZVeJe+fKL3bYx9p1uE8axEkz2n4A1WF8lfnnAZnq1MM/rzY9Gg
         zOqOHQTK99gPm2Hz2dLSnijD9tsxakkQCsqpwiTAozt4AgDW1xMz2dXTHQORB6V4Dvid
         GQOQ==
X-Gm-Message-State: AOJu0YwGZuPgVzEv+aylhr9cOHHuD0bB7gM4/3bh2DmPMI6XfTW7CQxg
	60Q/XVDbiAoOfNiAeb2AEPk=
X-Google-Smtp-Source: AGHT+IEe+aUMjHOqCuJh2UljbgX2mkizHlecMvFIuVx4WyXSnc6rIyvTR8IbbjDAnf/ZXWfGwuwMPw==
X-Received: by 2002:a17:90a:e41:b0:28b:e1a1:ae2d with SMTP id p1-20020a17090a0e4100b0028be1a1ae2dmr2294879pja.68.1703665288056;
        Wed, 27 Dec 2023 00:21:28 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220230828.3834586-1-derek@asterius.io>
References: <20231220230828.3834586-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-sentry-sdk: update to version
 1.39.1
Message-Id: <170366528739.1947762.3810264775412782546.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107833


On Wed, 20 Dec 2023 23:08:28 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-sentry-sdk: update to version 1.39.1
      commit: c27646b41f2a6d760d61b153217d32362fa31c6a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


