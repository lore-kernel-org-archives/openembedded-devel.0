Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5708C43219
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.553.1649867224237728883
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Mbjxubaj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1102c8cae6=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23DESPQn005654
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 16:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=P8QeBImHlM3UDy6ekN+AUOtKjJ00sWUne2vuDTwnMP0=;
 b=Mbjxubajf+M5i+EHYh2KvizyhimwQUOSdOL7aR8FNW4YA3nYOiNpNiisODCd5bnMazzr
 LbUM5BzKwC/kegdE2ufvlRZ6W8klyRV517vXm0VwdaC7HRKodAv3d5bpM0Lgf5yamkxl
 Y0fYiZdPZGejcaapGwty4CKXZBM2p8rzsI36J2xuUJ3eNvJsr1ngkWlfhMV2Whj9aHK9
 7y0ChVagNYSlg+THbCnEKdci/fmxI+qFzwK+xW6wu5F9O5bh01YgTyScaf5KuGTZNv5T
 V147eq5nQUq6WzclXIN1W+QRchAp4tTAdyHh84rQbXFr+FSFxKbLgspEYyhItSavsUZz oQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb6fwb991-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 16:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqokguC6RkX/YteRykl7dKx6hktOQKJZUWTRtoy0/j/qIh1dP1NE8xeTVtQ0JGpZRkbC1ibVbrT2h1hzpiVXlheKfXWZlZ3xjS0TEa738T9kByOe2d5V9LQziZGbVG2rq/JWT0qZczNLkLerogjUwtZ3Rt6r7RgkEJxpLJQZ+7+f5UaS/wux5zcjDZbIA5+AOvhWlqUi/62i1qNi2V6RPoXaDw2UoICY+H39CzhZ11xRcuz2wQTd1jz+Jl5FQiFc7LvoJ0qzpuZhYrL2U4sapJ5sPHsNOIRjntbwzqetJYTaCGp1/JRQD0XVtZ/I91DDPRZtEln1j4Z2KDmEruxodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8QeBImHlM3UDy6ekN+AUOtKjJ00sWUne2vuDTwnMP0=;
 b=gAeBM6inBYOpUb+ZnwykcRb3CjOgwa/7Um8CH5F5WemvAvordRurvPNDCHdYaP7favkI5cZDT2/PuQW4jPu/Ylq/dGT6zAxhvi/o8XoE8otoLn8Ous1X3EaGGzt1zFEfpKQLwtUPlDDADrHmnXhUTNUjOJ4nGc5sLk2Ul74EUuldsMLWH7KJz/0OF3Vsr3ioaW+aM3E09fKVgW/0TG7rTS7/1+ixRcLZyZiPZ8OSxsysw7A8c7LftnmmNfMb7bySAvsH+y5hGx6zIa0RHKBKwCemrxVt1+7u5Z1dV1miiCQBF2CtG5jC2DvuSE5jXL2ZhgIBMMBdGBvimAKSXW68dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3095.namprd11.prod.outlook.com (2603:10b6:a03:91::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 16:27:00 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::451f:7e82:b7f5:8c6e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::451f:7e82:b7f5:8c6e%3]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 16:26:59 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] phoronix-test-suite: upgrade 10.8.1 -> 10.8.2
Date: Wed, 13 Apr 2022 12:26:15 -0400
Message-Id: <20220413162615.4697-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca883ee5-6837-4fea-7a1b-08da1d6a6ec1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3095:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30952CE3F3FD3154D395DE719FEC9@BYAPR11MB3095.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eT80ZUsonll/aWhlpjd549KGMa+1F5EFK++WbzvfB0P8jphWiqmD6aca4JbCHLLfMsO1aKCcsCS1/hE5E58cXj+PZVnIkw2iqhlPysmdljPQvNIwUqjt0w/0EXEpvHFV5wxNtF/nh87KHGqunIO0sdHMtxi9Mcmk5dmpHx5ouqGqRo/yR1/klEe5R/J68U0gAzUgfIS7kru2Gpq8YbmtTBIXXusSa23+uRtXkBgS5WLEhvHwua5nIbPH3zLnvXSDICLMiUoKuYRqWYtV0mfB6fQvFHnessdZxU5R/BwM5wFsaXyUkzZ+GDCHbLXwvsVI8crLF0IM5ytBq7759gA6XWfiNijFe9X3muuiJ896FN03gvKOuU0Sg1A6MY29dQ6i1dSTadYYpUu31s8A5Hg5J11p9g1TKfS+CBeyojN4eDP3If3tkxB1Zk71Szq19MYkjmGi0jFq4TcNWpQ7Ji6rEP1VO5lRS7Cl/cyw9R65+3488vCfittfGpzBV4dFWhUSAESVdLj4/ydGcXJpnfAV513HLalOIIGpEIaYkST1/8Okr3acgyJ2uSdbQbpgq17hLwlQ3UPoanv0LRUMhz6Q6WcApoazIwvC6se339AH40ZWGTIToYudWVB0JBi3eY8NoiEqMOvEV8qLVrbDwPuRHzW3tMkzVmZm0vHMrrFwzTyqdAUEfjxlT6HIBeiSZGqVsGlWN5Cxi/SjdB/wghwiULtfEzXEs6z7P2QXyjMXElbFVuIKkOXgCsf+ABqLP46x8vOR6ZXizncj9JUTG/x5og==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6512007)(1076003)(2616005)(5660300002)(36756003)(38350700002)(2906002)(66946007)(6666004)(26005)(6506007)(83380400001)(44832011)(52116002)(6916009)(38100700002)(186003)(8936002)(6486002)(66556008)(66476007)(86362001)(8676002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ym7dkrvMj5kqhRKOeFaKk7xR7/sbcD66j/xl5WlceYQDUu+kiNn5BSjM6uAf?=
 =?us-ascii?Q?o9if+oPL3YhbIiCvf+3mRWl6UDnTMyNYOhgX7yHgcqBqyuo+67DLa+098iyd?=
 =?us-ascii?Q?r6/vraitjwE73K/fiUXt/1FkC/2OIJ/TciX3PjFSWxQ/JXHKyPZjV7X8S6VY?=
 =?us-ascii?Q?BUTIjAZkuZ1B/MxkLDWBq9EbdNN642SeQTPSFHPjhncBmqA4j7sLtY0W8TZh?=
 =?us-ascii?Q?I5lkuiySriEQTD2wJat0xDZsh+Ja5BoXoh1bK62NgBa9Ux/Kt23VOy4hfNoW?=
 =?us-ascii?Q?YB+CyiV98EcQP8/sam7KlYKro1RA+GioE2qoMKsAAgrMwNa6L6js7oLf4jGD?=
 =?us-ascii?Q?Ii09BxGJhJN9dEPbNLEOjbG0nU2TOi1OTRr3IaWbP9/sK1sdTKKmLNhTHmjH?=
 =?us-ascii?Q?O9Ptu/HkPV4zTLfdQYs6YwZb+l4NuFlYcIvNo3Mt0ojyMFO8vZyvBLOo/dAH?=
 =?us-ascii?Q?AG8Oto1pJRx9uT/2RLveOKeiEHw5ljs8exqqg+oKGX85SQT6McG3ZvE2f2ua?=
 =?us-ascii?Q?vkSOiEVJpaY10D05TMT9CwvYxQJ9H9NaSp8euGp/bT7htFph7VUQVGPmux5p?=
 =?us-ascii?Q?a8ehXCHhB2SF2OFxRjSFjIfVbY/LIWvg7w3VA2YDfsZS/D0F4IFoKlks9jZX?=
 =?us-ascii?Q?8n1rzZbvYkEfSFNlYCcplazvWAxzxrqkSGX1eC36GD+O+i8MINJmRg95G2zi?=
 =?us-ascii?Q?TJXDfcTcJ+imMn+/peJFo9ICeVqcj71tP9e1N7/E6WtQ4ABlBRGSvqlG9iaY?=
 =?us-ascii?Q?z6kpNpZIKtsLtTwMlUF9q3Ci9466/v3hSOvVoduw4hvcH8vzSUxbYD56OLYe?=
 =?us-ascii?Q?Dl+QElF2Cxt/qoWkdvuUwQVBVb0i9karLqTIvI8NmO+SdUbei5g3sd2rZOp1?=
 =?us-ascii?Q?yI5RhInisNnL4tOAwsPHuA7Gg1Ywse5m0+w4yfHIvYg6WTAxWnbdWRbJjI/n?=
 =?us-ascii?Q?9d2XoJ5wEwdu5XtHodUf888enLrWdqQn67YjzexRX72/C4xhe4mon71My/Ae?=
 =?us-ascii?Q?BuNXhVv8DIGDB73INCcq+8rpvC1BAgTA+2rW5q+5dpdAQgDOYtPp+maU1+7M?=
 =?us-ascii?Q?BL5XZjWJ9GM45s2XSGfH97xSrPifnHmXNVC4b40/3Hk0oCVEYOVel/Xa2VBK?=
 =?us-ascii?Q?c6Jnk2BjLI/msM0F4SDURCTH/oKlces6eKLLlgRfIxv8cKua9r/IdsssUY9p?=
 =?us-ascii?Q?VriF2ma6Wlzma0KpsMlHWozjKKX1qsgbxJxoYNYuMMzPFzpIn18S2OONg4Tc?=
 =?us-ascii?Q?0uhNwjtLKdSEO/WMjVhIRrjl11CENX+m7fdfEBEilxQHqOAhdomuCbxntMTx?=
 =?us-ascii?Q?Z4NcrrfhM//IUdSUpJxWY8kLBcqOnl6NJKRI4cORfaTEBIS5sf1rQ/eAImKo?=
 =?us-ascii?Q?LSMLcz4jyCcGNjY1EO0nUuuXnmQYEu5FsyoXIqh4v38+xjEpNb5gcxNQwRME?=
 =?us-ascii?Q?YyEB9EtNdZ6QouC1G8vdmttvoBuMipnQbdRtLbm1hMc4oNvz8S/WWVVWuAaa?=
 =?us-ascii?Q?DxPv9VWn09BWb7An5yYiesJrB9axsC2cwqVR/v7FLFzoNwf5FMmFMt/m58Gf?=
 =?us-ascii?Q?r8xWsqIRpSf/mpUyhHiXpadsLYgHvmiZGgv1OhoeH7O6yIacu/l/Q3yLrIcR?=
 =?us-ascii?Q?KU76VIhzft4sztCTsvHWl8YAPMOBzuASi/vWSh+0ioO1Fh3Ed5FmeQHL+tpn?=
 =?us-ascii?Q?wUZox5sOYIfLVPFlwp63fHsGOnbOWpXFoLqc7kOhQ7mKytrd1uYDqOBXFfBO?=
 =?us-ascii?Q?YGWLhji5QdMMyCuw8lyAPfMxpIb5q6k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca883ee5-6837-4fea-7a1b-08da1d6a6ec1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 16:26:59.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W2Hl0aq1Ok8jilvoEKFBuoM3sYAlioWLrTeV0saiKlFFrRpPD0UuDfTVIrkOC8FAI92lXpf8pkfU/JTFCBdW9bimAodpdJJPaMSv4+EgNL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3095
X-Proofpoint-ORIG-GUID: nyBdnDvip8QJHfnGFCi1zHstrUv5-sjE
X-Proofpoint-GUID: nyBdnDvip8QJHfnGFCi1zHstrUv5-sjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_03,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96620

10.8.2 contains a fix for CVE-2022-0571.

Full release notes
(https://github.com/phoronix-test-suite/phoronix-test-suite/blob/master/ChangeLog):

Phoronix Test Suite 10.8.2
13 February 2022

pts-core: Arch Linux external dependency updates
pts-core: Workaround/fix PHP 5.4 usage with RHEL7-based distributions
pts-core: Convert compiler / multicore / single-threaded test suites
into virtual test suites since their properties can be auto-determined
based on OB metadata to avoid manually maintaining them
pts-core: Add virtual test suites for "riscv" and "aarch64" to make it
easy to show test profiles that can run successfully on RISC-V and
64-bit Arm hardware
phodevi: Improved detection for components found on the Steam Deck and
other hardware
phodevi: Add Arm Cortex-X1C detection
phodevi: CPU temperature reporting for additional SoCs such as the
Raspberry Pi 400
phoromatic: Additional input sanitization and validation improvements

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...nix-test-suite_10.8.1.bb => phoronix-test-suite_10.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_10.8.1.bb => phoronix-test-suite_10.8.2.bb} (91%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.2.bb
similarity index 91%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.1.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.2.bb
index 6d181a5bb..825f7024e 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "9f107c080407b7ac195bb04e6cabb83b"
-SRC_URI[sha256sum] = "3b58ea694419ca608d729fa6ce72ed2b4c51af444729eefbcdc6e670290caa7f"
+SRC_URI[md5sum] = "459c3c45b39bb3d720ddc8ba5f944332"
+SRC_URI[sha256sum] = "86681343d20415831ab16ef6c3d1c317e2345e771925e0698ae920a03a9eaab6"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.33.0


