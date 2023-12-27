Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682A8C47422
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.97660.1703665301521949084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OPEjVEpJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28bd734aab4so4056919a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665301; x=1704270101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/T8fAUP2e0Ejc/4grjlUN+J2hS7kA2PSL0kT2imWKPY=;
        b=OPEjVEpJZYPg8JGiKYEncJ6PTaMH2LM/lPctcTCGsQ22R12fXUA9uERT1f9JAm8ZS5
         mEZhdDoXW6Dg1Yu7MepnN6FY1N5jBKFX2GxJvj3KrIWX19T9vJwjHYMnQKV0TYsuJdUi
         6wyau1ex2IJBhCWspSCgQyswv/hi+8dotCkbCXkl1xhkkHkl9elfxcwNlpMBvmNjUt81
         ciJVUO+xostwQ4t+BoCtyyYwvHZdaUXOwn6uVPwi3ZHPof1K0uKl+E+Y4xrbWuN01SEE
         XFwB9yRUgvEcXEMy8LUzGhcL5SQjPzuqVmPPnowwC2YJqcPwNbYSKNjXmYItF4IjzI/N
         goBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665301; x=1704270101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/T8fAUP2e0Ejc/4grjlUN+J2hS7kA2PSL0kT2imWKPY=;
        b=ewUoyXES5OHvb4ZPtbalgSlz866OnKkPhFlTXzKrDKcmSVsFAFgmuTncjPZDvtdzBG
         rpFMfy9+S021DnCjbT/WMWPky+HCXQ47GUPLYEKMysqu4uYTDnXaFCH6j2Po0Lqe5Zyl
         keEsAZPy/2PMpCGBHpP+1JGSQlhT9dl8h0vdhVs6fM0NtgL3zo/4/NBmTZAXMLF1HCf7
         8toZFdZ2mgBA+gbdWGc5DxmSaaVRsu5Ir8MHkinoIkq3duf1Ag0TqyTrNuACU1AvgIOD
         YyuzK85SHlfx/FyKW5vBeAEkATO1l5TLDdG3kBXS2WDpUxjOb29pO/8zk20ZjugIEHo+
         M3cw==
X-Gm-Message-State: AOJu0YxZfhu3AlMVZlg3wkk5dIcvt4Z0dKJ/tKd1IQ3JoX6t1REvUaVH
	8n1/hkJZ7GtWj9MaYlhpVPU8Vv/TmGA=
X-Google-Smtp-Source: AGHT+IGvBV6kALSkkcv3o8Jx1eYyXncE63Z7I0FzZCKHmQ8oV5QdSBDt4hf4CcjotpJdcOmnTVdp6g==
X-Received: by 2002:a17:90b:2284:b0:28b:c67a:8a1b with SMTP id kx4-20020a17090b228400b0028bc67a8a1bmr3686295pjb.99.1703665300896;
        Wed, 27 Dec 2023 00:21:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221170216.3900138-1-derek@asterius.io>
References: <20231221170216.3900138-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-flask-sqlalchemy: fix upstream
 uri check
Message-Id: <170366530026.1947762.13028281758652374806.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107847


On Thu, 21 Dec 2023 17:02:16 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-flask-sqlalchemy: fix upstream uri check
      commit: 75f9fe8bab85984e80978bc06ac9965e96831870

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


