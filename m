Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F09DC7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:59:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3884.1686128337617444848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 01:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=552229a68e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3578IoK5000773
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jun 2023 01:58:57 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2a80rgtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 01:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A05B5DvcBxu3qjdFbpZpTPJ6Ma+bN1EfLVzM3EkuB9RyEkpLfmfC5dUPJV10XcCpVgo0LrK05vNEkD8DHtcwmFgYrqWYEA59EjGeSZfrHyZLg8rzSoSUNOJ85Vv3UPf/bOIfxLcapOYaSEEZAbl18vHdGg8XbWihgebFGDcbRq9xC8Qrq186lJW5+ugWfCbbQYu1Sm6CPx+zkjYHPlDQEHAqZ2wvDyEtsWisLuu4yhde8Tg0whLbd7aHTwN5IiIMhdMCTFB8UhnJzQB2+7uliS3F7vqObAhtzfpGy+Rsp/nEwKEKKCfXFAGGeiIXNmSQpDIxq3K2sdZ6r0WBIzcLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0sL8PJKxB9qtSIUpKbMjCZON5wT3+zgv3vso3gAVJw=;
 b=MjprTajOtorayDAYwdjHfCuUZR3cryMm3r/L6YgMX2gBkO8d7ONIg0mYl5l9FDR8sDJf033Mb3OT+MELUZBHV3vF0oujdL1XVRGB7j/VWvUlpojtUU+9A9MvyC1iIjaj1WHOiO8FrJl5QDUu/2hroa5I2zSLZGIrDysP4yggPos6AlkIsj1SJTjyYmFeqporCIQtYMsAINuJqbKagJFFm8smCk6VLgfTVjOCmEW0rVE0Jb/IDSy+7mlfc4EtIKL2DQ2YaGDdGqG3+H9Eh4P73skyjWDlPkDMmkUheDJz+789HRTOschthR7bZpfa8/1pxOujYBDW/4p/61PeTfctnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by MN0PR11MB6086.namprd11.prod.outlook.com (2603:10b6:208:3ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 7 Jun
 2023 08:58:55 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Wed, 7 Jun 2023
 08:58:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][mickledore][PATCH] libbpf: installing uapi headers for native package
Date: Wed,  7 Jun 2023 16:58:34 +0800
Message-Id: <20230607085834.2426155-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|MN0PR11MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: e71905c8-39dc-4f03-f25c-08db67356bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3MTkfFvX30+2QEIPCwP/Lu9OnqGscrUXk+W0y3hz6cIzRh/+Krg5C45/muMmjk0agkJ+0bOI4FgYP86VJyQIFi84gazxmuVewVM0LtGkBtfyULcApgMG9RY1i5p0RHBE186hD5WT/ZIi3Ta9WjrxjXiRxWySbV3D0+CpVR+DrrbRAldtBYhDzuu24XMCcwecq7u9dPEqYQF49rcXeBeJHZXeQodKv5ggAGzNoTZ2/YLjJnHbypG0a4V8pNWYntZZ9HBMggqOTK0q8l0J/g7/gX9Q4iUuylG7rbHWdonmP5XcbRyR09hYNNxoNQbVJnlDUGqiBTViZCXnjVRS6Os3XUZPoBhESpb78E1sXiny4hX4X7306YP6bWSMMPv9efIlz7bfypgL/LVFn1+sfmhUzLzOTJY7t262mc+ha7W6kqpifiibYwUdUB8PpOxM24dcXhCJP7RMrFGRYrZTrDpRz6wwi0EwFkZxOeJGyYBO3GEngnlL54G785J8J69894nH73L3sAGsEnddAVJP13QNTIFED2gowwe/oX48V+srZamvLMh+kkMeZStUbQ2cOsIJYfAgDFsAjIquxGu5IXezWE6K/q4PoQdQUC2prdn+ScrHAyyKzCmB/6q5tJz8jd64
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(451199021)(26005)(5660300002)(6486002)(6512007)(6506007)(1076003)(2616005)(186003)(2906002)(4744005)(83170400001)(6666004)(6916009)(66556008)(44832011)(41300700001)(66476007)(52116002)(478600001)(8936002)(8676002)(38100700002)(316002)(66946007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ykSdQjQ7cN2mnWm4nCa5YRaBNz+fE45YYYXCu3lrcCNsok0TkV4uze98t3QP?=
 =?us-ascii?Q?prk+ijKzQiFxoCsszkJ+QPXEE0H8O9/M22oCqWnaIXiBuhwpBDBFwJ8WPbzb?=
 =?us-ascii?Q?cG/A4YSuPX+wDkSVP3/nMgGWLens+D3/TThityx3BwkYngO0qYRd8C6yhOdL?=
 =?us-ascii?Q?nSjxtxZJyJtW+rEvkPOY5fiHbbkD+g/GaJ27bqXzyY59ZOoZpsb12nsgReF/?=
 =?us-ascii?Q?llkeXv0q8eCDAi3r2XSePhaHJhko/kbvpGx6YZe4JJzbHVCUW8esfVRglXj4?=
 =?us-ascii?Q?n25BpH8ueoXjgxrDvHzBTnQZmQfQcLjXsb6ueRaFKJjpdZNDP3A48Bt3m2I7?=
 =?us-ascii?Q?Jxg5023a8cMykGx67aovek7aXQ+Xb/1TTIch22tKMmFSqhVTUEFGosgcRup3?=
 =?us-ascii?Q?H6q6uWvcMpSQC9IV9Sh6SEMX018HJ01gXh/filLpRcBVEK+Y7voA2wBeOdc9?=
 =?us-ascii?Q?Qg0D88glxk9enhuYhSLgbbGacytOC+mXmT5L2edsFM/YrZrRXgUqI5J2oarw?=
 =?us-ascii?Q?OVFYBIb37sIXWBnhJ+bxgx6InNHLA2OytQ4OquxyIFGQ9evcTRRnmgksMSwg?=
 =?us-ascii?Q?ZVMcQdmcl9j03Fm4n6wfdINjFKjtSpaW0RTcjwii8dNs45ezT7NIlF2IAY5b?=
 =?us-ascii?Q?uEA2SopMEWnBfutFDH3Um9FES45HtplfZYYwYy9MnhZkbo6o7+Y5re9dBJse?=
 =?us-ascii?Q?niPXUU9W/M3Ia0A0iwpYuH5upxeQdRdQObMYhRk4B6Njz0NvZ+N/6eDg2G4u?=
 =?us-ascii?Q?39Q8ZJFc2E74dSjn5LoSH42zi94DSMdg0wB294ceZtiIIM7cQw3kHfDVNAPp?=
 =?us-ascii?Q?/GaSLqbfJQ+ZscyC3h5maydCdHduyOrfS74Yj1yRqaJ4btr+Q53aOukh2NlS?=
 =?us-ascii?Q?ORAb4fyVj75YtAsEtqpilJyyZEETdOGHUY71kYMQPpxgUu0BoWXEyicSMODg?=
 =?us-ascii?Q?nhEnTxBZMNILplC61hZbiAflhXzj7ebS91CqcnQ2YF1Uz5l9DhR10uNMm+TD?=
 =?us-ascii?Q?QbMxvg1unEF1tqXLDr/h/nE+KzvQWtteKuQuBywqI+3Fe3BlgXsBQNNnK1xM?=
 =?us-ascii?Q?mgwjvmGmBuaOmIed75fNK2CFy6LKsRzKgQVAtD9ZbwUfs4PHzPXVC/T1g6es?=
 =?us-ascii?Q?Pxf4enGClnSIS7hWkMlTSzhEgIV51zF00w0JgfPS7nr7ke6DGtFKDfeO1AXF?=
 =?us-ascii?Q?dokerxb5QIEUdbv11vBbAWCMZ1snkmURFjJvJg9tcJgRYGR939pi1SXM3uG3?=
 =?us-ascii?Q?HpXVq5wBabRQQKiEWVkxtDNg7EQau3FZsAmWfel7gP2nuJtn6KJE4Hg5oOAy?=
 =?us-ascii?Q?gYMlRuuHV0LYbA7oylZMCPdUKUAr5lER79LmXeIzr5s1MtRiGsNwxzqZn4uu?=
 =?us-ascii?Q?kp28HJn3kpFNjcZgksMLDo/vj6AUQw8tLReA+3CzpcVIVFBZbKfhDic/Aneb?=
 =?us-ascii?Q?jkGYlMQ6yqaUGKjwasDiWYlqradlMdGjeKhzKE7B/EEYTDnjUw6YHYtz9IeK?=
 =?us-ascii?Q?vL/HZ7J8DOCrJuX80iDOU8a6n7PI69Jhr2bcl0iduAdOGJVIBXwbTpGycmma?=
 =?us-ascii?Q?qM+uPlGVTsbeSL1A947ascfK3Vbf9NoHXqXfXtLzaB5Rct7z8crTJnll8nb3?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71905c8-39dc-4f03-f25c-08db67356bee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:58:54.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADFXkiKeDj7h8s+42y/TsxOP3xFYynl3q6cqCW4daYgxzAiKixVs7Qqa5PhCGttKXVbJI4SLpTgBkdwIHC8Ph4hPcf0jx6Q3AoX7tEckI0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6086
X-Proofpoint-GUID: 2b6zsbuSa3bRvzIcC-wYvKl_Cfc9FbsS
X-Proofpoint-ORIG-GUID: 2b6zsbuSa3bRvzIcC-wYvKl_Cfc9FbsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=746 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306070073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 08:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103172

From: Xiangyu Chen <xiangyu.chen@windriver.com>

using libbpf-native provided headers for pahole-native or other application.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
index 1aee51f1e..9517481ee 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
@@ -17,6 +17,7 @@ COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
 S = "${WORKDIR}/git/src"
 
 EXTRA_OEMAKE += "DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+EXTRA_OEMAKE:append:class-native = " UAPIDIR=${includedir}"
 
 inherit pkgconfig
 
@@ -28,4 +29,8 @@ do_install() {
 	oe_runmake install
 }
 
+do_install:append:class-native() {
+	oe_runmake install_uapi_headers
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


