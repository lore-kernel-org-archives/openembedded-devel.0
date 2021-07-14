Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.4358.1626255378310294337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=wUNwYLKD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255375; i=@fujitsu.com;
	bh=nvkXEAEE+W7TKEpzxLECFOaSDg4s3LHi2aFEdG4d0aQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=wUNwYLKDLw1MHnimJc675LPWlX1yx4tjQzmn0MANMIi0NhAlJE4yeiHCW2YQg+qaX
	 nQSo8QYHy7PEuCe95QSdi/gEXS02Z4jABNHGdU6OLGbdLMMPohIWz85dxjwLx2wbsb
	 O6s/3U7wLSgQrIX5uyGQJdSWOFuZupfhJv6dVVRIOuEyt/Tw4qRZAKQ84VGMP9mnbk
	 3gBQAb6KhHzuGfOX+40BHOKN+21JV4Tq4FrtgBbLZ3gQ6A3yBsw37ab52UplAhCZY7
	 1CYa7gWSuWYWYH5SbNNGI/6c9JZZlXoak78yGHQiOdigfOPucW5ExJnhbFKclUqT+6
	 7B30PEBeSLbyQ==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id F0/25-07685-F00BEE06; Wed, 14 Jul 2021 09:36:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVZdvw7s
  Eg5fnTSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox1Z16zF5yUqJg5cyVzA+N5kS5GLg4hgW1M
  Esvv3WDpYuQEck4ySlyfoghiswnoSHS86AaLiwjoSyydvYcZxBYW8JF4MuUZE4jNIqAq0fZlN
  mMXIwcHr4CbxMWPXCBhCQEFiSkP34OV8woISpyc+QRsDLOApkTr9t/sELa8RPPW2cwQ9YoS23
  eeYYGwKyX2zOpnmsDIOwtJ+ywk7bOQtC9gZF7FaJlUlJmeUZKbmJmja2hgoGtoaKwLJI0N9BK
  rdBP1Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIFhl1LI0LSD8d2rD3qHGCU5mJREeW/4
  vE0Q4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7bd27BCHBotT01Iq0zBxgDMCkJTh4lER43dcCp
  XmLCxJzizPTIVKnGBWlxHm9QfoEQBIZpXlwbbC4u8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1
  FJmFdkPdAUnsy8Erjpr4AWMwEt1l7zFmRxSSJCSqqBaY6uVbBzXUjDgs0hbTe5orOnvzFSdlg
  Ux/+E63uDSYhXyymen79X9Z3c9Pf1Ku27qz26fjy/Vyq3IPPVe/W/838/qbhXPW9hh4zaxdo0
  PsWgX9LSRyt4fjCd2Vog1Tk5sWTRK64LK5VjFjDNmtTKm+XhJZ8gldPz/vLDJW4B751t9D7ur
  TZ+KNzzL+MCT9+juIAuBk2eu+u2ckxQComoPd3tW/AydH7dJ/eHy29M1nYUfbW0V+XcPmcjhm
  fnStoKY3YkMeurzOc8YH43oL9/ktiGIAG99gL5/VceO+2UO8JrnCnY+z5/Wv2Elprqr91VU+4
  68C4+ILNAVExnz58/V4W+7tK7fOJWzcZu8WhZJZbijERDLeai4kQAFNmm0zYDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-232.messagelabs.com!1626255374!82454!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9377 invoked from network); 14 Jul 2021 09:36:14 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:36:14 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9aDar020778
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:36:13 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:36:12 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-networkx: upgrade 2.5.1 -> 2.6.1
Date: Thu, 15 Jul 2021 05:36:05 +0800
Message-ID: <1626298565-4853-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This release is the result of 11 months of work with over 363 pull requests by 91 contributors. Highlights include:
Dropped support for Python 3.6.
NumPy, SciPy, Matplotlib, and pandas are now default requirements.
NetworkX no longer depends on the library =E2=80=9Cdecorator=E2=80=9D.
Improved example gallery
Removed code for supporting Jython/IronPython
The __str__ method for graph objects is more informative and concise.
Improved import time
Improved test coverage
New documentation theme
Add functionality for drawing self-loop edges
Add approximation algorithms for Traveling Salesman Problem

New functions:
Panther algorithm
maximum cut heuristics
equivalence_classes
dedensification
random_ordered_tree
forest_str
snap_aggregation
networkx.approximation.diameter
partition_quality
prominent_group
prefix_tree_recursive
topological_generations

-License-Update: Copyright year updated to 2021.

Add runtime dependency to resolve errors that occurred when import networkx.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/python3-networkx_2.5.1.bb          | 12 ------------
 .../python/python3-networkx_2.6.1.bb          | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-networkx_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb b/meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
deleted file mode 100644
index 0b52cfd7e5..0000000000
--- a/meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION =3D "Python package for creating and manipulating graphs and networks"
-HOMEPAGE =3D "http://networkx.github.io/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da24ea029adac8935699bf69b2e38c728"
-
-SRC_URI[sha256sum] =3D "109cd585cac41297f71103c3c42ac6ef7379f29788eb54cb751be5a663bb235a"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} +=3D "\
-                   ${PYTHON_PN}-decorator \
-                   "
diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.6.1.bb b/meta-python/recipes-devtools/python/python3-networkx_2.6.1.bb
new file mode 100644
index 0000000000..676e1dbdca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.6.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "Python package for creating and manipulating graphs and networks"
+HOMEPAGE =3D "http://networkx.github.io/"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5cfa4d8f5881e0d053bb497130b9c73a"
+
+SRC_URI[sha256sum] =3D "bf4cb807d1bccf1593c7d0742d9127d9e04e021867299082658b0fc3907924e8"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "\
+                   ${PYTHON_PN}-decorator \
+                   ${PYTHON_PN}-netclient \
+                   ${PYTHON_PN}-compression \
+                   ${PYTHON_PN}-numbers \
+                   ${PYTHON_PN}-pickle \
+                   ${PYTHON_PN}-html \
+                   ${PYTHON_PN}-xml \
+                   ${PYTHON_PN}-json \
+                   "
-- 
2.25.1

