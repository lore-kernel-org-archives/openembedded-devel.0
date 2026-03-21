Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9FE1099B5E
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 02:24:24 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4592.1774059861608094392
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 19:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ex8EGcEC;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-67c274ffe38so642516eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 19:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774059861; cv=none;
        d=google.com; s=arc-20240605;
        b=ADhbG0tAnsKpCRN+k+WVdoJskk+e+RqCzbyH8SF+rLjbnWv4L5LH4cqVuzllHqXJzL
         SokUnMKEAAaPySQay6nLyKGpOl1/aYV4uUGBTzn6e/8kaoZ93z55rTMuHdjlDzGgpELv
         smFna4RsHHopyHPtRJxr+6cGEcvNIUSaMrNWLHEWOkp9y5XVwCtL6+MMQqHke3+EEyeR
         8wJk//EDQwBv3alCXtfXtNyNi56RAD4Be+J+1Tyja6HNFZ27Q49z88M5MjvqrAJ84ojz
         gFDrXoUp/kGnvOD+MBSRkPEAcHKsOkt/1cZtMLFk2v/mfbDALv/f6U9/LT38CTzjoklZ
         /kOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=taLYW5oj9Slq3etF0EBPSj/A9lRHPo/r6S5Z7d9ruYA=;
        fh=sa2ng0Zpy+5Z8mTrnPO7JLs9/01I0WOh2WbwiwCGXy0=;
        b=jJtnr1mHTO3zy8+6KJxx70l9T3ocZ7cmJPWqg6h6Wicd206RUUYg4KgtUcBMMG/Um/
         KsZg0dXHV9IJAleLCX3bjdNr8EbHYOoOYjItKMsNfHC4fyds/BdCd3/C8ysmiN4nS/4h
         SIVBu3ycA5rWsH6Ee2mpYByCZdgwyq+QEEyZXiUFFcA8IJ2Sxv0ptq9mt4+HW5Ht0p2V
         qUeUloo+n08ulb9bToVrdRJNrkcXGLwVJ0zCzHTHmrRnoq6lNE9a+82Q+6nOOtCbeN0O
         uUFcd8asXx7Ox7RKSMkgk/omaYKpSmZr23l+7HRDVvbh+U2sY5bvcJ/+MW+nDrmkW0Ea
         9XnQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774059861; x=1774664661; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taLYW5oj9Slq3etF0EBPSj/A9lRHPo/r6S5Z7d9ruYA=;
        b=Ex8EGcECCDNqKfoeduMwutRsQxdARF8OApL7eMIVtaJGo/jcWNwkiz0ZMvGYvvrDSh
         I+dRVwMdiybTRJmzhekDcnh6khmx8om8wKVqTVxfpBxJKqCE0QIQUtcybqTglDCnn29Q
         XLblGlEKFcpTlM8qpEyYm/IxqdDq7KPkzzFJvvjMxc26Rkig3J423GUeGuD3p84aV6Sh
         tzxfvdo8NFcm7yVNnA6UYrU5FU8wXmZuAMFptDK9CbB072nIbHtVKhNJR39mc33g3g4W
         XfF6H3DzDWEHJsTZCQpRTothaWpRRk6lo8BVyg4anm9YPWyZm0e/utfQKSRJJx3DUnFQ
         cu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774059861; x=1774664661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=taLYW5oj9Slq3etF0EBPSj/A9lRHPo/r6S5Z7d9ruYA=;
        b=hfj2OO2EOxt22WDhu176PXiYcwn5J+fdVPC57pA1hoYxP1aqDXwUoL1thHI63RPJow
         Di5hFN1lrWWEnddET57e6vSz+0bAoBkOYrRhKMRX7c+GSEVPVMyWneRYL3LQzpLWBuni
         dAR+oIoYJU7xEWKImZBaQO2eo7wI40i82l8mojluOlIFLlYqQ/enzxoC/SyHxC/wspNv
         dzuNzG0F8ozt4Y39ZXxTtvHrp07UppqSZoheebeNjYYC6R7guJgQLr3C8mfhaoTpJZyq
         VLZO4mwfpNl/At+N3w4t9Y3nMXhxo20iXe7LFJz/fPpHWkbj5wHyAicp78sBFYDGPtqS
         k5oA==
X-Gm-Message-State: AOJu0YxLY79zHWxh4wPYv7yLUyUvXGK1ukqLvRi7+M1qc/UyCW79ApL5
	UAbs4/FrSV4HUABRvCbYoOPO/HPPzwduYmuy/sYQn5iTOnB4RbJEWVAAtu8oViCWSBdH//uFcDk
	dgCFl+2g0j66CHAqezU0Zb0XGdEkHgao=
X-Gm-Gg: ATEYQzxXtISzlwkXzFuIiEjbrjJPydK6YPk4a30i2wK5RbSouSbWpOK7TbLjWyEO6Q8
	Z49LLuQ3liyyU49sT55O/Tfm2y/f0xryjObKoR9ot2ADAQgcGxohA5gUXVS2dkHrsqVuHUiuERE
	MgTjWgRW3sMqSxpxC8gNhm9Ztv+dOYMcvHdLlNTYkAssYav8//gM9O07mFKkA1bLylDA7NcfUvY
	+4jWTC5LMDc13yWeCC0AZ8tLclaCfkn0eiPpvaisjict6RU/cEkAUbK/wb8lsLw8X38fBj7YlA0
	3PjktgV6
X-Received: by 2002:a05:6820:709a:10b0:67c:2587:33a8 with SMTP id
 006d021491bc7-67c2587351dmr2243312eaf.41.1774059860796; Fri, 20 Mar 2026
 19:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com> <20260320170155.1413929-4-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260320170155.1413929-4-khem.raj@oss.qualcomm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 21 Mar 2026 15:24:09 +1300
X-Gm-Features: AaiRm51fb1RAtMAv-fW-gXiaSKpimnuxl1QUQILu9_zevnyKZ2RyKkl8ay-5JSs
Message-ID: <CADySD0G3Op8pxc8q7JzguP3t4ZhHTAJg+ej5p5Z=8RAUrqafhw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 4/8] libgedit-gfls: Add recipe
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 02:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125455

On Sat, Mar 21, 2026 at 6:02=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-gnome/gedit/libgedit-gfls_0.3.1.bb   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb b/meta=
-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
> new file mode 100644
> index 0000000000..8b64661733
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Gedit Technology - File loading and saving"
> +SECTION =3D "gnome"
> +LICENSE =3D "LGPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3e=
ef3be114124d11349ca0d7e117"
> +
> +DEPENDS =3D "glib-2.0 gtk+3"
> +
> +inherit gobject-introspection features_check gtk-doc gnomebase
> +
> +SRC_URI =3D "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=
=3Dmain;protocol=3Dhttps"

can please also include tag=3D${PV} in the SRC_URI

> +SRCREV =3D "0a0c8dd29ae2f9f4a99cbaaf1628d2352953e0bc"
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +
> +GIR_MESON_OPTION =3D "gobject_introspection"
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125445): https://lists.openembedded.org/g/openembedde=
d-devel/message/125445
> Mute This Topic: https://lists.openembedded.org/mt/118421466/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

