Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.10943.1593563337175008252
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qQqtu+lX;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id o18so18154895eje.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NRZtVLxdJN5M3ZSavIhqgnhKh/QQLkYMFYBtuysr5fo=;
        b=qQqtu+lXt3PT8ihcmvPI4/WbyxD0jFejl07mh8ThhtLn5+pjXl06bumr4w0bzsgd12
         oeC8THeBKQtLkE2wvky9HMiv0hGMQT8OxqxcGKP0vfaAgVSYy44AzrKhe3SK33bO3780
         uNubR6W4AzvvEwK4VKmuVFmcbr6IGLj0TPnCweEyADye3PXOp2duOSfm2WfoT97kaCei
         XrZ9OzJPC3loyAdlRcgdeiK6/BzqIvme8NcppxuCdXMEZo0C37+Y5Ce4YljS65SZ+cTc
         RL3/3q0TZWKslDi51yBYrjbVU7bJI2JrJo4EnOrmeuVfoAQh+nbUuRJR5R01/VpHS7EX
         mNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NRZtVLxdJN5M3ZSavIhqgnhKh/QQLkYMFYBtuysr5fo=;
        b=moWBn9J4gwzWGGNUq+JHj+asfMEGJNJ7wD+oL7YbPIllw7RoeJSYu9OG/AvCuv27LY
         5w7kbewEobvy5bvQrO/4XNsQEca1cRsVQV1u+Hjo4TgjVqBw8F3/HpKb22Lgu0ekzadF
         FYwgB3dLmpNGJDVPF3JjGJj+eO/tZ7wlT+bkRB72wM8ToRzmDaqN4LRYl4l8Ctc8A4Rf
         KS0YdRepwymZV73iUDKN+OZUKETqhzywek5NQl52pUocsgGJAnSDMgVxau8PqVKqc1P4
         +1ojq1gysc6EqsTCknOKWJrlOLVlUo+td7yrRxLW59bdHm0nhhDiDi27j48R+qX/06Lx
         A6YA==
X-Gm-Message-State: AOAM5339TalLkdXuSm3RjiZiOWp+bfU4mqf9k5s29qSnunRoK7cA2tb1
	ASpMT/4OykGKHhMhs6Qhm6RKq03ZnUHFgCbO3Vw=
X-Google-Smtp-Source: ABdhPJx9OmuogHikJiKJKYyNSowfuD8fHmJ2vXIHF/+5oeowtYXCY5Qsfa7R7oIFud7Xmr+ln64rLfgBMe/aSWkHFhg=
X-Received: by 2002:a17:906:4341:: with SMTP id z1mr15171751ejm.392.1593563335601;
 Tue, 30 Jun 2020 17:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593561840.git.akuster808@gmail.com> <24303fe200ad0d7f273bb36d93fa1756c6d665cd.1593561840.git.akuster808@gmail.com>
In-Reply-To: <24303fe200ad0d7f273bb36d93fa1756c6d665cd.1593561840.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 30 Jun 2020 17:28:44 -0700
Message-ID: <CA+chaQe_eVez=igr79bc1uBokxZpZsL+pBsA=hE+ikY_NECg8A@mail.gmail.com>
Subject: Re: [oe] [dunfel 11/32] vlc: Fix build with qt5 in PACKAGECONFIG and Qt >= 5.15 / renumber patches
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008bb29605a9566008"

--0000000000008bb29605a9566008
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>  [AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]

I don't know which meta-QT5 had 'dufell' :) but 'dunfell' branch in
https://github.com/meta-qt5/meta-qt5 has 5.15 only in master branch and
dunfell will stay on 5.14.*, but the 0005-Fix-build-with-Qt-5.15.patch
seems to be backwards compatible, I guess it does no harm backporting this
and might be useful for someone (as people are often mixing different
meta-qt5 branches when they needs specific Qt release for whatever reason)

On Tue, Jun 30, 2020 at 5:07 PM akuster <akuster808@gmail.com> wrote:

> From: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit aadbc77f8e132301403c1187e8d0488d526f8817)
> [AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...ch =3D> 0001-make-opencv-configurable.patch} |  0
>  ...isidec.patch =3D> 0002-use-vorbisidec.patch} |  0
>  ...int.patch =3D> 0003-fix-luaL-checkint.patch} |  0
>  ...ackageconfig-to-detect-mmal-support.patch} |  0
>  .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56 +++++++++++++++++++
>  .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |  9 +--
>  6 files changed, 61 insertions(+), 4 deletions(-)
>  rename
> meta-multimedia/recipes-multimedia/vlc/vlc/{0006-make-opencv-configurabl=
e.patch
> =3D> 0001-make-opencv-configurable.patch} (100%)
>  rename
> meta-multimedia/recipes-multimedia/vlc/vlc/{0007-use-vorbisidec.patch =
=3D>
> 0002-use-vorbisidec.patch} (100%)
>  rename
> meta-multimedia/recipes-multimedia/vlc/vlc/{0008-fix-luaL-checkint.patch=
 =3D>
> 0003-fix-luaL-checkint.patch} (100%)
>  rename
> meta-multimedia/recipes-multimedia/vlc/vlc/{0001-Use-packageconfig-to-de=
tect-mmal-support.patch
> =3D> 0004-Use-packageconfig-to-detect-mmal-support.patch} (100%)
>  create mode 100644
> meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.p=
atch
>
> diff --git
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurab=
le.patch
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurab=
le.patch
> similarity index 100%
> rename from
> meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable=
.patch
> rename to
> meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable=
.patch
> diff --git
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
> similarity index 100%
> rename from
> meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec.patch
> rename to
> meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
> diff --git
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patc=
h
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patc=
h
> similarity index 100%
> rename from
> meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
> rename to
> meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
> diff --git
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-d=
etect-mmal-support.patch
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-d=
etect-mmal-support.patch
> similarity index 100%
> rename from
> meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-det=
ect-mmal-support.patch
> rename to
> meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-det=
ect-mmal-support.patch
> diff --git
> a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15=
.patch
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15=
.patch
> new file mode 100644
> index 0000000000..c4465b6af3
> --- /dev/null
> +++
> b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15=
.patch
> @@ -0,0 +1,56 @@
> +From c805c6f64da6d8b03355b4796865b75e2f3b500d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.=
com>
> +Date: Mon, 8 Jun 2020 00:50:08 +0200
> +Subject: [PATCH] Fix build with Qt >=3D 5.15
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + modules/gui/qt/components/playlist/views.cpp | 1 +
> + modules/gui/qt/dialogs/plugins.cpp           | 1 +
> + modules/gui/qt/util/timetooltip.hpp          | 1 +
> + 3 files changed, 3 insertion(+)
> +
> +diff --git a/modules/gui/qt/components/playlist/views.cpp
> b/modules/gui/qt/components/playlist/views.cpp
> +index 24db9d9..71d8514 100644
> +--- a/modules/gui/qt/components/playlist/views.cpp
> ++++ b/modules/gui/qt/components/playlist/views.cpp
> +@@ -35,6 +35,7 @@
> + #include <QMetaType>
> + #include <QHeaderView>
> + #include <QSvgRenderer>
> ++#include <QPainterPath>
> +
> + #include <assert.h>
> +
> +diff --git a/modules/gui/qt/dialogs/plugins.cpp
> b/modules/gui/qt/dialogs/plugins.cpp
> +index d233382..9ae9a63 100644
> +--- a/modules/gui/qt/dialogs/plugins.cpp
> ++++ b/modules/gui/qt/dialogs/plugins.cpp
> +@@ -66,6 +66,7 @@
> + #include <QSplitter>
> + #include <QToolButton>
> + #include <QStackedWidget>
> ++#include <QPainterPath>
> +
> + //match the image source (width/height)
> + #define SCORE_ICON_WIDTH_SCALE 4
> +diff --git a/modules/gui/qt/util/timetooltip.hpp
> b/modules/gui/qt/util/timetooltip.hpp
> +index 6a1329e..9f50b18 100644
> +--- a/modules/gui/qt/util/timetooltip.hpp
> ++++ b/modules/gui/qt/util/timetooltip.hpp
> +@@ -25,6 +25,7 @@
> + #include "qt.hpp"
> +
> + #include <QWidget>
> ++#include <QPainterPath>
> +
> + class TimeTooltip : public QWidget
> + {
> +--
> +2.26.2
> +
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> index f6c7a606d5..24898a5a7f 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> @@ -19,10 +19,11 @@ LDFLAGS_append_riscv64 =3D " -latomic"
>  LICENSE_FLAGS =3D "commercial"
>
>  SRC_URI =3D "
> http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
> -           file://0006-make-opencv-configurable.patch \
> -           file://0007-use-vorbisidec.patch \
> -           file://0008-fix-luaL-checkint.patch \
> -           file://0001-Use-packageconfig-to-detect-mmal-support.patch \
> +           file://0001-make-opencv-configurable.patch \
> +           file://0002-use-vorbisidec.patch \
> +           file://0003-fix-luaL-checkint.patch \
> +           file://0004-Use-packageconfig-to-detect-mmal-support.patch \
> +           file://0005-Fix-build-with-Qt-5.15.patch \
>  "
>  SRC_URI[sha256sum] =3D
> "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
>
> --
> 2.17.1
>
>=20
>

--0000000000008bb29605a9566008
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0

[AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]<div><br></div>=
<div>I don&#39;t know which meta-QT5 had &#39;dufell&#39; :) but &#39;dunfe=
ll&#39; branch in=C2=A0<a href=3D"https://github.com/meta-qt5/meta-qt5">htt=
ps://github.com/meta-qt5/meta-qt5</a>=C2=A0has 5.15 only in master branch=
=C2=A0and dunfell will stay on 5.14.*, but the 0005-Fix-build-with-Qt-5.15=
.patch seems to be backwards compatible, I guess it does no harm backportin=
g this and might be useful for someone (as people are often mixing differen=
t meta-qt5 branches when they needs specific Qt release for whatever reason=
)</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jun 30, 2020 at 5:07 PM akuster &lt;<a href=3D"mailto:akuste=
r808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Andreas M=C3=BCller &lt;<a href=
=3D"mailto:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.=
com</a>&gt;<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
(cherry picked from commit aadbc77f8e132301403c1187e8d0488d526f8817)<br>
[AK: meta-QT5 dufell has 5.15 so this is seems reasonable.]<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ch =3D&gt; 0001-make-opencv-configurable.patch} |=C2=A0 0<br>
=C2=A0...isidec.patch =3D&gt; 0002-use-vorbisidec.patch} |=C2=A0 0<br>
=C2=A0...int.patch =3D&gt; 0003-fix-luaL-checkint.patch} |=C2=A0 0<br>
=C2=A0...ackageconfig-to-detect-mmal-support.patch} |=C2=A0 0<br>
=C2=A0.../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56 +++++++++++++++++=
++<br>
=C2=A0.../recipes-multimedia/vlc/<a href=3D"http://vlc_3.0.9.2.bb" rel=3D"=
noreferrer" target=3D"_blank">vlc_3.0.9.2.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 9 +--<br>
=C2=A06 files changed, 61 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/vlc/vlc/{0006-make-opencv-=
configurable.patch =3D&gt; 0001-make-opencv-configurable.patch} (100%)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/vlc/vlc/{0007-use-vorbisid=
ec.patch =3D&gt; 0002-use-vorbisidec.patch} (100%)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/vlc/vlc/{0008-fix-luaL-che=
ckint.patch =3D&gt; 0003-fix-luaL-checkint.patch} (100%)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/vlc/vlc/{0001-Use-packagec=
onfig-to-detect-mmal-support.patch =3D&gt; 0004-Use-packageconfig-to-detect=
-mmal-support.patch} (100%)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-F=
ix-build-with-Qt-5.15.patch<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-c=
onfigurable.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-op=
encv-configurable.patch<br>
similarity index 100%<br>
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-co=
nfigurable.patch<br>
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-conf=
igurable.patch<br>
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbiside=
c.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.pa=
tch<br>
similarity index 100%<br>
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0007-use-vorbisidec=
.patch<br>
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.p=
atch<br>
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-chec=
kint.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-check=
int.patch<br>
similarity index 100%<br>
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-check=
int.patch<br>
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkin=
t.patch<br>
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageco=
nfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/vlc/=
vlc/0004-Use-packageconfig-to-detect-mmal-support.patch<br>
similarity index 100%<br>
rename from meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packagecon=
fig-to-detect-mmal-support.patch<br>
rename to meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfi=
g-to-detect-mmal-support.patch<br>
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-wit=
h-Qt-5.15.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build=
-with-Qt-5.15.patch<br>
new file mode 100644<br>
index 0000000000..c4465b6af3<br>
--- /dev/null<br>
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.=
15.patch<br>
@@ -0,0 +1,56 @@<br>
+From c805c6f64da6d8b03355b4796865b75e2f3b500d Mon Sep 17 00:00:00 2001<br=
>
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:s=
chnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<b=
r>
+Date: Mon, 8 Jun 2020 00:50:08 +0200<br>
+Subject: [PATCH] Fix build with Qt &gt;=3D 5.15<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gm=
ail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
+---<br>
+ modules/gui/qt/components/playlist/views.cpp | 1 +<br>
+ modules/gui/qt/dialogs/plugins.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 1 +<br>
+ modules/gui/qt/util/timetooltip.hpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
1 +<br>
+ 3 files changed, 3 insertion(+)<br>
+<br>
+diff --git a/modules/gui/qt/components/playlist/views.cpp b/modules/gui/q=
t/components/playlist/views.cpp<br>
+index 24db9d9..71d8514 100644<br>
+--- a/modules/gui/qt/components/playlist/views.cpp<br>
++++ b/modules/gui/qt/components/playlist/views.cpp<br>
+@@ -35,6 +35,7 @@<br>
+ #include &lt;QMetaType&gt;<br>
+ #include &lt;QHeaderView&gt;<br>
+ #include &lt;QSvgRenderer&gt;<br>
++#include &lt;QPainterPath&gt;<br>
+ <br>
+ #include &lt;assert.h&gt;<br>
+ <br>
+diff --git a/modules/gui/qt/dialogs/plugins.cpp b/modules/gui/qt/dialogs/=
plugins.cpp<br>
+index d233382..9ae9a63 100644<br>
+--- a/modules/gui/qt/dialogs/plugins.cpp<br>
++++ b/modules/gui/qt/dialogs/plugins.cpp<br>
+@@ -66,6 +66,7 @@<br>
+ #include &lt;QSplitter&gt;<br>
+ #include &lt;QToolButton&gt;<br>
+ #include &lt;QStackedWidget&gt;<br>
++#include &lt;QPainterPath&gt;<br>
+ <br>
+ //match the image source (width/height)<br>
+ #define SCORE_ICON_WIDTH_SCALE 4<br>
+diff --git a/modules/gui/qt/util/timetooltip.hpp b/modules/gui/qt/util/ti=
metooltip.hpp<br>
+index 6a1329e..9f50b18 100644<br>
+--- a/modules/gui/qt/util/timetooltip.hpp<br>
++++ b/modules/gui/qt/util/timetooltip.hpp<br>
+@@ -25,6 +25,7 @@<br>
+ #include &quot;qt.hpp&quot;<br>
+ <br>
+ #include &lt;QWidget&gt;<br>
++#include &lt;QPainterPath&gt;<br>
+ <br>
+ class TimeTooltip : public QWidget<br>
+ {<br>
+-- <br>
+2.26.2<br>
+<br>
diff --git a/meta-multimedia/recipes-multimedia/vlc/<a href=3D"http://vlc_=
3.0.9.2.bb" rel=3D"noreferrer" target=3D"_blank">vlc_3.0.9.2.bb</a> b/meta-=
multimedia/recipes-multimedia/vlc/<a href=3D"http://vlc_3.0.9.2.bb" rel=3D"=
noreferrer" target=3D"_blank">vlc_3.0.9.2.bb</a><br>
index f6c7a606d5..24898a5a7f 100644<br>
--- a/meta-multimedia/recipes-multimedia/vlc/<a href=3D"http://vlc_3.0.9.2=
.bb" rel=3D"noreferrer" target=3D"_blank">vlc_3.0.9.2.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/vlc/<a href=3D"http://vlc_3.0.9.2=
.bb" rel=3D"noreferrer" target=3D"_blank">vlc_3.0.9.2.bb</a><br>
@@ -19,10 +19,11 @@ LDFLAGS_append_riscv64 =3D &quot; -latomic&quot;<br>
=C2=A0LICENSE_FLAGS =3D &quot;commercial&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://download.videolan.org/pub/videol=
an/$%7BBPN%7D/$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz</a>=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-make-opencv-configur=
able.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-use-vorbisidec.patch=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-fix-luaL-checkint.pa=
tch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-packageconfig-to=
-detect-mmal-support.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-make-opencv-configur=
able.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-use-vorbisidec.patch=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-fix-luaL-checkint.pa=
tch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Use-packageconfig-to=
-detect-mmal-support.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Fix-build-with-Qt-5.=
15.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;a9bdad293d81cd48516abad8d490d8ab4012964=
ae541ff19e00021e071e47601&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--0000000000008bb29605a9566008--
