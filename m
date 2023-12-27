Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABC7C4725D
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.98060.1703665300746170869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VbxByPPJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28be52a85b9so2418178a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665300; x=1704270100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGQeLNb6CHz6b80m0ihcvuI72jLYbBE2KL7pAB5dR5o=;
        b=VbxByPPJ+iI2JKBnLM1SvqU1/ACtW27lOyrTQT0/J1xhcQxCxt0yIY12wX4ryh6NPj
         BYL1VqC3Zs5eytYQoZ5C7sw+Sn/3K+fdD9jbvCDJVb5Om3GCPx6wBW683xOKeJ+m4ely
         xO6KGQLCaVlZFoYL+9Wzr5WFS3y8Nq08WGvzls8CLPhQ12Po4m6pJRJqnItWr1ltMc/9
         VtuHI75xVOkUzbXQbXkr5Si6b50032L0gvpmV5E6mWRZBi4HjCwN/dZXhEV8AcwmMjeg
         GpP99vadzW8uqQE7N4X6Mjzys0Qd1m/aqXeeXrSAGN9PVRIDwf4QX5TZyUBZE4vmJzsF
         qgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665300; x=1704270100;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGQeLNb6CHz6b80m0ihcvuI72jLYbBE2KL7pAB5dR5o=;
        b=Kxw7Us0g4Yn3LFkKPmj8iFoyKM1UKWHTNqLH2u6r7jAeOtucw7qk5MH8FvhfHBSXZe
         xLEpd/nOrbYtm6b/RHhKvQiejeckTUi/zzhjEDfifqyv7T5+6ycLtX/iywQ/biTwrY5L
         uOuL7im5JBpJXh8AHcBTbth4HT4Che4v7qQpO/IKuE/7yWCEKbQB6Iuoqv8CUR6qQrC9
         XZW2d61YJDWUb482DxVdjno4mISQr5ju4Wb6a7K3ByNmZxrzN3jPkSP4V0Riv4iBBCYe
         x6pdNUyAn7h2Z4V0J+Wq96ZOnFe0sbk8gdpuAAFEd5izlWwCGuZEVkkGMUmBVFReWA1J
         ZDNg==
X-Gm-Message-State: AOJu0Yw+B4jlf5QgSG4UCKEsypp+RQNiJxpT0xiNjA3c1VB39M0qB5LG
	pDipsCxmgxwLEvoXXykWHUc/3jLco2Y=
X-Google-Smtp-Source: AGHT+IHVFMQfqKtSOMUhPw5cqmtl2jvd3FkS5V/z7gwZHqHWvrEJFml7musQPWxrRXkwK7m7LAj0BQ==
X-Received: by 2002:a17:90a:540f:b0:28c:2b73:aea5 with SMTP id z15-20020a17090a540f00b0028c2b73aea5mr1278698pjh.34.1703665300139;
        Wed, 27 Dec 2023 00:21:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221165652.3899771-1-derek@asterius.io>
References: <20231221165652.3899771-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-cmake: update to version 3.28.1
Message-Id: <170366529953.1947762.16663886715334182182.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107846


On Thu, 21 Dec 2023 16:56:52 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-cmake: update to version 3.28.1
      commit: 5a55e4e480f173a8e9879e440a7841124c34e474

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


