Return-Path: <boas.meier@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E85C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 06:27:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.4495.1666765652996220642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 23:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CBcK1yOc;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: boas.meier@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id bj12so18541330ejb.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 23:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d4QgxEy8JPYwxFukkgApwsyNmD4XtTLAG1LNzEIMNrk=;
        b=CBcK1yOcAmIlpQ0uGdSu9Bu6ZPvtN8Ny/+fAnuOT+8qBD2Y5qS/fUT6NeHRi5o/UXP
         B3vzvGMtPSuyGFl7s1IsiH0akxSSH03RZ49W3WWKjbhWB9FPBPk/ihT+usroZHslhctj
         FXtp6Ax0tFkPuAk+VbuGdVlIZ02a5/3T0xk0OiK8QsqciWbc2h4ph4A8MAfQaIbbiOpw
         YKSWwCN1lQvjFfO5eDdFjOB9E3PKAmCapvwOIsl/Bs0VgM30lwdMeVof5l+LZU3GBY4I
         2khqmWJlywobpRNK7N89wHyvbVoTiyNocHIxMtjTHhZWe6H2utN3jX4GnmkjmBoCcPKE
         xWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4QgxEy8JPYwxFukkgApwsyNmD4XtTLAG1LNzEIMNrk=;
        b=P5N//8ewstHbe2cJ7kKiHcnDFnf3BSnslrxfnQhEu+Xt9i+8WSO6qGMw7/H5H3/AO9
         fc//Q9wN9Fehpi1Htphp9Cs3Zu8mV/xkMB6ECCywl9fH+iqZ1w59HUgfgCFGzO6enwy+
         iWq0HBQdQjTUURIZlpovuo0Xqh+oLlFlG9m0RthI8D5FxNZCEOtRKVN0KwjekWhbLrIF
         N0vn4OWGA+/fr2G00Avdq4DLft8YjSIbUH2F9EO7C6San9FUWb3ItFHhd9e4HZgzt1IQ
         5oMtp1nPsjaoW/5t1np/8fPfSSShNFEnTo1DsH46xevtVR3ZZpV/jNFxrstKZDaFd+ty
         Z/lQ==
X-Gm-Message-State: ACrzQf3c0XKehKAx7D7wZte1atXXW8AMTRbta6wxBxqmOR1mG6Fj8Gfr
	GDqMeSNdQXlalo1S7YNtg5hBcPsLBiucZ5y1RCsBPUZ2gkk=
X-Google-Smtp-Source: AMsMyM7034aVBrTFWiDR/S/b2sVnAeCm8v4P1IFGedUq5dkleDbNnOqAJcdfUFKiwD+uEXiCgVl1rUREH/ph6O8//+U=
X-Received: by 2002:a17:907:3e14:b0:78d:b14b:6fa0 with SMTP id
 hp20-20020a1709073e1400b0078db14b6fa0mr35482709ejc.650.1666765640867; Tue, 25
 Oct 2022 23:27:20 -0700 (PDT)
MIME-Version: 1.0
From: Meier Boas <boas.meier@gmail.com>
Date: Wed, 26 Oct 2022 08:26:45 +0200
Message-ID: <CAD6RADDDwCV8mnAzL68r2X28yJHXnk-Rcxh9MzqCZVXg6GOrFQ@mail.gmail.com>
Subject: [meta-oe][PATCH v3] jwt-cpp: add recipe
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f2a36d05ebea1d97"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Oct 2022 06:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99310

--000000000000f2a36d05ebea1d97
Content-Type: text/plain; charset="UTF-8"

From 02b6a81c2a98bcc0a643f20d1e96d14b4269db30 Mon Sep 17 00:00:00 2001
From: Boas Meier <boas.meier@siemens.com>
Date: Tue, 25 Oct 2022 11:28:40 +0200
Subject: [PATCH 1/1] jwt-cpp: add v0.6.0

Signed-off-by: Boas Meier <boas.meier@siemens.com>
---
 .../recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
new file mode 100644
index 000000000..8929115fd
--- /dev/null
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A header only library for creating and validating json web
tokens in c++"
+HOMEPAGE = "https://thalhammer.github.io/jwt-cpp/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
+
+SRC_URI = "git://
github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
+            "
+
+SRCREV = "4a537e969891dde542ad8b1a4a214955a83be29f"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "openssl"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF
-DJWT_CMAKE_FILES_INSTALL_DIR=${libdir}/cmake"
-- 
2.30.2

--000000000000f2a36d05ebea1d97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 02b6a81c2a98bcc0a643f20d1e96d14b4269db30 Mon Sep 17 0=
0:00:00 2001<br>From: Boas Meier &lt;<a href=3D"mailto:boas.meier@siemens.c=
om">boas.meier@siemens.com</a>&gt;<br>Date: Tue, 25 Oct 2022 11:28:40 +0200=
<br>Subject: [PATCH 1/1] jwt-cpp: add v0.6.0<br><br>Signed-off-by: Boas Mei=
er &lt;<a href=3D"mailto:boas.meier@siemens.com">boas.meier@siemens.com</a>=
&gt;<br>---<br>=C2=A0.../recipes-devtools/jwt-cpp/<a href=3D"http://jwt-cpp=
_0.6.0.bb">jwt-cpp_0.6.0.bb</a> =C2=A0| 18 ++++++++++++++++++<br>=C2=A01 fi=
le changed, 18 insertions(+)<br>=C2=A0create mode 100644 meta-oe/recipes-de=
vtools/jwt-cpp/<a href=3D"http://jwt-cpp_0.6.0.bb">jwt-cpp_0.6.0.bb</a><br>=
<br>diff --git a/meta-oe/recipes-devtools/jwt-cpp/<a href=3D"http://jwt-cpp=
_0.6.0.bb">jwt-cpp_0.6.0.bb</a> b/meta-oe/recipes-devtools/jwt-cpp/<a href=
=3D"http://jwt-cpp_0.6.0.bb">jwt-cpp_0.6.0.bb</a><br>new file mode 100644<b=
r>index 000000000..8929115fd<br>--- /dev/null<br>+++ b/meta-oe/recipes-devt=
ools/jwt-cpp/<a href=3D"http://jwt-cpp_0.6.0.bb">jwt-cpp_0.6.0.bb</a><br>@@=
 -0,0 +1,18 @@<br>+SUMMARY =3D &quot;A header only library for creating and=
 validating json web tokens in c++&quot;<br>+HOMEPAGE =3D &quot;<a href=3D"=
https://thalhammer.github.io/jwt-cpp/">https://thalhammer.github.io/jwt-cpp=
/</a>&quot;<br>+SECTION =3D &quot;libs&quot;<br>+LICENSE =3D &quot;MIT&quot=
;<br>+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8325a5ce4414c65ffdda3=
92e0d96a9ff&quot;<br>+<br>+SRC_URI =3D &quot;git://<a href=3D"http://github=
.com/Thalhammer/jwt-cpp.git;branch=3Dmaster;protocol=3Dhttps">github.com/Th=
alhammer/jwt-cpp.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>+<br>+SRCREV =3D &quot;4a537e96989=
1dde542ad8b1a4a214955a83be29f&quot;<br>+<br>+S =3D &quot;${WORKDIR}/git&quo=
t;<br>+<br>+DEPENDS =3D &quot;openssl&quot;<br>+<br>+inherit cmake<br>+<br>=
+EXTRA_OECMAKE +=3D &quot;-DJWT_BUILD_EXAMPLES=3DOFF -DJWT_CMAKE_FILES_INST=
ALL_DIR=3D${libdir}/cmake&quot;<br>-- <br>2.30.2<br></div>

--000000000000f2a36d05ebea1d97--

