Return-Path: <ckalluri@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
	by mail.openembedded.org (Postfix) with ESMTP id B21827CC93
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 00:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=361eDfGVzPGbYGaumYxC0mrdv544T369OWuDU1P1JK4=;
	b=ewv6AoILAIfqbnNR7xEo1rLXuttxc9Kj83JvNmGmwor9ZiU4k1k9DEegr7f2TbK9kxKNAyEz5xId28OfId3uKoae9v21Enan5la2JYB/IfiIi2rXCL1OvIZgXbUQky6N8/TnGW0APDDYMohpmnRYHwHly2QkR/+B2W+AUgYQuqc=
Received: from CY4PR02CA0035.namprd02.prod.outlook.com (2603:10b6:903:117::21)
	by CY1PR02MB1304.namprd02.prod.outlook.com (2a01:111:e400:50f0::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.21;
	Mon, 25 Feb 2019 21:55:44 +0000
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by CY4PR02CA0035.outlook.office365.com
	(2603:10b6:903:117::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.15 via
	Frontend Transport; Mon, 25 Feb 2019 21:55:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT008.mail.protection.outlook.com (10.152.72.119) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Mon, 25 Feb 2019 21:55:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40730
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODv-0000Nj-49
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:43 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODp-0003Lh-Ii
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:37 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1PLtarh013958; Mon, 25 Feb 2019 13:55:36 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gyODn-0003LN-Ns; Mon, 25 Feb 2019 13:55:35 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 13:55:34 -0800
Message-ID: <1551131734-13486-4-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551131734-13486-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1551131734-13486-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(376002)(396003)(136003)(2980300002)(189003)(199004)(478600001)(107886003)(50226002)(8936002)(106466001)(4326008)(6916009)(2906002)(48376002)(47776003)(36756003)(50466002)(5660300002)(2351001)(336012)(186003)(305945005)(356004)(26005)(77096007)(426003)(51416003)(9786002)(8676002)(446003)(81156014)(81166006)(2616005)(476003)(486006)(126002)(7696005)(106002)(316002)(16586007)(54906003)(63266004)(76176011)(36386004)(11346002)(42866002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1304; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82cc17e6-655b-49ef-f500-08d69b6bfdcf
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4608103)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:CY1PR02MB1304; 
X-MS-TrafficTypeDiagnostic: CY1PR02MB1304:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1304;
	20:F0aaeyEA4w0PL2Fn3EZcP3Fx84BrxrYNfwLkmjB/H329zyOUpzSYtFtgGTf3IopPlPhWix4t45XflHqLvHeyFfOrAnzzr8UxCZkeMUUK2R6KvCvd8vUIlTRfhRA9zRrdTySipjD0VjT+weY7ld1/UTR4KT+pWNMs+us6HjeoWtZlEA8qbn0rktKjWkqzZ8Fd3N9L+1CbMeyDme4QL0+0GG4auI7EfmLoc3fJ9NzSxG4v8MTJrQaYCS1nt3HT0UJtHgSzTGfRqJNgJ+afSGATn9IXXW8kKtys4OD8TeMWiyiySAEbSRAkLAY56p53d09v/VwV4CEMIDOZmGOWf3po2wlTxYVQqbUK88EAXwFSqg6C9ouEitchS3jwl16R0oaAjpOe+n5NL1ie2t5D+zIAdkhZ/g7ZuDxDHa0410L+Mp2MqzTdqA9Far6NhscsPuK5T1SQRLEA2ne/NsaqN7PXGLAsiz2Xg7EXlMPT3HjV/69wpeJDO0Uk89mAmuxgMhVa
X-Microsoft-Antispam-PRVS: <CY1PR02MB1304CB12B425B0A66E9B4D9FB07A0@CY1PR02MB1304.namprd02.prod.outlook.com>
X-Forefront-PRVS: 095972DF2F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1304;
	23:JP6QWW0dnqNUq5ZdE3bR7BT5fJhMLQahaiXa4/LV3?=
	=?us-ascii?Q?xap8m2kAUVHjhP2DjlC61/eEokomvGOSu8t9eUcaqpXMaLRsYOV1641i3BkO?=
	=?us-ascii?Q?+uyxKApaF3pMPOwSqT/nWIFddrbLd3piEM/wzLo+cRs5I+wEcLRJAeGX+vhK?=
	=?us-ascii?Q?kNR4q/nGt/5cGJtL/+pBp1ujhDh0WUsudTf7xSJ66TXuluRPDLGYcbSVEZsz?=
	=?us-ascii?Q?4jJK/MTLSJDL6+8YoYFA/A+XP4XP2OskLD6fUDx3zbHalAYAXmIWRVYPlF7y?=
	=?us-ascii?Q?oDoLLlk/eL8EJk72qFLAdJj18of7TB5a4uATebb/z5tLnRSsAc4pOjOCpiff?=
	=?us-ascii?Q?m8bzRlSqkov62RrM+6XUMV5gBPqsCVorI69NutgoEcgL12+5yvG19m8DbsCf?=
	=?us-ascii?Q?ZhxS6HxE+vyLzsslqaJ8bzIdcEPqghF+oGZSmHFdl0qJG5B9FlRka+Frsifw?=
	=?us-ascii?Q?F2Lz3DdBCkdsFiDhRpPr7DizbWiGIRN+EhgQbCe1qJFetFUGCEPKWSCos/3A?=
	=?us-ascii?Q?JnulPMjn8Xqfpa/iPMAn+MgLwYhc0TzXhy0hngTxmM9SZYxS/bsJCkLm+4Gm?=
	=?us-ascii?Q?mcWKLlo2QVubAMvLUkjNFQL+bU9RSIKfeeQTgFmvAsyZWaGcOKmLFcTHHIZK?=
	=?us-ascii?Q?At4JLn48gfmGTT/XPbGZLLAQutdfaxSuBI2BzXOq22AU9aAE+ETN76MQ6ih2?=
	=?us-ascii?Q?QvMhI1PyqHv5+V4vIPaYU5UeMmXs+D0UwTLVICYm2yMIaHoVhE1BsFTG9atw?=
	=?us-ascii?Q?bkfs8+yRaPAgLt35FALJ8dwEiC8hUgxnU6eKOJH1el7oMFwDOXnjC1XyjjZJ?=
	=?us-ascii?Q?iNaY1FdXpUZKj5mbYgNNxMakpezdmEs1xJ5LU2m/tBwTRu6Exx+upuAA6spZ?=
	=?us-ascii?Q?RvgwYTRkhmZnlqHRnmInTBpIbATpTKvSRvNLrKR632ogG+MvhNGD/rxqsnh2?=
	=?us-ascii?Q?OrM67uxnCI9PVmFK0S8XbiwCGQlJ/dQY5NLN9gDRZNg543tQwJSYoy5murR4?=
	=?us-ascii?Q?+cWwrXcaf5rTm95KqQoTIR5IO7tgjgA1rRiBSgMPB/B7qkBVYDM7Ztco+Pdv?=
	=?us-ascii?Q?XitVA5wo3gi8Y1MzYWqFDikmI/3Hqp/76dddNl8TUvwr6Ok9484NWyv1MblQ?=
	=?us-ascii?Q?iT0dgvbpkfE8CSYN2TBPwnvUlRZrA9T?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZZZoyTVvj0wg2ASjeWUNZ37JwFJ04c0ZoWJxdhEIc7aI/4ADkN5bkG3rm4Ih8KCm4EEKVJpmr75VskApVNp/2t0RAJU9/DKylzF+OtZ0zyVS7DaXKvlM011mZ8dLHQNNwi4WzG2KBa3ia2PBuujemuDwd2JnKPqmVfJBlg6txaPsyhh9X9kUOuMlROABwbxgQbMUMaNyUZ60KPFxhfEdsNoBzpbWFW86bdwkCkVAi2OslcyL/Ebt8NhVAgNtud9dx/k+u87effqw4pVIywD7bcXmgW3E9rO7BNxOgiGwI+U9Hnsd9D4NFfGVDROHimgCYZ84/liul6g+gpG4FLZ1xdFtLOoEcXxdHLAHRT03Ur3h4aeIku2pEHmEtrArqBD6Nq+Ak2X3wnihVzHJbcYJgO2lAOZCAdlZlbufdtWbTYU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2019 21:55:44.0293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cc17e6-655b-49ef-f500-08d69b6bfdcf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1304
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [meta-oe][thud 3/3] Add recipe for ace cloud editor
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
X-List-Received-Date: Tue, 26 Feb 2019 00:27:51 -0000
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
 create mode 100644 meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb

diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
new file mode 100644
index 0000000..4ea6c8a
--- /dev/null
+++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
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


