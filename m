Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1C7CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:46:32 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.5423.1758653189632830298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lz3BcD4D;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b2e168f0a75so346557666b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758653188; x=1759257988; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GxGtxJ3dTGlsnfkLcv6MrQR8pmQTry3snJl0suS5eqs=;
        b=Lz3BcD4D1m3rdxgRUhb9wXl6STpR+6p/4XBKIm5CLmVyZssEAtzDzS1fLX0gMoFWf+
         hz4y1KvAb4MhG2FEB02C6YpEOCdFId/BumRVmV7OtnIJ1AG6KiyUAjaSukOp6gaWNQkT
         ZC5+JkQ/bkI8RN2wFzSIcQlNUwfw0UhlA0q9yG1S9EnyzsvT3D4B5MVpYkLN2h52fPkW
         3RsKD3eKIQCGlf4kHfrV7vpXpuJAET6nsSFRe4O5+HrJij6EBj7xMi8cxrTLc5umfs0m
         yVj1MG15KwnTOB7JYHszqvPn8ccO24EMrPFtLbAGkGdfAxrzFlvhPZsV00q/kRLRWqYd
         nLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653188; x=1759257988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxGtxJ3dTGlsnfkLcv6MrQR8pmQTry3snJl0suS5eqs=;
        b=Q0qHmCgiIrOIOBPRndWDv/+dbXcFvmOOd323EIxr0aqpJsIIXIA+ySLtCFeEar61E9
         D5tC8JZzf7XASK0L5jKuNqADSscJCUsmRSvs5e4hqPB/PfFTUs3dEwQtJV2IU3ljEVsp
         bUS5WJHRteMMOVA3SxxbhoCvPUy/g+JO4xuLG706sZDxjxrM7Wd4UYLGLIVMVp4rPOB6
         DH3XjZaGcuBWGbHn7I3HzkavXeQ2oAj55UNUsUgAb9vsu0py4H4EBEJU9d5p1ZJ+Y+lB
         p1hDuyXYI0huTSqE4ZMZ4TOda+HtMeRCo88ZDA/8tKObdYu2S1RafaK90jDGvUtiZldp
         U2YA==
X-Gm-Message-State: AOJu0YyKPK0dT5DU3Wh324a/2GmvmsSyX2J4F5dc23FmNCEmc79aYSAQ
	nAq/99q5Jf6wXaMGvaoagnWeEB5iy+i/ya9bATN8NCQ3TiEWucusc08fxMXMVGBY
X-Gm-Gg: ASbGncv0NQRGxbFm1+ohrWvhObecCPDvqhMY05dsviQb3GGgia0CJT4k3l1gg0a/H4F
	9QJVVy7tU1K5jx8cTvJ28mcJcg7MLO0cfyJ5IBTkS8bF1qPeMV0BFp9UQYNTghurMb2oiSHoONl
	JMQflS3c8Bh0KW1Pfubkd9yJ0ec02Nx37dLFJpXN1yEjfG+gpfHEOMn7wiT14/wnOGu2fF2Vj4M
	1IxzRwHLBlQ9SAvj+tn9TkOe2te/GwspsUTJ5+xrAErojD3zmPvNLAjibgqgzpg2HsB9tJ36MG/
	pCfhjhzE/EUUnTw/kiLp7OqXhVJTQxlf/sCD5gBRWKXE3ON3yoozS30M/Ri1JniAhFAxAPK0tzs
	bfeCG9rKvSNcv+W34DukjMbpFd6oMvIU=
X-Google-Smtp-Source: AGHT+IEmCpTkNbKkT5O1Cyy4Hj+klTDvENUXeGLm5bu/p6UWPp9DUkpMrV99N9Sl3lGUtYV3PaQrmg==
X-Received: by 2002:a17:907:72ca:b0:b04:315c:8760 with SMTP id a640c23a62f3a-b302b50c083mr356575566b.50.1758653187860;
        Tue, 23 Sep 2025 11:46:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa077desm788578266b.55.2025.09.23.11.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 11:46:27 -0700 (PDT)
Message-ID: <30ed57d9-43e3-420b-a8c8-92bdbba0ea3a@gmail.com>
Date: Tue, 23 Sep 2025 20:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 00/22] Cherry-picks from Master
 Batch A
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250923110636.3413021-1-skandigraun@gmail.com>
 <CAMKF1sr241qM_Nwuf3V6jSQ__6SH-iNQqK1uWf9p5A9a04K_cA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sr241qM_Nwuf3V6jSQ__6SH-iNQqK1uWf9p5A9a04K_cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 18:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119732

On 9/23/25 19:51, Khem Raj wrote:
> The version updates can be a bit dicey, since they may change API
> behavior that can break existing apps at runtime, its tedious and hard
> to look at every change that got into that release
> I am hoping we have done due diligence here. Overall, it looks fine to
> me. Please combine all of the proposed fixed into a single PR for
> final merge.

I do what I can, and do spend a considerable amount of time consciously
evaluating the version bumps, and also try to be conservative - but I'm
human too. And the number of changes that I'd like to add is not small,
because I feel that many parts are more outdated than they could be,
while adhering to the rules and expectations of LTS and stable branches.

However I definitely share some of your concerns - and with a lot of
commits, there is a chance for accidental mistakes, despite my intentions.
Would that be maybe better if the version updates would be spread out
more over time, over months? Like I could send the IMO non-controversial
cherry-picks as one batch (SRC_URI, dependency fixes, obvious typos and
the like), and then send maybe 20 or so version updates/stable branch
from master per 2 weeks, or per merge window.

(I'm also open for alternative suggestions, from the whole ML too. I'm
also open for feedback if this is actually not deemed to be beneficial.)

> On Tue, Sep 23, 2025 at 4:06 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> This is batch A of cherry picks from master branch, that I deem to be useful and
>> appropriate to be in Kirkstone branch.
>>
>> These include assorted recipe fixes (SRC_URI, LICENSE, typo fixes), and recipe
>> version updates. With recipe updates I have spent effort to ensure that they
>> contain only bugfixes - I did go through all the change logs and/or the commit logs,
>> and I did skip commits that introduced some backwards incompatible changes.
>>
>> This batch has so far survived a "bitbake world" build for arm, aarch64, x86 and x86-64.
>>
>> Even though I tried to be careful with my cherry picks, your review and comments
>> would be very appreciated.
>>
>> Thank you.
>>
>> P.S: I plan to send similar batches (consisting of ~20 patches), once a day, for
>> the next couple of days.
>>
>> --
>>
>> Changqing Li (1):
>>   libtimezonemap: correct package version
>>
>> Gyorgy Sarvari (1):
>>   fatresize: set correct LICENSE
>>
>> Kai Kang (1):
>>   libtimezonemap: rename downloaded file name
>>
>> Khem Raj (2):
>>   faenza-icon-theme: Switch to a valid download  location for SRC_URI
>>   libtimezonemap: Point to a working SRC_URI
>>
>> Mingli Yu (6):
>>   libnma: add opengl to REQUIRED_DISTRO_FEATURES
>>   network-manager-applet: add opengl to REQUIRED_DISTRO_FEATURES
>>   gnome-bluetooth: add opengl to REQUIRED_DISTRO_FEATURES
>>   gnome-desktop: add opengl to REQUIRED_DISTRO_FEATURES
>>   gtksourceview5: add opengl to REQUIRED_DISTRO_FEATURES
>>   evince: add opengl to REQUIRED_DISTRO_FEATURES
>>
>> Wang Mingyu (4):
>>   sshfs-fuse: upgrade 3.7.2 -> 3.7.3
>>   evolution-data-server: upgrade 3.44.1 -> 3.44.2
>>   gjs: upgrade 1.72.1 -> 1.72.2
>>   gnome-bluetooth: upgrade 42.2 -> 42.3
>>
>> Yi Zhao (2):
>>   yaffs2-utils: update SRC_URI
>>   evince: fix typo for RRECOMMENDS
>>
>> wangmy (5):
>>   evolution-data-server: upgrade 3.44.0 -> 3.44.1
>>   gjs: upgrade 1.72.0 -> 1.72.1
>>   gnome-bluetooth: upgrade 42.0 -> 42.1
>>   gnome-bluetooth: upgrade 42.1 -> 42.2
>>   evince: upgrade 42.2 -> 42.3
>>
>>  ...shfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb} |  2 +-
>>  .../yaffs2/yaffs2-utils_git.bb                |  3 +-
>>  .../fatresize/fatresize_1.1.0.bb              |  2 +-
>>  .../libnma/libnma_1.8.38.bb                   |  2 +-
>>  .../network-manager-applet_1.26.0.bb          |  2 +-
>>  .../evince/{evince_42.2.bb => evince_42.3.bb} |  8 +++--
>>  .../evolution-data-server.inc                 |  4 +--
>>  .../faenza-icon-theme_1.3.bb                  |  3 +-
>>  .../gjs/{gjs_1.72.0.bb => gjs_1.72.2.bb}      |  2 +-
>>  ...etooth_42.0.bb => gnome-bluetooth_42.3.bb} |  4 +--
>>  .../gnome-desktop/gnome-desktop_42.0.bb       |  2 +-
>>  .../gtksourceview/gtksourceview5_5.4.1.bb     |  1 +
>>  ...001-configure.ac-correct-the-version.patch | 29 +++++++++++++++++++
>>  .../libtimezonemap/libtimezonemap_0.4.6.bb    |  4 +--
>>  14 files changed, 49 insertions(+), 19 deletions(-)
>>  rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb} (93%)
>>  rename meta-gnome/recipes-gnome/evince/{evince_42.2.bb => evince_42.3.bb} (80%)
>>  rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb => gjs_1.72.2.bb} (92%)
>>  rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.0.bb => gnome-bluetooth_42.3.bb} (87%)
>>  create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119664): https://lists.openembedded.org/g/openembedded-devel/message/119664
>> Mute This Topic: https://lists.openembedded.org/mt/115391835/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


