Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7194BC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:46 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.43630.1700452298776690872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAVaccMm;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6c3363a2b93so3829278b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452298; x=1701057098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TtnwzJQvwvjspJokerUY69uq397hoyrvN4mA3mFqZI=;
        b=dAVaccMmWUWaDJGr4V+OYAPI9VRnqi4TcyO+QGEbDM0iO9GldDMawuvw4yMJ/t4UId
         kUpT8mJD3zFMD+PfQyhR1tu8A0LFxRguN4h/pQhEaIMAtnXGO6v1fNoTdkaiRczOldWs
         jzlYrzKol0bXaAQ0Znd8uMMlzqw2Jdd06vtQFOmTCn5TPX5Iy0Jg9/k9xGulWWiYCUXC
         /3fopUGpwlv4vcjya5j5cnHT7LCkBmIFOQNlhh2P0oV9GS76fXdUVmQEHYSmvd9ioF5j
         sAI4zovztrv0jh6FXcz7fHtSrrH3h/0jXxdYdJfZcXkIqSQodcL7kpeUYRQk/zWdSe/a
         uz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452298; x=1701057098;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TtnwzJQvwvjspJokerUY69uq397hoyrvN4mA3mFqZI=;
        b=hshLR/uMorx5QQx3aS+IbAqdVSzyCPCqicfDn0mY5hoJxUCydaFFhtCQt+2PpyhGz4
         bdrBVK8pSqR7ikHeGsyzQ7mqO7cDxJXHfQcTt3QE88na4DVjTzkh2Mix0bOt4V5XEvr7
         cDIa8msTw1u4AX/FAThtqu3/EO4OwyF4n7+fm7H2pyG3Rc7Cqlkf/44tC0PcSly1s7M+
         nyb0YwZ8R/zOtxFbGjJjyP5yz2oTCA49IKPPOUicIwS0BQLBtV2j+pTbFLzvwacCNGF6
         2qOxaSDA+lQjvIptbUFzkmpIHEtzWzILfngfB/lH9hfquI+Wxr59p8s1hZJS7R4zIeKV
         sgJg==
X-Gm-Message-State: AOJu0YwhXVVYs7vVqAZVj6oDYrZGEODtvRqT6y/dLLVvp+k5zL/7Iw1d
	gPHktieGKpwhOMWPyz7TdOuIZ5ReZKAikg==
X-Google-Smtp-Source: AGHT+IHXdko0Aa06vSDgyS3raS2K21qIfpaCHMmLB6BRIsd95yjOYuJTb4r0hR3vlf8iNs9vRPME6Q==
X-Received: by 2002:a05:6a00:1304:b0:6c1:6695:a6e0 with SMTP id j4-20020a056a00130400b006c16695a6e0mr9180167pfu.23.1700452298220;
        Sun, 19 Nov 2023 19:51:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231117193223.7359-1-alex.kiernan@gmail.com>
References: <20231117193223.7359-1-alex.kiernan@gmail.com>
Subject: Re: [meta-networking][PATCH] mdns: Upgrade 2200.0.8 ->
 2200.40.37.0.1
Message-Id: <170045229723.1416826.1349899806751717749.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106953


On Fri, 17 Nov 2023 19:32:23 +0000, Alex Kiernan wrote:
> 


Applied, thanks!

[1/1] mdns: Upgrade 2200.0.8 -> 2200.40.37.0.1
      commit: 1ae1a7cd36240b259ea56b25a7d8a86d8dcae5a0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


