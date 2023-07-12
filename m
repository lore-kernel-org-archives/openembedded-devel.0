Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EF9EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 16:03:13 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.11388.1689177789905582077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 09:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ges2XfIL;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a3fbfb616dso2483012b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689177789; x=1691769789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T+HOKDEiniZgANK1H4+U4PdAvMrNy/Tv7ii99GtGLU=;
        b=Ges2XfILyCfrO6MjrPhjgof+Xrr2lDpIygts15b3a372kWJoKQdKP9X9ZRFlh06TPF
         KqMVzT12xw61nrURTW9yOMYZXluIMj1VXldX+I5u4nQq1pQtJjIhm8t9Plmyu/rvCDc2
         MSdtx213GNDKjMTtto4ttwjGg82/uAdTQk2LaFgGoBtiSUHkcjQHMDOr0Ae8YNnEpFjf
         3EsYUz8alzapB3XXE7beYqWjYqEUJtOJXMUOApR4tv3PiVab7QnGEvQKGVoEyEWmiJAg
         N8OhjEZ1/lGW85UnvMJpBmsvMZNLOIhW4wSm5bm5MP4ymcE0oGey5rLJZz5+FVm3r2pB
         YVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689177789; x=1691769789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1T+HOKDEiniZgANK1H4+U4PdAvMrNy/Tv7ii99GtGLU=;
        b=Fthos6364benk25wbxHHmYkDDRiIgb/3o7CkFn8wUQNtlBfPSjuc7PVxrW2zPWalb5
         48s9Nh7UiMxAHUpWoWXjlOZ06uYwGy/8POzxE2dAxIwl81ZkT/pU5rn9RXA4EfIw1vvC
         6O/bxRaxium22HKHNauVphkOOshGlDVAWitsjUJOKlKkeAr0+uE09T01A7UFP4pjET1U
         yRMnlB/R1z8SAS0fwx9akong3dhzSkgT1VszGuUoOKU33mqpDi+mvDnwuaFica556iOu
         lX/iS+LZp+17b/1IlutK0mFKSWqi07+j2laRi42a4cegCuDIMRtXsvTSpY6FVWXxu2J7
         hvjg==
X-Gm-Message-State: ABy/qLYhPXucOoKVXvI5rx9IL3KeprqQsgFxdLE9PHItpmGCcbM1AhlR
	CCsHVDUmoLU6pmeyDiBudOJI4KX2Vsq8eK10+dy2P108
X-Google-Smtp-Source: APBJJlHATThhDDN9jfAH6XlPiR9jltdWzTYZYky0EPCSzXgmcKgk/i5RsXl9iVYhE/QC98JTL3W0Fg0E2Fea0taR7Xs=
X-Received: by 2002:a4a:8502:0:b0:566:f6a0:87e4 with SMTP id
 k2-20020a4a8502000000b00566f6a087e4mr790752ooh.0.1689177788738; Wed, 12 Jul
 2023 09:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230712145735.88665-1-michael.weiss@aisec.fraunhofer.de>
In-Reply-To: <20230712145735.88665-1-michael.weiss@aisec.fraunhofer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jul 2023 09:02:42 -0700
Message-ID: <CAMKF1so6vWnWDdDADO-N6gcc1UiYyZgGCefDC-_LXkSjP+QcTw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pv: Show progress bar even if no terminal
 is set as in 1.6.6
To: =?UTF-8?Q?Michael_Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 16:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103844

On Wed, Jul 12, 2023 at 7:58=E2=80=AFAM Michael Wei=C3=9F
<michael.weiss@aisec.fraunhofer.de> wrote:
>
> The currently used version 1.6.20 of pv does not show the progress
> bar if no controlling terminal is set. Added a patch which restores
> previous behavior of pv as in version 1.6.6.
>
> Tested with pv in the busybox initscript of GyroidOS which is
> running on /dev/console (which has no controlling tty). With this
> fix, we get the progress bar back on /dev/console as before.
>
> This was also submitted upstream but dangling since several Months:
>         https://github.com/a-j-wood/pv/pull/64
>
> Signed-off-by: Michael Wei=C3=9F <michael.weiss@aisec.fraunhofer.de>
> ---
>  ...e-error-of-tcgetpgrp-in-pv_in_foregr.patch | 38 +++++++++++++++++++
>  meta-oe/recipes-support/pv/pv_1.6.20.bb       |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pv/pv/0001-pv-display-handle-=
error-of-tcgetpgrp-in-pv_in_foregr.patch
>
> diff --git a/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-o=
f-tcgetpgrp-in-pv_in_foregr.patch b/meta-oe/recipes-support/pv/pv/0001-pv-d=
isplay-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
> new file mode 100644
> index 000000000..3c364dcc4
> --- /dev/null
> +++ b/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcget=
pgrp-in-pv_in_foregr.patch
> @@ -0,0 +1,38 @@
> +From c5cd932fb08e7ce90cdbf9ae6c5cc7e65ac0738e Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Michael=3D20Wei=3DC3=3D9F?=3D <michael.weiss@aisec.fra=
unhofer.de>
> +Date: Tue, 9 May 2023 20:00:26 +0200
> +Subject: [PATCH] pv/display: handle error of tcgetpgrp() in pv_in_foregr=
ound()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Show pv progress bar even if no terminal is set, e.g., in a busybox
> +init script. The description of pv_in_forground() states it will
> +return true "if we aren't outputting to a terminal". However, this
> +is not the case since tcgetpgrg() will return an error and set ERRNO
> +to ENOTTY if the output fd is not an tty. We now handle this error
> +correctly and pv_in_foreground() returns also true in that case.
> +
> +Signed-off-by: Michael Wei=C3=9F <michael.weiss@aisec.fraunhofer.de>
> +---
> + src/pv/display.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/pv/display.c b/src/pv/display.c
> +index aff643b..8d1f4c9 100644
> +--- a/src/pv/display.c
> ++++ b/src/pv/display.c
> +@@ -48,6 +48,10 @@ bool pv_in_foreground(void)
> +
> +       our_process_group =3D getpgrp();
> +       tty_process_group =3D tcgetpgrp(STDERR_FILENO);
> ++
> ++      if (tty_process_group =3D=3D -1 && errno =3D=3D ENOTTY)
> ++              return true;
> ++
> +       if (our_process_group =3D=3D tty_process_group)
> +               return true;
> +
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-su=
pport/pv/pv_1.6.20.bb
> index 867a621d1..87b764ac5 100644
> --- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
> +++ b/meta-oe/recipes-support/pv/pv_1.6.20.bb
> @@ -5,6 +5,7 @@ LICENSE =3D "Artistic-2.0"
>  LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D9c50db2589ee3ef10a9b7b2e5=
0ce1d02"
>
>  SRC_URI =3D "https://www.ivarch.com/programs/sources/${BP}.tar.bz2 \
> +           file://0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_for=
egr.patch" \

There is a spurious end of quote ( " ) above. How was this patch tested ?

>             file://run-ptest \
>  "
>  SRC_URI[sha256sum] =3D "e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88=
d5a3188814fdc603"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103842): https://lists.openembedded.org/g/openembedde=
d-devel/message/103842
> Mute This Topic: https://lists.openembedded.org/mt/100101204/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

