Return-Path: <m.schwan@phytec.de>
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 45C3D6D4C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1570624338; x=1573216338;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1ms1bnES90Kx75EYrxiKN1hoBT1l5rbmtSfG/10k5Is=;
	b=tvzETb2oQ51PHGHF379L+yi6ivzIeQQBhDWHA1kSX6AFtmvnZgQ+CuKgBYU9eSAj
	Es4iO2V7dzYuGSdulgkaozUuMO3WVyyG8XcVSRQ/ZLOKWDkCogDmAKrUZagGsTV2
	y6tAvVZKgc0E7D2/ykg2COx8vN+vt5D+PYWWzWzBOQg=;
X-AuditID: c39127d2-e31ff70000001af2-06-5d9dd3527849
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	B1.E2.06898.253DD9D5; Wed,  9 Oct 2019 14:32:18 +0200 (CEST)
Received: from lws-schwan.phytec.de ([172.16.23.192])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019100914321899-63333 ;
	Wed, 9 Oct 2019 14:32:18 +0200 
From: Martin Schwan <m.schwan@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 9 Oct 2019 14:32:18 +0200
Message-Id: <20191009123218.19821-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 09.10.2019 14:32:18,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 09.10.2019 14:32:19
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBJMWRmVeSWpSXmKPExsWyRoCBSzfo8txYg3mLdS0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujCMdt5gLpgpWnJq/mK2BcSZ/FyMnh4SAicSzH1dYuhi5OIQE
	tjFKbDy6lxHCOc8oceLLSSaQKjYBDYl3Zx6zgdgiAroSHz/MBSri4BAWsJXoaGAFCbMIqEj8
	2LISrJxXwFxi46QWNpASCQF5icOHsiDCghInZz5hgdh7hVHiz25RCFtI4vTis8wgNrOAtsSy
	ha+ZJzDyzkLSMgtJagEj0ypGodzM5OzUosxsvYKMypLUZL2U1E2MwNA4PFH90g7GvjkehxiZ
	OBgPMUpwMCuJ8C6aNSdWiDclsbIqtSg/vqg0J7X4EKM0B4uSOO8G3pIwIYH0xJLU7NTUgtQi
	mCwTB6dUA2NM5s4krjyPoDVs3ox3Cl9Wb1n0PU+Zm0VU/qJ4zO0zSTaTLIR+Br6/ePXOuvR5
	C1Wm3WPquP7ki1GEUtWb1xYPj8wqfm5S2ZvxrP3X7nX3TpfIX59md+DP4UCGopUn2zZejcyV
	aS07kn//fNU1iwfKCX8f6Aav/rsvkut0u9DWLJcT6TdPqTMqsRRnJBpqMRcVJwIAy+VML/sB
	AAA=
Subject: [meta-python][PATCH v2] python-waitress: Add recipes
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
X-List-Received-Date: Wed, 09 Oct 2019 12:32:19 -0000
Content-Transfer-Encoding: quoted-printable

Waitress is a pure-Python WSGI server.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v2:
 - Fixed missing "K" in "LIC=5FFILES=5FCHKSUM"
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
index 000000000..732c31dbd
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
+LIC=5FFILES=5FCHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3e=
27a6966b2"
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


