Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 949 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Oct 2017 15:59:13 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0055.outbound.protection.outlook.com
	[104.47.37.55])
	by mail.openembedded.org (Postfix) with ESMTP id 6500F77E88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Hf66C+lcBtOy/oA/1rowREnKVadGJqPqmBpyh12DuqI=;
	b=kH1KX5sYAOwJoQVERWi1ZJDCuWYxqo0y4l6cMp9EYJgt3f/saEWbkLkRWD/2Um1qIi6V3IyIT/sCu4ZzPNcml4r0TDduZZ3LD0ypwrml7+glnw5IXzsLkLtqCncyY6U4s69fnLB4axbQ3T0PD4Ksjih2ALt9cMVOy3x1YxlDjAE=
Received: from MWHPR02CA0016.namprd02.prod.outlook.com (10.168.209.154) by
	CY1PR02MB1334.namprd02.prod.outlook.com (10.161.170.25) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.156.4; Wed, 25 Oct 2017 15:43:24 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by MWHPR02CA0016.outlook.office365.com
	(2603:10b6:300:4b::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.156.4 via
	Frontend Transport; Wed, 25 Oct 2017 15:43:24 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.156.4
	via Frontend Transport; Wed, 25 Oct 2017 15:43:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Npy-0004Kt-Vc for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 08:43:22 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Npy-0006Yi-Qx for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 08:43:22 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v9PFhJEC008681; Wed, 25 Oct 2017 08:43:20 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Npv-0006YO-RM; Wed, 25 Oct 2017 08:43:19 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Oct 2017 08:37:49 -0700
Message-ID: <1508945869-2384-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23416.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(39860400002)(2980300002)(438002)(189002)(199003)(2906002)(47776003)(50986999)(6916009)(4326008)(6666003)(316002)(106002)(6306002)(19273905006)(77096006)(16586007)(5003940100001)(33646002)(478600001)(36756003)(36386004)(305945005)(189998001)(2351001)(5660300001)(356003)(50466002)(81156014)(8936002)(81166006)(48376002)(106466001)(9786002)(50226002)(8676002)(966005)(107886003)(63266004)(72206003)(107986001)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1334; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT054;
	1:lAwb5pxRwVMvh9AVWI9PacC/wKM3Lms+GxdaNa87kfvkcNFOODi7iRPzdS9tpL+zhkpQXXZWwIa9TUdA1dSyX801NYpKJ1d8OXhLlYm/LwO4g6GaJifc4ztap26FOnQ6
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 113d4319-1e4a-470a-64fd-08d51bbf2062
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:CY1PR02MB1334; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1334;
	3:2u0Ga0eOWErNWqo6C7j+qECCvTQOrtG3MLbbEw24MB+NxjZw4Los5pueTDVLmooTzNvCJqtJkQi+Ji1dE9QFxplpmEyghC1jWDZIWwyTnwcmy/NSqrGfk/v7IeMxTS9P008pO0gr1XUcIawC8fLeYUGwIJbAOMmzFMNAIa3JcmjqI/47rXYDCiSP+tSd9RVcPMM7/K3D/w1i8qYGzoUZ3k+KzBj4qCZOkcFV3NvTT1zoV9JI0Mxf7RQWPL1PYGraTH6HXyBW5TPYl0Woa1ZvyvK55HD6UIV9zwWwM80Ejnkk5mxGiiAiNOp1BX/rXKFmpjwjaJe2x5FDaYSdJIcVRQn4KLWNTy5yllL6VLn/+LA=;
	25:GemgYIqUIYvb7guqpvdu+DgQcXvcbHO9OL4VtV2uJC0W/WBA94pN8zH/15BgsTTtZCZ/R5qx1MBBWx1qPKR3p4oIzay/V5akn33YiqqDC1ETdy4gcAylxZAm5Fa7sizi5+aF+672eEAs+0aqfrnNSGtr3f5vYWEwHgUavk/Ba3+mYj2QbCkILo0NqNGp9luAXatVZb5CjHBxlOh551WWeJCY+gAqNsuM6pUgjjrO5YrR9tQ1zSYgDBGvMUhSbxxDWt/PrdyW2XOz0lGSgrEvpiLIo5sQbfDzHi6fyoxkCbRoV+nFGHnBmwR9IiMq+zfdQUVzo1JTj21omya+qMwfiw==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1334:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1334;
	31:IWcd2lVapatxzgAeSuyNemJFjld/mjkJGF2cbPamptIC4NdW8o/TPOAMhq8buuPrywDGG+wSXaHDkr1Vt9WXwsS6XgLxlUg8X7NIxP89fV6yw6sF7c/459qGJ4Y091NzZTkf5o/ZiDF7KdU2UQmvwcg/ney7HUXl3J5nqls3fgr+VNS7RdeO19TBIuu1FywwLJjuaSrgczd4p3RMZWwUU3g7SEH5EdlGSM92skP/isw=;
	20:sd1d0tSbg6b9o4zbE4J04Oxj478GmOweehuTjG4TeQFtuzQeKyqZC7ZAYu5OaRoRhjKWk4WRxc27JoAmK2/O5OLXX+OSZ/c83cJr4/OswtmSMyqx79aMSnmWHXl/72kMQbbWRUmY8JqFOPUv6Fq/wm3J8dV0m+7nkZSc/bQZfsEtviN/GvtGWSzz6CYizyg8lIP958xOOEho2OdcgBpMWI6jryxj4bZn9+pyg9au9KG4foU06t/iSmuSBCAfbBMvZraYi7zCrnoF5YnQo4s/uCUXCqrCIklsSFEIhew4jicxvkiJUzalTlZh9FPZvQkrEnKsbsLjaEwMN+GtT1h0e10oXQrzBDW2uzjzmUrDAmaxfkJr+Nkae/FzoIXSyNMxRTohcOvo/zFEiSc3LlTBE3n5vQznCXHxZ4CxeV5ybwppOXHTmMe086pDGrty5QJIt9/yjBY6NOdPQQdsD12tDgkj68yaIXO32Bk4k8e02jEqTPLn/DZBPAW+mBljIH/w
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR02MB1334ADB6742E6965087F6E54B9440@CY1PR02MB1334.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(3231020)(3002001)(6055026)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1334; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1334; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1334;
	4:5BxMWy44XYSQA44Ew3+DEgK2nTUoo5z/Wmjq0uYX/uPLI3NSYFGE+jCF4rWs4mtwNqC0qeRX63oxJum4CW501hrwqPd7C0bF3stAFO5wWtKEcSoCI7lQzt1aLRFl+53GhyEduJrFU9Kj82lgAAQMNPMnPuIpUpJzwgUty7AaC1u2nnEKEfxBbN3a5dIXyWj7sOI/GriEDjJGUr6HxJYvcNxBeQk53VUdyUjx3Vk5zuhDsOvFyqoH/KeQ3EaHrQDy2RNGUFlsZoihBEZcqjGPmg50cH9bQ7pHlHuk3e/q2Oo=
X-Forefront-PRVS: 0471B73328
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1334;
	23:9pdVptZqgpFPy4Mc7yqlWKqFcvODZvuyfbyYPBqjS?=
	=?us-ascii?Q?EMMckOQ/tCQIWpa/1sM8prEARkW6oppsrWegBV/LZ8Ck3wxEXbY24X9rBD04?=
	=?us-ascii?Q?1/CiysQ/25dTtzaf8mnmeC2Ky2y0U1O6ayBfpsbFuxgUqL+Sa8a/W1prfIwb?=
	=?us-ascii?Q?PhyIU8kSnv/bpwYahyBr6TvzUQRB0WbQWGvxOiqIdJaaQT6JSMGWn6zlvd78?=
	=?us-ascii?Q?5NSCxVsAb3eJCJaxjAYmkAcGryZAGHWw6WBF2uFjx/NkbsWE+Nrij1uVwXAz?=
	=?us-ascii?Q?4c3E9XJV4IqYMyYpHMlaGIcP3EMmWvuzmaXJM2cXmEAY64YLy8cAkh0dRnLQ?=
	=?us-ascii?Q?YShYxzHoQp5e2tLkXTErRWZ+W9dfOiLSiiSQ3Dnr6mJpUjsTSERPB6oWsZe2?=
	=?us-ascii?Q?C23B8dECfqJl0v7CDe7pH66TBFuI8rmrmZX9HFAtapBdq+LULLTpdJI+TXuc?=
	=?us-ascii?Q?78PfhVf2lVQaxh3CgnxErUfMCevA+2o3+mfdKoiUjHbSuf3kODkzo1Dxk9tI?=
	=?us-ascii?Q?w0k1WULpHtNUG7SbKkkzoNgOJruiNuzYmoFfjUoFF/NN3N9eVoBIj+XHyuf8?=
	=?us-ascii?Q?5Nj4J/r6Aq/XjFFGbpi7FtGps1bO+CYRgGPGCkVYJEr0W58H8BITapsDqjto?=
	=?us-ascii?Q?IhsIG/CJIwOXlPoZHBddQsCyOvSvo5YLzc51emAzwtcB6/++mipF8LKInG3W?=
	=?us-ascii?Q?3Z5TVDVRAgENCqhJGSDj7QjcdXP8IksXqWyO5NxmfH8XVR7KLOgNAFGODb84?=
	=?us-ascii?Q?Q4C0uD28JUBEk6XZ/dwEg2Ja5EYWSshq8N0g2XUQcq54OR2pnOqatPSxIkud?=
	=?us-ascii?Q?NC3yMkKK8a35fs9aiAEhpS9VCInr3fEiL5sBYrXCxsg5xon3QRJhAaIFhUnl?=
	=?us-ascii?Q?Bg9jByZJw7ceXw6M9TBge3xhz02ExZFbbW2JsmYP7/SKp76klnvT871/kFRX?=
	=?us-ascii?Q?9QV+o7p1iDrxZn3AEnssN9NOx+XmxD8LwkpVysJKylL1ydywpbhgqSR6JPXd?=
	=?us-ascii?Q?zeCzgRfnTvzOAXYcEpNVI1+iQtLoLkUjtmtzTUH2AEqTP6QonKI8LsLZvPFM?=
	=?us-ascii?Q?F/H6oQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1334;
	6:q1ng9GoGq9NYiFuwDujH857NOunxMd0OFaCTXJDKgtMsDH9mt7S8S/kKJGrSu3ZnR6lV8hgl+7qznDfhs+yqoTfJaWNzEGbjUlX//IpxGlbEYZoemc0CzPWfW9AFgyOaxDuZkMos9ojrMMsWVR+9f+sHkOkZ0InmXaRKjVlhRjLsvUszx7J2NJ+sJJp2mOpVGdVpECDtVgWKfv5Yr58FO0YzmQ72FB5CJ2dzolRA4w4MfVbhN9Kpi1MoItvcF9SRWOkzvp1oFE+ADqECS5yov8hJmHs0AThI+ppRvq9OQks7aUl5zxjQtr/g05Tk/4qAzCUGumC2UQiP6J0VVXZwqA==;
	5:Ya3fMVs7HCpXnVmlnUir8UjJrdZWsi17ctJN+1HXT+Ahdvvmwr3zjTZNRsmM8yDbQdWsAIcA6jG4kBHdX6r6wEI2GEZLqWIddqy7rpDsmhM1lvzx9/buf2OiIYHpOF1y5TN24xi8JicOXSgiAIakVA==;
	24:NDtWt4cTLY6nF+Mel2W9MI6qWe+cy7QIvfcWoi4WO6XenJJlFqDYC+bLmakhiqJgdnf3Jsd78wwaF29wNEvmnmUdUK2YiFVOYKkJnIRYdoc=;
	7:31weDpNB0p+Oiv3FDdBaPSOaNr+Hl7YRvwI32qLumPHGNje6cKhoebKIJ1IDVCWAJQLP2Asg5AZxgijFDNSnqVqBAqfXRz7pTfB23UIzS43Rqapm5hkZ9zPiOxKhoY8lYsTysbVy9EAWiSiAZQWC8ZpLb6d9EO3uoHpmeJPBHMsGwIeNR6bD4+NPUtbW0K6Vfvpo9G/dJunIoq2lNKI+2KNRi+uAaRI3rI8rWq0HKjk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2017 15:43:23.6940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113d4319-1e4a-470a-64fd-08d51bbf2062
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1334
Subject: [meta-oe][PATCH] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 15:59:14 -0000
Content-Type: text/plain

The Whetstone benchmark is a synthetic benchmark for evaluating the
performance of computers.

https://en.wikipedia.org/wiki/Whetstone_(benchmark)

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
new file mode 100644
index 0000000..2e01e1f
--- /dev/null
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "CPU benchmark to measure floating point performance"
+LICENSE = "PD"
+LIC_FILES_CHKSUM ="file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
+SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
+SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} ${SELECTED_OPTIMIZATION} -Ofast -o whetstone whetstone.c -lm
+}
+
+do_install () {
+	install -Dm 0755 whetstone ${D}${bindir}/whetstone
+}
+
-- 
2.7.4


