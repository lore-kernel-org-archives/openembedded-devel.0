Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC0C4707C
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.98046.1703665282675871514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=leYV6sf3;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28beb1d946fso4076321a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665282; x=1704270082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2Tv7RtEkqYjRxqSsxEED7iRFisi2Eq1ILE4L0fbTUE=;
        b=leYV6sf3annZ3NljrJxecpUWJZL+xJTuBivvDEyU0q7V/9yO9Ej8zfgpeh6cjt4vUd
         A/XHRpZD9CqIvssBHvTO1FpOHHnUyN3XAf3Vxp9KZ9pMHQRsp/8MQ4CTf5kIYEqfNXwi
         1gmOqlhmxeLWHcHlIsbtnQ4zHe6kNa54FfJbgLh2Un4VXzqVq4T9bd0UAWZw1CEx4Pfi
         reePPG7Q1JOa5PH8SpX5bCPsxDzwAvX/WYbQTh7So/QpUMT0kxLyVmoq6gaOhIoqezUo
         NPlxqkqniyQsWxzvwKuFdp0Go/MCHk52YJe0meRUO8XyiB5tuLL1vHXFj8lcLxLNnJMO
         ADBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665282; x=1704270082;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2Tv7RtEkqYjRxqSsxEED7iRFisi2Eq1ILE4L0fbTUE=;
        b=TNFUkNgOM+b7St/iE8i5wGm9JlJtA3CxDOf03RbnsoOGvmdOqfzXzveDrLOdm8bE8m
         W8rz6QMPmBFkNM6HdcIuvCHqEitsplVetr0vO1pplGSgjUX/3BS/Fw/9i5S0zpNN/ypX
         XWpWJL9AF/Ow7tDrR40Zd80fxo83J9TE57A9vsAL2rw9+ZdNIO52x2i5/sdewgchq2Zx
         cbZbULB+QAxK4VymTROaOQdnL/dByWryBzzQyCdWXFi5MepEjCO1bZHsRXNZFc0rRFIs
         rfmjCfnrPEaYcVCj9QwvwrMQxFv/oJGeLJTSwpy9BHWy4FMN0dxBzuEsQxZ8tu7GAkkO
         yLOA==
X-Gm-Message-State: AOJu0Yw6Qkmy73qKnBN6oSpRQdeQswogW/N4UVJrQGYyPQV7wqs1FbZQ
	7cCbgOgQK8NN4TUvJ+SGvX4=
X-Google-Smtp-Source: AGHT+IGnMknHRvLEt/Ly1pIaTILnkKuZ7gtnzMax2Wx306pf/jmtOVaXX5KyR2mavVR74dLGa3FVgg==
X-Received: by 2002:a17:90b:4acb:b0:28b:c10f:7c89 with SMTP id mh11-20020a17090b4acb00b0028bc10f7c89mr3621086pjb.31.1703665282098;
        Wed, 27 Dec 2023 00:21:22 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220222300.3808649-1-derek@asterius.io>
References: <20231220222300.3808649-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-paramiko: update to version 3.4.0
Message-Id: <170366528127.1947762.9681508083780254960.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107826


On Wed, 20 Dec 2023 22:23:00 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-paramiko: update to version 3.4.0
      commit: aa8317720fe4afba34d6cf1c276905739ab116d8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


