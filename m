Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F42C79FB6
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 05:47:28 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1415.1789192039321847349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 22:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=piPdEP+M;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8659af7454eso2073707b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 22:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789192038; cv=none;
        d=google.com; s=arc-20260327;
        b=rDYNE3F0mHuAvJ5eGZ+WTIohDjoQKAE1NvBjLkdjMX5A3dzzo/tT4Cn/avLk+lcJqK
         ZR8/UFqNs0gAWzyP3W2bV00NIUJ2yb+Ezb59VP/rUw7R51Wf7HvMCXJcjVefKJ58qLL/
         bOEmozWFqFezOBeCEk3kEi75CwjeMhzkiANBBJEla0oR4enq99G2nrtrIyt6wFRU2MFK
         DQRD9UW9vZAh342O5JoKEsCJAI7qkpCmUiT++zTNrVcqk1wu4lmyz5FF5HjzaRK70IZs
         wUONnYxBlW3LY3qNg3wCYNc+jnRMX2yRSg4ubAmlo1HfGd77yK52yH/TdoCgUt3UeO59
         Uazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q6YBhZuJKYO119EkT8o9LV8xNz+iul1j4cXht1qtCHc=;
        fh=Am4WGar0rd3hmQV6gaX6vDgOE7iUnkfbpAlsaLU/B8A=;
        b=gH9JpeicBELsmyl9UpvMkF5CdUstMa+JkNdxb6V/z7SZyBSo8T95ELevlBEolTPjOr
         EfIrAYMx1m2CUXpHlWhdNBT9M4MLLdnGzpsvAM3R2asouxB8HP+v6KyzV80mNIfKDDee
         RXaK/D9L/nhqCcXZD4rROiC2ZU1u+X05xntYUrnyZPoPOWRYp5Mq7C7cifKoc+GqicBH
         m6jCXGRaYJJt6FfcuYFdtEjXfZ607ks8Hc40qxTG1YXThcuzgVkCcr4VAuPWNqhXq7/g
         iuEwZzo8RRzQt7ZHIrGKqB1lfivfOk3M+MG+KT0lHEVShCmTLEMqsDnDk2U+8ltASRzT
         wxlw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789192038; x=1789796838; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6YBhZuJKYO119EkT8o9LV8xNz+iul1j4cXht1qtCHc=;
        b=piPdEP+Mmb6NeV1fVYt9G2gUFI0vgBPoeGczm2fcQFeQO68739Qkss4fwVZea+rwGV
         8AYCqHM8t14qBPGMMNVFIVuC2Hr4fOUWe/VBUfs7TbQC+qpzEicjyDK5lDxv1eyPPbKn
         VsLevFh8ytf6HYZpKcRvQQ2403R8NhGz5dGvJQ0YDeUloukzKTMkzJ2k9Bh9vBM4q6xa
         ziVFZV2Y2EYEJV5UBI26Ri4oc/qRrXANi8CV74igsRd0DfCPb9S7X+QjzGDMTkfh3PNG
         ulidnRwbaO+MI/hLWbbzj5xzvKORe4zLfHIZrIX/m7o9DDm+Ml9S4fnkc7W+N0//Pblx
         UM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789192038; x=1789796838;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q6YBhZuJKYO119EkT8o9LV8xNz+iul1j4cXht1qtCHc=;
        b=Sw7zly9WNyFYCC3b1zkU2llNEgyYEyehShxX6/uo9PlyKeri9rwW8glhrGQcJrlmwf
         K3kZ1Kp264tXM9RY1ktAqAeczh6F7VGC2ok6Yc0kjLQSJ3WkDfsYMn2bTgvsmaj0JRlf
         Ipi0GBDtZmeQ6HdmaNz23prFpL9yiWZN2Rz3oeZAeZlFO//szSxPErT4VTYziaIwSyr0
         IV8SopXhtPdeIJp5QjX6Qeh5xHqICnm8xjkoghpsVMcJQN9YrBAz05J6+fgqzzU3l/3n
         On1mHe0Cp71RatRkcol071Zv/Dw4dxzA37dETPT0Xy4kIVE6olXkuI2bJ1CV0pWUPr/F
         6sGQ==
X-Forwarded-Encrypted: i=1; AKwUvBze/uGhINSkkKW7/ExI4YqNETNs/jWg7NGkKloFpn+LPgLwsH23i9UQyavQ3r0qIK48aEmd3nRGs69I9RojswclYzk=@lists.openembedded.org
X-Gm-Message-State: AFuF++krZTliqz659oHnjqlBoT2QSISaO+a2hLX82BN8Ie82l/FK/hiT
	y2AO9C8njdXXstqs/syq+tJLsJhNHtyV9lYhCQ7imcs89BqCv2oMw3YGfycLTYMWycP041O/hj3
	BKcHAGiHYd6EGP0JXd/nyDh3NVOm7k6k=
X-Gm-Gg: AYBFou3cjhJNEW+wDUiyKhIuL+p1pUwv5R/qyD4nzka8kMvX1+soE3Zx6sIqWSQ9dDb
	1UhflzMU2uR8MwFotBQnZIlgBFTNLxre6kcDT1X0OcSoe7XMQlIKmqCmrUDvttlCUTELbJLyE+F
	NUKESHdCMXdIiBvXjvQ1FcjLJkMqDOq0NU04kLqYmx00jFufWS0LC+TacZv/MnhxA4SjukYBhKv
	Y650XoUl9JUbP8rd7U/W4mErY37GuMuYqtaWqUcv0e7eG01BNLHf9rHhxyY4K8coKufjS3E27dr
	LMGXNLsqfwuKhd5beFc/hTgYqZAIJLAdIw2Wm/KCVbhDcWbuaoadQ+CZiGLzltiksw0PFNuKpda
	qY4Rm2+9S3V4yucQitSN8fYsJOdXtzyAbTZU1mdAl2cfisU2VE4P0GFncicDXlkIjUOFH9EsJEn
	ZXCw1/Jg2HQzIF6CRiZ+k58/vfFmM8EhGYmPV3u7ZCd+AczhYa+Io+lyMAX5CS0NWHdU2tzYe/E
	aJ+SA+4AwgUMl4XUgAhfWQc
X-Received: by 2002:a05:690c:338b:b0:873:5c0f:28b with SMTP id
 00721157ae682-887ae01cc8cmr3443407b3.53.1789192038220; Fri, 11 Sep 2026
 22:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
In-Reply-To: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Sep 2026 22:46:52 -0700
X-Gm-Features: AcwNN1UIZGqRdU5wI7Anakhr3l7nRdXyWJRaBDO1Jy_10Bb0GUPaE3UF-qta5Dc
Message-ID: <CAMKF1soH4p+tYg5bfWQBmUe-fXS-JPxO09L_H94bkwannL=Thg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] libgpiod: handle disappearing chips during
 iteration for v1.6.x
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000df8649065b42bb5d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 05:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129979

--000000000000df8649065b42bb5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 2:17=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.com> =
wrote:

> Add a patch fixing an issue where tools like 'gpiofind' incorrectly abort
> with a 'No such device' (ENODEV) error if a hotpluggable GPIO controller
> (like a USB device) vanishes from /dev during the search.
>
> This patch gracefully handles the race condition by ignoring ENODEV error=
s
> when searching for a line and silently skipping chips that fail to open
> during iteration.
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Changes in v3:
> - Take the patch directly from the upstream libgpiod v1.6.x branch
> - Change patch file Upstream-Status to "Accepted"
> - Link to v2:
> https://patch.msgid.link/20260911-libgpiod-v1-6-5-handle-disappearing-chi=
ps-v2-1-37b56013e2cc@gmail.com
>
> Changes in v2:
> - Revise commit message
> - Add Upstream-Status tag into patch file
> - Link to v1:
> https://patch.msgid.link/20260910-libgpiod-v1-6-5-handle-disappearing-chi=
ps-v1-1-fd2dfad2ca0f@gmail.com
> ---
>  ...ully-handle-disappearing-chips-during-ite.patch | 83
> ++++++++++++++++++++++
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
>  2 files changed, 87 insertions(+), 1 deletion(-)
>
> diff --git
> a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-hand=
le-disappearing-chips-during-ite.patch
> b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-hand=
le-disappearing-chips-during-ite.patch
> new file mode 100644
> index 0000000000..ab8d5a673c
> --- /dev/null
> +++
> b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-hand=
le-disappearing-chips-during-ite.patch
> @@ -0,0 +1,83 @@
> +From 40f18f16f573e6bf091d83cb1677e7386d0b8495 Mon Sep 17 00:00:00 2001
> +From: Potin Lai <potin.lai.pt@gmail.com>
> +Date: Tue, 8 Sep 2026 21:05:07 +0800
> +Subject: core: gracefully handle disappearing chips during iteration
> +
> +When hotpluggable GPIO controllers (like USB devices) are dynamically
> +added or removed, a race condition can occur. A chip's device node might
> +be present when iterating through /dev, but the chip could disappear by
> +the time we try to open it or query its lines.
> +
> +Previously, this caused tools like 'gpiofind' to incorrectly abort with
> +a 'No such device' (ENODEV) error if any chip on the system vanished
> +during the search.
> +
> +Fix this by ignoring ENODEV errors when searching for a line
> +(in gpiod_line_find()) and by silently skipping chips that fail to open
> +during iteration (in gpiod_chip_iter_new()).
> +
> +Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> +Link:
> https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7756aab9568=
@gmail.com
> +Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
> +Upstream-Status: Accepted [
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3D40=
f18f16f573e6bf091d83cb1677e7386d0b8495
> ]
>

Accepted is not a valid status, for details see -
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#pat=
ch-upstream-status



> +---
> + lib/helpers.c |  2 +-
> + lib/iter.c    | 16 ++++------------
> + 2 files changed, 5 insertions(+), 13 deletions(-)
> +
> +diff --git a/lib/helpers.c b/lib/helpers.c
> +index 479f370..6d1836a 100644
> +--- a/lib/helpers.c
> ++++ b/lib/helpers.c
> +@@ -423,7 +423,7 @@ struct gpiod_line *gpiod_line_find(const char *name)
> +                       return line;
> +               }
> +
> +-              if (errno !=3D ENOENT)
> ++              if (errno !=3D ENOENT && errno !=3D ENODEV)
> +                       goto out;
> +       }
> +
> +diff --git a/lib/iter.c b/lib/iter.c
> +index bfd2852..7f5ad9a 100644
> +--- a/lib/iter.c
> ++++ b/lib/iter.c
> +@@ -51,7 +51,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
> +       if (!iter)
> +               goto err_free_dirs;
> +
> +-      iter->num_chips =3D num_chips;
> ++      iter->num_chips =3D 0;
> +       iter->offset =3D 0;
> +
> +       if (num_chips =3D=3D 0) {
> +@@ -64,23 +64,15 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
> +               goto err_free_iter;
> +
> +       for (i =3D 0; i < num_chips; i++) {
> +-              iter->chips[i] =3D gpiod_chip_open_by_name(dirs[i]->d_nam=
e);
> +-              if (!iter->chips[i])
> +-                      goto err_close_chips;
> ++              iter->chips[iter->num_chips] =3D
> gpiod_chip_open_by_name(dirs[i]->d_name);
> ++              if (iter->chips[iter->num_chips])
> ++                      iter->num_chips++;
> +       }
> +
> +       free_dirs(dirs, num_chips);
> +
> +       return iter;
> +
> +-err_close_chips:
> +-      for (i =3D 0; i < num_chips; i++) {
> +-              if (iter->chips[i])
> +-                      gpiod_chip_close(iter->chips[i]);
> +-      }
> +-
> +-      free(iter->chips);
> +-
> + err_free_iter:
> +       free(iter);
> +
> +--
> +cgit 1.3.1-korg
> +
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> index 45af4f8bb0..d43fe90480 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> @@ -3,7 +3,10 @@ require libgpiod.inc
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2caced0b25dfefd4c601d92bd1511=
6de"
>
> -SRC_URI +=3D "file://0001-bindings-cxx-disable-tests.patch"
> +SRC_URI +=3D " \
> +    file://0001-bindings-cxx-disable-tests.patch \
> +
> file://0002-core-gracefully-handle-disappearing-chips-during-ite.patch \
> +"
>
>  SRC_URI[sha256sum] =3D
> "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
>
>
> ---
> base-commit: cbec9a20d78add94235042c601e991574151e36e
> change-id: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d980=
9
>
> Best regards,
> --
> Potin Lai <potin.lai.pt@gmail.com>
>
>

--000000000000df8649065b42bb5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11,=
 2026 at 2:17=E2=80=AFAM Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail=
.com">potin.lai.pt@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Add a patch fixing an issue where tools like &#=
39;gpiofind&#39; incorrectly abort<br>
with a &#39;No such device&#39; (ENODEV) error if a hotpluggable GPIO contr=
oller<br>
(like a USB device) vanishes from /dev during the search.<br>
<br>
This patch gracefully handles the race condition by ignoring ENODEV errors<=
br>
when searching for a line and silently skipping chips that fail to open<br>
during iteration.<br>
<br>
Signed-off-by: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.com" targ=
et=3D"_blank">potin.lai.pt@gmail.com</a>&gt;<br>
---<br>
Changes in v3:<br>
- Take the patch directly from the upstream libgpiod v1.6.x branch<br>
- Change patch file Upstream-Status to &quot;Accepted&quot;<br>
- Link to v2: <a href=3D"https://patch.msgid.link/20260911-libgpiod-v1-6-5-=
handle-disappearing-chips-v2-1-37b56013e2cc@gmail.com" rel=3D"noreferrer" t=
arget=3D"_blank">https://patch.msgid.link/20260911-libgpiod-v1-6-5-handle-d=
isappearing-chips-v2-1-37b56013e2cc@gmail.com</a><br>
<br>
Changes in v2:<br>
- Revise commit message<br>
- Add Upstream-Status tag into patch file<br>
- Link to v1: <a href=3D"https://patch.msgid.link/20260910-libgpiod-v1-6-5-=
handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com" rel=3D"noreferrer" t=
arget=3D"_blank">https://patch.msgid.link/20260910-libgpiod-v1-6-5-handle-d=
isappearing-chips-v1-1-fd2dfad2ca0f@gmail.com</a><br>
---<br>
=C2=A0...ully-handle-disappearing-chips-during-ite.patch | 83 +++++++++++++=
+++++++++<br>
=C2=A0meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.5.bb</a> |=C2=A0 5 +-<br=
>
=C2=A02 files changed, 87 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracef=
ully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-support/l=
ibgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chips-during-=
ite.patch<br>
new file mode 100644<br>
index 0000000000..ab8d5a673c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-ha=
ndle-disappearing-chips-during-ite.patch<br>
@@ -0,0 +1,83 @@<br>
+From 40f18f16f573e6bf091d83cb1677e7386d0b8495 Mon Sep 17 00:00:00 2001<br>
+From: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.com" target=3D"_b=
lank">potin.lai.pt@gmail.com</a>&gt;<br>
+Date: Tue, 8 Sep 2026 21:05:07 +0800<br>
+Subject: core: gracefully handle disappearing chips during iteration<br>
+<br>
+When hotpluggable GPIO controllers (like USB devices) are dynamically<br>
+added or removed, a race condition can occur. A chip&#39;s device node mig=
ht<br>
+be present when iterating through /dev, but the chip could disappear by<br=
>
+the time we try to open it or query its lines.<br>
+<br>
+Previously, this caused tools like &#39;gpiofind&#39; to incorrectly abort=
 with<br>
+a &#39;No such device&#39; (ENODEV) error if any chip on the system vanish=
ed<br>
+during the search.<br>
+<br>
+Fix this by ignoring ENODEV errors when searching for a line<br>
+(in gpiod_line_find()) and by silently skipping chips that fail to open<br=
>
+during iteration (in gpiod_chip_iter_new()).<br>
+<br>
+Signed-off-by: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.com" tar=
get=3D"_blank">potin.lai.pt@gmail.com</a>&gt;<br>
+Link: <a href=3D"https://patch.msgid.link/20260908-gpiofind-error-enodev-v=
1-1-c7756aab9568@gmail.com" rel=3D"noreferrer" target=3D"_blank">https://pa=
tch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7756aab9568@gmail.com</=
a><br>
+Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.golaszews=
ki@oss.qualcomm.com" target=3D"_blank">bartosz.golaszewski@oss.qualcomm.com=
</a>&gt;<br>
+Upstream-Status: Accepted [<a href=3D"https://git.kernel.org/pub/scm/libs/=
libgpiod/libgpiod.git/commit/?id=3D40f18f16f573e6bf091d83cb1677e7386d0b8495=
" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/libs/=
libgpiod/libgpiod.git/commit/?id=3D40f18f16f573e6bf091d83cb1677e7386d0b8495=
</a>]<br></blockquote><div><br></div><div>Accepted is not a valid status, f=
or details see -=C2=A0<a href=3D"https://docs.yoctoproject.org/contributor-=
guide/recipe-style-guide.html#patch-upstream-status">https://docs.yoctoproj=
ect.org/contributor-guide/recipe-style-guide.html#patch-upstream-status</a>=
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
+---<br>
+ lib/helpers.c |=C2=A0 2 +-<br>
+ lib/iter.c=C2=A0 =C2=A0 | 16 ++++------------<br>
+ 2 files changed, 5 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/lib/helpers.c b/lib/helpers.c<br>
+index 479f370..6d1836a 100644<br>
+--- a/lib/helpers.c<br>
++++ b/lib/helpers.c<br>
+@@ -423,7 +423,7 @@ struct gpiod_line *gpiod_line_find(const char *name)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return line;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOENT &a=
mp;&amp; errno !=3D ENODEV)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+diff --git a/lib/iter.c b/lib/iter.c<br>
+index bfd2852..7f5ad9a 100644<br>
+--- a/lib/iter.c<br>
++++ b/lib/iter.c<br>
+@@ -51,7 +51,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!iter)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_free_dirs;=
<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 iter-&gt;num_chips =3D num_chips;<br>
++=C2=A0 =C2=A0 =C2=A0 iter-&gt;num_chips =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iter-&gt;offset =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_chips =3D=3D 0) {<br>
+@@ -64,23 +64,15 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_free_iter;=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_chips; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iter-&gt;chips[i] =3D gp=
iod_chip_open_by_name(dirs[i]-&gt;d_name);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!iter-&gt;chips[i])<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto err_close_chips;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iter-&gt;chips[iter-&gt;=
num_chips] =3D gpiod_chip_open_by_name(dirs[i]-&gt;d_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iter-&gt;chips[iter-=
&gt;num_chips])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 iter-&gt;num_chips++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free_dirs(dirs, num_chips);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return iter;<br>
+ <br>
+-err_close_chips:<br>
+-=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; num_chips; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iter-&gt;chips[i])<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gpiod_chip_close(iter-&gt;chips[i]);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 free(iter-&gt;chips);<br>
+-<br>
+ err_free_iter:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(iter);<br>
+ <br>
+-- <br>
+cgit 1.3.1-korg<br>
+<br>
diff --git a/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.5.bb</a> b/meta-o=
e/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">libgpiod_1.6.5.bb</a><br>
index 45af4f8bb0..d43fe90480 100644<br>
--- a/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.5.bb</a><br>
+++ b/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.5.bb</a><br>
@@ -3,7 +3,10 @@ require libgpiod.inc<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2caced0b25dfefd4c601d=
92bd15116de&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-bindings-cxx-disable-tests.patch&quot;<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://0001-bindings-cxx-disable-tests.patch \<br>
+=C2=A0 =C2=A0 file://0002-core-gracefully-handle-disappearing-chips-during=
-ite.patch \<br>
+&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ae280f697bf035a1fb780c9972e5c81d0d2712b7=
ab6124fb3fba24619daa72bc&quot;<br>
<br>
<br>
---<br>
base-commit: cbec9a20d78add94235042c601e991574151e36e<br>
change-id: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d9809<=
br>
<br>
Best regards,<br>
--=C2=A0 <br>
Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.com" target=3D"_blank">p=
otin.lai.pt@gmail.com</a>&gt;<br>
<br>
</blockquote></div></div>

--000000000000df8649065b42bb5d--

