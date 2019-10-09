Return-Path: <m.schwan@phytec.de>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Oct 2019 12:13:14 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 11C2A71CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1570622292; x=1573214292;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oPM0QSvP/aGzG6Hmy+RHWBqgeqZmBm/2n6maNtutzF0=;
	b=Ns3SZE/LDO47B1U4Tkl6qnVdvPf0KiwiQR3cDK7o0OFLIfw1ErlUx0ff6CgasVWi
	ZKCJWWZkx/DPFmi4/tBqS+Gf+Dl7JMshJoWjn2D+8fOEazrSL5/2vi0YJ+SF+cVa
	Fl8b4uG4n406OoIkbF1JMBUS4bKTnhGChzY7O3/TsKE=;
X-AuditID: c39127d2-e31ff70000001af2-58-5d9dcb54b4e4
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	67.A2.06898.45BCD9D5; Wed,  9 Oct 2019 13:58:12 +0200 (CEST)
Received: from lws-schwan.phytec.de ([172.16.23.192])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019100913581259-62998 ;
	Wed, 9 Oct 2019 13:58:12 +0200 
From: Martin Schwan <m.schwan@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 9 Oct 2019 13:58:12 +0200
Message-Id: <20191009115812.18398-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 09.10.2019 13:58:12,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 09.10.2019 13:58:12
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJJMWRmVeSWpSXmKPExsWyRoCBSzfk9NxYgws/NCwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujNmLJzEWnBeoWHjnMlMD40O+LkZODgkBE4n5r24wdzFycQgJ
	bGOU+Pb1NiOEc55R4lzDBFaQKjYBDYl3Zx6zgdgiAroSHz/MBSri4BAWsJI4/SEQJMwioCIx
	Y8UTsBJeAXOJOy17wEokBOQlDh/KgggLSpyc+YQFZLyEwBVGiYYv35ghjhCSOL34LJjNLKAt
	sWzha+YJjLyzkPTMQpJawMi0ilEoNzM5O7UoM1uvIKOyJDVZLyV1EyMwOA5PVL+0g7Fvjsch
	RiYOxkOMEhzMSiK8i2bNiRXiTUmsrEotyo8vKs1JLT7EKM3BoiTOu4G3JExIID2xJDU7NbUg
	tQgmy8TBKdXAaFDalXdXeW2CWafvR4eTFlPqvQW3BHnW7DryWLDc2+pPVeOMMhed3k2NQlEX
	20zWamy+42jqpblseZqQ2t6e2zN/nCwseeZ9ecayi8GLbvzZ6ZPKEicj4M1hdla1quF8pvMc
	9qkno9/eSq6+d2Ei82fhiJX67jb2X2dZby+uizQxtqz+WySoxFKckWioxVxUnAgAOuk4lvwB
	AAA=
Subject: [meta-python][PATCH] python-waitress: Add recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 12:13:15 -0000
Content-Transfer-Encoding: quoted-printable

Waitress is a pure-Python WSGI server.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../recipes-devtools/python/python-waitress.inc        | 10 ++++++++++
 .../recipes-devtools/python/python-waitress=5F1.3.1.bb   |  2 ++
 .../recipes-devtools/python/python3-waitress=5F1.3.1.bb  |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-waitress.inc
 create mode 100644 meta-python/recipes-devtools/python/python-waitress=5F1=
.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-waitress=5F=
1.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-waitress.inc b/meta=
-python/recipes-devtools/python/python-waitress.inc
new file mode 100644
index 000000000..8bed3cfd7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-waitress.inc
@@ -0,0 +1,10 @@
+SUMMARY =3D "A WSGI server for Python"
+DESCRIPTION =3D "Waitress is meant to be a production-quality pure-Python =
WSGI \
+    server with very acceptable performance."
+HOMEPAGE =3D "https://github.com/Pylons/waitress"
+SECTION =3D "devel/python"
+LICENSE =3D "ZPL-2.1"
+LIC=5FFILES=5FCHSUM =3D "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e2=
7a6966b2"
+
+SRC=5FURI[md5sum] =3D "d9132d313de0c5e0fec34ef9ede5442e"
+SRC=5FURI[sha256sum] =3D "278e09d6849acc1365404bbf7d790d0423b159802e850c72=
6e8cd0a126a2dac7"
diff --git a/meta-python/recipes-devtools/python/python-waitress=5F1.3.1.bb=
 b/meta-python/recipes-devtools/python/python-waitress=5F1.3.1.bb
new file mode 100644
index 000000000..26a628ea0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-waitress=5F1.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools pypi
+require python-waitress.inc
diff --git a/meta-python/recipes-devtools/python/python3-waitress=5F1.3.1.b=
b b/meta-python/recipes-devtools/python/python3-waitress=5F1.3.1.bb
new file mode 100644
index 000000000..83c8b66d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-waitress=5F1.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 pypi
+require python-waitress.inc
--=20
2.23.0


