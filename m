Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AAAC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 09:02:02 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web10.8329.1713430912170406034
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Apr 2024 02:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=HKBvWOXz;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1713430911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=pDTsZNwcYdnCEMN3uXBkf34GNxx1siWmfs8yity2ZuA=;
	b=HKBvWOXzFUCGQhL7sTLspHCW+UIAtZHqLDS76rNEMh39NBGvCSijOPGJi0oO8GszePi1sy
	gB3yJ66d7k0McjZLVcFSD1FQ7bOgCmPZhpPhs9B83DyZ4rwX0c5ILu+CDsoFRfBNNEORao
	KdIcvoPZozEsLOJr4lie2cJj90Ko5sQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-13-pYUkYY8KNG-66CTRxOSejw-1; Thu, 18 Apr 2024 02:01:41 -0700
X-MC-Unique: pYUkYY8KNG-66CTRxOSejw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-418dbaded6bso3261755e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 02:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713430899; x=1714035699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSlgrUD6OYhy60i6WuZfm8ly3smfFX8jJgTYDbVjsjU=;
        b=ZNGVNuDi/fUyFfWsM5Gak+xbvjCTUsaVIY9F1idQX1v4GvApR6E/MDE6//mSadqaL/
         SB6qZe3sgXNKaoKxbjKvMUkv4wO36CiHot1u4osfd/29k0LaQzpo1+MsbWG8CJX/hwAv
         PzzjvNrZWEKIc0VUQ6rWXpm+W7P+bW+ZKE5nGDragaFSU0wLk0gtOTVtsyyn+dOzPRDU
         1PQSi2MUS/f/eWWIS3/tPiC+RqQLDPZ33SARYjAMVbqhi4q2XPfHtBtvI3WTJihxeY4o
         wONu6PqhTRA0T6oJvJYR7+A3PNG7KRlVL4Hl8P/7R6MzRBu0LBSBaH/SIgiUJzpN+2FD
         J//Q==
X-Gm-Message-State: AOJu0Yxy5FySmOm4OfMO6JQBfM0isiXygEqo1oOxKYFQ09CHqBbjVsjl
	r0Nfrs4iYE1dnruRuR5rxP10R7I771zir51I1r1P9lXk32UrMBxXsG4SnzuERxUeEHeRsC7j79k
	m+j/7HgfnbwPJfCegxaoRkxBOfn9kgDMNmpOCaSnEP5rPSpM/bwnOQFgoFABgWv9YC+/0uaRaH8
	5J2JAl5ExMalbAU+OYvHMr4IzpvgAwXF8Q1G/YwbcFadWCDGAw+IFmpXveZzgqwyEjgXYB
X-Received: by 2002:a5d:5907:0:b0:346:4307:dd2b with SMTP id v7-20020a5d5907000000b003464307dd2bmr1250528wrd.46.1713430898859;
        Thu, 18 Apr 2024 02:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8dhc68eEMI6c8ETHObVgg8pcxxBdfMaoOGaTS6h7pFW8rMMnN24N3/J6M8bboTcRgv4jtkA==
X-Received: by 2002:a5d:5907:0:b0:346:4307:dd2b with SMTP id v7-20020a5d5907000000b003464307dd2bmr1250496wrd.46.1713430898138;
        Thu, 18 Apr 2024 02:01:38 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id x5-20020a5d6b45000000b003472489d26fsm1309477wrw.19.2024.04.18.02.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 02:01:37 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-twisted: upgrade 22.10.0 -> 24.3.0
Date: Thu, 18 Apr 2024 09:01:22 +0000
Message-Id: <20240418090122.3806-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404180201480381"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 09:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110049

--MCBoundary=_12404180201480381
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelogs between 22.10.0 and 24.3.0 can be found here:

https://github.com/twisted/twisted/releases/tag/twisted-24.3.0
https://github.com/twisted/twisted/releases/tag/twisted-23.10.0
https://github.com/twisted/twisted/releases/tag/twisted-23.8.0

Summary of changes relevant for the Yocto build:
- Brings official support for Python 3.11 and 3.12, only Python 3.8 and abo=
ve supported.
- python3-twisted-conch: python3-pyasn1 is no longer a runtime dependency (=
23.8.0)
- PYPI_PACKAGE name was changed from 'Twisted' to 'twisted' to make fetchin=
g work

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 ...twisted_22.10.0.bb =3D> python3-twisted_24.3.0.bb} | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_22.10.0.bb =3D=
> python3-twisted_24.3.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 20b9ce254..be2246623 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -4,11 +4,11 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix socke=
ts, a large number of p
 HOMEPAGE =3D "http://www.twistedmatrix.com"
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
+PYPI_PACKAGE =3D "twisted"
=20
 inherit pypi python_setuptools_build_meta
=20
@@ -65,7 +65,7 @@ RDEPENDS:${PN}-core =3D "python3-appdirs \
                        python3-zopeinterface \
 "
 RDEPENDS:${PN}-test =3D "${PN}"
-RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt python=
3-cryptography python3-pyasn1 python3-pickle"
+RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt python=
3-cryptography python3-pickle"
 RDEPENDS:${PN}-mail =3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-names =3D "${PN}-core"
 RDEPENDS:${PN}-news =3D "${PN}-core ${PN}-protocols"
@@ -75,8 +75,6 @@ RDEPENDS:${PN}-words +=3D "${PN}-core"
 RDEPENDS:${PN}-flow +=3D "${PN}-core"
 RDEPENDS:${PN}-pair +=3D "${PN}-core"
=20
-FILES:${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dist-inf=
o/*"
-
 FILES:${PN}-test =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/test \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \
@@ -85,8 +83,6 @@ FILES:${PN}-test =3D " \
=20
 FILES:${PN}-protocols =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \
 "
@@ -124,7 +120,6 @@ FILES:${PN}-core =3D " \
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

--MCBoundary=_12404180201480381
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Changelogs between 22.10.0 and 24.3.0 can be found =
here:<BR>
<BR>
<a href=3D"https://github.com/twisted/twisted/releases/tag/twisted-24.3.0" =
target=3D"_blank">https://github.com/twisted/twisted/releases/tag/twisted-2=
4.3.0</a><BR>
<a href=3D"https://github.com/twisted/twisted/releases/tag/twisted-23.10.0"=
 target=3D"_blank">https://github.com/twisted/twisted/releases/tag/twisted-=
23.10.0</a><BR>
<a href=3D"https://github.com/twisted/twisted/releases/tag/twisted-23.8.0" =
target=3D"_blank">https://github.com/twisted/twisted/releases/tag/twisted-2=
3.8.0</a><BR>
<BR>
Summary of changes relevant for the Yocto build:<BR>
- Brings official support for Python 3.11 and 3.12, only Python 3.8 and abo=
ve supported.<BR>
- python3-twisted-conch: python3-pyasn1 is no longer a runtime dependency (=
23.8.0)<BR>
- PYPI_PACKAGE name was changed from 'Twisted' to 'twisted' to make fetchin=
g work<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 ...twisted_22.10.0.bb =3D&gt; python3-twisted_24.3.0.bb} | 13 ++++--------=
-<BR>
 1 file changed, 4 insertions(+), 9 deletions(-)<BR>
 rename meta-python/recipes-devtools/python/{python3-twisted_22.10.0.bb =3D=
&gt; python3-twisted_24.3.0.bb} (93%)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb=
 b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
similarity index 93%<BR>
rename from meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb<=
BR>
rename to meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
index 20b9ce254..be2246623 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
@@ -4,11 +4,11 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix socke=
ts, a large number of p<BR>
 HOMEPAGE =3D &quot;http://www.twistedmatrix.com&quot;<BR>
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
+PYPI_PACKAGE =3D &quot;twisted&quot;<BR>
 <BR>
 inherit pypi python_setuptools_build_meta<BR>
 <BR>
@@ -65,7 +65,7 @@ RDEPENDS:${PN}-core =3D &quot;python3-appdirs \<BR>
                        python3-zopeinterface \<BR>
 &quot;<BR>
 RDEPENDS:${PN}-test =3D &quot;${PN}&quot;<BR>
-RDEPENDS:${PN}-conch =3D &quot;${PN}-core ${PN}-protocols python3-bcrypt p=
ython3-cryptography python3-pyasn1 python3-pickle&quot;<BR>
+RDEPENDS:${PN}-conch =3D &quot;${PN}-core ${PN}-protocols python3-bcrypt p=
ython3-cryptography python3-pickle&quot;<BR>
 RDEPENDS:${PN}-mail =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-names =3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-news =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
@@ -75,8 +75,6 @@ RDEPENDS:${PN}-words +=3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-flow +=3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-pair +=3D &quot;${PN}-core&quot;<BR>
 <BR>
-FILES:${PN} =3D &quot;${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dis=
t-info/*&quot;<BR>
-<BR>
 FILES:${PN}-test =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/test \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \<BR>
@@ -85,8 +83,6 @@ FILES:${PN}-test =3D &quot; \<BR>
 <BR>
 FILES:${PN}-protocols =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \<BR>
 &quot;<BR>
@@ -124,7 +120,6 @@ FILES:${PN}-core =3D &quot; \<BR>
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

--MCBoundary=_12404180201480381--


