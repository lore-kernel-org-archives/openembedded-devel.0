Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A222EC6FA82
	for <webhook@archiver.kernel.org>; Sat, 10 Sep 2022 14:51:46 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.209.1662821498220693821
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Sep 2022 07:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lqRydRdm;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so11571509fac.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Sep 2022 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=O5bKcflbN7kQg8hkOAANy0lYWBah8zWJbQHWVo1Rtw4=;
        b=lqRydRdmhaPkmTUxQbHvJMdPfsNx4mVWfooW0hHIKziaJK3pjkJ3p1fh6uYTjutnsR
         +PDctHjPu4LX5WtaEa0X3xs1zram5e+czOIjsb+gK7uKU1ohzHSsg/qqSApu72yceyPN
         0SuPaldRZxVy5mwAZetmhZ2qBu+Sh072/x96FkUET57PZ5rKnraMNe9rGv05bCQGGqMb
         GerqA8Sy5FeluIMlvj52e2M10bHQuNl7YBY2gLuR0e/W8N0V1UGuvJXyCcqwACDxGFt/
         prB3wkn0LRu9YyML1JR4grwXt+ZRxrW4/XxKD//haQGhuT8mCfPNu+yWDSXiVMof7NbZ
         ymJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=O5bKcflbN7kQg8hkOAANy0lYWBah8zWJbQHWVo1Rtw4=;
        b=gaqKHF7+9EWYb9QHXFjnRSCxoBReJB5x5DnGcwu8GE4mUn8Hsvu9RsPAYWV7RuB2C8
         DdozpTLxzB7V3Ml6OXzYf0vL5UBQKC7vyziXhQMLe7touzz56w+mXFrn8naqsVx/eEhq
         EgnDUQqZofBovBG0m5MJoiXT2Ckqas1ycqhsMrStjkbCrg5qEYTLKFKbHsHGFPEkpmQR
         lP/gaShrDhW/b5ZUzjOqBwocKRWjRhjtPTMkNlTYzOnPgv/cz0yAnosUVTIWtYwBk8uI
         /S9nGHxS/mIWPP2okGat0hLy7iVa1gSliG7pg9hQ1J/eZdushuGfe32yau/XjAJxUVBT
         O4VQ==
X-Gm-Message-State: ACgBeo04PW90lP6asFpnOIaS/s38cx2hZajF0Cd8uySWKPoRsLXz+0xD
	zc+aZ4eP+XXg04QR20WaQoJiD8aWpXG60G1tb1Y=
X-Google-Smtp-Source: 
 AA6agR5iMqxT4LlTcNc55vHaEZ7YxxiyzTeYGgBHlm/RWjY+r7SzrqqTOglQAYkNHCdvJhafQD6NilQir8yNwoUCSYc=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr7427796oae.262.1662821497402; Sat, 10
 Sep 2022 07:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <1662442335-7255-1-git-send-email-wangmy@fujitsu.com>
 <1662442335-7255-2-git-send-email-wangmy@fujitsu.com>
 <CA+chaQdaqbL6hVzHq=QX217ju2GkYGywHT7gYgfYoyH2+jo6ew@mail.gmail.com>
In-Reply-To: 
 <CA+chaQdaqbL6hVzHq=QX217ju2GkYGywHT7gYgfYoyH2+jo6ew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Sep 2022 07:51:11 -0700
Message-ID: 
 <CAMKF1soWhUXO=4JJqeBUQjPFJmYpx+x2kCvDr5hFNaTjAcB9Rg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] lvm2/libdevmapper: upgrade 2.03.11 ->
 2.03.16
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Sep 2022 14:51:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98733

On Sat, Sep 10, 2022 at 1:09 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> With this version I'm seeing both lvm2 and libdevmapper failing with::
>
>     [CC] ioctl/libdevmapper.so.1.02
> TOPDIR/..../12.2.0/ld: warning: using 'DM_1_02_129' as version for 'dm_bitset_parse_list' which is also named in version 'DM_1_02_138' in script
> TOPDIR/..../12.2.0/ld: error: datastruct/bitset.o: multiple definition of 'dm_bitset_parse_list'
> TOPDIR/..../12.2.0/ld: datastruct/bitset.o: previous definition here
>
> anyone else seeing the same?

This is something that gold linker might catch. Are you using gold
linker ? secondly just try with ld.bfd and see if it works. That
atleast will put some sanity into
why my builders or AB did not see it.

>
> On Tue, Sep 6, 2022 at 7:32 AM wangmy <wangmy@fujitsu.com> wrote:
>>
>> 0005-do-not-build-manual.patch
>> 0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> refreshed for new version.
>>
>> Add bash to RDEPENDS.
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  .../lvm2/files/0005-do-not-build-manual.patch | 23 ++++++++++---------
>>  ...lvm2-monitor.service-after-tmp.mount.patch | 11 +++++----
>>  ...per_2.03.11.bb => libdevmapper_2.03.16.bb} |  0
>>  meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
>>  .../lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb} |  1 +
>>  5 files changed, 21 insertions(+), 16 deletions(-)
>>  rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.11.bb => libdevmapper_2.03.16.bb} (100%)
>>  rename meta-oe/recipes-support/lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb} (99%)
>>
>> diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
>> index 7117d99a39..7979efbefb 100644
>> --- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
>> +++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
>> @@ -15,25 +15,26 @@ Upstream-Status: Pending
>>
>>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>
>> -
>>  Update context for lvm2 2.03.02.
>> -
>>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +Update context for lvm2 2.03.16.
>> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>  ---
>>   Makefile.in  | 6 +++---
>>   configure.ac | 1 -
>>   2 files changed, 3 insertions(+), 4 deletions(-)
>>
>>  diff --git a/Makefile.in b/Makefile.in
>> -index 6a1a990..80cba91 100644
>> +index 3b7e0ec..37f14eb 100644
>>  --- a/Makefile.in
>>  +++ b/Makefile.in
>>  @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
>>   abs_top_builddir = @abs_top_builddir@
>>   abs_top_srcdir = @abs_top_srcdir@
>>
>> --SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
>> -+SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
>> +-SUBDIRS = libdm conf daemons include lib libdaemon man scripts tools
>> ++SUBDIRS = libdm conf daemons include lib libdaemon scripts tools
>>
>>   ifeq ("@UDEV_RULES@", "yes")
>>     SUBDIRS += udev
>> @@ -46,20 +47,20 @@ index 6a1a990..80cba91 100644
>>       libdaemon lib tools daemons libdm \
>>       udev po
>>   tools.distclean: test.distclean
>> -@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper
>> +@@ -59,7 +59,7 @@ unit-test  run-unit-test: test
>> +
>>   daemons.device-mapper: libdm.device-mapper
>>   tools.device-mapper: libdm.device-mapper
>> - scripts.device-mapper: include.device-mapper
>>  -device-mapper: tools.device-mapper daemons.device-mapper man.device-mapper
>>  +device-mapper: tools.device-mapper daemons.device-mapper
>> + device_mapper: device-mapper
>>
>>   ifeq ("@INTL@", "yes")
>> - lib.pofile: include.pofile
>>  diff --git a/configure.ac b/configure.ac
>> -index 7fd0561..4154dc0 100644
>> +index 6def519..18a5c97 100644
>>  --- a/configure.ac
>>  +++ b/configure.ac
>> -@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile
>> +@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile
>>   libdm/Makefile
>>   libdm/dm-tools/Makefile
>>   libdm/libdevmapper.pc
>> @@ -68,5 +69,5 @@ index 7fd0561..4154dc0 100644
>>   scripts/lvm2-pvscan.service
>>   scripts/blkdeactivate.sh
>>  --
>> -2.7.4
>> +2.25.1
>>
>> diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> index 9f9383ef48..5b9b2d5748 100644
>> --- a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> +++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> @@ -11,23 +11,26 @@ Upstream-Status: Inappropriate [oe specific]
>>
>>  Rebase to v2_03_05
>>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +
>> +Rebase to v2_03_16
>> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>  ---
>>   scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>  diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/scripts/lvm2_monitoring_systemd_red_hat.service.in
>> -index 4bf744a..46766cb 100644
>> +index c0c96e3..2a99a37 100644
>>  --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
>>  +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
>>  @@ -2,7 +2,7 @@
>>   Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling
>>   Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8) man:vgchange(8)
>>   Requires=dm-event.socket
>> --After=dm-event.socket dm-event.service lvm2-activation.service
>> -+After=dm-event.socket dm-event.service lvm2-activation.service tmp.mount
>> +-After=dm-event.socket dm-event.service
>> ++After=dm-event.socket dm-event.service tmp.mount
>>   Before=local-fs-pre.target shutdown.target
>>   DefaultDependencies=no
>>   Conflicts=shutdown.target
>>  --
>> -2.7.4
>> +2.25.1
>>
>> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
>> similarity index 100%
>> rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
>> rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
>> index 0c593b2042..34e57ec7a5 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>> @@ -18,7 +18,7 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
>>             file://reproducible-build.patch \
>>             "
>>
>> -SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
>> +SRCREV = "6d1e894a867681af7a811ed63bc435f3aa55fec8"
>>  S = "${WORKDIR}/git"
>>
>>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
>> similarity index 99%
>> rename from meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
>> rename to meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
>> index a729324c9b..6a6cdc7cef 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
>> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
>> @@ -68,6 +68,7 @@ FILES:${PN}-scripts = " \
>>  # Specified explicitly for the udev rules, just in case that it does not get picked
>>  # up automatically:
>>  FILES:${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
>> +RDEPENDS:${PN} = "bash"
>>  RDEPENDS:${PN}-udevrules = "libdevmapper"
>>  RDEPENDS:${PN}:append:class-target = " libdevmapper"
>>  RDEPENDS:${PN}:append:class-nativesdk = " libdevmapper"
>> --
>> 2.25.1
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98732): https://lists.openembedded.org/g/openembedded-devel/message/98732
> Mute This Topic: https://lists.openembedded.org/mt/93495342/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

