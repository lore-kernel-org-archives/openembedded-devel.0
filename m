Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2397C88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 13:57:28 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25189.1789307840317332559
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 06:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZKZuUntr;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f943b286fso762537d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 06:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789307839; cv=none;
        d=google.com; s=arc-20260327;
        b=FUERiW60/KLx5B/YFr1qAzn1JQqsnwFJk2FGc+cc3uZpwg7cRt9pTph+WcJZoaH5YQ
         8z2O5rwtcgLMKfH3JRfyOcZlhSfEIJNjGaCURKrHVFY59wiNbEGhDjVY8Wq92HjN71U9
         d1+bdkIjROQl90gXfTDu3iMc9FS+Zv7RhtzkWLGBn4Evd6YdvNZ8kx2yWAqcfcHDKMK5
         vWeewVn7FN5E7M9Vtf+bcEbUuLNztV+bMnjMUeo1R1fthkD3BW9sOdUqCUG+duzVW46M
         o1MwWvoHzZKJ912ds0Lp4cVJc5tEvIhqhGUAsL89TRUbYrwuJsB7/ZCHYzV744yfxp8d
         fjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nZe6RTMHb4sRIkiAK5TxlqU0J2uBf4+ea4/tEV6Iiow=;
        fh=CB7qAS9hpqQKI4k78IzRPLDghlPgytSBCa5truNaQy0=;
        b=YNoId+QiEXSFXqGGEUibUSQRKzPe60cb0UMFufZ88M70r/+QrJvn48SvVXfgNwSFJP
         Vdz0OsW8gCYd9PkTQFtNTGk+jyV8YYw3H/VhhykPhUEobHs1YjApnY11+rsIM4PJ8I1c
         xg0/V7qs8dEGyfwuQ+qvl8JROjNsj0mPjvbG+S6IWW4qkpjIQ3pAaE+CVVtaAKe0U8TJ
         +dsySYZL01wa/erKfbqVLWP73S8bsbCdB+dsLyutpWjan2wgicG0dqZeWedX2qAqyRfK
         Y+wjKEKqKe4zbfOxtt6F6U2+GcehBnJoh6WebIZdwBqYeq11wOrHqOeuEDkaf/RGtaJM
         ug6Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789307839; x=1789912639; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZe6RTMHb4sRIkiAK5TxlqU0J2uBf4+ea4/tEV6Iiow=;
        b=ZKZuUntrc/hJHAJCHlaKk9R3+BLd8qtJwm7eVGPEX7I6mXX8DNvg/mgt86pJuX62E3
         3/eDiwcmmk86QGZhdNZBfwekwuwpu1RcYiXHvTqOUvnbyi4+0tSjp5V1FqsQ4QB3JNIj
         /U9qIAJtICeDVWk9syKt82XSaC+39QR+PAkyfY3IAPF9DiRXjeHYaizLf+OXiqb/9Th2
         KKpAOLe+qNXqCwk8yu+zT2t4wyofqrsCXTgq/MBiR57SbfsP9jZyWuTwxrkJg2j9P6k4
         ZlrN/kvhsaX9Nl81IT6hFfT+0kQZjc8zpK+cHg4n38N1p1Tz4R+Ip/pgcFQdX3+tneIA
         ku2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789307839; x=1789912639;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nZe6RTMHb4sRIkiAK5TxlqU0J2uBf4+ea4/tEV6Iiow=;
        b=X50mrHuwS4A6beE9kvI/Qn2iv/pMKVakCNN4eAInatM6fg3WQ65QR+O5Rh6HVqdYQB
         IlL6XL73/XCyOP7utXdCdxM1dGEdwot/Mqwk7HBEOFp+l7lG/1pO9EjTY2dqLAUjD941
         abJuLEgzD7LimZ6O1TQ//c4YMHOz3c8TSXdqFZuZLaEcgOrRAvKczq55xkNEXUJGkPOD
         gyytT/Zl3+uyRXgQWWNpTZX6g8aCJekLJxyqGg9fisZvavaAas0rP0BAxbrawsjutAy8
         IoygS5UYUblYq891e4ot8iTOCKtQSWg3EXyoz7jwLU3Xh5e73tYx/08rPPpSp0ry7Jku
         ODfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn6ZAW5YXOZGJYWZ3x06ZSaASIIvdbcgt0c+ARUh+VWEKwEpL1XspBDyO0WMOi4ATkLfkicBnNXmC+zCg10Zj1UeU=@lists.openembedded.org
X-Gm-Message-State: AFuF++mogRldVbpe+M/0IGNiVn4Ki6g/Cn7djPMHJdZM++kaV5JPVVKX
	Lmhd8qcsTmcWIiuRxFU5M++5sLr+EsksMqBcIyP9dxHOcgi2+z2NeQte+NhwK4dYKIL1YomFOQq
	0nDcJ+0BtrtKD0PQdbx+DPKCguhD+0E8=
X-Gm-Gg: AYBFou1zO9NKSA/y/dYDY0Qjqrdy9GXa+gml9Xu1G3XKAEcqKGV0Y1OzvNJPv2pZkwl
	Iu1XMZpVl05nssm82yTLqEOeHAJvu5rYr7b939f8F75jRSJsSdzcVcgd9IFIsP/FMv4dGEdNzKE
	1emREfG2++Y9rY1X7uFaZczylW4hti1xbosx0J/+XdO2nq/dNlIzswNZr6WvpHvxgP4FXuf/BlP
	asrsp1qIfA7U/r2usYiTqsW217SwfLbUS8PlEQULnlZj0tUkzlhROgDhCw49ZOSt5PRGu+i5qz8
	5XmxRbgb7WaFfLG+Dl9X7lCC75mpCoCk+/st5R6JnNVuhkfJ9DSYrXlWpohuOSoFW4kDDp+UCCq
	wcY6Z9gVvOyAfD90U+5kbJGXFC2UmAOakqLH3Yt8zC+MREpeQvLvKsvaMVjBVqxE5ywWc/0soHf
	k2l6WKQ04uN1DlpvC6SlQ40kHqjI5aC3vv62PCvjwBC/anA1IzEif6lw3O4ruGZaZBYy2tFuE6/
	oBccw4KI8xAqG28Wt4T6ZuV559a/+5nQRk=
X-Received: by 2002:a05:690e:1c1a:b0:671:3b67:8a7a with SMTP id
 956f58d0204a3-6713b679b90mr1217304d50.42.1789307839245; Sun, 13 Sep 2026
 06:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
 <CAMKF1soH4p+tYg5bfWQBmUe-fXS-JPxO09L_H94bkwannL=Thg@mail.gmail.com> <CAGfYmwWHtWOx-QSPFT1K7X84HiKC9nCAF6daCaGBe9wRxq=MWA@mail.gmail.com>
In-Reply-To: <CAGfYmwWHtWOx-QSPFT1K7X84HiKC9nCAF6daCaGBe9wRxq=MWA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Sep 2026 06:57:07 -0700
X-Gm-Features: AcwNN1W97CIJB3OrWUc0tVCsadK6XTr54d6Zphy3CVbd71nmlzOwo3M81EeWkdI
Message-ID: <CAMKF1soO_1yQYj0GWXzbsKYnyVuxT8s6aORs=XL1RP2q9QZEMg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: handle disappearing chips
 during iteration for v1.6.x
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000026f05e065b5db208"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 13:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129994

--00000000000026f05e065b5db208
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes

On Sun, Sep 13, 2026, 6:27=E2=80=AFAM Potin Lai via lists.openembedded.org =
<
potin.lai.pt=3Dgmail.com@lists.openembedded.org> wrote:

> On Sat, Sep 12, 2026 at 1:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> >
> >
> > On Fri, Sep 11, 2026 at 2:17=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.c=
om>
> wrote:
> >>
> >> Add a patch fixing an issue where tools like 'gpiofind' incorrectly
> abort
> >> with a 'No such device' (ENODEV) error if a hotpluggable GPIO controll=
er
> >> (like a USB device) vanishes from /dev during the search.
> >>
> >> This patch gracefully handles the race condition by ignoring ENODEV
> errors
> >> when searching for a line and silently skipping chips that fail to ope=
n
> >> during iteration.
> >>
> >> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> >> ---
> >> Changes in v3:
> >> - Take the patch directly from the upstream libgpiod v1.6.x branch
> >> - Change patch file Upstream-Status to "Accepted"
> >> - Link to v2:
> https://patch.msgid.link/20260911-libgpiod-v1-6-5-handle-disappearing-chi=
ps-v2-1-37b56013e2cc@gmail.com
> >>
> >> Changes in v2:
> >> - Revise commit message
> >> - Add Upstream-Status tag into patch file
> >> - Link to v1:
> https://patch.msgid.link/20260910-libgpiod-v1-6-5-handle-disappearing-chi=
ps-v1-1-fd2dfad2ca0f@gmail.com
> >> ---
> >>  ...ully-handle-disappearing-chips-during-ite.patch | 83
> ++++++++++++++++++++++
> >>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb |  5 +-
> >>  2 files changed, 87 insertions(+), 1 deletion(-)
> >>
> >> diff --git
> a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-hand=
le-disappearing-chips-during-ite.patch
> b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-hand=
le-disappearing-chips-during-ite.patch
> >> new file mode 100644
> >> index 0000000000..ab8d5a673c
> >> --- /dev/null
> >> +++
> b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-gracefully-hand=
le-disappearing-chips-during-ite.patch
> >> @@ -0,0 +1,83 @@
> >> +From 40f18f16f573e6bf091d83cb1677e7386d0b8495 Mon Sep 17 00:00:00 200=
1
> >> +From: Potin Lai <potin.lai.pt@gmail.com>
> >> +Date: Tue, 8 Sep 2026 21:05:07 +0800
> >> +Subject: core: gracefully handle disappearing chips during iteration
> >> +
> >> +When hotpluggable GPIO controllers (like USB devices) are dynamically
> >> +added or removed, a race condition can occur. A chip's device node
> might
> >> +be present when iterating through /dev, but the chip could disappear =
by
> >> +the time we try to open it or query its lines.
> >> +
> >> +Previously, this caused tools like 'gpiofind' to incorrectly abort wi=
th
> >> +a 'No such device' (ENODEV) error if any chip on the system vanished
> >> +during the search.
> >> +
> >> +Fix this by ignoring ENODEV errors when searching for a line
> >> +(in gpiod_line_find()) and by silently skipping chips that fail to op=
en
> >> +during iteration (in gpiod_chip_iter_new()).
> >> +
> >> +Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> >> +Link:
> https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7756aab9568=
@gmail.com
> >> +Signed-off-by: Bartosz Golaszewski <
> bartosz.golaszewski@oss.qualcomm.com>
> >> +Upstream-Status: Accepted [
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3D40=
f18f16f573e6bf091d83cb1677e7386d0b8495
> ]
> >
> >
> > Accepted is not a valid status, for details see -
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> >
>
> Thanks for pointing me to the Upstream-Status guidelines. Just to
> confirm, is Backport the recommended status to use for this patch?
>
> Potin
>
> >
> >>
> >> +---
> >> + lib/helpers.c |  2 +-
> >> + lib/iter.c    | 16 ++++------------
> >> + 2 files changed, 5 insertions(+), 13 deletions(-)
> >> +
> >> +diff --git a/lib/helpers.c b/lib/helpers.c
> >> +index 479f370..6d1836a 100644
> >> +--- a/lib/helpers.c
> >> ++++ b/lib/helpers.c
> >> +@@ -423,7 +423,7 @@ struct gpiod_line *gpiod_line_find(const char
> *name)
> >> +                       return line;
> >> +               }
> >> +
> >> +-              if (errno !=3D ENOENT)
> >> ++              if (errno !=3D ENOENT && errno !=3D ENODEV)
> >> +                       goto out;
> >> +       }
> >> +
> >> +diff --git a/lib/iter.c b/lib/iter.c
> >> +index bfd2852..7f5ad9a 100644
> >> +--- a/lib/iter.c
> >> ++++ b/lib/iter.c
> >> +@@ -51,7 +51,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
> >> +       if (!iter)
> >> +               goto err_free_dirs;
> >> +
> >> +-      iter->num_chips =3D num_chips;
> >> ++      iter->num_chips =3D 0;
> >> +       iter->offset =3D 0;
> >> +
> >> +       if (num_chips =3D=3D 0) {
> >> +@@ -64,23 +64,15 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
> >> +               goto err_free_iter;
> >> +
> >> +       for (i =3D 0; i < num_chips; i++) {
> >> +-              iter->chips[i] =3D
> gpiod_chip_open_by_name(dirs[i]->d_name);
> >> +-              if (!iter->chips[i])
> >> +-                      goto err_close_chips;
> >> ++              iter->chips[iter->num_chips] =3D
> gpiod_chip_open_by_name(dirs[i]->d_name);
> >> ++              if (iter->chips[iter->num_chips])
> >> ++                      iter->num_chips++;
> >> +       }
> >> +
> >> +       free_dirs(dirs, num_chips);
> >> +
> >> +       return iter;
> >> +
> >> +-err_close_chips:
> >> +-      for (i =3D 0; i < num_chips; i++) {
> >> +-              if (iter->chips[i])
> >> +-                      gpiod_chip_close(iter->chips[i]);
> >> +-      }
> >> +-
> >> +-      free(iter->chips);
> >> +-
> >> + err_free_iter:
> >> +       free(iter);
> >> +
> >> +--
> >> +cgit 1.3.1-korg
> >> +
> >> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> >> index 45af4f8bb0..d43fe90480 100644
> >> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> >> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> >> @@ -3,7 +3,10 @@ require libgpiod.inc
> >>  LICENSE =3D "LGPL-2.1-or-later"
> >>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D2caced0b25dfefd4c601d92bd15116de"
> >>
> >> -SRC_URI +=3D "file://0001-bindings-cxx-disable-tests.patch"
> >> +SRC_URI +=3D " \
> >> +    file://0001-bindings-cxx-disable-tests.patch \
> >> +
> file://0002-core-gracefully-handle-disappearing-chips-during-ite.patch \
> >> +"
> >>
> >>  SRC_URI[sha256sum] =3D
> "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
> >>
> >>
> >> ---
> >> base-commit: cbec9a20d78add94235042c601e991574151e36e
> >> change-id:
> 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f7b0d9809
> >>
> >> Best regards,
> >> --
> >> Potin Lai <potin.lai.pt@gmail.com>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129993):
> https://lists.openembedded.org/g/openembedded-devel/message/129993
> Mute This Topic: https://lists.openembedded.org/mt/121195651/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000026f05e065b5db208
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 13, 2026, 6:27=E2=80=
=AFAM Potin Lai via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;<a href=3D"http://potin.lai.pt">potin.lai.pt</a>=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Sat, Sep 12, 2026 at 1:47=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Sep 11, 2026 at 2:17=E2=80=AFAM Potin Lai &lt;<a href=3D"mailt=
o:potin.lai.pt@gmail.com" target=3D"_blank" rel=3D"noreferrer">potin.lai.pt=
@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Add a patch fixing an issue where tools like &#39;gpiofind&#39; in=
correctly abort<br>
&gt;&gt; with a &#39;No such device&#39; (ENODEV) error if a hotpluggable G=
PIO controller<br>
&gt;&gt; (like a USB device) vanishes from /dev during the search.<br>
&gt;&gt;<br>
&gt;&gt; This patch gracefully handles the race condition by ignoring ENODE=
V errors<br>
&gt;&gt; when searching for a line and silently skipping chips that fail to=
 open<br>
&gt;&gt; during iteration.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">potin.lai.pt@gmail.com</a>&gt;<br=
>
&gt;&gt; ---<br>
&gt;&gt; Changes in v3:<br>
&gt;&gt; - Take the patch directly from the upstream libgpiod v1.6.x branch=
<br>
&gt;&gt; - Change patch file Upstream-Status to &quot;Accepted&quot;<br>
&gt;&gt; - Link to v2: <a href=3D"https://patch.msgid.link/20260911-libgpio=
d-v1-6-5-handle-disappearing-chips-v2-1-37b56013e2cc@gmail.com" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://patch.msgid.link/20260911-libg=
piod-v1-6-5-handle-disappearing-chips-v2-1-37b56013e2cc@gmail.com</a><br>
&gt;&gt;<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - Revise commit message<br>
&gt;&gt; - Add Upstream-Status tag into patch file<br>
&gt;&gt; - Link to v1: <a href=3D"https://patch.msgid.link/20260910-libgpio=
d-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://patch.msgid.link/20260910-libg=
piod-v1-6-5-handle-disappearing-chips-v1-1-fd2dfad2ca0f@gmail.com</a><br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...ully-handle-disappearing-chips-during-ite.patch | 83 ++++=
++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_=
1.6.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgpiod_1.6.5.bb=
</a> |=C2=A0 5 +-<br>
&gt;&gt;=C2=A0 2 files changed, 87 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-co=
re-gracefully-handle-disappearing-chips-during-ite.patch b/meta-oe/recipes-=
support/libgpiod/libgpiod-1.x/0002-core-gracefully-handle-disappearing-chip=
s-during-ite.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..ab8d5a673c<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0002-core-grac=
efully-handle-disappearing-chips-during-ite.patch<br>
&gt;&gt; @@ -0,0 +1,83 @@<br>
&gt;&gt; +From 40f18f16f573e6bf091d83cb1677e7386d0b8495 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">potin.lai.pt@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Tue, 8 Sep 2026 21:05:07 +0800<br>
&gt;&gt; +Subject: core: gracefully handle disappearing chips during iterat=
ion<br>
&gt;&gt; +<br>
&gt;&gt; +When hotpluggable GPIO controllers (like USB devices) are dynamic=
ally<br>
&gt;&gt; +added or removed, a race condition can occur. A chip&#39;s device=
 node might<br>
&gt;&gt; +be present when iterating through /dev, but the chip could disapp=
ear by<br>
&gt;&gt; +the time we try to open it or query its lines.<br>
&gt;&gt; +<br>
&gt;&gt; +Previously, this caused tools like &#39;gpiofind&#39; to incorrec=
tly abort with<br>
&gt;&gt; +a &#39;No such device&#39; (ENODEV) error if any chip on the syst=
em vanished<br>
&gt;&gt; +during the search.<br>
&gt;&gt; +<br>
&gt;&gt; +Fix this by ignoring ENODEV errors when searching for a line<br>
&gt;&gt; +(in gpiod_line_find()) and by silently skipping chips that fail t=
o open<br>
&gt;&gt; +during iteration (in gpiod_chip_iter_new()).<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">potin.lai.pt@gmail.com</a>&gt;<b=
r>
&gt;&gt; +Link: <a href=3D"https://patch.msgid.link/20260908-gpiofind-error=
-enodev-v1-1-c7756aab9568@gmail.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7=
756aab9568@gmail.com</a><br>
&gt;&gt; +Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.=
golaszewski@oss.qualcomm.com" target=3D"_blank" rel=3D"noreferrer">bartosz.=
golaszewski@oss.qualcomm.com</a>&gt;<br>
&gt;&gt; +Upstream-Status: Accepted [<a href=3D"https://git.kernel.org/pub/=
scm/libs/libgpiod/libgpiod.git/commit/?id=3D40f18f16f573e6bf091d83cb1677e73=
86d0b8495" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.kern=
el.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3D40f18f16f573e6bf091d=
83cb1677e7386d0b8495</a>]<br>
&gt;<br>
&gt;<br>
&gt; Accepted is not a valid status, for details see - <a href=3D"https://d=
ocs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstre=
am-status" rel=3D"noreferrer noreferrer" target=3D"_blank">https://docs.yoc=
toproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-stat=
us</a><br>
&gt;<br>
<br>
Thanks for pointing me to the Upstream-Status guidelines. Just to<br>
confirm, is Backport the recommended status to use for this patch?<br>
<br>
Potin<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + lib/helpers.c |=C2=A0 2 +-<br>
&gt;&gt; + lib/iter.c=C2=A0 =C2=A0 | 16 ++++------------<br>
&gt;&gt; + 2 files changed, 5 insertions(+), 13 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/lib/helpers.c b/lib/helpers.c<br>
&gt;&gt; +index 479f370..6d1836a 100644<br>
&gt;&gt; +--- a/lib/helpers.c<br>
&gt;&gt; ++++ b/lib/helpers.c<br>
&gt;&gt; +@@ -423,7 +423,7 @@ struct gpiod_line *gpiod_line_find(const char=
 *name)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return line;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D =
ENOENT)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D =
ENOENT &amp;&amp; errno !=3D ENODEV)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/lib/iter.c b/lib/iter.c<br>
&gt;&gt; +index bfd2852..7f5ad9a 100644<br>
&gt;&gt; +--- a/lib/iter.c<br>
&gt;&gt; ++++ b/lib/iter.c<br>
&gt;&gt; +@@ -51,7 +51,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(voi=
d)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!iter)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_f=
ree_dirs;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 iter-&gt;num_chips =3D num_chips;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 iter-&gt;num_chips =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0iter-&gt;offset =3D 0;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_chips =3D=3D 0) {<br>
&gt;&gt; +@@ -64,23 +64,15 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(v=
oid)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_f=
ree_iter;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_chips; i++) {=
<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iter-&gt;chips[=
i] =3D gpiod_chip_open_by_name(dirs[i]-&gt;d_name);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!iter-&gt;c=
hips[i])<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 goto err_close_chips;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iter-&gt;chips[=
iter-&gt;num_chips] =3D gpiod_chip_open_by_name(dirs[i]-&gt;d_name);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iter-&gt;ch=
ips[iter-&gt;num_chips])<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 iter-&gt;num_chips++;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0free_dirs(dirs, num_chips);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return iter;<br>
&gt;&gt; +<br>
&gt;&gt; +-err_close_chips:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; num_chips; i++) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iter-&gt;ch=
ips[i])<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gpiod_chip_close(iter-&gt;chips[i]);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 free(iter-&gt;chips);<br>
&gt;&gt; +-<br>
&gt;&gt; + err_free_iter:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0free(iter);<br>
&gt;&gt; +<br>
&gt;&gt; +--<br>
&gt;&gt; +cgit 1.3.1-korg<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/libgpiod/<a href=3D"http://li=
bgpiod_1.6.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgpiod_1=
.6.5.bb</a> b/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1=
.6.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgpiod_1.6.5.bb<=
/a><br>
&gt;&gt; index 45af4f8bb0..d43fe90480 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_=
1.6.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgpiod_1.6.5.bb=
</a><br>
&gt;&gt; +++ b/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_=
1.6.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgpiod_1.6.5.bb=
</a><br>
&gt;&gt; @@ -3,7 +3,10 @@ require libgpiod.inc<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2caced0b25df=
efd4c601d92bd15116de&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI +=3D &quot;file://0001-bindings-cxx-disable-tests.patch&q=
uot;<br>
&gt;&gt; +SRC_URI +=3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://0001-bindings-cxx-disable-tests.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://0002-core-gracefully-handle-disappearing-chi=
ps-during-ite.patch \<br>
&gt;&gt; +&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;ae280f697bf035a1fb780c9972e5c81=
d0d2712b7ab6124fb3fba24619daa72bc&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; base-commit: cbec9a20d78add94235042c601e991574151e36e<br>
&gt;&gt; change-id: 20260910-libgpiod-v1-6-5-handle-disappearing-chips-737f=
7b0d9809<br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; --<br>
&gt;&gt; Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail.com" target=3D"=
_blank" rel=3D"noreferrer">potin.lai.pt@gmail.com</a>&gt;<br>
&gt;&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129993): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129993" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/129993</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121195651/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/121195651/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000026f05e065b5db208--

