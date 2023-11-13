Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E08FC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 00:06:45 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.26813.1699834002243453912
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 16:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L4eoqrCt;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ce2cf67be2so2113377a34.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 16:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699834001; x=1700438801; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqdJ5XltB0yz1AeeXOo1CBzIeUc0lwo4jHj1kqyaM+E=;
        b=L4eoqrCthwt1wwyKkedGOommUP9URanizZApdE//n/5OI5IfDAVWr3KHv0aD+tfDUt
         W7AhvWMQRfop3AMlDTtaT4YcqYwg8yxtDPHPHbSU+sXFhE6vBi796PJ43QEqdIt8poKM
         F0svnKlYDEowy44PxaHq7KRLLTA4iBQXqNvzBYhHV671LrSjNOSVuRSxMmNur7zBJPzu
         q1OPeUVOBeZjU5q2E8OpsQoS81lHZ2bqG+EykOdL9IjdN9S7bdPOEJLs2a9bfp4dMwGx
         DC+UJ3u+Hqo9je0BVjcQ/31pKmkAKYwsmnTBtlKi2axGBNxIa519lEQ4U4RM0fwZDX2J
         TY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699834001; x=1700438801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqdJ5XltB0yz1AeeXOo1CBzIeUc0lwo4jHj1kqyaM+E=;
        b=cmnKiilyuJtaY9zDtON/naDIGHL13q07nz8tGvFfeSLYtLTSJEvB/qH7qf9Ilg+xo9
         uFEjS6KMVX8uiMBgGbYSIWjqRkYdG9nrhGAjTZ/KJo/TX2cFoMjtfhWGfP+O0gpUww70
         ThKibPpobqH/6RpJewAzL4puvRrLzU70QcKzk9mQ21IM2AoKWb78tQuxryW/xNPWLGng
         43kBpkj+Lx3g6g8VTlIO21L/4nAZExc5dEA5l7WAP4JxW0wEVddnljLTxc0iGTfmfIK6
         R4zy6Wygt9WOZUgL8l46tKLF5Vvf68pSNNpw7mW1Y0OfDYr5em0a4vCx+xXeQKPLrNId
         SWQg==
X-Gm-Message-State: AOJu0Yzojzu9sV6sMa52YlSFcVvROnZoDI7Lfn5X7nsRjnrjjHIwybPh
	8II6EJEA2pK7RUOvJLj0eGjXtnLfA1R0jARvGfY=
X-Google-Smtp-Source: AGHT+IHayzdIhnyrwDRoPPudsSuR1eAQWeAEjx4NITIFi6Tq1u7Vw3wHSqrchL0s4n119wta0vYK4weldH+x7fIZ7FM=
X-Received: by 2002:a05:6870:ff96:b0:1e9:ba96:272e with SMTP id
 qp22-20020a056870ff9600b001e9ba96272emr6663851oab.10.1699834001272; Sun, 12
 Nov 2023 16:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20231111120116.31517-1-f_l_k@t-online.de>
In-Reply-To: <20231111120116.31517-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 16:06:15 -0800
Message-ID: <CAMKF1sp5DBN7c02-bHiJnLUYi0k-sHS18C75k2WVHqz3KKGQ9A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] ghex: Upgrade 3.18.4 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 00:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106618

Markus

I am seeing a build failure with clang but I doubt its related to compiler =
type.

| x86_64-yoe-linux-clang -target x86_64-yoe-linux -m64 -march=3Dcore2
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mlittle-endian --dyld-prefix=3D/usr
-Qunused-arguments -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2
-Wformat -Wformat-
security -Werror=3Dformat-security
--sysroot=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/r=
ecipe-sysroot
-Isrc/libgtkhex-4.so.1.4.0.p -Isrc -I../ghex-45.0/src -I.
-I../ghex-45.0 -I/mnt/b/yoe/master/build/tmp
/work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot/usr/include/glib-2.0
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/lib/glib-2.0/include
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe
-linux/ghex/45.0/recipe-sysroot/usr/include/libmount
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/blkid
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-s
ysroot/usr/include/gtk-4.0
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/pango-1.0
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/har
fbuzz -I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recip=
e-sysroot/usr/include/fribidi
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/gdk-pixbuf-2.0
-I/mnt/b/yo
e/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot/usr/inc=
lude/cairo
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/pixman-1
-I/mnt/b/yoe/master/build/tmp/work/c
ore2-64-yoe-linux/ghex/45.0/recipe-sysroot/usr/include/freetype2
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/libdrm
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/
45.0/recipe-sysroot/usr/include/libpng16
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/graphene-1.0
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oo
t/usr/lib/graphene-1.0/include -fcolor-diagnostics
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wno-unused-variable
-Wno-unused-parameter -Werror=3Dimplicit -Wformat=3D2 -O2 -pipe -g
-feliminate-unused-debug-types -fmacro-prefi
x-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/ghex-=
45.0=3D/usr/src/debug/ghex/45.0-r0
-fdebug-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/gh=
ex/45.0/ghex-45.0=3D/usr/src/debug/ghex/45.0-
r0 -fmacro-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux=
/ghex/45.0/build=3D/usr/src/debug/ghex/45.0-r0
-fdebug-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/gh=
ex/45.0/build=3D/usr/src/debug/gh
ex/45.0-r0 -fdebug-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-y=
oe-linux/ghex/45.0/recipe-sysroot=3D
-fmacro-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/gh=
ex/45.0/recipe-sysroot=3D
-fdebug-prefix-ma
p=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sy=
sroot-native=3D
-fPIC -mfpmath=3Dsse -msse -msse2 -pthread '-DG_LOG_DOMAIN=3D"gtkhex-4"'
-MD -MQ src/libgtkhex-4.so.1.4.0.p/gtkhex.c.o -MF src/libgtkhex-4.
so.1.4.0.p/gtkhex.c.o.d -o src/libgtkhex-4.so.1.4.0.p/gtkhex.c.o -c
../ghex-45.0/src/gtkhex.c
| ../ghex-45.0/src/gtkhex.c:1944:4: error: expected expression
|  1944 |                         gint64 line_beg =3D self->cursor_pos;
|       |                         ^
| ../ghex-45.0/src/gtkhex.c:1946:11: error: use of undeclared
identifier 'line_beg'
|  1946 |                         while (line_beg % self->cpl !=3D 0)
|       |                                ^
| ../ghex-45.0/src/gtkhex.c:1947:7: error: use of undeclared
identifier 'line_beg'
|  1947 |                                 --line_beg;
|       |                                   ^
| ../ghex-45.0/src/gtkhex.c:1949:33: error: use of undeclared
identifier 'line_beg'
|  1949 |                         hex_widget_set_cursor (self, line_beg);
|       |                                                      ^
| ../ghex-45.0/src/gtkhex.c:1954:4: error: expected expression
|  1954 |                         gint64 line_end =3D self->cursor_pos;
|       |                         ^
| ../ghex-45.0/src/gtkhex.c:1956:11: error: use of undeclared
identifier 'line_end'
|  1956 |                         while (line_end % self->cpl !=3D self->cp=
l - 1)
|       |                                ^
| ../ghex-45.0/src/gtkhex.c:1957:7: error: use of undeclared
identifier 'line_end'
|  1957 |                                 ++line_end;
|       |                                   ^
| ../ghex-45.0/src/gtkhex.c:1959:38: error: use of undeclared
identifier 'line_end'
|  1959 |                         hex_widget_set_cursor (self, MIN
(line_end, payload_size));
|       |                                                           ^
| ../ghex-45.0/src/gtkhex.c:1959:38: error: use of undeclared
identifier 'line_end'
| 9 errors generated.

On Sat, Nov 11, 2023 at 4:00=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - enable gi,vapi,api-documentation
> - switch to gtk4
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb | 17 -----------------
>  meta-gnome/recipes-gnome/ghex/ghex_45.0.bb   | 20 ++++++++++++++++++++
>  2 files changed, 20 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
>  create mode 100644 meta-gnome/recipes-gnome/ghex/ghex_45.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb b/meta-gnome/re=
cipes-gnome/ghex/ghex_3.18.4.bb
> deleted file mode 100644
> index 08e50409e..000000000
> --- a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY =3D "GHex - a hex editor for GNOME"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -
> -GNOMEBASEBUILDCLASS =3D "meson"
> -
> -DEPENDS =3D " \
> -    glib-2.0-native \
> -    gtk+3 \
> -"
> -
> -inherit gnomebase gsettings gtk-icon-cache gnome-help gettext upstream-v=
ersion-is-even
> -
> -SRC_URI[archive.md5sum] =3D "7e6ed808766bc18285bdc6999bdf0f15"
> -SRC_URI[archive.sha256sum] =3D "c2d9c191ff5bce836618779865bee4059db81a3a=
0dff38bda3cc7a9e729637c0"
> -
> -FILES:${PN} +=3D "${datadir}/metainfo"
> diff --git a/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb b/meta-gnome/reci=
pes-gnome/ghex/ghex_45.0.bb
> new file mode 100644
> index 000000000..6d3e9b978
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "GHex - a hex editor for GNOME"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +
> +DEPENDS =3D " \
> +    desktop-file-utils-native  \
> +    glib-2.0-native \
> +    gtk4 \
> +    libadwaita \
> +"
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +
> +inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-in=
trospection vala gi-docgen
> +
> +SRC_URI[archive.sha256sum] =3D "05cecc4561ca40b257c5db31da9f68d696133efc=
0ae427ed82fb985a986e840e"
> +
> +FILES:${PN} +=3D "${libdir} ${datadir}/metainfo"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106552): https://lists.openembedded.org/g/openembedde=
d-devel/message/106552
> Mute This Topic: https://lists.openembedded.org/mt/102524551/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

