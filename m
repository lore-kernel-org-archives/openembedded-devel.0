Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB136C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 13:30:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.11559.1707485398953761236
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 05:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fb2EaWBB;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33b670d8a74so293560f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707485397; x=1708090197; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIjvb9/6URf5EuI2hrwBzv0G6KwK9eJLb9Dt34JBJbc=;
        b=fb2EaWBBXGv+heFeWkDFtEHNsiLF+E7wR3KGUfO4NwKhCnjQGRsPo40Tilmb7CufjC
         1CTOj8/YwVLZcYASe9N/qV2E5LXnYb30fxmW6pJYM6DLoOnCH8pyQT9JxGudiqb75aM3
         tr0EPdHpNgCTWDL27xYykgrpAN2iG81B/ClD03m+4erR80Byx5B/+H8dIUdorSr19S39
         nLN7voTm9igC0sAOpliBHRGMPNzITYMm/A8mQZAXEl9KyCmZz044XL2BUx9e6BBVc23R
         rPkTyzTO0siMGyi1EpQYdsfdrGi0OsLexPAM1fmnp8TpWq7hq5LjA6nTT0RyjPoh3n4+
         Arzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707485397; x=1708090197;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cIjvb9/6URf5EuI2hrwBzv0G6KwK9eJLb9Dt34JBJbc=;
        b=n4rphBJg3O+QBCa0t+EhCJbno7sZcKsUtQL2bLZ9GNZo2GDUaZi3+DiREWKEgw+Znv
         1VDNRcfx5zJsRCtgAG6uQZL20uAd15z0YF7ncxdfjKmWBgOLA1qB8ru93dBQmCv6btuN
         E0WCsa9Q4VEaSR6aXbLD/vMNuO5DUkbLS7Rt+PYDA/tlNkKlosygwYe+hsWZ1uajy9OG
         KD7DOFwGtPetcby+WmhuClfOrDuxikWJ46XfXCx8r9EpBFOkY1I+tNuud8wn8ivLtwOC
         bGaAXJLp3OEOVOfjsoAHDpGf0drtJViMcVcNahKzOEZNoOOWgZcYcUoL1PTUyZeBeEl6
         E/mg==
X-Forwarded-Encrypted: i=1; AJvYcCWhTKbq5D3OX81QjFp2XWdR1/podQkayfJdY6JtMFz6pEZyDf9Vyv4yVdyNKt1gGUv/TJdkbPLTTmA8B1bTPYKCVbGY/chPlJpE3bVaTdkGkyBmbBDKUH7hgA==
X-Gm-Message-State: AOJu0YwL2q4oB2VNG06Gp1Kr7XNImA8KjaYzNI4tmQLapRcVjtWx7icD
	Udtz+NPFOnV6d+3/k0HMAngvtwcW5D7XRv1J2zsZvsbt7rFDKWDc
X-Google-Smtp-Source: AGHT+IHtCJ56em2uVKFXZmM0PFDuM90JxfitmhZdABtKuetDyaqad9XM9MlMGW4Bzo6MAJmIW9ZRLg==
X-Received: by 2002:a5d:4282:0:b0:33b:60ca:269f with SMTP id k2-20020a5d4282000000b0033b60ca269fmr1104574wrq.43.1707485397028;
        Fri, 09 Feb 2024 05:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIkW3mrOLGaMWxtMQeeNSJy3bvCLowIB4FOMkfunUPBqG12lr64F+PB3E69ElYOKjntlmr3KfMH1ysQCkmYRVQ5QjOaOD03XJ2/8ZRz2kWBgB6kRHpLD4egmsCSUpprmFUjJg7Vx2DUrquSjhXtbzIN2ZnyENAB6SAtFcsPEezEVlAzGZf
Received: from [10.139.2.35] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id d23-20020adfa357000000b0033ae50e2c6asm1830342wrb.83.2024.02.09.05.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 05:29:56 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Sz2jjlv2wYUevikiy70sw7hv"
Message-ID: <d8b36172-c6ed-4cd3-95e6-9babe7b00f46@gmail.com>
Date: Fri, 9 Feb 2024 14:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-filesystems][PATCH] xfstests: fix make install race
 condition
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: Vyacheslav.Yurkov@bruker.com, openembedded-devel@lists.openembedded.org,
 wangmy@fujitsu.com
References: <20240208234026.3515183-1-martin.jansa@gmail.com>
 <CAMKF1srQJhHwbE6moSNH2_86Q+onLD8TwT55RhUdj=EunxxKJA@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CAMKF1srQJhHwbE6moSNH2_86Q+onLD8TwT55RhUdj=EunxxKJA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 13:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108684

This is a multi-part message in MIME format.
--------------Sz2jjlv2wYUevikiy70sw7hv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

More thanks from my side too!

Slava

On 09.02.2024 01:32, Khem Raj wrote:
> Thanks for fixing this. It has been hitting my CI often enough but 
> still intermittently, these kind of issues are hard to deal with so 
> extra kudos !
>
> On Thu, Feb 8, 2024 at 3:40 PM Martin Jansa <martin.jansa@gmail.com> 
> wrote:
>
>     * sometimes make install was failing with:
>       cp: cannot stat 'group.list': No such file or directory
>       and bunch of non-fatal messages:
>       mv: failed to preserve ownership for 'group.list': Invalid argument
>
>     * this was when tools/mkgroupfile did
>       mv -f "$new_groups" "$groupfile"
>       overwritting the group.list file while install-sh was already
>       copying it to output
>
>     * in the end easily reproducible by
>       1) removing tests/*/group.list before each make install
>       2) adding some sleep in mkgroupfile before the mv call
>
>     Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>     ---
>      ...ake-sure-group.list-DIRT-exists-befo.patch | 239
>     ++++++++++++++++++
>      .../xfstests/xfstests_2024.01.14.bb
>     <http://xfstests_2024.01.14.bb>          |  10 +-
>      2 files changed, 242 insertions(+), 7 deletions(-)
>      create mode 100644
>     meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
>
>     diff --git
>     a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
>     b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
>     new file mode 100644
>     index 0000000000..5e8bf0c606
>     --- /dev/null
>     +++
>     b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
>     @@ -0,0 +1,239 @@
>     +From b30d5690d7245aa8bd5ca2896e629e62ec97afda Mon Sep 17 00:00:00
>     2001
>     +From: Martin Jansa <martin.jansa@gmail.com>
>     +Date: Thu, 8 Feb 2024 23:01:36 +0100
>     +Subject: [PATCH] tests/*/Makefile: make sure group.list DIRT
>     exists before
>     + install
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=UTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +* sometimes make install was failing with:
>     +  cp: cannot stat 'group.list': No such file or directory
>     +  and bunch of non-fatal messages:
>     +  mv: failed to preserve ownership for 'group.list': Invalid argument
>     +
>     +* this was when tools/mkgroupfile did
>     +  mv -f "$new_groups" "$groupfile"
>     +  overwritting the group.list file while install-sh was already
>     +  copying it to output
>     +
>     +* in the end easily reproducible by
>     +  1) removing tests/*/group.list before each make install
>     +  2) adding some sleep in mkgroupfile before the mv call
>     +
>     +Upstream-Status: Submitted
>     [https://lore.kernel.org/fstests/20240208225241.644701-1-martin.jansa@gmail.com/]
>     +
>     +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>     +---
>     + tests/btrfs/Makefile    | 2 +-
>     + tests/ceph/Makefile     | 2 +-
>     + tests/cifs/Makefile     | 2 +-
>     + tests/ext4/Makefile     | 2 +-
>     + tests/f2fs/Makefile     | 2 +-
>     + tests/generic/Makefile  | 2 +-
>     + tests/nfs/Makefile      | 2 +-
>     + tests/ocfs2/Makefile    | 2 +-
>     + tests/overlay/Makefile  | 2 +-
>     + tests/perf/Makefile     | 2 +-
>     + tests/selftest/Makefile | 2 +-
>     + tests/shared/Makefile   | 2 +-
>     + tests/tmpfs/Makefile    | 2 +-
>     + tests/udf/Makefile      | 2 +-
>     + tests/xfs/Makefile      | 2 +-
>     + 15 files changed, 15 insertions(+), 15 deletions(-)
>     +
>     +diff --git a/tests/btrfs/Makefile b/tests/btrfs/Makefile
>     +index 1b72a1a1..6d9995b4 100644
>     +--- a/tests/btrfs/Makefile
>     ++++ b/tests/btrfs/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/ceph/Makefile b/tests/ceph/Makefile
>     +index 2761e1e9..5f24d518 100644
>     +--- a/tests/ceph/Makefile
>     ++++ b/tests/ceph/Makefile
>     +@@ -12,7 +12,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/cifs/Makefile b/tests/cifs/Makefile
>     +index 62c48935..0b89a01d 100644
>     +--- a/tests/cifs/Makefile
>     ++++ b/tests/cifs/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/ext4/Makefile b/tests/ext4/Makefile
>     +index a2a0d561..296e3850 100644
>     +--- a/tests/ext4/Makefile
>     ++++ b/tests/ext4/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/f2fs/Makefile b/tests/f2fs/Makefile
>     +index 9d1ed3c6..0a90b465 100644
>     +--- a/tests/f2fs/Makefile
>     ++++ b/tests/f2fs/Makefile
>     +@@ -15,7 +15,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/generic/Makefile b/tests/generic/Makefile
>     +index b464b22b..d6ed3e55 100644
>     +--- a/tests/generic/Makefile
>     ++++ b/tests/generic/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/nfs/Makefile b/tests/nfs/Makefile
>     +index 128d2a3a..51590b5c 100644
>     +--- a/tests/nfs/Makefile
>     ++++ b/tests/nfs/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/ocfs2/Makefile b/tests/ocfs2/Makefile
>     +index 260ad31b..17e01bf3 100644
>     +--- a/tests/ocfs2/Makefile
>     ++++ b/tests/ocfs2/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/overlay/Makefile b/tests/overlay/Makefile
>     +index 2785b94d..c71e78d6 100644
>     +--- a/tests/overlay/Makefile
>     ++++ b/tests/overlay/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/perf/Makefile b/tests/perf/Makefile
>     +index 0c74ba39..d72c04d9 100644
>     +--- a/tests/perf/Makefile
>     ++++ b/tests/perf/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/selftest/Makefile b/tests/selftest/Makefile
>     +index 3ddfca37..cabc35a9 100644
>     +--- a/tests/selftest/Makefile
>     ++++ b/tests/selftest/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/shared/Makefile b/tests/shared/Makefile
>     +index f3128714..2e6aa718 100644
>     +--- a/tests/shared/Makefile
>     ++++ b/tests/shared/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/tmpfs/Makefile b/tests/tmpfs/Makefile
>     +index 46544313..46b62dad 100644
>     +--- a/tests/tmpfs/Makefile
>     ++++ b/tests/tmpfs/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/udf/Makefile b/tests/udf/Makefile
>     +index ed4434f0..feda69a6 100644
>     +--- a/tests/udf/Makefile
>     ++++ b/tests/udf/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     +diff --git a/tests/xfs/Makefile b/tests/xfs/Makefile
>     +index 5f413e67..6bfafdb1 100644
>     +--- a/tests/xfs/Makefile
>     ++++ b/tests/xfs/Makefile
>     +@@ -14,7 +14,7 @@ default: $(DIRT)
>     +
>     + include $(BUILDRULES)
>     +
>     +-install:
>     ++install: default
>     +       $(INSTALL) -m 755 -d $(TARGET_DIR)
>     +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
>     +       $(INSTALL) -m 644 group.list $(TARGET_DIR)
>     diff --git
>     a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
>     <http://xfstests_2024.01.14.bb>
>     b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
>     <http://xfstests_2024.01.14.bb>
>     index 711637a70d..5ff1914569 100644
>     ---
>     a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
>     <http://xfstests_2024.01.14.bb>
>     +++
>     b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
>     <http://xfstests_2024.01.14.bb>
>     @@ -7,8 +7,9 @@ SRCREV_FORMAT = "xfstests_unionmount"
>
>      SRC_URI =
>     "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests
>     <http://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests>
>     \
>     git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite
>     <http://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite>
>     \
>     -
>     file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
>     \
>     file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
>     +
>     file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
>     \
>     +
>     file://0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
>     \
>                 "
>
>      SRCREV_xfstests = "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"
>     @@ -51,12 +52,7 @@ do_configure:prepend() {
>          cp -a ${S}/include/install-sh .
>      }
>
>     -# Not sure if this is needed, but with old install-sh it was
>     sometimes failing with:
>     -# cp: cannot stat 'group.list': No such file or directory
>     -# http://errors.yoctoproject.org/Errors/Details/752404/
>     -# PARALLEL_MAKEINST = "-j1"
>     -
>     -do_install:prepend() {
>     +do_install() {
>          # otherwise install-sh duplicates DESTDIR prefix
>          export DIST_ROOT="/" DIST_MANIFEST="" DESTDIR="${D}"
>          oe_runmake install
>     -- 
>     2.43.0
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#108674):
>     https://lists.openembedded.org/g/openembedded-devel/message/108674
>     Mute This Topic: https://lists.openembedded.org/mt/104250063/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>

--------------Sz2jjlv2wYUevikiy70sw7hv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">More thanks from my side too!<br>
      <br>
      Slava<br>
      <br>
      On 09.02.2024 01:32, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1srQJhHwbE6moSNH2_86Q+onLD8TwT55RhUdj=EunxxKJA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">Thanks for fixing this. It has been hitting my CI
        often enough but still intermittently, these kind of issues are
        hard to deal with so extra kudos !</div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Feb 8, 2024 at
            3:40 PM Martin Jansa &lt;<a
              href="mailto:martin.jansa@gmail.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">martin.jansa@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">*
            sometimes make install was failing with:<br>
              cp: cannot stat 'group.list': No such file or directory<br>
              and bunch of non-fatal messages:<br>
              mv: failed to preserve ownership for 'group.list': Invalid
            argument<br>
            <br>
            * this was when tools/mkgroupfile did<br>
              mv -f "$new_groups" "$groupfile"<br>
              overwritting the group.list file while install-sh was
            already<br>
              copying it to output<br>
            <br>
            * in the end easily reproducible by<br>
              1) removing tests/*/group.list before each make install<br>
              2) adding some sleep in mkgroupfile before the mv call<br>
            <br>
            Signed-off-by: Martin Jansa &lt;<a
              href="mailto:martin.jansa@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">martin.jansa@gmail.com</a>&gt;<br>
            ---<br>
             ...ake-sure-group.list-DIRT-exists-befo.patch | 239
            ++++++++++++++++++<br>
             .../xfstests/<a href="http://xfstests_2024.01.14.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">xfstests_2024.01.14.bb</a> 
                     |  10 +-<br>
             2 files changed, 242 insertions(+), 7 deletions(-)<br>
             create mode 100644
meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch<br>
            <br>
            diff --git
a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch<br>
            new file mode 100644<br>
            index 0000000000..5e8bf0c606<br>
            --- /dev/null<br>
            +++
b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch<br>
            @@ -0,0 +1,239 @@<br>
            +From b30d5690d7245aa8bd5ca2896e629e62ec97afda Mon Sep 17
            00:00:00 2001<br>
            +From: Martin Jansa &lt;<a
              href="mailto:martin.jansa@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">martin.jansa@gmail.com</a>&gt;<br>
            +Date: Thu, 8 Feb 2024 23:01:36 +0100<br>
            +Subject: [PATCH] tests/*/Makefile: make sure group.list
            DIRT exists before<br>
            + install<br>
            +MIME-Version: 1.0<br>
            +Content-Type: text/plain; charset=UTF-8<br>
            +Content-Transfer-Encoding: 8bit<br>
            +<br>
            +* sometimes make install was failing with:<br>
            +  cp: cannot stat 'group.list': No such file or directory<br>
            +  and bunch of non-fatal messages:<br>
            +  mv: failed to preserve ownership for 'group.list':
            Invalid argument<br>
            +<br>
            +* this was when tools/mkgroupfile did<br>
            +  mv -f "$new_groups" "$groupfile"<br>
            +  overwritting the group.list file while install-sh was
            already<br>
            +  copying it to output<br>
            +<br>
            +* in the end easily reproducible by<br>
            +  1) removing tests/*/group.list before each make install<br>
            +  2) adding some sleep in mkgroupfile before the mv call<br>
            +<br>
            +Upstream-Status: Submitted [<a
href="https://lore.kernel.org/fstests/20240208225241.644701-1-martin.jansa@gmail.com/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lore.kernel.org/fstests/20240208225241.644701-1-martin.jansa@gmail.com/</a>]<br>
            +<br>
            +Signed-off-by: Martin Jansa &lt;<a
              href="mailto:martin.jansa@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">martin.jansa@gmail.com</a>&gt;<br>
            +---<br>
            + tests/btrfs/Makefile    | 2 +-<br>
            + tests/ceph/Makefile     | 2 +-<br>
            + tests/cifs/Makefile     | 2 +-<br>
            + tests/ext4/Makefile     | 2 +-<br>
            + tests/f2fs/Makefile     | 2 +-<br>
            + tests/generic/Makefile  | 2 +-<br>
            + tests/nfs/Makefile      | 2 +-<br>
            + tests/ocfs2/Makefile    | 2 +-<br>
            + tests/overlay/Makefile  | 2 +-<br>
            + tests/perf/Makefile     | 2 +-<br>
            + tests/selftest/Makefile | 2 +-<br>
            + tests/shared/Makefile   | 2 +-<br>
            + tests/tmpfs/Makefile    | 2 +-<br>
            + tests/udf/Makefile      | 2 +-<br>
            + tests/xfs/Makefile      | 2 +-<br>
            + 15 files changed, 15 insertions(+), 15 deletions(-)<br>
            +<br>
            +diff --git a/tests/btrfs/Makefile b/tests/btrfs/Makefile<br>
            +index 1b72a1a1..6d9995b4 100644<br>
            +--- a/tests/btrfs/Makefile<br>
            ++++ b/tests/btrfs/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/ceph/Makefile b/tests/ceph/Makefile<br>
            +index 2761e1e9..5f24d518 100644<br>
            +--- a/tests/ceph/Makefile<br>
            ++++ b/tests/ceph/Makefile<br>
            +@@ -12,7 +12,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/cifs/Makefile b/tests/cifs/Makefile<br>
            +index 62c48935..0b89a01d 100644<br>
            +--- a/tests/cifs/Makefile<br>
            ++++ b/tests/cifs/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/ext4/Makefile b/tests/ext4/Makefile<br>
            +index a2a0d561..296e3850 100644<br>
            +--- a/tests/ext4/Makefile<br>
            ++++ b/tests/ext4/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/f2fs/Makefile b/tests/f2fs/Makefile<br>
            +index 9d1ed3c6..0a90b465 100644<br>
            +--- a/tests/f2fs/Makefile<br>
            ++++ b/tests/f2fs/Makefile<br>
            +@@ -15,7 +15,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/generic/Makefile
            b/tests/generic/Makefile<br>
            +index b464b22b..d6ed3e55 100644<br>
            +--- a/tests/generic/Makefile<br>
            ++++ b/tests/generic/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/nfs/Makefile b/tests/nfs/Makefile<br>
            +index 128d2a3a..51590b5c 100644<br>
            +--- a/tests/nfs/Makefile<br>
            ++++ b/tests/nfs/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/ocfs2/Makefile b/tests/ocfs2/Makefile<br>
            +index 260ad31b..17e01bf3 100644<br>
            +--- a/tests/ocfs2/Makefile<br>
            ++++ b/tests/ocfs2/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/overlay/Makefile
            b/tests/overlay/Makefile<br>
            +index 2785b94d..c71e78d6 100644<br>
            +--- a/tests/overlay/Makefile<br>
            ++++ b/tests/overlay/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/perf/Makefile b/tests/perf/Makefile<br>
            +index 0c74ba39..d72c04d9 100644<br>
            +--- a/tests/perf/Makefile<br>
            ++++ b/tests/perf/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/selftest/Makefile
            b/tests/selftest/Makefile<br>
            +index 3ddfca37..cabc35a9 100644<br>
            +--- a/tests/selftest/Makefile<br>
            ++++ b/tests/selftest/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/shared/Makefile b/tests/shared/Makefile<br>
            +index f3128714..2e6aa718 100644<br>
            +--- a/tests/shared/Makefile<br>
            ++++ b/tests/shared/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/tmpfs/Makefile b/tests/tmpfs/Makefile<br>
            +index 46544313..46b62dad 100644<br>
            +--- a/tests/tmpfs/Makefile<br>
            ++++ b/tests/tmpfs/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/udf/Makefile b/tests/udf/Makefile<br>
            +index ed4434f0..feda69a6 100644<br>
            +--- a/tests/udf/Makefile<br>
            ++++ b/tests/udf/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            +diff --git a/tests/xfs/Makefile b/tests/xfs/Makefile<br>
            +index 5f413e67..6bfafdb1 100644<br>
            +--- a/tests/xfs/Makefile<br>
            ++++ b/tests/xfs/Makefile<br>
            +@@ -14,7 +14,7 @@ default: $(DIRT)<br>
            + <br>
            + include $(BUILDRULES)<br>
            + <br>
            +-install:<br>
            ++install: default<br>
            +       $(INSTALL) -m 755 -d $(TARGET_DIR)<br>
            +       $(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)<br>
            +       $(INSTALL) -m 644 group.list $(TARGET_DIR)<br>
            diff --git a/meta-filesystems/recipes-utils/xfstests/<a
              href="http://xfstests_2024.01.14.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">xfstests_2024.01.14.bb</a>
            b/meta-filesystems/recipes-utils/xfstests/<a
              href="http://xfstests_2024.01.14.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">xfstests_2024.01.14.bb</a><br>
            index 711637a70d..5ff1914569 100644<br>
            --- a/meta-filesystems/recipes-utils/xfstests/<a
              href="http://xfstests_2024.01.14.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">xfstests_2024.01.14.bb</a><br>
            +++ b/meta-filesystems/recipes-utils/xfstests/<a
              href="http://xfstests_2024.01.14.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">xfstests_2024.01.14.bb</a><br>
            @@ -7,8 +7,9 @@ SRCREV_FORMAT = "xfstests_unionmount"<br>
            <br>
             SRC_URI = "<a class="moz-txt-link-freetext" href="git://">git://</a><a
href="http://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests</a>
            \<br>
                        <a class="moz-txt-link-freetext" href="git://">git://</a><a
href="http://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite</a>
            \<br>
            -         
             <a class="moz-txt-link-freetext" href="file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch">file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch</a>
            \<br>
                       
            <a class="moz-txt-link-freetext" href="file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch">file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch</a>
            \<br>
            +         
             <a class="moz-txt-link-freetext" href="file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch">file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch</a>
            \<br>
            +         
             <a class="moz-txt-link-freetext" href="file://0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch">file://0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch</a>
            \<br>
                        "<br>
            <br>
             SRCREV_xfstests =
            "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"<br>
            @@ -51,12 +52,7 @@ do_configure:prepend() {<br>
                 cp -a ${S}/include/install-sh .<br>
             }<br>
            <br>
            -# Not sure if this is needed, but with old install-sh it
            was sometimes failing with:<br>
            -# cp: cannot stat 'group.list': No such file or directory<br>
            -# <a
href="http://errors.yoctoproject.org/Errors/Details/752404/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">http://errors.yoctoproject.org/Errors/Details/752404/</a><br>
            -# PARALLEL_MAKEINST = "-j1"<br>
            -<br>
            -do_install:prepend() {<br>
            +do_install() {<br>
                 # otherwise install-sh duplicates DESTDIR prefix<br>
                 export DIST_ROOT="/" DIST_MANIFEST="" DESTDIR="${D}"<br>
                 oe_runmake install<br>
            -- <br>
            2.43.0<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#108674): <a
href="https://lists.openembedded.org/g/openembedded-devel/message/108674"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/message/108674</a><br>
            Mute This Topic: <a
              href="https://lists.openembedded.org/mt/104250063/1997914"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/mt/104250063/1997914</a><br>
            Group Owner: <a
href="mailto:openembedded-devel%2Bowner@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-devel/unsub"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href="mailto:raj.khem@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------Sz2jjlv2wYUevikiy70sw7hv--

