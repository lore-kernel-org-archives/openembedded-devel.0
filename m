Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 141970 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Feb 2019 01:10:26 UTC
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710047.outbound.protection.outlook.com [40.107.71.47])
	by mail.openembedded.org (Postfix) with ESMTP id 65C0D79D13
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 01:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=90MyL3HcR106kXUTdkv1sCWmRtPUgnJtub2FZ+fVDTs=;
	b=gNlooLWq1PAiaopWMMBpOwdjXRQzLipmoFW01ecOAUbm9Mm62Xhbp7iuFJ+6maAfjrDMb24zbnw3tUzQDNH5/OP8Rc4/zdAsr4/KBXbe/WcOc8uI/rWuVDnMU1wtrYbrfPQSBdMCA0odzyesxrBj2JuC0yOmtiXS7uLz5dWULDw=
Received: from BL0PR02CA0054.namprd02.prod.outlook.com (2603:10b6:207:3d::31)
	by BN6PR02MB2644.namprd02.prod.outlook.com (2603:10b6:404:54::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1580.22;
	Wed, 6 Feb 2019 19:37:37 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BL0PR02CA0054.outlook.office365.com
	(2603:10b6:207:3d::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1601.19 via
	Frontend Transport; Wed, 6 Feb 2019 19:37:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Wed, 6 Feb 2019 19:37:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59150
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grT0q-0003w7-Mn
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2019 11:37:36 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grT0l-0005eQ-J9
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2019 11:37:31 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x16JbOdq023926; Wed, 6 Feb 2019 11:37:25 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1grT0e-0005d9-Rc; Wed, 06 Feb 2019 11:37:24 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Feb 2019 11:37:23 -0800
Message-ID: <1549481843-24095-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(199004)(189003)(7696005)(51416003)(126002)(107886003)(54906003)(47776003)(106002)(48376002)(36386004)(106466001)(2351001)(316002)(63266004)(16586007)(478600001)(9786002)(50466002)(6916009)(81166006)(486006)(36756003)(2616005)(8676002)(81156014)(476003)(2906002)(50226002)(305945005)(8936002)(426003)(336012)(77096007)(186003)(356004)(26005)(4326008)(107986001)(42866002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2644; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT019;
	1:R+BG6RAmf+ydisYf0m/PPjxXhwWvl4yGGc0j6S8sFFjdph1KsFWfmkNTpbbY3zn28oXqH3y4ddpA7LQT/OH2u0wQ+5FJ45qADxkgaAGne34Ekg4M0r8Sz7YYkSng1qHXhpUx38Q88KqPjQUfcIiTIttnt+U7Jne4xCXKrsOM590=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f826c2e4-4657-4a1a-932f-08d68c6a8c91
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BN6PR02MB2644; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2644;
	3:LK13WlQ9Igg0/O6PA37Xz9OIj+4krVnVuPV9mE5ehQGJdrNfLmh3KszkPQSEls3xfbhbEy3/qEhVBKv+QaY5K8cuNLwJmVPBUPQuJ1muVPbRu6f11bFy8AbWso6aFgnxemexmVehyM2Uscgtxd/ABZSdoibZZ+ddRToNTE0Gg1XqfJnGzWM+ct0W2G2X3dk1Cwx2zFEMZF8PdziMk2LNuUNpLvEIKf0c2S+HVDSXSLripYiQU8guqEgDrhTD46nZ7xYFIG24M+Ym6jNlYuB9vrJF+c5gtzy0/8htJj4xdnH/Hv2pHNsMqapLYTicgX84iZBHUcLk5qpJamMhYIkNWsFHJusLPi55tf4mwG4lCZy95denak4BAJUuFX7ZaOn9;
	25:y0kvWESgfpXLbGlSPeQdAF+WrNBU9DzOJTCVLHyaj8/Gg+NxmX5B2SJ5IXtlY4YOufoGt1Ku8j/6B4fTsZLRul+vXNAK7PzF8mAYaTpBqzcVsbpQ3ll8Ghia0fexR39kZuytk3XsuI+ytIIe2pWvLrQwPiuwegp2WaHbhH5O2uZL0Cr8kKq6U69pZD+dlc+WeWw34z/3Egw+z7CHR+ITAZLc9YdkP4HevX3jqnLKnU0Q1q/psJqLDUu5SlILc2znWNbEkv06s/cJzvNImwfYyZGKm78TLMCMeSi0cpHE0EM6EsozoEU+2GZwMxsidP+5UdkjZvMoLVcEx36Kd1Rq2Q==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2644:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2644;
	31:TJW1/gLOnPe09i4IjPvYoUUr7JzCbJMrSNFMngGxp4SrXYHQuKB2DewPOLFQ7hesvHl/oA4aPq5q7EX7YH7GHoPt1g9xNxpiH1fJaJTtamtgLu7/XP94pU65A/C0qKIAg6LEpdUyIwBm9ODSlcyPKRvpSGnU1wgUTaEhv3f849e78BtH7yx3V1BoBHQ4R3ChhUy8mxYkM093+rPom0OAQ1/D8Q/gwy6p/yzAzKxnml8=;
	20:0GylspWxCTViNXU2bW/M9WiBsHg/uyFo4s9Ix5cKad1ECd52c8og5Ry4wUHoXLFgL490cZB0N6GT5flj0LN2J2ShX95O7LRM1g9FVtjfIA68YKrzKclplwOeS3uHpzsLAOWrxabuGwqo2YfuwphUPhcs3LZjaYXWF4fO6eYVtULeYy3R8EqcvzjrWXCQ3K8FVWKC7X2KwHus+9rKW7OWYtwJaZzRmCzSpxMLxjGCgEKbOltFCox+OqsLlOVIn/+3IqC+uTwGi7+LAQGT3Y2KS4+YehxMBnB4OF1nUHt3LBg8RyZFm036ZcNgZLCkT1+Nud/5tpBLHjijdoD4kybD2qvB5Lyligs4mZFYUdWxv2fr7myoFLTGkdvVrAKNYhsuydWZCsk/8RTiIDxzOtMvKeXIvuvL3LloqZSAXjuRG4yLOztywM3lZ0gydp3LLpy8PJ7MclCz8l8PXv21wfbNPx1VXQdvVdxHlHit94aVs5/DlmO3h1V/T2idnXzrtIwX
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB2644B21088033AE84C8F66E1B06F0@BN6PR02MB2644.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2644;
	4:I3CDOeQwPR+JiMaV/dFya+H7MgQWbRbXJ2Q/qpZBBKiDqVZ1eRXG1ad+aNqmVyXzjrcHdnY5zRSj6sm0p/1bnjGiPqqgCE33/CuaMNASVswTI1OCGoXop5JIgJQOXxKdfKy3zLNBQ70ZTK8FOBeOzVBOrRqEmGyWz3jyqu3wxbuw4RuoVjCFnwL+1TTG5tHMSb8zIr9yzH2NwwC5sg0BP6Vz10c7xtu7Z4lBewpa50Lizq287QrGp0Zf1+AApRm+ys3LJ39QDsRED4661VMpbQBylkS6+Ao2JL++5GLyzl4ZpBvoiAt7AquFv+lUNeA0
X-Forefront-PRVS: 0940A19703
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2644;
	23:jaM4NGRCuBfn5GHUiKYvd0KaWPyE1BMdjlHaEjtBf?=
	=?us-ascii?Q?qjNWlPR74gHe+MKOncJz8RyiTfauo87hrLIfG6CecWkcDU9Z7TeqYauSQANX?=
	=?us-ascii?Q?5577nPgsvLkpkhCz+9M2nNYZzEpHkMxMu6qlL9MEEFaIummWgiwGqC1YnmBC?=
	=?us-ascii?Q?u6hKHmdBQMphAIvwFL4g3k6rL1mY0WZPva+5SXFI/4SLA1frqyETsSNC+IeS?=
	=?us-ascii?Q?WvYPOuAtgl7BRmXcnMc2vRuFnmG/EqMAet0TIj1V76yVdJQhN8rxt5sCc3ya?=
	=?us-ascii?Q?ZDMy7WUll71vzRbr/6jmZ4u4NyaCxbXT4CssQkjVBO6kj+Uf2yhH3RGvkwmV?=
	=?us-ascii?Q?f44MJCD5DJI86e8AnvDpN6EOkd1dA+2OYQPV1cB3LnqBROQqNCdgo+DVHQYr?=
	=?us-ascii?Q?eoYdo1HNmsuOUuGbg+5GeBamxtbe1oFt8D1z4vUKadc+AovKwd2RiIjss0J4?=
	=?us-ascii?Q?4NXJsuUGUTypv327/geX8mGpybWXoBuQ/GHQUkT3TXLiDvtAJCxa6AvvSFlL?=
	=?us-ascii?Q?Jvt0TwSSgACkys7QKvmPhiNYUNv3I2opU6oCFmO4rDXF1mzULBMKtUtAvZRU?=
	=?us-ascii?Q?OJBdvAby5GFwWE58ALpsn9rWA6V2Y3/aope17bUwxexbQPYBz7Zj/Vn1em/K?=
	=?us-ascii?Q?qC+CjoIvnw3x0C4RB0kNb6deJ7nRPRj3Rm9NqFZe8T7iSWBHInEl7DVPvAVi?=
	=?us-ascii?Q?YzDig0BEkSxBHSzHbNfH2jmqMvuB3bCVIhzCHYzurEMtq5YgmdNI6Yh3vQEA?=
	=?us-ascii?Q?kfI2W9kMTQhVuy6v9pCkqfUIxzjI7c13njJtaW/FsbgoHjZftdRa0zzvZn7i?=
	=?us-ascii?Q?a03y0K03BeUs/LXwPq5Z61qJxWmG3PC8h6/oVjyehFIiQ93VQffhd2GLqFOX?=
	=?us-ascii?Q?2YAs1Lvbi1MMkVIhCLNVm7hEhQzQIFHdQhBLLNo+a25RLIPYwvYef2xOqQXt?=
	=?us-ascii?Q?OMkePLxOancA6hgx4sZi8tvunixSB945OI9xoRvvtJI2Wt1EpqXf21p1NZ5a?=
	=?us-ascii?Q?Wa4vHVCTVPNpXxleHeQc617Xmg3sDvGt6ck0HZ0DKmbTiTjv4np3s8x6Czav?=
	=?us-ascii?Q?lLfS/4=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JVjigzxFS+Tz7f0A+gpFmIi1nBggUng1icoBbWBBhS/yUNlmaXfbBuBv17wBlXcAWErTTXb0OKcHSCYfq/mqsyiGieRvzDAUeAXAjCAjOqn6YRTcZS5aUHg5zHDEVCSgRU34zpoFXhtBYT6iSOjs5/YuuO1u8+pgYZ4lc/yV7KlVfBd3Fbw/7kmAEzFkTePMILLAZIEer1uU+/ZDZJwN5QXtaM7p5H3zLcL1M8gkXlBDaH0YR+s/tRY3LpsqWQdHhQKEFernOoM9gMNuS+XQ0G7en/ikQ3FUL6zo5w73tv2f/PNN2JieqpBubGvcSNPuvS0SnkVCfkg1q6EJSf53EmS+6ygkuzBOjT1AspiE5aUAqbd3W5h86ZzJaPKYO8dGMyategQ9n5qrxAcEzJdL29mw2Xn8coiTF3mCFNxrwSo=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2644;
	6:z9ygrshUmIfkwSEKqi1fEyIAvwH7Z6SldJ8cGGCgW0+tNFcbFm5LrUp09Aw357WkNS3JiEkWEw6dkZiECKOPHHjL5nvaV92Ni02fiLNVdzQAFPcLwaIrur6fVmI+CfA67JBc5GH2WD5VvaSGDycXwRGQXD7w9WzmnBneLm0iY7ZNaMTeWxWPnm7h4t8T37FY411kex1yFTSBS0ilDALdAaODoqcdctkhXD6LhgO4Qgy3kG8rR30p8iQVO/Og6WOf5yiJq8iZA2ySBZLqYjhSEHej4yd49V7gduTWBoMMNW1M0SSw04HkXXmyTBf0Jl0LKsidboFbWOE4yhYyYTdquNyc3xa4j5lX2TjXvCNsSUuvCWNMGZQD9tbaQ7K6ieZAyNGkImI7muFevjhhjzOiiYr+yN04wQTRh/cJnq1wn/3wTff3AyNqGOgAY/sjtmK3mkW9KGq8Gj/JuJiTEIRhiQ==;
	5:YF2dEMIh0fw3nga9C+7LRcHlZjUQVXdKYfU+zGiKCa35XnZFNtZ92IfRDbd22KEiwLS8oaJe4FAEB9RK1i3iA+I/O1iLaOXo0AsmzJVmUPb5Q11UYPwmRFNj4wkjB9OyZ6sOOWH2stdirR/51to+LAAjk+psRn9OEUAQngtuQQoarHufpnx3sdvvgd0393yY0Rt43IVAOfAH1kxIAfTVGA==;
	7:o52T7jhUeR1iPzXWy+O0gKj10fTt219gJayBxQCYPnxrwmo+WG4jgVO0v7vc7BtPVB3HLumh0Pl61dFqnKUPykecHFarCFkLGU8IVk9MqtRERNPf6UxriUK1JnN30XGeGtdzDjhBeoTY5ZoU6ivNxQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2019 19:37:37.1045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f826c2e4-4657-4a1a-932f-08d68c6a8c91
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2644
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [meta-oe][master][PATCH] ace-cloud-editor_git.bb: Add recipe for ace cloud editor
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
X-List-Received-Date: Thu, 07 Feb 2019 01:10:26 -0000
Content-Type: text/plain

Yocto recipe for Ace-code-editor an open source embeddable code editor written
in JavaScript. It can be easily embedded in any webpage and JavaScript
application.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb

diff --git a/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb b/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
new file mode 100644
index 0000000..4ea6c8a
--- /dev/null
+++ b/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Ace is a code editor written in JavaScript."
+SUMMARY = "Ace is a code editor written in JavaScript. This repository has only generated files"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=794d11c5219c59c9efa2487c2b4066b2"
+
+SRC_URI = "git://github.com/ajaxorg/ace-builds.git;protocol=https"
+
+PV = "02.07.17+git${SRCPV}"
+SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
+
+FILES_${PN} = "${datadir}/ace-builds"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "rsync-native"
+
+do_install () {
+    install -d ${D}/${datadir}/ace-builds/src-noconflict
+    rsync -r --exclude=".*" ${S}/src-noconflict/* ${D}/${datadir}/ace-builds/src-noconflict
+}
+
-- 
2.7.4


