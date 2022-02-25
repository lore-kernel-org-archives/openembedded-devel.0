Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09B1C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 07:39:51 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.131])
 by mx.groups.io with SMTP id smtpd.web11.4300.1645774787344312205
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 23:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=npQKF8hO;
 spf=pass (domain: arri.de, ip: 40.107.2.131, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHqG2hCUR0YAYSeODb24PTIxx0fqQ4v4J/cbDjFchraa0g2YsOQUBS4U7fdIf6oHHh4Awto0MtVu5nZwo9W+odQr0qO6cXUTVspMPe88NgM0sdwbX/xxMadh4rQO9ZHBgC6stNEMs92iKFU4/ktd7T96zKH+LmseI1L5/Ra+beKKHyUM3b4D8yAIJR6Ul347Ha/mgekzn3vZrUhiCMP/+cRTSjLMI3s5RBSfkQoAKpOtlV+Y65My2BclqLZtzATPJWNj9yQ8WqNoKRwTNucfq/GBY0dsBeac88TzCy6yzK7GP6dAPmZKFg+lTl/0u9bbXG3dXmgpT2k/Ux86xgUqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruyA3ac7QOD5wFI3h0PcINcvrkyYLHrXeHyDhERipzs=;
 b=dhHz7V91J/vGpp9A8+8flInsg5Q6joepE0AxO3OMGVx087etG4D13h6pqHhAAs8Pmg74tD/lWpSebtu11Mioi5Lhacac/OdPeP/r7fdmBQU6dFMsUAAnYVMdDA0rKDBBF7HRKznIn+rdJEXnOHJutuQoKqRHEEPMxBCOS2/joMg9xL9Dl/Qy0DVSr5fxc1SSHMAGgmvj4ey0VOaJ1OsvRk+GpmtACSp70mHsT2qvsY+RPDA0mzysr/5HHEwub+h1D83AMgkn+n6WTj7eVoX4W9dWkbLCcZvnzH6SYKZCRxnDT6ZZ39SUYLrj50iL97Ulcx8C+Pij1SmrByFLjaOHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arri.de; dmarc=none action=none header.from=arri.de; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruyA3ac7QOD5wFI3h0PcINcvrkyYLHrXeHyDhERipzs=;
 b=npQKF8hOIXiPHsF24CaNk8LHbdt4kYBrjgO4Aa63llKxuo+5eV2g7pWLQVPGXfLv60wMR4n/ZO+gn90AaF9XmV7knk54yBx9Tv6Dp4xtyEZMQvuUc5RL4xrM9yj57TMLO/ZrEidT/M65JFwqh0AOAcjzGbw2WIFtdL9GtZzWbK0=
Received: from AS9PR06CA0368.eurprd06.prod.outlook.com (2603:10a6:20b:460::32)
 by AM6PR07MB4898.eurprd07.prod.outlook.com (2603:10a6:20b:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9; Fri, 25 Feb
 2022 07:39:43 +0000
Received: from VE1EUR02FT017.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::df) by AS9PR06CA0368.outlook.office365.com
 (2603:10a6:20b:460::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Fri, 25 Feb 2022 07:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT017.mail.protection.outlook.com (10.152.12.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.23 via Frontend Transport; Fri, 25 Feb 2022 07:39:42 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.55.62) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 25 Feb
 2022 08:39:42 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <peron.clem@gmail.com>, seladb <pcapplusplus@gmail.com>, Christian Eggers
	<ceggers@arri.de>
Subject: [meta-oe][PATCH v2] pcapplusplus: add new recipe
Date: Fri, 25 Feb 2022 08:39:32 +0100
Message-ID: <20220225073933.8251-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.55.62]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05b0832d-6b5c-4fee-fc9c-08d9f831fce9
X-MS-TrafficTypeDiagnostic: AM6PR07MB4898:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR07MB4898BD210836643A7ECBE7ACBF3E9@AM6PR07MB4898.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2YLQw22gre1+3x9skOEixP2dg3Ga8YMYx/fv+sgQnxVCi5mMTkK0JjbH8/YgX4AMEtkvzTwEUaS1c2dyb6xwgwC/Y+82PAs9rfqC8a1u7VZknlfmkyDqw4cHSnPt9KBxIBLPMsCMQwvrHtXYWoQkdSjj+XL5KZJjwpiKHE1tBEcA5v8o6xCIxZOo7RXvwNoboeLZ+WUlE2XMmcdXuVAJJzLyrw9B3oYV89UtJoTS7UJJhM8ulW6tI1gFRu3tm5Mcbm8LY5f5yxqEsUbXFPue63H5JzcVtsi3GGzrcarbJJmHvKWOdOJwf8TXLhDdYMdpqocAMT7J5XgsJCHLuJTIacFurYbM6dM9HdOTSoxbRjaF/NWeOBGT0K8olbL8mE0oJNbMUkCTTLgZQKJOUoKBjVANBg8nXVJmq/SZ60gN7OWmt83ISoF1xXZB701A/gpnASkAGAg7ycg2Q6m5xT+/9s0wz3WHpIMV8ht4WaDzUDs7Ed0kot68jN8Nr28yQlpmCiGvr5ilIb2mZthAI3gnK2MRJt+SW/1ejbERaRDafzFApRtwTWqDC3NLmgEL9sem6TN2WhIibb6NEvR4ku/DbI6rzxllJIKs4E/fj9p0rOGDHhXbJGuD2RIJzfonfbYjiorCrVGbyJ1KEIn1KatPnCQi8Tgw5+EK48OHEL8RYYTP/0DgQan/HKRFE68rOsIc6NpNA8PrHrhvQtxzoOZJouNhKxgmIODFFxEn/pCHicLjGHu96nYX+OgZkkSwsiFsVYWFzuuXtTLVtOiR3wSt3Y3v964uuWqRpK4WB7tKHg+ZZnARVnol5FRaHlFXJ15H
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6666004)(356005)(54906003)(40460700003)(81166007)(6916009)(4326008)(8676002)(2906002)(316002)(70206006)(70586007)(5660300002)(8936002)(82310400004)(2616005)(426003)(47076005)(36860700001)(86362001)(63350400001)(1076003)(16526019)(66574015)(36756003)(186003)(336012)(26005)(508600001)(83380400001)(107886003)(21314003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 07:39:42.9446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 05b0832d-6b5c-4fee-fc9c-08d9f831fce9
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT017.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4898
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 07:39:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95517

"A multiplatform C++ library for capturing, parsing and crafting of
network packets"

PcapPlusPlus is currently transitioning from a custom build system
(shell script + Makefile) to CMake. After this has been merged, SRC_URI
must be set the main repository.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
RFC --> v2:
------------
- Update patch status (Submitted --> Accepted)
- inherit dox2unix (files in GIT have Windows line endings)
- convert patch to unix line endings

v1 --> RFC:
------------
- move to Cl=C3=A9ment P=C3=A9ron's fork [branch: cmake-ng]
- change recipe to cmake
- add patch for -Wnarrowing warnings/errors
- build shared libraries
- remove RDEPENDS:${PN}-dev (main pkg contains now shared libs)
- add -Wno-psabi to CXXFLAGS

This is the 2nd attempt to move the build system of PcapPlusPlus to
CMake. I highly suppose that this will get merged soon.
 ...-Fix-timeval-to-timespec-conversions.patch | 58 +++++++++++++++++++
 .../pcapplusplus/pcapplusplus_21.11.bb        | 33 +++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/=
0001-Fix-timeval-to-timespec-conversions.patch
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_=
21.11.bb

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fi=
x-timeval-to-timespec-conversions.patch b/meta-oe/recipes-connectivity/pcap=
plusplus/pcapplusplus/0001-Fix-timeval-to-timespec-conversions.patch
new file mode 100644
index 000000000000..1f050815be61
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timev=
al-to-timespec-conversions.patch
@@ -0,0 +1,58 @@
+From 740971bb451e1147e19a1b0498436d2332b01293 Mon Sep 17 00:00:00 2001
+From: Christian Eggers <ceggers@arri.de>
+Date: Mon, 21 Feb 2022 13:53:49 +0100
+Subject: [PATCH] Fix timeval-to-timespec conversions
+
+Time values returned by gettimeofday() have microseconds in
+timeval::tv_usec while timespec::ts_nsec is nanoseconds.
+
+timeval::tv_usec is 64 bit (at least on some platforms), while
+timespec::tv_nsec is always 'long'. An explicit cast is required to
+avoid -Wnarrowing warnings/errors.
+
+Upstream-Status: Accepted [https://github.com/seladb/PcapPlusPlus/pull/814=
]
+
+Signed-off-by: Christian Eggers <ceggers@arri.de>
+---
+ Pcap++/src/NetworkUtils.cpp   | 4 ++--
+ Pcap++/src/PcapFileDevice.cpp | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Pcap++/src/NetworkUtils.cpp b/Pcap++/src/NetworkUtils.cpp
+index bdbf87f4c380..749853927ecd 100644
+--- a/Pcap++/src/NetworkUtils.cpp
++++ b/Pcap++/src/NetworkUtils.cpp
+@@ -169,7 +169,7 @@ MacAddress NetworkUtils::getMacAddress(IPv4Address ipA=
ddr, PcapLiveDevice* devic
+ 	// create the timeout
+ 	timespec timeout =3D {
+ 			now.tv_sec + arpTimeout,
+-			now.tv_usec
++			static_cast<long>(now.tv_usec * 1000)
+ 	};
+=20
+ 	// start capturing. The capture is done on another thread, hence "arpPac=
ketRecieved" is running on that thread
+@@ -436,7 +436,7 @@ IPv4Address NetworkUtils::getIPv4Address(std::string h=
ostname, PcapLiveDevice* d
+ 	// create the timeout
+ 	timespec timeout =3D {
+ 			now.tv_sec + dnsTimeout,
+-			now.tv_usec
++			static_cast<long>(now.tv_usec * 1000)
+ 	};
+=20
+ 	// start capturing. The capture is done on another thread, hence "dnsRes=
ponseRecieved" is running on that thread
+diff --git a/Pcap++/src/PcapFileDevice.cpp b/Pcap++/src/PcapFileDevice.cpp
+index 6bf04c1dd31a..256554407c50 100644
+--- a/Pcap++/src/PcapFileDevice.cpp
++++ b/Pcap++/src/PcapFileDevice.cpp
+@@ -188,7 +188,7 @@ bool PcapFileReaderDevice::getNextPacket(RawPacket& ra=
wPacket)
+ 	uint8_t* pMyPacketData =3D new uint8_t[pkthdr.caplen];
+ 	memcpy(pMyPacketData, pPacketData, pkthdr.caplen);
+ #if defined(PCAP_TSTAMP_PRECISION_NANO)
+-	timespec ts =3D { pkthdr.ts.tv_sec, pkthdr.ts.tv_usec }; //because we op=
ened with nano second precision 'tv_usec' is actually nanos
++	timespec ts =3D { pkthdr.ts.tv_sec, static_cast<long>(pkthdr.ts.tv_usec)=
 }; //because we opened with nano second precision 'tv_usec' is actually na=
nos
+ #else
+ 	struct timeval ts =3D pkthdr.ts;
+ #endif
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.b=
b b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
new file mode 100644
index 000000000000..e2a2d104cf7e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "A multiplatform C++ library for capturing, parsing and crafti=
ng of network packets"
+HOMEPAGE =3D "https://pcapplusplus.github.io/"
+BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
+SECTION =3D "libs/network"
+LICENSE =3D "Unlicense"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d695d19=
f"
+
+DEPENDS =3D "libpcap"
+
+PV =3D "git${SRCPV}"
+
+# master branch with hand-crafted build system
+#SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;br=
anch=3Dmaster"
+
+# cmake-ng branch
+SRC_URI =3D " \
+    git://github.com/clementperon/PcapPlusPlus.git;protocol=3Dhttps;branch=
=3Dcmake-ng \
+    file://0001-Fix-timeval-to-timespec-conversions.patch \
+    "
+SRCREV =3D "1360d0ed91640daf90b3713a4574b8b369990bb3"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake dos2unix
+
+# When 'zstd' is not selected, cmake findPackage() finds files from zstd-n=
ative.
+# They are not used, but is there a way to avoid this?
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[zstd] =3D "-DLIGHT_PCAPNG_ZSTD=3Dtrue,-DLIGHT_PCAPNG_ZSTD=3D=
false,zstd"
+
+EXTRA_OECMAKE:append =3D " -DBUILD_SHARED_LIBS=3DON"
+# get rid of "note: parameter passing for argument of type 'xxx' changed i=
n GCC 7.1"
+CXXFLAGS:append =3D " -Wno-psabi"
--=20
2.34.1


