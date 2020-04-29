Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.854.1588180766010079508
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 10:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03THJOlI015624
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 10:19:24 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 10:19:23 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id C3E2D900659;
 Wed, 29 Apr 2020 10:19:23 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-iso8601: add python3-numbers to RDEPENDS
Date: Wed, 29 Apr 2020 10:19:23 -0700
Message-ID: <20200429171923.91523-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 03THJOlI015624
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

python3-iso8601 relies on the decimal module from the standard
library, but it is not in iso8601's RDEPENDS:

root@qemux86-64:~# python3                                               =
                                        =E2=94=82tgamblin@ala-lpggp3$vim =
meta/recipes-core/packagegroups/packagegroup-core-tools-testimage.bb
Python 3.8.2 (default, Feb 25 2020, 10:39:28)                            =
                                        =E2=94=82
[GCC 9.3.0] on linux                                                     =
                                        =E2=94=82tgamblin@ala-lpggp3$comm=
and -v ctop >/dev/null 2>&1 || { echo >&2 "I require top but it is not in=
stalled";}
Type "help", "copyright", "credits" or "license" for more information.   =
                                        =E2=94=82I require top but it is =
not installed
>>> import iso8601                                                       =
                                        =E2=94=82tgamblin@ala-lpggp3$comm=
and -v ctop >/dev/null 2>&1 || { echo >&2 "I require ctop but it is not i=
nstalled";}
Traceback (most recent call last):                                       =
                                        =E2=94=82I require ctop but it is=
 not installed
  File "<stdin>", line 1, in <module>                                    =
                                        =E2=94=82tgamblin@ala-lpggp3$comm=
and -v top
  File "/usr/lib/python3.8/site-packages/iso8601/__init__.py", line 1, in=
 <module>                               =E2=94=82/usr/bin/top
    from .iso8601 import *                                               =
                                        =E2=94=82tgamblin@ala-lpggp3$whic=
h awk
  File "/usr/lib/python3.8/site-packages/iso8601/iso8601.py", line 12, in=
 <module>                               =E2=94=82/usr/bin/awk
    from decimal import Decimal                                          =
                                        =E2=94=82tgamblin@ala-lpggp3$file=
 /usr/bin/awk
ModuleNotFoundError: No module named 'decimal'

Add it to RDEPENDS to fix the import error.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-iso8601.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/met=
a-python/recipes-devtools/python/python-iso8601.inc
index 61e9abbac..b6e021c5b 100644
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
+++ b/meta-python/recipes-devtools/python/python-iso8601.inc
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] =3D "49c4b20e1f38aa5cf109ddcd39647ac41=
9f928512c869dc01d5c7098ed
=20
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \=20
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.17.1

