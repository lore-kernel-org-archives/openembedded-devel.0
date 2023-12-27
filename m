Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4E1C4706F
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.98074.1703665317210931958
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fE+bJ+vR;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9a7233133so615272b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665316; x=1704270116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2W9yhYhHaUwLemHAD0FdbuLshk0ntNEmdlh6c3JDao=;
        b=fE+bJ+vR3u3kNj+DuLuo76u8aZuKEjoWEYBIaZa29KdGluGqUc8QB2y/K+pD1TMnuJ
         NTh7/KxJyDeydANk1gdnJ0GyznvfgGtQNaaVcydGHxIi+uwBzUOW1s/dTiRqw1oqGy9G
         VZ9oA60OHjTHnYdg4IhzOHzpqW1Kny4vpifLZBanHkRoDy2Bwz12/FZX/AbvSOwSmNu1
         qivr1twCIEvrSvR2nlVDD/+vt7cZMVl7D4VfTRw5UmX9LHvecWnGPaObsINituZrF5nX
         wjxP8531r30YsXlZyfzw5uFHDI3Jv5UdGaJ/aQ6aZG6HporSJyVyrI/G8fXbgCVl0YiF
         zW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665316; x=1704270116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2W9yhYhHaUwLemHAD0FdbuLshk0ntNEmdlh6c3JDao=;
        b=P7yhaMoVnxlBXnmEx1ZY4p5sRZaczGUYJyRKtcjLI8b5DnT+cvKwImpX14hhfRSp/8
         wkjKsLDeMlfrUSEB+2f/lx2B+aAvatvCm9xa7GfiyKoXephPOGrzRunL5e1mzoGJzNtv
         locAoPnFH19ck5VejLCMq1ERCo7I41vNaeNgo57RNim2Fj8pL1/No4DJgzKhc6R+zzMH
         FQZ25Vf39RQLvO+W4bSVaziBZE9nayj1lz24Ka+pQL3ZRfj2brgtL4ReYUiqvxeg5UH4
         uxqLi/L9JBrXIG0m+xN09rY3UcHm0IriRqREWOnvLJv4IvaBRdxZHrln7Ek5UIclPubH
         safQ==
X-Gm-Message-State: AOJu0YxaTXqmIGXkPkU4jmS//9ev0StNHIFlz/CIAoxODoPKM3Nfegxo
	ueFhjXizaedZ24FQYZe6ORk=
X-Google-Smtp-Source: AGHT+IGYKSZon6J41AGrXtjmL0zpWGFBfGkP0K5yf8lLfYBNqoofHsMOi2idxeJFSHJDe3yqCetvAA==
X-Received: by 2002:a05:6a21:3282:b0:196:2942:52ea with SMTP id yt2-20020a056a21328200b00196294252eamr166434pzb.24.1703665316569;
        Wed, 27 Dec 2023 00:21:56 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231222065506.1326249-1-alperyasinak1@gmail.com>
References: <20231222065506.1326249-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] driverctl: upgrade 0.111 -> 0.115
Message-Id: <170366531593.1947762.10552588777368637887.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107865


On Fri, 22 Dec 2023 09:55:06 +0300, alperak wrote:
> Changelog:
> 
> * driverctl: Fix duplicate ID write error
> * driverctl: add list-persisted command
> * Fix device driver binding issue after re-enumeration
> * driverctl: fix list_devices() when `driver_override` is not set
> 
> [...]

Applied, thanks!

[1/1] driverctl: upgrade 0.111 -> 0.115
      commit: 1f2c2ebcbcf5944225462f530e0d56b20f1b4630

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


