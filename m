Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E2AC4707C
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.98039.1703665271148455650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJbmk2qy;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d98ce84e18so3299890b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665270; x=1704270070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXcUPyBxVr/AonK6uEkkfOwYnGOj7Wewek4k5SPzNB8=;
        b=gJbmk2qyPeTK8mgz+76Vy3PpVqjv2bo6ogqBhNyKGQQYH97VkGTRHpJNOlPwvapcwI
         cSX7dqVl6G9npQ7h8b5kzDNoEs0cpy0Nuy2lLaZrVrgvjwYRYKHh3qdbowahQFStJP4F
         NzG9DPEUbeuAlyWPm/iyIYyM2iwKAJ1rSjJEzm5pTthziGC+AKrOAW3wAK5JxcnxbfM3
         505ybTtSRPlH8jMssTpPakp0zL+132YJSXqn1vCMPHP5tj33s4lI/7f54Q5JkKf2mcXa
         BurgA6MlN7ZxORSTWuKfW56QZ4RmlZOIUGyaC/JHv7B/Jkn3eiTW/7CT9S+Jefhf/xmp
         MVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665270; x=1704270070;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXcUPyBxVr/AonK6uEkkfOwYnGOj7Wewek4k5SPzNB8=;
        b=N1/CCekK4CAl188pT4/2nsRr2NtZa4FRLn6bcTP/9xsl/JbH16IzOsXoMRjf4A1FMc
         SID/oLflHN+VHWr/0rJAeswjoqVMZdxvbYN7kDBFcVBIWLvpkULuz2G2gZurJ6aY3xr1
         MLMM97+JV07GUVx6v4hLB2aGJpB0VjJy271uiTYh/AFb3+gQA4ArIp0tS8jr1jnMEy//
         EzMT03z/HKZZYXe0IacYurLdRh8bKX2bX7qppsoADyNSpQA23k4kEBhE3Pl12+Q2eiIM
         GENyoF+SJxUi7uIiJsyi8gZP6Z4IX9sLtlLIJkNXu53Uq67Ttq88mxoowTNOeeKUm1cl
         y3cA==
X-Gm-Message-State: AOJu0YwtZj+ty/QXVWCynbdrmLjtlk3HdzSkpzyAfZeVReyjTStCPw+i
	zF9UJPQWKHMeN0fJ1w0gm04Xw7VMbUk=
X-Google-Smtp-Source: AGHT+IFQNCgMjIScnta3xs0TaaMAbIcP0Xe1r++n5ZzawGr2081KDy9+ePNPVLBSicfcz/JZScqH4A==
X-Received: by 2002:a05:6a20:cf14:b0:195:1bcf:3aea with SMTP id hy20-20020a056a20cf1400b001951bcf3aeamr6792908pzb.28.1703665270471;
        Wed, 27 Dec 2023 00:21:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, mingli.yu@windriver.com
In-Reply-To: <20231220065648.3032297-1-mingli.yu@windriver.com>
References: <20231220065648.3032297-1-mingli.yu@windriver.com>
Subject: Re: [meta-oe][PATCH] tk: Remove buildpath issue
Message-Id: <170366526959.1947762.10887275374376613081.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:09 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107814


On Wed, 20 Dec 2023 14:56:48 +0800, mingli.yu@windriver.com wrote:
> Though the S defined as ${WORKDIR}/${BPN}${PV}/unix, but some source
> files come from such as ${WORKDIR}/${BPN}${PV}/unix/../generic, so add
> "-fdebug-prefix-map=${S}/../" to fix the below buildpath issue:
>   WARNING: tk-8.6.10-r0 do_package_qa: QA Issue: File /usr/lib64/.debug/libtk8.6.so in package tk-dbg contains reference to TMPDIR
>   File /usr/bin/.debug/wish8.6 in package tk-dbg contains reference to TMPDIR [buildpaths]
> 
> 
> [...]

Applied, thanks!

[1/1] tk: Remove buildpath issue
      commit: 4bd31c4915094071a114fd5339e0d9db8dcbb11f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


