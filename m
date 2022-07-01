Return-Path: <matthew.woelfel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAC1C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 16:13:40 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.40789.1656692016179287904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fuXupVA1;
 spf=pass (domain: gmail.com, ip: 209.85.210.41,
 mailfrom: matthew.woelfel@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id
 7-20020a9d0107000000b00616935dd045so2183780otu.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=+kcIQ1NBY3oYvJPyGCPk4hGvcPnNMyGnhG1zbSaNHG8=;
        b=fuXupVA1S/iHh0bIYmcmqpsxgw/W2kPUZSBdECiQ2r2r59ckScpng2KtnexwTRChEO
         02gF6QvCDGKx9P9YTUA0whW+mrIIz4imQCvJvBQq0n0IJcXsOIUYaSq0V0RR2Bq8xgmR
         dViyALTmNhCZpqhAZp/1aTCTmo9i217LUOMhjNdwg72Wt5N5Lkwt2zGn9eZUorQObxWu
         RjA197bNmBY+FWSIzb1KVgb5Gnc3ZuvU++xGhVqkE4n7sX9ZWnU2y8knFsAxOG2IOoI2
         s7a9EXE9yYRRRgqmVZY+Fm6siAZeFH8dUT0nh0cM8bRmfYQ9JguoVumQfwusZMT65+Da
         YSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+kcIQ1NBY3oYvJPyGCPk4hGvcPnNMyGnhG1zbSaNHG8=;
        b=QiGKEXNfVgh8Pc6zykMRSKgZu9qNwh1quwxV0Dhz2REAu4r8hvmRof7Kt+8rdE1XGm
         dKybW2eZhYtdCrdhmB4b3goAY+tI9tS68x6gj20yO/epuDqoIkHEQLzM35Lecg8QmqFZ
         akzChFdceDa0NV060HdpymdqRuFzlVaSn1Oab6qkOOvN2fgd+zUCYVTw2cow+WuHgUwz
         w2DHodLTR0+g7KZwHYNNkBkj99X3l2A7PO8E/JA+40eaW07kCuQjzooyQtzoR67FE6GP
         w7RO2c9RceczHL5Ig4whuyjkT5H/c2nU4aUmzhRgY+I/XPNOWhF6EqqF/vlJjQG1t/fE
         9xCA==
X-Gm-Message-State: AJIora99BD5VeAPQoHr98wge92VruowC8dViR6jphadeeLLzo56/6eOr
	2Wyts5eJYKqzCYLUJdUHDqb1Xy0A+V9wpnQyJazQ1uXIhfU=
X-Google-Smtp-Source: 
 AGRyM1uE/7aYldQzscDv5mN2tSwoUl/lrbuL/RVo2YOYF8GtdyM8Iv/E6D3GUda4jos5TXAJKP4Zpp6xnyQJqjLMVUA=
X-Received: by 2002:a05:6830:25c2:b0:618:980c:776c with SMTP id
 d2-20020a05683025c200b00618980c776cmr4625743otu.270.1656692015204; Fri, 01
 Jul 2022 09:13:35 -0700 (PDT)
MIME-Version: 1.0
From: Matt Woelfel <matthew.woelfel@gmail.com>
Date: Fri, 1 Jul 2022 11:13:24 -0500
Message-ID: 
 <CAOgNHrNVJnz0ad1GASf1rqdC3eQ=+LXd3_50or0ycCT3t2KpoQ@mail.gmail.com>
Subject: dunfell gpsfake
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000118cce05e2c0ab5b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 16:13:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97672

--000000000000118cce05e2c0ab5b
Content-Type: text/plain; charset="UTF-8"

Hello,

I have added gpsd (3.19) and gps-utils to my project, but gpsfake, gpscat,
and the other gpsd python clients are missing from the built image. Is
there something additional I need to do to get those installed?

In the build output scons shows that it's skipping the python portion due
to "python" missing, even though python3 is listed as a dependency in the
recipe and the gpsd python modules are added to the python3 site-packages.
I wonder if target_python=python3 needs to be set in the scons invocation.
Any guidance would be appreciated.

Kind regards,

Matt

--000000000000118cce05e2c0ab5b
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div class="gmail_quote"><div dir="ltr"><div>Hello,</div><div><br></div><div>I have added gpsd (3.19) and 
gps-utils to my project, but gpsfake, gpscat, and the other gpsd python 
clients are missing from the built image. Is there something additional I
 need to do to get those installed?</div><div><br></div><div>In the 
build output scons shows that it&#39;s skipping the python portion due to 
&quot;python&quot; missing, even though python3 is listed as a dependency in the 
recipe and the gpsd python modules are added to the python3 
site-packages. I wonder if target_python=python3 needs to be set in the 
scons invocation. Any guidance would be appreciated.<br></div><div><br></div><div>Kind regards,</div><div><br></div><div>Matt</div></div>
</div></div>

--000000000000118cce05e2c0ab5b--

