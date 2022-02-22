Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9818FC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 06:41:59 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.113])
 by mx.groups.io with SMTP id smtpd.web10.9916.1645512114370948746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=jYMeY81X;
 spf=pass (domain: arri.de, ip: 40.107.3.113, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiqkm2A6FE7YFEHfxP+NKVfdCjwWGI/l7pUKEGY7uiCE0kcRBKgHhwqxNixTSIM6vUd72HXsVLCZvVp/ZzGXU/z0E3qSs9FxtEGE0DfLkVYMcd2h8UBzFhuDQV57b20iX+zktHYu3sz3yepEkMRyWuOB3CDNlrM8nhMAALYlC3Xmo11jLntU3ZfkzSLE0HJXrp3MUh8jiBWHEzfG0CcZTW6gB6+HR6wLmpYHM3XPXZcZ2WjVg5nSv7AhSw5OuRDmFauw+6CkIv+DQ7E5cq3FPwPsdh+QI+92Gz9mbocXkgFq6aZ9LfsramJgPAuJ3QmIu7I3qnQrtZ11OrXfXmRuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQUPpplcZBGVesCA8JBWA/8HAveCZTkLH2l3mfOKGaU=;
 b=NNi9tQCRMUBj1jZ7EdjxndbsSpivJX0i9X8an5sxlwY0A+CYYr7ddXSifvsxZlWJLk2/Qcxh0ZVbniutzzHI1n12tAnjdP21eLX3RybNR6oVsLaj3l/15R06LuA0nUghPYo9byBx0JZgAaGHoMHLcFhHsKwwrWrU+1CxVLPIWoLg78S5rKjnt+wcYLU+oV1GVB8rONRL3yK0c0Gzp3RyTRxEr2XX8BAgFppAFAGqhoOGWhtLLDgGyhQ4BHH7ntPYWt9vM7rnHo5QO5okQJTeO86o6pV0/lu5doZ8UA/fngnF1aggnrrYwgJxgnYtGcpbRUCmgAfSpVSqm/Bi8PLWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQUPpplcZBGVesCA8JBWA/8HAveCZTkLH2l3mfOKGaU=;
 b=jYMeY81XSqqiDhs0RGEoehZ/C3N+B3VX44RzKg2EZ++6XC82I3txxVeb7TFAiry+Ax+OaXRQXpWtqrHvQCpQm4XbV1rnLnCNvjd9NTfNX6WTeH7F2T70NYXXUi7lCjFJ87PSeC/JJ2VcmUb0Er6wsRW9/O8W5vQj9jpLFXwyM/4=
Received: from SV0P279CA0066.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::17)
 by DB6PR0701MB2389.eurprd07.prod.outlook.com (2603:10a6:4:5c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 06:41:43 +0000
Received: from HE1EUR02FT046.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::3a) by SV0P279CA0066.outlook.office365.com
 (2603:10a6:f10:14::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 22 Feb 2022 06:41:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT046.mail.protection.outlook.com (10.152.11.249) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 06:41:43 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 22 Feb
 2022 07:41:40 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Tue, 22 Feb 2022 07:41:40 +0100
Received: from localhost.de (192.168.54.94) by exmta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 22 Feb 2022 07:41:40
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <peron.clem@gmail.com>, Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH RFC] pcapplusplus: add new recipe
Date: Tue, 22 Feb 2022 07:41:30 +0100
Message-ID: <20220222064130.17190-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.54.94]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb10649-d097-4e66-f7ff-08d9f5ce6388
X-MS-TrafficTypeDiagnostic: DB6PR0701MB2389:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0701MB2389152BF23B79C1D1168AFBBF3B9@DB6PR0701MB2389.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y58I/8+xOzakj04LjoCmhPj5UEaWefNLjCVM3BJcFtG35ipDd77Aa238ZvOjLidPgTe0/J434DO1y7EjOqRtAgqypl54KbFcYByof7CC12DyZ+mWUwxD/1UmyB9f4EaxFDa2VPpbonVN/lGAWyx0r5i4YPoT77+h/eCZcgVgWvn4svmadfgAehAz5iWA0GdIYd72Pyo83ZKOqnIue0PYhqgkZvKM6+BSrGMPtffMEPiJzzxiIhLjX7lWYuzITnb05ziTnxRLhPfqnQ6gOtt7iTmCbm0EY2H19Pww0+8ni+C9ED2J83JjKuZy1VaP2FI4XeVyn+qWSebSC1Lzl+koSlT+Q0nMsrx5oNE+DlQQAfNJaR4yRWNPoZX/J8itc3RC2eZMb6XU+cQ7NxbIX12At1PP5dZkQ4NnE7gPVJqklo500xeiie0FwgDBwdTwXAHJXyF7VB3yyFfSOuw+k08375ra1JlQ50nYNXIXPk0Bpfj1J6xBJksJgQr1X49i4G803vxrPI7dQk74LMRlj32yIntbQc3hP4AC5hQUIml5bPWA0fv0QtH+v+9jFNnFaRA5y7H0ry9d4OLd74dvzaJY01yBad1oTQ44zD1Tkdg6mNTvyuObawcjM1bP3lNotJAV9FXseXF5KQbLZ6K6mf31CIValIgj4EeBIKo/VnrsQbMN0PaISNOw1kNkxoL/m+IfFhjqT++Yqhb8XlobHvZF8fVCPQ1d3fR98A7o6+f8abJMeTozqZfdyfdXHFq/2qRiq7YJmytowg/DebLB4YM6bUWx73HVQdDx2wnZ/G1wV5M=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(356005)(54906003)(426003)(8676002)(4326008)(316002)(6916009)(86362001)(336012)(186003)(26005)(1076003)(81166007)(70206006)(70586007)(82310400004)(16526019)(2616005)(66574015)(47076005)(83380400001)(508600001)(5660300002)(36756003)(36860700001)(6666004)(2906002)(107886003)(8936002)(21314003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 06:41:43.0843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8bb10649-d097-4e66-f7ff-08d9f5ce6388
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT046.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2389
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 06:41:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95439

"A multiplatform C++ library for capturing, parsing and crafting of
network packets"

PcapPlusPlus uses as custom build system (shell script + Makefile).
There were attempts for using cmake but this work has never been
finished.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
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
index 000000000000..548a0f0ca0e2
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
+Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/81=
4]
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
+ 	// create the timeout=0D
+ 	timespec timeout =3D {=0D
+ 			now.tv_sec + arpTimeout,=0D
+-			now.tv_usec=0D
++			static_cast<long>(now.tv_usec * 1000)=0D
+ 	};=0D
+ =0D
+ 	// start capturing. The capture is done on another thread, hence "arpPac=
ketRecieved" is running on that thread=0D
+@@ -436,7 +436,7 @@ IPv4Address NetworkUtils::getIPv4Address(std::string h=
ostname, PcapLiveDevice* d
+ 	// create the timeout=0D
+ 	timespec timeout =3D {=0D
+ 			now.tv_sec + dnsTimeout,=0D
+-			now.tv_usec=0D
++			static_cast<long>(now.tv_usec * 1000)=0D
+ 	};=0D
+ =0D
+ 	// start capturing. The capture is done on another thread, hence "dnsRes=
ponseRecieved" is running on that thread=0D
+diff --git a/Pcap++/src/PcapFileDevice.cpp b/Pcap++/src/PcapFileDevice.cpp
+index 6bf04c1dd31a..256554407c50 100644
+--- a/Pcap++/src/PcapFileDevice.cpp
++++ b/Pcap++/src/PcapFileDevice.cpp
+@@ -188,7 +188,7 @@ bool PcapFileReaderDevice::getNextPacket(RawPacket& ra=
wPacket)
+ 	uint8_t* pMyPacketData =3D new uint8_t[pkthdr.caplen];=0D
+ 	memcpy(pMyPacketData, pPacketData, pkthdr.caplen);=0D
+ #if defined(PCAP_TSTAMP_PRECISION_NANO)=0D
+-	timespec ts =3D { pkthdr.ts.tv_sec, pkthdr.ts.tv_usec }; //because we op=
ened with nano second precision 'tv_usec' is actually nanos=0D
++	timespec ts =3D { pkthdr.ts.tv_sec, static_cast<long>(pkthdr.ts.tv_usec)=
 }; //because we opened with nano second precision 'tv_usec' is actually na=
nos=0D
+ #else=0D
+ 	struct timeval ts =3D pkthdr.ts;=0D
+ #endif=0D
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.b=
b b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
new file mode 100644
index 000000000000..c9cf5adb974f
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
+inherit cmake
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


