Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE54FC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 11:18:00 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.23902.1656587872700427344
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 04:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CWz6Qe7S;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id z12so14136415qki.3
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=kA3kVZRAuVDqoqhxh1Lfr9GhUJQMFsVb/cE32lGRWj0=;
        b=CWz6Qe7S9w/2IXbZ/bhGTh7V+jZPnBVAJiKwbIpl4GGBhECJGRfyiG/jau2DgRNd9e
         3DrKu6FGJ2j+eTawPHZhXyLRwy7oJ8jxGjTW6m+Eo7tza4IryMP5hzpLn4Lm27xusUMN
         E6PE6bHFnDMHEdorip/g55Li61UKlKoD4nQUmg49d5+Ritp3nLhF+hqhPPxXMAu0gERN
         Gj4OZxO/zcGvZIhRUeHwH9OsTR6CIDs9hjCQRe4wnNt5QX3g4NgDAhvGR9w0W1iCQ659
         Vs5Ig7vrhZxsHabgaz2K7OGs+TuOqbf2w11mStAlQVUDfFe/4nRdgodWvIKSozRpN8g6
         YJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kA3kVZRAuVDqoqhxh1Lfr9GhUJQMFsVb/cE32lGRWj0=;
        b=BSDsZlVKtPau+S5iL23aUUpJxb25NOGLDWSLY7pITSRg90c+fftcFXgJEpVCkjMFvc
         4K1AjtBqQnTS4anmwgjHliuv5Ftl+At5rYxvRUCiJMhufRhxteDVNrynmWs4wghpKGyt
         pMZClT1I0nIT+aaSvpl9w3rXSg58qsP0TPprv4MyFVZfZceEBeQhe2rruwYgVch52SdT
         JqiWQQYPlsy6FVGFQr1y9WvEEnNuJr3JkqW6tToQ68UMKd5l/a+77n18YOes4zEwliO4
         veShrVVeu5B9koVgM6rUTFmBUlmzTUrCETq2PkQh1jW0DDUe7/4QnnOLW3veiJTx01rI
         lt3g==
X-Gm-Message-State: AJIora/XkgraAiS/2MU/HB8+3rmrV7AF5NYw+VwLhPR4WtLF/ayKc1iF
	8Nx4Y+tQ+7PmWi29rAL0zCG9BHJpCKSilHMQz0ITt/0iBaFzog==
X-Google-Smtp-Source: 
 AGRyM1sHSGT1UlzMGV/4VA6HoR6LiOXgjXnM4+J2mt6A1jdi2sUaXKResbzIl19KDq1fYWbLlBTqySXqjFw/QcsnqWo=
X-Received: by 2002:a05:620a:1728:b0:6af:59d0:d87f with SMTP id
 az40-20020a05620a172800b006af59d0d87fmr5796424qkb.149.1656587871329; Thu, 30
 Jun 2022 04:17:51 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jun 2022 07:17:25 -0400
Message-ID: 
 <CAMKF1sr=LtPvBaH-Tj5QQ8ZB641cLgrOB4sK47DdJ1Xnug3wSA@mail.gmail.com>
Subject: maximum shebang size exceeded,
 the maximum size is 128. [shebang-size]
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 11:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97639

Hi All

I am seeing few build QA errors during do_populate_sysroot on native
packages predominantly perl packages failing with

maximum shebang size exceeded, the maximum size is 128. [shebang-size]

This is the list from meta-oe world builds

https://errors.yoctoproject.org/Errors/Build/147810/

This was working fine few weeks ago

Any ideas ?

Thanks
Khem

