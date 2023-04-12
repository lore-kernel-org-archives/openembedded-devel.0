Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D62EC77B72
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 12:28:48 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.41693.1681302518594092115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 05:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kC5yz+i2;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: peron.clem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id b15so4293617qkj.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681302517; x=1683894517;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GpwuPOOE352SrSqiBsY/+1wVDIoZBvQu58RZsqfmkfQ=;
        b=kC5yz+i20Ydyv46iq5KzygFigzVaJqsJmR2Qd9T3JdqE95TaZuwk6X1EMhMxgnvjdj
         3kWwMUMg2SzdFatCJqg1nDEHi8yUs/h4F9qZPLFhDrTacT6KY7ALwRsAkBC09ufzWcex
         ScG8cJ5QBrMcIP2jp+WOQTZ6fBb91LqGUCiXjsp4QPEG0nPsM1E6n3BJ5TuIVYQxOQVe
         h8G6wtONIrPrBfOR76y1HB0rbCSKeTumL7CEEKPBFUf31aJEY3fzONlazp25fmh3I56e
         Ox9lTUyqo3yKYDX7Blt8xTUH/HbLEjbw1BFPmoAnETVk13oz2RuiVaujVTOjsRxG9JRf
         SXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681302517; x=1683894517;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpwuPOOE352SrSqiBsY/+1wVDIoZBvQu58RZsqfmkfQ=;
        b=zTTsfglxKXHv4OVgRexmV1s+DaGnuvhXhrtN7BJ6c84JTOPiJr7ICRsI6dDL5eNdEq
         hy36zhR9WrKkC0l54Hz0ev3Ys+x8Q9DbulYmmQs+zWEMHsPfUzTPqtxi80FPTwBwhY7h
         j4P5OY1moPvzpSYo30mFp1g3+IPBa6qJ4SjDeTqvwxqKQpHB1NhbfTY6QZ2Kj2GDGuxB
         Ih1kbaTsnYaINfHpGRA5KPDLKTXSQ+M9bbsxnwz9qVoA5RbaY1zgec4NuxlH5XR25TZ7
         ToSJ8LCBxac7LKJPj3qZO6XuDgbmkCLQ7paI+Gn7qxMWzk328Vnlacc7l55d6mo8PFmT
         FM5Q==
X-Gm-Message-State: AAQBX9ebSqy3DN7+RmLtInsitWbaNPEGqwBRpYBvWa8uVrRm3eYGtf1H
	JK89kt6qbgcTATauqHtDIvdEYurM8xf5BdK3UOM=
X-Google-Smtp-Source: AKy350a/z2g2eI5IbEbnjr/hMHU3S0oz5qdZj3Z7gLGWohVnjLoBjd1Vz8hQva1YzbrL+mq7pJiIU3cKmiOLUe+KKtk=
X-Received: by 2002:a05:620a:4306:b0:746:b87c:e2f1 with SMTP id
 u6-20020a05620a430600b00746b87ce2f1mr827435qko.6.1681302517618; Wed, 12 Apr
 2023 05:28:37 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 12 Apr 2023 14:28:26 +0200
Message-ID: <CAJiuCcfqsWps9Z+M8t5L6O1FQ=yTGtoWRGe_2RtDo2vM_o5KtA@mail.gmail.com>
Subject: Build nodejs application using vite
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 12:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102064

Hi Stefan, Richard,

I have moved to kirkstone release and I'm now using the npmsw fetcher
instead of manually using npm install in my recipe.

But I have an issue, It seems that the npmsw fetcher doesn't add
node_modules in the PATH.

So my recipe is now failing saying that "vite is not found"

vite is present in node_modules/vite/bin/vite.js

My recipe looks like this (not mine but 99% identical):
https://github.com/linux-automation/meta-lxatac/blob/langdale/meta-lxatac-software/recipes-webadmin/tacd-webinterface/tacd-webinterface_git.bb

And the package.json configure "build": "vite build"

Changing the
"npm run build"
to
"node node_modules/vite/bin/vite.js build"

Fix my issue, but is it expected that node_modules aren't present in
the PATH? Or am I doing something wrong?

Thanks for your help,
Regards

