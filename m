Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9001EC678D4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30524.1678100595341486122
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=plX7B/19;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2429e4d58b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3269qQfx003556
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Mar 2023 03:03:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=qyWnw7H6ImJI3SK1JUNhql5R0h+I1wIa3xJcG9mB3us=;
 b=plX7B/19g0vRzyOWqWRYf3QUCLYo0a2281d6bWJ8dTOMX5y8uKzC6Ker/rQfBfoPJxz6
 BAhTlhEQvghgBaY78M8hL04PUj4sVmbnTw4/vmtEbYVOKAnMhYbeDl5XPTrWuCVVKptL
 fLsPbRH1khMltLxRF/J5pJS5O6FcUR1w8w0VvupSYaHdB8VPM8q6kDe7BlYoFm7762XE
 DHkY5hPnX09NK0Zm40p1OXn5rJvnWnLlFDGILyOBcdOEAlShSLbfx255Ytk62sD00ApG
 9TIefaPWL7Q5WuytelmiySNRTxlD2X/cMZHt6ZRhWLRXMdXahYetBQ0gXAEvAzI09a2o Rw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p46crhfsw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 03:03:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra5FrMtGlXtm5rDeo4hY0GmlpeUpx454lIC/3KNhOkR2w52uU5+gtIGYWRUR/xbFJZJt5MjNXGm/5dgk0I+jbqTV0bQvaRX8ycjODrcrNJkG+fD2bF7TIpDe2dhNFQIuNfx8Wjr1iGkdW6rjVS3UU/jJufmEz5THvlAxcaF21+V8dHN2T8hZxFX4NtFVQa1eLRdKOxphIlB1ORkWO8b9fZp2PeMD6Vn2P4SN0WjbCGsEeAcPoUUoLLC7dIgPX6fUqpZo24/RWLmuPx8h+olZQ2bh9td4q8y8HnA66TbCufjHkx0aHHde8DliHGXdxkrsdtWZkdrWYQ4LBNtlkNQvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyWnw7H6ImJI3SK1JUNhql5R0h+I1wIa3xJcG9mB3us=;
 b=NS9U4XnUROtHZDCQi9VlS5AEO5okWv83zY2qZ7VmXL2spBGT3/JE74ESDwczkkJf2I2EHv5sA5IcFBJaeB27gRqn0dCnSOvzFfcz3NZov1cnEK9v24ceMm4df72cCkWTFe7TRKM4eKnhwljePLSDkb7AEiV72Ojogk7PdvKsynyBKTO9uTqB8D2iH44xKiggI4x1r/78OvN3lle8XLzosxDcwZ1vs+mXBykwEz2koof6YVDs2N85Jp5FCMVJCX2ksT8wFsvkye38S6e8K7tol8B5iLybZUJvpTL0Lm6PBkYAeyTSOUD2fcC9Kiymd1+9KWln5EC9/hNdT0OYLvIzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:03:13 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:03:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/6] strongswan: 5.9.9 -> 5.9.10
Date: Mon,  6 Mar 2023 19:02:56 +0800
Message-Id: <20230306110301.75991-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306110301.75991-1-yi.zhao@windriver.com>
References: <20230306110301.75991-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: d8568480-8bd0-4ad2-1c5e-08db1e3260e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vHnt+tuNn6OBngXIiCFAuuDMZm9e2KdP6g6fnDNw8tweTKszsqzFwIFV/yRxHSafBIVsSB30QvqWqN/06n+iIKhgx+7yiuDK9jYO6NZaZ+hb5WbvH/F2urcizcqlxM5EwWqDR3HVEXhTNV9TJD1Y2JhsiNg36ATAoud/z83HgkhVTmuxBeQOc7kM99Pz4M6fGp4dk8o+3SQmVqKlfen5BAG7AjSbh86qq+znBTCVJjBRNQTq9iQcYz/GbN7H0AVARylMmkMCrCcH82hA0uYAWpcF+GFKiXfBxAGuesI/BtRunLduNp2rM1yTvX6PLxQx4h3VE0G9FDiiiKVkig+/JQNUxcOkbxUYcNwYC3CigUIV5S9YmXihrudGleY4Cdlk/JrcQeFaoavE9j7P1r8KAnwbVy3bFvXn+u9qj/Du313E0th+c87g5IOkb8TcbF/hRq0btO8fsmmC9w8MUBCsga21dNKUUbA2jLXK9TbhmuaXOJ612JZwK1TTn+UdQ2bvWEDahJa+wuWo5s0tkWlpGsDY4TVdFN6JVmytmTH73SsRXwHb4tS/0ELshxjbaacOYm/PIrhdM7nBxsupyWtXhCElzZ0fJ2vbvyN5aFVUYMiJMmvIRpwyJvxd+AzK1GD9CvKEP+RO6mBB1V2mlJaegHMQ4/oiXXvWHMX/YUWvqtb+tP9uOjDswci7i9RnBiXo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(83380400001)(36756003)(478600001)(316002)(38350700002)(38100700002)(2616005)(966005)(6486002)(6506007)(6512007)(6666004)(1076003)(52116002)(186003)(26005)(41300700001)(5660300002)(44832011)(66476007)(66556008)(66946007)(8936002)(8676002)(6916009)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N0SNzOOokRlM0HevNefOo96naV46EXTlPXZ/HyzwVYsH1tibTtcPv2fpXTKe?=
 =?us-ascii?Q?7BlrY4OBNyeD/BEJEFQOJRFkXnvDJWS5o+g6Bn9l+9mCRhJPbdPfXlG9yjQ8?=
 =?us-ascii?Q?hBlBPXkANIh3xftCcX3kzdUpCDzBlxuZipRCC25V80ZAbTBzwXEUB9e+Iqn0?=
 =?us-ascii?Q?3oaKwvgM/NEhV/7gEmmfSLyYtsxCXYevbbcSSuOovNhdOk3/2GLdNPFT2CBS?=
 =?us-ascii?Q?/fARMhfp2vBXpz1SUK7v0vmc9Q/IM//OpUggmjNR5nJt13L3WdrOuusA7h2o?=
 =?us-ascii?Q?JEmeo4ds8MHx3mEgPR8coMKjt1rA9QkSTa0Pj5KH2cs4aUXCB0xx8s1/dlCR?=
 =?us-ascii?Q?t4VNVI6afAXGnY8lS/ziMIlBTE571+ewq/ss0U1i+7QHw/TrYUev865hMZ+o?=
 =?us-ascii?Q?0JaeXqWYP5CwYUyF7yCsv+FTRATmelHMZE/y67D3/ZEufXEY4HhVpFsXsz5Z?=
 =?us-ascii?Q?DHvj0+KIaDEVaBWOxYEEHBQSeSaxo2GZK0pVNsBzFKOPBGjIe+BZruSMoB4K?=
 =?us-ascii?Q?QfTTV3qr//1wZNV7hV0QaOo2gYY71FiSZBn0f5JD2R9KifSKh3NrsZWZDMKZ?=
 =?us-ascii?Q?3rtut6nknDlKJDOt7x9nfiagO26zyhoC2BnjX6JTeW6PypaNzXAJUz8Ooiu8?=
 =?us-ascii?Q?Vvq54d9f7ojpwlxNEbKx+o7fCBfbOcdtFlZLYgU/fGJ1b2/UwLUmB4V5QuCy?=
 =?us-ascii?Q?Lp/GA1bmVqPZw744JzLPzpOiJg2HhHTzSaAKFms6Q7R96YURpcm3Ipe2Psv3?=
 =?us-ascii?Q?lzCxm2AbaY3gQkWgbxUPBH8Ydu67doNvbQIkBD3+jl6wkvl4g4whrPUXT7wp?=
 =?us-ascii?Q?HjIU+cXUhsfEBz3RuPR/Ox6cobufrxv+Hp9KglTQs46f6CUXi23AC3U8UR5Y?=
 =?us-ascii?Q?oTlE3l9nDYct7X01hpU/Bm32leY9dxhkrqk0H0e1Kqm8DsdQtZh9k3lbSRbJ?=
 =?us-ascii?Q?Oh/qCIL5kZF94hUrUjEl8JCH2H9zvypQ2EQ4GZtMJbSTqOhwxHGZmi0IXo5n?=
 =?us-ascii?Q?yq2Iy2uuiFP36EnWTvRon5bZgG09VjBfkpF90Y/jmbIPvmFx6PJFT/FSWZou?=
 =?us-ascii?Q?pTTLp8ZdgWv3jm3V325vtTo5mr7wxJDQhSKx2tDctP/UA/FwM1GhjS4ODmmC?=
 =?us-ascii?Q?oP6H9b84RSx7Ne6Mwg6il81/lXTMqdUOvVZaoF29Yzv/XgmGMjD3glitR9Tc?=
 =?us-ascii?Q?yJCm//kOrPTvcAR+aMdq9sUx8CD4RtyRLl9gVCTUDEBpVIyUsYmsi5LvbC+r?=
 =?us-ascii?Q?xYXWO8MzmPR23RJkkdHH23i8Kk88BowSsOtuOB1tsyCAwGUZ9NHPhkSoti3q?=
 =?us-ascii?Q?8mVNm7iTysoc2vJXO6aY8KLC5Be1H6zXjxlQ/LNYTbrrf6M3PlpKMmRq7qRM?=
 =?us-ascii?Q?eMMO3N4GcBhwRKRE/CO5OqjZN8u8kLjEXi3vzfUrueXr7j1QzYuAVpK01CEN?=
 =?us-ascii?Q?4gAMgJPc4o93nqEv3Jh/ng1/1wh3O01LZcdwsJNUlzNqol4cP2bn3EhEBaU0?=
 =?us-ascii?Q?5j308Qf30DnUj5KiKT5XBNyGZ1/6uTT+Gde1psqcurt4HmzGN21yBmeGVOoP?=
 =?us-ascii?Q?/6YH3feDsK3Yi7oD53TSMZG0+nfgGAFcazEwjQ4M?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8568480-8bd0-4ad2-1c5e-08db1e3260e7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:03:12.8826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co15gzt0ZKHra3IYk5bFC0ERQgt2mrL35PuHQPNcTfYVksu61y/S1q5yhzqDUHI3oPCltkY8ia0iYiD1VxV4KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-Proofpoint-GUID: R100Almvc4kazaZB20PWQJjgV1eukfdo
X-Proofpoint-ORIG-GUID: R100Almvc4kazaZB20PWQJjgV1eukfdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=895
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101394

Changelog:
https://github.com/strongswan/strongswan/releases/tag/5.9.10

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{strongswan_5.9.9.bb => strongswan_5.9.10.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.9.bb => strongswan_5.9.10.bb} (98%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.10.bb
similarity index 98%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.10.bb
index a11cd5a6c..9caa248fb 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.10.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           "
+SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+          "
 
-SRC_URI[sha256sum] = "5e16580998834658c17cebfb31dd637e728669cf2fdd325460234a4643b8d81d"
+SRC_URI[sha256sum] = "3b72789e243c9fa6f0a01ccaf4f83766eba96a5e5b1e071d36e997572cf34654"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


