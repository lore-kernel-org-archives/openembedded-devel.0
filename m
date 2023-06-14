Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC7EEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:20:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.13337.1686752416579370131
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f2Do2zhy;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f8d0d684f3so6769445e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686752415; x=1689344415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jdvQmQHeRp71gzHNWgn0OuadzU37/vJbcIIzNC3VZUY=;
        b=f2Do2zhyrJDPM/EXS96kg7B2HcFeI9bihwpb0cSz56UIXIL5GSTsIY/ltov/fxu1Jl
         nSyYmGZqlPs0TVFn4TSHtjJjs/CBvCvk8sFqk53Lu0p5/EIDbItbkn/iUEQiFfN1SurE
         0TOovZxFMdQh2FEM6PuazY4Coe6QHo48Gu7WBo2mAOqsLtZSQgrnsNVgWgrjweOdL3mL
         yeT/50ZaJUFW8DVu23n4RAcRJ0twGps1jIfSYVVCuwmHJdnq4qGKO0vUzmGA8o0xDNXF
         wLhBhjK3JGQqYnw96LvPIz9czJKbq8mYZlTmsXIi8gP2RRM7jSUEfvyBgbML91cVX42V
         Kkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686752415; x=1689344415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdvQmQHeRp71gzHNWgn0OuadzU37/vJbcIIzNC3VZUY=;
        b=CUAYSXrrX5F5xwuitljMVRPEJJM8ofb+0YeJY+I3biXI8CBa/54Vka2Mrfwpg1ty6e
         vxpuKL/CiW3Q2u3pIFC02A8syYANqJsMm+ToP7PM2FlfE02OZF+5J/gXuRSJqcDlxlC7
         /hpRmmuM/CQJ7/tfq+ZSZBDWR6JPPcAYC31Bwd++tYlsclhNsf8QlaB4EH6ZxVi/Ckkf
         pkpYKV/tvMgo+34B1H+98mT0ZpPcG4aS8/WQFi3zqydG2oL/8sPE0p4Rg80EThTrobyr
         9hVhqqz9Vm2mQyYbkHLRJsk1JDVTV7nyBSLU7Vu3h3zLZa9XrmRBMpZ7Xtpbkb99tDi6
         LAJw==
X-Gm-Message-State: AC+VfDw/tWKl4f/taDsZ3nu6j1sCq1PEdltLoExm7Tk2+A5PwshXGjR6
	QDkHvym1Mp0bS2M1a6caMbXEMvQJlWjdULhtFJQ=
X-Google-Smtp-Source: ACHHUZ7xEE9cQVfSgOUTZu/bcvrLuBZ4A0liqncLqfIPzF0ivnGE4zZPUYlDfCFVBOn6LlPUeV/pcqLoegW2h0QBU+4=
X-Received: by 2002:a7b:c5d9:0:b0:3f8:2777:188 with SMTP id
 n25-20020a7bc5d9000000b003f827770188mr5256991wmk.11.1686752414378; Wed, 14
 Jun 2023 07:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230614113800.34975-1-hprajapati@mvista.com>
In-Reply-To: <20230614113800.34975-1-hprajapati@mvista.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Jun 2023 16:20:01 +0200
Message-ID: <CA+chaQeF3wfKui6k6mr7pv-vNi5hG8X-J2ZM2XL+chM9CKejrA@mail.gmail.com>
Subject: Re: [meta-qt5][kirkstone][PATCH] qt: CVE-2023-32763 Fix Integer overflow
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007bae0a05fe17a6fc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 14:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103285

--0000000000007bae0a05fe17a6fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this included in 5.15.9 release used in mickledore branch?

There is very little difference between kirkstone and mickledore now as qt5
is pretty much dead. So if it's fixed there I would prefer to merge most if
not all changes from mickledore to kirkstone.

And if it isn't fixed in mickledore/master yet, then it should be first
fixed there and then I can backport it with other changes.

On Wed, Jun 14, 2023 at 1:38=E2=80=AFPM Hitendra Prajapati <hprajapati@mvis=
ta.com>
wrote:

> Upstream-Status: Backport from
> https://download.qt.io/official_releases/qt/5.15/CVE-2023-32763-qtbase-5.=
15.diff
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  recipes-qt/qt5/qtbase/CVE-2023-32763.patch | 74 ++++++++++++++++++++++
>  recipes-qt/qt5/qtbase_git.bb               |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/CVE-2023-32763.patch
>
> diff --git a/recipes-qt/qt5/qtbase/CVE-2023-32763.patch
> b/recipes-qt/qt5/qtbase/CVE-2023-32763.patch
> new file mode 100644
> index 0000000..68a1fca
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/CVE-2023-32763.patch
> @@ -0,0 +1,74 @@
> +From 7cc6296600ef436afaa9ed86d2f8a85869abf62a Mon Sep 17 00:00:00 2001
> +From: Allan Sandfeld Jensen <allan.jensen@qt.io>
> +Date: Fri, 5 May 2023 09:51:32 +0200
> +Subject: [PATCH] Fix specific overflow in qtextlayout
> +
> +Adds qAddOverflow and qMulOverflow definitions to QFixed
> +
> +Fixes: QTBUG-113337
> +Change-Id: I13579306defceaccdc0fbb1ec0e9b77c6f8d1af9
> +Reviewed-by: Eirik Aavitsland <eirik.aavitsland@qt.io>
> +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> +(cherry picked from commit 7b7a01c266b507636eab51a36328c7c72d82d93c)
> +Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
> +
> +Upstream-Status: Backport [
> https://download.qt.io/official_releases/qt/5.15/CVE-2023-32763-qtbase-5.=
15.diff
> ]
> +CVE: CVE-2023-32763
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/gui/painting/qfixed_p.h  | 9 +++++++++
> + src/gui/text/qtextlayout.cpp | 9 ++++++---
> + 2 files changed, 15 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/gui/painting/qfixed_p.h b/src/gui/painting/qfixed_p.h
> +index 846592881c..57d750a4b3 100644
> +--- a/src/gui/painting/qfixed_p.h
> ++++ b/src/gui/painting/qfixed_p.h
> +@@ -54,6 +54,7 @@
> + #include <QtGui/private/qtguiglobal_p.h>
> + #include "QtCore/qdebug.h"
> + #include "QtCore/qpoint.h"
> ++#include <QtCore/private/qnumeric_p.h>
> + #include "QtCore/qsize.h"
> +
> + QT_BEGIN_NAMESPACE
> +@@ -182,6 +183,14 @@ Q_DECL_CONSTEXPR inline bool operator<(int i, const
> QFixed &f) { return i * 64 <
> + Q_DECL_CONSTEXPR inline bool operator>(const QFixed &f, int i) { return
> f.value() > i * 64; }
> + Q_DECL_CONSTEXPR inline bool operator>(int i, const QFixed &f) { return
> i * 64 > f.value(); }
> +
> ++inline bool qAddOverflow(QFixed v1, QFixed v2, QFixed *r)
> ++{
> ++    int val;
> ++    bool result =3D add_overflow(v1.value(), v2.value(), &val);
> ++    r->setValue(val);
> ++    return result;
> ++}
> ++
> + #ifndef QT_NO_DEBUG_STREAM
> + inline QDebug &operator<<(QDebug &dbg, const QFixed &f)
> + { return dbg << f.toReal(); }
> +diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
> +index 26ac37b016..f6c69ff4a2 100644
> +--- a/src/gui/text/qtextlayout.cpp
> ++++ b/src/gui/text/qtextlayout.cpp
> +@@ -2150,11 +2150,14 @@ found:
> +         eng->maxWidth =3D qMax(eng->maxWidth, line.textWidth);
> +     } else {
> +         eng->minWidth =3D qMax(eng->minWidth, lbh.minw);
> +-        eng->maxWidth +=3D line.textWidth;
> ++        if (qAddOverflow(eng->maxWidth, line.textWidth, &eng->maxWidth)=
)
> ++            eng->maxWidth =3D QFIXED_MAX;
> +     }
> +
> +-    if (line.textWidth > 0 && item < eng->layoutData->items.size())
> +-        eng->maxWidth +=3D lbh.spaceData.textWidth;
> ++    if (line.textWidth > 0 && item < eng->layoutData->items.size()) {
> ++        if (qAddOverflow(eng->maxWidth, lbh.spaceData.textWidth,
> &eng->maxWidth))
> ++            eng->maxWidth =3D QFIXED_MAX;
> ++    }
> +
> +     line.textWidth +=3D trailingSpace;
> +     if (lbh.spaceData.length) {
> +--
> +2.25.1
> +
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index a5ce677..e8756cf 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -38,6 +38,7 @@ SRC_URI +=3D "\
>
>  file://0021-rcc-Just-dcument-file-name-without-full-path-to-redu.patch \
>      file://0022-testlib-don-t-track-the-build-or-source-directories.patc=
h
> \
>      file://0023-zlib-Do-not-undefine-_FILE_OFFSET_BITS.patch \
> +    file://CVE-2023-32763.patch \
>  "
>
>  # Disable LTO for now, QT5 patches are being worked upstream, perhaps
> revisit with
> --
> 2.25.1
>
>

--0000000000007bae0a05fe17a6fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this included in 5.15.9 release used in mickledore bran=
ch?<div><br></div><div>There is very little difference between kirkstone an=
d mickledore now as qt5 is pretty much dead. So if it&#39;s fixed there I w=
ould prefer to merge most if not all changes from mickledore to kirkstone.<=
/div><div><br></div><div>And if it isn&#39;t fixed in mickledore/master yet=
, then it should be first fixed there and then I can backport it with other=
 changes.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 14, 2023 at 1:38=E2=80=AFPM Hitendra Prajapati =
&lt;<a href=3D"mailto:hprajapati@mvista.com">hprajapati@mvista.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upstream-=
Status: Backport from <a href=3D"https://download.qt.io/official_releases/q=
t/5.15/CVE-2023-32763-qtbase-5.15.diff" rel=3D"noreferrer" target=3D"_blank=
">https://download.qt.io/official_releases/qt/5.15/CVE-2023-32763-qtbase-5.=
15.diff</a><br>
<br>
Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.c=
om" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
---<br>
=C2=A0recipes-qt/qt5/qtbase/CVE-2023-32763.patch | 74 +++++++++++++++++++++=
+<br>
=C2=A0recipes-qt/qt5/<a href=3D"http://qtbase_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">qtbase_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 75 insertions(+)<br>
=C2=A0create mode 100644 recipes-qt/qt5/qtbase/CVE-2023-32763.patch<br>
<br>
diff --git a/recipes-qt/qt5/qtbase/CVE-2023-32763.patch b/recipes-qt/qt5/qt=
base/CVE-2023-32763.patch<br>
new file mode 100644<br>
index 0000000..68a1fca<br>
--- /dev/null<br>
+++ b/recipes-qt/qt5/qtbase/CVE-2023-32763.patch<br>
@@ -0,0 +1,74 @@<br>
+From 7cc6296600ef436afaa9ed86d2f8a85869abf62a Mon Sep 17 00:00:00 2001<br>
+From: Allan Sandfeld Jensen &lt;<a href=3D"mailto:allan.jensen@qt.io" targ=
et=3D"_blank">allan.jensen@qt.io</a>&gt;<br>
+Date: Fri, 5 May 2023 09:51:32 +0200<br>
+Subject: [PATCH] Fix specific overflow in qtextlayout<br>
+<br>
+Adds qAddOverflow and qMulOverflow definitions to QFixed<br>
+<br>
+Fixes: QTBUG-113337<br>
+Change-Id: I13579306defceaccdc0fbb1ec0e9b77c6f8d1af9<br>
+Reviewed-by: Eirik Aavitsland &lt;<a href=3D"mailto:eirik.aavitsland@qt.io=
" target=3D"_blank">eirik.aavitsland@qt.io</a>&gt;<br>
+Reviewed-by: Thiago Macieira &lt;<a href=3D"mailto:thiago.macieira@intel.c=
om" target=3D"_blank">thiago.macieira@intel.com</a>&gt;<br>
+(cherry picked from commit 7b7a01c266b507636eab51a36328c7c72d82d93c)<br>
+Reviewed-by: Qt Cherry-pick Bot &lt;<a href=3D"mailto:cherrypick_bot@qt-pr=
oject.org" target=3D"_blank">cherrypick_bot@qt-project.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://download.qt.io/official_rele=
ases/qt/5.15/CVE-2023-32763-qtbase-5.15.diff" rel=3D"noreferrer" target=3D"=
_blank">https://download.qt.io/official_releases/qt/5.15/CVE-2023-32763-qtb=
ase-5.15.diff</a>]<br>
+CVE: CVE-2023-32763<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ src/gui/painting/qfixed_p.h=C2=A0 | 9 +++++++++<br>
+ src/gui/text/qtextlayout.cpp | 9 ++++++---<br>
+ 2 files changed, 15 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/gui/painting/qfixed_p.h b/src/gui/painting/qfixed_p.h<br>
+index 846592881c..57d750a4b3 100644<br>
+--- a/src/gui/painting/qfixed_p.h<br>
++++ b/src/gui/painting/qfixed_p.h<br>
+@@ -54,6 +54,7 @@<br>
+ #include &lt;QtGui/private/qtguiglobal_p.h&gt;<br>
+ #include &quot;QtCore/qdebug.h&quot;<br>
+ #include &quot;QtCore/qpoint.h&quot;<br>
++#include &lt;QtCore/private/qnumeric_p.h&gt;<br>
+ #include &quot;QtCore/qsize.h&quot;<br>
+ <br>
+ QT_BEGIN_NAMESPACE<br>
+@@ -182,6 +183,14 @@ Q_DECL_CONSTEXPR inline bool operator&lt;(int i, cons=
t QFixed &amp;f) { return i * 64 &lt;<br>
+ Q_DECL_CONSTEXPR inline bool operator&gt;(const QFixed &amp;f, int i) { r=
eturn f.value() &gt; i * 64; }<br>
+ Q_DECL_CONSTEXPR inline bool operator&gt;(int i, const QFixed &amp;f) { r=
eturn i * 64 &gt; f.value(); }<br>
+ <br>
++inline bool qAddOverflow(QFixed v1, QFixed v2, QFixed *r)<br>
++{<br>
++=C2=A0 =C2=A0 int val;<br>
++=C2=A0 =C2=A0 bool result =3D add_overflow(v1.value(), v2.value(), &amp;v=
al);<br>
++=C2=A0 =C2=A0 r-&gt;setValue(val);<br>
++=C2=A0 =C2=A0 return result;<br>
++}<br>
++<br>
+ #ifndef QT_NO_DEBUG_STREAM<br>
+ inline QDebug &amp;operator&lt;&lt;(QDebug &amp;dbg, const QFixed &amp;f)=
<br>
+ { return dbg &lt;&lt; f.toReal(); }<br>
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp<b=
r>
+index 26ac37b016..f6c69ff4a2 100644<br>
+--- a/src/gui/text/qtextlayout.cpp<br>
++++ b/src/gui/text/qtextlayout.cpp<br>
+@@ -2150,11 +2150,14 @@ found:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eng-&gt;maxWidth =3D qMax(eng-&gt;maxWid=
th, line.textWidth);<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eng-&gt;minWidth =3D qMax(eng-&gt;minWid=
th, lbh.minw);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 eng-&gt;maxWidth +=3D line.textWidth;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qAddOverflow(eng-&gt;maxWidth, line.textW=
idth, &amp;eng-&gt;maxWidth))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eng-&gt;maxWidth =3D QFIXED_MAX=
;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 if (line.textWidth &gt; 0 &amp;&amp; item &lt; eng-&gt;layo=
utData-&gt;items.size())<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 eng-&gt;maxWidth +=3D lbh.spaceData.textWidth=
;<br>
++=C2=A0 =C2=A0 if (line.textWidth &gt; 0 &amp;&amp; item &lt; eng-&gt;layo=
utData-&gt;items.size()) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qAddOverflow(eng-&gt;maxWidth, lbh.spaceD=
ata.textWidth, &amp;eng-&gt;maxWidth))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eng-&gt;maxWidth =3D QFIXED_MAX=
;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0line.textWidth +=3D trailingSpace;<br>
+=C2=A0 =C2=A0 =C2=A0if (lbh.spaceData.length) {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/recipes-qt/qt5/<a href=3D"http://qtbase_git.bb" rel=3D"norefer=
rer" target=3D"_blank">qtbase_git.bb</a> b/recipes-qt/qt5/<a href=3D"http:/=
/qtbase_git.bb" rel=3D"noreferrer" target=3D"_blank">qtbase_git.bb</a><br>
index a5ce677..e8756cf 100644<br>
--- a/recipes-qt/qt5/<a href=3D"http://qtbase_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">qtbase_git.bb</a><br>
+++ b/recipes-qt/qt5/<a href=3D"http://qtbase_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">qtbase_git.bb</a><br>
@@ -38,6 +38,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0021-rcc-Just-dcument-file-name-without-full-pat=
h-to-redu.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0022-testlib-don-t-track-the-build-or-source-dir=
ectories.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0023-zlib-Do-not-undefine-_FILE_OFFSET_BITS.patc=
h \<br>
+=C2=A0 =C2=A0 file://CVE-2023-32763.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# Disable LTO for now, QT5 patches are being worked upstream, perhaps=
 revisit with<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000007bae0a05fe17a6fc--

