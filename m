Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.12318.1620907612931845286
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 05:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovuv0Uc3;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: andrea.adami@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id c17so21551437pfn.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=1ualdreVbPKZKi4wL0MNzuSXR/0ccKWRzuUBO1ryqLM=;
        b=ovuv0Uc3GTMReHr8QhcZ5LZwC34PzH3U0nSOjFpZejf95bk8yQTz6dJRDzxQdpALWJ
         upGvkozOP7/0oN/j8LQjnzuw01VxaNbN7aKII4/m9P94psMe7l60X38izg/lN4IjkwoT
         czPZd1Y3uoyJgTJJkT/105lRrEbTwe5pfpTGslkfriTb0toxc6u7FQp7Deq4TGIEefl+
         QWi2QFILsFIRt+IDO5RV1f7v4jBcfJW5Xbp0J6uXNyBZ3cY6ii91uZqBoiAv9zp7GocU
         jRPJvUkRev8LsHUdXfenKJibN6d8nGjxoucSLeni/5MLot0zS5vUdY4efsGA8lHLlcW4
         MGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1ualdreVbPKZKi4wL0MNzuSXR/0ccKWRzuUBO1ryqLM=;
        b=i7Et1rJ+7zx4xb/39+KqTHQgr6RjK8fPKbfXT9oZE+nkhvOqvApDy0/IAn7a5kTN78
         4w+Lb4XRp/KjV7phlYQUEuDDBAuRYsL8USjjpobIlRI0OAoCpJH9ITzpQ4PI+gH7maDA
         MaGEibTfurqBJM1/z7Jta6V2dWeV69XrFNGzw4vBpx8XLRqEkZtR6DV5NZypVt9GU+c2
         ZB3NSeoFFnXWMVEgZO+WEibPyoflNcb8r+qcvPWSwnQDRwEB9c/4sngD1B5rgS/oqHBV
         gs+SmAODpMLqHHVWlM7dqvtpf9jhjGoJDKZvoAuidkjNl5OQcU1s3G3WnEm59kBw2qVo
         87qg==
X-Gm-Message-State: AOAM530H1hOzwK0IiGdcFsYdmzki9nEe0Pibf0/9/ExmmIihHhQczE+V
	5LD5bQ6A4jT6svm/bhkZkzFn2LiJ0FtnXyZrWf43cfp0
X-Google-Smtp-Source: ABdhPJwW8ovAlvr2Qd0U0A6mb2gr/Gt8lljvYbEXXi/DIiFjFplH2UBFrZjs5F2oW5CtHYnpGvf2rc/P/7J3CJsPCyE=
X-Received: by 2002:a17:90a:d90c:: with SMTP id c12mr4719797pjv.129.1620907612425;
 Thu, 13 May 2021 05:06:52 -0700 (PDT)
MIME-Version: 1.0
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Thu, 13 May 2021 14:06:41 +0200
Message-ID: <CAAQYJAsVE=pRACzk5XZxHQu49fLn3vM5USM88TYOXU2k7LR4Uw@mail.gmail.com>
Subject: RFC: meta-oe recipes split
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,
I was lately diving in OE-related layers used for DVB/STB devices and
have noticed how badly anyone has moved from the OE-Classic to what
they call OE 2.0. It was not easy.

The problem now is the distros have custom layers containing
.bbappends or different version of recipes for some good reason.

Examples are the duplicate  recipes-support  recipes-multimedia

What I have concluded is that this is in big part our fault...the
recipes in meta-openembedded are really badly splitted here and there.

I remember we started to pull out of meta-openembedded/meta-oe and
create meta-initramfs, meta-networking,... but never finished.

I see now two options:
1 - put all again under meta-oe
2 - finish to split out the recipes in the parent layers

I know that some layers had/have maintainers while meta-oe is more
abandoned and I don't have almost any time  but still...

My 2 cents
A.A.
