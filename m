Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3107FC5AE5B
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:51:31 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.19071.1700171482187589709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UE0/nxmc;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2809b4d648bso1078316a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171481; x=1700776281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NU2LTA2pV0+ArDUZMsvc9XfBaWNThOZ9YIVt8MtERMk=;
        b=UE0/nxmcaihihnk1Jv1CZlKWVQEM5Ls7z4Y++T7PCWQYAJJfcsvIh/DQMJP/uKQao+
         1kS3ZNdea7R+kKhDkHC1lG1RuJ5o/Kphir7D4U3FW/exYCgpiaJQpJ3bE5DRUm8SBOca
         zquSsMpTVzg9MolvU/ghhZ6ek+MPiZZx6EAuvh26Nbx2EtibQ29xj6Z1xrD83bmKnyAs
         /r7fzolIyGQ0IKj4loB7KZUSGNJxpHrZy0RSLq7epcvAa4K3qWHCtFjaALN3qIFVvsrn
         sdxGSFIQLqHDUEuf5y9gtybsGRV7hyjnQLMGVVc0QNCu7SpGFj8fEi9mFlM2hXjno0b8
         HVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171481; x=1700776281;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU2LTA2pV0+ArDUZMsvc9XfBaWNThOZ9YIVt8MtERMk=;
        b=YAEjwWZelZNBhmONgL+jiZzWNlcNkGaMAYLYBR5YQ3eLg6K6b1UFuXXyKTVknh0hCz
         zvHzOF9QV8AYRZHSgMj/qxy8q2pKavAxZuPVfjXXnN64+c3PyqkkjY5gvGT3eOnUqOdf
         qmUrdVecJohHj7mfrEbaBM/18BS99/k2CBgYDiZM2KXvpnCy4Ri5OnhxUWjhQhO1YzAb
         oChDYqxei/xgIFkMDcnKXTbV6rgrndpe5cb55pBPfvE3LlLcApI261cJGuUyBsG7CinD
         jKuRMaMYZso1MIGpiIxlXjm8Pyri5xGdZvG3rsSRkUG/+3CzXDGXs9dKhMWu7UPTXZlW
         JUAg==
X-Gm-Message-State: AOJu0YwKmaHeZc0g7weFbNkuJFHTxnEUe1pCxIO3LIG2IQlvz6asK004
	9AGYBVUZACD3H1CINZ2rcn4jO2NXvRfJ8Q==
X-Google-Smtp-Source: AGHT+IGWPaV1276Y1aNYA16J7hGgEOQ3JExwSAspsXpsKbM75dizslachwQldG9vgzrxZTXoCd/MQw==
X-Received: by 2002:a17:90b:17c9:b0:27f:f260:ceaf with SMTP id me9-20020a17090b17c900b0027ff260ceafmr14354082pjb.10.1700171481510;
        Thu, 16 Nov 2023 13:51:21 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090ab89100b00280469602bcsm1997692pjr.2.2023.11.16.13.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:51:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Armin Kuster <akuster808@gmail.com>
In-Reply-To: <20231115132754.16679-1-akuster808@gmail.com>
References: <20231115132754.16679-1-akuster808@gmail.com>
Subject: Re: [meta-networking][PATCH] pkggrp: drop netkit
Message-Id: <170017148055.249256.1798321462827872103.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:51:20 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106834


On Wed, 15 Nov 2023 08:27:54 -0500, Armin Kuster wrote:
> 


Applied, thanks!

[1/1] pkggrp: drop netkit
      commit: 96831e8b3fd2b8e4deda3064e8ce94fe2fcef808

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


