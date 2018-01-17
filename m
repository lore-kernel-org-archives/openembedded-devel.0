Return-Path: <mmovchan@cisco.com>
X-Greylist: delayed 577 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Jan 2018 16:40:21 UTC
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id 1373B784C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3601; q=dns/txt; s=iport;
	t=1516207224; x=1517416824;
	h=from:to:subject:date:message-id:mime-version;
	bh=jDGhitgyKPmDkF2FTJFcfOUdEnqxbNPZx80G8Ev5iP0=;
	b=AMUgHYTLzzg0Bj4tQ+B/NQNPSSYvvuILbSGmix0DCC7xjzjX+S1fhYvX
	zT0Pvm4CKXEt/7g+/WJebPrMwCaVHJw36A1rfJObQ+UBt0vMjoWaoX2f8
	wRxpOEfSy4XlsmOX/AbjMrosSldXe34R2QAlMgyH/McXsSgWkMe8OUguS w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BDAQAeeV9a/4kNJK1bGgEBAQEBAgEBA?=
	=?us-ascii?q?QEIAQEBAYJKd2Z0JweGW4dVjl2BHYUxAQKNDoVRghYKI4l+PxgBAQEBAQEBAQF?=
	=?us-ascii?q?rHQuFdQE/AQwdNBATJwQTiU9kEKd7hBABhTsBAQEBAQUBAQEBASOEPIIVih0CA?=
	=?us-ascii?q?odrBY9kgxWQcwIch3CNRZQTjUOJPwIRGQGBOwEfOYFQbxWCZwmCTBuBZ3gBiwS?=
	=?us-ascii?q?BFwEBAQ?=
X-IronPort-AV: E=Sophos;i="5.46,372,1511827200"; d="scan'208,217";a="57320764"
Received: from alln-core-4.cisco.com ([173.36.13.137])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 16:30:45 +0000
Received: from XCH-ALN-002.cisco.com (xch-aln-002.cisco.com [173.36.7.12])
	by alln-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id w0HGUj0b028394
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:30:45 GMT
Received: from xch-aln-003.cisco.com (173.36.7.13) by XCH-ALN-002.cisco.com
	(173.36.7.12) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Wed, 17 Jan 2018 10:30:44 -0600
Received: from xch-aln-003.cisco.com ([173.36.7.13]) by XCH-ALN-003.cisco.com
	([173.36.7.13]) with mapi id 15.00.1320.000;
	Wed, 17 Jan 2018 10:30:44 -0600
From: "Mariia Movchan -X (mmovchan - GLOBALLOGIC INC@Cisco)" <mmovchan@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking] [PATCH] ipcalc: add initial recipe for
	version 0.2.0
Thread-Index: AQHTj6/Ybx9rUfxhpkGj+HqB7PIRcQ==
Date: Wed, 17 Jan 2018 16:30:44 +0000
Message-ID: <1516206797987.39279@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.61.98.127]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-networking] [PATCH] ipcalc: add initial recipe for version 0.2.0
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
X-List-Received-Date: Wed, 17 Jan 2018 16:40:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
---
 .../recipes-support/ipcalc/ipcalc_0.2.0.bb            | 19 +++++++++++++++=
++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb

diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb b/meta-=
networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
new file mode 100644
index 0000000..bb283c8
--- /dev/null
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Tool to assist in network address calculations for IPv4 and I=
Pv6."
+HOMEPAGE =3D "https://github.com/nmav/ipcalc"
+
+SECTION =3D "net"
+
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f655=
2"
+
+SRC_URI =3D "https://github.com/nmav/ipcalc/archive/${PV}.tar.gz;downloadf=
ilename=3Dipcalc-${PV}.tar.gz"
+
+SRC_URI[md5sum] =3D "edbfc4cb64632e0c4f87cf81c7d8302d"
+SRC_URI[sha256sum] =3D "c965c1296172a6acc50d54dfe81f7e5d589f9762b5d9ae459e=
ee00349675336b"
+
+export USE_GEOIP =3D "no"
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/ipcalc ${D}/${bindir}
+}
--
2.10.3.dirty

