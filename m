Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB90C47DA2
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.31437.1704682019892849828
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lU8MfmQp;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso116341a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682019; x=1705286819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEaALgrTWvYvgYuq6HxucSAkIo6LsCjcMGZGdvdSbWM=;
        b=lU8MfmQp/GsttulrAE0x8S17Qb+6FPZ7oR6F6go5LFBb8OwHsf4HwTC9O6JjSRbESH
         6fVBITlPNm0kQMPET+i8TjXOqo2UtaPUCVrTsxLL1oG2BnrxqRekbubexxiiiH8EshhQ
         omRoWUPCzqDJjdnM4tg26WYJHy52X84Z9syn6F527zEtSRJE821VT6fCLzyfgIDlOnIU
         dNEvVYTzkACLOKV0UDP4lwEqSzY0I2MzKURbqJFclOV6T3IJeRvsLYUn+Y3Y61l4hKY2
         kkkU3W0Xk0pj+42moGGFdyVzgPmzVpv1FhV3T7E2vDp9o24bXluYIfeGPvhyZkvSEUoW
         e8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682019; x=1705286819;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEaALgrTWvYvgYuq6HxucSAkIo6LsCjcMGZGdvdSbWM=;
        b=Wgq9jc+wolev180/NbIbpgQKn6xujiLMhL+eXaMdnBNLWl8DYI3Hfg4+FtDqxALGKR
         jfrRpJWUKi1YfHSN8r0m6WRjCstkpTsIQfT6B0yTOOc2X11IaFPZzLoD9Gamd+AuP02r
         o2s0iISB5UEeFcdbaxv5Y3IqoXNDHH4LgE5K7/795YtEWK1tVpSXzPF4/mQv17kYsTVo
         xZTLlSMu95jvHo1PqkN10NIpB6gr9Na6X+olyfbYQC79NSrplF74gdnlni76j1GEpbUE
         b7U2uVvUuhD0m4pRs+FIG9qgL3yGSwd7bwciJEjRnoCtfnjGdFQGrBBaguqHXDoMWeO0
         iF7g==
X-Gm-Message-State: AOJu0Yyh+EbqIcc1hC8JmfLrWfqqLMk0/p1dXFLI0OsKt1/ZAu6AewA9
	hsiN3KnRySTmFeEeWXmzC2UaRixfWro=
X-Google-Smtp-Source: AGHT+IEtCZTJVuxXFYkC6foaW0rLRIj7b2ll/LGWaKwAP0z4fqpkBy+WPHVLmT1SWTCELmZh6+kLgQ==
X-Received: by 2002:a05:6a20:4c9d:b0:197:7b1e:392c with SMTP id fq29-20020a056a204c9d00b001977b1e392cmr676950pzb.37.1704682019311;
        Sun, 07 Jan 2024 18:46:59 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179499-8251-1-git-send-email-wangmy@fujitsu.com>
References: <1704179499-8251-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] qpdf: upgrade 11.6.4 -> 11.7.0
Message-Id: <170468201853.912276.12067682631546369844.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:58 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108103


On Tue, 02 Jan 2024 15:11:39 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://qpdf.readthedocs.io/en/stable/release-notes.html
> 
> 

Applied, thanks!

[1/1] qpdf: upgrade 11.6.4 -> 11.7.0
      commit: 5473dfef55b4ba126cf578df4fcfb05e2ec415a9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


