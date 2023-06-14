Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766BCEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:13:16 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web11.15210.1686755592875636862
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=j5giK03T;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.175, mailfrom: brgl@bgdev.pl)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-46e92a90610so215653e0c.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686755592; x=1689347592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+WnO41Co4ZB/Vi0QRS8QNiE/0SLMAfNqgYNInF7xLg=;
        b=j5giK03TM9kwpNriPz982zlpsQ33+U6vYfRbH/5vpz/V17vtOr3AjngW0JLhGnSJok
         A4CtcrfpXcD5LXM8MqoeFu15nvA3VdJrP2ZIW+Xip5t4jIqi9oFBvRK07Ehvu6h0P3GR
         aZ9Aj31//pohtM+u3OfT+E+Weehj4djTSiUk92d/0juWXoHq2OU3kxUrLtElZ0wBLMBC
         9LNDT+ddmfFi5YJaXpGT/xTZN67blk+DVdyDWH+mrWT9zLZ3r1/9fVQioxZ61GeTkuMZ
         Td2lynlt4Pnp+NgxcrA110G/xNHWiY/ebZdgRmJ+Sccg9BsLRAL0tgj3mNMEwO94IINl
         3hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686755592; x=1689347592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+WnO41Co4ZB/Vi0QRS8QNiE/0SLMAfNqgYNInF7xLg=;
        b=AmhIYciiEdHH7uXuFpaFu6jJOFGfP5bNzEwwGj+cDl45Tfm7UKSW3YNDJLsHQvurvP
         bt819yATKUKPaxdrpHLPYlRfmXqGlxVQNkPAzJXWHSH5oSpXoLcZi7Y0jh8FUAn1uZG0
         EVg28lIPo2fWW+RJaNQE0R8LI1MaI+6YxE1LVA+GSrarwZ84GU+WGUtJ/60XKG8uu27J
         WqHbAb5szNgZAcaB9WpW0XXJng2iqlZ5P+COYYLwY9PRHoz+4cnVuPm9Gu7xSjs3+Q1S
         fBsOPmHGFTT4uv8PF2yq1laWj4xUwgu+f7V4n9OvSOo8BfPnxnOQGbbGtHi0zzU/jGwv
         q94g==
X-Gm-Message-State: AC+VfDyQzVQUJe3oqGuCt3qFSIk53m5swgzjr9npiMSYSos+BDNTEGVN
	wvrkp5Tolt7jyJMhu8OcurjtlK5E4YMHAhWHzAfs+orDsb0k0+KI
X-Google-Smtp-Source: ACHHUZ4m7BuGh7Oi/GaItkPsOL7VD5Do1wfe1/jI81b5WUolTd3tkWT0R9puwfgJuB9pYwbBZLYIMAZS0rpMJmuZhig=
X-Received: by 2002:a1f:6051:0:b0:464:c5aa:3338 with SMTP id
 u78-20020a1f6051000000b00464c5aa3338mr6714457vkb.15.1686755591699; Wed, 14
 Jun 2023 08:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230614140611.2415960-1-joe.slater@windriver.com>
In-Reply-To: <20230614140611.2415960-1-joe.slater@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Jun 2023 17:13:01 +0200
Message-ID: <CAMRc=Mdh3po_oMNU4mRJxkzatgaDGCJE-JNX3o4zdQp3iQZ5Hg@mail.gmail.com>
Subject: Re: [v3][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset: toggle (continuous)'
To: joe.slater@windriver.com
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 15:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103286

On Wed, Jun 14, 2023 at 4:06=E2=80=AFPM <joe.slater@windriver.com> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> Look for level transitions when testing toggling
> values because using fixed delays to assume value
> changes is not reliable.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../gpio-tools-test-bats-modify.patch         | 67 +++++++++++++++++++
>  .../libgpiod/libgpiod_2.0.1.bb                |  2 +
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-to=
ols-test-bats-modify.patch
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-tes=
t-bats-modify.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-to=
ols-test-bats-modify.patch
> new file mode 100644
> index 0000000000..4d49467968
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-=
modify.patch
> @@ -0,0 +1,67 @@
> +From 53f9670d6af1bd0745c1df9c469b269c72607b23 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Tue, 6 Jun 2023 08:04:27 -0700
> +Subject: [PATCH] tools: tests: modify delays in toggle test
> +
> +The test "gpioset: toggle (continuous)" uses fixed delays to test
> +toggling values. This is not reliable, so we switch to looking
> +for transitions from one value to another.
> +
> +We wait for a transition up to 1.5 seconds.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +Upstream-status: accepted
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + tools/gpio-tools-test.bats | 21 ++++++++++++++++-----
> + 1 file changed, 16 insertions(+), 5 deletions(-)
> +
> +diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> +index c83ca7d..929c35a 100755
> +--- a/tools/gpio-tools-test.bats
> ++++ b/tools/gpio-tools-test.bats
> +@@ -141,6 +141,20 @@ gpiosim_check_value() {
> +       [ "$VAL" =3D "$EXPECTED" ]
> + }
> +
> ++gpiosim_wait_value() {
> ++      local OFFSET=3D$2
> ++      local EXPECTED=3D$3
> ++      local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> ++      local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> ++      local PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/va=
lue
> ++
> ++      for i in {1..15}; do
> ++              [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> ++              sleep 0.1
> ++      done
> ++      return 1
> ++}
> ++
> + gpiosim_cleanup() {
> +       for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> +       do
> +@@ -1567,15 +1581,12 @@ request_release_line() {
> +       gpiosim_check_value sim0 4 0
> +       gpiosim_check_value sim0 7 0
> +
> +-      sleep 1
> +-
> +-      gpiosim_check_value sim0 1 0
> ++      gpiosim_wait_value sim0 1 0
> +       gpiosim_check_value sim0 4 1
> +       gpiosim_check_value sim0 7 1
> +
> +-      sleep 1
> +
> +-      gpiosim_check_value sim0 1 1
> ++      gpiosim_wait_value sim0 1 1
> +       gpiosim_check_value sim0 4 0
> +       gpiosim_check_value sim0 7 0
> + }
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.0.1.bb
> index 337554cd89..6958f2d841 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
>
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>
> +SRC_URI +=3D "file://gpio-tools-test-bats-modify.patch"
> +
>  SRC_URI[sha256sum] =3D "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b=
0c1d05ec57a38392"
>
>  # Enable all project features for ptest
> --
> 2.25.1
>
Reluctant:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Although, I'm asking myself - why do you need this? Have you seen any
failures with ptest? Can this wait for a full release?

Bart

