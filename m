Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306D1C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.31069.1702451250755709789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W2YXLeac;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-35f6993ee96so5053375ab.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451250; x=1703056050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nM2mnN6dSkvVh+9eDUGLEiARS5qC4tdhYMi/pnMej4=;
        b=W2YXLeacGs+xJ0QMtZ4GS6drOh1OtfeEVtupvwd6rrMuBYuioGqPq7qgsl8rprb87r
         ToHu09i9NJ78YnnIpaykmZ0e/KvrMORoqvtPpg7hXPUt39s0J/BDEIPVXocVKvjDDZep
         cxdynL9Yjq5L14FgLwDHXXn/H9+E187fsPPKMT8S03VOSrHFooGybTG32ddmhbOfv6IH
         i1gwzP7y0SsGts953KLUMKaRIz2Zn+A1V9+hXwAC8nelzS5KE59JAhvhTyTDVytMTUwZ
         MUAkFqUQicUkXqCgLydj+eKJ5bpPi1yqsLUiAdutDfauebXqdaypP6jTt4brdZbochMG
         FcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451250; x=1703056050;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nM2mnN6dSkvVh+9eDUGLEiARS5qC4tdhYMi/pnMej4=;
        b=sVboNR8tPo3BQbvpFtjvyAOoHA0dfbg5XxnMymN10kBRlO+aT7cZKOXb3oWvu/JGr4
         ALUMFvxVKA7nvmQ5dZEn+aoZ/Obqwtt5sIrjroBPtBFmqNg1TXhsyHaiTyj337q52M6F
         BNDVwGYc+6wOMgYGzaBIv/8SCw/ofVlMXy+vsUUzTx6aOlwBZslAWbLPSpq5R0mV60vJ
         4+riMpBvAK5SbzPnNOzrsr6/riw7PSYkOBuObiQKl0y3Uu+T57ZCSm0J8vV5EO36krok
         i8B+JxmcXxJ8cy2j5dymTRpHbXbYyO/KBpIEiDL4AbT5Lej6nMUj9B7pMRuVSphh9xt8
         Tdfw==
X-Gm-Message-State: AOJu0YykfP8k25kWjCO6APWr37vBpFmMSrnO1Mz3Sr8/MaaSVEcyutIj
	Idhk6cl/qv94c0fWLOIQ9rxJwaiuFpA=
X-Google-Smtp-Source: AGHT+IFIKfh0H5kHI3s1W3j/GGnZvXkE2/PA+XAN8ujV7HmMRFdJjdK2mxwR7RZUA6oe88Z/4xyZ2A==
X-Received: by 2002:a05:6e02:18c5:b0:35d:462a:afea with SMTP id s5-20020a056e0218c500b0035d462aafeamr7506244ilu.21.1702451249755;
        Tue, 12 Dec 2023 23:07:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231207080021.48450-1-alperyasinak1@gmail.com>
References: <20231207080021.48450-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv2] xorg-sgml-doctools: update summary depends
 and inc file
Message-Id: <170245124914.133993.15809538392967462951.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107368


On Thu, 07 Dec 2023 11:00:21 +0300, alperak wrote:
> 


Applied, thanks!

[1/1] xorg-sgml-doctools: update summary depends and inc file
      commit: 959f6a5da8e15d628be5cb5bc836b32561184f05

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


