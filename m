Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9789C47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:47 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.8071.1700032782666760630
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YqDHmw+V;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a84204e7aeso75169927b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032782; x=1700637582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bxztx6ufkhguEmIiaXmcZziqX3WBqEROS+yeWznml30=;
        b=YqDHmw+VVuHv7GygjlO9sI3WQR1L/1uJupcSPIrlJ37zAjatHvrfwtVDH1qd5x3zwH
         6uLGrKhVpHuB1tyOWLYB5cjMjcVbD1xdhfaKTDpFtMEEjglRkTA112GZiPPu6akV7X0G
         SX3sMIXYMLLpmwpUzm0CX3e2OOPHcKP5BxwJV52n7cdeyaw8ywVIb1+z2IqIi/NTyg7u
         EWBj94N1Rmq/bLpgNr+zP29y3kN7CGj6bM9syBfJzqIsRrfotVKetGc9OJbu/ib5GxU1
         uSgkkpQOL/DkZLC995Pdv+f3rg5dkxgAoqwBIcwzNOJgyfrcF7uTUVDvFPq/rsKCpTVQ
         7rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032782; x=1700637582;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bxztx6ufkhguEmIiaXmcZziqX3WBqEROS+yeWznml30=;
        b=wHDbiw1yFNoz4meNnm1f1R8iuYToevSDqzzMSx8mwUdmBITTW+gYIXtruwOzmGlfdj
         OvODppPkdQZdfrpUKFsChTcsbuEK72j4tDeqhzrc9AClzRUff3gn0XawUztWAgtyhWxN
         bPDlG5a9jMiQU0RzJX6nVB3DK8DWpV4+RIXxUHzrAGMu1+lAe9UduAPk88FfUW4paSHy
         Zl0BJMRV0MG1Jl81Rz82a+ULHo9lXel5e5pIE79RY8ae8DizbqykWYkGb52cYcXCrLPk
         qP5NBAgXf4W48io+IRLMUDq8TAp0P98h4N6BUlApaqX9hkv7+EZ4fpiuGunk7QN0g7mR
         9ZVw==
X-Gm-Message-State: AOJu0Yw0dNB8l3yK1u/qmyRSRyv5UijM3ZSqaj3l/xaOb23gRXHx01Rb
	4DzM175EUCeF9FTDS+rJ32A=
X-Google-Smtp-Source: AGHT+IGRDabwqDyjPcLpbsltZz4EeaXV83o5mwTgB0QKZkHkeyGG9imApk/MpXbrBGUHfT5hTW601w==
X-Received: by 2002:a0d:cfc4:0:b0:5a7:c8fa:c620 with SMTP id r187-20020a0dcfc4000000b005a7c8fac620mr11827725ywd.0.1700032781817;
        Tue, 14 Nov 2023 23:19:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231114131156.42582-1-f_l_k@t-online.de>
References: <20231114131156.42582-1-f_l_k@t-online.de>
Subject: Re: [meta-networking][PATCH] system-config-printer: Add cups to
 rdepends
Message-Id: <170003278097.3928366.2512300259479851608.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106742


On Tue, 14 Nov 2023 14:11:56 +0100, Markus Volk wrote:
> 
> 

Applied, thanks!

[1/1] system-config-printer: Add cups to rdepends
      commit: 5f344ed2dd36f43b8d7fa59b774f29b08313e7f4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


