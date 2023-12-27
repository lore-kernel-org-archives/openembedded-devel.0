Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA47EC4706F
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.98056.1703665296005089896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXvb1RKB;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-593f7a1afd7so3030241eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665295; x=1704270095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+u30XYaeOSfcPYwmCG2WsfG/ngFwynV/O6FKf92dqk=;
        b=CXvb1RKBDzBgTEfqPn1c4PDX/1zHYQFYlneev3dFZ1gHMK0g0El7iEN4UkOCGJihLD
         FV1WiNbgM0Ol8kh51d3yu5UuRs2pNxECpXlQZqzabXjNSGm8hcNtdLaSTSwyafX/HIfV
         MNWHoldtI066CvEflLCVj+eKxeC9OC9Ex8Zyk+uqjU7JO9GGE1GPBguy1wyiKlIfRhXa
         AqHcmQEN8MN31dB9hKB1ctolp1KQcbVaqnia/QWIKIIsAlSj6F4BVrIQFmi8HjvZG7nF
         1ChbpNA1wnUVgrJupQMLErJ2DUbXXnt/g0PPRFAmXVQCM4xY2nifhuD5zdeyrVEREkbx
         D12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665295; x=1704270095;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+u30XYaeOSfcPYwmCG2WsfG/ngFwynV/O6FKf92dqk=;
        b=s69IJkDB5rh0Zj/LizjkTet5D46y/ToSOrliOwj4PIVIGc4iUsviEwkGjlOMncr3cw
         ZQyTSIvROEITI028MIeNAibzjyvVey8XwEAr5rqn2Pfym5zV+WvZQiNX23rcm5Uxln1k
         BdRb3xUrLTXjMIa4IKeb3IbfCC7LrEUDHW4KDgcWBzeCyA8Qe/5u2aY261pTGXvMe2AB
         AyzUezTa6gRaEmaPrNV77+qxxPE0f1Uds0l7TCS1/ZAgZNTET0q9cpRJvWrVeYr6U5JS
         Viw/PeBKMD7GAYt6GeRk6totpVaZ6TpfDDELZzS6LVw3leB7sBKKBVo4PiClYxeoF/zk
         hXHQ==
X-Gm-Message-State: AOJu0YwYy5rzTlZ7aQ4hq0EvhBDv8Knnp3RStIHdAKBJWOpkXVV4do3a
	jA30NZ40hwVmLblBL231NjLArTUdSD0=
X-Google-Smtp-Source: AGHT+IFZ9H9uXiN+aisKmN25PLkhjxmn9HAbPKhc+l2IdQjpSrkueZZ0rWJqhAGGKpqpBO2jglzdvA==
X-Received: by 2002:a05:6358:419:b0:173:b44:1889 with SMTP id 25-20020a056358041900b001730b441889mr5881020rwd.16.1703665295026;
        Wed, 27 Dec 2023 00:21:35 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, thomas.perrot@bootlin.com
In-Reply-To: <20231221070001.19640-1-thomas.perrot@bootlin.com>
References: <20231221070001.19640-1-thomas.perrot@bootlin.com>
Subject: Re: [meta-networking][PATCH v3] networkmanager: fix some missing
 pkgconfig
Message-Id: <170366529432.1947762.7583479476279852549.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107841


On Thu, 21 Dec 2023 08:00:01 +0100, thomas.perrot@bootlin.com wrote:
> - to build and package nmtui
> - to automatically append networkmanager-adsl and
>   networkmanager-wwan in recommended packages.
> - to fix an invalid-packageconfig QA issue that is raised when
>   adsl and wwan are added in pkgconfig.
> 
> 
> [...]

Applied, thanks!

[1/1] networkmanager: fix some missing pkgconfig
      commit: c331f59e42e9c0bda9d47d0365e6c276746fc81d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


