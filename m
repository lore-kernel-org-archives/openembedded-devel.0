Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CD5C47079
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.98053.1703665293474790506
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzHqi0LJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6dbfdb41a63so739858a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665292; x=1704270092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58Sll4ro+PyTFGqNbzCz+OAinHcAO9Pw1AP5Fqk5LXA=;
        b=GzHqi0LJjXLS/5Gb8IK2ykY5mbkx7xmM9apF1vbjed66Ut3cvyw/v6aA/pYApog5s3
         R/QMN1KsGQIrMlDyhHsN5rov4UZJ4cJoFo976GF0RbUCH6mkQ57VtTAYyq9uDz57xMip
         82VYkaKNKCvymedwcmYkdr/kWYS5F/okxWIGbQJs/n0Z3FUoeHM+iX3nUAdnoi0HrFCr
         DsmccxUv4cWV7yAElc+c3yC5PV1dr5Mkom3tgVNOq9aXFlGV7F1+HpCftZ51/kSJh3EQ
         LjCmND6uw0gpZDPPVFMpieJU9+zxIfQ854dL0ol3PCNx2QO96E7bWuCIF0MMD1LZpTnx
         l3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665292; x=1704270092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58Sll4ro+PyTFGqNbzCz+OAinHcAO9Pw1AP5Fqk5LXA=;
        b=uF9AunSnSyVP5gURVk/uUnJkFD3uxFV3Pf4ejV0/1NcnXxGY5bFHK6zNKPamiO++k2
         Tgo2YIl0Bsqr4ZKPCiJHi1fTwXQ4xJdKGHVmM2EIWc1SuKWEzZ4vHkysa+9w2WrVoLNk
         PA9iEYnh/lw9kA0iDHTLV5fQv1npm8kgHEUvqNfPBcpBxGBe4sicXC1UWD39N6q2E1CC
         elWOJlnHCbgONL4a3et1kg1OwKI3HANdh9xiCN9HjZJj0EB0/qy2pdDm1e2SoUcEh+V1
         dVr0atb4h0+q7wApq+hkQrtvOQlIX8SpEosyNhRl9i5fDmlVKLwTcarxR2WEksPFf/rs
         6NPg==
X-Gm-Message-State: AOJu0Yziq6hm7CbSqgAzKj5g3DflZHnPlcsK2H7eGkFKOpe4jSpv7PvW
	xo+ps1Fv1dOPsh+/UNhHmQmE8X3s1X4=
X-Google-Smtp-Source: AGHT+IFufq3GP3YOYFsg/HRGNeYP1bonkMTsK1wVNViLCNZt4EH5NjT0fRqvczxxfCG6EbdAwjteZQ==
X-Received: by 2002:a05:6358:882b:b0:170:17eb:14b8 with SMTP id hv43-20020a056358882b00b0017017eb14b8mr5066548rwb.40.1703665292517;
        Wed, 27 Dec 2023 00:21:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, ross.burton@arm.com
In-Reply-To: <20231221104121.1083134-1-ross.burton@arm.com>
References: <20231221104121.1083134-1-ross.burton@arm.com>
Subject: Re: [PATCH v2] lemon: upgrade to 3.44.2
Message-Id: <170366529170.1947762.16001967119837558204.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:31 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107838


On Thu, 21 Dec 2023 10:41:21 +0000, ross.burton@arm.com wrote:
> Lemon is packaged as part of sqlite, and sqlite 3.7.3 was released back
> in 2010[1].
> 
> As the small source tarballs no longer include the tools, fetch the
> sqlite github mirror instead.
> 
> Don't bother installing a pretty minimal manpage, as very few projects
> use lemon (sqlite itself, and libpbnjson).
> 
> [...]

Applied, thanks!

[1/1] lemon: upgrade to 3.44.2
      commit: c3ac5cf180f960dbbf6e3a3e76d6d44094873c72

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


