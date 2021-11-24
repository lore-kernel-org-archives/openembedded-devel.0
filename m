Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31226C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 06:03:53 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.2680.1637733832491257771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 22:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZSF4gvu7;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id v23so1598509pjr.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 22:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=AvGv4MY3aZ9wBcQ0ZfH4Zu9mLRhBQNdWxgyNebGDYdc=;
        b=ZSF4gvu7FCx5QJLqfgrUfCi+MMwjN6hJyFjjMdp2P0ufkLmMYIZfurpe/ZsUURy6Un
         x+pOvWb05vofFk5CYAgk0XKGkJ1Bx+WD3T8b019V4LWGaGv2CGFNqs0EDxwI4WcwHqoj
         LAOiJyHVJmZVsebYPjSYu4pH6ly7fQJXt86VRNGQGpuJd4GC5u8dS3kBxaqjCqDJAJjq
         MHuClo6Mz8JOvzSrTiZU+EzSDFB9jiBXa8TBRAPrO7GVsDc/z4eVM2ILwF13TP5J7xVJ
         D9lQ0yf5PQsSXzfDb9g+Fptnyki2qvXZ+zS3MgPMCZqkPcncWCZcMKSS/yToaSLLGLqc
         kqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AvGv4MY3aZ9wBcQ0ZfH4Zu9mLRhBQNdWxgyNebGDYdc=;
        b=VA6oN/pP5/kyROwqISAm7tTMOnh2eGM+U6eZz9ExO5nx8eG0hhQzCJcHT/vkzWzx4c
         5zggKPRu1WCHcfx+QM+A5ThyAD12s/0JkXnqpQMlpqzz6y4AEcItd0ahyt9yEFFk8Ch7
         DHpVkkmZa+Z1iocfwmZvdITrJS47uVcKCZkPp5w5CVd2Wqt4ZqMvUHm1wDX8q3vvQOoj
         aSzCXf1TxRFy2kYIZ/nMfpycfofgq2tqSXWFvi8/dBYT9BUzYJ6KYaZuxmQ6HfLdGemX
         MK+OCSg7jlxIOwEQZt/4siCGTMnx5X88vIysC1QjYO93hfzrT/yhuaS1RzUmbrVPIB3S
         p6DA==
X-Gm-Message-State: AOAM531EEwLQ7RpLAlv1hm+wLp9X88RaYZ3qCKfXcy0p5+FoyrzWKrwe
	9pwIESKjKT822Akq9ZkMr4/A+jgAhyf+Yu5K1OeqIqzz3Hw=
X-Google-Smtp-Source: 
 ABdhPJwn4HypXwVQFpXj37ULsqv8l0+mCNI70Nn2etZ7NBKFoH8EapMTlBjJp6gsDsTQ3QcAnCVxQyd2Cq0GqDq0oqk=
X-Received: by 2002:a17:90b:19c8:: with SMTP id
 nm8mr11939069pjb.163.1637733831668;
 Tue, 23 Nov 2021 22:03:51 -0800 (PST)
MIME-Version: 1.0
From: Geoff Parker <geoffhp@gmail.com>
Date: Tue, 23 Nov 2021 22:03:40 -0800
Message-ID: 
 <CAHNuFGJOfXjEXhAGeAYOHCfhQ86c7C-rmfg+eat9KXvEXEWAXw@mail.gmail.com>
Subject: [meta-java] ant-native_1.8.1.bb recipe fails do_compile on release
 branches (hardknott, honister, master ...)
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Nov 2021 06:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94112

Building the ant-native fails on the master/hardknott, honister...)
branches. I get this error which cascades into other errors on
do_compile.

17. ERROR in src/main/org/apache/tools/ant/types/optional/image/DrawOperation.java
(at line 20)
import javax.media.jai.PlanarImage;
       ^^^^^^^^^^^
The import javax.media cannot be resolved
----------
18. ERROR in src/main/org/apache/tools/ant/types/optional/image/DrawOperation.java
(at line 38)
PlanarImage executeDrawOperation();
^^^^^^^^^^^
PlanarImage cannot be resolved to a type
....

These other classes cannot be imported:

The import javax.media cannot be resolved
The import netrexx cannot be resolved
The import junit cannot be resolved
The import com.sun cannot be resolved
The import javax.media cannot be resolved

Git bissect on meta-java points to 'b71a986 all: run convert-overrides
(0.9.3) script to convert to new override format'
when this recipe broke. However, comparing master HEAD to the previous
good commit ( 984f25b ),

So it seems to be something with the overlay syntax changes, but I'm not seeing
any obvious reason why the CLASSPATH would change.

