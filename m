Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47F6C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 19:04:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.1262.1685646296786182434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 12:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=p9/zA2Yt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.210.174, mailfrom: brgl@bgdev.pl)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-65299178ac5so276670b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 12:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685646296; x=1688238296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjbnCVgqltTsY/ODgdxIdvjV55ncfgl6Gh1BwU6XAdE=;
        b=p9/zA2YtdvSAreLV1pNegCkm3ys1a8GUz2zlZDn34x/Mm1V02W6PBjMi4TagY/oqkF
         0ci3KkXlj7slS4aItTS1fXonoC2p50EeYd/FDvyrth6vlK2jStNLiPq2jvfhYT3STT2O
         je2ZAkaeOxrV6K1BagK6HV2XzrDM6BnwFJ23GWrXu4vYvHs8wRjTn4O9SJbQm3zM5HGc
         q9SjlTd2StDUvHtkOFcIu0JAsj58ImqbJwkkIo7OxmF9531GzOU4B0a4G3bdkeF1hFWu
         ySTDVnokNnBb4ghiLmEB+hHzA6HbSCnt6rBeOKhY5mAw/x3Zi0YA0LX5hRaEa2FtGhUa
         414Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685646296; x=1688238296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjbnCVgqltTsY/ODgdxIdvjV55ncfgl6Gh1BwU6XAdE=;
        b=lWljtSOhgVAq/qRQKoiZxhc0MNAFhoaNhpUeRlcdXFc2YxyavYEUnzlb/1qMHuYEKu
         1yF/VskJSMfrcN/n0GNKlRlIXHWn+1jGOBrsEXQufVbOUi5ZGxPPBsTfVq8FvPL3rrbu
         XJ3+ovG6bbrC4r8HbUsXMXPwfdQu6iUFMWWUVHwSxGJJoDH7JPUMOAVB9I3XQL6Wei3l
         cfY7e5Qnv5kil2oKVAvvXKWGiTYfVNo+O2/3FAhBc36AytyHAVdKaUJRmuY9/8AOQv8d
         rUFkfctJQep4bPPxh8sW3T3MX0ZbnebGr8IJ1Hx+CJdD8ATfmrpdKtVt+/XHN6aYepgn
         3YZQ==
X-Gm-Message-State: AC+VfDzsUpFkSua8hRQBrSbJkEkub5acs9Rth+x79bx7bgpTmWf6YzGg
	l7s4f35pkGRnu3ulh+3Fj/yZW4uGik29WnKUheadYQ==
X-Google-Smtp-Source: ACHHUZ51PBy2G4mlvgeaafQstsXJFI+rwvz+gN9eVGHdSyZyzgoOF4mbIlX3mnIpGfRxNoPFiL1VVLbNwhlaq2cKzaI=
X-Received: by 2002:a05:6a20:c510:b0:10f:8798:9ff3 with SMTP id
 gm16-20020a056a20c51000b0010f87989ff3mr9121179pzb.8.1685646296193; Thu, 01
 Jun 2023 12:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230524181131.3890392-1-joe.slater@windriver.com> <6a34b59d-413b-ab1c-2818-8b933ad55438@windriver.com>
In-Reply-To: <6a34b59d-413b-ab1c-2818-8b933ad55438@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Jun 2023 21:04:45 +0200
Message-ID: <CAMRc=MeZTM-cUaganZ2Tuf5WOnbDQftVAX-_QODzvO_fWrWGhw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
To: randy.macleod@windriver.com, Khem Raj <raj.khem@gmail.com>
Cc: joe.slater@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 19:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103085

On Wed, May 24, 2023 at 9:46=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2023-05-24 14:11, joe.slater@windriver.com wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> Look for level transitions when testing toggling
> values because using fixed delays to assume value
> changes is not reliable.
>
> The updated commit log and comment below look good to me.
>
>
> Please send a patch to upstream and reply to this thread with
> a link to that or send a commit to update the:
>
> Upstream-Status: pending
>

This patch breaks the following test for me:

 =E2=9C=97 gpioset: toggle (continuous)
   (from function `gpiosim_wait_value' in file
/usr/lib/libgpiod/ptest/tests/gpio-tools-test.bats, line 155,
    in test file /usr/lib/libgpiod/ptest/tests/gpio-tools-test.bats, line 1=
587)
     `gpiosim_wait_value sim0 1 0' failed

on current master meta-openembedded. Why did this even get here? The
patch did not go upstream in this form and needs some more work.
Please Cc me on future patches to any of the libgpiod recipes.

In the meantime. Khem: could you please revert this?

Bart

> tag.
>
> Thanks,
>
> ../Randy
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  ...-ptest-modify-delays-in-toggle-tests.patch | 60 +++++++++++++++++++
>  .../libgpiod/libgpiod_2.0.1.bb                |  2 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-pt=
est-modify-delays-in-toggle-tests.patch
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-mod=
ify-delays-in-toggle-tests.patch b/meta-oe/recipes-support/libgpiod/libgpio=
d-2.x/0001-ptest-modify-delays-in-toggle-tests.patch
> new file mode 100644
> index 0000000000..11f2d5c4a9
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-ptest-modify-del=
ays-in-toggle-tests.patch
> @@ -0,0 +1,60 @@
> +From b73a79245ac0fa36b15bf3308e4ed008793ff15c Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Fri, 19 May 2023 08:46:47 -0700
> +Subject: [PATCH] ptest: modify delays in toggle test
> +
> +The test "gpioset: toggle (continuous)" uses fixed delays to test
> +toggling values.  This is not reliable, so we switch to looking
> +for transitions from one value to another.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + tools/gpio-tools-test.bats | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +--- libgpiod-2.0.orig/tools/gpio-tools-test.bats
> ++++ libgpiod-2.0/tools/gpio-tools-test.bats
> +@@ -141,6 +141,20 @@ gpiosim_check_value() {
> + [ "$VAL" =3D "$EXPECTED" ]
> + }
> +
> ++gpiosim_wait_value() {
> ++ local OFFSET=3D$2
> ++ local EXPECTED=3D$3
> ++ local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> ++ local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> ++
> ++ for i in {1..10} ; do
> ++ VAL=3D$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
> ++ [ "$VAL" =3D "$EXPECTED" ] && return
> ++ sleep 0.1
> ++ done
> ++ return 1
> ++}
> ++
> + gpiosim_cleanup() {
> + for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> + do
> +@@ -1567,15 +1581,15 @@ request_release_line() {
> + gpiosim_check_value sim0 4 0
> + gpiosim_check_value sim0 7 0
> +
> +- sleep 1
> +-
> +- gpiosim_check_value sim0 1 0
> ++ # sleeping fixed amounts can be unreliable, so we
> ++ # sync to the toggles
> ++ #
> ++ gpiosim_wait_value sim0 1 0
> + gpiosim_check_value sim0 4 1
> + gpiosim_check_value sim0 7 1
> +
> +- sleep 1
> +
> +- gpiosim_check_value sim0 1 1
> ++ gpiosim_wait_value sim0 1 1
> + gpiosim_check_value sim0 4 0
> + gpiosim_check_value sim0 7 0
> + }
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.0.1.bb
> index 337554cd89..91c4d27692 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
>
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>
> +SRC_URI +=3D "file://0001-ptest-modify-delays-in-toggle-tests.patch"
> +
>  SRC_URI[sha256sum] =3D "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b=
0c1d05ec57a38392"
>
>  # Enable all project features for ptest
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102793): https://lists.openembedded.org/g/openembedde=
d-devel/message/102793
> Mute This Topic: https://lists.openembedded.org/mt/99114621/3618139
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [b=
rgl@bgdev.pl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

