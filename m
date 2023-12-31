Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BB0C47258
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.198983.1703983113879699956
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OA5Egzso;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-595678b3e8cso41376eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983113; x=1704587913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LZd5OU/J3ZG7SzpxnOL0dYbKW1pgjBBblyxX892rj8=;
        b=OA5Egzsoi/Sz3Ac37Fq4xWw3XUHUuTb4hoCdAlHKZONIrQ5YJduW0u8mSb/41KeJfz
         drD+fwLhC6XanRYtMPq4734vI0TIW1O7eaeisZTIL9tamf0+gSBcUpfKzsM2EJs4WftT
         u4zGDJ1dE9niRxFZFnBoqF0wDNSOo6lGXhiBx6G8HJVwFF5HZg6rGuzQpSoruOjPFHfK
         jiLf6BER2tm7wInT19bfjYWLADz0A1mqVOlqOs8y8fdreFPs/528AWUPWjxWmm/RB6BC
         6l104KjsQdl09i/hv9cb8oBZ4TQC8nCwCE8xR7kMENZ/v+kDxVu78+38U43cTj7v3Djc
         pDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983113; x=1704587913;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LZd5OU/J3ZG7SzpxnOL0dYbKW1pgjBBblyxX892rj8=;
        b=D2hNTBqC2OK56Y1ToVNzhUKmrrAUU3HEdQ51TJvatf/aCE7a2FXdYSjsmE5jLsVZ9I
         OCeJT7uXC/Gn4N+4DbJBq9GPfVNvaDvJ75WXVumCmRVgnN5F2z4bE0+o1j5apKRn49pu
         vaKLrjQUD6kduh/MRlCUECTj4niMk8Y9twtxH1DwmVtP08OYUxzcvplfyUoefMfrha9P
         qh0PIevyaHDsarkOA6uvXBaGXIrGV5mBApKMN2as4Bw/+gNDMScjOrU0go1swmlt34Hz
         SiXdAZ+0eo8V5Aq+l4eZe1DezE1xQxilOuc+j2YxXeA0Fg8yIbxYHd0oA6hdpl6Io562
         CySA==
X-Gm-Message-State: AOJu0Yxy53Yv62E2M1V8J0LHuKsfTpt0DoNMqvouYwM+fzf6+4PU52wq
	dqF8kDUqeKFV7A0tA49pJqBrnPsnIxE=
X-Google-Smtp-Source: AGHT+IHOrzeHkLpZiayxwGAth9KRt90LwOhwsaQZ9XoK9Mt+WCv06Or/cjHRBHmyLJrc/cCydGtjuQ==
X-Received: by 2002:a05:6359:6697:b0:16f:ebce:8126 with SMTP id so23-20020a056359669700b0016febce8126mr9893581rwb.19.1703983112806;
        Sat, 30 Dec 2023 16:38:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703574499-13015-1-git-send-email-wangmy@fujitsu.com>
References: <1703574499-13015-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-apispec: upgrade 6.3.0 ->
 6.3.1
Message-Id: <170398311218.873206.14088250494489406302.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107928


On Tue, 26 Dec 2023 15:08:19 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> - Fix conversion of deprecated flag on parameters
> 
> 

Applied, thanks!

[1/1] python3-apispec: upgrade 6.3.0 -> 6.3.1
      commit: 054e5ea2c2db18294a099870833e7b161967640a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


