Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974B3C30653
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:35:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.15880.1719826503947465460
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNejquwy;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e743307a2so3168167e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719826502; x=1720431302; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbDYn8iTcYQcXKsQBqSyFA/kbZ4NISC43YO14Glgq58=;
        b=FNejquwyPiMBBVrSDSF6GXrveKU86wpdH/kyhXqkmNeI8znjxA01zVgzBpXWg1FKST
         21Jo4Q4zPk+GkWMgUoRI4fceAPg1Pd4ZqCW5kTfTHF8766ZvgT6xXOjKLJ17N8C8aLRn
         EdtJIxT7piTvnJLhT5bk2daN4eir7ckIgaITGXJO2wxq9AxacIZInwCsH06eYoIhYKG7
         fzheDYQxjibpBuGgtonPs/q+r6aVM5dTljt4UOwKmutsWlb3dOy8AOWLc+VJLgR23vtZ
         fRVNDBbQxFkysd0zLB4IQ1SXyD1hEIIthyKQfz6IKkOyjrZ+fJjQEg/uxRZSgLCAODK2
         Vb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719826502; x=1720431302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbDYn8iTcYQcXKsQBqSyFA/kbZ4NISC43YO14Glgq58=;
        b=OmTDa2U0dzdsu4RupI8gFBLiU6SewaBIamSgKnsf0ZAqpauqrSbBSJwVDDLEytEHaT
         wFQ2WqIGODwPj5kjqVmnVjOWBDxt9KQ6rBohUoYCI7hnXcHqIO5sCDelpTVgPhsNgseX
         PXRho3y/IlJJXpZzfgVvYHaHHcfs0BCQWyDQOoSteZ5+ocyGG8NtIaYpsIg0vAZDCl58
         DXSwvguzq4Ovp++hC11c+PlDRglZ1q5Vj22tiks/376XFCfWedQ0m3lq0D56W6qSZ1HA
         tER6oHT4L8yPLPx4+8h5ZPz1QtV8w4SL2cFcWdD9Y71odWdGboC8nAggm6ljXH9/dk5l
         eznQ==
X-Gm-Message-State: AOJu0Ywwepv6gf7GRTVR6XjYRhVNvMYRusEHqHMhA3H6tAfd+lTG1CFO
	tkB6WDD+mz/XNdxQN8NzCnbj80I8P+rchxyXZLOgHQ9cu7faFimuWerAIeAo8+N+0C04Wr4EFHj
	NT4JrxJCjwZt4SOITRdzGy6t5llDffw==
X-Google-Smtp-Source: AGHT+IFJrzOwm85wjubrdbf30hcXaeho73dt8qw1FyGJeTw1TdnjJh+fFBuDlyCR+KdKRxIBnNGGWlRSV/2pDNq7O9g=
X-Received: by 2002:a05:6512:3195:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-52e82709247mr4278476e87.44.1719826501779; Mon, 01 Jul 2024
 02:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <IA1PR11MB641711E1B9EFCB32A7BA6845DFD12@IA1PR11MB6417.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB641711E1B9EFCB32A7BA6845DFD12@IA1PR11MB6417.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jul 2024 11:34:50 +0200
Message-ID: <CANNYZj_VyHskoFVvac_bv6HA9_=ta-zmEHzNcmnCESm7aqcXkg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] v4l-utils: do_package_qa: QA Issue:
 /usr/bin/cec-compliance uses 32-bit api 'time'
To: Haixiao.Yan.CN@windriver.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 09:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111195

I guess you can suppress the qa check (like done in time64.inc for
other components), and open a ticket upstream? But first check if the
tip of master branch has done anything to resolve the issue.

Alex

On Sat, 29 Jun 2024 at 15:27, Yan, Haixiao (CN) via
lists.openembedded.org
<Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
>
> Hi,
>
> When building 32-bit lib for v4l-utils, met the QA warning issue.
>
> WARNING: lib32-v4l-utils-1.26.1+git-r0 do_package_qa: QA Issue: /usr/bin/ir-keytable uses 32-bit api 'ioc
> tl'
> /usr/bin/ir-keytable uses 32-bit api 'stat64'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/media-ctl uses 32-bit api 'ioctl'
> /usr/bin/media-ctl uses 32-bit api 'stat64'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/rds-ctl uses 32-bit api 'ioctl'
> /usr/bin/rds-ctl uses 32-bit api 'ctime'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/v4l2-ctl uses 32-bit api 'select'
> /usr/bin/v4l2-ctl uses 32-bit api 'fstat64'
> /usr/bin/v4l2-ctl uses 32-bit api 'clock_gettime'
> /usr/bin/v4l2-ctl uses 32-bit api 'ioctl'
> /usr/bin/v4l2-ctl uses 32-bit api 'nanosleep'
> /usr/bin/v4l2-ctl uses 32-bit api 'fcntl64'
> /usr/bin/v4l2-ctl uses 32-bit api 'stat64'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/v4l2-compliance uses 32-bit api 'select'
> /usr/bin/v4l2-compliance uses 32-bit api 'fstat64'
> /usr/bin/v4l2-compliance uses 32-bit api 'clock_gettime'
> /usr/bin/v4l2-compliance uses 32-bit api 'ioctl'
> /usr/bin/v4l2-compliance uses 32-bit api 'fcntl64'
> /usr/bin/v4l2-compliance uses 32-bit api 'stat64'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/v4l2-compliance uses 32-bit api 'select'
> /usr/bin/v4l2-compliance uses 32-bit api 'fstat64'
> /usr/bin/v4l2-compliance uses 32-bit api 'clock_gettime'
> /usr/bin/v4l2-compliance uses 32-bit api 'ioctl'
> /usr/bin/v4l2-compliance uses 32-bit api 'fcntl64'
> /usr/bin/v4l2-compliance uses 32-bit api 'stat64'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/v4l2-sysfs-path uses 32-bit api 'fstat64'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/decode_tm6000 uses 32-bit api 'ioctl'
> /usr/bin/decode_tm6000 uses 32-bit api 'select'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/cec-compliance uses 32-bit api 'ctime'
> /usr/bin/cec-compliance uses 32-bit api 'localtime'
> /usr/bin/cec-compliance uses 32-bit api 'clock_gettime'
> /usr/bin/cec-compliance uses 32-bit api 'ioctl'
> /usr/bin/cec-compliance uses 32-bit api 'gettimeofday'
> /usr/bin/cec-compliance uses 32-bit api 'fcntl64'
> /usr/bin/cec-compliance uses 32-bit api 'time'
> /usr/bin/cec-compliance uses 32-bit api 'select'
> Suppress with INSANE_SKIP = "32bit-time"
> /usr/bin/cec-compliance uses 32-bit api 'ctime'
> /usr/bin/cec-compliance uses 32-bit api 'localtime'
> /usr/bin/cec-compliance uses 32-bit api 'clock_gettime'
> /usr/bin/cec-compliance uses 32-bit api 'ioctl'
> /usr/bin/cec-compliance uses 32-bit api 'gettimeofday'
> /usr/bin/cec-compliance uses 32-bit api 'fcntl64'
> /usr/bin/cec-compliance uses 32-bit api 'time'
> /usr/bin/cec-compliance uses 32-bit api 'select'
> Suppress with INSANE_SKIP = "32bit-time"
>
> After investigating,
> meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> #v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to #both 32 and 64 bit file APIs.  But it does not handle the time side?
> #Needs further investigation
> GLIBC_64BIT_TIME_FLAGS = ""
>
> GLIBC_64BIT_TIME_FLAGS = " -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" which defined in oe-core/meta/conf/distro/include/time64.inc was reset, so result in this QA issue.
>
> when comment GLIBC_64BIT_TIME_FLAGS = "" , there is build error.
> /build-v4l/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-v4l-utils/1.26.1+git/lib32-recipe-sysroot/usr/include/features-time64.h:26:5: error: #error     "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> 26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>
> the build error is caused by v4l-utils meson.build:
> v4l2_wrapper_args = [
>     # As the library needs to provide both 32-bit and 64-bit versions
>     # of file operations, disable transparent large file support (fixes
>     # 'Error: symbol `open64/mmap64' is already defined' compile failure
>     # otherwise)
>     '-U_FILE_OFFSET_BITS',
>     '-D_FILE_OFFSET_BITS=32',
>     '-D_LARGEFILE64_SOURCE',
> ]
>
> D_FILE_OFFSET_BITS was reset to 32 during compile.
>
> Is there any solution for this issue?
>
> Thanks,
> Haixiao
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111159): https://lists.openembedded.org/g/openembedded-devel/message/111159
> Mute This Topic: https://lists.openembedded.org/mt/106944631/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

