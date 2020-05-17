Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.23437.1589726102255014778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 07:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=XhU5o9U6;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q4Rk13ykz1n
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2020 16:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589726098;
	bh=MP1PPpufkp79F9GbZk2qAGgBsxi/4Lc+rQlX+DNTekE=;
	h=From:To:Subject:Date:From;
	b=XhU5o9U6qSzQwPABWxtO9TlyeFyTpHGX2fyIUdtK7GBDJQcA8WkESm3/ypjC8+7ol
	 dNsPSvW68o0Ir1om4bByY7gCsoF0MYeOyuv6IdbnhWID+q1/KqpoAgo1o2VDgtgezT
	 i3bRuA9oMTg1ovrw2nxf7pGpa1cTx8t/84+I6SZyDLaDT8E8aoX+1WwSATPT9shB0L
	 fhamr+2ZM1EyfXLVyBHE7haCFEzRCKzJQ+ayrX9QGlffp5GKyL74zNitryor9Zgeg6
	 MV34ySdha3rpPkmx1NHM+64od7DHGEZFIG+k8L6Aw9GiroM1MBMVfT1998CRajCPKM
	 OhR0ZsYLmyX9YSELol/0laM6+nOMZmagbBYtd61p8smkoZDrDvWz7VFeezZ9X23FJq
	 qYBzTxrWN2VsD0utIog9AHfC80kctuq9AGqMwQwoVZtv2o0VaMQo0kZediuTOWdb3+
	 CEvo42Ip5FRUN/NbT8cdTvubYQ6LfLhcvGbSOiujiiTNZsowcy5rBDeK621SOEo5zC
	 naZORdOuDu9YAl6pBrc/fOmu16n7Y9pzSP0JD1fpVlD6gAxc0WrrM1QdLVG25WHvEr
	 17KAuBVc2ZAwJzq8sX62fqFqMY8bp4u9edrH10kR/6PjjIQ93VGcbiAWW44noLPpvM
	 HH7DLGtXhLyAKa7+/h9eNB44=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/4] python3-docutils: Remove, moved to OE-core
Date: Sun, 17 May 2020 17:34:53 +0300
Message-Id: <20200517143456.24873-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-python.bb     |  2 +-
 .../python/python3-docutils_0.15.2.bb             | 15 ---------------
 2 files changed, 1 insertion(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 12a056255..4036e1e20 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -23,7 +23,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
     python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
     python3-flask-script python3-cassandra-driver python3-cython python3-ujson python3-aws-iot-device-sdk-python \
-    python3-pytest-runner python3-pyiface python3-docutils python3-flask-login python3-markupsafe python3-setuptools-scm \
+    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
     python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
     python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
     python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb b/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
deleted file mode 100644
index 321f55572..000000000
--- a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Text processing system for documentation"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "docutils"
-
-SRC_URI[md5sum] = "e26a308d8000b0bed7416a633217c676"
-SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
-
-BBCLASSEXTEND = "native"
-
-- 
2.17.1

