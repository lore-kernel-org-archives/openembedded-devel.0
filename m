Return-Path: <liwei.song@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF75C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 04:04:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4459.1632888269035686396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 21:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bIVhlcdl;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5906ce9019=liwei.song@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T3wBti004216
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 04:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=QHKCeFOywmLIwahn2SChNfc11Ok0cp8BRlyeEZ01OJg=;
 b=bIVhlcdlC+O2qow2H1lrAPXZjPGFWyc6DB0jmEkiBtTAZ0sl1JNTXKGntzPtEf4tm+zc
 niS+bMTqrBSsjOGRQRlP545I7rxYXnuODbZjn2IOTSSXKs58Dfr4f99kMGZkBxsL7XyA
 OeI0FX/wgO9MYLz/ogzyWjsf2rj1mMj+ZCBGBSIm2Gz4WZuLTVZN5gP1jizMlx+8TaIw
 ukoRHcI34yaCVe74wdYi2SDkpQ1QTSeFml/UOO45VB7T5ogqEdkf5X/GpxtullqLeiYk
 G6fMTemaFekClMuf+lJglBNyOJhubSb8ELbcMbqf9uljEy2gB5i2WaLxgwu2ZqMfU0nK SA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bc0qfrw5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 04:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9LI3jmMnLtvBbB4lt4za2N1lPl5w/kvRRijCj1ErbfX4cVwdAr/o69iYFYdthBUMzDXNXNvHijGryHxNIIMYjYVZHwx/rNSwrizev3G6h5ofhWeGoYLbhiyTvaoyQUXRswMpwDvNoIQgICiuuM95N0bwSG3+hVbKmIfMDRbbDyjmjOIubWjU59n9jTFt5KheuvscCYskqKrva0aGkL2C1hwAcrEzfhUcMdQl+Qpovvtq3io9OXg++JP6Tjnhw2u0yqIvmy5vjZ2w9n+LS/3JMYMXFV7k8A/uPJdEVPf0LHJnxLX3iR6nrELuJ5RS/OWXPrkSATdqtiGtdX3LpvCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QHKCeFOywmLIwahn2SChNfc11Ok0cp8BRlyeEZ01OJg=;
 b=NbD6yc2YvE6hvTkUK73WCvw90Yr1K8lRk2o1AXUHLUmfEV/3mSiJ8wtxJPHTNkNgPqGprO0sUoE4sMlkcXna2vPl1FzWBif05rzrmT6ytX93Q+suPCl2t2CMpMGf9RePvCDjeeox81SWNI015Oy/xUZhXa+lT5EkOD4MRDeqAa2IrUXDgBXzxiLA3lri0HKbEshw5bGIQztyGF1y2wB2oKZwxEF81dUCvmL14MW/Dg/DPOCykGA30OvagLPorp4XWesz7pQbSerWmY05OGfM0IWjKgdIZgaMUxs3E1viWol67j7yKJgq3hy51p2IyFSpvyrI49zcwd0GBfheC7BeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19)
 by DM5PR11MB1868.namprd11.prod.outlook.com (2603:10b6:3:114::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 04:04:25 +0000
Received: from DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8]) by DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8%7]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 04:04:25 +0000
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: liwei.song@windriver.com
Subject: [oe][meta-oe][PATCH][v2] chipsec: platform security assessment
 framework
Date: Wed, 29 Sep 2021 12:04:10 +0800
Message-Id: <20210929040410.29216-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:202:2e::13) To DM4PR11MB5310.namprd11.prod.outlook.com
 (2603:10b6:5:391::19)
MIME-Version: 1.0
Received: from pek-lpggp3.wrs.com (60.247.85.82) by
 HK2PR06CA0001.apcprd06.prod.outlook.com (2603:1096:202:2e::13) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Wed, 29 Sep 2021 04:04:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bd12eb6-df78-4b51-83ce-08d982fe397a
X-MS-TrafficTypeDiagnostic: DM5PR11MB1868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1868F0EB6AF9B23AB5B517D69EA99@DM5PR11MB1868.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0jPxI7szxSaOeUFy4QP2Wy8/tbk1UB72wE14pudoo3n3Xs2EdDBmyIVX83t2e9YllQ4a0U7N0OYk4Q/m1uyEEHZgNqVKLLxtn8paZvtB1XqU3mhZmiI1rICwNyxiudNmO7t6ivJnVbpFpr3Wgom60C0yD+Oy1qR9MSDhIBqKQFO7KQSO+DrwwL1kEcEL9FpMzD4ImXyraaqbbDCicqp0LvLg2hTDCAke7TgTM5Hrl4gnCVeoIg8qGihBRMhv/QUGP4hjPrgE+8rTeFjLDB7gPg+kEOEEVQMlI3R0esxHy+nW/kBMvfk5QDn8Q1ff6MJs87lvUpUS5Ye5Ki/vKngGQlD3h0S6UBktou0w8zODyTaYk0EEWytRGFwqY38zk1c6/78PEU2dqdqD4x8Ee/a+5ovLqnklMQvnKCNKsJk6Pif/t18tx3fqNxi8iuGiCjvQF9RRQ7EdH+zhHfx67MMDxkFr8XbH0b/5HK9qna2CXn9ikkhHjAQqv0t+eNrlgoHs6dui/I6i+YFzL7bj9YDm1G35TVz93UUMbzk8xT1J0ZIN50HU1W6Q2KECNmm25y/JruZRpk1NDrLTVrQFybAA5S35nEgyYheXsP1wmMD3MOK4PzZscxpAvFeZlEnOKGJlIY8FD3L2zhcyVi1CTOQzAPmTRxxRwy1XRjJA22KxJ5qvcO9hZZHAvaDwQLsda/7oQuNY9dBbhrmHxRCccyWeug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5310.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(508600001)(8676002)(38350700002)(6486002)(15650500001)(6666004)(8936002)(5660300002)(38100700002)(52116002)(44832011)(6512007)(66946007)(66556008)(6506007)(26005)(66476007)(956004)(83380400001)(2616005)(86362001)(107886003)(2906002)(36756003)(186003)(4326008)(6916009)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?akk218JnLheTHMzWJlL99CzguiQcpakp67uOF9NpMmdy9wpspUj3GLjDycKZ?=
 =?us-ascii?Q?DwtmbueaITUXYHhq11wSHx8zNT6NvyVXJJMx+EUhFBfo4yBDKnYbNxE4Oe+O?=
 =?us-ascii?Q?bhaMbWrYvN1RpbZvcpk6+98CecdjhbakD50DS12QA6PveEKEHtnGblWnHeHn?=
 =?us-ascii?Q?BK3xorAfGwCpVf4za9yKW0pk1/w01EAAbuLVf97suWm1uCS2akNidssjEtTP?=
 =?us-ascii?Q?KhMGub+B070vUt73vmdj+0mLCzsHM7liPmUVeDIUVvhTX4Bin54Tn+aDRoc+?=
 =?us-ascii?Q?gWevvSyBnYH0HPiiHWLMTgrfOSb88d236ott7pezsKxCzur4G4+u2yVbx+7v?=
 =?us-ascii?Q?Tawxo0WmcJgYzhX8omMU8unwj70uCEcuXr57IUwrPDwzm6IUaDzy/X3rWw4u?=
 =?us-ascii?Q?7PQAwRKjVvE3Jj4qGRIbrgleulz7qr7g0tIUC4n41IByoF4niT4yQT9B9rxx?=
 =?us-ascii?Q?wC7Qpbe2eTi30ZDMg9hTBl4LUp5y/8sHoDgaTdnwjN4k1vtMNqjompCcbkOj?=
 =?us-ascii?Q?/qPOWtecA4TXRQNc+uPe+nMkLkiSX0MG01rHZZvS6yER5l5HyOs3foaIPZ0g?=
 =?us-ascii?Q?xBPJCvyybf8mWFiEnm6psSItN3HOimcAVEKSNRbkh/yW7Dr3qz99dE9Ets5B?=
 =?us-ascii?Q?ZWDqKKLEvaVa8MqK1cTDjF9niKN5cgL2qabgBW8ayZcbIEtvFLC0Hv2zQ5JR?=
 =?us-ascii?Q?UYx+TP5bkBRRmVgEDKj5ja+ficrxQEJOBe5McsS5KF016Xj6xkiBtKvLgyY+?=
 =?us-ascii?Q?5lZeViDSfzao4q+q9FfULbG66rKI7Ri32hf9bMIrw7/hJGkNqC0J37FBouwc?=
 =?us-ascii?Q?Fwcvv9eot5N9locHDANkDObA7NiZjJIvhAIuJnpDpKTRYZ+wNzdi8rLtZI4y?=
 =?us-ascii?Q?AVzpb+rl1k1QiGbRcOhoXjSBmpWCRIFl9rKgot82nzaUw+ajpuTTw+uM9Yto?=
 =?us-ascii?Q?7aEv2ypnUD4Yk105U4fdU6vtIdNw8ug+ri59pVsLqLdp1q8/4YKT0OZd9Fnf?=
 =?us-ascii?Q?vQzAGBu0j6qkV5RJqyV+TEGPLW4Dwc0QjM/sMA97rz7v3LA+Mdfqb6qMzPxs?=
 =?us-ascii?Q?izfUDzPBpLVWWqOglik8tqa69ICEDYsSfdhTNcAoqRHLuLcSpw97pL+Lswf4?=
 =?us-ascii?Q?CYkPT81uTQIFrwxCu7t/o2UKxNaY60kz+b9ToRfEyDR/EILwAmHuRuGycEgb?=
 =?us-ascii?Q?Sfqpl+l2vHTw7jsqkx1XuBaRCwE/NV9nyJu4U49m/KfNEL5hiUH6thLeZ/oX?=
 =?us-ascii?Q?uxFpCmGEUo+DnjjrltUXkIc/7mT4ErE784qZDzO83qxbyiFbYnB7FKW3dzZG?=
 =?us-ascii?Q?rXVB7taZjr19H4V4XJ4q//q8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bd12eb6-df78-4b51-83ce-08d982fe397a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5310.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 04:04:25.1471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ERcblkPnIwJq9rFMtpkHWt3WkdLn+aKBCma8pu3PqYIqXQ0JoEupj0t/Enj5zzxfAaORIW5mtMOLEs28HsRfN3rx866MVgyetC43Wc7A5bI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1868
X-Proofpoint-GUID: pg7bTEq32ArpCCPpsFNAaIvKTmLunzYd
X-Proofpoint-ORIG-GUID: pg7bTEq32ArpCCPpsFNAaIvKTmLunzYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_01,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 04:04:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93166

Add chipsec, tools to dump and analyzing hardware, system firmware
components, like PCH register, ioport or iomem configuration space.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
v2 change:
   replace cp with install to copy ko file.
   use exec_prefix instead of hardcoding usr dir.

 meta-oe/recipes-bsp/chipsec/chipsec_git.bb | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/chipsec/chipsec_git.bb

diff --git a/meta-oe/recipes-bsp/chipsec/chipsec_git.bb b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
new file mode 100644
index 000000000000..3339dc142107
--- /dev/null
+++ b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "CHIPSEC: Platform Security Assessment Framework"
+
+DESCRIPTION = "CHIPSEC is a framework for analyzing the security \
+               of PC platforms including hardware, system firmware \
+               (BIOS/UEFI), and platform components."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bc2d1f9b427be5fb63f6af9da56f7c5d"
+
+SRC_URI = "git://github.com/chipsec/chipsec.git;branch=master \
+          "
+
+SRCREV = "b2a61684826dc8b9f622a844a40efea579cd7e7d"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+S = "${WORKDIR}/git"
+EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
+
+DEPENDS = "virtual/kernel nasm-native python3-setuptools-native"
+RDEPENDS:${PN} += "python3 python3-modules"
+
+inherit module distutils3
+
+do_compile:append() {
+	cd ${S}/drivers/linux
+	oe_runmake  KSRC=${STAGING_KERNEL_BUILDDIR}
+}
+
+do_install:append() {
+	install -m 0644 ${S}/drivers/linux/chipsec.ko ${D}${PYTHON_SITEPACKAGES_DIR}/chipsec/helper/linux
+}
+
+FILES:${PN} += "${exec_prefix} \
+"
-- 
2.17.1


