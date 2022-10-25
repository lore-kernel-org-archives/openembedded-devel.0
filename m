Return-Path: <boas.meier@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8CCC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 12:12:29 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.6257.1666699947948295471
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 05:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gc+HpCJe;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: boas.meier@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id k2so11966543ejr.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iRFAI34cTYgZTgijvanf6ly6dgifYC0zCLu6ggKrn3c=;
        b=gc+HpCJehf0WLgy1RnS04i0SRVmj5s1Os2h50z2t7bT1h7/IVUC8th82bf0IJ/MXaq
         qF0v08As589wTaBAkzy9JfqGOXjR0xeUJQ7Sz57eHi5nRF+JcBIgI+OfKLgSdRQv68te
         cPghtbRRyjg+IMHubDQ9ABTF01MH3r1SQtYI0by11psPSE+k5USVqZVxwhIhia4Yh2WB
         kTJob75lwHBOayuHcVPmAjC+byvB/8YdsfNfOs0o76R7EoPdvI1Av2MW6T6y7Jzfb52w
         o0MpzGu9Wo0hIMcmWq/LcNDNgbtQc9kHnb8EXkudRI4qAFVUCeX4rTrHK9Dwj2Nk7MI+
         vKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRFAI34cTYgZTgijvanf6ly6dgifYC0zCLu6ggKrn3c=;
        b=7mJMQDUMbIu+k+ExSRcl38kRZK4zSKaB5zAzRmDCxKJWBKrpa1I+dh1xHclNtSF9Ff
         Wz6wFVEl9XB0axyn22xEM9NeCZZbVzfTS+q2eS8vBCN4QiPMJtkRU/2yaBkOevLLaYfk
         hUn1Vby+IduHIvopkr4ibAozgctA8Lijr5cZJX1nOuC7M504HjDqqLrrw63rY/xz0Va/
         3X/2d/O+BALuRlIoTNv5c/30qIDu0p1gzRLTic78JIEG79J/+v6d78hIGc2aZP/IfxDe
         TYDck6w52FTm4jgfo9TWv7mUwmhKZ1Ha7vRuGUZUMJiQ2qMRWcq0TrUFvgckH4Hi1SOd
         jS7w==
X-Gm-Message-State: ACrzQf321mKZ6bx7tlkVEURvrzwn29P/zT6U2/s3XQjp/RVQs6V7U2z0
	9VRtD7uxAgbJAvVrSSoUai4reN6+lk6D2JJeTMPwLFte2Xg=
X-Google-Smtp-Source: AMsMyM5AvYCuDXYf2UUhKyAfMI6TRem4o8j/4b0g7T1zb2ODpTmeW3ohrnqNZxVwiwlrcLCR1uW+Wlq9Eno6m7Povgo=
X-Received: by 2002:a17:906:5dda:b0:78d:e7d2:7499 with SMTP id
 p26-20020a1709065dda00b0078de7d27499mr32635529ejv.588.1666699945923; Tue, 25
 Oct 2022 05:12:25 -0700 (PDT)
MIME-Version: 1.0
From: Meier Boas <boas.meier@gmail.com>
Date: Tue, 25 Oct 2022 14:11:49 +0200
Message-ID: <CAD6RADBEPh-m7N4Xmf_GuLP+Q+zm1FMUBoQF1Wsr+UBsUkrF-w@mail.gmail.com>
Subject: [meta-oe][PATCH v2] jwt-cpp: add recipe
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003956b705ebdad200"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 12:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99306

--0000000000003956b705ebdad200
Content-Type: text/plain; charset="UTF-8"

From d3daf755814f0cff7e57bb521520fe6a52685050 Mon Sep 17 00:00:00 2001
From: Boas Meier <boas.meier@siemens.com>
Date: Tue, 25 Oct 2022 11:28:40 +0200
Subject: [PATCH 1/1] jwt-cpp: add v0.6.0

Signed-off-by: Boas Meier <boas.meier@siemens.com>
---
 .../recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
new file mode 100644
index 000000000..bd3baa863
--- /dev/null
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A header only library for creating and validating json web
tokens in c++"
+HOMEPAGE = "https://thalhammer.github.io/jwt-cpp/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHECKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
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
+EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF"
+
+FILES:${PN} = "/usr/cmake"
-- 
2.30.2

--0000000000003956b705ebdad200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From d3daf755814f0cff7e57bb521520fe6a52685050 Mon Sep 17 0=
0:00:00 2001<br>From: Boas Meier &lt;<a href=3D"mailto:boas.meier@siemens.c=
om">boas.meier@siemens.com</a>&gt;<br>Date: Tue, 25 Oct 2022 11:28:40 +0200=
<br>Subject: [PATCH 1/1] jwt-cpp: add v0.6.0<br><br>Signed-off-by: Boas Mei=
er &lt;<a href=3D"mailto:boas.meier@siemens.com">boas.meier@siemens.com</a>=
&gt;<br>---<br>=C2=A0.../recipes-devtools/jwt-cpp/<a href=3D"http://jwt-cpp=
_0.6.0.bb">jwt-cpp_0.6.0.bb</a> | 20 +++++++++++++++++++<br>=C2=A01 file ch=
anged, 20 insertions(+)<br>=C2=A0create mode 100644 meta-oe/recipes-devtool=
s/jwt-cpp/<a href=3D"http://jwt-cpp_0.6.0.bb">jwt-cpp_0.6.0.bb</a><br><br>d=
iff --git a/meta-oe/recipes-devtools/jwt-cpp/<a href=3D"http://jwt-cpp_0.6.=
0.bb">jwt-cpp_0.6.0.bb</a> b/meta-oe/recipes-devtools/jwt-cpp/<a href=3D"ht=
tp://jwt-cpp_0.6.0.bb">jwt-cpp_0.6.0.bb</a><br>new file mode 100644<br>inde=
x 000000000..bd3baa863<br>--- /dev/null<br>+++ b/meta-oe/recipes-devtools/j=
wt-cpp/<a href=3D"http://jwt-cpp_0.6.0.bb">jwt-cpp_0.6.0.bb</a><br>@@ -0,0 =
+1,20 @@<br>+SUMMARY =3D &quot;A header only library for creating and valid=
ating json web tokens in c++&quot;<br>+HOMEPAGE =3D &quot;<a href=3D"https:=
//thalhammer.github.io/jwt-cpp/">https://thalhammer.github.io/jwt-cpp/</a>&=
quot;<br>+SECTION =3D &quot;libs&quot;<br>+LICENSE =3D &quot;MIT&quot;<br>+=
LIC_FILES_CHECKSUM =3D &quot;file://LICENSE;md5=3D8325a5ce4414c65ffdda392e0=
d96a9ff&quot;<br>+<br>+SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/Thalhammer/jwt-cpp.git;branch=3Dmaster;protocol=3Dhttps">github.com/Thalha=
mmer/jwt-cpp.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>+<br>+SRCREV =3D &quot;4a537e969891dde=
542ad8b1a4a214955a83be29f&quot;<br>+<br>+S =3D &quot;${WORKDIR}/git&quot;<b=
r>+<br>+DEPENDS =3D &quot;openssl&quot;<br>+<br>+inherit cmake<br>+<br>+EXT=
RA_OECMAKE +=3D &quot;-DJWT_BUILD_EXAMPLES=3DOFF&quot;<br>+<br>+FILES:${PN}=
 =3D &quot;/usr/cmake&quot;<br>-- <br>2.30.2<br></div>

--0000000000003956b705ebdad200--

