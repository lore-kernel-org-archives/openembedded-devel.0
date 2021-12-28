Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DF3C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36036.1640677116450130795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EjoSLg4r;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7Yeun025314
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=i988YRiNWH8dzTn+Pqh929TM5+8bswcBRHbOQQNo7t0=;
 b=EjoSLg4r99tmzWzrTmhtsliVeaW1lchli9O2rAy6Qvg7BsUEUD9VIew/ajjQ17Z3UtQH
 GWdA8IGtcr/Wlr7b+10dnxutb7TwGrw3pksA4Wix9Mnug+kAPgB/bpaj1dnpJUlwh4YB
 KDJ9ihi3BlVpLNy93ZHiDqJ69txQycaE2seO7wBWWpNs16/kjdLVTploBEkZKDxiFKAA
 dV00LPiF5rQyW4jJRYc1XWhPkqgrFmmCegXqfOI44DKgTr6oUIADnTOzbr6QUO5dZSW0
 RAiBly1dJLCswMQBkol3BJXBhts1iqLjVyUkgaYTx/YgMrhUIY1f2rZ/BcqmB8jdqF44 aA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:36 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cZTs001318
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:35 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLDwtEGK/8/VkoufXSlgRAZwFx/hFFroIut9W9bZ9n+f/4K9CMmJcXHUJrGIrCNrKhGG31jSp8kT5MSzeuHCZAa2FTr1YJ2MW6mrgA1oFtW4xCf8ztTuzAKLKGOK4gKzssq7qHtzTkXs98XCZ5XkC/2aYNqJr4/FQxoa/oSc18njmdknCe3tl6+8pb6ocijzX6/kZ/sLBmuXF6F4LiOB2ym9CvKrvSe794zCVPsztdCd4Pv/YgDAAdAzUC5YXafBjiIFxphAGDgYFi4MF03NzQrI06rWRELxLT1LJZDEQ+TQE/Tj+VBjq830GlaY7gnBvsDFjd94OPIbDi/kx66TRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i988YRiNWH8dzTn+Pqh929TM5+8bswcBRHbOQQNo7t0=;
 b=YL6zhbh0RTNlYQWEcITm71MZDcL12h6z29gHOMAQCiDMFcUc/C71abEkfh1EQFIK2i4CeD8Z/8zQwya7ZbIc5fyhLX/msM1ecSX+eqKIxX2Vy6jwcfdy0Ktk/zPT5BEzAtDqOjTm+IuJCHs4fBp/NiTiPLaxhmjElionaZCP4lvyvYQjG4ICmFK6cB4HQbI9MARebvtVco+xiRGbF/04h+tKwAxSjIQUbL6TsiAe9BaA7SRrnJIQUqU3x6UrDqQlu4p/O0/Lj0hrwWD7bjmQFY1yjM2aENoWtw4/MOxRunc0cP/7jwRUNLuI5UUJM10/22/M2rxBvcelFyTldWaGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:34 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 12/19] libldb: Inherit pkgconfig
Date: Tue, 28 Dec 2021 15:37:59 +0800
Message-Id: <20211228073806.868759-13-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61725f32-2ccd-4664-fc17-08d9c9d50da9
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15844714F41DB8E12CAA3E8AF9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TN41ECxDhlGu32/FkolSN5zwgdwSemIGd/rZWX/9osfjTxPTHhFcnouROK+2AyXNxH7CVtg2do8ELpxXpxMOoipidugx5xzwqRa0XQRQbmpgvPFL7MiYZtfXPk2HG79qzgjaYhcLWfLHDX++//gVQu5v6fkPdUschl5jAXu82BB/YQ0zFghnm8uiRr1yfW+EzNovFEUh546YwEr6KyptFT/9FTyfk9X/GHVlTDHPoYzLp67TM7GZnhgol31v5avYZwFEVX+Nvjul2Tj/2XWBIiUdETk77DmW9vxISbzHTZiDELQqL4UeykjfoyH7+Jcaf64ouneyaMVFSdF/FDqsAl2jP5D2hf9NiXnkyxfTINg0zqi7ZRJ1/p5Jerch6uw//cE/TAdJ8ZGRcqC7j66EDZLKTZ0Tkqq4QM1qmqIFv81lPnxTPFl78fYkzeF2y+xDrNGPx9qkw5lz1yY852zqsP5MmxWBPLfeLb8f+PdqknV9KtS3UiyCKSzC8/Eyw+3dDkNglllKzPKVyTXP5DLH4xWlDaU1i6x6aysmakZ2yM96lKwLduWE6M7spkBQqyMyj81+wvUWyhL/svg5MlH8R0yz76OlEHU03Xh8HU8ZLTWwW9VlZP2f1mh11DvJQe4Ct4S9nzV4NBV0iQZw2RgD+L8ugW0dLQW7uN2PfvP54dmJaXCN485AMs3BhPA3U3kgCXKaKW7wI/D/iuWwLtusHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QYcMRbUzXwjM4LvwLO1B7Edu8zS2SKf17nEmelCZCRZGHyf3edeOf7+c955Q?=
 =?us-ascii?Q?4VpvGGbuubtkloSBvcdUC6Fo3eSAlhH9gWHRZh0E8kcmc8ZrGEond0rYQAyA?=
 =?us-ascii?Q?0qZwK2CFRMbKZq2pBefVoPNfBsERqFTRZjwQLFi3lyXSLzjP0Snd8GriQ6nd?=
 =?us-ascii?Q?3+rOY/inoxjVVVaypcNE47fqi0ox9otLC3vDIMEDGZ1qFJFdwRyETxZAJo0g?=
 =?us-ascii?Q?rY+q1s8r7Gbyuto7ZYNSjYgve5ErHwGW9C3BADWE80Heddk3EC6SUXOeZqqG?=
 =?us-ascii?Q?/jPQJEjt11YRJ+dG4aDKcQAran2O5tzpmDSNPYb9AQxHpxK0Qnb7uWkqY80U?=
 =?us-ascii?Q?avwt8rDK8ga1N9+cvoMSPGIUna1yIU6R8Yxo+shYhbLhRv1nMtisPAoxXssB?=
 =?us-ascii?Q?Kxx+0BJj6THT9uinSukl3NxZlsmSc2JFVwhvOEUYJhjTgeIkaQndumvlUPun?=
 =?us-ascii?Q?eQzEWctGEtXWsWlZ6QgbWMvqabP+H08cTtXJA9juh6ZqQNHZmFBKPpodRf85?=
 =?us-ascii?Q?G4/cPlbwCdvsWRIwkm3Kz5/P58D9I1z15JK7tpIhj3FBDRhi/kNZGwV0b27g?=
 =?us-ascii?Q?J6gdbnrLyiQWcXdb2IaFZoCSIrhE+dVmB7kV3ew2WW2vAhotlyHEy0ptJFyu?=
 =?us-ascii?Q?QLyK/FIXDsQ8irWCa30I/eIcBWP2MnSUmJ6cl3+tUXvIip/beCnpkO6jIRJa?=
 =?us-ascii?Q?ElUfdCGh6el4RU99DluVZQ/murRKYu9vTjlp0thP2J5Hcme7J61mjExbfkXr?=
 =?us-ascii?Q?QTsxkMksEzHgkw1dOIrlcmXUAJNHtmyWAd2FAQNEHbsXmvuVME1MM2fTEvVO?=
 =?us-ascii?Q?KMw58u/9ge/WG1fCXktKtxvuqg9HuVdX7cmFKAc9vTpVaKT+/rICX6DkkfNt?=
 =?us-ascii?Q?Y9BEg8Gd2uOl1leOFanzpDO2xilXt5p6S7ksWj7rGzdn+Wz1C1afa+rW2QRd?=
 =?us-ascii?Q?VEryLd1Q323hRygPIQpcUIwMcGZOnkAq73I1f0u01wEuW4Wb2p5+VmjLHMLL?=
 =?us-ascii?Q?Qh3QFq+I9vsPZXQ1YsjQoIGlehgPjJom7LDsoTVMeB9Jv7JLMpkfBk9QZKnt?=
 =?us-ascii?Q?mEQGE+Xu8GfwRembe+6qwzN/QkP36zJvWGumWtPOFje51zXqsEWzphA6tMZj?=
 =?us-ascii?Q?Eid2O54QaBpxvKAX9UaavS9j+jOtd8qNbC8ruESiRK+oFxZV9iz0pRCSMTRl?=
 =?us-ascii?Q?sMQ+dC2vEdEQ4kAod/vp/qBl4w2Gvr8Qp+mnDQFuaHCZlbLVE9AOuSPhR/tx?=
 =?us-ascii?Q?38JLvWH3Gi2tuuhZNUNZaKkLmKSbPT96EDKhj/VhQ4yZ1KdwUmmBDXRB3ojt?=
 =?us-ascii?Q?fWHgnesUroJzbp9VIRofomQ9GgxovIPUBAT1vyDAa+F9Y1KuMUam1tp4VTAt?=
 =?us-ascii?Q?JoZu23xy/W7hs6DVLRxjia5l3v5L5wzbwpA8CnKi0zNo2zF8btNpcrV1wxom?=
 =?us-ascii?Q?6hn0ntLKVrEAyGB4ljVn3h5S7OKZOk/hJmquJQLbe0ehGyt8bguEurjKOGOr?=
 =?us-ascii?Q?gI7FlFTb8dKJbi0qwSJC+vgddt/8FAxJg+Tw05XVuMgVZRHYWkNuW2pJ2d5O?=
 =?us-ascii?Q?D+hCMsQqrZJhEeLR6O3n0LvDKpBs3fWzyx2Al/Jop2gDTM5aKE9fw53WkYdc?=
 =?us-ascii?Q?jmsOw2ogph0np7mllRsk56w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61725f32-2ccd-4664-fc17-08d9c9d50da9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:34.7262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cP2iOs2iF7717eIyKCsUHhmRbiTPD9PrbaL15EqcLXk7Dr4/TrqcEHqAIpWP4vvBxI6AOdw8Pc28lcionnYSUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: uC8OWC42x-CkocWevU9Uoy3N_xOEj2EG
X-Proofpoint-GUID: ncP0BrcUov7ydeLQF1pnEoskuVIqXh06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=799 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94539

From: Khem Raj <raj.khem@gmail.com>

Fixes linking errors
| ../../lib/tevent/tevent.h:1446:8: error: unknown type name 'pid_t'
|                                    pid_t *pid,
|                                    ^
| ../../lib/tevent/tevent.h:1525:8: error: unknown type name 'pid_t'
|                                    pid_t pid,
|                                    ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/libldb/libldb_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
index 3731c260b..71cf4e849 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.0.bb
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 SRC_URI[md5sum] = "fe4b1f17f77e2ea52b4e1320d927844c"
 SRC_URI[sha256sum] = "a4d308b3d0922ef01f3661a69ebc373e772374defa76cf0979ad21b21f91922d"
 
-inherit waf-samba
+inherit pkgconfig waf-samba
 
 S = "${WORKDIR}/ldb-${PV}"
 
-- 
2.25.1


