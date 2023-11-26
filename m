Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF0EC4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 18:39:42 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.61713.1701023980301147329
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Nov 2023 10:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BBMnTtl+;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso2612811b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 10:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701023980; x=1701628780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XChk7y3toG1Zo4HNGO1YMNLcPj02ffAbcoA/IkRoN/M=;
        b=BBMnTtl+AsPZ2JD3kLKylVADe8vBPDElMoCkq5aI1ouUOpwDyZFzLbiIuOOnXDnHHW
         dksrfX8Xjb/zQRoqYZqekybQFNQ4Hd9UCMp9RNQM6w1ok8LObm8nCpVKlRh/GgPupJnl
         QjMvHW+bVVt0yfiKyIHCNB3q3CwuE5RPj8k18dAw/YVkEKraXsrYHJy5z31PN/5129Vt
         R4T5w1K2wioiF4+MbFHAZ6h0U6pnVWQyocGsngx6j+68VEeHhCNlRx7HdywwAGNC/qfT
         so8CcpLBKSGXYXLbTm+30XAF3YwhTPNP3CXcmGya6CQtneWFNiskZYrq4sUzGyhFNRtm
         nSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701023980; x=1701628780;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XChk7y3toG1Zo4HNGO1YMNLcPj02ffAbcoA/IkRoN/M=;
        b=VNX9a1zmL1rW9yVoWZ2FqHfw0/p9npWNWreDaQ91fZwK814uC3tc81ugJ+pfRSrySN
         LsfS1cP5bK6i2tKSVyh0B+D68OuMFQNaOMcLg5z5EMLbjgf1KpbH3oHbAMjbUdMjk6xB
         kR2r2cvx1oee/R5H3cRyPjz3MsZOlphehJ0olr/2lgN5AZBSO4nGlGDV5wNtMHO+VjOU
         RlKm+zvXsi5brNl1G4sztBz/3XwePrhg7w3Ad/FhAVuKVTgek5k0Gh6Y5dUAr7l+KX40
         7pOD+uNdREJ5Xoomfe/QPRcAl1aArKMsLgSffH8nd+/5x78foXf/G7ynOj1Fu82Kp6vM
         ejCg==
X-Gm-Message-State: AOJu0Yx/qM4DzmE1s2VuA6PghQWwC2WyfFdlTuKQzAKIe0tdujyJ3KCr
	k7HtPlDfVVjvqM/nO93rLTA=
X-Google-Smtp-Source: AGHT+IFnEQub2i7wJnxkGOZ4zxPXwL0qBIo0a618u9ZrcuQhlV7P+ygV4JrzLWdHkJ2pOAAyIDdsnA==
X-Received: by 2002:a05:6a00:1d07:b0:6b2:2a2d:7a26 with SMTP id a7-20020a056a001d0700b006b22a2d7a26mr8403354pfx.28.1701023979669;
        Sun, 26 Nov 2023 10:39:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id ei44-20020a056a0080ec00b006c988fda657sm6157448pfb.177.2023.11.26.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 10:39:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231124183741.997723-1-f_l_k@t-online.de>
References: <20231124183741.997723-1-f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH] cups-filters: fix Makefile race condition
Message-Id: <170102397865.3308314.2660995051817065087.b4-ty@gmail.com>
Date: Sun, 26 Nov 2023 10:39:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 18:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107052


On Fri, 24 Nov 2023 19:37:41 +0100, Markus Volk wrote:
> 


Applied, thanks!

[1/1] cups-filters: fix Makefile race condition
      commit: 304fd6a06e17add7fac0067a32a356874fb247d4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


