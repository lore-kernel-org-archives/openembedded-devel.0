Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.8473.1600849561680670717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 01:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08N8PxHL027215
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 01:25:59 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 23 Sep 2020
 01:25:52 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <trevor.gamblin@windriver.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pykwalify: fix missing comma
Date: Wed, 23 Sep 2020 16:25:51 +0800
Message-ID: <20200923082551.36737-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08N8PxHL027215
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

...
|/usr/lib/python3.8/site-packages/pykwalify/rule.py:343: SyntaxWarning:
'tuple' object is not callable; perhaps you missed a comma?
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-rule.py-fix-missing-comma.patch      | 34 +++++++++++++++++++
 .../python/python3-pykwalify_1.7.0.bb         |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pykwalify=
/0001-rule.py-fix-missing-comma.patch

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify/0001-r=
ule.py-fix-missing-comma.patch b/meta-python/recipes-devtools/python/pyth=
on3-pykwalify/0001-rule.py-fix-missing-comma.patch
new file mode 100644
index 000000000..689355eea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-=
fix-missing-comma.patch
@@ -0,0 +1,34 @@
+From f96b76efb810d7d559254d0ec58de628e09f525a Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Mart=3DC3=3DAD=3D20Bol=3DC3=3DADvar?=3D <marti.f.boliv=
ar@gmail.com>
+Date: Mon, 13 Jan 2020 08:42:05 -0800
+Subject: [PATCH] rule.py: fix missing comma
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A line in the defined_keywords list is missing a comma. Add it.
+
+Signed-off-by: Mart=C3=AD Bol=C3=ADvar <marti.f.bolivar@gmail.com>
+
+Upstream-Status: Backport [https://github.com/Grokzen/pykwalify.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pykwalify/rule.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pykwalify/rule.py b/pykwalify/rule.py
+index 7ac2c9e..f044b69 100644
+--- a/pykwalify/rule.py
++++ b/pykwalify/rule.py
+@@ -340,7 +340,7 @@ class Rule(object):
+             ('matching', 'matching'),
+             ('matching_rule', 'matching_rule'),
+             ('name', 'name'),
+-            ('nullable', 'nullable')
++            ('nullable', 'nullable'),
+             ('parent', 'parent'),
+             ('pattern', 'pattern'),
+             ('pattern_regexp', 'pattern_regexp'),
+--=20
+2.18.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.=
bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
index 7a30f1f67..2df30aeab 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da72ea5159364a2=
cd7f45c6dcbee37872"
 SRC_URI[md5sum] =3D "58357f1d0f77de976e73dbd3660af75b"
 SRC_URI[sha256sum] =3D "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b=
402e8015defcceb2"
=20
+SRC_URI +=3D "file://0001-rule.py-fix-missing-comma.patch"
+
 PYPI_PACKAGE =3D "pykwalify"
 inherit setuptools3 pypi
 unset _PYTHON_SYSCONFIGDATA_NAME
--=20
2.18.2

