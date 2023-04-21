Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9F5C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 14:33:52 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web10.13562.1682087623376826168
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Apr 2023 07:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=xySIlVdI;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.170, mailfrom: brgl@bgdev.pl)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-44066390652so591216e0c.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Apr 2023 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1682087622; x=1684679622;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JwSY2AEJIHd/p6RRHvF15TllVF3fyZg06i4iXlsMJ3o=;
        b=xySIlVdIIWToS2zcroM7Aq7kM0rPII6Uf9zcto4HQBEAPPYt6y2az9RFyFNYhn9sof
         likGTOwkq5Y6yHFKlCsOx8okbwms0FVlG0G/oro/qcOQ8KeJPJrdfWVIr5Q1hj4p/woC
         ovQFXtInB4vuhPr0lAaySKz3W3U/hdWd5g/wSaBDqXVNuIndRv9YROus6mtmr7qkYtzi
         U/F+M2pGlzygEq/rXnFlkCNFzb/qepnzJ5M+ZaTlATDGXi4FdKtH00vPU9mTFFY1nlGn
         BDhiATbDR5e7hS7Oywb71yYZ/iZgtQ5vX1PAJlK3th5pq14lhSgfD711ks600UyzzzVM
         suJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087622; x=1684679622;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JwSY2AEJIHd/p6RRHvF15TllVF3fyZg06i4iXlsMJ3o=;
        b=QhBqaGMR8KcP83BS1EQB3JYM+2LNZ6ej9Nz5qB1w1HnKsoMFjVZpFrG3I1/HDYhg3R
         GehDtsM9pDwmKvxpT3Mh5MPAPBxL/vPYiAlObDdk33U7gGLvSJ9D1dNWwPolNZegq2Ow
         Ftn1zbHDy/Dc3cGmCPsIEN0jEqVx8haFepwc0bzoujmHJwBAjy/6GFTvJFSZtgR/ycN6
         JQ8TsYjla25MsvWT8CH07blaKof2gYVd/xbW3IxFxSTvGqIXei8nDswaJsypBwIoh41t
         PTQoAXYCjpYhKMg57Hf89U2OEDAlmU0Fkb3O8m3ORJUSLfj0xAy+9c+m7g/MZzD8ErTi
         wTAQ==
X-Gm-Message-State: AAQBX9eaJSqBCzhXC1xAQk5f3soqK3dphhFfqN0AFEafs9eY2MrenMzL
	CAq9VzkIP2WyMz/Wp3/0+Bs79jpt9o6o9C7L3Vkb7iGVKAHrx2bC
X-Google-Smtp-Source: AKy350a60jCvxtsTw/s7kCoG1sSdNmg68ISY9KK2zVDdbgTv6zSTl/A6QPfNGjHA2zDYJsdAyKHG0QDQKy3TgCKbcpU=
X-Received: by 2002:a1f:c193:0:b0:43f:f7af:6f24 with SMTP id
 r141-20020a1fc193000000b0043ff7af6f24mr932439vkf.4.1682087621989; Fri, 21 Apr
 2023 07:33:41 -0700 (PDT)
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Apr 2023 16:33:31 +0200
Message-ID: <CAMRc=MeKia5r3CP6ZavcdEGoeR1cbPjV+5ewP-8aYg4pAejS=Q@mail.gmail.com>
Subject: Depending on external recipes in OE-core
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Apr 2023 14:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102144

I noticed that there are some recipes in OE-core that depend on
recipes living in third-party layers which are not in LAYERDEPENDS.

For instance: gstreamer1.0-plugins-good has a PACKAGECONFIG switch for
qt5 which pulls in a bunch of packages from meta-qt5 but the core
layer (obviously) doesn't depend on meta-qt5.

It would seem to me the right way to do it, would be to add a
.bbappend to meta-qt5 that would extend the gstreamer recipe with qt5
support.

Is this done on purpose or is it just some leftover from earlier development?

I'm asking because I want to add support for qt6qml gstreamer module
but I'm not sure anymore where this should go - oe-core or meta-qt6.

Bart

