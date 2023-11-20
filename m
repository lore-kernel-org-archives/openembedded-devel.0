Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD7DC5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.43612.1700452271350194333
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnAzqkbA;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9beb865a40so3687386276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452270; x=1701057070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXFkhhsky44tLHFWJiv+YG4RIKmgQRWbCipWV1vU8hg=;
        b=OnAzqkbA/oLBA+Tgg7scu7BYUlEKRhNBIK/nQyGV93INWPuT1rZeb8YDV45Twbaxal
         4m+vXAIP3GmDJ3GZET3QLxZuN48202bVhluMWyt2k07iq0tHFmxVJlxV38vWi33oZg4N
         DjjTUm+dd1/im8ozwyK+wvCfxvGYLH3SNM35/8eHKt1MIVkd85cZKfyfrcKTLjBae1tt
         aQx3nWqAhFQf6K1sOsF+S/gsB0NcGQCgzz/H5KglFRjvf+TI6hl6kB/PwX0SLAfmZGaP
         JWuL+yGHzCpOsgHLvYVBUeHra/zChQABsHtax9vBMXqk8I8YpKEesFCKzaN1de2+TYzJ
         C4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452270; x=1701057070;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXFkhhsky44tLHFWJiv+YG4RIKmgQRWbCipWV1vU8hg=;
        b=s/R4EFlO1trExHAWTED0+3fmb5thLaIPSx+PmW8kj0fKmZCRWXWU63388IncKvx8Sr
         73os/tIssOGy+yIJBDOqDjspl+ZQBpYxK3tUWSjhn5PK5Xy69VdfGh/Kjtqrk9aoyil5
         tc9YlnvcTVzrnnQktgwi5+jTTqSx4NulzzGvQrfM/TcW82oyPxqrlCI35GvHwr3z+Zwq
         OgVMQry/YWyI38VowTgm7bpRLqzabgNax9ykVo5h68OHyKel3tt2Jv+hqE6ShlzoGwds
         SPaIOJVOqEVciigUvhX/uYHgZxQNJ0/JajL3Ce0SfDELiq98JkON9vMQg92V0H3miZ/X
         mpXg==
X-Gm-Message-State: AOJu0Yz+9MkL3W2jizNjfwLHa6vAa7DQCtYQvFApa7ODrziGv3KjotO1
	PvdswRJ6AsJ33C8YkH/vAJgSz0O3K3D7bw==
X-Google-Smtp-Source: AGHT+IEFeRcSjF8MKXWvB4GA10XN1BEhOdZypBWvQkx33b2c8oOAI6kHOx2EQHtP0p4dlR9ct1VahQ==
X-Received: by 2002:a05:6902:12:b0:dae:4dfd:f6f5 with SMTP id l18-20020a056902001200b00dae4dfdf6f5mr5336872ybh.27.1700452270452;
        Sun, 19 Nov 2023 19:51:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123992-22691-1-git-send-email-wangmy@fujitsu.com>
References: <1700123992-22691-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.126.0
 -> 0.127.0
Message-Id: <170045226960.1416826.9294848441517645866.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:09 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106926


On Thu, 16 Nov 2023 16:39:52 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Small speed up to writing outgoing packets
> -Speed up incoming packet reader
> -Small speed up to processing incoming dns records
> 
> 
> [...]

Applied, thanks!

[1/1] python3-zeroconf: upgrade 0.126.0 -> 0.127.0
      commit: b4dde1292644b525550f52b85506ad71d43ca281

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


