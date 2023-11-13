Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7B5C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:18:07 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.32190.1699859885638044797
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULw7pYf6;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1f04c5ed8d7so2643258fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699859885; x=1700464685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBeSEKF7bT8WgA2kVu5T02DdLvNZIjvTNIvZybRmfEM=;
        b=ULw7pYf6C/YLvEsAWtiN3c6Gt5u7OyB0VWZCQxuzSN7nVGoTBSAlZunic5E5o6m/im
         rU1XLkRIujvaM/Aa5/prUBA1T+o6SVzY9csNwGhWEUGQnaTX0taB08d39C+PDzhTYEI7
         BQDI0wW/wtcwbmRrN7AgfMPTkToO0/Mcl6Q9nTrQRM/MF5TOCf8ZKVLSHqvYQfu1bOzS
         gM+pLrmO1VdTnHFInrOlTDSo5JfV7cvJVhCyX/rz0MFLONBUS6JDjC+cYrf97DY7TMJX
         usBGbwRnVwrnI32ry32VS9XmCutw7+M+EmoobwGRDdAUJIxLHlEQxANRFE/beK9Hzjku
         2Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699859885; x=1700464685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBeSEKF7bT8WgA2kVu5T02DdLvNZIjvTNIvZybRmfEM=;
        b=CQjkQJ8PoeOG6MHzsd+qr0UEAr0WrLeycKIOPlapgfF4Xt0Uwh85lKI8SRv9HjglCl
         4ADCYo61Qo+6p3ASGOWtDJpE+G/iXx7ZUlao3L/Sf9f05O++mqXvY+XdR7PGQmKvqHAZ
         jCL9qTs2CgQTR4eVuWt8DBB+LmYonOd83B0oSAb9rwiDXqtTRd7UbS8tUqN7dZexgF0n
         ALXHoGGGuuN9u75Gcb6nEUB/vi9gyj1PUCrWI9WaTHiQCb8sqZh240YBuWTbPyTd+rWT
         dr39O77Im6YBVYP/cw9XJ6pkX5b2RB/0KUksHwktXeaqEf5K6Ii9FvQWZdWBgse14/3y
         nnCQ==
X-Gm-Message-State: AOJu0YxgiUI4X5JXq6OaYEuESz48K/nbPiTZnhLE4gVyxi1b9JJElsMb
	F5vaG3f2WIRd60nHkOE2s92xSBKp6sBywE1nI2g=
X-Google-Smtp-Source: AGHT+IF1c62yr7DapOtKdKa+uXnqiiqrJw49fVxw4Q+a/VHtXw3u4275XVKFfcEvUiYeUowW269WhJygZNllE2vsvmg=
X-Received: by 2002:a05:6870:219b:b0:1e9:97eb:15a with SMTP id
 l27-20020a056870219b00b001e997eb015amr7586855oae.36.1699859884607; Sun, 12
 Nov 2023 23:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20231111120116.31517-1-f_l_k@t-online.de> <CAMKF1sp5DBN7c02-bHiJnLUYi0k-sHS18C75k2WVHqz3KKGQ9A@mail.gmail.com>
 <ROD14S.K1IV2J4GEO803@t-online.de>
In-Reply-To: <ROD14S.K1IV2J4GEO803@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 23:17:38 -0800
Message-ID: <CAMKF1sqCNLn_-4Z0miDouY=3ofsxX8wived+mO3EhzaBn7rn1g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] ghex: Upgrade 3.18.4 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106625

On Sun, Nov 12, 2023 at 4:36=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Hi Khem,
>
> I guess this issue has already been fixed upstream:
> https://gitlab.gnome.org/GNOME/ghex/-/issues/72
>
> Is it ok to send it as follow up ?

Yes please do.

>
> On Sun, Nov 12 2023 at 04:06:15 PM -08:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> Markus I am seeing a build failure with clang but I doubt its related to =
compiler type. | x86_64-yoe-linux-clang -target x86_64-yoe-linux -m64 -marc=
h=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mlittle-endian --dyld-prefi=
x=3D/usr -Qunused-arguments -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat- security -Werror=3Dformat-security --sysroot=3D/mnt=
/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot -I=
src/libgtkhex-4.so.1.4.0.p -Isrc -I../ghex-45.0/src -I. -I../ghex-45.0 -I/m=
nt/b/yoe/master/build/tmp /work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot=
/usr/include/glib-2.0 -I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux=
/ghex/45.0/recipe-sysroot/usr/lib/glib-2.0/include -I/mnt/b/yoe/master/buil=
d/tmp/work/core2-64-yoe -linux/ghex/45.0/recipe-sysroot/usr/include/libmoun=
t -I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sy=
sroot/usr/include/blkid -I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-lin=
ux/ghex/45.0/recipe-s ysroot/usr/include/gtk-4.0 -I/mnt/b/yoe/master/build/=
tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot/usr/include/pango-1.0 =
-I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysr=
oot/usr/include/har fbuzz -I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-l=
inux/ghex/45.0/recipe-sysroot/usr/include/fribidi -I/mnt/b/yoe/master/build=
/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot/usr/include/gdk-pixbu=
f-2.0 -I/mnt/b/yo e/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/reci=
pe-sysroot/usr/include/cairo -I/mnt/b/yoe/master/build/tmp/work/core2-64-yo=
e-linux/ghex/45.0/recipe-sysroot/usr/include/pixman-1 -I/mnt/b/yoe/master/b=
uild/tmp/work/c ore2-64-yoe-linux/ghex/45.0/recipe-sysroot/usr/include/free=
type2 -I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recip=
e-sysroot/usr/include/libdrm -I/mnt/b/yoe/master/build/tmp/work/core2-64-yo=
e-linux/ghex/ 45.0/recipe-sysroot/usr/include/libpng16 -I/mnt/b/yoe/master/=
build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot/usr/include/grap=
hene-1.0 -I/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/re=
cipe-sysroo t/usr/lib/graphene-1.0/include -fcolor-diagnostics -D_FILE_OFFS=
ET_BITS=3D64 -Wall -Winvalid-pch -Wno-unused-variable -Wno-unused-parameter=
 -Werror=3Dimplicit -Wformat=3D2 -O2 -pipe -g -feliminate-unused-debug-type=
s -fmacro-prefi x-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux=
/ghex/45.0/ghex-45.0=3D/usr/src/debug/ghex/45.0-r0 -fdebug-prefix-map=3D/mn=
t/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/ghex-45.0=3D/usr=
/src/debug/ghex/45.0- r0 -fmacro-prefix-map=3D/mnt/b/yoe/master/build/tmp/w=
ork/core2-64-yoe-linux/ghex/45.0/build=3D/usr/src/debug/ghex/45.0-r0 -fdebu=
g-prefix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.=
0/build=3D/usr/src/debug/gh ex/45.0-r0 -fdebug-prefix-map=3D/mnt/b/yoe/mast=
er/build/tmp/work/core2-64-yoe-linux/ghex/45.0/recipe-sysroot=3D -fmacro-pr=
efix-map=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/ghex/45.0/re=
cipe-sysroot=3D -fdebug-prefix-ma p=3D/mnt/b/yoe/master/build/tmp/work/core=
2-64-yoe-linux/ghex/45.0/recipe-sysroot-native=3D -fPIC -mfpmath=3Dsse -mss=
e -msse2 -pthread '-DG_LOG_DOMAIN=3D"gtkhex-4"' -MD -MQ src/libgtkhex-4.so.=
1.4.0.p/gtkhex.c.o -MF src/libgtkhex-4. so.1.4.0.p/gtkhex.c.o.d -o src/libg=
tkhex-4.so.1.4.0.p/gtkhex.c.o -c ../ghex-45.0/src/gtkhex.c | ../ghex-45.0/s=
rc/gtkhex.c:1944:4: error: expected expression | 1944 | gint64 line_beg =3D=
 self->cursor_pos; | | ^ | ../ghex-45.0/src/gtkhex.c:1946:11: error: use of=
 undeclared identifier 'line_beg' | 1946 | while (line_beg % self->cpl !=3D=
 0) | | ^ | ../ghex-45.0/src/gtkhex.c:1947:7: error: use of undeclared iden=
tifier 'line_beg' | 1947 | --line_beg; | | ^ | ../ghex-45.0/src/gtkhex.c:19=
49:33: error: use of undeclared identifier 'line_beg' | 1949 | hex_widget_s=
et_cursor (self, line_beg); | | ^ | ../ghex-45.0/src/gtkhex.c:1954:4: error=
: expected expression | 1954 | gint64 line_end =3D self->cursor_pos; | | ^ =
| ../ghex-45.0/src/gtkhex.c:1956:11: error: use of undeclared identifier 'l=
ine_end' | 1956 | while (line_end % self->cpl !=3D self->cpl - 1) | | ^ | .=
./ghex-45.0/src/gtkhex.c:1957:7: error: use of undeclared identifier 'line_=
end' | 1957 | ++line_end; | | ^ | ../ghex-45.0/src/gtkhex.c:1959:38: error:=
 use of undeclared identifier 'line_end' | 1959 | hex_widget_set_cursor (se=
lf, MIN (line_end, payload_size)); | | ^ | ../ghex-45.0/src/gtkhex.c:1959:3=
8: error: use of undeclared identifier 'line_end' | 9 errors generated. On =
Sat, Nov 11, 2023 at 4:00=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrote:
>
> - enable gi,vapi,api-documentation - switch to gtk4 Signed-off-by: Markus=
 Volk <f_l_k@t-online.de> --- meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb =
| 17 ----------------- meta-gnome/recipes-gnome/ghex/ghex_45.0.bb | 20 ++++=
++++++++++++++++ 2 files changed, 20 insertions(+), 17 deletions(-) delete =
mode 100644 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb create mode 100644=
 meta-gnome/recipes-gnome/ghex/ghex_45.0.bb diff --git a/meta-gnome/recipes=
-gnome/ghex/ghex_3.18.4.bb b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb d=
eleted file mode 100644 index 08e50409e..000000000 --- a/meta-gnome/recipes=
-gnome/ghex/ghex_3.18.4.bb +++ /dev/null @@ -1,17 +0,0 @@ -SUMMARY =3D "GHe=
x - a hex editor for GNOME" -LICENSE =3D "GPL-2.0-only" -LIC_FILES_CHKSUM =
=3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263" - -GNOMEBASEBUI=
LDCLASS =3D "meson" - -DEPENDS =3D " \ - glib-2.0-native \ - gtk+3 \ -" - -=
inherit gnomebase gsettings gtk-icon-cache gnome-help gettext upstream-vers=
ion-is-even - -SRC_URI[archive.md5sum] =3D "7e6ed808766bc18285bdc6999bdf0f1=
5" -SRC_URI[archive.sha256sum] =3D "c2d9c191ff5bce836618779865bee4059db81a3=
a0dff38bda3cc7a9e729637c0" - -FILES:${PN} +=3D "${datadir}/metainfo" diff -=
-git a/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb b/meta-gnome/recipes-gnom=
e/ghex/ghex_45.0.bb new file mode 100644 index 000000000..6d3e9b978 --- /de=
v/null +++ b/meta-gnome/recipes-gnome/ghex/ghex_45.0.bb @@ -0,0 +1,20 @@ +S=
UMMARY =3D "GHex - a hex editor for GNOME" +LICENSE =3D "GPL-2.0-only" +LIC=
_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263" +=
 + +DEPENDS =3D " \ + desktop-file-utils-native \ + glib-2.0-native \ + gtk=
4 \ + libadwaita \ +" + +GIR_MESON_ENABLE_FLAG =3D 'enabled' +GIR_MESON_DIS=
ABLE_FLAG =3D 'disabled' + +inherit gnomebase gsettings gtk-icon-cache gnom=
e-help gettext gobject-introspection vala gi-docgen + +SRC_URI[archive.sha2=
56sum] =3D "05cecc4561ca40b257c5db31da9f68d696133efc0ae427ed82fb985a986e840=
e" + +FILES:${PN} +=3D "${libdir} ${datadir}/metainfo" -- 2.42.0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#106618): https://lists.openemb=
edded.org/g/openembedded-devel/message/106618 Mute This Topic: https://list=
s.openembedded.org/mt/102524551/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

