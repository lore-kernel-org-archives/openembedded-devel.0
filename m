Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D935C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 08:42:29 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.58479.1638175343954054726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 00:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gO6DOKa3;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id v1so68460045edx.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 00:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=OqqDXPnbd059aVxf4TEaW/OAqU8Eqlk7qbn80VZfqrg=;
        b=gO6DOKa3D5dz/MNlDZKAKPLqt2J6m/mrdEFxFh4HclcjW/fTD97AzyQNGtT6Y276VT
         wfxwcPoi/a5BnY/hM+fw7UsIipbemIjfgmiPHW51/wa53NlrE95FhM6+PQAL/hYZO080
         JJ4Z9/WmyBtCUyzuA8QtlJa9dsYXrOcSbb/llFZancQJZ2M2y3tMeLEATVjnU+ihF/rJ
         IF4xfEAwwBGpxJb5q/u8eVKAJFAhTDEH4oog1uhhhQ3vmtjyoV2Jo38tL6Y3ntStCWvw
         VOrjGo/vr9wbtPXeAB+BL/HrvySBuTC3Mhl5IBpDK4osNIInHhLFU8xfrTQLNu2eDlP3
         PRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OqqDXPnbd059aVxf4TEaW/OAqU8Eqlk7qbn80VZfqrg=;
        b=lyhCZ6aWrUwggMklWjwaLLyLEVLCKb7fn7VqeABg2OVXeckAeDsiHyxI5+MMF2VvFE
         AjxfMYSc1O733jRoP/9yJth8w1nEavtx8CEhscbIiTpzaPhRonQWZPv1gt/2GNEs3YqZ
         Vmawc1PXAHEWhOqr3Htp4BOkHKloZayaPgvScLCUh4P+NGTj+xuuY17h3YSucOZ+9QY0
         0v22z+ubIji10PESId8uyzQagORX9U8/CHLjgJGHZKU6S9Ji3dZKf+5BU5XZWcj2NQ/y
         5CPrjH2IAJIiqdkAVu0PhKMiySWPowQIYrk03LSKGVNqsZe3bLO/4B56oj0ez5ytzIob
         gxKw==
X-Gm-Message-State: AOAM533dIimG/TDknyp9XnAmti9YgyKAu7sM0xi6oEUFWZWmKhT/7Pj1
	Kk7tX7oQmt++6FPvUCBOVWVwaFf1GVV3fX/feyI6u1KulP4=
X-Google-Smtp-Source: 
 ABdhPJx85rU7E8FfdYxdBlWQuhISfHZBCM8hGNFY3Q3a97cEhLJ+D8vhZcIync92R4oN68cOH1COA42PuarArBAodoU=
X-Received: by 2002:a17:907:9802:: with SMTP id
 ji2mr55082664ejc.352.1638175341814;
 Mon, 29 Nov 2021 00:42:21 -0800 (PST)
MIME-Version: 1.0
From: Windel Bouwman <windel.bouwman@gmail.com>
Date: Mon, 29 Nov 2021 09:42:12 +0100
Message-ID: 
 <CAHMaQtB6aySwe6DjrGmAZXj9c8i1v6MSCX-Hfe7k3pvxW3RJtg@mail.gmail.com>
Subject: [meta-python][PATCH] python3-coloredlogs: Added nativesdk
 python3-docutils: Added nativesdk and native python3-humanfriendly: Added
 nativesdk
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000054493205d1e96b49"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 08:42:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94133

--00000000000054493205d1e96b49
Content-Type: text/plain; charset="UTF-8"

These changes are needed in order to build colcon as an SDK package.

Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
---
 meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-docutils_0.17.bb    | 2 ++
 .../recipes-devtools/python/python3-humanfriendly_9.1.bb        | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
index daeda6b2e..da4f7a574 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
@@ -20,4 +20,4 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-humanfriendly \
 "

-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
index 8605e93b5..f8cd205fa 100644
--- a/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
@@ -7,3 +7,5 @@ LIC_FILES_CHKSUM =
"file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
 SRC_URI[sha256sum] =
"e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c"

 inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/
python3-humanfriendly_9.1.bb b/meta-python/recipes-devtools/python/
python3-humanfriendly_9.1.bb
index fb6a7e3b6..a5f2031b2 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
@@ -21,4 +21,4 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-stringold \
 "

-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
--
2.25.1

--00000000000054493205d1e96b49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These changes are needed in order to build colcon as an SD=
K package.<br><br>Signed-off-by: Windel Bouwman &lt;<a href=3D"mailto:winde=
l.bouwman@gmail.com">windel.bouwman@gmail.com</a>&gt;<br>---<br>=C2=A0meta-=
python/recipes-devtools/python/<a href=3D"http://python3-coloredlogs_15.0.b=
b">python3-coloredlogs_15.0.bb</a> | 2 +-<br>=C2=A0meta-python/recipes-devt=
ools/python/<a href=3D"http://python3-docutils_0.17.bb">python3-docutils_0.=
17.bb</a> =C2=A0 =C2=A0| 2 ++<br>=C2=A0.../recipes-devtools/python/<a href=
=3D"http://python3-humanfriendly_9.1.bb">python3-humanfriendly_9.1.bb</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>=C2=A03 files changed, 4 insertions(+)=
, 2 deletions(-)<br><br>diff --git a/meta-python/recipes-devtools/python/<a=
 href=3D"http://python3-coloredlogs_15.0.bb">python3-coloredlogs_15.0.bb</a=
> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-coloredlo=
gs_15.0.bb">python3-coloredlogs_15.0.bb</a><br>index daeda6b2e..da4f7a574 1=
00644<br>--- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-coloredlogs_15.0.bb">python3-coloredlogs_15.0.bb</a><br>+++ b/meta-python=
/recipes-devtools/python/<a href=3D"http://python3-coloredlogs_15.0.bb">pyt=
hon3-coloredlogs_15.0.bb</a><br>@@ -20,4 +20,4 @@ RDEPENDS_${PN} +=3D &quot=
;\<br>=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-humanfriendly \<br>=C2=A0&quot;<br><=
br>-BBCLASSEXTEND =3D &quot;native&quot;<br>+BBCLASSEXTEND =3D &quot;native=
 nativesdk&quot;<br>diff --git a/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-docutils_0.17.bb">python3-docutils_0.17.bb</a> b/meta-p=
ython/recipes-devtools/python/<a href=3D"http://python3-docutils_0.17.bb">p=
ython3-docutils_0.17.bb</a><br>index 8605e93b5..f8cd205fa 100644<br>--- a/m=
eta-python/recipes-devtools/python/<a href=3D"http://python3-docutils_0.17.=
bb">python3-docutils_0.17.bb</a><br>+++ b/meta-python/recipes-devtools/pyth=
on/<a href=3D"http://python3-docutils_0.17.bb">python3-docutils_0.17.bb</a>=
<br>@@ -7,3 +7,5 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D836=
a1950177996968a49ff477a4a61c4&quot;<br>=C2=A0SRC_URI[sha256sum] =3D &quot;e=
2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c&quot;<br><b=
r>=C2=A0inherit pypi setuptools3<br>+<br>+BBCLASSEXTEND =3D &quot;native na=
tivesdk&quot;<br>diff --git a/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-humanfriendly_9.1.bb">python3-humanfriendly_9.1.bb</a> b=
/meta-python/recipes-devtools/python/<a href=3D"http://python3-humanfriendl=
y_9.1.bb">python3-humanfriendly_9.1.bb</a><br>index fb6a7e3b6..a5f2031b2 10=
0644<br>--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-humanfriendly_9.1.bb">python3-humanfriendly_9.1.bb</a><br>+++ b/meta-pytho=
n/recipes-devtools/python/<a href=3D"http://python3-humanfriendly_9.1.bb">p=
ython3-humanfriendly_9.1.bb</a><br>@@ -21,4 +21,4 @@ RDEPENDS_${PN}_class-t=
arget +=3D &quot; \<br>=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-stringold \<br>=C2=
=A0&quot;<br><br>-BBCLASSEXTEND =3D &quot;native&quot;<br>+BBCLASSEXTEND =
=3D &quot;native nativesdk&quot;<br>--<br>2.25.1<br></div>

--00000000000054493205d1e96b49--

