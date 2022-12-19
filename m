Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1807C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 11:38:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.18924.1671449895191392721
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 03:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=BsMe5S06;
 spf=pass (domain: norberthealth.com, ip: 209.85.214.171, mailfrom: roger@norberthealth.com)
Received: by mail-pl1-f171.google.com with SMTP id 17so8801093pll.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 03:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=60d7rUH0wDXAMaonGjMdi7yQ+Bq6PphAdIiPegh+xV4=;
        b=BsMe5S069qdcXB3DZpVKjmS4kgFIWoykd7gmISdLcXUEVMdiTKPLbvD/VHboxTVFF8
         FKfMhB4slwrfEsaIctL+mKjbdRB21scFNBCMzJHjx6bHCJZgrJ6Iz/mFcx/yPvmNZm2O
         odwKsSzdsM9F1dlHWZnizHLb6P7UIuJ5oteu4XncpdVyKwYpW2YcsWglUJVvr+wf/Eag
         KGubCuLUkr4kPHlqAoEKtX1LI8+lM2fI9Z1jSTUDu/olOd+N1CnMa8M4X62OZds66soM
         ebkgu51oVw8rUTTgYLUUyfnRCkq9Zh37Swct0E0JgbKMIdvIXZKEnlGUkusMRqBndaXs
         do2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60d7rUH0wDXAMaonGjMdi7yQ+Bq6PphAdIiPegh+xV4=;
        b=WPa46930r9ajvImusFZiN4jmh9+2u/6SvEbrM8fP90BsZUxZHlm+D3y/cBqi7TcQAd
         xS9N4jtfjTSCGi6/izYQFwqICWFYbpgGKoJuQfQfmfQQtr9iyrxr/Fi9j7URbQboV2AP
         HCxqdCcuiVi904tUIZCCYdrlL9WC2IwAm7vxgOzXxrXKWtrtLw+nZu3reQUnGnmCyvAF
         dADd2t7ku4obeZMuMKS64DXPsyMeQxsU7pCb2z7Ic4AlMAIxDR/XC4wURm1aEHlWtBCc
         fPvf0reDQ1PwTPQJQlTw2nysZFxQRrE59OE5F1TTiUgCCZNuPYm6VI/l3E597Tgj9KpK
         jgdw==
X-Gm-Message-State: AFqh2kof8rZxTJJ0FRuoLYsJuvRHy6C2Uq40EyGssGqi8a+k9dKySqcY
	pq5rol9SwUswuGNyBMrvfPjAcNigvwhc47HTiQu43Q==
X-Google-Smtp-Source: AMrXdXtvz6dZ6bYfukhdt4JodoFSMV8c0aNgLUfVoV9GAj0bjCKK2vg3f44SHZoCatXWA1aV4iQWFOdvp2NlXvfzSRE=
X-Received: by 2002:a17:90a:358:b0:216:c8ab:3f5b with SMTP id
 24-20020a17090a035800b00216c8ab3f5bmr1676620pjf.157.1671449894554; Mon, 19
 Dec 2022 03:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20221216150348.19676-1-roger@norberthealth.com> <CAMKF1so09=dxnBJ9Dirn9hzfnh5eb-oJMLboQincHgAqQ92E8g@mail.gmail.com>
In-Reply-To: <CAMKF1so09=dxnBJ9Dirn9hzfnh5eb-oJMLboQincHgAqQ92E8g@mail.gmail.com>
From: Roger Knecht <roger@norberthealth.com>
Date: Mon, 19 Dec 2022 12:38:03 +0100
Message-ID: <CAO_iFwoRztS_D2fB0D0z6VQKDKKG0gNn9g8PnMzNRmKf-EC73g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] dlib: new recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 11:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100095

On Sat, Dec 17, 2022 at 3:14 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> thanks for the patch. Its failing on some machines
>
> https://errors.yoctoproject.org/Errors/Details/683901/
> https://errors.yoctoproject.org/Errors/Details/683900/

Thanks for the feedback. I will soon send v2 with a fix.

