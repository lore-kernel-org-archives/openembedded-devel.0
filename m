Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F54DC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 18:26:27 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.4515.1686075978500548035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 11:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=SblDJ5NE;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.180, mailfrom: brgl@bgdev.pl)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4640f75d784so2380537e0c.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686075977; x=1688667977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCJiurTsB5iW4U7Wd8e+ZWX3/DSr5KuisDlDkab9Kpk=;
        b=SblDJ5NEwYiYkw31YNrV+uLI9z0UTrpYHF40USyYQg8zlrq5Y929J/mwZKtYOmmYZ5
         mwBdEM9hjbfL4bFYmPfk//kqduewa/VIttk4+Nq7lKKGVdDLy4UKyjAtrw09KtXUyLg7
         xxOMerk/E0WpnxycTHFk1L0k3UnB8mGlvzOfvMzC7c8entZHhOdzWCbOS+k+d6wGc4z7
         a0TbEeYun3rLJq0XgRFXLy9rXyJq3u3ggaI/jywcgyLioh3a0eirAuPSnGsW4YIX4WR+
         a0DAVaVGtk6VVcYQYkNu+PySqGPnQxysnnaytZW0azWDnLGxOpZCwE8ccva4Ad/yjo0S
         tefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686075977; x=1688667977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCJiurTsB5iW4U7Wd8e+ZWX3/DSr5KuisDlDkab9Kpk=;
        b=TkdZrZIrdJ6P4iMCZ8yRwTAZ3d3QIpAd0RMPYb9Ch8ZarkCfxbKo7PUomltRU4gReH
         fNujpP257EIkmFMHJzcbTfc5ScVANwyuDpi4muJJmCeD9wvapQwnGKIHeRZ+oJF7ajkN
         o7CQoS4G5m96yOR5fnobM9TD+Aj1KXPYkB7dCEJBXRwM/5in5Bjreo+bTJUd0TJF6JxB
         7rQvxY0jA/xMn5wVdOZ1Htz01NBRLARIfJC7Ccq8Gkgpq5kjQTeThg4VFJajffCuWLcx
         6Ij7UIFx44qqiLhwKsoyb5T8nhoW65vVNCd5lv9vewOYVAWUkhmfnT11BqnCjrdMRkcd
         srKw==
X-Gm-Message-State: AC+VfDwOzFXEqt+DLhXclow1EUXoQsGLBiyArOgRyez6clW/DHUKs6dM
	YGQwh1+/1G19JDCK/fpXPeZwJHt3/oG8f+Rkl8aA6w==
X-Google-Smtp-Source: ACHHUZ50FSrB0yF9QhGXxk0T+JmMsRhIzfrWx92mRvz/J/7ukuptT+0RFeYP+1dAH69u0Q8xocM1NWkPJEBAr6QfpOk=
X-Received: by 2002:a1f:6016:0:b0:464:7d75:fa58 with SMTP id
 u22-20020a1f6016000000b004647d75fa58mr1738820vkb.0.1686075977256; Tue, 06 Jun
 2023 11:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230606174703.1061623-1-joe.slater@windriver.com>
In-Reply-To: <20230606174703.1061623-1-joe.slater@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 Jun 2023 20:26:06 +0200
Message-ID: <CAMRc=McDA4gWS5fN9d9K619T0OQvjjPrXjmBC3DU+RAFKWfBVw@mail.gmail.com>
Subject: Re: [oe] [V2][meta-oe][PATCH 1/1] libgpiod: modify test 'gpioset:
 toggle (continuous)'
To: joe.slater@windriver.com
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 18:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103153

On Tue, Jun 6, 2023 at 7:47=E2=80=AFPM Joe Slater via lists.openembedded.or=
g
<joe.slater=3Dwindriver.com@lists.openembedded.org> wrote:
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
> index 0000000000..6ad43aa041
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-=
modify.patch
> @@ -0,0 +1,67 @@
> +From 4fc48e743de52562cd61de6cd74181392e4e75b7 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Fri, 19 May 2023 08:46:47 -0700
> +Subject: [libgpiod][PATCH v4] gpio-tools-test.bats: modify delays in
> + toggle test
> +
> +The test "gpioset: toggle (continuous)" uses fixed delays to test
> +toggling values.  This is not reliable, so we switch to looking
> +for transitions from one value to another.
> +
> +We wait for a transition up to 1.5 seconds.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103152): https://lists.openembedded.org/g/openembedde=
d-devel/message/103152
> Mute This Topic: https://lists.openembedded.org/mt/99368727/3618139
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [b=
rgl@bgdev.pl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

Can you take the patch as it appears upstream? With tweaked commit
message and my SoB?

Bart

