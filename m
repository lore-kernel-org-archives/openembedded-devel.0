Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2554C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 07:25:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.3479.1642577108426903329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 23:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=qJT/Rglp;
 spf=pass (domain: google.com, ip: 209.85.167.42, mailfrom: wak@google.com)
Received: by mail-lf1-f42.google.com with SMTP id d3so5544813lfv.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 23:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4NF+ChgM4dx83JNeac5Yo8+iv8qMCKDwBMOLtufkZOY=;
        b=qJT/Rglpbxqxyf8zZGS2QxvXWaZDen/LLND2/CNjD5s9diZeAut4UX7njllF/Nn5jJ
         XBZiM5Ieu5gudoawitC3JAZmIHyORcsab2gHcS2Anikc3CUH/BLXhwKC/xVAgbMyasHz
         cWnXkHaI9AH42VdVq5vZbw9ZkPwiMfXUQqyjS/ZI1mB5CH7vzrcuopReAaeidSDOys38
         vrIDQxAp5bubGVYW+AHB7Znh3sH1CDxUvz5h7vVlxde5KOfvwfDXiADWd7mtjJyCZBnx
         3jTB+/EAPObCDFd/Er3sgx7G+hXQhkd24u/BzRE5iCMxj42PHF3nVJsPx6cIKS/PZqV0
         NBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4NF+ChgM4dx83JNeac5Yo8+iv8qMCKDwBMOLtufkZOY=;
        b=xyXuVWPGNfmtpudkGC/NVtbKcYdfDfjtiP/sFq4E354OfGDniJbIkeBs1OpId50oxY
         CP6WeWf59w7CFARMBVOCEd9dnGzKBVxa3jdvZlnVyX09A2xwTf6SiOKbOpsXylg+2azg
         IClWnUzLGLyDxd7VkXCAr/jepSgnr4hOwePesX9sxOGWxQKlw96DvjWaln7syNBrz9Xc
         WNa8/Xqw1OyaMYGsMV+aIry/t4rGluWjZylyQm0VkdTI61YyrYqCtwBklZQggYY97HUq
         CF+7ySMYfP6o7Bu1NEB3el7qkom1irp4jP+TYfd/vQkv+EOCwz5LlNzvJUehVt3yhOsQ
         5Qig==
X-Gm-Message-State: AOAM5311KcSVf085VB9SSr4rnA4IYKjbyav2aKffXzeSWGvqb4cc1bQn
	soSZu4UvUv3QavmLk4WX7lYgo3xLMgoJ4Guvi0CjTA==
X-Google-Smtp-Source: 
 ABdhPJyV5rCKKj5DF6EbJZKB5rJCZv/g7o7VTpomMEb4wLK9aIPgA2NpcvRfUT1nzB9WITjugcC4oaqP9sBtu1bvfkg=
X-Received: by 2002:a05:651c:1787:: with SMTP id
 bn7mr606693ljb.44.1642577105869;
 Tue, 18 Jan 2022 23:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
 <20220119040759.859566-1-wak@google.com>
 <CAMKF1srM_bJP0vJtXcY9fyzJ5p3jp2FF2FgyBYeLNi3Ay3gJjg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srM_bJP0vJtXcY9fyzJ5p3jp2FF2FgyBYeLNi3Ay3gJjg@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 18 Jan 2022 23:24:54 -0800
Message-ID: 
 <CAPnigKknE05HtWVZi5mef9_AODchanpJ714ky1_b_CFA89pbvw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] jq: upgrade 1.6 -> 2021-10-24 git
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 07:25:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94938

Totally missed that, apparently my distro is out of date compared to upstream

