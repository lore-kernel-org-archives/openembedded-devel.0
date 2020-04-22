Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.1469.1587579699307489805
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 11:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@izotope.com header.s=google header.b=hA25mpJB;
 spf=permerror, err=parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: izotope.com, ip: 209.85.221.43, mailfrom: mcampbell@izotope.com)
Received: by mail-wr1-f43.google.com with SMTP id x17so2906833wrt.5
        for <Openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izotope.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=mHvNG/4ANZdD7BlSHRm/cQttOModfQUuWM7AbmKgDF4=;
        b=hA25mpJBaA9U7WlJONEDwosYZH0M82CP7fpQNrqdJuKXHe06MaOHRUz1CGGc52fNhC
         ma61Gjrm3DlS5r5azFgVt4eeNa+/4i0ErVb6Fl726AyePIjuwj6Sbnn08v0hB416P35d
         AaWu7pL/fJjSqaDNqriZ3O4rZTRb1vqCZKbwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mHvNG/4ANZdD7BlSHRm/cQttOModfQUuWM7AbmKgDF4=;
        b=AXDmwXRP5ohuXTudCAz1aKAGVzTct1tu1k6ybi4+TmGpOkhfb+O48X/bMFLv9kjR0R
         0rixJeOFn/AyubjgJXuTfCkCAxc0bv6aQQ6kO5ycXH25fo+WWTJ2dykyhc3InuUpbrU9
         PXzQWLf1kMI1ZW5lN5w54LPQJqVxObXH8mqY7ErMpGj1UjuvDR767MKZ71xmC/4ZzAfh
         YxPuaEW2RLt0nvmZtpD6RImzr+VTEMyZzyfKrg7g6OQsdSEGqd2lT9IqyqmOvI7H+QkT
         raO4dTyyGyKzuhGB7Fo9jAbmopPxaDYbKPDDBvVRcSm1X2LA05IS5NMgq7VEnrHItbW3
         hnaQ==
X-Gm-Message-State: AGi0PuaFPxeMnaP+R8RxobS6dFd0oTXWXjqMsBLVnvLt233G1QA8Uo6J
	j6hDdgrt++x0hqmjuPI9gJcp9kcnQGDsFuFeA7g14X4tqI6Tzw==
X-Google-Smtp-Source: APiQypI0YayJovgEaxcL+7ik/h21nyBsJmKpdDQ318urJgl4BEYOWRvaoQAz5kF1nkMJp0lJrcyb7PDNurMurmnQn3A=
X-Received: by 2002:a5d:5147:: with SMTP id u7mr351131wrt.290.1587579697261;
 Wed, 22 Apr 2020 11:21:37 -0700 (PDT)
MIME-Version: 1.0
From: "Matt Campbell" <Mcampbell@izotope.com>
Date: Wed, 22 Apr 2020 14:21:26 -0400
Message-ID: <CAMDowVWHvQB2HwanmKkvtrpDPG4ghzqkjHZckDuqX-LtLUC3oQ@mail.gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-tools: add nativesdk
To: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e8903b05a3e533bf"

--000000000000e8903b05a3e533bf
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Matthew Campbell <mcampbell@izotope.com>
---
 ...bus-c++-tools-native_0.8.1.bb => sdbus-c++-tools_0.8.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools-native_0.8.1.bb =>
sdbus-c++-tools_0.8.1.bb} (89%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
index e18b9903d..9eaec0f2a 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Native interface code generator for
development with sdbus-c++"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM =
"file://${S}/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"

-inherit cmake native
+inherit cmake

 DEPENDS += "expat"

@@ -12,3 +12,5 @@ SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
 SRC_URI = "git://
github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools
"

 S = "${WORKDIR}/tools"
+
+BBCLASSEXTEND = "native nativesdk"
--
2.20.1

--000000000000e8903b05a3e533bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Signed-off-by: Matthew Campbell &lt;<a href=3D"mailto:=
mcampbell@izotope.com">mcampbell@izotope.com</a>&gt;<br>---<br>=C2=A0...bus=
-c++-<a href=3D"http://tools-native_0.8.1.bb">tools-native_0.8.1.bb</a> =3D=
&gt; sdbus-c++-<a href=3D"http://tools_0.8.1.bb">tools_0.8.1.bb</a>} | 4 ++=
+-<br>=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>=C2=A0rename =
meta-oe/recipes-core/sdbus-c++/{sdbus-c++-<a href=3D"http://tools-native_0.=
8.1.bb">tools-native_0.8.1.bb</a> =3D&gt; sdbus-c++-<a href=3D"http://tools=
_0.8.1.bb">tools_0.8.1.bb</a>} (89%)<br><br>diff --git a/meta-oe/recipes-co=
re/sdbus-c++/sdbus-c++-<a href=3D"http://tools-native_0.8.1.bb">tools-nativ=
e_0.8.1.bb</a> b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http:/=
/tools_0.8.1.bb">tools_0.8.1.bb</a><br>similarity index 89%<br>rename from =
meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://tools-native_0.8=
.1.bb">tools-native_0.8.1.bb</a><br>rename to meta-oe/recipes-core/sdbus-c+=
+/sdbus-c++-<a href=3D"http://tools_0.8.1.bb">tools_0.8.1.bb</a><br>index e=
18b9903d..9eaec0f2a 100644<br>--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c+=
+-<a href=3D"http://tools-native_0.8.1.bb">tools-native_0.8.1.bb</a><br>+++=
 b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://tools_0.8.1.b=
b">tools_0.8.1.bb</a><br>@@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;Native inter=
face code generator for development with sdbus-c++&quot;<br>=C2=A0LICENSE =
=3D &quot;LGPLv2.1&quot;<br>=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${S}/CO=
PYING;md5=3D1803fa9c2c3ce8cb06b4861d75310742&quot;<br>=C2=A0<br>-inherit cm=
ake native<br>+inherit cmake<br>=C2=A0<br>=C2=A0DEPENDS +=3D &quot;expat&qu=
ot;<br>=C2=A0<br>@@ -12,3 +12,5 @@ SRCREV =3D &quot;3a4f343fb924650e7639660=
efa5f143961162044&quot;<br>=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://=
github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps;branch=3Dmaster;sub=
path=3Dtools">github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps;branc=
h=3Dmaster;subpath=3Dtools</a>&quot;<br>=C2=A0<br>=C2=A0S =3D &quot;${WORKD=
IR}/tools&quot;<br>+<br>+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>=
--<br><div>2.20.1</div><div><br></div></div>

--000000000000e8903b05a3e533bf--
