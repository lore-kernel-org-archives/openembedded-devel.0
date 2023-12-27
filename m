Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4C5C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.98064.1703665307180596296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6UDfFtg;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d9bd63ec7fso427443b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665306; x=1704270106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4KeBtJyZAAhksFXppu/PixVNapUOD6QKvTPtgr2Fsw=;
        b=L6UDfFtgUEL2g0z9URgOhfmkvYVLqaSufnKbdIdUGQq0VMB1UWry3W2A0l73eZr+6i
         o/joxviPGBpOrfqfgOdknzzDifHdRHZOPLABbvEzPQHw0spS3TUJDQAcnyVu3bhJft31
         zwJ7agyFvkweItoQ0vkh5O5M0focQKC8dxOqzPVKWv6C8sAYX3TPu6CDNHy3GYKGkVNX
         G9qAnqkqibk71nitCriX2RFknudKAllB6AOxZQKkS/bLoHblbgTQmkVKWbfaA2Uh8q6S
         K8M5lf9QVRZiTUGpBDiIgzuaIxDAQs10qa0CvUwHFrkIXASms02YlN0iBSi2EZtcc930
         NAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665306; x=1704270106;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4KeBtJyZAAhksFXppu/PixVNapUOD6QKvTPtgr2Fsw=;
        b=lnTHeJDleIFeRULeOGNwO405x2Y4Gyggpi2E/UwpfRWEPu0l0/cyOm4R98E2QmhgRq
         JrQNA9S3mCJF0EauvlDcTMPdjaWI0mY7zs5MUVqHmqQLkvW1YEFKEM//Wn7lxyIT4eha
         b/cEhQUgxOVHhvHpCMa54cHfTbODubaCWhfFJT6GJTFl9zvlpQlH0Q8CLrqq5zWL2Ub9
         R0Ybz+6lgyr1tLRLnSiqyAreWzKm+SUoz0TmyAYIOcv/rBoxMLX2hY3uThFGcvNClMmQ
         1bsylujDEfmXg1spWZbMu2S6JTb26nIJIaBmfk7DxgwWnC5ekAPGbu5hTjQZlUW6DWLz
         jn1Q==
X-Gm-Message-State: AOJu0YzTfWWnomzdgFCOml4thlnVO7DaLIpUfZsz6imUfELuyGO9Vk9N
	IVCEH99FxEoKa10ttcdGl4w=
X-Google-Smtp-Source: AGHT+IFJibomzX1cgud8n++7dx+ubzXaJ8U5ynVWldRq0ryf/vUdUPCA33eGRQXyrXxGGAOM7CyJHg==
X-Received: by 2002:a05:6a20:7c28:b0:194:da2d:21ea with SMTP id p40-20020a056a207c2800b00194da2d21eamr3022329pzi.32.1703665306499;
        Wed, 27 Dec 2023 00:21:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221182351.3921070-1-derek@asterius.io>
References: <20231221182351.3921070-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-uswid: update to version 0.4.7
Message-Id: <170366530588.1947762.12093216364338442747.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107853


On Thu, 21 Dec 2023 18:23:51 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-uswid: update to version 0.4.7
      commit: db2f5ee50b5ebebf0f32c40d7a2c5dc60dd8efea

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


