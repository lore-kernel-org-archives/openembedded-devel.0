Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06913C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 17:00:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.309.1648746033436408052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DnPgOmZe;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso23558pjh.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gyWMiSQGiajFsofp1ci/UoB6o4b05/qF/1Ew7W+C6Jg=;
        b=DnPgOmZe286/x+qee1MRZ8gJtqICYdLNBe+ojV4VZLoZvNvVkSatzflOJt4Rk7sRNY
         qApvbfVpotl69UfXIbESw3aYxxAZ5XYeis3irh29VvreFTwpnBw/K3zuxRsTKk0ZRMkG
         kyI03BJK5sUJpyzIh+H+Yoyt8DlnLG+FpxCz+8JwUJUjNiwP684BvM9LUzyuITbs4dGd
         t3p5Ck9eqDYac5ibWvwmnQ/+b8FFpYO9M9o2E11Vr1ITjWUAmcTVh6VEmwirgqHXe4cz
         N2v87U6mxmSPjlen8mTAiVsDY4YDbsRCglcH7s2oCY/R623qEtPUE6ACsunC4Q5ePwXN
         7xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gyWMiSQGiajFsofp1ci/UoB6o4b05/qF/1Ew7W+C6Jg=;
        b=nSpD9NYVE03J2U+xERv0ltkrhCedWe5mD20j0lRytJucWkT/vU0oObkFKwbbXSQ4BR
         Rsrnoj9IQa9EUegcU0S1gkiDHTna+fFDC5jTlPVsWJhGakCs0G3vt/zoJGQmzFzgJA9G
         FM3Mm15+6TwJPWiwziQFuQIqpsvMNxCLRHuIHv3g1do+KbrY5B+EjC8DYzze54mIAQdM
         PCm9nSY/2+eviY7J0rMEbQ3ZcVpk46qqDH11Xgdhw2oIb0u7ZXbUS4uFXnSoIsTMgmwR
         vc10TID5awfwDfRK564p9tpCouhWDmDgPsFgNfrXLvCrTywUIuy7bTxvrY3p8ArjdbrA
         9FTw==
X-Gm-Message-State: AOAM5332e8IuWU4AwgGP2Z1AOGmN9HR28tSjtOBYfSAUVRLjS4RuLBJ+
	knmbKULLq/iXtWoXEXNwr9gySPdLIGXxp47lrEk=
X-Google-Smtp-Source: 
 ABdhPJw5535cqoF+p69QAevNJNtjP6bGI4rPefyJTNqTOzkeBW4D/UjC1OaqvHjf+qQu6g24YLD4Hw+NPt++7ahaKDg=
X-Received: by 2002:a17:902:f787:b0:14f:43ba:55fc with SMTP id
 q7-20020a170902f78700b0014f43ba55fcmr42339770pln.3.1648746032766; Thu, 31 Mar
 2022 10:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220331064935.2763629-1-schnitzeltony@gmail.com>
 <20220331064935.2763629-6-schnitzeltony@gmail.com>
 <CAMKF1sr2BuF6+XEa5YG5Ezp4fq=oNYt6FFhzO8ByBH_XV5Y4jg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr2BuF6+XEa5YG5Ezp4fq=oNYt6FFhzO8ByBH_XV5Y4jg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 Mar 2022 19:00:20 +0200
Message-ID: 
 <CALbNGRTw-HJ9KapN0q4ezGn35TPcOtUv_RGRG=di2bL1XrSegQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 6/6] gnome-text-editor: initial add 42.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 17:00:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96300

On Thu, Mar 31, 2022 at 6:00 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> getting this error
>
> Build started at 2022-03-31T15:52:29.098624
> Main binary: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/42.0-r0/recipe-sysroot-native/usr/bin/nativepython3
> Build Options: -Dprefix=/usr -Dbindir=bin -Ddatadir=share
> -Dincludedir=include -Dinfodir=share/info -Dlibdir=lib
> -Dlibexecdir=libexec -Dlocalstatedir=/var -Dmandir=share/man
> -Dsbindir=sbin -Dsharedstatedir=/com -Dsysconfdir=/etc
> -Dbuildtype=plain -Dwrap_mode=nodownload '--cross-file
> /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/42.0-r0/meson.cross'
> '--native-file /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/42.0-r0/meson.native'
> Python system: Linux
> The Meson build system
> Version: 0.61.3
> Source dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/42.0-r0/gnome-text-editor-42.0
> Build dir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/42.0-r0/build
> Build type: cross build
> Project name: gnome-text-editor
> Project version: 42.0
>
> ../gnome-text-editor-42.0/meson.build:1:0: ERROR: Value "gnu17" (of
> type "string") for combo option "C language standard to use" is not
> one of the choices. Possible choices are (as string): "none", "c89",
> "c99", "c11", "gnu89", "gnu99", "gnu11".
Which compiler do you use?

Andreas

