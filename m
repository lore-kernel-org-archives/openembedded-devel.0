Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E444AC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 05:02:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.50094.1658293327925005389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 22:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kUkfRqL8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=420097caec=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26K4Wx2Q026898
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 22:02:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=WdpxDxjVi9jmmmVz6/QkmnGdPERLG4YAnB2xChvASOI=;
 b=kUkfRqL8wsKs9PTWzRN79y+A4ASgfwq/TxVdOxZm6xaNf/VWkRisYJ7L6+FE9ZWlkzVN
 TQIAU5r1t3FEa2eP2NHW3Ief4UfezPtjrc9pdJnCtGKAjx1dt7lmKlwc3e3TJTXb9zAQ
 0cSRdy+EFfV0WKQKmAsUJe6NDfjOU3dVbn7jj+HM7mhsOzdR4E6NOFjzSMNY12aQmD58
 a4ujFLL/6VpHnngS24Y4c6P2wVzHwJz1kyG/uFaW9R3SMOs8ShUc7rh3fTZImovba852
 VvqsUcTkoFSBh79aowttr7cQF3M/UcQO8bUxHihNAEK4XOq8YmxzOmWeZ0QJVudBAdKZ GA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvuktnxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 22:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRu+FZBXAM/3cOTw4je754Ggr9b+Y/Kn85g4IURYLri8Td2vakjllk6qNDtxtxue7PKG3FOSSVYy3xl0azCGjIoVLbJTQT0ASHY8osu9bvOy/AVZ8jSYJESV+iAFDNhrkgb/jUSg8zEX83i4tz0kZ5armqR/+Lnzb3XFOOsDC8fCNWYYcSRhrKc348mGD6KmJ8iJ+Kn+55OBYgp8YUkdUBt5mu+FpJe9TjSbCZpcKMut9QbiD4lYNXjWeVqUsJt9msyCl5tqF9u44xXmMrf6pqnGf7aryOVJzA6167b1u4st3+SiK1UkE1tS9alUic+qsDHKGGG/8l93UrVaiXhqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdpxDxjVi9jmmmVz6/QkmnGdPERLG4YAnB2xChvASOI=;
 b=aaAeB3+859DUnDETYYWVF1C5AC9hSWEq6jVvN9cKP/qcYD/taS0Z+PfJlj6lxNMJHSRP9hkI0QWkejDi533bPqmVTg/2n3oAi1jolmZMKTGvCIH5Vaw5gcmL5d6EQsusNtpX3Gpu7e2hvAxtrglNpy2kA3+PNFhPOofSoOlTjuvy5Dt6sEqKJ5iYjbHeJeBXCeiIKjls3bpgGXxzxD8++j2rfyzMSFVQ6PuEJJFnWtPcD1/0tkA7ybkVZaf8AI2fo6U9fJH+l4oT234L5l3tPW7bDM4pTmZgQLsU4qNpbTKGZNSRVgWvwmF6aby4DTOzK/AifCB3I4xZAcowu/56UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BYAPR11MB3045.namprd11.prod.outlook.com (2603:10b6:a03:88::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Wed, 20 Jul
 2022 05:02:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99%5]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 05:02:05 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-xfce][master][kirkstone][PATCH] catfish: fix buildpaths
 issue
Date: Tue, 19 Jul 2022 22:01:46 -0700
Message-Id: <20220720050146.86301-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c5abc7-0993-4e7c-37f5-08da6a0cfd5c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3045:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A5eJMtKhXUPEMAc4RChkP3xwN5c7j2Bs8gUjbAo4XHjFmHrJErZz/C2iWmZcIkHY6ym8/vxpfXpxu4eNO0WSq6h2s+dUa01+iGW8kxJi0Wsp7Cn0VVEJzKteSIPW+sbUFVpDRXxxqaMgMCA8D9UI1/coApguly2eOBJK3tzix8q2zpFT+omJ4Wbn1mNXpwz6q3r7VDE+ohJEpVRnftf9bKYh5eZePfBqH0sYqc2EDfSokLvIQzRSQCOSmv4KsGxqm6LGbUly5KVhmqQcRpyiQ1zkD9nsG8L4rvIxw4j6SEV20cEDavDRkUnwTd7czchWeJtUXSYbH/MfdGwptkYM7K1lN+QYxARbHlvucHH5Hopw70WAy3o4Z72OTLU/en5S7LGVdgYLqxDhRZfMiKTzOKbxNXj4G8cIWbTqkSkhfXcC0suO8byH5Gj7YItXt68Yrh06PytxoEfMrQup3j75NJR5QO4nNQaahvNzvNse6JJCM6k/46ybcPUij65wDmCru29w77pWMypwsxiqaYeldc7ju+/QnpOEaj+uu/li/y0HsXwPIgl66DpX7s+I8WFb6sdcZ6cTuRGLTnfBnr1Yquk/fqXIK0Qn/Ly8C70sGZxkIpfZv2l8PdYZ3aBfQYZb2DPKME1b4yHyG7mhSSVBSSCQEXJQKIhkwsMow95BkDz8y/pc/gzc4lrwED7cEokiB+gwuTwyWXu1BZSb5NInEwQsdQ4n9qpvlua4IaRvs28dXW4kWGqsG4JH6Di0stG1tXVWRJ+vqjDtsq6Gjg42ekgFPNdKW7N3en1eBeBiLNe4rkDGfMMAufSn0FWdXrHq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(8936002)(5660300002)(52116002)(66476007)(66946007)(66556008)(8676002)(26005)(186003)(2906002)(38350700002)(38100700002)(6506007)(6486002)(316002)(6916009)(6666004)(2616005)(1076003)(478600001)(41300700001)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mj0zyzIx8MQWcenkmAeThK5hhf9TKBoSztmgM1kcAOMQrBxz2R4UV4zzSEzB?=
 =?us-ascii?Q?jB2q/Cv2N2WHQHBrJzZNoaWB0EKmeALh1Y8fg0FQMcNTNwGVbagWp1Eb1fY9?=
 =?us-ascii?Q?BlirLDIZ8sPwwokq3/vk6+crwYgzdpfkQ+nIAgpoOMrmrT/LVRjRqqqz2eJ/?=
 =?us-ascii?Q?QeTOBIiYbyQathwriJeFlV7waOThkyzHf7+nS1C+joed9JtJUVA5hsFHVMGt?=
 =?us-ascii?Q?UsYUMpUQ1MgHacVEFUjcETnl/j8pcN1nVhbZrHwNufufr3w4phxaMFeh0lNT?=
 =?us-ascii?Q?vlnIyx2ST+LubTaCoYGP9d/sH3FpUfh5HPt66M/8ekxGzKT6ttp8JcQw/uJX?=
 =?us-ascii?Q?5SgXNvYdR0DEwD6n+P0FV26bPASu47IJcVa5MwN4AhxoLwwJJM1hL5qH71wN?=
 =?us-ascii?Q?FVtCPt1MZOPHM6fSeye0yqI5VPIoi6knHMnLHwDjwGnvrBDSUV/whxe7bo5z?=
 =?us-ascii?Q?EIuistBSQIdnm6azXfnUOj63eLRH0HaqZJL0cJ8f0NFYvepHz1NmHpPOA6zG?=
 =?us-ascii?Q?lJ2ouxyPmUc8EKScrBM/vT17Vf77x26k06bsg6+BwJh0q3IXWqeejLn92HTQ?=
 =?us-ascii?Q?GutpwX+BIiLYQtahcZxjTl4LAXpZqir33xhyOd9/U8K8KT+oDaoESraBlxvM?=
 =?us-ascii?Q?KT/2sJhFMw/Wlb14gQ+B4gukeeutJ0RuWtu108PEJNMmIsIEpJdtgM7yDLBp?=
 =?us-ascii?Q?2mNS4AM7IWvnujMqIIjPXJB6UQ+qqacYqiCA3J16Cr3wYP27FYOMsBcJIprP?=
 =?us-ascii?Q?xsHjL1/yhBnH3s94ikFnfuhs7NRbZAzBLm5BLtZAKQvzPkFRARcRuFwmybIQ?=
 =?us-ascii?Q?TKd8rMQuqbOriRaMaBy+AtV9kY1GhVWjYJcGSk0RtoZGxN5Hrnt3J4TBRKlv?=
 =?us-ascii?Q?mMXEGRNa+ptqSf6bx75y+Nh9veA+4JvQwo2dKrD4oIop6qOkb54/eaKwUAOZ?=
 =?us-ascii?Q?P0X98k+1RiExjKxl6tmu8IstJax1Imuj0bY/I6ky3LRbDt2zhcJBx63JyevZ?=
 =?us-ascii?Q?7khmuq3oLNc52cDZD9c0TUDpjJuGcpLUxQ+2Ye57AIH8ltUi1O/XZh1YKjMG?=
 =?us-ascii?Q?TTQoLZQK3iHubIKL++0yt6SnV5APx7xmUf1ws+DvWZ1vDrbuDVijkZ8XUwwm?=
 =?us-ascii?Q?zauJzCbIU+ylQ0cuxhl+jrA4vPYER5TTHO736HQFtJHfa16DotSwMkd2c8SF?=
 =?us-ascii?Q?e8/bYYuxpa68/gZO4vroC2kho2UWI0LIW5JsJAsQFreUe9wBDSlvWvPLntAX?=
 =?us-ascii?Q?RZ7vv1AWdUiBjbZecXUWNNGYnT47oKnbFlVCDKeZNsxaj3X0HoSZyLXFh9ab?=
 =?us-ascii?Q?ClUxIja9JU/BeIlPjn9EXUtg60RqwJITus8QsS+3A4/fdE5s1NC/3zJsaphd?=
 =?us-ascii?Q?lpSzaL11Zuxxy7jC+2qbWE4ND7mYZoa3tWonS/fOFvCYGZh15S18PcAcE9ME?=
 =?us-ascii?Q?25xQvkt69xAvg7lG88ERKJK59N3h6uSt6T+0ZdaHanS3PB+z77pT1J59ct7P?=
 =?us-ascii?Q?w7BiHDdxcH6qmg7vYVH3/DfjK2xlr9OJOyQFamFAh7pjZONZ7RO5XTvRb5WJ?=
 =?us-ascii?Q?hVHb3XeVeUJ+IDiXN0NMgUiGPr2U7oFKGpEC16uuQC5Rv6oUUaHmTa/0wbC5?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 97c5abc7-0993-4e7c-37f5-08da6a0cfd5c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 05:02:05.1833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n5dwWDQZfg3C2SDUS7WMdNjzHf8vjpACgDAA8/kZkWXckyxc0DL0kpehj3lRBTTd0NTxF+9osWyLMsJfTnuKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3045
X-Proofpoint-GUID: C7N67J-qy-7IFJpz58KNyS6KI_vOi3oH
X-Proofpoint-ORIG-GUID: C7N67J-qy-7IFJpz58KNyS6KI_vOi3oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_02,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=795 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Jul 2022 05:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97906

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
index 98cd251d2..8fe879b81 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -12,3 +12,12 @@ SRC_URI[sha256sum] = "e9a99a62d10981391508dd43f3cbfa2d50a69bd6b7d1eeef7d30ba4c67
 FILES:${PN} += "${datadir}/metainfo"
 
 RDEPENDS:${PN} += "python3-pygobject python3-dbus"
+
+do_install:append() {
+    #
+    # Until catfish upstream figures out a way to overcome this buildpath issue, we need to do such adjustments here.
+    #
+    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' ${D}${datadir}/applications/org.xfce.Catfish.desktop
+    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' ${D}${PYTHON_SITEPACKAGES_DIR}/catfish_lib/catfishconfig.py
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/catfish_lib/__pycache__/catfishconfig.*.pyc
+}
-- 
2.37.0


