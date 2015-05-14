Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0135.outbound.protection.outlook.com [157.56.110.135])
	by mail.openembedded.org (Postfix) with ESMTP id CA1A27402C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 02:31:57 +0000 (UTC)
Received: from DM2PR03CA0044.namprd03.prod.outlook.com (10.141.96.43) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.160.10; Thu, 14 May 2015 02:31:56 +0000
Received: from BN1BFFO11FD027.protection.gbl (2a01:111:f400:7c10::1:134) by
	DM2PR03CA0044.outlook.office365.com (2a01:111:e400:2428::43) with
	Microsoft SMTP Server (TLS) id 15.1.160.16 via Frontend Transport;
	Thu, 14 May 2015 02:31:56 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD027.mail.protection.outlook.com (10.58.144.90) with
	Microsoft SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Thu, 14 May 2015 02:31:55 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t4E2VqST010563;
	Wed, 13 May 2015 19:31:53 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 May 2015 10:31:50 +0800
Message-ID: <1431570710-10784-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD027;
	1:ZEgkifl3Mgyk9V4Q8xxAmccVd+h7O37Yq6FS1HzNxLtSl8YcfgX588wiUMdSt4FVzkn2pxGEvK92QyHfYaeLF9+j4avtkAKyADoAVBx0i/RQjVmwLsn2fxdZ+55JRctao99XhFlg5/4zwOV+bIkW62XDxNslNF+fmjOzjws/2dw6cfSTy2oEzm0l1OHoNiW1ECq7CR6Zh3fSdKw9pmakmYOYkxvfrZxyIX3Xk1hwAZdm85NDaoR6qXwRsHse8SKk/+0gePE4UFIIflu8CJ2xVGDrIeQpR5h21b3Od5NXjuT5O9sbYoqW6TYGAezyBdl4aLF/HyIl2Tv6RM4hsQzd1A==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(106466001)(77096005)(15975445007)(104016003)(62966003)(77156002)(450100001)(48376002)(110136002)(33646002)(50466002)(19580405001)(19580395003)(5001960100002)(107886002)(36756003)(2351001)(92566002)(189998001)(229853001)(85426001)(87936001)(50226001)(86152002)(50986999)(47776003)(575784001)(86362001)(46102003)(105606002)(6806004)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB441;
	2:8AH/6407fxMk27CD9SpP00zfEJoB+oxRVq4TxJBLLPqLXjKhzf36rO0xB/86OPHD;
	2:iToqrPitUQbnzepS+4z+/tyrgZM+G/BlIHhHw0c4pz2/cHYF+I2nxT861lUmBTBBvbsHE74x3+rxchLOO775WKb4jGSR0QAuR4iSUjTF48sSyVlSYZRKaBAd2Puh47ApnGUroI7MSxKFtTBpLEe6Uqe9KXxvNuxwn4YoUt2Ub98ZBaSWRzSaz5N0+fSiyvV8wcbUDq/K28aGf4d03GcjAS/fjAYbbkln1gvhBXDXabs=;
	6:RjT/+Db9CtEm/GYGyHKo8x4GQjAtYfwrYXbHdTgvxBVgUKE5YeAfjIp1zyKiJpcpwwUJzvUiyc9n4jcrharHufsj4R8eJXH2lFYBK0Prq+fYP6YhblOBrEEgUrDzHkzr1XWBYKGewuykX7YGFb2CAWXTg6UuO+NVr4WyQBtWSw000RsxFvPXxl+troI7dhrc/d5/SekGElfWsb3ZKr+b/i6vlqsUvCneHvMi7E4VwsFMrdKvUshfSX/aFKLAJdu1U7YqGjcLmdIld8x2L/VzFEDv+QsBLT8wLQ8Bh29SExQ/x5bbWXb7xmp/+wvr/61ljGbeqQuO8/U7xc9ESIPPYA==;
	3:dCMTn0YPbVwe/zzThbt6e2B/bRdBY5hcCDaHmG5wtBe4iNrQiQtZUneu/C4NVrA9G78NIdGywGC/iyrTpRjZhkckEaypBz2ND450fOLehDu6CnfqKBbQXhMkC8OJYIsLo1+czGuwyxqOK0uFdH6s3gGPELL9sBM95zofoCC1nLs8ioqd4Jse6RbG/BZDsux8B80E4KXfMLxJPaegx4+I70Hi/FgMQSEC9RgDsldDBaGyifng0hP+Z1n7AEaBNv9InYsTq7WOsFCMgDemrY4rBbINiu9m0aM6IFRsJLdp6Zc=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
X-Microsoft-Antispam-PRVS: <BY2PR03MB441798DB0207C0A147CC64784D80@BY2PR03MB441.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY2PR03MB441; BCL:0;
	PCL:0; RULEID:; SRVR:BY2PR03MB441; 
X-Forefront-PRVS: 0576145E86
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB441;
	9:d9vdQAaEvHqRxWiVHu9ad6SWeU4BFhBzdr7FUFbWje93xLPGxlyD5jtWUHF0hRjb0n1AbwJf2VDSBPZZU4dru+CMl5b8A88aCfffYxH1ZCuryNEqOg3syCTtXGlHgWQYbL+KaIXrwgnA/AJRjLVZhQXok8zFX7hX07chpGVnlC003wBNrGvXbRfgmk5hWE2Ko2QhM37LN8A2HBYoURaFHTJsTlRZHSEHzCNsAXBz4Ap+G37y5ZAe3Dvzt6HdsczS/oEHgohd2PY7Vjf8Zi0kgLoH4qeQ8L6ZqFPV154jE//Ww1ir2GrF32brotS2RQqE6mesMQiVIJ46htWve63gptBZty5ksBYbZubfZP02ukr/T31q2+lHARGjBk+7TaKzysnkiTqWuSR0t8kLgdgLusHytZTem0URToFHhGL9XB7c50E/vyBKQaI3XlhiZlcThGU2SX/9nifp2q+s0YqmWE+mY3kA+1goeS/DMZ295rlyGyDxLZTgSE9nO/4m4hQfkP8m105WeYgwjmih7EYa0ig5Niczm/eSHTPVBrTQ8oMHr2KdcAdm01K7w06sJXMqQq9Kem4+ViMfV4xMh+96hhXeKyyBaf9eRYvGCU7uaIzYp0nx4JaSa4CHc4ATKvvDNbrRAiC6qzE/q9Lmw7NAoV8UgGif6VrbVbtZjBebafMUWAraKGV/5/LN/HirZPcYUNtURSYdZMDlP26su+eE47zeJONDDcpUONCJyOVQGHcf8UWHorLSOZeAI/HE7a+vRoF4lxcRQkB5GxNygbWl16kNfR0GHbVzPreo4XUAsKCSmvyakbsti1uBV8ziLafqtsdKFgDwjmygAyjrHDHD6HlASCtaQ6d5Db64Gk2vW9hnaMP6s/Ju7zS2TnXJZtLWRnpAzs8m0dMvicdtbRLQa7DfYjj7O3DjAtphB0DXoBcBw/Cqprm944Go1LGD7dSk
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB441;
	3:3fiDLuJpUcA3tu+4x7KrgMzIyPu4N4VxoZSwLReS0lDt0c3J+9t+SZ6jCS5Z1oHI4vfo2k9pB7rl/AyFK2zhHCM5OA14KVBgoYuxPQa3/e4G3Ylg42jpBc7ezhl9vFOc8YPvfQ3NiIlcxfO98d7G7g==;
	10:SBNTBwWASd8kheAdZoqiBawMrdmVHPQMGkBx/hfKM18P2cPpe10L5zGi+S3nC3eiOKZKAeDyddNJ0mYz+GnGxs1Nc8kyeh+QYYUaZ4i3roo=;
	6:JsGKiKdyJ7ii2Sl4goIkzFEpKjft8VGekgC4uHuIV64DFRH67Zi9yBE9f7vjHJTr
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2015 02:31:55.1011 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB441
Subject: [meta-oe][fido][PATCH] polkit: do not hardcode the libdir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 May 2015 02:31:59 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  libdir is defined as ${prefix}/lib/, but we want it to support multilib path

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../polkit/0001-do-not-hardcoded-libdir.patch      | 44 ++++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.112.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
new file mode 100644
index 0000000..e605e30
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
@@ -0,0 +1,44 @@
+From c9e09d9b101109832b1dcb050f0c8b588e276686 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@freescale.com>
+Date: Mon, 4 May 2015 04:11:27 -0500
+Subject: [PATCH] do not hardcoded libdir
+
+Upstream-Status: Pending
+
+libdir is hardcoded to ${prefix}/lib, but we want it to support multilib
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+---
+ polkitagent/Makefile.am   | 2 +-
+ polkitbackend/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/polkitagent/Makefile.am b/src/polkitagent/Makefile.am
+index 3bc364e..7d1ac0e 100644
+--- a/src/polkitagent/Makefile.am
++++ b/src/polkitagent/Makefile.am
+@@ -78,7 +78,7 @@ libpolkit_agent_1_la_LIBADD =                               		\
+ 
+ libpolkit_agent_1_la_LDFLAGS = -export-symbols-regex '(^polkit_.*)'
+ 
+-libprivdir = $(prefix)/lib/polkit-1
++libprivdir = $(libdir)/polkit-1
+ libpriv_PROGRAMS = polkit-agent-helper-1
+ 
+ polkit_agent_helper_1_SOURCES = 					\
+diff --git a/src/polkitbackend/Makefile.am b/src/polkitbackend/Makefile.am
+index 9f430d0..1f7610b 100644
+--- a/src/polkitbackend/Makefile.am
++++ b/src/polkitbackend/Makefile.am
+@@ -67,7 +67,7 @@ rules_DATA = 50-default.rules
+ 
+ # ----------------------------------------------------------------------------------------------------
+ 
+-libprivdir = $(prefix)/lib/polkit-1
++libprivdir = $(libdir)/polkit-1
+ libpriv_PROGRAMS = polkitd
+ 
+ polkitd_SOURCES = 							\
+-- 
+2.3.3
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.112.bb b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
index 72b182b..f20e1a4 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.112.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
@@ -21,6 +21,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
+           file://0001-do-not-hardcoded-libdir.patch \
 "
 
 SRC_URI[md5sum] = "b0f2fa00a55f47c6a5d88e9b73f80127"
-- 
1.9.2


