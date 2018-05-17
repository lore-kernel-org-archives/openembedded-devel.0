Return-Path: <christophe.priouzeau@st.com>
X-Greylist: delayed 1421 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 May 2018 08:47:22 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 12E917480F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 08:47:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id w4H8NbX3014574
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 10:23:42 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2j0s18u994-1
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 10:23:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 504F534
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 08:23:41 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1798016B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 08:23:41 +0000 (GMT)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 17 May 2018 10:23:40 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 May 2018 10:23:40 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v3] minicoredumper: relocate admin-binaries to
	sbin
Thread-Index: AQHT7bhcc/+BTL0jRUGLJvev6ng1pQ==
Date: Thu, 17 May 2018 08:23:40 +0000
Message-ID: <1526545414-15932-1-git-send-email-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-05-17_04:, , signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH v3] minicoredumper: relocate admin-binaries to sbin
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
X-List-Received-Date: Thu, 17 May 2018 08:47:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Change path of minicoredumper on init/service script to /usr/sbin.

Since the commit "relocate admin-binaries to sbin" on minicoredumper,
minicoredumper binaries are installed on /usr/sbin directory instead
of /usr/bin.
src/minicoredumper/Makefile.am: sbin_PROGRAMS =3D minicoredumper

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb =
b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
index 1858e10..0d3c66b 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
@@ -38,4 +38,8 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system=
_unitdir}
     install -d ${D}${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.=
d/minicoredumper
+
+    # correct path of minicoredumper
+    sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${=
sysconfdir}/init.d/minicoredumper
+    sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${=
systemd_system_unitdir}/minicoredumper.service
 }
--=20
2.7.4

