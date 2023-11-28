Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EFEC46CA7
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14759.1701215738611431049
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQnDxfSV;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cf8b35a6dbso45756695ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215738; x=1701820538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+XHI5xv+vRvO0BKAG+3pmatzyFxjlgWUDS40vZYXi0=;
        b=fQnDxfSVPzvAdSq+cT2k1vjpN/R5lNCie15oKo23i/QZTDcmzYqdAGUIQwD8dtccpv
         zjFKDoq8woPwhlDuw6CZB9zrrCYGNNUdvCfPw9lYgmRnSQDBHjtccXp92danRG8Dt++U
         QEjHsK9hklIJSEekEBzKv9AsjoX3rlchdx9fo5/LTv9P6FR2HDyTE2bC3n8IUwR+FKkN
         RsB0PZ2oMSbuJwcs7u6uPLIemmby1XZTXIlPm5xDp3EOY3xrNh3uyj4fDBDPJS7zeAVt
         RXkQoQy65plSxlCIt+YTbeX3i2IcJOMST4Rhz55oGlj+deQL8cGcO4d4deH4XiCRqwsN
         jUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215738; x=1701820538;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+XHI5xv+vRvO0BKAG+3pmatzyFxjlgWUDS40vZYXi0=;
        b=ONDJ0IrWucg8guaX/dV8Hon91k3IEcd+Uz5kKZhdKmjyXdpjubMEhHd6qUM4LFvkUA
         M27jDSmsbYUeEjdVqMjzeC0xaSdOfb4TtF+7Myk6N/dXxAtGmXV9ZBLwI7gYrzOOnzYP
         +6ohoNjEgGXOSn3XKm6x9kgR8eUwHUPBo5+pwLgSq6GTyl/+GTWKjCxJFTDSMu/bz4Uj
         N+obdRCu3Xog5SwTqNt4dj1dg+6xX4x1mnghsxQdGqYc7N8NnSA+GOjuGVgc9ERxcXoY
         bRIg8Lno5sdlU1HBzGTnXjexdhNZ0IKk36y2xirLLwbgIdIBQg5hd0c2019cvNa1jpIp
         MENg==
X-Gm-Message-State: AOJu0YyXrwel6TzXJ4N/+00pV2Cx4oqRGR7x6ZIxTo7UbN1oB3ZUy1eW
	xz0L16ontvOBIuDFsuERaeddUkxJIKF94A==
X-Google-Smtp-Source: AGHT+IHXXwufzh2lpOq9mq3gpWKxMR0uXvDb868FuO23gMZyk0AyVQcL+Qc88repHBCnEG+k+bCu/w==
X-Received: by 2002:a17:902:7789:b0:1ca:86b:7ed9 with SMTP id o9-20020a170902778900b001ca086b7ed9mr18270991pll.40.1701215737888;
        Tue, 28 Nov 2023 15:55:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701161249-28639-1-git-send-email-wangmy@fujitsu.com>
References: <1701161249-28639-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.6
 -> 20.24.7
Message-Id: <170121573672.1187527.15733029045890771200.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107123


On Tue, 28 Nov 2023 16:47:29 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Allow platformdirs v4
> -Bump wheels package
> 
> 

Applied, thanks!

[1/1] python3-virtualenv: upgrade 20.24.6 -> 20.24.7
      commit: 49eabb2afd63f64de4837478cb809d990eef9873

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


