Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE6FC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:09:24 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.21880.1664964554638876071
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=QFTFBMAy;
 spf=pass (domain: qtec.com, ip: 209.85.217.52, mailfrom: daniel@qtec.com)
Received: by mail-vs1-f52.google.com with SMTP id k6so17272776vsc.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=HcHl2s1cz75zM+N7OzbLhGEO6Sq5rLv2/0cUB19hRD0=;
        b=QFTFBMAyUgnzBYCSOS4ok/M9VDcwtWIYmST9yXF14WhtWMzJwavD2j+MjXv+yGZ2uW
         fknZDvu+fv2ADYbrTiU+VU9Lkrb+ol67nxP0h8xIJu4OKL6toBS+pNxrIc3Cf+9Gi4HG
         IXtWU3Jjx7+yFvOnS6CIOuC0hZ2dsbG7g65+iPfFxNW17q/ZXs+tkdHLQEoLbSOjbrvj
         5c5v/2oeR+yt8/M5B0upj12ZGA5r2yEhKZRef9uVV1OsBSMS8/mcDebUpySEzFr5ncN5
         DxtQ0TQt8vPkoDWedA4VIGdAQdLBPhiFkfmE+5NfqkH+tMSOkpYAuRD38RSbLkX/hbay
         HLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=HcHl2s1cz75zM+N7OzbLhGEO6Sq5rLv2/0cUB19hRD0=;
        b=fYmghACfTZiUapOeCc3h1DJm27Mtn3h8C6W7n8653IbSGdBOBeE0ctiBeB93LeahKC
         W/z0r2YlvApceShESWNnE3HMp1IH3d5P80qnJa9i/YRZhHmXa8ynkBpqnxLS/b+gFIUY
         WyPF+WjP7lkPmHMC70XrdAhZjUFiIB2Qk1ocTJw0Hk35Aqc0kt7dSl2sTfw0rfyCBjxw
         NV8KgXpbh3Unbt4s0RnglrzJ0vP+jUrea7UgnjMeOV8dUxEFF+yxDopiDO+9BCceRHk0
         okLwwUl18K3vGKQmCdc1NzkgQQgvnUjIx5brSjz1rDhv/7mqRQRuI1s4iWwGFCGVRO79
         33EA==
X-Gm-Message-State: ACrzQf11kdh2B2h++mSO+rTNKUltjyja6eDWCOjtYqmAJ8W3Iyka3cek
	xhb+hxVV8aerZDUJ48sB2eTMlvlI2eFV1QQf2b5T5bAzvbB8gKa9
X-Google-Smtp-Source: 
 AMsMyM65iAGHrbTrjk7qJC0YjdJXyaREfkE9uT9nGFZu9XLPnbaBpWM7khbndGdBCWsUf0rpPbJwiVYBcRefrmsFlNc=
X-Received: by 2002:a67:d50c:0:b0:3a6:8ed7:3f00 with SMTP id
 l12-20020a67d50c000000b003a68ed73f00mr5858762vsj.15.1664964553034; Wed, 05
 Oct 2022 03:09:13 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Gomez <daniel@qtec.com>
Date: Wed, 5 Oct 2022 12:09:02 +0200
Message-ID: 
 <CAH1Ww+S-uhfS5DpdVC2MALbOmxkQg46EUA2mTvYUzWYO6gHe2g@mail.gmail.com>
Subject: [oe][meta-oe] opencv: java package error
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 10:09:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99068

Hi,

I'm trying to build opencv-java package but I get the following errors:

|     [javac] 8. ERROR in
/build/tmp/work/znver1-poky-linux/opencv/4.6.0-r0/build/modules/java/jar/opencv/java/org/opencv/core/CvException.java
(at line 1)
|     [javac]   package org.opencv.core;
|     [javac]   ^
|     [javac] The type java.io.ObjectInputStream cannot be resolved.
It is indirectly referenced from required .class files
...
|     [javac] 9. ERROR in
/build/tmp/work/znver1-poky-linux/opencv/4.6.0-r0/build/modules/java/jar/opencv/java/org/opencv/core/Mat.java
(at line 1295)
|     [javac]   public Byte getV() {
|     [javac]               ^^^^^^
|     [javac] The method getV() of type Mat.AtableByte must override a
superclass method

|     [javac] 49. ERROR in
/build/tmp/work/znver1-poky-linux/opencv/4.6.0-r0/build/modules/java/jar/opencv/java/org/opencv/core/MatOfByte.java
(at line 3)
|     [javac]   import java.util.Arrays;
|     [javac]          ^^^^^^^^^^^^^^^^
|     [javac] The import java.util.Arrays cannot be resolved


Has anyone tried to use it? It seems something related to the yocto/oe
recipe as the project builds fine in a debian.

I also needed to add -DBUILD_JAVA=ON to be able to start the java
wrappers compilation. Otherwise they were kept disabled in the config.

Not sure if my meta-java configuration/preferred packages (cacao) are
wrong or maybe something else.

Any ideas or suggestions?

Thanks in advance
Daniel

