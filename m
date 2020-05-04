Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.4500.1588593787998394094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 05:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=krhbci4e;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: wickbergster@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a2so13647578ejx.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=omKIpdENA0YbpEK3ZnjKIfEyuybgpbcyfbku4q0/T40=;
        b=krhbci4eT/At7wy8et4bfoH/UB2mtviZcExY5f18YwM8fGafWcP0UenLzYnAehCP5D
         FifcB1lSaMpiMYeIwY1K0TrFQ0VKEqWii2FTF9xtedwGw4mPf4ln+v8mNANTINYcXyoR
         NOr6xRM3gE872gOVVo1UOOKaWh5W9QT08Ws2nemY9daX0BTXRTuCD98H3Lrqc+AB5tsO
         7ofEnPudRfhWz2hMShlb3bzmMDsTrGLquQrgZobvHRXhd9EumcgQFf+Mg6tunVjacr33
         T5LL8MgKjZHPJXqTiGHCsrTJU1/jmEaWuoY6stbU8R83NIBBSLAnO9C4EE1rEseMfXbw
         adLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=omKIpdENA0YbpEK3ZnjKIfEyuybgpbcyfbku4q0/T40=;
        b=F1ZExZNNtr35cBWtVk4ph4CuDKdVLDItyWzwXVnqJzb57ftir2dAn8P3a80yATxw7m
         g8zymbZx1lwcGReRPQZfnRfUo3pEzzNjFEfOkSyA8DAnAVgJ9Yq8CDjZPKcy1yp9DzwQ
         KLSi224PfmCjindODaqMbOK9KYCBkJD1h0Aodj/Ur7pRBYObnRwUndfFmtMu1XkZcBQJ
         qwjKnFc5gDoNgZ56pB5yBYUf4ccnBsmWMV+0lakCwaoM+OJFqDNt1t9OnIQYNtTngPEX
         /nfpFaiKpfM9i4OOw6KOy5CMDGiex5ZMsSA8wMy6ijGrDKeIJjUt/XDCWl+/GBzK3yQq
         rp1Q==
X-Gm-Message-State: AGi0Pua1UuE51wgSsBb1LARluYVJv/SVyEB44BnvPRl86+YZrRyVLHHE
	eCTYBvpqjS7RKmWlm0PR73spVrcxTG+9/wmwGF2UrU46
X-Google-Smtp-Source: APiQypJ7plSJdwYnM4olz7R9BTFSTQ9fhPVWz5sAXAl4OjVhQqRnQsGjUMLkqnV6aUkjsiZMehsXz+uYD0NeB7yTTnk=
X-Received: by 2002:a17:906:3d69:: with SMTP id r9mr14787523ejf.20.1588593785895;
 Mon, 04 May 2020 05:03:05 -0700 (PDT)
MIME-Version: 1.0
From: "Alexander Vickberg" <wickbergster@gmail.com>
Date: Mon, 4 May 2020 14:02:55 +0200
Message-ID: <CAAxSGfY93AeTPnL=4sDVqTFLvMpP154+2eUB=esToBTQuM9MTQ@mail.gmail.com>
Subject: [meta-oe][PATCH] iperf3: Add OpenSSL build option to PACKAGECONFIG
To: "openembedded-devel@lists.openembedded.org Group Moderators" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004cfd9f05a4d15036"

--0000000000004cfd9f05a4d15036
Content-Type: text/plain; charset="UTF-8"

Make building with OpenSSL optional but enabled by default as today.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
index 98d2faabf..c7ad91b24 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
@@ -11,8 +11,6 @@ AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National
Laboratory <websupport
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9088fe7ffdccd042f7645f1012d7f70"

-DEPENDS = "openssl"
-
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
@@ -23,8 +21,9 @@ S = "${WORKDIR}/git"

 inherit autotools

+PACKAGECONFIG ?= "openssl"
+
 PACKAGECONFIG[lksctp] =
"ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sctp_h=no,lksctp-tools"
+PACKAGECONFIG[openssl] =
"--with-openssl=${RECIPE_SYSROOT}${prefix},--without-openssl,openssl"

 CFLAGS += "-D_GNU_SOURCE"
-
-EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}${prefix}"
-- 
2.25.1

--0000000000004cfd9f05a4d15036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Make building with OpenSSL optional but enabled by default=
 as today.<br><br>Signed-off-by: Alexander Vickberg &lt;<a href=3D"mailto:w=
ickbergster@gmail.com">wickbergster@gmail.com</a>&gt;<br>---<br>=C2=A0meta-=
oe/recipes-benchmark/iperf3/<a href=3D"http://iperf3_3.7.bb">iperf3_3.7.bb<=
/a> | 7 +++----<br>=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br=
><br>diff --git a/meta-oe/recipes-benchmark/iperf3/<a href=3D"http://iperf3=
_3.7.bb">iperf3_3.7.bb</a> b/meta-oe/recipes-benchmark/iperf3/<a href=3D"ht=
tp://iperf3_3.7.bb">iperf3_3.7.bb</a><br>index 98d2faabf..c7ad91b24 100644<=
br>--- a/meta-oe/recipes-benchmark/iperf3/<a href=3D"http://iperf3_3.7.bb">=
iperf3_3.7.bb</a><br>+++ b/meta-oe/recipes-benchmark/iperf3/<a href=3D"http=
://iperf3_3.7.bb">iperf3_3.7.bb</a><br>@@ -11,8 +11,6 @@ AUTHOR =3D &quot;E=
SNET &lt;<a href=3D"mailto:info@es.net">info@es.net</a>&gt;, Lawrence Berke=
ley National Laboratory &lt;websupport<br>=C2=A0LICENSE =3D &quot;BSD-3-Cla=
use&quot;<br>=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df9088fe7=
ffdccd042f7645f1012d7f70&quot;<br>=C2=A0<br>-DEPENDS =3D &quot;openssl&quot=
;<br>-<br>=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/esnet/=
iperf.git">github.com/esnet/iperf.git</a> \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file://0002-Remove-pg-from-profile_CFLAGS.patch \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>@@ -23,8 +21,9 @@ S =3D &quot;=
${WORKDIR}/git&quot;<br>=C2=A0<br>=C2=A0inherit autotools<br>=C2=A0<br>+PAC=
KAGECONFIG ?=3D &quot;openssl&quot;<br>+<br>=C2=A0PACKAGECONFIG[lksctp] =3D=
 &quot;ac_cv_header_netinet_sctp_h=3Dyes,ac_cv_header_netinet_sctp_h=3Dno,l=
ksctp-tools&quot;<br>+PACKAGECONFIG[openssl] =3D &quot;--with-openssl=3D${R=
ECIPE_SYSROOT}${prefix},--without-openssl,openssl&quot;<br>=C2=A0<br>=C2=A0=
CFLAGS +=3D &quot;-D_GNU_SOURCE&quot;<br>-<br>-EXTRA_OECONF =3D &quot;--wit=
h-openssl=3D${RECIPE_SYSROOT}${prefix}&quot;<br>-- <br>2.25.1<br></div>

--0000000000004cfd9f05a4d15036--
