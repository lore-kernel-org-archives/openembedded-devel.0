Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F22DC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 03:06:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.63792.1701313569482177481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 19:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D7Oo+TeA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0698f2e0ce=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU2Z45C006950
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 19:06:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Dpsd7ngz4l5hgnR4I8
	W/fVaYZVyP1URvs+Clgbh79ak=; b=D7Oo+TeAmyzI6xpgfZVUxOWIssgPrCZkfo
	XS9pFxdA2gPb9rDlqFpsYugijCiSMHEKiWIM7V8xS+KpEn9v4A1hdzV0kUyGT7Zs
	s5BUu7fgoTx4jJrTXl+LAPzFv675Gw3v5hHKIL/khEjjdE8nFTWplkjGVt4Hj4jT
	dOQESm5GtqA1HpJ8jFh02zM61VwUqtLznHHpkThYiqCHZ/ECpQ8MTnG3chIVTztu
	NdGedxr5k8r6RSHfbNcrXWkMaljdRa+J+4ni030ouMhbghxeVcL71cqhZhGfQLgk
	6iBvhgKrcSAJSpiDVZLIczgN6bUIz9RIDnNxwiNuLwoQ2WReiTLA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3upgxtg1wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 19:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3yZ+L1/mTRgOI3T/aJKexLQ5FwQPhlBkZ85LSZaPUdBXh2DwZ5EVNXPt6UPK3DYYaTeBAV7M1aCn08CrvXJpuJ2PHIRoeONJsjP44qaEVLDf36930WAxb3GYZ1gEQy19fi2f/4X0Tc5tUop7YLUB8jqpJ5d2uZcJIiTdpfT0w9gb7wyljH3ZuXqpSJ9HlvkjNMc/FawtivAVRh5l1njJrK34S2Xubm0uxVLjYwNlu/aDlK29ZI7DT6Cz1Uy7RVp3sjfAgugRh6aL5HOjUzpQXV3L/uBo9mwfRP71i6dqRN/I+k4+HFWeSdhuMm15KIXT5mrRz6Durja1hTLpSPkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dpsd7ngz4l5hgnR4I8W/fVaYZVyP1URvs+Clgbh79ak=;
 b=Y3Y5Xmi+9q6X4UUo6uGMZCIoZtYFf3wrBCrnYgFxYYc52YB/1OXQSV2a1epzf+RHq+E1SIQ1jse04gWn2niCj0QyelsOXf8C6gpgaCvQzk0DHJTeNWMV5gIK0s8GjgCl3r/krrUxl8krNMKIstxO7is6sNKWlsfMGo8oRKPCoz79AAzNX2fdrWgzfPstkDa2e58aRErJjB0taRcU+r+3bTtZbk/bCU9nU914S6CWIRrSXnAStR2YuD+tb9SHEyn+DA59uTfcOwYj0JNrC8lEU77USCu8qR72AghxOYTOzs1Cmp6HjHTt6w9Y5t3R7W7op7BHhD2+gklnTXT0RGsxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 03:06:07 +0000
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::9faf:5e6f:eaf4:7374]) by SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::9faf:5e6f:eaf4:7374%4]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 03:06:07 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] libbytesize: update github branch to 'main'
Date: Thu, 30 Nov 2023 11:05:55 +0800
Message-Id: <20231130030555.1145963-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To SJ0PR11MB7155.namprd11.prod.outlook.com
 (2603:10b6:a03:48d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB7155:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: e25f8013-c24e-4f3b-6570-08dbf1514be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ElvuAGSpqb2CJoWexTWByixxuLhNIVh/aadyHxbqDgzfr33c85xF3ApMVrU9BkrR0PYDihZUujmxZ9Dfydc9iKU1/dwgW5yoe4hT7HnPtT4EkdNmJzhpNh+bzyw56AdeEa5+rkQKB0JfgSjnPNy6RMTprbItHqBE+2v/JdfItkXWUX8j2dtST95S1/i6SbhPIHr7KYpoRr35ywr05no5Qd1PHhfC5BO1kVIC4SHr6QnIxm8qSfGZSxdFmYnjU37BIaJnKrj/elMnyFgIGG8qJ+Ymu6uEdx8MmKR+5kaDhMev+GNnF6+d9wcjB3BGH8UA+4Hl9QLcSXeJ0kOvi4WIvU7MkNYvdn5vgBoPVNZRkyRqv5aqdzVaz0ss+sPm1H+ADecLuXjZSK9mX2iYhNiLexVvKYnlV5K69nCBV1d/6kQmkxK5SJPvpt+Usd0qfz3XSsQMyl9WbbtvDicDdlNjSZ1vnwMQoHDBm2QFbecn4FTBNlhx0Qr+YuxYPHnHbn50M8mCIgpHdc059p6OVffQeKSPZKknZDxv5injl6WHU2/pGa5ogXCbWJVLGMAEJBpsIQQ75PpRdyEcKo9bu8QslKOJpFgdo5BOKvg1NW4HOdISNS/c/Wz0xUH5eStSyGnEOhikeDczyXpx8DfWOIUs/fcZlvxqgjcjlY7/KqLQO+E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB7155.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39850400004)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(2906002)(5660300002)(44832011)(4744005)(86362001)(36756003)(38350700005)(83380400001)(38100700002)(1076003)(2616005)(6666004)(6506007)(52116002)(6512007)(26005)(6486002)(478600001)(202311291699003)(8936002)(8676002)(66946007)(66556008)(66476007)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?So/0MtphBgDWAo7h9i6Dp02hbdgbolJpatsaBD5iC5dZ1saLe+WQnhmCekLB?=
 =?us-ascii?Q?7p6pNE+FgOIWnAm6KVr+AVRlM3Nfdhg9/6avkQYOfubH7grFip/L19C2Z9yu?=
 =?us-ascii?Q?JPwzGZcmPzDvID3Zw3ArwHWH4C0xCoM+xkOylAca+/D36qiNSBgyqi7y6dWn?=
 =?us-ascii?Q?tsOXp523jg1QDV5vCfoXUZfWD/QgDzsjkVFv6c4ndtN9eW4rA/g+IMq2SnD0?=
 =?us-ascii?Q?4quZ4dfPOz3USdVCMYtQMUFwpQZKEKeXI0leDvOwzyEcfv7TJxe2bFM7UiMv?=
 =?us-ascii?Q?dkvYJweV8g2uDspPxncu+CaAlPsxXoBhjoj5U8J4TLGHQBAMRZgW4Fz2Gf4/?=
 =?us-ascii?Q?G3JUDKEcQLKxs8XXFvJHCo1JzWHAgl+XAJuIF5etk7fw9n/VH5QBIMCXTQFZ?=
 =?us-ascii?Q?rRj/dTwjhr6EONMYzguv65xh0JUolLkGBrusAhUMR4Lhh7O3vdjBj/rNAOOZ?=
 =?us-ascii?Q?v5z/i4S7FPwbWzXd1CS3ZazNIQDD0KYrCGC6rbvDcTjvJKNnq+oTE8f0VBbn?=
 =?us-ascii?Q?BXhHm52qJTX1uo9GzkOA+E64BbYYuCYgRiFhR0yI0oZMZvJftt7YYaq9PAxf?=
 =?us-ascii?Q?o3aMO2GTwad5KndOCUblPG1t6eBuP+PX3g5hUXvemJQS1mHWQWSJ9r0d3sut?=
 =?us-ascii?Q?fSWyX/HJqt7KJ+UP01de72canp+dhMfjVKqiqCDClVtv2FvQsCOZQs/G63dM?=
 =?us-ascii?Q?OxqrA+jafeGM7aXTAarYn1d3WtI+MaMoE+zGex7RvRHFH7k/FcS1tB53aR2s?=
 =?us-ascii?Q?oVdvJ7GkB6eo1kI/EVDz9QGHavaQa/p6+4vDeOCbSM9ArC+BBU210N3Dwf7T?=
 =?us-ascii?Q?xlrnhx5R0n2MnCglZFSpusz5hYWlW8cahKE1wz5S5wzeAquJrbb6tWIf3TG/?=
 =?us-ascii?Q?09xpkhs0V8aE3xg7TYYtcEoFJdvAMDPZKUHnuaB9yW6I2oYgQTOcV9Sq0FK5?=
 =?us-ascii?Q?VcanYQKweEFGeNOYecYDTsiaQPozdxFuetJB1+lANfMDOvyOs1HyJZSrevlU?=
 =?us-ascii?Q?TMk98Y/LclVSUVdNE6AQ4EXOvnaRW5h5xRPAeLLSYqJe7iHUDYSFiZhmOQMG?=
 =?us-ascii?Q?L/MY92GaJ/v8LYsHUmXs9JwfDnvkmLjlzZZno/OL8iFIkSzoADCdSg6Qlggf?=
 =?us-ascii?Q?mzBB8Vu3tzasnpWqwiIGAtdkzpaQRGCHygUEM6CmvGPMxb2Yaj4uOJFMflU0?=
 =?us-ascii?Q?zxgbhkLBD5egUTYB0l050D1xlnF/6PoaKPCEMV9H5AZY9OX/Nog/q4f8HU3E?=
 =?us-ascii?Q?km+O+2kjagEYxyQZRUitwPzlQpVqEUjayk9WmsdzRWzL6tykGAwPmZFEXB7S?=
 =?us-ascii?Q?TM/KQbOlSAwRaa2Zz7S4O6s5xxyx/UwamuBTghNRYpu0ZqLQ17ka6bmAHEiV?=
 =?us-ascii?Q?UIHbz+elWM6PmfKWakAMmW8kQC9wEOAc88B9gsJBRMeVXdMpxrzMynEVsYEl?=
 =?us-ascii?Q?r3uzvae+niHS1KIU0q/TzSiDr+qdFr48Vsg0wi+M4Xfn2faOk8ak/YjEpHy/?=
 =?us-ascii?Q?hgiOldLZTQg4RbRYVmBvv2vCuYPS8DOrmsWbBsI6EyCE14Lgb8WPaGKO7E7/?=
 =?us-ascii?Q?pPWCkrPx9l94iOr4oxj157PtN/vIkT7LMZFZd0KejhJwJLGbfPfohtMImtWy?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25f8013-c24e-4f3b-6570-08dbf1514be0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB7155.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 03:06:07.3051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j58pY6VmzYdbEbrmF4iUcRqowDvNgy3O/rrQAXycxT3BYRkqDJl00Z8wJsV5RRxmJoh560S2kN87N3EAbkMJLY8S26nsFcbsj1C2KFiGnwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-Proofpoint-GUID: IcqqR2F1gyH3CGJJyHXViYM49Lk_PPws
X-Proofpoint-ORIG-GUID: IcqqR2F1gyH3CGJJyHXViYM49Lk_PPws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=714 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 03:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107161

the repo of libbytesize doesn't have a branch named master. Change
the branch from master to main.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
index 154973254..abafaaf7a 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "c9864f4dd03736839f40d225da494cb1eb64e654"
-SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master;protocol=https"
+SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
 
-- 
2.25.1


