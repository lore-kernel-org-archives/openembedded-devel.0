Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891EEC47070
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.6761.1702967248189699096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=itIHIslN;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d3cfb1568eso10306785ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967247; x=1703572047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYr2Q3DLR8BPnBaE6dkkOpGN1v78d0DZE5QS9l+CkKg=;
        b=itIHIslNvc0NoFnjlqIMFA8BGijQeeLM9DARjl25uEd8l+oF+L+W6VwFYh0falV6+6
         PrxIy9ZtahgSB1OoslCkLO5zVfJBGfiz9Jd2pGQXEA1SScqG262iZr22hgpt5K4BcZ2E
         yJFRcR9VB+0SHgYurl1Dff6hz/Rcq0lb82x60fYoAIG3cZvLCGrS0GDqdnkD4reUUcOK
         8RYfnJXRzuk8uOenWpoaQdq1/bL/cFDC2EZjkLdVMfrRaSn/DYP5WY/urs8E+cOWuxv0
         cCBNXCXSYbPkZ4BnqxLRecIRjS0VtHT0dC+S4JxdA39WsU0gBnuoC4zF8wxRvwcWLmX6
         LQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967247; x=1703572047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYr2Q3DLR8BPnBaE6dkkOpGN1v78d0DZE5QS9l+CkKg=;
        b=Z6OPwmfiJDUa6s/LoDRK0d9fAV+IsMgdYGkhrRTeiv6l61yjWzkLR1UmI54l7GnW7k
         CmRleNsCOAzdpTAT4u8DGJn52VQONHSq5Aa04/u0f7LSlkKBfXgeOrTtOk/OTLWYgy5h
         C/89HbkbX82YJkTVGk7bZ1zokLu4mRbDiP7aJQCWgnMWWEv/M6VtstBnDgvBd5ftD3qO
         ltaTm1/ysP2gbFuo/LQXqCr39ASvaEDsH34fXnUesbXhb69H9Mmb2yJr0mkVN14H+bfE
         Lk5eSOQFo0zuMT0KF9FqjuD4jRgQ4Q6ODLH5pJeHQrs722Zkv7gy9fE2n3Vj/W1lv7QT
         L8jA==
X-Gm-Message-State: AOJu0YxLtuh6ShVWBrE+S5xvjC9ABc4eepeKQkWcVo+ArqTLxG4IpFRZ
	mnBvJWutWwe8kW2vRm7FJysbLuI492M=
X-Google-Smtp-Source: AGHT+IFuryOd3E4dyN6pC0n8KmqsGsgWsNzs/o+0RGN/3DJSMGbY4q2NMC6vvDldz/X9UrAiQyMo9A==
X-Received: by 2002:a17:902:ef87:b0:1d3:b365:bd4f with SMTP id iz7-20020a170902ef8700b001d3b365bd4fmr2696682plb.62.1702967247582;
        Mon, 18 Dec 2023 22:27:27 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544193-28046-1-git-send-email-wangmy@fujitsu.com>
References: <1702544193-28046-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.33.0 ->
 2.33.1
Message-Id: <170296724693.1627685.6015377907822243554.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107586


On Thu, 14 Dec 2023 16:56:33 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Replace mktemp with mkstemp when caching to disk for legacy plugins
> -Fix grammar in ImportError
> 
> 

Applied, thanks!

[1/1] python3-imageio: upgrade 2.33.0 -> 2.33.1
      commit: 6cfdc2581a4e6ae11dce83ab1c60319bde13dfd1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


