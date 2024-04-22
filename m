Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3FBC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 20:50:17 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.3302.1713819013206347226
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 13:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=fc1iwhlG;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1713819012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Hlh0ayPDqb/28RmJKpI80eOLU0ev5L5yKkn3Bbx5xkQ=;
	b=fc1iwhlGolYVo+YRiORK/XEygfzePKjhPwTfu/rcGpC26sCLY2b3+uh9vBIMA4gPe+2Vj3
	qzNu0rfuKp/KfIysLdyUCFiJJC2xOX1Sl5eCRB2PcaVB8SUTu2i5Z48ZOLLoU5Dec+UGZR
	YaOxS28+XnI0TrEoOPF+9nTWrcDv7NA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-13-m8DWSdOuNIS2rIynTPSbBQ-1; Mon, 22 Apr 2024 13:50:07 -0700
X-MC-Unique: m8DWSdOuNIS2rIynTPSbBQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-518c3c6e757so3975168e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 13:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713819005; x=1714423805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ng/1sD2/stkZWiFpXpFBYIj+gMRwtCUnk/1Kw7sXsMY=;
        b=eOLC4RZ3VL7aqHPr3tIGARvptC1HufOzLIz06CTFNGBR/z5/YYAPgcVieUUkn3kUw3
         it2j/wkRknkRMZNfrPvEBbnMtMqqIzZRmAF8UUjlZmHCUgeib/9i7FgXZ/DOyCGj8q/p
         G05nxxcQW2VqszUWxKvZTkeW3gfldoOJUPSvU0g4T0oV5s318AtZxjj7in3gvf2EjAmp
         74zwkOSszkoQgx7n6LpnyPA5rWQFzr8Y4OnbpzP5lLFW7mYT789n6XjrM0ixY5C6LuxM
         jAkmiG2J1zdtCY/nvIDnsBVB3pGMgYG0kiwnzezestleAHi62/4Yc9bmdZd+Xwrw65pE
         D8rA==
X-Gm-Message-State: AOJu0YwkO4IZ7RB9sXSK3Ub5ntR4yLdoDKwNxKArRrP0gKS7o/CwYHKd
	LJkBXNXT7exDMVDV59ljbyAr+84pfz/xzsjZzUpSXXl2nVe2qZPL0YfeLp4gg5Ys4kBXKdl5edt
	ylHoc8hZ9qmCrlZPS3ZfD0epD2/egNs/p4BdoYLQ8KBxk+8SeKurWLiTWy2XTgZJktK2fOs500i
	1OJtF3EmqSkBy85uZ0EJKNPv0P8XMZ3lNacXUJ4bT3Je2mL3lQiAEHjko+WALe5L1Ciz/t
X-Received: by 2002:a05:6512:3054:b0:516:e8b1:177d with SMTP id b20-20020a056512305400b00516e8b1177dmr8989663lfb.65.1713819004918;
        Mon, 22 Apr 2024 13:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5tAIGtCMdKcPqijdCrO13o3X4D/qMvfOBIeahY23do5RoHkN7sS5/w24D1IwJ29j+y2IrmA==
X-Received: by 2002:a05:6512:3054:b0:516:e8b1:177d with SMTP id b20-20020a056512305400b00516e8b1177dmr8989646lfb.65.1713819004241;
        Mon, 22 Apr 2024 13:50:04 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id x21-20020a170906299500b00a5875dd74c2sm282446eje.131.2024.04.22.13.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 13:50:03 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCHv2] python3-twisted: upgrade 22.10.0 -> 24.3.0
Date: Mon, 22 Apr 2024 20:49:50 +0000
Message-Id: <20240422204950.1619661-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404221350111931"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 20:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110107

--MCBoundary=_12404221350111931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Summary of changes relevant for the Yocto build:
- Brings official support for Python 3.11 and 3.12, only Python 3.8 and abo=
ve supported.
- python3-twisted-conch: python3-pyasn1 is no longer a runtime dependency (=
23.8.0)
- build backend changed from setuptools.build_meta to hatchling.build

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 ...d_22.10.0.bb =3D> python3-twisted_24.3.0.bb} | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_22.10.0.bb =3D=
> python3-twisted_24.3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 20b9ce254..e5223ccd6 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -1,16 +1,14 @@
 DESCRIPTION =3D "Twisted is an event-driven networking framework written i=
n Python and licensed under the LGPL. \
 Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large numbe=
r of protocols                   \
 (including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
-HOMEPAGE =3D "http://www.twistedmatrix.com"
+HOMEPAGE =3D "https://twisted.org"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f8d67f84b6e178c92d471011b2245f=
c"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1c5d2c2493b848f83864bdedd67bbf=
5"
=20
-SRC_URI[sha256sum] =3D "32acbd40a94f5f46e7b42c109bfae2b302250945561783a8b7=
a059048f2d4d31"
+SRC_URI[sha256sum] =3D "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd0=
0fb03e5b4fd4ae"
=20
-PYPI_PACKAGE =3D "Twisted"
-
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
=20
 do_install:append() {
     # remove some useless files before packaging
@@ -34,6 +32,7 @@ PACKAGES +=3D "\
 "
=20
 DEPENDS +=3D " \
+    python3-hatch-fancy-pypi-readme-native \
     python3-incremental-native \
 "
=20
@@ -58,14 +57,13 @@ RDEPENDS:${PN}-core =3D "python3-appdirs \
                        python3-debugger \
                        python3-hyperlink \
                        python3-incremental \
-                       python3-pyhamcrest \
                        python3-pyserial \
                        python3-typing-extensions \
                        python3-unixadmin \
                        python3-zopeinterface \
 "
-RDEPENDS:${PN}-test =3D "${PN}"
-RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt python=
3-cryptography python3-pyasn1 python3-pickle"
+RDEPENDS:${PN}-test =3D "${PN} python3-pyhamcrest"
+RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt python=
3-cryptography python3-pickle"
 RDEPENDS:${PN}-mail =3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-names =3D "${PN}-core"
 RDEPENDS:${PN}-news =3D "${PN}-core ${PN}-protocols"
@@ -75,8 +73,6 @@ RDEPENDS:${PN}-words +=3D "${PN}-core"
 RDEPENDS:${PN}-flow +=3D "${PN}-core"
 RDEPENDS:${PN}-pair +=3D "${PN}-core"
=20
-FILES:${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dist-inf=
o/*"
-
 FILES:${PN}-test =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/test \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \
@@ -85,8 +81,6 @@ FILES:${PN}-test =3D " \
=20
 FILES:${PN}-protocols =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \
 "
@@ -124,7 +118,6 @@ FILES:${PN}-core =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/*.py* \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/*.py* \
-    ${PYTHON_SITEPACKAGES_DIR}/Twisted*egg-info \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/logger \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/_threads \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/positioning \
--=20
2.34.1

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast, a leader in email security and cyber resili=
ence. Mimecast integrates email defenses with brand protection, security aw=
areness training, web security, compliance and other essential capabilities=
. Mimecast helps protect large and small organizations from malicious activ=
ity, human error and technology failure; and to lead the movement toward bu=
ilding a more resilient world. To find out more, visit our website.

--MCBoundary=_12404221350111931
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Summary of changes relevant for the Yocto build:<BR=
>
- Brings official support for Python 3.11 and 3.12, only Python 3.8 and abo=
ve supported.<BR>
- python3-twisted-conch: python3-pyasn1 is no longer a runtime dependency (=
23.8.0)<BR>
- build backend changed from setuptools.build_meta to hatchling.build<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 ...d_22.10.0.bb =3D&gt; python3-twisted_24.3.0.bb} | 21 +++++++-----------=
-<BR>
 1 file changed, 7 insertions(+), 14 deletions(-)<BR>
 rename meta-python/recipes-devtools/python/{python3-twisted_22.10.0.bb =3D=
&gt; python3-twisted_24.3.0.bb} (91%)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
similarity index 91%<BR>
rename from meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb<=
BR>
rename to meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
index 20b9ce254..e5223ccd6 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
@@ -1,16 +1,14 @@<BR>
 DESCRIPTION =3D &quot;Twisted is an event-driven networking framework writ=
ten in Python and licensed under the LGPL. \<BR>
 Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large numbe=
r of protocols                   \<BR>
 (including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more.&qu=
ot;<BR>
-HOMEPAGE =3D &quot;http://www.twistedmatrix.com&quot;<BR>
+HOMEPAGE =3D &quot;https://twisted.org&quot;<BR>
 <BR>
 LICENSE =3D &quot;MIT&quot;<BR>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0f8d67f84b6e178c92d471011b=
2245fc&quot;<BR>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc1c5d2c2493b848f83864bdedd=
67bbf5&quot;<BR>
 <BR>
-SRC_URI[sha256sum] =3D &quot;32acbd40a94f5f46e7b42c109bfae2b30225094556178=
3a8b7a059048f2d4d31&quot;<BR>
+SRC_URI[sha256sum] =3D &quot;6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca=
9efd00fb03e5b4fd4ae&quot;<BR>
 <BR>
-PYPI_PACKAGE =3D &quot;Twisted&quot;<BR>
-<BR>
-inherit pypi python_setuptools_build_meta<BR>
+inherit pypi python_hatchling<BR>
 <BR>
 do_install:append() {<BR>
     # remove some useless files before packaging<BR>
@@ -34,6 +32,7 @@ PACKAGES +=3D &quot;\<BR>
 &quot;<BR>
 <BR>
 DEPENDS +=3D &quot; \<BR>
+    python3-hatch-fancy-pypi-readme-native \<BR>
     python3-incremental-native \<BR>
 &quot;<BR>
 <BR>
@@ -58,14 +57,13 @@ RDEPENDS:${PN}-core =3D &quot;python3-appdirs \<BR>
                        python3-debugger \<BR>
                        python3-hyperlink \<BR>
                        python3-incremental \<BR>
-                       python3-pyhamcrest \<BR>
                        python3-pyserial \<BR>
                        python3-typing-extensions \<BR>
                        python3-unixadmin \<BR>
                        python3-zopeinterface \<BR>
 &quot;<BR>
-RDEPENDS:${PN}-test =3D &quot;${PN}&quot;<BR>
-RDEPENDS:${PN}-conch =3D &quot;${PN}-core ${PN}-protocols python3-bcrypt p=
ython3-cryptography python3-pyasn1 python3-pickle&quot;<BR>
+RDEPENDS:${PN}-test =3D &quot;${PN} python3-pyhamcrest&quot;<BR>
+RDEPENDS:${PN}-conch =3D &quot;${PN}-core ${PN}-protocols python3-bcrypt p=
ython3-cryptography python3-pickle&quot;<BR>
 RDEPENDS:${PN}-mail =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-names =3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-news =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
@@ -75,8 +73,6 @@ RDEPENDS:${PN}-words +=3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-flow +=3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-pair +=3D &quot;${PN}-core&quot;<BR>
 <BR>
-FILES:${PN} =3D &quot;${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dis=
t-info/*&quot;<BR>
-<BR>
 FILES:${PN}-test =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/test \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \<BR>
@@ -85,8 +81,6 @@ FILES:${PN}-test =3D &quot; \<BR>
 <BR>
 FILES:${PN}-protocols =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \<BR>
 &quot;<BR>
@@ -124,7 +118,6 @@ FILES:${PN}-core =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/*.py* \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/*.py* \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/Twisted*egg-info \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/logger \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/_threads \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/positioning \<BR>
-- <BR>
2.34.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
/p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666;">Warning=
:  Copyright Nox Health.  This communication is confidential and may contai=
n privileged information.  By the use of email over the Internet or other c=
ommunication systems, Nox Health is not waiving either confidentiality of, =
or legal privilege in, the content of the email and of any attachments.  If=
 the recipient of this message is not the intended addressee, please call N=
ox Health immediately by calling (+1) 888.505.0280</p></body></html>

--MCBoundary=_12404221350111931--


