Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39D3C433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 09:51:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7808.1637056271416320154
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Rf5XFKYh;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=695477d9d1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AG8KEkZ015127
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:51:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=P1+opC2ZjimJgQfIJcVgPAkNOCA7jWyduvI+4tZKO6s=;
 b=Rf5XFKYhpEgIy5he2uuBf8mZZRsNO9cGDodNrwuwMgpjUvMkcOiltJ9ya2f39eJBnicL
 LYdjm6m/jgTnmfCvKg8RRAeaAADEP3ZdRcmJNSrPwtnHyBx1g4454sZlnX8LtAgaMj42
 rsOeuTgpoIVhm4EcQqtOP6u9oYyhxyhWdnkRhupOXDNEpOb4vt537EEijhw4tEFbzRP9
 oft2ITlsgOX/tj2oCKb+txU7/0ryZT7aQS28ciyBZ7RRSmxYANigVgzsTMJiSeg5Lp8K
 mV+KDTprHmlnMpBton20ze4dP5GYdbbP2ANQ0BTJKY1b39m59Hr3HKahK21HB7HskbAz bA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbfw5h78v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:51:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mu9EbbriQPNe/ux+cn5gfDfgchq1whw/Cchz83fd/j/nxRIh3bwdQn7+bc7JxdfKWfJ7i/cBZBhEm2cU66h6JX7KoDjPevAc49LMSJ+AP6dEbPnQ0Z4aK5XUTrIP3P5hTKy/ymb6Lw8Psj6hbHIwzMWEzPybAOtm7Odr9NNVsiPX/QbDECzj9oOK73dFlGnrc5QLCP3h/r5q3hMVQSZ+gVaJTArnxJ+3p7M6fAer8oNNvPgPF3W0ZHpdRiG28lzOctWdOYkQjdgq7PLKTGUw92TLVlLEhGXuPEvJSZObFyEEhWRsQ6OJD09n2Q6pqudf48YlLleXOJDbnJcm1wFHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1+opC2ZjimJgQfIJcVgPAkNOCA7jWyduvI+4tZKO6s=;
 b=m/Wh/MnHoYfaDtVEzKo4Ztg/cbQXVa13P0MvhyU4m1FYC60RSGEVfTpGqbRRTI/ve5pKVKBrhX99S+oMkodGsWe1prRoTk8hUeNotwfAIK82c8OLbRhVz10YQbRUQMVi9twaq0vD7vvGKmiL8fHrT85pQ2U43zLiAgtghxYFG5A1ZFAYPXWaMhFIbEXkWnJOxSKfbH77A+8TcFmTCeANjdwLdFsQQQeh/e4aXDXMK2ylHUqVyjswbKtVv5QUNnyd+FLXsMQIN0j5qfIVsWF5pqrmdENQuFllZA9dOQ3hFnyYMFrqlRHf30nxc7iEG2GR4XmRsTQhhwc6O4H9qgMBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1999.namprd11.prod.outlook.com (2603:10b6:300:20::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 09:51:05 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 09:51:05 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 2.3.0 -> 2.3.2
Date: Tue, 16 Nov 2021 17:50:52 +0800
Message-Id: <20211116095053.168656-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.14 via Frontend
 Transport; Tue, 16 Nov 2021 09:51:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2380ceaf-8a56-44f9-c03c-08d9a8e69b0d
X-MS-TrafficTypeDiagnostic: MWHPR11MB1999:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1999D0FD626F22599957B31CF9999@MWHPR11MB1999.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MthzJJPHArVBDDQc5xHG9kAfb4OwuD+838JQU6N0jYkumpIv0PkiAiQNvT6LGFtvyJNLIbjIKO7m6R9Ky4SLNUpW27/BezPQQcHUySnkYCVmS53zFQ+7VWAt4BOEyCuONJI7OSr6qb9Ee9BwZeGhbmEfKiwVKxb4HksySFvsRvrLtV9vBIfFGeWbHWKlAz/lQ0bLTEEBMMKGp7lG03J/KL0eeKIDSe3pgy3dZjzcYYQC9JdcMuS2nZ8hdF8g+wf278n0MuDugQwEsnk30PWQdGB/bY47TzjSUEeis+52HfLcvW8JyX/VsLKOVsui0oYnq45fjrwO3vl4TAJhShAC1XTx511ELQC2BBQXct1/6tBSkYzm2hXt6ySbucjsY93UT+nXoivL0C/hh8dBvGvmv5tFoE6TtGkoFIyMWtyN041THX6sbbW8g2Pt6s2TIAhxtDuYp6xsxZ5/7uR0Is8o0VOnjhlS79NnSL6hyEwu0Rlx3eKqgZdHoi9rA/6uoqOIHbXPkXntHGB1zFqvwCZCafUOHdKenpp9rPCjK6PeC+7LL5OHzvJbbM7b9OXzg1xhsk2j1n8317eAFOx4sN/DIDckECNcbjqxJJUrP6wP3Yfhjw28qYd2ZbiW2KNB3zifhUAHkwGQk5VsmvgF91CCaIh/CJyCatCTfAxOBpuln0K75QRjj2O5fcW+J16g99z1bVg6bb7Yt7ktqs3hbVwa7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(2906002)(6506007)(316002)(956004)(6486002)(186003)(66476007)(66556008)(5660300002)(6512007)(86362001)(6916009)(52116002)(6666004)(8936002)(38350700002)(66946007)(38100700002)(508600001)(26005)(36756003)(8676002)(1076003)(83380400001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nlD1lz4COukdkuWKzsb6WECGzw5lRMpV/zk6ACbr+B+zJ+zcqNlNEkl9TKn9?=
 =?us-ascii?Q?gLSyiay6ZCPPSbqLyTayN2QgdomRJf/2bdPSreHAVTOnTCpg0NFaAd8qvdl4?=
 =?us-ascii?Q?Y7udp1wRLnNAKPy/2jHJlIgUfRfGS9RpSPDO6KWvb1LQcnCyY0sejCPLrZ9l?=
 =?us-ascii?Q?RpKYII79LowPTPf9JBXbsBHKpFKTZwrX1RfMILMn4GLWihyIHG7p72ugdg9e?=
 =?us-ascii?Q?7YOh8in8LBXJUMKNdMa3NnpbymvAeyj9WgB1LrobXnGSSk019HuSBs9E+s+z?=
 =?us-ascii?Q?kc0uSt4thNIftJ3ucHkuGyW6FZjtwZR/4mTAPvS5IyHhcsj+g7tAaPSIzyvT?=
 =?us-ascii?Q?1VvM4gSKUe+64YL9Tf5XRHPe2Fmmy9ZBUsSmrhNZXd2bcsWQSKyA9i/AzzRj?=
 =?us-ascii?Q?GNLrSZkukXELUMs7FCjkgVbHkQ/KsLVIx4Qb2ctXXVTWf5DtV+zLUHi9wpsl?=
 =?us-ascii?Q?zc7aoMcuA2Sx/P4xCOFhI4NvPaVUeVYqZz93rBm9m9L7Et3mHXGdq9XAJp4b?=
 =?us-ascii?Q?sbugNWQ5at3WYhB9J3K19bWMhrKXuuZx6fmAVsbmSsm4LSY1iKAQ94dxM4S+?=
 =?us-ascii?Q?0KHb8opupg5FwoinQTCFomYz6Hz8N8gh7nJbmv3nbe/m3BkrD4VTsgc5eLNZ?=
 =?us-ascii?Q?dOn0bLZMuk1cjGDI2mImf672DRCb/wrTUBk2pp4Io3vaMlNiscJn9eGEbgL0?=
 =?us-ascii?Q?FUyatob71VOUbQGvHe83/sHZ1c4j23/SAk+PL6XljAJlljFv+UFfBy5IzNc4?=
 =?us-ascii?Q?YXwAZHP1heCMBdRI0O4QIrfAFdip21I1eYYNuh5MjToaAaEVbP4uJkWUVFxm?=
 =?us-ascii?Q?eJxZvDzlIT3jQgUYobd/HZ1falw3JblZmo3nLWqEXj0tKnC3EXoBeiy8Fa2W?=
 =?us-ascii?Q?1wU+necsLxv8PHjGE+t4ISXCxTpLWjerwFaF2SyfOxf5PIfjZEHef0ss4FnG?=
 =?us-ascii?Q?P+dBPUxo+DunhlEHNPHUtXBbADofZK9oIdBcVDKZY+AM2/qroy7M9pyoEf4y?=
 =?us-ascii?Q?yVX3kceHFUMR9s0SC0wWnINDNXNW0bkCy3sJWOyLT91nqMZv6rD+nCRW43Zn?=
 =?us-ascii?Q?sqdfAlmmj569X75nwCRKHqnoDxwNH9edgWeZlC5q8DGNkmYnyq6ETqYOnHv+?=
 =?us-ascii?Q?Q8AgpE+TWnub0eZczHffu0PNlaqm0BDQUmpUhHVC0dFnHxEKNZBQagmagBuD?=
 =?us-ascii?Q?aD+w6Ru9ACTy6xJbDf95uueeYw7xLgnqfrF57gzTCZ8j9Ae1eN6GcjYIaCaf?=
 =?us-ascii?Q?0j78BzL8hKiwaRbuozCE3JildcG7S+HSL4jkIM/M7F4+FhPgbIQjdgYwXfKW?=
 =?us-ascii?Q?cX42SHpCqO8JejW0mC2jqpoK2lZSAFwSy0wZY37IbOOLuYZumkLKDz/0Zj5M?=
 =?us-ascii?Q?mMs8Yqf16kORah0lCZ+GTV/k4qXhpEmQjDLBcTbIud96geWROHQwwV/sa4IN?=
 =?us-ascii?Q?5clzkL/JxlwGfdbv21KThrAIQBrm9FO2zseHZYtFEhYB6f58i/d1FqPuvbHq?=
 =?us-ascii?Q?16DGGLsh6g/txSYNxnakTiMVqQMR1S//73lEeY1yZqdRcUIzG5yddYqDmSlJ?=
 =?us-ascii?Q?8n968PDi5xRgqGQYN7ORJE7skOgru7IU3GQorXymnkuPyDmuD/Ew5Ox0eZLN?=
 =?us-ascii?Q?3wbzSrLJAUuUP63/PmcA+Lw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2380ceaf-8a56-44f9-c03c-08d9a8e69b0d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 09:51:04.9289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CJcKTMASHSpyxLSkVmxL8GsXv10Cp38wSBI2pLk7wW6UO7jQWcLk+l0b8WAAt7BBOli3rlcpxuR2dR41H/E0yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1999
X-Proofpoint-ORIG-GUID: kR08fM9kf3xqTl_NwLrYAkMiMT1Xh9cz
X-Proofpoint-GUID: kR08fM9kf3xqTl_NwLrYAkMiMT1Xh9cz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=956 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 09:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93971

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_2.3.0.bb => libldb_2.3.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.3.0.bb => libldb_2.3.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.3.0.bb
rename to meta-networking/recipes-support/libldb/libldb_2.3.2.bb
index f1b8cd606..3f7ed36d3 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
@@ -31,8 +31,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "fe4b1f17f77e2ea52b4e1320d927844c"
-SRC_URI[sha256sum] = "a4d308b3d0922ef01f3661a69ebc373e772374defa76cf0979ad21b21f91922d"
+SRC_URI[md5sum] = "650a05f8a2b2e6455f590dc815a71879"
+SRC_URI[sha256sum] = "1416c949dc4326e41c0d8a5ecf8ef784f8c0b6e9d3dad8fa971e84ad56227603"
 
 inherit pkgconfig waf-samba
 
-- 
2.25.1


