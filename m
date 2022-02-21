Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7203EC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 17:43:14 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.135])
 by mx.groups.io with SMTP id smtpd.web10.1901.1645465390920218484
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=hfSTkFrb;
 spf=pass (domain: arri.de, ip: 40.107.5.135, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtjR7JjAU9Q3jcynyXS2tYR14nU73FvQSFsplXMj7mcaAwhz4Y3OlziyWyt9O1wgCXdnA7+a5wcw14TzPO3lN3ebjJhERVeBxVLKeOKJIgPqsqW2TU7ADV1BLvtHHLqpWSlDHMcmxI0/GzTR6fZUM+o/oOf4YbYMiJwepG6yRb8aF+xgja5Umn4L/guSvrW6Ld7cS9eAZD/rufizQdlM4dAKPWNlQOfq7i84Z974BO3WprlOZ12prlgMoiPIVXZgpnQKZdlBAGvRUQgq6soKXmDLiyx1wtJWB19hDesbAwsjprUbtdxWQDWFHOWshHu4Kz5U4nmyiaSWSnHF+earAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRfcpIsmvjRTsofleibxaneoZqMZyNWrDak+aFiU1gA=;
 b=BtCaKYV2fK9KX3dB6K1wzmmwmK4PwY15tyl+g3U0xdYI2zf/quHlh/QNTSZTQCg57TiAGFZRn4hyG1MLl4BXzBTq4lcMj3RgXViUotTPeU5fF3FQV9ggL9WBLy/2Z3D7cuG8RywqJPxforSTpI9yJ8JMeAG4JD71JY+fStBu2NGCBu5fcDkDosAt6qPEiKJ+tGHBhz/VzGP7xoHEVXIpuJE1gddKi5/mbF0fXKb+tU9Lzjn7k8VRrZzyNWkJgJ1fKe4uiSXQ5p2HNDlIUHju5ppTgFmW8ZuMzNMjvJMpXg7SjnmZ+IHW1s8uv2RCN/NnnRoSeIICwpehxS7YbC8QXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRfcpIsmvjRTsofleibxaneoZqMZyNWrDak+aFiU1gA=;
 b=hfSTkFrbrR1iGUKyUq/sn6hA55JbFZjSbAf+LWqEjVO2pqjIfhBLHT4oa+VNW4OjfMNkoifUsCc+ZnfWDJQtpQhi8c+f0q7zhTvhIRV+KVlEwk54eWlTQfv9tUWA4nR88stjBZL22igeerPc7SH4EZtGTZdER27/s0pWOZvLTdM=
Received: from AM5PR0601CA0029.eurprd06.prod.outlook.com
 (2603:10a6:203:68::15) by VI1PR0701MB2878.eurprd07.prod.outlook.com
 (2603:10a6:800:85::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 17:43:06 +0000
Received: from VE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::4a) by AM5PR0601CA0029.outlook.office365.com
 (2603:10a6:203:68::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Mon, 21 Feb 2022 17:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 VE1EUR02FT063.mail.protection.outlook.com (10.152.13.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4995.20 via Frontend Transport; Mon, 21 Feb 2022 17:43:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.54)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Mon, 21 Feb 2022 17:43:05 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 11115444
X-ExclaimerImprintLatency: 2602285
X-ExclaimerImprintAction: 0c59e10116d24f1088a914b8d1ae6ecc
Content-Type: multipart/related;
	boundary="----_=_NextPart_596275f0-b86f-444d-8b31-00253ca9b748"
Received: from AS8PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:313::16)
 by PA4PR07MB7165.eurprd07.prod.outlook.com (2603:10a6:102:fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.7; Mon, 21 Feb
 2022 17:43:02 +0000
Received: from AM5EUR02FT052.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::67) by AS8PR04CA0071.outlook.office365.com
 (2603:10a6:20b:313::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Mon, 21 Feb 2022 17:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT052.mail.protection.outlook.com (10.152.9.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Mon, 21 Feb 2022 17:43:01 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 21 Feb
 2022 18:43:01 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 21 Feb 2022 18:43:01 +0100
Received: from localhost.de (192.168.54.110) by exmta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 21 Feb
 2022 18:43:01 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <peron.clem@gmail.com>, Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][RFC PATCH] pcapplusplus: add new recipe
Date: Mon, 21 Feb 2022 18:42:42 +0100
Message-ID: <20220221174242.17760-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [192.168.54.110]
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 1b3d72e3-7f7e-4ae4-35a1-08d9f5619d8d
X-MS-TrafficTypeDiagnostic: 
	PA4PR07MB7165:EE_|VE1EUR02FT063:EE_|VI1PR0701MB2878:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0701MB28781EA8EBBBEED8AEB83464BF3A9@VI1PR0701MB2878.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7n4QTxUAcqCdxHWO/Ujs2kwdELPGEecvXLJofPdDJcRDpDK4VvBHXo7S0N8A63Yfinbj62A56xvYiLqyX/fjQBCqeaXVghCN60ix+ZUICdVxgtLqb7Vd1+Pj5XqCy/nItAtTrQZE1cQikilYjvDD1mh2xCoAhldir/9K8E8ygRAXObIGH71qaU57DGF+kO2NIVZfSIgxxiFDYuFrWS+PBKEic0ZCCYXLvvmQOhsjrcVdelh6u224tk8YV2F0sq73wjM4Zvrw6uesiKJKd6G5DYbpCkb4j+cWI3mxGoUYEn/8UnvtqACeaTxA3jrcV6ItCvuCpG2JSnBvsjMqFV+6GFEWDLaGBIrduo1+obqqqXkBHz7G8+DODltJudp6WhDekD3D65NJW0DD/xNHcM98mD4OCVPD8hAWgNab8a3RHp2VWA2Rospj06afqdQLIs8SZwPw5UaWo1n6Y1Ku4zpnGYtsErU8FXd0nymknv5mmKm+Dh2ZT6Q0qveatdetKirELaFOCKec8AT+dBc/pRYuz3FCfYk096BKSVUycnCT9foAKTSawrDBjejaucQbTYSXqkYPcpsEmQeIIBqsCAMeSTxMvP7jlAtTQ0dAI1KVaxjwLrUG4k4qR0LulZi+3NH+r4hX6P1tkJoYe34gfeg3TG0bBnzLvoo2rqitFQN7MjD8tf1lXS5o/Li1+F/pL40SQrJFyiW5q2+vS1u5tA1GNAESC+LK4mFcpUO9BN4tqNHC0JQfe+rkYH7krtJpIuXUHWg34NFU8pE1ESnTNJwlbnKoGrZyXrXxbKzEWRAH2AQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(4326008)(426003)(47076005)(66574015)(336012)(83380400001)(36756003)(40460700003)(5660300002)(2906002)(8936002)(26005)(107886003)(36860700001)(1076003)(6916009)(2616005)(16526019)(186003)(70206006)(70586007)(81166007)(356005)(86362001)(8676002)(316002)(508600001)(54906003)(82310400004)(6666004)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7165
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4fddbfe0-27cc-493c-a02c-08d9f5619b88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	znqKZx8QwYoYsJL+AJGraA5WNWz84+eZkkv4O+pXk/reE3dr8hOBI+x0dNvIpgyIRf/0gQmsO6ScnNJQjDjwP1XcXx7SJzdw0Ah34uMLDHaljBd0wqcqw4zEwxlyIAXGyivcMH50sJPSWSF7LeOFlGL1NJbUrfS8sEomW5G4+pmdl9or5471Sx7l+8tLAeCinnTsnwKNLP+ehT6VP4IWBGH1PVCJCPyo5DucZ0Xvm0OGKvfBw89y6H0+ZtU8izdn+bDGZsLCWvcfRV4agSf6a/Breo70pCPu71hwwJ90q8RFE/5/im31rCketFoy/pMC/7wr8riDt/jiUORHvBMNaHgCOGo7zNeLY/4fpDL2XK5RgB0JHyP21w83pV4usx9ZyaWfzApCe1wS/eumHd+KZCEXv7wr+zqjoQhg46XD/0rXU0a+6AfvEUeULNidMcWHMySrGRtISYeSFERtAFGm7vZbHdRh2Sf3eE4qOKw8bAmdtZMHkftFoKGd3vNOddoblMc7JI01mdgm9G/53NBCHEKq0QH6qLvFPiCEiVT6ctCOyS9LrpOmaT1gwPIcKfcXo/lBYydPcJOu3fRgJYAcL3CG8awnYlK28ty3YS9YE46pPg0iD9On1x7u2N6XPQDEVvcA+M7eOwPkqsjvTiY7oLouCkJWoFPGzNwQgNfVQIu6Z59B7Lx0IZAu7RQYJlnAfRrfdKVxaoNsWUYxqHowrBWiuWKn7f4enI9a3DPsdH30zeOjXfP9GQKlsgG3au96c91NmPo/zeH3GvLrTSEcA5B4ZuoYK747ufMaOwhmlCIjmrJnM/eD2O11VxwEQst19dMNEkhflQPvprty1Xs0OQ==
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(107886003)(316002)(7066003)(86362001)(426003)(336012)(6916009)(30864003)(40460700003)(2616005)(82310400004)(66574015)(1076003)(33964004)(6666004)(16526019)(508600001)(5660300002)(186003)(83380400001)(26005)(36756003)(7636003)(166002)(54906003)(4326008)(8936002)(70586007)(70206006)(47076005)(15974865002)(8676002)(7596003)(36860700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 17:43:04.7608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b3d72e3-7f7e-4ae4-35a1-08d9f5619d8d
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2878
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 17:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95421

This is a multi-part message in MIME format.

------_=_NextPart_596275f0-b86f-444d-8b31-00253ca9b748
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_ace03a32-cb79-4bc0-ad86-fbf1b609d7b0"

------_=_NextPart_ace03a32-cb79-4bc0-ad86-fbf1b609d7b0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

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

This is the 2nd attempt to move the build system of PcapPlusPlus to
CMake. Currently there is a QA issue when trying to build a shared
libraries.

 ...-Fix-timeval-to-timespec-conversions.patch | 58 +++++++++++++++++++
 .../pcapplusplus/pcapplusplus_21.11.bb        | 38 ++++++++++++
 2 files changed, 96 insertions(+)
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
+
_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B
Get all the latest information from www.arri.com, Facebook, Twitter, Instag=
ram and YouTube.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler

=E2=80=8B
From: Christian Eggers <ceggers@arri.de>
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
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.b=
b b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
new file mode 100644
index 000000000000..d7b88dfe2ef7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
@@ -0,0 +1,38 @@
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
+SRCREV =3D "1525e592596a1f38470488cbacb0d10f2cde5603"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+# When 'zstd' is not selected, cmake findPackage() finds files from zstd-n=
ative.
+# They are not used, but is there a way to avoid this?
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[zstd] =3D "-DLIGHT_PCAPNG_ZSTD=3Dtrue,-DLIGHT_PCAPNG_ZSTD=
=3Dfalse,zstd"
+
+# ERROR: pcapplusplus-gitAUTOINC+1525e59259-r0 do_package_qa: QA Issue:
+# -dev package pcapplusplus-dev contains non-symlink .so '/usr/lib/libpack=
et++.so'
+# -dev package pcapplusplus-dev contains non-symlink .so '/usr/lib/libpcap=
++.so'
+# -dev package pcapplusplus-dev contains non-symlink .so '/usr/lib/libcomm=
on++.so' [dev-elf]
+#EXTRA_OECMAKE:append =3D "-DBUILD_SHARED_LIBS=3Don"
+
+# main package is empty
+ALLOW_EMPTY:${PN} =3D "1"
-- 
2.34.1


------_=_NextPart_ace03a32-cb79-4bc0-ad86-fbf1b609d7b0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>&quot;A multiplatform C++ library for capturi=
ng, parsing and crafting of<br />network packets&quot;<br /><br />PcapPlusP=
lus uses as custom build system (shell script + Makefile).<br />There were =
attempts for using cmake but this work has never been<br />finished.<br /><=
br />Signed-off-by: Christian Eggers &lt;ceggers@arri.de&gt;<br />---<br />=
v1 --&gt; RFC:<br />------------<br />- move to Cl&#233;ment P&#233;ron&#39=
;s fork [branch: cmake-ng]<br />- change recipe to cmake<br />- add patch f=
or -Wnarrowing warnings/errors<br /><br />This is the 2nd attempt to move t=
he build system of PcapPlusPlus to<br />CMake. Currently there is a QA issu=
e when trying to build a shared<br />libraries.<br /><br /> ...-Fix-timeval=
-to-timespec-conversions.patch | 58 +++++++++++++++++++<br /> .../pcapplusp=
lus/pcapplusplus_21.11.bb        | 38 ++++++++++++<br /> 2 files changed, 9=
6 insertions(+)<br /> create mode 100644 meta-oe/recipes-connectivity/pcapp=
lusplus/pcapplusplus/0001-Fix-timeval-to-timespec-conversions.patch<br /> c=
reate mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21=
=2E11.bb<br /><br />diff --git a/meta-oe/recipes-connectivity/pcapplusplus/=
pcapplusplus/0001-Fix-timeval-to-timespec-conversions.patch b/meta-oe/recip=
es-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval-to-timespec-conv=
ersions.patch<br />new file mode 100644<br />index 000000000000..548a0f0ca0=
e2<br />--- /dev/null<br />+++ b/meta-oe/recipes-connectivity/pcapplusplus/=
pcapplusplus/0001-Fix-timeval-to-timespec-conversions.patch<br />@@ -0,0 +1=
,58 @@<br />+From 740971bb451e1147e19a1b0498436d2332b01293 Mon Sep 17 00:00=
:00 2001<br />+<div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webk=
it-text-size-adjust:100%;direction:ltr;"><table cellpadding=3D"0" cellspaci=
ng=3D"0" border=3D"0" style=3D"width:100%;"><tr style=3D"font-size:0;"><td =
align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"=
><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-size:0;">=
<tr style=3D"font-size:14.67px;color:#7F7F7F;font-style:normal;font-weight:=
400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:top;fon=
t-family:Calibri,Arial,sans-serif;">_______________________________________=
________________<span style=3D"font-family:remialcxesans;font-size:1px;colo=
r:#FFFFFF;line-height:1px;">&#8203;</span></td></tr><tr style=3D"font-size:=
0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"=
0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-=
size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpaddin=
g=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;f=
ont-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-siz=
e:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Cali=
bri,Arial,sans-serif;">Christian</td><td align=3D"left" style=3D"vertical-a=
lign:top;color:#000001;font-family:Calibri,Arial,sans-serif;">&nbsp;<br /><=
/td><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Aria=
l,sans-serif;">Eggers</td></tr></table></td></tr><tr style=3D"font-size:0;"=
><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" =
cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-styl=
e:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67p=
x;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Aria=
l,sans-serif;">Software&nbsp;Engineer</td></tr><tr style=3D"font-size:14.67=
px;color:#000001;"><td align=3D"left" style=3D"vertical-align:top;font-fami=
ly:Calibri,Arial,sans-serif;">&#8203;</td></tr></table></td></tr></table></=
td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-ali=
gn:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"f=
ont-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertica=
l-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0;color:#0E50AD;font-style:normal;font-weight:400;white-space=
:nowrap;"><tr style=3D"font-size:13.33px;"><td align=3D"left" style=3D"vert=
ical-align:top;font-family:&#39;Arial Black&#39;;">ARRI</td></tr><tr style=
=3D"font-size:10.67px;color:#7F7F7F;"><td align=3D"left" style=3D"vertical-=
align:top;font-family:Arial;"><span style=3D"font-size:11px;">Arnold&nbsp;&=
amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp=
;Betriebs&nbsp;KG</span>&nbsp;<br /></td></tr></table></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:=
#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=
=3D"font-size:10.67px;"><td align=3D"left" style=3D"vertical-align:top;font=
-family:Arial;">Arriweg&nbsp;17</td><td align=3D"left" style=3D"vertical-al=
ign:top;font-family:Arial;">,&nbsp;<br /></td><td align=3D"left" style=3D"v=
ertical-align:middle;font-family:Arial;">83071</td><td align=3D"left" style=
=3D"vertical-align:middle;font-family:Arial;">&nbsp;<br /></td><td align=
=3D"left" style=3D"vertical-align:middle;font-family:Arial;">Stephanskirche=
n</td></tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;"><=
td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" ce=
llspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:=
0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"=
0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#1532B9;font-s=
tyle:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:11p=
x;"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;"><spa=
n style=3D"text-decoration:underline;"><a href=3D"http://www.arri.com/" tar=
get=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:=
#1532B9;"><strong style=3D"font-weight:400;">www.arri.com&nbsp;<br /><br />=
</strong></a></span></td></tr><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"font-size:0;color:#858080;font-style:normal;font-weigh=
t:400;line-height:normal;white-space:nowrap;"><tr style=3D"font-size:14.67p=
x;"><td align=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;">=
<img src=3D"cid:image133231.png@7C741948.2A15F35B" width=3D"20" border=3D"0=
" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" =
/></td><td align=3D"left" style=3D"padding:0;vertical-align:top;font-family=
:Calibri,Arial,sans-serif;"><a href=3D"tel:+49%208036%203009-3118" target=
=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;=
"><strong style=3D"font-weight:400;">+49&nbsp;8036&nbsp;3009-3118</strong><=
/a></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding=
:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vertical=
-align:top;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"padding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding=
:0;vertical-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td alig=
n=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"=
cid:image118770.png@136ED042.90DC7691" width=3D"20" border=3D"0" alt=3D"" s=
tyle=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Ari=
al,sans-serif;"><a href=3D"mailto:CEggers@arri.de" target=3D"_blank" id=3D"=
LPlnk689713" style=3D"text-decoration:none;color:#858080;"><strong style=
=3D"font-weight:400;">CEggers@arri.de</strong></a></td></tr></table></td></=
tr></table></td></tr></table></td></tr><tr style=3D"font-size:14.67px;color=
:#000001;font-style:normal;font-weight:400;white-space:nowrap;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;=
"><br />&#8203;</td></tr></table></td></tr><tr style=3D"font-size:0;line-he=
ight:normal;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><a=
 href=3D"https://www.arri.com/en/lighting/led/orbiter-accessories/orbiter-d=
ockingring/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:=
none;"><img src=3D"https://assets.arri.com/media/sign/2022_Orbiter_Docking-=
Ring_E-mail-Signature_650x95.jpg" border=3D"0" title=3D"Orbiter Docking Rin=
g" alt=3D"Orbiter Docking Ring" style=3D"font-size:12px;" /></a></td></tr><=
tr style=3D"font-size:13px;color:#7F7F7F;font-style:normal;font-weight:400;=
white-space:nowrap;"><td align=3D"left" style=3D"padding:0;vertical-align:t=
op;font-family:Calibri,Arial,sans-serif;">Get&nbsp;all&nbsp;the&nbsp;latest=
&nbsp;information&nbsp;from&nbsp;<span style=3D"text-decoration:underline;"=
><a href=3D"http://www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" titl=
e=3D"www.arri.com" style=3D"text-decoration:underline;color:#7F7F7F;"><stro=
ng style=3D"font-weight:400;">www.arri.com</strong></a></span>,&nbsp;<span =
style=3D"text-decoration:underline;"><a href=3D"https://www.facebook.com/Te=
amARRI" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:under=
line;color:#7F7F7F;"><strong style=3D"font-weight:400;">Facebook</strong></=
a></span>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"https=
://twitter.com/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" style=3D"t=
ext-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:400;"=
>Twitter</strong></a></span>,&nbsp;<span style=3D"text-decoration:underline=
;"><a href=3D"http://instagram.com/arri" target=3D"_blank" id=3D"LPlnk68971=
3" style=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font=
-weight:400;">Instagram</strong></a></span>&nbsp;and&nbsp;<span style=3D"te=
xt-decoration:underline;"><a href=3D"http://www.youtube.com/user/ARRIChanne=
l" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;=
color:#7F7F7F;"><strong style=3D"font-weight:400;">YouTube</strong></a></sp=
an>.<br /></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"=
padding:0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"font-size:0;color:#6A6A6A;font-style:normal;font-weigh=
t:400;white-space:nowrap;"><tr style=3D"font-size:10px;"><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Arial;"><br />Arnold&nbsp;&amp;&nb=
sp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betrie=
bs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht=
:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternum=
mer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellsch=
after:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH=
<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amt=
sgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;=
HRB&nbsp;54477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;N=
euh&#228;user;&nbsp;Stephan&nbsp;Schenk;&nbsp;Walter&nbsp;Trauninger;&nbsp;=
Markus&nbsp;Zeiler<br /></td></tr><tr style=3D"font-size:14.67px;color:#000=
001;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Ar=
ial,sans-serif;"><br />&#8203;<br /></td></tr></table></td></tr></table></t=
d></tr></table></div>From: Christian Eggers &lt;ceggers@arri.de&gt;<br />+D=
ate: Mon, 21 Feb 2022 13:53:49 +0100<br />+Subject: [PATCH] Fix timeval-to-=
timespec conversions<br />+<br />+Time values returned by gettimeofday() ha=
ve microseconds in<br />+timeval::tv_usec while timespec::ts_nsec is nanose=
conds.<br />+<br />+timeval::tv_usec is 64 bit (at least on some platforms)=
, while<br />+timespec::tv_nsec is always &#39;long&#39;. An explicit cast =
is required to<br />+avoid -Wnarrowing warnings/errors.<br />+<br />+Upstre=
am-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/814]<br /=
>+<br />+Signed-off-by: Christian Eggers &lt;ceggers@arri.de&gt;<br />+---<=
br />+ Pcap++/src/NetworkUtils.cpp   | 4 ++--<br />+ Pcap++/src/PcapFileDev=
ice.cpp | 2 +-<br />+ 2 files changed, 3 insertions(+), 3 deletions(-)<br /=
>+<br />+diff --git a/Pcap++/src/NetworkUtils.cpp b/Pcap++/src/NetworkUtils=
=2Ecpp<br />+index bdbf87f4c380..749853927ecd 100644<br />+--- a/Pcap++/src=
/NetworkUtils.cpp<br />++++ b/Pcap++/src/NetworkUtils.cpp<br />+@@ -169,7 +=
169,7 @@ MacAddress NetworkUtils::getMacAddress(IPv4Address ipAddr, PcapLiv=
eDevice* devic<br />+ 	// create the timeout=0D<br />+ 	timespec timeout =
=3D {=0D<br />+ 			now.tv_sec + arpTimeout,=0D<br />+-			now.tv_usec=0D<br =
/>++			static_cast&lt;long&gt;(now.tv_usec * 1000)=0D<br />+ 	};=0D<br />+ =
=0D<br />+ 	// start capturing. The capture is done on another thread, henc=
e &quot;arpPacketRecieved&quot; is running on that thread=0D<br />+@@ -436,=
7 +436,7 @@ IPv4Address NetworkUtils::getIPv4Address(std::string hostname, =
PcapLiveDevice* d<br />+ 	// create the timeout=0D<br />+ 	timespec timeout=
 =3D {=0D<br />+ 			now.tv_sec + dnsTimeout,=0D<br />+-			now.tv_usec=0D<br=
 />++			static_cast&lt;long&gt;(now.tv_usec * 1000)=0D<br />+ 	};=0D<br />+=
 =0D<br />+ 	// start capturing. The capture is done on another thread, hen=
ce &quot;dnsResponseRecieved&quot; is running on that thread=0D<br />+diff =
--git a/Pcap++/src/PcapFileDevice.cpp b/Pcap++/src/PcapFileDevice.cpp<br />=
+index 6bf04c1dd31a..256554407c50 100644<br />+--- a/Pcap++/src/PcapFileDev=
ice.cpp<br />++++ b/Pcap++/src/PcapFileDevice.cpp<br />+@@ -188,7 +188,7 @@=
 bool PcapFileReaderDevice::getNextPacket(RawPacket&amp; rawPacket)<br />+ =
	uint8_t* pMyPacketData =3D new uint8_t[pkthdr.caplen];=0D<br />+ 	memcpy(p=
MyPacketData, pPacketData, pkthdr.caplen);=0D<br />+ #if defined(PCAP_TSTAM=
P_PRECISION_NANO)=0D<br />+-	timespec ts =3D { pkthdr.ts.tv_sec, pkthdr.ts.=
tv_usec }; //because we opened with nano second precision &#39;tv_usec&#39;=
 is actually nanos=0D<br />++	timespec ts =3D { pkthdr.ts.tv_sec, static_ca=
st&lt;long&gt;(pkthdr.ts.tv_usec) }; //because we opened with nano second p=
recision &#39;tv_usec&#39; is actually nanos=0D<br />+ #else=0D<br />+ 	str=
uct timeval ts =3D pkthdr.ts;=0D<br />+ #endif=0D<br />+-- <br />+2.34.1<br=
 />+<br />diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcappluspl=
us_21.11.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.=
bb<br />new file mode 100644<br />index 000000000000..d7b88dfe2ef7<br />---=
 /dev/null<br />+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplu=
s_21.11.bb<br />@@ -0,0 +1,38 @@<br />+SUMMARY =3D &quot;A multiplatform C+=
+ library for capturing, parsing and crafting of network packets&quot;<br /=
>+HOMEPAGE =3D &quot;https://pcapplusplus.github.io/&quot;<br />+BUGTRACKER=
 =3D &quot;https://github.com/seladb/PcapPlusPlus/issues&quot;<br />+SECTIO=
N =3D &quot;libs/network&quot;<br />+LICENSE =3D &quot;Unlicense&quot;<br /=
>+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D911690f51af322440237a253d=
695d19f&quot;<br />+<br />+DEPENDS =3D &quot;libpcap&quot;<br />+<br />+PV =
=3D &quot;git${SRCPV}&quot;<br />+<br />+# master branch with hand-crafted =
build system<br />+#SRC_URI =3D &quot;git://github.com/seladb/PcapPlusPlus.=
git;protocol=3Dhttps;branch=3Dmaster&quot;<br />+<br />+# cmake-ng branch<b=
r />+SRC_URI =3D &quot; \<br />+    git://github.com/clementperon/PcapPlusP=
lus.git;protocol=3Dhttps;branch=3Dcmake-ng \<br />+    file://0001-Fix-time=
val-to-timespec-conversions.patch \<br />+    &quot;<br />+SRCREV =3D &quot=
;1525e592596a1f38470488cbacb0d10f2cde5603&quot;<br />+<br />+S =3D &quot;${=
WORKDIR}/git&quot;<br />+<br />+inherit cmake<br />+<br />+# When &#39;zstd=
&#39; is not selected, cmake findPackage() finds files from zstd-native.<br=
 />+# They are not used, but is there a way to avoid this?<br />+PACKAGECON=
FIG ??=3D &quot;&quot;<br />+PACKAGECONFIG[zstd] =3D &quot;-DLIGHT_PCAPNG_Z=
STD=3Dtrue,-DLIGHT_PCAPNG_ZSTD=3Dfalse,zstd&quot;<br />+<br />+# ERROR: pca=
pplusplus-gitAUTOINC+1525e59259-r0 do_package_qa: QA Issue:<br />+# -dev pa=
ckage pcapplusplus-dev contains non-symlink .so &#39;/usr/lib/libpacket++.s=
o&#39;<br />+# -dev package pcapplusplus-dev contains non-symlink .so &#39;=
/usr/lib/libpcap++.so&#39;<br />+# -dev package pcapplusplus-dev contains n=
on-symlink .so &#39;/usr/lib/libcommon++.so&#39; [dev-elf]<br />+#EXTRA_OEC=
MAKE:append =3D &quot;-DBUILD_SHARED_LIBS=3Don&quot;<br />+<br />+# main pa=
ckage is empty<br />+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br />-- <br />2.34=
=2E1<br /><br /></div></body></html>
------_=_NextPart_ace03a32-cb79-4bc0-ad86-fbf1b609d7b0--

------_=_NextPart_596275f0-b86f-444d-8b31-00253ca9b748
Content-Type: image/png;
	name="image133231.png"
Content-Transfer-Encoding: base64
Content-ID: <image133231.png@7C741948.2A15F35B>
Content-Description: image133231.png
Content-Disposition: inline;
	creation-date="Mon, 21 Feb 2022 17:43:05 +0000";
	filename=image133231.png;
	modification-date="Mon, 21 Feb 2022 17:43:05 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_596275f0-b86f-444d-8b31-00253ca9b748
Content-Type: image/png;
	name="image118770.png"
Content-Transfer-Encoding: base64
Content-ID: <image118770.png@136ED042.90DC7691>
Content-Description: image118770.png
Content-Disposition: inline;
	creation-date="Mon, 21 Feb 2022 17:43:05 +0000";
	filename=image118770.png;
	modification-date="Mon, 21 Feb 2022 17:43:05 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_596275f0-b86f-444d-8b31-00253ca9b748--

