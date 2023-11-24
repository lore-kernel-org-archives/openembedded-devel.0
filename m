Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F33C636D4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.121185.1700784064475469595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EfD63n0E;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ce656b9780so9779055ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784064; x=1701388864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mg/1279UhhwUN/FcponT6hvocJeGWIfo+tX1XcFbW3g=;
        b=EfD63n0E6umr5ii300OORqG6ZRcRVG/d+lS9xVF5a+9HcEjSidvp0Pn/8Xn+k+ulol
         Woa59bRYw/5QskR4Qp3Ti2WsbbTWCr4hoTt8cOp0kwrFnJw0NxN4RRCq1fMXVcFKovEO
         s9NkbpJ8bGC//kzaepkNGuL83TtNHFEeBS0MB9oWxD5GG5MLwUcBahSmTS5Y0IUpR/Y8
         18oP2oxJQInqophcDe87RlYP3frshn55m1cHgoB/j0XQyEXl1Ox9SPxdVWfMQ7Cjt4lW
         U6ps76VxHO6My+mJdVT5N6CLp656helwfmXZ5h6D6bugjEsLGbgWvlgYY+Ha0zo+LkrQ
         Pjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784064; x=1701388864;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg/1279UhhwUN/FcponT6hvocJeGWIfo+tX1XcFbW3g=;
        b=jcsOKZ++FEiBgVudaz7WEQTNpoZyEKS5n/yDk1UKvPCqTDlBEDdgAhVXSWfOx3DXPy
         uZjxWrcraJZWZQUXJTpnMOjRrzyuc4+fMpnYR+NWUXQ3PcxbjQuWuM6ZnR+SEK9LRrHN
         EHPusK5d055ewRhiNugm7foO5SJGWBpt+dLOfb0TH96tZQn2CkpfaRYMQg9TYcvoSdfJ
         DSt54h4BCfdeAqc3cP8777SJ0HoHr5l6l8Y51Mu15Qimlp+Hf+J9h1lIpSJYzlxkg5i6
         FVBFqdLbrn+EHZwugUqPUbM/DOGkCTcHYC/vhsJwEP6tskFPkiq66QvGJkSevuwywfgz
         5J8w==
X-Gm-Message-State: AOJu0Yz3oojtc0f8YyhUAcF7VtzCJqVY+8JzteA7oaG9DnNC4iO0KAZM
	BYTCtaIOwkP4wttH3+d0zYztUNPluwjTJQ==
X-Google-Smtp-Source: AGHT+IGkd5sudVhDpHBEDwuGKlGWN9fZjKpZOyPaj0JZsyhmhiWv6ok4WikHsJVabUmUeT2nS6Cv+g==
X-Received: by 2002:a17:902:ea07:b0:1c9:e0f9:a676 with SMTP id s7-20020a170902ea0700b001c9e0f9a676mr930736plg.6.1700784063598;
        Thu, 23 Nov 2023 16:01:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634082-7944-1-git-send-email-wangmy@fujitsu.com>
References: <1700634082-7944-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-dateparser: upgrade 1.1.8
 -> 1.2.0
Message-Id: <170078406282.3118595.13387635581100921102.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107033


On Wed, 22 Nov 2023 14:21:22 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =========
> -New PREFER_MONTH_OF_YEAR setting (#1146)
> -Absolute years in Russian are no longer being treated as a number of years in
>  the past (#1129)
> -Removed the use of datetime.utcnow, deprecated on Python 3.12 (#1179)
> -Applied Black formatting to the code base (#1158)
> -Initial integration with OSSFuzz (#1198)
> -Extended test cases (#1191)
> 
> [...]

Applied, thanks!

[1/1] python3-dateparser: upgrade 1.1.8 -> 1.2.0
      commit: b4509a0cc852488550125f1ffa6053b7fcaa67eb

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


