Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FDFC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.6836.1702967266003019696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uhs5Agrl;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d39afa1eecso24233875ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967265; x=1703572065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR+nL8lY6bJuQBl56Nb59JBW6retSEuiKcV3dlRPgM8=;
        b=Uhs5AgrlbDWLqdjneFkiaMUWLoYPTgE2Kg4Td1feCENO31x8Vx+K/qrC2nRDNQEvQQ
         flNyTvdirQTec7JXXFDYm2yywfNG1gh1GpGO769xUvf+ECxFmLWEX4QXNu7puvXo242+
         JPnQyGr3PJWH9YG8FKrtGogxOCT6FCw/tjUaKrRlVeIsZZ3kabdQLt/k45C2EI3ikG9E
         MXN9/bTCeY/wvHc/04ywnG9DSsbWji8ZhDPOtZfppmZsUXhyAskFlLLkW28gzTYjz8z5
         JKdfjQlB+FR1QGymb1fSfEbGnkoWzyJ/1qIgatRiCXxRFhRoFkj1dFTE0vaEqKOB03dI
         5kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967265; x=1703572065;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gR+nL8lY6bJuQBl56Nb59JBW6retSEuiKcV3dlRPgM8=;
        b=bN7SVUFkm8ZQ62FPWg9Y3ZhrEWuM+Z9wrCXsSqbleTcey7yEeOPpS0yb/nofodv9eU
         pqiCXIDCBp2IrR8GAEz1NE2RT2zf83CH/+HF3+lCGoBliWZA0GtlWxiaSz3YKnk/hgkC
         3IDD98IDr+qvejyFu06NDIluxpnqfhUo18Lx2kqRUmesChc1CDlaIk/xjWpeK5VnLusc
         tN0hGxfz6ULU86Eb8fVg4EB+zbGGAlOZ/Btv+vh6okXczTvEFwciVRXxis3E+1MUP2BS
         ddlLZWCiALFctOeGx0Z5OsYNQG0pcqI33IjgwhqMnq0vuIlEgwxOzYdwrLcQbSl0gFOa
         31ZA==
X-Gm-Message-State: AOJu0YyEnFjzg9xaCCUK1mP+PjfethCb94J11EnY1qnGvE7UYMp8RhbN
	8QVvRmY8o2AICLZP1SzapnGrkvSxSsw=
X-Google-Smtp-Source: AGHT+IFIQbECWvaS/aIN7apSjUbItQ1n6XlL9txbotAzGVuj0/KEFUG4eDPrejsJqiOWvbMWVr8U9Q==
X-Received: by 2002:a17:903:2793:b0:1d3:92db:24fa with SMTP id jw19-20020a170903279300b001d392db24famr6479502plb.1.1702967265423;
        Mon, 18 Dec 2023 22:27:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702600113-1864-1-git-send-email-wangmy@fujitsu.com>
References: <1702600113-1864-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.11.3 ->
 6.12.0
Message-Id: <170296726482.1627685.10801608558292093010.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107605


On Fri, 15 Dec 2023 08:28:33 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Make downloadable versions of docs available in pdf, htmlzip, and epub formats
> -Add 2023 user survey fine art banner in the docs
> -Polish the community resources docs page
> -Implement createAccessList RPC endpoint to create an EIP-2930 access list.
> -Run flaky eth-tester tests on CI
> -Pin pytest-asyncio dependency to <0.23
> -Fix collision of w3 variable when initializing contract with function of the same name
> 
> [...]

Applied, thanks!

[1/1] python3-web3: upgrade 6.11.3 -> 6.12.0
      commit: 496776dedef947b381177d2f15fe7f3c7f197797

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


