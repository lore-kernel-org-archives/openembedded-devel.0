Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A1DC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.31068.1702451250008068674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqODN3Wu;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b9fcb3223dso3477598b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451249; x=1703056049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+oNmW2KLp51ON+SifDNheGm6BK9c6WNin7DSTRYkS0=;
        b=cqODN3WuUVxTkbR02mGwUiXiuVQYWZnjzbJUkfKXxAD/Hkv6K5VNDJdEQTbvz73SK+
         iyfTwXn8Dn5tP1149Ev86TolKKyhSG7paFydj5YTzyb1b/Yk+f+zp3NFE0RjeAzZxYT4
         ExydMoQz5EwwVLXsiwR6JiPoYUEQ4MzsoPKIblfZGMwBDt7ySPZivBp+D03MVzTLfDSf
         pMy4nJpqKbOR7yN+YM1cKGr8kbrcPuJiv4Nbx1ic1wa9kp8ZPuPWxc2+gDsTauPkxu4Y
         p9V/z5hKAXGMjsP/KJaduZxrvFfJViBhoB4abhQL8DFGAxWMzHEHvwwrPPnkTwmFk/je
         V5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451249; x=1703056049;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+oNmW2KLp51ON+SifDNheGm6BK9c6WNin7DSTRYkS0=;
        b=NtcJjfmg6d9ktriROjRrhksKPc4iAsOxkgeUQ+8bP/p6BGsM9A/BE69H+gIuSmDjif
         bmsXxvOVlNQhqRmQfUwZShbyTsUNyEYf8pjrcPUeqsPIIy/4BfviQaT+GcD3s3wdHSgZ
         VVPbwCzzZnNZq0z8+AGnB08Jp5T+24l/tdsC66cKRoNVS3+C5//u+IJB0yhlihq4YuHv
         cUv51UrNswSAVgNwPsM29Yf4VoAq8M4HuzQcDYOspgc8UGxB/tENFxjP55ifpEwZVyjL
         vvZd1ICNX41h5OQ534QYwG8v/vbWQ18BiyuUvD7bVvvTrZQRC1FrpxvhkZY6N6SLYsNP
         lEYQ==
X-Gm-Message-State: AOJu0Yz7YekmyYriw0bZM2dPUojsrFF1GEtKHKi1IeWdM0vscrxDLs3Y
	65V187JJ9ipEDBeNrUcaSbcj6RpT5XM=
X-Google-Smtp-Source: AGHT+IFGjnx9chF36RoiPqeMJXUGc+HTfY4p2Zo32xlfAbass9d00gJpqfYKg5OcXoeqiAcsMKKdAg==
X-Received: by 2002:a05:6808:1442:b0:3b8:b063:adf6 with SMTP id x2-20020a056808144200b003b8b063adf6mr9761961oiv.83.1702451249036;
        Tue, 12 Dec 2023 23:07:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231207074848.18738-1-alperyasinak1@gmail.com>
References: <20231207074848.18738-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xorg-docs: add recipe
Message-Id: <170245124806.133993.8745797946753683936.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:28 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107367


On Thu, 07 Dec 2023 10:48:48 +0300, alperak wrote:
> Provides miscellaneous documentation for the X Window System that doesn't better fit into other packages.
> The preferred documentation format for these documents is DocBook XML.
> 
> 

Applied, thanks!

[1/1] xorg-docs: add recipe
      commit: 90e272d06cf92b2e987d8d8f8c12417e2dc911ce

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


