Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E984C47077
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.97663.1703665305562302250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lblgcL7R;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28659348677so3244333a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665305; x=1704270105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Olrvz7DsheduipSE1q8lhQiBg5mwQsxH5/bVsfUeD5E=;
        b=lblgcL7RbrdlwhK+zspSlcXW3UKdJ6miACdUF0xaF2eFJHfN2RIAhUqpKGEXiIniJA
         FGnC+GuqhxG/7aIejOQnhyP3ormocVS2ICWTDpWGnT6X80QhNAR+Hm8XRtdTHeKWxNmZ
         tjxrRlsLCmbTFOzfNDOdU99BOXeEjGTuRKxggtm9M+zZtcEAmOWIeHW4RYsZU0eDmLZ4
         CJ1ZOQQNI0LAP6fE73gzcBRhpYsoPjCt6WlY6FTEYRfqVPoD4zao8hVbxm8kTwueFRzU
         MiJnXCthTShbM87KjCoBtP4cXlypeGHKH0V8i245SBntFyaZtzbx+x+a4msbgs4qCP/Z
         uzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665305; x=1704270105;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Olrvz7DsheduipSE1q8lhQiBg5mwQsxH5/bVsfUeD5E=;
        b=b3hdtV6b2cM3KPI4wu/yvsaad3I3xEm7xbP5c1PYcxmYRvDa+4CFhYYMdOs9uV436A
         NyvHveIvKtlqrWZ5FW+Nl8BuXo6ndI5nY3I1iOUW+wd7zbo1xqSEywHaXg1vSWRANhb3
         aXFHRNGxRGf5U39+FPu3mKpfm4T6k4UeFbdvc3eUqYL+5DC8ckOzTGtl+cagHAnBlDf4
         RTFgVumSEShJ8EtExjfNufQ18C4z4IuU/b8WPMStvUrV2Z1EJBQRd7EIpKBNO/gAveCe
         mPZ7KRcXfxKhtTY1EriJx/qWRHe6q2f7vwM3QImRkk9y3BW4bqmdcScIxjoTlWClVybV
         Dktg==
X-Gm-Message-State: AOJu0Yyb15LakmjlQtuC18lJPRj/Ap1zix9bVEGrwmgZ1h6vvpGymuXv
	esjuKs8VBrDJWNUAPSbXFRHONrtNNrw=
X-Google-Smtp-Source: AGHT+IEYJTkubxNEyncxzn6RGcaDbeQxt99TEN9bsAlRFfLnlKVUWdT7NSS1pWm+pZdvNfGuORxegQ==
X-Received: by 2002:a17:90b:2503:b0:28b:e70e:b5fa with SMTP id ns3-20020a17090b250300b0028be70eb5famr8590881pjb.35.1703665304960;
        Wed, 27 Dec 2023 00:21:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221181237.3904447-1-derek@asterius.io>
References: <20231221181237.3904447-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-flask: fix upstream uri and
 version check
Message-Id: <170366530385.1947762.7494635682158004349.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107851


On Thu, 21 Dec 2023 18:12:37 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-flask: fix upstream uri and version check
      commit: 075497ce2d71cf63e47f0faa6c76bde8b7dc8f85

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


