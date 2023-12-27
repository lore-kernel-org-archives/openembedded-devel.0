Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D455C47073
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.97650.1703665279162027297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MX1ascKP;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3aa0321b5so40977885ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665278; x=1704270078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zua9PAL6iA70n7cURGqGYgT/9NIf5bIkBJ3XF/q5pcc=;
        b=MX1ascKP+DC5TQK05ZiWpDBK3/gFFFDOhb7xoKL9SNGhBa5RiOgN2+5Hp6bVoU1ZUx
         JhFl4doT0hdvVyxnuh7QfjhLLwMKSucb7rFnd25cCQ9pdgMB9Z42BFB5qyuIygvCvf1r
         dDLnVBK21xfyWIQOAhfmrOSN8p9p6RAotI2QFhcDPSPrpXVGaM0YrdeYRHPAUYBhc3Av
         fN6nFjWeWTtquriALf9OFT/bdyCxXEcNeHou9FhZISKjXaFN1bQb968aI0lmH7A6v+by
         ktHbqhnET3PPYRgTyg2Dlu5Axc8Pm6WyAq3nj/moCIkoSKwBIwtdNZbX9xEROJBU+f/N
         rfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665278; x=1704270078;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zua9PAL6iA70n7cURGqGYgT/9NIf5bIkBJ3XF/q5pcc=;
        b=lGFsRat5mDbsLVc+eFL8/eqa/MrxS9Rep9m7iKh897ahdCQZ2tlrXBj6vk6Vg3hvxM
         Yc4IWuf9vK6O/KV0r6HrVoFVL3MEffxPsl35+kkydwk8/aBmAXB8FQqs3BE5EVnqccmQ
         sy4y2/6NA1wvFievcqVDo8qBo0Wl91pEjxMANYC4RNvHcY0vFqYdVccadHheoU/E2N0u
         2b76U8zuPUm125g9clnaUCwvWs/b6wrQp1Ctc10Ot9eRmHt5andYJaRMkGvr3EDFuSGa
         vnmTJAG3VV9ymKWJvIA8hCWwe4yEwa/oq29wv/sZthMXJZGVFodnLMxPJD5M9xx0LG5N
         B5XQ==
X-Gm-Message-State: AOJu0YyzV1I5PIMfLg/7KXfw9zn/Lb6/l6Ekt0fD7e9WblcLsbkOPz6S
	dwTu6orWqnbdUh9FEVwBuZ/Bkn0Xy5o=
X-Google-Smtp-Source: AGHT+IHBF9U7CNs0XZS/BZTi0/X+CbY/ajrMAkm9dJPnMK+xTv8CyHiqH9LnT0R3bHPeo5HACTU1Tw==
X-Received: by 2002:a17:90a:7d10:b0:28c:8913:3606 with SMTP id g16-20020a17090a7d1000b0028c89133606mr744871pjl.55.1703665278336;
        Wed, 27 Dec 2023 00:21:18 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Tim Orling <ticotimo@gmail.com>
In-Reply-To: <cover.1701991044.git.ticotimo@gmail.com>
References: <cover.1701991044.git.ticotimo@gmail.com>
Subject: Re: [meta-python][PATCH 0/7] python3-pydantic: fix RDEPENDS and
 add ptest
Message-Id: <170366527768.1947762.16879928870400435004.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:17 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107822


On Thu, 07 Dec 2023 15:23:50 -0800, Tim Orling wrote:
> The python3-pydantic upgrade to 2.x snuck in a runtime dependency on
> python3-pydantic-core for which we were not yet ready: it dependended on
> the 'maturin' PEP-517 backend.
> 
> Depending on https://patchwork.yoctoproject.org/project/oe-core/patch/cover.1701989368.git.tim.orling@konsulko.com/
> series, we now have the support for 'maturin'.
> 
> [...]

Applied, thanks!

[1/7] python3-pydantic-core: add v2.14.5
      commit: e67a62b44c6ec6fa0d1f39076f58faf95b4cd0a3
[2/7] python3-annotated-types: add v0.6.0
      commit: 0b1b5efeb521fde8cd684605d21adba9db2e1bc9
[3/7] python3-pydantic: fix RDEPENDS
      commit: 537a9e24c6d5e2a5a0b177bb572b8a3ce95a485e
[4/7] python3-dirty-equals: add v0.7.1
      commit: e592a8ce9a3e4cc7ad9e2e0da67e5afa9a38186a
[5/7] python3-pydantic-core: enable ptest
      commit: 446124784bfdaf3d3c955e760f7354ebaba5f1ef
[6/7] python3-cloudpickle: add v3.0.0
      commit: b48af247b81411e61c780d48cf13aceda275d6e7
[7/7] python3-pydantic: enable ptest
      commit: 1872badd7350240a792a242efbe232f7c6cbc22a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


