Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61647C47DAF
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.31421.1704682011745683568
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OrjH4dQs;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3606ef221dbso10665945ab.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682011; x=1705286811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7Qv6Hcgs9S+B98To0XkhQyubGjpk7nwI5DTlh0tHsU=;
        b=OrjH4dQsctH+/TF6R7hOy8c4tiROJYWxibYZSSxQNUnIdyws84Npqqdy285N5yrxW3
         I/PX1rrs1yiPRlu4Otk02RkI/AbGG7o1xEN5Hluxz5vjtjqRcqrmGq2WsTvS4MsQrTGa
         8CxljLea6S1otfMhJWC8C1YQe9Yu/2y4CVLOIj+RsFfgHetVvw7VoY5uhC4kSaLD7hIj
         19aMJWE+fcmlFMaEOg88rJOhmBx6zvZPhAyezwvigTlNzJ136/2Pv1Y7alFjV/ov6JRw
         bfnqCQ9Qm6mXIO8a3r4nZXvA1rlppLU2FFUZAoB8OjI/G3hVUu7Cp/CUG+JwGMl10Qyw
         fSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682011; x=1705286811;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7Qv6Hcgs9S+B98To0XkhQyubGjpk7nwI5DTlh0tHsU=;
        b=AWtjv6ZmkQZ3W5ZY76xpQQKBrbzLH/1YeVAy2tsxne/G86BBvE9N2jzVc5gb5NxMG4
         tBqQ9f2/oF6k4caVohxD55IRxKS+b3tC7roM9k2JHpZVvNZQgXqpQ1HN162xIp+Cx9Tj
         sVSsyeQusK+vwMYd1YbzK8FgX/HjQktXWe0NjWx79GSw+9jQUCMK8oamliTY3Xszafxp
         ay/c1PQM2aMWGfCr9ESv59LtatavB6PTyFnd1XaS6B/CNI/bIr/LTZHxOW3NAyGs7OJt
         d6jF3z7NaWiTRkhfJsw1BU85mYl/OAqI9k5WGYLcgCmFiUef3hfqMx4IGNa9rpmu+zgd
         +eLA==
X-Gm-Message-State: AOJu0YyNnJnM4BuhVC9C3UhJK0EMZj2uszBnBpwYg17jXyMbo/w4GjIs
	stHW9hINpeh1FAKtTP0adkc+YgZDY4A=
X-Google-Smtp-Source: AGHT+IEhck3iyAgLdcP6lnpRGfVkdZrEcip4YmZD4kmpmnJEIg8cySn0FLTsrsx1XntopAYt1JJs4A==
X-Received: by 2002:a05:6e02:1607:b0:35f:da4f:84ed with SMTP id t7-20020a056e02160700b0035fda4f84edmr6823237ilu.18.1704682011031;
        Sun, 07 Jan 2024 18:46:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704178991-7862-1-git-send-email-wangmy@fujitsu.com>
References: <1704178991-7862-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] squid: upgrade 6.5 -> 6.6
Message-Id: <170468201041.912276.1510288908381470318.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108093


On Tue, 02 Jan 2024 15:03:11 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> - Bug 5328: Fix ESI build with libxml2 v2.12.0
> - Bug 5319: QOS Netfilter MARK preservation is always disabled
> - Bug 5318: peer_digest.cc:399: "fetch->pd && receivedData.data"
> - Bug 5317: FATAL attempt to read data from memory
> - Bug 5154: Do not open IPv6 sockets when IPv6 is disabled
> - FTP: Ignore credentials with a NUL-prefixed username
> - log_db_daemon: Fix DSN construction
> - Limit the number of allowed X-Forwarded-For hops
> - Do not update StoreEntry expiration after errorAppendEntry()
> - improve handling of response sending errors
> 
> [...]

Applied, thanks!

[1/1] squid: upgrade 6.5 -> 6.6
      commit: 0fae40f44c1d53b4bb4e19d8daac719d17cf810e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


