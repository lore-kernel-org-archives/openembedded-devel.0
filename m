Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC572C88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 13:27:18 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24895.1789306028811127774
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 06:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KcFSKNjY;
 spf=pass (domain: gmail.com, ip: 74.125.230.205, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067eso125513285a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 06:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789306028; cv=none;
        d=google.com; s=arc-20260327;
        b=CAguqLV2DRMVqsFlUWggzSn2Nk+n8kjuonkmvzT5m+xDKTAp3AFeY1yATPRLrPCHaj
         03R4M2F4WDKwg9Ef/y9tgEDdLX9pcPSlbUNpIrTNX6gqm0k8S8Tbb37wCBmDo6Ka5vVW
         RmSAr/+TicagYDRSKlC94/HuHFIih2AssswwTuAMIqdtcXbdPZ7qoy+JjEmhC67elSTR
         8jgc0fdmXZgBsDX52/IioGeWozSGcaWeJUyMAXTYrOgFiBahqpqvJLU91PCWkdz6n8Zw
         5ToCpPcY7xiQXgfBfTWU1yNGNsiBGS8vdtw8eq+4lSToH/c+pXNPEoq751G9CkVJT4yU
         p72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iv6X+7mbOcoq2QzvWee8qrL64C/w5rC1y3uP19t3Jl0=;
        fh=wYbLQ35nn8QErtmvldeOe8VUTzrgwTVdhh6Zx+8NAJA=;
        b=EpeS77FORridqVlKxwJzETRnSxOiuKyZvm1sEA2/QYlqaM1sjri6QYTZPh1Kwf0/Jw
         k+J1lgceFKsiIrH3jVwmVLRtQDgi/Sb7uUMiUzWLTeWSF7tErgHzRu7ECrUFYQ1mx28I
         E3k/ALUgjIWk+vwkR3SQn2onHXDoRTFw0CvWPSra1AlLzv+LMY2fJJp0X2mJtH2DeZXS
         nKwdcCu0/fMXiA/kYDchXZI1TFEcGzH2hg5Kx6D6LtqoA13HDGV+1DAx51JnK4IuFB2Y
         vSjRPURE+d/u25YmxXRXbJZ09LuPUt6NGx8/3/fVB6ODQU7DZQjEmG2PEEqjXgeKV5OH
         8edw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789306028; x=1789910828; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iv6X+7mbOcoq2QzvWee8qrL64C/w5rC1y3uP19t3Jl0=;
        b=KcFSKNjYyIPZeu6y4V5cb+DwdN66fFUVUtpIdFz+3dhT9wF07z1xeNOYVpOURlmHIp
         Zs1aUHPDatRUf82TFuBbNDsU8O7lLrNtsGqVAET3/pTw6UhoJP1vzpsevQ2sWGS7r4yD
         BP6rC67f6edt4K5OVA4Ede1mkgUvz1ApBVo4G9p5H26ugc4sbKNqfJfFEr0Mtw/bTvbs
         FW3CDyj/ezZLuV8fz/KSzh07aeFcMvdRwdq5sil0GkG1+nI8tQABe5QZid7+teZiocT7
         H+EBhVTxpkFIS2rsfWblDkfhktKAdnt0dMK3lZcTx6Ajw7boNeYRBSRugEpDTWKxLAt+
         p48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789306028; x=1789910828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iv6X+7mbOcoq2QzvWee8qrL64C/w5rC1y3uP19t3Jl0=;
        b=VScIwp4Q0wDtjvTJU4W60Rk9ziMRqyjmTzdyVkdZQDRSJ9qMaEOH+TmstrxTuFCUd+
         eGK5RXeaGwY/nStodhSTOX7paUIbztilNpV2KpZFg9NZq9GTTZ6HAXCD+luZK/8lGMmf
         xjbR4rp4Mre9rl3KDMDZNY0aUkNkp7HdrnI3gmgcqJBfkgBkS2GFuatPbOB6/SKKA29n
         gvZw+PDMPYuQmmKSymAEsdj/KJazlNQYqetCUviEo1z5PBAgd9C0ysi/JntPa7mc8ihM
         2iLBds8+l05HVzcGDFWFeT9DVfDPu7SPYtbzDcE3Mn9ec7MpLInF4KTV9lj4I1+1shD/
         ao3A==
X-Forwarded-Encrypted: i=1; AKwUvBzwtnsWlgyxrAfVo0WeHMuO+rJD6SficIpzyJs1qAzkwjpdysrS8iMgcdEou3o6jKuwezpk8a83clAlhaq/ME1nimY=@lists.openembedded.org
X-Gm-Message-State: AFuF++mRlLtH9Cr2PDGtwBiFNf5Rx6eomBPtGlV3/xbi3LSTdvOZF5XI
	XEmqx9cgMl7PNlm5hrnssY9fp+AH2W3JmSxN/+RcS20X+EtKIwLp66GcT4DM87m26FPZeMC75Z9
	2o/B3p8XSKWqpUbP/vlEvlwrwILhWZ58=
X-Gm-Gg: AYBFou0hPQYLm1mjAcU55eSVfYJODKUnizrpR/pTUym4q+pvUkw7h9moxHtWKkODGhY
	G09QWTouxsgz47qlLJ5syamrzPYMdd4TF0Sk3eFZ3KKSCMfycnCn8z0BouAo/L10AnX8kW+BwRF
	LbOZy0/6hYuTaxytM1IeW5AjJYoJAf0qyPuvyUhkPf9qPekuvVk4tqUXlevLbHyiX4GKx7gkPTE
	AEywTwsZ0xMRIwwjk/PGd7zxRaQIh/vZwQmEMmKUr+BEna+EVKYQ+K5n7Q9sGxMJy5MonlRTW8c
	rDo0/YuqPXw/EjGriZj2c23/5oSbZj2CrCFxd9DQVfJ7P3zPkHk86w==
X-Received: by 2002:a05:620a:3188:b0:939:acf1:dbc1 with SMTP id
 af79cd13be357-93a03645c6fmr921335985a.23.1789306027492; Sun, 13 Sep 2026
 06:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
 <CAMKF1soH4p+tYg5bfWQBmUe-fXS-JPxO09L_H94bkwannL=Thg@mail.gmail.com>
In-Reply-To: <CAMKF1soH4p+tYg5bfWQBmUe-fXS-JPxO09L_H94bkwannL=Thg@mail.gmail.com>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Sun, 13 Sep 2026 21:27:18 +0800
X-Gm-Features: AcwNN1XnEttJh162nHYSOyCfMnlRUQQB4XBj74z8GMfoTKQXNcG7qEq8RkdZfd4
Message-ID: <CAGfYmwWHtWOx-QSPFT1K7X84HiKC9nCAF6daCaGBe9wRxq=MWA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] libgpiod: handle disappearing chips during
 iteration for v1.6.x
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 13:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129993

On Sat, Sep 12, 2026 at 1:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Fri, Sep 11, 2026 at 2:17=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.com=
> wrote:
>>
>> Add a patch fixing an issue where tools like 'gpiofind' incorrectly abor=
t
>> with a 'No such device' (ENODEV) error if a hotpluggable GPIO controller
>> (like a USB device) vanishes from /dev during the search.
>>
>> This patch gracefully handles the race condition by ignoring ENODEV erro=
rs
>> when searching for a line and silently skipping chips that fail to open
>> during iteration.
>>
>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> ---
>> Changes in v3:
>> - Take the patch directly from the upstream libgpiod v1.6.x branch
>> - Change patch file Upstream-Status to "Accepted"
>> - Link to v2: https://patch.msgid.link/20260911-libgpiod-v1-6-5-handle-d=
isappearing-chips-v2-1-37b56013e2cc@gmail.com
>>
>> Changes in v2:
>> - Revise commit message
>> - Add Upstream-Status tag into patch file
>> - Link to v1: https://patch.msgid.link/20260910-libgpiod-v1-6-5-handle-d=
isappearing-chips-v1-1-fd2dfad2ca0f@gmail.com
>> ---
>>  ...ully-handle-disappearing-chips-during-ite.patch | 83 +++++++++++++++=
+++++++
>>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
>>  2 files changed, 87 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gra=
cefully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-suppor=
t/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-duri=
ng-ite.patch
>> new file mode 100644
>> index 0000000000..ab8d5a673c
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully=
-handle-disappearing-chips-during-ite.patch
>> @@ -0,0 +1,83 @@
>> +From 40f18f16f573e6bf091d83cb1677e7386d0b8495 Mon Sep 17 00:00:00 2001
>> +From: Potin Lai <potin.lai.pt@gmail.com>
>> +Date: Tue, 8 Sep 2026 21:05:07 +0800
>> +Subject: core: gracefully handle disappearing chips during iteration
>> +
>> +When hotpluggable GPIO controllers (like USB devices) are dynamically
>> +added or removed, a race condition can occur. A chip's device node migh=
t
>> +be present when iterating through /dev, but the chip could disappear by
>> +the time we try to open it or query its lines.
>> +
>> +Previously, this caused tools like 'gpiofind' to incorrectly abort with
>> +a 'No such device' (ENODEV) error if any chip on the system vanished
>> +during the search.
>> +
>> +Fix this by ignoring ENODEV errors when searching for a line
>> +(in gpiod_line_find()) and by silently skipping chips that fail to open
>> +during iteration (in gpiod_chip_iter_new()).
>> +
>> +Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> +Link: https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c775=
6aab9568@gmail.com
>> +Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>> +Upstream-Status: Accepted [https://git.kernel.org/pub/scm/libs/libgpiod=
/libgpiod.git/commit/?id=3D40f18f16f573e6bf091d83cb1677e7386d0b8495]
>
>
> Accepted is not a valid status, for details see - https://docs.yoctoproje=
ct.org/contributor-guide/recipe-style-guide.html#patch-upstream-status
>

Thanks for pointing me to the Upstream-Status guidelines. Just to
confirm, is Backport the recommended status to use for this patch?

Potin

>
>>
>> +---
>> + lib/helpers.c |  2 +-
>> + lib/iter.c    | 16 ++++------------
>> + 2 files changed, 5 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/lib/helpers.c b/lib/helpers.c
>> +index 479f370..6d1836a 100644
>> +--- a/lib/helpers.c
>> ++++ b/lib/helpers.c
>> +@@ -423,7 +423,7 @@ struct gpiod_line *gpiod_line_find(const char *name=
)
>> +                       return line;
>> +               }
>> +
>> +-              if (errno !=3D ENOENT)
>> ++              if (errno !=3D ENOENT && errno !=3D ENODEV)
>> +                       goto out;
>> +       }
>> +
>> +diff --git a/lib/iter.c b/lib/iter.c
>> +index bfd2852..7f5ad9a 100644
>> +--- a/lib/iter.c
>> ++++ b/lib/iter.c
>> +@@ -51,7 +51,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
>> +       if (!iter)
>> +               goto err_free_dirs;
>> +
>> +-      iter->num_chips =3D num_chips;
>> ++      iter->num_chips =3D 0;
>> +       iter->offset =3D 0;
>> +
>> +       if (num_chips =3D=3D 0) {
>> +@@ -64,23 +64,15 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
>> +               goto err_free_iter;
>> +
>> +       for (i =3D 0; i < num_chips; i++) {
>> +-              iter->chips[i] =3D gpiod_chip_open_by_name(dirs[i]->d_na=
me);
>> +-              if (!iter->chips[i])
>> +-                      goto err_close_chips;
>> ++              iter->chips[iter->num_chips] =3D gpiod_chip_open_by_name=
(dirs[i]->d_name);
>> ++              if (iter->chips[iter->num_chips])
>> ++                      iter->num_chips++;
>> +       }
>> +
>> +       free_dirs(dirs, num_chips);
>> +
>> +       return iter;
>> +
>> +-err_close_chips:
>> +-      for (i =3D 0; i < num_chips; i++) {
>> +-              if (iter->chips[i])
>> +-                      gpiod_chip_close(iter->chips[i]);
>> +-      }
>> +-
>> +-      free(iter->chips);
>> +-
>> + err_free_iter:
>> +       free(iter);
>> +
>> +--
>> +cgit 1.3.1-korg
>> +
>> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-o=
e/recipes-support/libgpiod/libgpiod_1.6.5.bb
>> index 45af4f8bb0..d43fe90480 100644
>> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
>> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
>> @@ -3,7 +3,10 @@ require libgpiod.inc
>>  LICENSE =3D "LGPL-2.1-or-later"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2caced0b25dfefd4c601d92bd151=
16de"
>>
>> -SRC_URI +=3D "file://0001-bindings-cxx-disable-tests.patch"
>> +SRC_URI +=3D " \
>> +    file://0001-bindings-cxx-disable-tests.patch \
>> +    file://0002-core-gracefully-handle-disappearing-chips-during-ite.pa=
tch \
>> +"
>>
>>  SRC_URI[sha256sum] =3D "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124f=
b3fba24619daa72bc"
>>
>>
>> ---
>> base-commit: cbec9a20d78add94235042c601e991574151e36e
>> change-id: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d98=
09
>>
>> Best regards,
>> --
>> Potin Lai <potin.lai.pt@gmail.com>
>>

