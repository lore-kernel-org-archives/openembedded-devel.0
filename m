Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBC7CD11C2
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.82093.1712504584755119686
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PrOos6i7;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so1045042b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504584; x=1713109384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiSyR4naG7YMofFZfyrO4rtACOew1tncDPLqLP1bdy8=;
        b=PrOos6i7dUPLnOTRuNeM9CDbS6/kVEXEgHbQ+NN706d7zQg9XtheAUvgyAfJLpSQC3
         U5xpJeFHX46BSr5lrsIDu8jjQPCCq8Gcs0nX0ZtKOc3imY1wk76J6cEgzxDp9UhC0Adf
         arx0LdfE/Qw6OvRGJYBA9M6+33Q3wx9SCIaK5fk94WDUyH2vK2p6dDnQ9n3fVsas50cP
         i9TPWIOMkNFfZUzYUnofgx+9XkXFVdUpYntLBVv8z1/IpCcMoffHO5coExQMKT5ElQ9N
         8ay/i3CovfHZCSKfqGdN1fvew3Db0Tp0vwZsHsFiQUn9zpr8vd6Ld2/Q9Rtm5GTBALUS
         hX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504584; x=1713109384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiSyR4naG7YMofFZfyrO4rtACOew1tncDPLqLP1bdy8=;
        b=TYQy+EwOu/9Beu0w1xmtuVfNMF9sRteOqvmSxsnOCrVhi+2mQyq7POTXFOjZvLODQy
         hwMwCwbvhSJ2QTDvqZSh0sRNveg7Atu9h+shI+Nyd1BmsrleCaifSCK9zQExcRhglic2
         E0ayhq8wTnzJZxdH/fS2vYzyK7TXDTypa1kppjVl1fe+UtfsnZrSSNfVuyx2GJ9EvGBJ
         wfqq7mjFEhCvIE3rGsLRN6b8TdbzJS5cEO3pfAULCk5U0iqNYkzkasp9+qJogNhPiAhU
         D3bEoBOHJ/ySvLDShDN8TjLndbFAjHKRzvhgl8S7Gg6mWBLv/trukd4nbpyJz3rB2H0z
         v9hg==
X-Gm-Message-State: AOJu0YyIoAbJwhZjvm3uPigpEQtPA/2vdl6Cb15M8Gzk3V6W1bKxgZTv
	z3KwJmHB2KqlmLwot8mGsTrLufQrkZ5O6NkTL4DYdG7yE8en5gDftGmJ/hu6
X-Google-Smtp-Source: AGHT+IFMxT8cYVZw5jhL/NcudwW/o7meR7WsJpvMl5Yal+xj/Kn0s8t7/n5zFrlPviIugs5NAcFfkA==
X-Received: by 2002:a05:6a00:3a03:b0:6ea:aaf5:9e00 with SMTP id fj3-20020a056a003a0300b006eaaaf59e00mr6085561pfb.33.1712504583740;
        Sun, 07 Apr 2024 08:43:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH] mdns: Upgrade 2200.80.16 -> 2200.100.94.0.2
Date: Sun,  7 Apr 2024 08:42:50 -0700
Message-ID: <171250415787.900727.18037713105725640455.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405073025.16939-1-alex.kiernan@gmail.com>
References: <20240405073025.16939-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109841


On Fri, 05 Apr 2024 07:30:26 +0000, Alex Kiernan wrote:
> 


Applied, thanks!

[1/1] mdns: Upgrade 2200.80.16 -> 2200.100.94.0.2
      commit: 2061a94d2a4c947a447f28b0e74a0ebe2b8984c0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

