Return-Path: <ra43240@vinca.am.freescale.net>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0085.outbound.protection.outlook.com [104.47.40.85])
	by mail.openembedded.org (Postfix) with ESMTP id 6233D60720
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 14:55:41 +0000 (UTC)
Received: from BN6PR03CA0047.namprd03.prod.outlook.com (10.175.124.33) by
	DM5PR03MB2443.namprd03.prod.outlook.com (10.168.233.13) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.629.8; Tue, 20 Sep 2016 14:41:13 +0000
Received: from BN1AFFO11FD030.protection.gbl (2a01:111:f400:7c10::144) by
	BN6PR03CA0047.outlook.office365.com (2603:10b6:404:10c::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.609.9 via
	Frontend Transport; Tue, 20 Sep 2016 14:41:13 +0000
Authentication-Results: spf=none (sender IP is 192.88.168.50)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD030.mail.protection.outlook.com (10.58.52.168) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Tue, 20 Sep 2016 14:41:12 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u8KEfC70009545; Tue, 20 Sep 2016 07:41:12 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u8KEcETK017403; Tue, 20 Sep 2016 09:38:14 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u8KEcEDh017402;
	Tue, 20 Sep 2016 09:38:14 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Sep 2016 09:38:07 -0500
Message-ID: <1474382287-17364-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131188560727471518;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(199003)(189002)(189998001)(11100500001)(81166006)(19580405001)(8666005)(8676002)(101416001)(586003)(97736004)(81156014)(305945005)(50986999)(36756003)(42186005)(50466002)(356003)(19580395003)(48376002)(110136003)(8936002)(2906002)(5003940100001)(960300001)(47776003)(7846002)(92566002)(68736007)(50226002)(626004)(230783001)(33646002)(87936001)(229853001)(2351001)(106466001)(4326007)(105586002)(5660300001)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR03MB2443;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None;
	PTR:InfoDomainNonexistent; A:0; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD030;
	1:3jVqUpKInTXb2ALBeiFypVL3QVXqxyH3Hsbl4lpOSNh+DpWsrEh2LNf/sURnKje+/x7NyPqGIu06IZUk5p9X/ymcHdsg8LvBn3wKfzql0EMjZZ0CrquQ865JQn7fcAiQDZnRHM/6AS457LTLkhjk7j/iuPmQX6IVnaQA71ZwT8ONOk2TYoKGrZnAYVQiIwrFBiUdRq1piPCKGGOfG2fPmGqFzIXiokYTWVf05CReD25QUtHKuYmKgQGOtT0MQ/1yRgi9ljJeSbi8FPryOC6M5vFs3BUX9KBxNOAXr1V6PVmVBHkWZAQnhQxa6Y8JHp1kjP5vNMjOy0C38ZPgViixYKWX27IwNd5nWmoNrsqJHDROs/MvuuWeZbp4cJn1yxxhNzrFtuOBrDq0p7mEFA1J6LYVFwIbbMKDQD7XsgO5rRGBgS2exs19O18tFLEfJ4QtsztPoBeSyM9AmRlTB296k+stKlke+FWbidbTXd7CK+UMI9TDZxKxD5sdnpShXBYC2KfKJw+5+5YcHVJZh8gZpvzQ4ML7yfr4VcyjpPkTpJ0jD/w33X191n66DNI1M8VagmMYEt1K2AEB6k58ih2XIe7EYO9F3/B9x3QpgfLXCXFDSxhSs6JS0+aAzRZJTEzchfTEB+S7r2Q35uTVtF+FH3RNErnMPnM48z3IJic+ZZf+UNrWzfwxx0XKBvISALB/ohfv8vEMyrdpQYgz6CwQGm2CN7/7op+GSSsv8SHhjsY=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e5063215-a384-4659-1440-08d3e1642b36
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB2443;
	2:LmL7MmWiYkNjSOlcqxvlWp7k3JEG2P+x4tgLkoDOsDQobv7cAo8/14kViN1Ug70buVOdxulUnrL3PhtlDn3t7WjWAIEOgLjWrf9/xuq/2a3LB7QYS4V0w9M7rryNWbxjukI5gPqylh5q/D8xcjzLhUvP5HbJvP/ENbCGzLUu68CtD+rwu50FZEp3p+Xj0p3d;
	3:kXnVcIOh4vwGymHariPXB10+2SA6YCpvoiQkBb55fMXc6e04mwNkiKZz1jB6mrG2XJMg4fD0+rucS5ba6p6TYBHrj2QMKGiSJsAhO+7JE1tCBIcOMoTY5lPDVIA9fT1kF0HCouwCK2sqetFE5UlMURBa9EV1n2h3B3aoQ9t3Apld6iW70GfBqdBHbBZpdLUmC+aUh7csK75qBpgTxtCbgPiS9q0zQaMIwf72hJ+FgsE=;
	25:Lxknn4c5j7YjEih1Ig+x9Qj5qDkytFYng2e5ppSPJzLPUiDOz3myvVEz41BfZpqS5EO0gckthKxX59kf/7wD1hiIcJJgLHkQlxgHlkdiQa5T6JNhk1oHR2ecR5Zsym+9K8WOXIAAp5gJ4zm865XDxIU6l+gt8l2ee2bBoRWU3a5GDAFIJOecSh1AJ6ONlPSUv56A6Sc0rw64mSOwyd9MR5hYlS1KZJVBSsC21L3SM34SiAwBOHGIn4zG3oSx//AyrgFob5I4f5WxePfAEPv/bETkqxMUwQ3YdcmWbw8JOq8ELtXWrbfuY1/RrtBxMUTxhkIshMAuH4U0Jfo2jwx4YkNdMbgt+4LuU8b4SF8qbRVvoYbrdAuX6i770IRKLU1UFq36eNg1xRMepX9CMsmTfJOrcKTawQAZRGLg1W8rwr8=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM5PR03MB2443;
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB2443;
	31:ys5+ddBQsQrAW01iRZPlFZ5/eVoZB+KOY6EXg/fWKZkKvGzTTB9yhzJQPBnlHddlvsIqUIqjAotkJOOldeUP29VAiGGln/JCTOP00j9kKENrZOYhVNZbz3W1UNcztUVk9z9xD1J/O9xe1QTQF58lz8k+912KlDsl2cZTUrHwR7C5DL5U1nPI+Z0vFJdPGuFvtk97+t5OEG0Zp9ocR2e/ZAJeBKHTHHwXFHBfER04U1s=;
	4:797jZyhvv4Cd0QYhEOnRdxGU2QPxsqC4JiUnVWYckM3UlAZSLeB2hFz9vDyUKMk6ruwriRG6gEKpLbrO8atRn6XE4qNNV4oYNnIZ3EG4YZnY3NhlrItiFzL7bpWrOUprlMoMdyHTzduTg2Onck4uxwP+uRfNZMOryqLLiGmiIhgNfvlECZTyqONZYOYPFSJcxFY1Xpvlez8cCmM6EPt4oNXgk0uzKxho6R4zJQn6H2A5YVjKCA076walZCPvFG70P7D86dRNIHZgsyIw88W4rbuGzyPd6b/US7nV/JrkABKA3N/1jtMwpWpBhsEgJqBrsZBO7mkiVczSxY9I7bDn6tYtfkbEEaASzFUccTXcieZJWpbBI/KMy6yWMhN+uZ4nPO3Apuy70czCboTDRDk0yxwdjcb/iEKYMpFrqEDKdw3R92j+sWt8UuKEB6bdgombNWAX9xFqpx3fCBT4eUMEYc53vvBYyJKhvRDye2eZRzuobv6y1qivsde5xRWvNWbRjLMrCeGJf5cPf5krsG0b2sICrdJH3hvHq+6D+d9o3Xg=
X-Microsoft-Antispam-PRVS: <DM5PR03MB244303BE4A3B8BD51FA14B439AF70@DM5PR03MB2443.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13018025)(13024025)(13017025)(13015025)(13023025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DM5PR03MB2443; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM5PR03MB2443; 
X-Forefront-PRVS: 0071BFA85B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR03MB2443;
	23:4GZyjQhFcXy4b8PVxhkBf0Nb+CmhFQOqvaimb38OZ?=
	=?us-ascii?Q?At1sPQgvjWtY8+vwlf0dRYxz6Y9QYUmzCqLTeOVXKv+FdtG1KQyCg9FEi6TF?=
	=?us-ascii?Q?syfNL3YxO7dIR5THgkPIt0waInJC0CQQQy2H4IPWtl0Y9naYbGo/L/e8TyI2?=
	=?us-ascii?Q?/hqqbjRpvIMqIDusf8Oom9kxupr5UoxyzlW1poHrjWbzk56yI0rGdCziYSQZ?=
	=?us-ascii?Q?BcyQFtMn88BVDZOYPVl+oStQkJaIwFJqPO3TRt1vL76WJeRs+JX2uFckMf6a?=
	=?us-ascii?Q?nE9C17Vmxt+AqHR0V/zZ/YG0MEepYdXpxFcw7snLxjVS+M2+SkWSIW7a2+iA?=
	=?us-ascii?Q?HSsxOKSISaaGGHSnxXX6xFqiYFg5MXCEZ3zKwEHwkKGdeGBwGRflkOQhmqAL?=
	=?us-ascii?Q?RT4qdADVL/Pl1QnmyIjElNGX+4HD09xaBmVeGTM2HI2c91yfvcWymq3S5oMP?=
	=?us-ascii?Q?F3WWB7GlhR+k2udp3qK0L+kgY2asGMN8cPJLPuGW4rFWPZld/Dpe6krwodCD?=
	=?us-ascii?Q?Zt99LViu0caDf2u/l0uZ0bX2SeDForF86fZx6ldt3g/xFn0IFsTGFqyHXlvi?=
	=?us-ascii?Q?OVp9BWQh/TOSjUz6dfMXu56Fyg667KF7BUrbCXqXs9uLfdHFH4qNgLjEjPCa?=
	=?us-ascii?Q?cm5Noz6TKYyRQntmJCTQhR/qjbVfRzV9LdYdBo102hnrJDjn22WXL0U0rghf?=
	=?us-ascii?Q?zOmK3r8FIPLMDzO6bIo6iCFFbYsJgeei0LZrZ6BbU4cr3rZND59eYh5ThDJX?=
	=?us-ascii?Q?YUzJEl/EkhrhP4gMa09VTQ5Inryi9haPdAsq9sD/bobHn/jEFchABOyp/Iqg?=
	=?us-ascii?Q?XgWTjIgq5RsicKMgqHILgjBV4HK1zNOXtxq3WOzQzE2AqBGLAhQkFoHAp+0u?=
	=?us-ascii?Q?unkSLutLzkwyDzlg/1TvSJn+5UPYPCCyEr/3kzkFdF+tb3Dyyd9vv0N3tfRA?=
	=?us-ascii?Q?Ona5cgSo8+JFC3MZyDoU6W1AZgcW1TGeKqI1cPHjSizeavpd/t1BCgVm95bi?=
	=?us-ascii?Q?Zl/14QCURedroeGev/WFFoVPTuQV0bipwp76i2mVkJOTLKx6W8MIl14gPF4L?=
	=?us-ascii?Q?D6GUjzGUNqPD4dODPDx/Cla2NUsNae6Hj83dDkmZZy6snLM4NY1IzswuOl7l?=
	=?us-ascii?Q?Zwmoya2Sjc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB2443;
	6:D3kusQ3XPTGI6mUunhc2FJHxDulOGFaDwEnL8Z8DqJm3ROEpV7nrrnJ3pV87FL/Xke80dbQyrH2Jmu/PLWzE0lb9AVM+GJmM0ijW/U+qpizZKXJUErAHRjAHFaKXXICcW5o4KqiIIqZ9WNJMKg8l8vG41xwqq6TmOHQIe3/hUU4bWK3MTT+y5Z2Dl/X7EAZ2rl25Mf1KGQsfMaWoUcfLVw6S0RpjjtfSOYLpV4X/F9MnupSQlRzNVXyc+8FS5wB9xnz//cdNimEeEmXNGRAYh66Q3AvEvypvtnPyY7FQyak=;
	5:hlcZP1kIjtTTdfM+qYwPz1KHyZizCD1xXvJy0PDt369dGSjdYcgGb3tZ1n1wJRYQOixI+7qow3TDvqXi3xGgUqSCGkNlwixyN6fscFvakviDi2tP86GwO6JGwyqMMSyakROLtSUoPJHAWrm1VX9n3FWUj4vv0oMXB0+VDL9Gr9g=;
	24:MrFsTbGIqliQ4Aj94D39fOyPgCq0T9IdGTxloD91TyJHaGMS+b+MNVzzr7e7VhiyEs/DLzLnJnjChQK9xjhiZKOB0i26AN1GhVxXhGPD3K8=;
	7:129gz5ZrgXChjuu5c9FKS9G3EbFFaUyBT1MVDUahMVS8Tuf47NDGKrioiSgs06NVvNYYWzzwmFBiiRimZs6AhP6Z+Fi6AXnB8MPVRN+oRskI6vYu9k39kKCewcsbDsOTlkEVQJS81nUuO+b+BmWgvghotcmJWurxmbKJJ7Be2WvqcgqrKaE2cN1IECcZ/N3kPaL9+pkpLxiVQ4stiABkzEQP011/29pJDeJ7iIxW+Wlmv/uFR3Hn/XvOmC946NmayujL4hYYIhkf7Oyq5Fyjg6xBff1wQTbAVEIso12KJSmsFM6ZazH0XZj2M9eqRIo8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2016 14:41:12.5599 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2443
Subject: [meta-qt5][PATCH] packagegroup-qt5-demos.bb: Includes some interesting Qt5 demos. This packagegroups puts together some interesting Qt5 demos making it easier to add them to an image.
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
X-List-Received-Date: Tue, 20 Sep 2016 14:55:45 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-demos.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 recipes-qt/packagegroups/packagegroup-qt5-demos.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-demos.bb b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
new file mode 100755
index 0000000..436ba03
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2014 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Package group for Qt5 demos"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} += " \
+    qtbase-examples \
+    qtdeclarative-examples \
+    qt3d-examples \
+    qtsmarthome \
+    qt5ledscreen \
+    quitbattery \
+    qt5everywheredemo \ 
+    qt5nmapcarousedemo \
+    qt5nmapper \
+    cinematicexperience \
+    quitindicators \
+    qt5-demo-extrafiles \
+  "
-- 
1.9.1


