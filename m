Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3760AC47258
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:29 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.198975.1703983101679884001
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ozme8Omw;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b7fbe3db16so396845739f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983100; x=1704587900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVwL77/edSW+O+Sb2IhQqeV7x3iPkuri7jFz9FR7ng4=;
        b=Ozme8Omw/XxY/mlxdAk98fub1M+OvWQzZLhcnrHWGGvK8vYMq1fbqjMUyM8XQznDXj
         jLt+QxN3w3KIAn4mhyz11Arm81YFDQZEQTPSXcnUpFAioAj6nKwtpwiepRCPJ6PvEMNY
         DZKSoZDihJFX41sZoOsbK9Z+4KvPnoQoDwCzFncZ+Sufi6skNN6UDGb8bo2Fk0I4WVf4
         DFoIveAqz9iA21hpXImoHaG7o3IWLf5nqHw0tVAmEd5uUJs8xkvi1/7roSv7jpwk7700
         +nGN1JXXoLm7SPKDilcIva+x7FUwpBxG/54z9fHAmXVqHqAkdk8PdvKi1o69bP73Vwxn
         rtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983100; x=1704587900;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVwL77/edSW+O+Sb2IhQqeV7x3iPkuri7jFz9FR7ng4=;
        b=WiLcTNS+SkRBjYu5Mej5GX3vMA4hD6f+Eqyv880qf7Zilf4xaUsB4bXqpKl2wCuhyY
         nvoIZtIfjDYZRRjZeSTv1TIlSRfjrl5CJ5q00nYoW97+fKN1hSgKKgD8VgugbkbpcT33
         PARk7sFTpLm8eoxq6vQrdrDHiGYF5ywmYmOt4wAgh+gAuFKmCM7nQNfaXKk5qQHJKpPq
         w/sHLh0J59wYNdp0xKxHa7HIZBxpES9z/5CzihE6XxV1u0w1B1gEu8NK08kCIucCJgkT
         L3DSrDvyx1zhwUse6Pxy513cNInJwS5HLDW8cSAOAI4rZmihng4aLfpTjVbJZUVlYVIt
         kARQ==
X-Gm-Message-State: AOJu0YyRdL+fyGyCQ801VBVxHSMPPxOEzGDUdEUDkMXunUPdMAnc3x4g
	UDmWdZQ8MbhKnCGAzWAilfGI6o2GxVk=
X-Google-Smtp-Source: AGHT+IER8BnfQW7LHf1ubXLkkSY0lrECPTVb5auBHEbO95l4+syfRKMefc21tMycb79jR37dGNmX5A==
X-Received: by 2002:a05:6602:1492:b0:7b7:fcc0:8ff5 with SMTP id a18-20020a056602149200b007b7fcc08ff5mr23218170iow.32.1703983100672;
        Sat, 30 Dec 2023 16:38:20 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231224090136.420979-1-alperyasinak1@gmail.com>
References: <20231224090136.420979-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] hstr: upgrade 2.5.0 -> 3.1.0
Message-Id: <170398309967.873206.11742992871909030256.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107915


On Sun, 24 Dec 2023 12:01:36 +0300, alperak wrote:
> Changelog:
> 
> * Released v3.1.0 - Minor release fixing a Bash function that is used
>   when ioctl/TIOCSTI is not available.
> 
> * Released v3.0.0 - major release which adds ability of HSTR to work
>   on operating systems and Linux kernels without ioctl/TIOCSTI support.
> 
> [...]

Applied, thanks!

[1/1] hstr: upgrade 2.5.0 -> 3.1.0
      commit: aebb88b41f3c22ba737ad570d6cf44812f8f63c7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


