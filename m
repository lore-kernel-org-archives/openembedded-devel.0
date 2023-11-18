Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD80C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 18:26:55 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by mx.groups.io with SMTP id smtpd.web11.13770.1700332009423421518
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 10:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=Buxt7F1F;
 spf=pass (domain: web.de, ip: 212.227.15.3, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700332007; x=1700936807; i=jan.claussen10@web.de;
	bh=/9gPPbu0gsqS8HAHGcx2uMMe7arPwHiFTnGnDQTISWI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Buxt7F1FflnyuxCMJl9SHX4k9aVnIlYHNQx7gteuPhj6S3UMcD+yh0sZ0jQcNMVZ
	 caEYyQmtXphG6HVvilCpGL3ZM5GIDG5QBkHRdIhmePv0f2KUFXcCP0VAJvM64YTGg
	 yBTTdv9JZiST6zFELSdmVKOAK09sSpTRKugxkL+9O5fi18oaLjABUx/LsgZJ1zg6F
	 6ALw9lWOd/Mn/osdifrV6X5puM0WwXr5dfqE4iXoykCJAx+BUKtdx0mcuoOiatINa
	 Jic+q87x1ollbkb7veto/Jrb0++p/Aak+QgdFSpEm8JrUpIK3iWMYK6RZ15+SnRdw
	 kgHXUT+fqg4CHVDjHw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost ([195.123.103.85]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvbik-1rNsaP3RQc-00sTjc; Sat, 18
 Nov 2023 19:26:47 +0100
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: [meta-oe][PATCH] meta-oe: recipes-support: Add btop
Date: Sat, 18 Nov 2023 19:26:46 +0100
Message-ID: <20231118182646.3237533-1-jan.claussen10@web.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QDFC5DS9qqJIlqdQCrdegqQAPVDKQdcrL6uPp0VKIL2eIATPivw
 lHlIvAroO1OgkXxSO0dOzQNEm81nl5ja4caTQZscusUoz/jN+xP+GE3yTpQSN4ya+OntIme
 KcN65XO2VSaNr07tjRkMzO3elR6PQ49dwl6FWiFruRo/vThNOLyh5wT6SqKjcMVpSYWGf+g
 5u7C2lbhMLltvMmYWjfbw==
UI-OutboundReport: notjunk:1;M01:P0:ayqtUrLEEmw=;4g2AkiXowIyDgygXBfnldyncW8a
 agkeeBHwrtvTL2OPYW+M6B1chs5KBOb/6iEXF8oNQaMM3GXioFskJSJt9t2ejfVS7kNMpc/cb
 1WTPVm4YqqdHkXPLBMKQRTB3nG8p4EbD9GgMX8T/6Y/SE3V1iR5JwiAJrdRpTe2EqBfvyX47C
 Rc9OhDIf4BWEPxyhBnP0yAKB8PHxTYtyVGuGGADm2EgXkadYBA1SMMofaDyoyPnKORaMF0tZ+
 dFWdtf5JZYHRjnE9WBNuRKUemJpNd5Xvx/8AZOwos8t3oN9KA4XoPl/onDtQqWoAFPva54brM
 C0S1GJXytqIpzOR9ugjnnuROTKT7s0p+5CaOzJTAAiejAw0V/xDoWReJWLvvsWBLLhL1QDZNz
 WGbalqH6F0gWBO4z7vbAYPLt/SDIKRzupDhI4c3zI/F8l+LYMhNoN3sUh/m8L8ts6v+kqazJx
 yAJvDA0sAYxL9mEYf+JqNPaWen6O2Y72DfGeJ2ncYd/m42aGzD15Xle8r+Yc5xFd/gocLyfZI
 ss9H1uYsBzpx63/Pc24FQC6MPxrlItEqwisq5AnYBXkY18e0ZLZztb7L5lxRYeQ/jWDDyBJTl
 P8ZKnc/lCxd/Gh5EZA9AFlWS6fu53Ubxi7frV3f9DVy6D2V0kkOvoxpxH5SRJTip/QQNpnhE9
 nIqTviopecEFAVJ/AyTltwcu5jhcXlMpIhNWK32w0bcxq9WLriQI+G2ZU+huoJ8+JU01F48Rc
 HW8dylAuNj3Yxn8B8f8IXLTHIonp+QgVg/3fVviQwa9LaQkumqphT7yGH0fmjKFyQVfc7dZel
 A35do6fijvNvpcbR+AMUCouozrSre98R3x23qjdLhgyiCQWAz26lWxRkeje51JKB590hD28S/
 CqLxJ/YCg9OnTifi+5VLRuthLWVu5OZAQ/xMfi8xbWnpJ+jp/KM6Q0ibYM8FJlmWxH1R3wsPy
 BLWDwMhrhvrJ5XUfds0KQwUXFbE=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 18:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106891

Adds btop, the shell-based resource monitor that shows usage and stats for=
 processor, memory, disks, network and processes.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb

diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipes=
-support/btop/btop_1.2.13.bb
new file mode 100644
index 000000000..a944fe7b5
=2D-- /dev/null
+++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "Resource monitor that shows usage and stats for processor, m=
emory, disks, network and processes."
+HOMEPAGE =3D "https://github.com/aristocratos/btop"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57"
+SECTION =3D "console/utils"
+
+SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bran=
ch=3Dmain"
+SRCREV =3D "9edbf27f1b6d5844a97325fcda732762ba086a99"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+FILES:${PN} +=3D " \
+    ${datadir}/icons \
+    ${datadir}/icons/hicolor \
+    ${datadir}/icons/hicolor/48x48 \
+    ${datadir}/icons/hicolor/scalable \
+    ${datadir}/icons/hicolor/48x48/apps \
+    ${datadir}/icons/hicolor/48x48/apps/btop.png \
+    ${datadir}/icons/hicolor/scalable/apps \
+    ${datadir}/icons/hicolor/scalable/apps/btop.svg \
+"
=2D-
2.42.1


