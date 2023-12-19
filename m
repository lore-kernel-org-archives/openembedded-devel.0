Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFECC4706E
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.6827.1702967258380257309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9JMDcCU;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d307cf18fdso15842025ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967258; x=1703572058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqb1jeHNZ6JK+FPUwwSv9ofkN+sRwTYz6wtlMstCcPY=;
        b=K9JMDcCUksluWyCvgjlnPOr+IZRpi41MkZ6BzXjVATSPJ+j5zjR/r/cVRrsfPyFWGU
         yzBFWzJ9I0K0qSCUGslJEZVJS8OBgpI0wROnV9YmWbsCFAD3Y+6+CANCpKqYQnNQze/1
         tBt7gKtx1Au5LkXHWS7ZiyOtvmNntty8V8F1cTmCqBLly5c9sXLZpHT85dYmeKdDjPHg
         UWmx4jV1JpWRYVAP9XGVKf9nbzgdUj69s0XNolmtu9zY8cGiS/F3/GIrrYGMgk5iwS83
         TUJutboj5zxOJ/Y16XU4CfTZoGyoXWBlHXek5OXGDDlGuYAI8pan+u/M+Qu8ch10t1cM
         dG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967258; x=1703572058;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqb1jeHNZ6JK+FPUwwSv9ofkN+sRwTYz6wtlMstCcPY=;
        b=qFLhwguhH/6gQY9nZWtZ7sQTUdpxfmb7OPFN+2kokHq3FNB6gearbJSHCGFzO3IAgi
         f8JQqVm1rnBxPsYp1JJ3RlEpeH2cO6OWunIIbYwmjjN5WhySWIN4SAQ8YPt/hMnRC4Ry
         Z/XSt3DzDgL4PNFlU3d5L437U85yXf450WXti5MZkD5fcCnD8UN2H+pEtm7AOOn4jNYi
         glNwZ1ylNuOYf9NBRY5x6fUZ4MlSDYby7VZSp+Nfob5QCXZ+dG+nwh6lIS09aWYHpeNI
         VjZ+HLvxAl3M3BZEK15YA+GD1LWdHVBAG7BYTDAjIxT9R/eaVNZF4NeYz1jBruqozkW/
         0iAg==
X-Gm-Message-State: AOJu0YwXxC/NMD8draxSVVsoPU854InkWZbevwO0FP6RfQxUzDdQWPmr
	aEv7zRnvfrDTQxo74jkGw0s=
X-Google-Smtp-Source: AGHT+IHQApS4xzybOPKmLtP5G/xOW07E3LuAcQKFVa3bmGKLn7tDyzFrWI1L56jShvhYHZ1PwxNqPA==
X-Received: by 2002:a17:903:40ce:b0:1d3:cfb8:2b41 with SMTP id t14-20020a17090340ce00b001d3cfb82b41mr1331789pld.27.1702967257821;
        Mon, 18 Dec 2023 22:27:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599377-1503-1-git-send-email-wangmy@fujitsu.com>
References: <1702599377-1503-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-eth-keyfile: upgrade 0.6.1
 -> 0.7.0
Message-Id: <170296725676.1627685.12687060679573459361.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107597


On Fri, 15 Dec 2023 08:16:17 +0800, wangmy@fujitsu.com wrote:
> License-Update:
>     Copyright year updated to 2023.
> 
> Changelog:
> ============
> -Use correct default parameters for scrypt
> -Drop python 3.7 support
> -Checksum address when creating a keyfile
> -Merge project template updates, including using pre-commit for linting.
>  Add typing.
> 
> [...]

Applied, thanks!

[1/1] python3-eth-keyfile: upgrade 0.6.1 -> 0.7.0
      commit: f17d0272735b0a348fd72dbb37566ae43892c050

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


