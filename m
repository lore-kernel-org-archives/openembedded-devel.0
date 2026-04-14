Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF84F531E5
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 01:58:39 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8947.1776131917637373592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 18:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YpswGyhD;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6501d242e3fso4614692d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776131917; cv=none;
        d=google.com; s=arc-20240605;
        b=kZHev9pSuzpUM3jlUEJTd4pNqHXfWQhalsvGn6VnEJ4QQ1uBmt+edYJE9j7CzJm4Iw
         lpONa9BuOmQMinBPVteiuDfzWDMljU/V588ResausGMBtpRNNNKzgI4dGSgWLsp50dm+
         C3z+/dr+OqMU3CpsDeRZLsBWXeQ03LsaXDs+vkHFZ5B74RX7C2KNJyYRiCcXo9Uet+sl
         M+P40zw8mXO1xLD8b5nSViuV6A5HuUtjZhi0rmGTuJmsmTrajtmtRxdKHhnNivvlhNuk
         KDSwh3llsSfVkCHMTfmOUajj/x7AzdjDeVjCydhFvPvsUj+gd+ZFO487YWymHKNAG9+9
         qlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zdTFKZ1kTEJOjnVPJOYd83JRwHIaHa5l4BNL/uGH874=;
        fh=wFZSh+Ur/tHKoTYlAzPIqsj+M6sQOyVQC7WZa0gS2MQ=;
        b=WvdGYOFFnO3BDR/0XhhslibA3XH6TVTDOEDlcwqUB8zc48owGIT8lHBUB+jBNOIgzk
         x6ZjvvHKWT5Te6AL+Z5lWvFGgtu6/PwzY9YmiLQl1qwLXxtFI7Up5KY+n20ItIOjqiJt
         6t2uArfSO9D1CqZ6CGjo6nJuZ3H0Hs2pRaIpmx09LYDsBrpEsP+u9vOsDrDtHJIfl/E7
         HPYZpOzDzXyj4Wm9tTrDve5jqPwpxbdVe0bo0TUh6e+mqpaJ6N+X085xk084ANRS5ZlB
         OBhZMgXuKiypsv/UCwBCrxEgwZ7OEmLgbM2OrGVlQS+TlsdmUikMsGUhw6lJl75dfQ/J
         Arpw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776131917; x=1776736717; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zdTFKZ1kTEJOjnVPJOYd83JRwHIaHa5l4BNL/uGH874=;
        b=YpswGyhDrxIR6heA2Le14WfetKrEaVMxI7UbxA2kpLFdIe6aDvDsjUJATgSy1vOHfg
         zr0JwJpqMRSXKeP12KRDaYfofgVl4ZMhBN+mqCAVGCxYFDBEQ2S99rJX9BD4EZb8gigb
         V9DYoXabDfdybkCQeo7WrPJo37G/wkosRplVZMPz1Nm91HYpF6UlurKI7FNhQCvR7SWu
         2b8D5VMyy+AhQp43iCc9H5auu0KNIJsT46UGHtYrMc4nA94iF4m0jFHdjyYD55Wp3HK7
         5LJ+39G0dC9xqTRsx6vIGlgg4O7gf4XkFiHQPez6ji5k1MiddmalHII6Zn48N75+WW9g
         P9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776131917; x=1776736717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdTFKZ1kTEJOjnVPJOYd83JRwHIaHa5l4BNL/uGH874=;
        b=pgaTePJ4Mv+S6nxKiUkWhnc1JQgQp2RRkA3lgfbbYW0Eoc6276z5kKPzQS3pp26aFw
         s5roY0BbJEktyqf6W64JixVfZQIPbvbc8IKewO0n0Zeom9YszFO2ih5A743bPHapHg8j
         +Sd26O1FSz/PCrWfuHp2Te7RgUr+Wewmcpm0oIt1Jvq0Vr2CrV6lYUxeb7dfTIFeMjTp
         GpSdU+p7S1skVy4+ai0liQtg1RfhFH3xTSWmuPB9mqHPpkvlCs67dTOgjRnlmWjT5OzC
         1WsxOA7F6SZxxw0gVNERDfqW2jQC2tu49F/rQBTkFBHyzOzZO5w1GRadEeuLx/MKpJCW
         e4dA==
X-Gm-Message-State: AOJu0YysIGHvSniRXR4rUa8s8zfSVXpVD/yJhql3qPF5CU+o9aMsdW9Z
	pyNlRWXLrTgBO/9Phrq7/XVRPvtQQFXOoNaY8CL1ZXaFQ78OD/mP9KCU1VkHZ/w7rOAGrFzAwh4
	Qs3qHBfzfAoxaTs5oqcp2gZXUwU8DfhY=
X-Gm-Gg: AeBDieuqtDPSRX1HRzLvB1/ljfRhpTM7vlhkWy1ukqT6Kyjm0KchRXzoOVxJM4a3AKU
	DxXsf/P3AekrfHvoBhPMtNcD7/54lkWiHvpWiRTHcC1fn6cSpFORrxeRMlAeKR8eg0DOS0rxkww
	EmBfPYyeLpiQy42Q7MPFmNzRX9rsUKCloC6Cxm3z+Qgn52vhHiT6tMzuEgGffchLBmifInIPhUw
	x4s3InfqL33E4LzZl0+570FnKkipEXA4oik1vxzrYmND2ZQIvsXR1jCifXs+bWkO+Mx7WXzpM5H
	Ny06qmUP+6eJXUAlQk/ZFTtLy91upiZBSSLtXZIY0kprDLnCHuDnHSqEFQUF//W8OUhehBycPPK
	lD1h7s/jUBMvJ6JlNp+MKS3DYG49WngJVxe15eYyItLzIGJasXOqHJKYGhy9FAaVcGyqQmQEuB6
	9fnP7tJnY6w4+cSac=
X-Received: by 2002:a05:690e:1448:b0:650:789b:a3c with SMTP id
 956f58d0204a3-65198b564d9mr15677025d50.35.1776131916344; Mon, 13 Apr 2026
 18:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260403072355.16407-1-zhengrq.fnst@fujitsu.com>
 <CAMKF1soHSqhz-H_WF526ko9x6Kxu3SL91M8GE-0C-eyg9HAkwA@mail.gmail.com> <TY7PR01MB1480393F54C0F0E0561D7A3958B252@TY7PR01MB14803.jpnprd01.prod.outlook.com>
In-Reply-To: <TY7PR01MB1480393F54C0F0E0561D7A3958B252@TY7PR01MB14803.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Apr 2026 18:58:24 -0700
X-Gm-Features: AQROBzAujazAX9nV900d_xLFw23XGyMs7oPk2Qp-A1UVtWzsnEfhOrD4CL5Nd8s
Message-ID: <CAMKF1soSAmhLti8h2y0fky7uLuU2WppP6c2c8FmEuGRQJjnZsg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] openct: Drop this recipe
To: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f2b0d8064f61efdb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 01:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126291

--000000000000f2b0d8064f61efdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Keep the option and leave disabled by default

On Mon, Apr 13, 2026, 6:37=E2=80=AFPM Ruoqin Zheng (Fujitsu) <
zhengrq.fnst@fujitsu.com> wrote:

> Hi khem
>
>  There is "--enable-openct " option in opensc.
>        --enable-openct         enable openct linkage [disabled]
>
> In this situation, how should I deal with it?
>
> Zheng
> ------------------------------
> *From:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> on behalf of Khem Raj via
> lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>
> *Sent:* Friday, April 3, 2026 16:14
> *To:* Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@fujitsu.co=
m>
> *Cc:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe][meta-oe][PATCH] openct: Drop this recipe
>
> it needs to be removed from meta-oe/recipes-core/packagegroups/
> packagegroup-meta-oe.bb as well
> and opensc seems to have a packageconfig for this. Can you find out if we
> now need to disable that packageconfig
>
> On Fri, Apr 3, 2026 at 12:24=E2=80=AFAM zhengruoqin via lists.openembedde=
d.org
> <zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> Drop openct as it is unmaintained upstream.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...e-pointer-type-error-with-gcc-option.patch | 65 -------------
>  ...t-the-first-line-of-compiler-version.patch | 31 -------
>  .../etc-openct.udev.in-disablePROGRAM.patch   | 31 -------
>  .../etc-openct_usb.in-modify-UDEVINFO.patch   | 35 -------
>  .../recipes-support/openct/openct/openct.init | 89 ------------------
>  .../openct/openct/openct.service              | 13 ---
>  .../openct/openct/openct.sysconfig            |  5 -
>  .../recipes-support/openct/openct_0.6.20.bb   | 91 -------------------
>  8 files changed, 360 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-=
error-with-gcc-option.patch
>  delete mode 100644
> meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of=
-compiler-version.patch
>  delete mode 100644
> meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.p=
atch
>  delete mode 100644
> meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.p=
atch
>  delete mode 100644 meta-oe/recipes-support/openct/openct/openct.init
>  delete mode 100644 meta-oe/recipes-support/openct/openct/openct.service
>  delete mode 100644 meta-oe/recipes-support/openct/openct/openct.sysconfi=
g
>  delete mode 100644 meta-oe/recipes-support/openct/openct_0.6.20.bb
>
> diff --git
> a/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-typ=
e-error-with-gcc-option.patch
> b/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-typ=
e-error-with-gcc-option.patch
> deleted file mode 100644
> index 73c9d06667..0000000000
> ---
> a/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-typ=
e-error-with-gcc-option.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From c4351058da555e1e6a2b4b15d913baee80f55865 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@fujitsu.com>
> -Date: Thu, 27 Jun 2024 06:27:18 +0000
> -Subject: Fix incompatible pointer type error with gcc option
> - -Wincompatible-pointer-types
> -
> -| ../../../openct-0.6.20/src/ifd/ifdhandler.c: In function
> 'ifdhandler_run':
> -| ../../../openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing
> argument 2 of 'ifd_get_eventfd' from incompatible pointer type
> [-Wincompatible-pointer-types]
> -|   239 |                 sock->fd =3D ifd_get_eventfd(reader,
> &sock->events);
> -|       |                                                    ^~~~~~~~~~~=
~~
> -|       |                                                    |
> -|       |                                                    int *
> -| In file included from ../../../openct-0.6.20/src/ifd/internal.h:17,
> -|                  from ../../../openct-0.6.20/src/ifd/ifdhandler.c:7:
> -| ../../../openct-0.6.20/src/include/openct/ifd.h:182:65: note: expected
> 'short int *' but argument is of type 'int *'
> -|   182 | extern int                      ifd_get_eventfd(ifd_reader_t *=
,
> short *);
> -|       |
>  ^~~~~~~
> -
> -| ../../../openct-0.6.20/src/ifd/process.c: In function 'do_memory_write=
':
> -| ../../../openct-0.6.20/src/ifd/process.c:461:61: error: passing
> argument 4 of 'ct_tlv_get_opaque' from incompatible pointer type
> [-Wincompatible-pointer-types]
> -|   461 |             || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data,
> &data_len))
> -|       |
>  ^~~~~~~~~
> -|       |                                                             |
> -|       |
>  unsigned int *
> -| In file included from ../../../openct-0.6.20/src/ifd/process.c:20:
> -| ../../../openct-0.6.20/src/include/openct/tlv.h:40:62: note: expected
> 'size_t *' {aka 'long unsigned int *'} but argument is of type 'unsigned
> int *'
> -|    40 |                                 ifd_tag_t, unsigned char **,
> size_t *);
> -
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ----
> - src/ifd/ifdhandler.c | 2 +-
> - src/ifd/process.c    | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/ifd/ifdhandler.c b/src/ifd/ifdhandler.c
> -index 12686c9..ebd1b53 100644
> ---- a/src/ifd/ifdhandler.c
> -+++ b/src/ifd/ifdhandler.c
> -@@ -236,7 +236,7 @@ static void ifdhandler_run(ifd_reader_t * reader)
> -               sock->fd =3D -1;
> -       }
> -       else {
> --              sock->fd =3D ifd_get_eventfd(reader, &sock->events);
> -+              sock->fd =3D ifd_get_eventfd(reader, (short int
> *)&sock->events);
> -       }
> -       if (sock->fd =3D=3D -1) {
> -               ifd_debug(1, "events inactive for reader %s",
> reader->name);
> -diff --git a/src/ifd/process.c b/src/ifd/process.c
> -index 4563bdf..7088a76 100644
> ---- a/src/ifd/process.c
> -+++ b/src/ifd/process.c
> -@@ -458,7 +458,7 @@ static int do_memory_write(ifd_reader_t * reader, in=
t
> unit,
> -               return IFD_ERROR_INVALID_SLOT;
> -
> -       if (ct_tlv_get_int(args, CT_TAG_ADDRESS, &address) =3D=3D 0
> --          || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, &data_len))
> -+          || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, (size_t
> *)&data_len))
> -               return IFD_ERROR_MISSING_ARG;
> -
> -       rc =3D ifd_card_write_memory(reader, unit, address, data, data_le=
n);
> ---
> -2.34.1
> -
> diff --git
> a/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-=
of-compiler-version.patch
> b/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-=
of-compiler-version.patch
> deleted file mode 100644
> index 9bd3d18d6e..0000000000
> ---
> a/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-=
of-compiler-version.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 146b5116140d719e4e9ae19748c0b6dee7d82f96 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 22 May 2023 22:01:28 -0700
> -Subject: [PATCH] m4: Just emit the first line of compiler version
> -
> -Avoids emitting buildpaths into comments
> -Fixes
> -WARNING: openct-0.6.20-r0 do_package_qa: QA Issue: File
> /usr/include/openct/types.h in package openct-dev contains reference to
> TMPDIR [buildpaths]
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - m4/ac_create_stdint_h.m4 | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/m4/ac_create_stdint_h.m4 b/m4/ac_create_stdint_h.m4
> -index 66de704..4b7223a 100644
> ---- a/m4/ac_create_stdint_h.m4
> -+++ b/m4/ac_create_stdint_h.m4
> -@@ -110,7 +110,7 @@ echo "#define" $_ac_stdint_h "1" >>$ac_stdint_h
> - echo "#ifndef" _GENERATED_STDINT_H >>$ac_stdint_h
> - echo "#define" _GENERATED_STDINT_H '"'$PACKAGE $VERSION'"' >>$ac_stdint=
_h
> - if test "$GCC" =3D "yes" ; then
> --  echo "/* generated using a gnu compiler version" `$CC --version` "*/"=
 \
> -+  echo "/* generated using a gnu compiler version" `$CC --version|head
> -1` "*/" \
> -   >>$ac_stdint_h
> - else
> -   echo "/* generated using $CC */" >>$ac_stdint_h
> ---
> -2.40.1
> -
> diff --git
> a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM=
.patch
> b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM=
.patch
> deleted file mode 100644
> index e2401bb31b..0000000000
> ---
> a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM=
.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From e0d3e0bb1e38ff851696a7d8826e651d364ad8ce Mon Sep 17 00:00:00 2001
> -From: Li xin <lixin.fnst@cn.fujitsu.com>
> -Date: Fri, 5 Dec 2014 02:00:57 +0900
> -Subject: [PATCH 1/2] etc/openct.udev.in: disablePROGRAM
> -
> -Bug fix: https://bugzilla.redhat.com/show_bug.cgi?id=3D287871
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ----
> - etc/openct.udev.in | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/etc/openct.udev.in b/etc/openct.udev.in
> -index d11d0e1..48083c9 100644
> ---- a/etc/openct.udev.in
> -+++ b/etc/openct.udev.in
> -@@ -22,7 +22,8 @@ ACTION!=3D"add", GOTO=3D"openct_usb_rules_end"
> - # 2010-01-06 removed, as latest udev doesn't know WAIT_FOR_ATTR any mor=
e.
> -
> - # sleep for 100ms - the wait_for_sysfs might not be enough
> --PROGRAM=3D"/bin/sleep 0.1"
> -+# Disabled in this package - see https://bugzilla.redhat.com/287871
> -+# PROGRAM=3D"/bin/sleep 0.1"
> -
> - # ccid
> - ATTR{bInterfaceClass}=3D=3D"0b", ATTR{bInterfaceSubClass}=3D=3D"00",
> ATTR{bInterfaceProtocol}=3D=3D"00", ATTRS{idVendor}=3D=3D"?*"  RUN+=3D"@u=
devdir@/openct_usb
> /dev/$parent"
> ---
> -1.8.4.2
> -
> diff --git
> a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO=
.patch
> b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO=
.patch
> deleted file mode 100644
> index 22eda729fb..0000000000
> ---
> a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO=
.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From d93985a137b553b2723235d03bda341dab14064f Mon Sep 17 00:00:00 2001
> -From: Li xin <lixin.fnst@cn.fujitsu.com>
> -Date: Fri, 5 Dec 2014 02:04:03 +0900
> -Subject: [PATCH 2/2] etc/openct_usb.in: modify UDEVINFO
> -
> -this patch is from Fedora
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ----
> - etc/openct_usb.in | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/etc/openct_usb.in b/etc/openct_usb.in
> -index 32f91aa..917467d 100644
> ---- a/etc/openct_usb.in
> -+++ b/etc/openct_usb.in
> -@@ -15,10 +15,10 @@ if [ -z "$DEVNAME" ]; then
> -       # Guess udev info interface.
> -       # Newer udev uses udevadm
> -       #
> --      if which udevinfo > /dev/null 2>&1; then
> --              UDEVINFO=3D"udevinfo"
> --      else
> -+      if which udevadm > /dev/null 2>&1; then
> -               UDEVINFO=3D"udevadm info"
> -+      else
> -+              UDEVINFO=3D"udevinfo"
> -       fi
> -       DEVNAME=3D/dev/$($UDEVINFO --query=3Dname --path=3D$(dirname $DEV=
PATH))
> - fi
> ---
> -1.8.4.2
> -
> diff --git a/meta-oe/recipes-support/openct/openct/openct.init
> b/meta-oe/recipes-support/openct/openct/openct.init
> deleted file mode 100644
> index c6896095e3..0000000000
> --- a/meta-oe/recipes-support/openct/openct/openct.init
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -#!/bin/sh
> -#
> -# openct       This shell script takes care of starting and stopping
> OpenCT.
> -#
> -# chkconfig:   2345 24 89
> -# description: OpenCT is a middleware framework for smart card terminals=
.
> -#
> -# processname: ifdhandler
> -# config:      /etc/openct.conf
> -
> -### BEGIN INIT INFO
> -# Provides: openct
> -# Default-Start: 2 3 4 5
> -# Default-Stop: 0 1 6
> -# Should-Start: $syslog $network
> -# Should-Stop: $syslog $network
> -# Short-Description: Middleware framework for smart card terminals
> -# Description: This starts/stops the OpenCT middleware framework support
> -#              for smart card terminals.
> -### END INIT INFO
> -
> -. /etc/init.d/functions
> -
> -exec=3D"/usr/sbin/openct-control"
> -prog=3Dopenct
> -proc=3Difdhandler
> -
> -OPENCT_OPTIONS=3D
> -[ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
> -
> -lockfile=3D/var/lock/subsys/$prog
> -
> -start() {
> -    retval=3D0
> -    if ! status $proc >/dev/null 2>&1 ; then
> -        action $"Initializing OpenCT smart card terminals: " \
> -            $exec $OPENCT_OPTIONS init
> -        retval=3D$?
> -        [ $retval -eq 0 ] && touch $lockfile
> -    fi
> -    return $retval
> -}
> -
> -stop() {
> -    if status $proc >/dev/null 2>&1 ; then
> -        action $"Stopping OpenCT smart card terminals: " \
> -            $exec $OPENCT_OPTIONS shutdown
> -    fi
> -    retval=3D$?
> -    if [ $retval -eq 0 ] ; then
> -        rm -f /var/run/openct/status
> -        rm -f $lockfile
> -    fi
> -    return $retval
> -}
> -
> -restart() {
> -    stop
> -    start
> -}
> -
> -oct_status() {
> -    status $proc
> -    retval=3D$?
> -    if [ -e /var/run/openct/status ] ; then
> -        $exec $OPENCT_OPTIONS status
> -        [ -e /var/run/openct/status ] && \
> -            echo $"Waiting for reader attach/detach events..."
> -    fi
> -    return $retval
> -}
> -
> -case "$1" in
> -    start|stop|restart)
> -        $1
> -        ;;
> -    reload|force-reload)
> -        restart
> -        ;;
> -    status)
> -        oct_status
> -        ;;
> -    try-restart|condrestart)
> -       [ ! -f $lockfile ] || restart
> -       ;;
> -    *)
> -        echo $"Usage: $0
> {start|stop|status|restart|try-restart|reload|force-reload}"
> -        exit 2
> -esac
> diff --git a/meta-oe/recipes-support/openct/openct/openct.service
> b/meta-oe/recipes-support/openct/openct/openct.service
> deleted file mode 100644
> index 57de8c0a88..0000000000
> --- a/meta-oe/recipes-support/openct/openct/openct.service
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -[Unit]
> -Description=3DOpenct Middleware framework for smart card terminals
> -After=3Dsyslog.target network.target
> -
> -[Service]
> -EnvironmentFile=3D-/etc/sysconfig/openct
> -ExecStart=3D/usr/sbin/openct-control $OPENCT_OPTIONS init
> -ExecStop=3D/usr/sbin/openct-control $OPENCT_OPTIONS shutdown
> -RemainAfterExit=3Dyes
> -KillMode=3Dmixed
> -
> -[Install]
> -WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-support/openct/openct/openct.sysconfig
> b/meta-oe/recipes-support/openct/openct/openct.sysconfig
> deleted file mode 100644
> index ffc270790f..0000000000
> --- a/meta-oe/recipes-support/openct/openct/openct.sysconfig
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -#                                                                    -*-
> sh -*-
> -# Extra options to pass to openct-control.
> -# Consult "/usr/sbin/openct-control -h" for available options.
> -#
> -OPENCT_OPTIONS=3D""
> diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb
> b/meta-oe/recipes-support/openct/openct_0.6.20.bb
> deleted file mode 100644
> index c7b0d0d56d..0000000000
> --- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -SUMMARY =3D "Middleware framework for smart card terminals"
> -HOMEPAGE =3D "https://github.com/OpenSC/openct/wiki"
> -DESCRIPTION =3D " \
> -OpenCT implements drivers for several smart card readers. \
> -It comes as driver in ifdhandler format for PC/SC-Lite, \
> -as CT-API driver, or as a small and lean middleware, \
> -so applications can use it with minimal overhead. \
> -OpenCT also has a primitive mechanism to export smart card \
> -readers to remote machines via TCP/IP."
> -
> -DEPENDS +=3D "libtool pcsc-lite libusb-compat"
> -
> -SRC_URI =3D " \
> -
> https://downloads.sourceforge.net/project/opensc/${BPN}/${BPN}-${PV}.tar.=
gz
> \
> -    file://etc-openct.udev.in-disablePROGRAM.patch \
> -    file://etc-openct_usb.in-modify-UDEVINFO.patch \
> -    file://0001-m4-Just-emit-the-first-line-of-compiler-version.patch \
> -    file://openct.init \
> -    file://openct.sysconfig \
> -    file://openct.service \
> -    file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patc=
h
> \
> -"
> -
> -SRC_URI[sha256sum] =3D
> "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d181a68"
> -
> -UPSTREAM_CHECK_URI =3D "
> https://sourceforge.net/projects/opensc/files/openct/"
> -
> -LICENSE =3D "LGPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://LGPL-2.1;md5=3D2d5025d4aa3495befef8f17206a5=
b0a1"
> -
> -inherit systemd
> -SYSTEMD_SERVICE:${PN} +=3D "openct.service "
> -SYSTEMD_AUTO_ENABLE =3D "enable"
> -
> -EXTRA_OECONF =3D " \
> -    --disable-static \
> -    --enable-usb \
> -    --enable-pcsc \
> -    --enable-doc \
> -    --enable-api-doc \
> -    --with-udev=3D${nonarch_libdir}/udev \
> -    --with-bundle=3D${libdir}/pcsc/drivers \
> -"
> -
> -inherit autotools pkgconfig
> -
> -FILES:${PN} +=3D " \
> -    ${libdir}/ctapi \
> -    ${nonarch_libdir}/udev \
> -    ${libdir}/openct-ifd.so \
> -    ${libdir}/pcsc \
> -"
> -
> -FILES:${PN}-dbg +=3D " \
> -    ${libdir}/ctapi/.debug \
> -    ${libdir}/pcsc/drivers/openct-ifd.bundle/Contents/Linux/.debug \
> -"
> -
> -INSANE_SKIP:${PN} +=3D "dev-deps"
> -
> -do_install[cleandirs] +=3D "${D}"
> -
> -do_install () {
> -    install -d ${D}${sysconfdir}
> -    # fix up hardcoded paths
> -    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
> -        ${UNPACKDIR}/openct.service ${UNPACKDIR}/openct.init
> -
> -    oe_runmake install DESTDIR=3D${D}
> -    install -dm 755 ${D}${libdir}/ctapi/
> -    mv ${D}${libdir}/libopenctapi.so ${D}${libdir}/ctapi/
> -    install -Dpm 644 etc/openct.udev
> ${D}${nonarch_libdir}/udev/rules.d/60-openct.rules
> -    install -pm 644 etc/openct.conf ${D}${sysconfdir}/openct.conf
> -
> -    install -Dpm 755 ${UNPACKDIR}/openct.init
> ${D}${sysconfdir}/init.d/openct
> -    install -Dpm 644 ${UNPACKDIR}/openct.sysconfig
> ${D}${sysconfdir}/sysconfig/openct
> -
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 644 ${UNPACKDIR}/openct.service
> ${D}${systemd_unitdir}/system
> -
> -    so=3D$(find ${D} -name \*.so | sed "s|^${D}||")
> -    sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
> -    install -Dpm 644 etc/reader.conf
> ${D}${sysconfdir}/reader.conf.d/openct.conf
> -}
> -
> -BBCLASSEXTEND =3D "native"
> -
> -# http://errors.yoctoproject.org/Errors/Details/766890/
> -# openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing argument 2 o=
f
> 'ifd_get_eventfd' from incompatible pointer type
> [-Wincompatible-pointer-types]
> -# openct-0.6.20/src/ifd/process.c:461:61: error: passing argument 4 of
> 'ct_tlv_get_opaque' from incompatible pointer type
> [-Wincompatible-pointer-types]
> -CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> --
> 2.43.0
>
>
>
>
>

--000000000000f2b0d8064f61efdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Keep the option and leave disabled by default</div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Apr 13, 2026, 6:37=E2=80=AFPM Ruoqin Zheng (Fujitsu) &lt;=
<a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi khem</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0There is &quot;--enable-openct &quot; option in opensc.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-openct =C2=A0 =C2=A0 =C2=A0 =C2=A0 enab=
le openct linkage [disabled]</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
In this situation, how should I deal with it?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Zheng</div>
<div id=3D"m_-4545849788828544014appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-4545849788828544014divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bl=
ank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</a> &lt;<=
a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</a>&gt; on =
behalf of Khem Raj via <a href=3D"http://lists.openembedded.org" target=3D"=
_blank" rel=3D"noreferrer">lists.openembedded.org</a> &lt;raj.khem=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank" rel=3D"nore=
ferrer">gmail.com@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Friday, April 3, 2026 16:14<br>
<b>To:</b> Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 &lt;<a href=3D"mailto=
:zhengrq.fnst@fujitsu.com" target=3D"_blank" rel=3D"noreferrer">zhengrq.fns=
t@fujitsu.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org=
</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</=
a>&gt;<br>
<b>Subject:</b> Re: [oe][meta-oe][PATCH] openct: Drop this recipe</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">it needs to be removed from=C2=A0meta-oe/recipes-core/pack=
agegroups/<a href=3D"http://packagegroup-meta-oe.bb" target=3D"_blank" rel=
=3D"noreferrer">packagegroup-meta-oe.bb</a> as well
<div>and opensc seems to have a packageconfig for this. Can you find out if=
 we now need to disable that packageconfig=C2=A0</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Fri, Apr 3, 2026 at 12:24=E2=80=AFAM zhengruoqin via
<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferr=
er">lists.openembedded.org</a> &lt;zhengrq.fnst=3D<a href=3D"mailto:fujitsu=
.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">fujitsu.c=
om@lists.openembedded.org</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Drop openct as it is unmaintained upstream.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com"=
 target=3D"_blank" rel=3D"noreferrer">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...e-pointer-type-error-with-gcc-option.patch | 65 -------------<br>
=C2=A0...t-the-first-line-of-compiler-version.patch | 31 -------<br>
=C2=A0.../etc-openct.udev.in-disablePROGRAM.patch=C2=A0 =C2=A0| 31 -------<=
br>
=C2=A0.../etc-openct_usb.in-modify-UDEVINFO.patch=C2=A0 =C2=A0| 35 -------<=
br>
=C2=A0.../recipes-support/openct/openct/openct.init | 89 ------------------=
<br>
=C2=A0.../openct/openct/openct.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 13 ---<br>
=C2=A0.../openct/openct/openct.sysconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 -<br>
=C2=A0.../recipes-support/openct/<a href=3D"http://openct_0.6.20.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">openct_0.6.20.bb</a>=C2=A0 =C2=A0=
| 91 -------------------<br>
=C2=A08 files changed, 360 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/openct/0001-Fix-inc=
ompatible-pointer-type-error-with-gcc-option.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/openct/0001-m4-Just=
-emit-the-first-line-of-compiler-version.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/openct/etc-openct.u=
dev.in-disablePROGRAM.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/openct/etc-openct_u=
sb.in-modify-UDEVINFO.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/openct/openct.init<=
br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/openct/openct.servi=
ce<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/openct/openct.sysco=
nfig<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/openct/<a href=3D"http://o=
penct_0.6.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">openct_0.6=
.20.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-po=
inter-type-error-with-gcc-option.patch b/meta-oe/recipes-support/openct/ope=
nct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch<br>
deleted file mode 100644<br>
index 73c9d06667..0000000000<br>
--- a/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-t=
ype-error-with-gcc-option.patch<br>
+++ /dev/null<br>
@@ -1,65 +0,0 @@<br>
-From c4351058da555e1e6a2b4b15d913baee80f55865 Mon Sep 17 00:00:00 2001<br>
-From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_bla=
nk" rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
-Date: Thu, 27 Jun 2024 06:27:18 +0000<br>
-Subject: Fix incompatible pointer type error with gcc option <br>
- -Wincompatible-pointer-types<br>
-<br>
-| ../../../openct-0.6.20/src/ifd/ifdhandler.c: In function &#39;ifdhandler=
_run&#39;:<br>
-| ../../../openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing argum=
ent 2 of &#39;ifd_get_eventfd&#39; from incompatible pointer type [-Wincomp=
atible-pointer-types]<br>
-|=C2=A0 =C2=A0239 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sock-&gt;fd =3D ifd_get_eventfd(reader, &amp;sock-&gt;events);<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~=
~<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int *<br>
-| In file included from ../../../openct-0.6.20/src/ifd/internal.h:17,<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/../openct-0.6.20/src/ifd/ifdhandler.c:7:<br>
-| ../../../openct-0.6.20/src/include/openct/ifd.h:182:65: note: expected &=
#39;short int *&#39; but argument is of type &#39;int *&#39;<br>
-|=C2=A0 =C2=A0182 | extern int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ifd_get_eventfd(ifd_reader_t *, short *)=
;<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~<br>
-<br>
-| ../../../openct-0.6.20/src/ifd/process.c: In function &#39;do_memory_wri=
te&#39;:<br>
-| ../../../openct-0.6.20/src/ifd/process.c:461:61: error: passing argument=
 4 of &#39;ct_tlv_get_opaque&#39; from incompatible pointer type [-Wincompa=
tible-pointer-types]<br>
-|=C2=A0 =C2=A0461 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !ct_=
tlv_get_opaque(args, CT_TAG_DATA, &amp;data, &amp;data_len))<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *<br>
-| In file included from ../../../openct-0.6.20/src/ifd/process.c:20:<br>
-| ../../../openct-0.6.20/src/include/openct/tlv.h:40:62: note: expected &#=
39;size_t *&#39; {aka &#39;long unsigned int *&#39;} but argument is of typ=
e &#39;unsigned int *&#39;<br>
-|=C2=A0 =C2=A0 40 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifd_tag_t, u=
nsigned char **, size_t *);<br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank" rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
----<br>
- src/ifd/ifdhandler.c | 2 +-<br>
- src/ifd/process.c=C2=A0 =C2=A0 | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/ifd/ifdhandler.c b/src/ifd/ifdhandler.c<br>
-index 12686c9..ebd1b53 100644<br>
---- a/src/ifd/ifdhandler.c<br>
-+++ b/src/ifd/ifdhandler.c<br>
-@@ -236,7 +236,7 @@ static void ifdhandler_run(ifd_reader_t * reader)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sock-&gt;fd =3D -1;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock-&gt;fd =3D ifd_get_=
eventfd(reader, &amp;sock-&gt;events);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock-&gt;fd =3D ifd_get_=
eventfd(reader, (short int *)&amp;sock-&gt;events);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sock-&gt;fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifd_debug(1, &quot;=
events inactive for reader %s&quot;, reader-&gt;name);<br>
-diff --git a/src/ifd/process.c b/src/ifd/process.c<br>
-index 4563bdf..7088a76 100644<br>
---- a/src/ifd/process.c<br>
-+++ b/src/ifd/process.c<br>
-@@ -458,7 +458,7 @@ static int do_memory_write(ifd_reader_t * reader, int =
unit,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IFD_ERROR_IN=
VALID_SLOT;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ct_tlv_get_int(args, CT_TAG_ADDRESS, &amp;a=
ddress) =3D=3D 0<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || !ct_tlv_get_opaque(args, CT_TAG_DAT=
A, &amp;data, &amp;data_len))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || !ct_tlv_get_opaque(args, CT_TAG_DAT=
A, &amp;data, (size_t *)&amp;data_len))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IFD_ERROR_MI=
SSING_ARG;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D ifd_card_write_memory(reader, unit, addr=
ess, data, data_len);<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-fi=
rst-line-of-compiler-version.patch b/meta-oe/recipes-support/openct/openct/=
0001-m4-Just-emit-the-first-line-of-compiler-version.patch<br>
deleted file mode 100644<br>
index 9bd3d18d6e..0000000000<br>
--- a/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-lin=
e-of-compiler-version.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From 146b5116140d719e4e9ae19748c0b6dee7d82f96 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
-Date: Mon, 22 May 2023 22:01:28 -0700<br>
-Subject: [PATCH] m4: Just emit the first line of compiler version<br>
-<br>
-Avoids emitting buildpaths into comments<br>
-Fixes<br>
-WARNING: openct-0.6.20-r0 do_package_qa: QA Issue: File /usr/include/openc=
t/types.h in package openct-dev contains reference to TMPDIR [buildpaths]<b=
r>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
----<br>
- m4/ac_create_stdint_h.m4 | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/m4/ac_create_stdint_h.m4 b/m4/ac_create_stdint_h.m4<br>
-index 66de704..4b7223a 100644<br>
---- a/m4/ac_create_stdint_h.m4<br>
-+++ b/m4/ac_create_stdint_h.m4<br>
-@@ -110,7 +110,7 @@ echo &quot;#define&quot; $_ac_stdint_h &quot;1&quot; &=
gt;&gt;$ac_stdint_h<br>
- echo &quot;#ifndef&quot; _GENERATED_STDINT_H &gt;&gt;$ac_stdint_h<br>
- echo &quot;#define&quot; _GENERATED_STDINT_H &#39;&quot;&#39;$PACKAGE $VE=
RSION&#39;&quot;&#39; &gt;&gt;$ac_stdint_h<br>
- if test &quot;$GCC&quot; =3D &quot;yes&quot; ; then<br>
--=C2=A0 echo &quot;/* generated using a gnu compiler version&quot; `$CC --=
version` &quot;*/&quot; \<br>
-+=C2=A0 echo &quot;/* generated using a gnu compiler version&quot; `$CC --=
version|head -1` &quot;*/&quot; \<br>
-=C2=A0 =C2=A0&gt;&gt;$ac_stdint_h<br>
- else<br>
-=C2=A0 =C2=A0echo &quot;/* generated using $CC */&quot; &gt;&gt;$ac_stdint=
_h<br>
--- <br>
-2.40.1<br>
-<br>
diff --git a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disab=
lePROGRAM.patch b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-=
disablePROGRAM.patch<br>
deleted file mode 100644<br>
index e2401bb31b..0000000000<br>
--- a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGR=
AM.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From e0d3e0bb1e38ff851696a7d8826e651d364ad8ce Mon Sep 17 00:00:00 2001<br>
-From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" target=3D"_b=
lank" rel=3D"noreferrer">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
-Date: Fri, 5 Dec 2014 02:00:57 +0900<br>
-Subject: [PATCH 1/2] etc/<a href=3D"http://openct.udev.in" rel=3D"noreferr=
er noreferrer" target=3D"_blank">openct.udev.in</a>: disablePROGRAM<br>
-<br>
-Bug fix: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D287871" =
rel=3D"noreferrer noreferrer" target=3D"_blank">
https://bugzilla.redhat.com/show_bug.cgi?id=3D287871</a><br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" tar=
get=3D"_blank" rel=3D"noreferrer">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
----<br>
- etc/<a href=3D"http://openct.udev.in" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">openct.udev.in</a> | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/etc/<a href=3D"http://openct.udev.in" rel=3D"noreferrer noref=
errer" target=3D"_blank">openct.udev.in</a> b/etc/<a href=3D"http://openct.=
udev.in" rel=3D"noreferrer noreferrer" target=3D"_blank">openct.udev.in</a>=
<br>
-index d11d0e1..48083c9 100644<br>
---- a/etc/<a href=3D"http://openct.udev.in" rel=3D"noreferrer noreferrer" =
target=3D"_blank">openct.udev.in</a><br>
-+++ b/etc/<a href=3D"http://openct.udev.in" rel=3D"noreferrer noreferrer" =
target=3D"_blank">openct.udev.in</a><br>
-@@ -22,7 +22,8 @@ ACTION!=3D&quot;add&quot;, GOTO=3D&quot;openct_usb_rules=
_end&quot;<br>
- # 2010-01-06 removed, as latest udev doesn&#39;t know WAIT_FOR_ATTR any m=
ore.<br>
- <br>
- # sleep for 100ms - the wait_for_sysfs might not be enough<br>
--PROGRAM=3D&quot;/bin/sleep 0.1&quot;<br>
-+# Disabled in this package - see <a href=3D"https://bugzilla.redhat.com/2=
87871" rel=3D"noreferrer noreferrer" target=3D"_blank">
https://bugzilla.redhat.com/287871</a><br>
-+# PROGRAM=3D&quot;/bin/sleep 0.1&quot;<br>
- <br>
- # ccid<br>
- ATTR{bInterfaceClass}=3D=3D&quot;0b&quot;, ATTR{bInterfaceSubClass}=3D=3D=
&quot;00&quot;, ATTR{bInterfaceProtocol}=3D=3D&quot;00&quot;, ATTRS{idVendo=
r}=3D=3D&quot;?*&quot;=C2=A0 RUN+=3D&quot;@udevdir@/openct_usb /dev/$parent=
&quot;<br>
--- <br>
-1.8.4.2<br>
-<br>
diff --git a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify=
-UDEVINFO.patch b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-m=
odify-UDEVINFO.patch<br>
deleted file mode 100644<br>
index 22eda729fb..0000000000<br>
--- a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVIN=
FO.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From d93985a137b553b2723235d03bda341dab14064f Mon Sep 17 00:00:00 2001<br>
-From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" target=3D"_b=
lank" rel=3D"noreferrer">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
-Date: Fri, 5 Dec 2014 02:04:03 +0900<br>
-Subject: [PATCH 2/2] etc/<a href=3D"http://openct_usb.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">openct_usb.in</a>: modify UDEVINFO<br>
-<br>
-this patch is from Fedora<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" tar=
get=3D"_blank" rel=3D"noreferrer">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
----<br>
- etc/<a href=3D"http://openct_usb.in" rel=3D"noreferrer noreferrer" target=
=3D"_blank">openct_usb.in</a> | 6 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/etc/<a href=3D"http://openct_usb.in" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">openct_usb.in</a> b/etc/<a href=3D"http://openct_us=
b.in" rel=3D"noreferrer noreferrer" target=3D"_blank">openct_usb.in</a><br>
-index 32f91aa..917467d 100644<br>
---- a/etc/<a href=3D"http://openct_usb.in" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">openct_usb.in</a><br>
-+++ b/etc/<a href=3D"http://openct_usb.in" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">openct_usb.in</a><br>
-@@ -15,10 +15,10 @@ if [ -z &quot;$DEVNAME&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Guess udev info interface.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Newer udev uses udevadm<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
--=C2=A0 =C2=A0 =C2=A0 if which udevinfo &gt; /dev/null 2&gt;&amp;1; then<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UDEVINFO=3D&quot;udevinf=
o&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 if which udevadm &gt; /dev/null 2&gt;&amp;1; then<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UDEVINFO=3D&quot;ud=
evadm info&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UDEVINFO=3D&quot;udevinf=
o&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DEVNAME=3D/dev/$($UDEVINFO --query=3Dname --pat=
h=3D$(dirname $DEVPATH))<br>
- fi<br>
--- <br>
-1.8.4.2<br>
-<br>
diff --git a/meta-oe/recipes-support/openct/openct/openct.init b/meta-oe/re=
cipes-support/openct/openct/openct.init<br>
deleted file mode 100644<br>
index c6896095e3..0000000000<br>
--- a/meta-oe/recipes-support/openct/openct/openct.init<br>
+++ /dev/null<br>
@@ -1,89 +0,0 @@<br>
-#!/bin/sh<br>
-#<br>
-# openct=C2=A0 =C2=A0 =C2=A0 =C2=A0This shell script takes care of startin=
g and stopping OpenCT.<br>
-#<br>
-# chkconfig:=C2=A0 =C2=A02345 24 89<br>
-# description: OpenCT is a middleware framework for smart card terminals.<=
br>
-#<br>
-# processname: ifdhandler<br>
-# config:=C2=A0 =C2=A0 =C2=A0 /etc/openct.conf<br>
-<br>
-### BEGIN INIT INFO<br>
-# Provides: openct<br>
-# Default-Start: 2 3 4 5<br>
-# Default-Stop: 0 1 6<br>
-# Should-Start: $syslog $network<br>
-# Should-Stop: $syslog $network<br>
-# Short-Description: Middleware framework for smart card terminals<br>
-# Description: This starts/stops the OpenCT middleware framework support<b=
r>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for smart card terminals=
.<br>
-### END INIT INFO<br>
-<br>
-. /etc/init.d/functions<br>
-<br>
-exec=3D&quot;/usr/sbin/openct-control&quot;<br>
-prog=3Dopenct<br>
-proc=3Difdhandler<br>
-<br>
-OPENCT_OPTIONS=3D<br>
-[ -e /etc/sysconfig/$prog ] &amp;&amp; . /etc/sysconfig/$prog<br>
-<br>
-lockfile=3D/var/lock/subsys/$prog<br>
-<br>
-start() {<br>
-=C2=A0 =C2=A0 retval=3D0<br>
-=C2=A0 =C2=A0 if ! status $proc &gt;/dev/null 2&gt;&amp;1 ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 action $&quot;Initializing OpenCT smart card t=
erminals: &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $exec $OPENCT_OPTIONS init<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ $retval -eq 0 ] &amp;&amp; touch $lockfile<b=
r>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 return $retval<br>
-}<br>
-<br>
-stop() {<br>
-=C2=A0 =C2=A0 if status $proc &gt;/dev/null 2&gt;&amp;1 ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 action $&quot;Stopping OpenCT smart card termi=
nals: &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $exec $OPENCT_OPTIONS shutdown<b=
r>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 retval=3D$?<br>
-=C2=A0 =C2=A0 if [ $retval -eq 0 ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f /var/run/openct/status<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $lockfile<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 return $retval<br>
-}<br>
-<br>
-restart() {<br>
-=C2=A0 =C2=A0 stop<br>
-=C2=A0 =C2=A0 start<br>
-}<br>
-<br>
-oct_status() {<br>
-=C2=A0 =C2=A0 status $proc<br>
-=C2=A0 =C2=A0 retval=3D$?<br>
-=C2=A0 =C2=A0 if [ -e /var/run/openct/status ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $exec $OPENCT_OPTIONS status<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -e /var/run/openct/status ] &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $&quot;Waiting for reader a=
ttach/detach events...&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 return $retval<br>
-}<br>
-<br>
-case &quot;$1&quot; in<br>
-=C2=A0 =C2=A0 start|stop|restart)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 reload|force-reload)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 restart<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 status)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oct_status<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 try-restart|condrestart)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -f $lockfile ] || restart<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 *)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $&quot;Usage: $0 {start|stop|status|resta=
rt|try-restart|reload|force-reload}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 2<br>
-esac<br>
diff --git a/meta-oe/recipes-support/openct/openct/openct.service b/meta-oe=
/recipes-support/openct/openct/openct.service<br>
deleted file mode 100644<br>
index 57de8c0a88..0000000000<br>
--- a/meta-oe/recipes-support/openct/openct/openct.service<br>
+++ /dev/null<br>
@@ -1,13 +0,0 @@<br>
-[Unit]<br>
-Description=3DOpenct Middleware framework for smart card terminals<br>
-After=3Dsyslog.target network.target<br>
-<br>
-[Service]<br>
-EnvironmentFile=3D-/etc/sysconfig/openct<br>
-ExecStart=3D/usr/sbin/openct-control $OPENCT_OPTIONS init <br>
-ExecStop=3D/usr/sbin/openct-control $OPENCT_OPTIONS shutdown<br>
-RemainAfterExit=3Dyes<br>
-KillMode=3Dmixed<br>
-<br>
-[Install]<br>
-WantedBy=3Dmulti-user.target<br>
diff --git a/meta-oe/recipes-support/openct/openct/openct.sysconfig b/meta-=
oe/recipes-support/openct/openct/openct.sysconfig<br>
deleted file mode 100644<br>
index ffc270790f..0000000000<br>
--- a/meta-oe/recipes-support/openct/openct/openct.sysconfig<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -*- sh -*-<br>
-# Extra options to pass to openct-control.<br>
-# Consult &quot;/usr/sbin/openct-control -h&quot; for available options.<b=
r>
-#<br>
-OPENCT_OPTIONS=3D&quot;&quot;<br>
diff --git a/meta-oe/recipes-support/openct/<a href=3D"http://openct_0.6.20=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">openct_0.6.20.bb</a> b=
/meta-oe/recipes-support/openct/<a href=3D"http://openct_0.6.20.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">openct_0.6.20.bb</a><br>
deleted file mode 100644<br>
index c7b0d0d56d..0000000000<br>
--- a/meta-oe/recipes-support/openct/<a href=3D"http://openct_0.6.20.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">openct_0.6.20.bb</a><br>
+++ /dev/null<br>
@@ -1,91 +0,0 @@<br>
-SUMMARY =3D &quot;Middleware framework for smart card terminals&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/OpenSC/openct/wiki" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/OpenSC/open=
ct/wiki</a>&quot;<br>
-DESCRIPTION =3D &quot; \<br>
-OpenCT implements drivers for several smart card readers. \<br>
-It comes as driver in ifdhandler format for PC/SC-Lite, \<br>
-as CT-API driver, or as a small and lean middleware, \<br>
-so applications can use it with minimal overhead. \<br>
-OpenCT also has a primitive mechanism to export smart card \<br>
-readers to remote machines via TCP/IP.&quot;<br>
-<br>
-DEPENDS +=3D &quot;libtool pcsc-lite libusb-compat&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"https://downloads.sourceforge.net/project/opensc/=
$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">
https://downloads.sourceforge.net/project/opensc/${BPN}/${BPN}-${PV}.tar.gz=
</a> \<br>
-=C2=A0 =C2=A0 file://etc-openct.udev.in-disablePROGRAM.patch \<br>
-=C2=A0 =C2=A0 file://etc-openct_usb.in-modify-UDEVINFO.patch \<br>
-=C2=A0 =C2=A0 file://0001-m4-Just-emit-the-first-line-of-compiler-version.=
patch \<br>
-=C2=A0 =C2=A0 file://openct.init \<br>
-=C2=A0 =C2=A0 file://openct.sysconfig \<br>
-=C2=A0 =C2=A0 file://openct.service \<br>
-=C2=A0 =C2=A0 file://0001-Fix-incompatible-pointer-type-error-with-gcc-opt=
ion.patch \<br>
-&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed59=
22a86c01c805d181a68&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/projects/o=
pensc/files/openct/" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//sourceforge.net/projects/opensc/files/openct/</a>&quot;<br>
-<br>
-LICENSE =3D &quot;LGPL-2.0-or-later&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LGPL-2.1;md5=3D2d5025d4aa3495befef8f1720=
6a5b0a1&quot;<br>
-<br>
-inherit systemd<br>
-SYSTEMD_SERVICE:${PN} +=3D &quot;openct.service &quot;<br>
-SYSTEMD_AUTO_ENABLE =3D &quot;enable&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot; \<br>
-=C2=A0 =C2=A0 --disable-static \<br>
-=C2=A0 =C2=A0 --enable-usb \<br>
-=C2=A0 =C2=A0 --enable-pcsc \<br>
-=C2=A0 =C2=A0 --enable-doc \<br>
-=C2=A0 =C2=A0 --enable-api-doc \<br>
-=C2=A0 =C2=A0 --with-udev=3D${nonarch_libdir}/udev \<br>
-=C2=A0 =C2=A0 --with-bundle=3D${libdir}/pcsc/drivers \<br>
-&quot;<br>
-<br>
-inherit autotools pkgconfig<br>
-<br>
-FILES:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/ctapi \<br>
-=C2=A0 =C2=A0 ${nonarch_libdir}/udev \<br>
-=C2=A0 =C2=A0 ${libdir}/openct-ifd.so \<br>
-=C2=A0 =C2=A0 ${libdir}/pcsc \<br>
-&quot;<br>
-<br>
-FILES:${PN}-dbg +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${libdir}/ctapi/.debug \<br>
-=C2=A0 =C2=A0 ${libdir}/pcsc/drivers/openct-ifd.bundle/Contents/Linux/.deb=
ug \<br>
-&quot;<br>
-<br>
-INSANE_SKIP:${PN} +=3D &quot;dev-deps&quot;<br>
-<br>
-do_install[cleandirs] +=3D &quot;${D}&quot;<br>
-<br>
-do_install () {<br>
-=C2=A0 =C2=A0 install -d ${D}${sysconfdir}<br>
-=C2=A0 =C2=A0 # fix up hardcoded paths<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s,/etc/,${sysconfdir}/,&#39; -e &#39;s,/usr/s=
bin/,${sbindir}/,&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${UNPACKDIR}/openct.service ${UNPACKDIR}/openc=
t.init<br>
-<br>
-=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D}<br>
-=C2=A0 =C2=A0 install -dm 755 ${D}${libdir}/ctapi/<br>
-=C2=A0 =C2=A0 mv ${D}${libdir}/libopenctapi.so ${D}${libdir}/ctapi/<br>
-=C2=A0 =C2=A0 install -Dpm 644 etc/openct.udev ${D}${nonarch_libdir}/udev/=
rules.d/60-openct.rules<br>
-=C2=A0 =C2=A0 install -pm 644 etc/openct.conf ${D}${sysconfdir}/openct.con=
f<br>
-<br>
-=C2=A0 =C2=A0 install -Dpm 755 ${UNPACKDIR}/openct.init ${D}${sysconfdir}/=
init.d/openct<br>
-=C2=A0 =C2=A0 install -Dpm 644 ${UNPACKDIR}/openct.sysconfig ${D}${sysconf=
dir}/sysconfig/openct<br>
-<br>
-=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
-=C2=A0 =C2=A0 install -m 644 ${UNPACKDIR}/openct.service ${D}${systemd_uni=
tdir}/system<br>
-<br>
-=C2=A0 =C2=A0 so=3D$(find ${D} -name \*.so | sed &quot;s|^${D}||&quot;)<br=
>
-=C2=A0 =C2=A0 sed -i -e &#39;s|\\(LIBPATH\\s*\\).*|\\1$so|&#39; etc/reader=
.conf<br>
-=C2=A0 =C2=A0 install -Dpm 644 etc/reader.conf ${D}${sysconfdir}/reader.co=
nf.d/openct.conf<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
-<br>
-# <a href=3D"http://errors.yoctoproject.org/Errors/Details/766890/" rel=3D=
"noreferrer noreferrer" target=3D"_blank">
http://errors.yoctoproject.org/Errors/Details/766890/</a><br>
-# openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing argument 2 of =
&#39;ifd_get_eventfd&#39; from incompatible pointer type [-Wincompatible-po=
inter-types]<br>
-# openct-0.6.20/src/ifd/process.c:461:61: error: passing argument 4 of &#3=
9;ct_tlv_get_opaque&#39; from incompatible pointer type [-Wincompatible-poi=
nter-types]<br>
-CFLAGS +=3D &quot;-Wno-error=3Dincompatible-pointer-types&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--000000000000f2b0d8064f61efdb--

