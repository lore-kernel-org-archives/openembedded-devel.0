Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A96C4706F
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.6751.1702967242307378988
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IR12Ok2L;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d2e6e14865so16748375ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967242; x=1703572042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUKBZFrQqCOg1XXI1U/CtU9mxKaY9+9HyVYr6Wgy7u4=;
        b=IR12Ok2LFYUjhRFfUTNzj+i+TOpKrJ7W/OjiDAES/Mdlo/8BCW4Smc76OQjADdBDJE
         zpwlvHJwYdD4ZpGCz0WHSB1AMr0tssJFaI1tEanuzkSwluUMbCAJQMzEnl9B4gJ0atse
         uUthpkCc8gOom1vfO9rEhdn/1PHmwvC/jiib679QG59rUqoBXzaZ9KvN4/i81XhDdKRK
         E566FmjkE3zxduNYlFeFYBLsqfRu8DEJxID7YfEfVpVSQYltJkgGJlI8dRe9q/G/kNZ5
         KeUFtQhnjXjbXVcrcKtVLYZxu2oFcsbdxIHVYvyPZkPuOnjD/3Ab1hPrLFqkwQMP5NHF
         VQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967242; x=1703572042;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUKBZFrQqCOg1XXI1U/CtU9mxKaY9+9HyVYr6Wgy7u4=;
        b=ukYw1dHb5bv/NYJjIc2jZq//VH/5gpRXQWAPnCnDnS8HZTwogpB3fmFoTIPcsL1gEd
         QBC+GU7OVgkwCCYH6Q2IvIv6LhHn/dOpxnMms7Z0JY3J85TPqFy2O0JBDYP03mXtT5kj
         zbdtCr+XU+NolfjHvwYHQxsMx6Qg55ljI3wz/363nj9JtB1CDkx8688h/vkGU3oO945O
         XZKmpPLo+w3m0HyxEFjo9fb+H/4IPZbgFAZ52ZE5s0jmknQS8f1i4QWsWXdPPzcni/mT
         EHoSrAbaBHKS16mxdKmj1262xvs8DnwWmF2KQ9KzsC7SgK+bCd23Y4qbqNa9rT+IO3U9
         saIQ==
X-Gm-Message-State: AOJu0YxwL72k38RD5EOUEY8UMNRuiEGBySq6i1DXL42eELnHPFJysSx2
	U8dJp2jsOeA+KmgG/OgJb/k=
X-Google-Smtp-Source: AGHT+IEXe78RWQpb8mULsWhLw6sizD5TE8DkScV45Uzelh6l6l6BoNr3IZxdFBPbU7BMOUo5VO5ESg==
X-Received: by 2002:a17:902:efd2:b0:1d3:b860:5aa2 with SMTP id ja18-20020a170902efd200b001d3b8605aa2mr1427207plb.113.1702967241759;
        Mon, 18 Dec 2023 22:27:21 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702543821-27676-1-git-send-email-wangmy@fujitsu.com>
References: <1702543821-27676-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 2.15.0
 -> 2.21.0
Message-Id: <170296724089.1627685.1504489521959410593.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:20 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107579


On Thu, 14 Dec 2023 16:50:21 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Speed up message callbacks
> -Speed up run time constructed method handlers
> -Speed up ServiceInterface callbacks with cython methods
> -Small speed up to the aio message reader
> -Reduce duplicate code in aio MessageBus
> -Speed up sending messages with call on the MessageBus
> 
> [...]

Applied, thanks!

[1/1] python3-dbus-fast: upgrade 2.15.0 -> 2.21.0
      commit: 8ab2bc33d31f01c9f9cc58c9fb66e74c6aa7d991

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


