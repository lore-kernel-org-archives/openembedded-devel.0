Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.12437.1623160260506030805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 06:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DhJFf1O2;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=179390addc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 158Dliki001982
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Jun 2021 13:50:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3929drg0m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 13:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3wSHqeXcR/VWKg50/7Jeknm3pOtbXzspBvs1u6r81XAKUF1DBMQs/Z1Su896mQ2WtVUQKdAcyWlw2GpMjEYjrdSRRKaYqH3iPH0FVTocgQvW2cPve9Kx8FBui5UFl7SxfEPpk9Es0PwFTY1dS8PBxf9k3QFkSQDUl6aIb8vrEP8/j8/nuR0j1IUOaNHnKieEG4uzKWYi8Xj87oAMp8TcCnI1WJmhUlXcODdp74hugQPpYGC9L0aUHTZ/vUWfIjsZ6TPlbifoDb+gk8gtdkHYzHxnPY050NkWoSy8i5mBSKYTQPdb5EREJG5HEGe7OEnnP8TaCtSDAV7vBj6+zG8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PNziHBxY0ESIy+JqQHfVpzQ9rSHyI+vD4X4o1YhzOY=;
 b=oJ/WcrpvhH/DMgRZ0awTiI9+gi3F5kDtk3TA6766Xg3Lg5OvxTYy3yUuoSboriMGTBIKhE9ZG34uXuBziLHwTGed/gvJp531PJC/q7Y8W7t1EffwyfukMVsdn/FYmCLSu36G8d+cJM+E5fRfdn9kknaf0m+FgUIf0g0ZHjlQDw06LTV5rY2PckPGlcPtCtrCYLDeEyqRHLvB7/tB9qUkIxDEMkL7VSRrP804MXA+lr9HjgvFKZ9m7BuvkG/VBs6VLUOg1fMaNgkS2+qA52Ynim8Cx9F46QxkHWZq5gH92GpOW1dVT/qi7EcTyqsE/QF281FjHyAaM6lvLZQuWYIe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PNziHBxY0ESIy+JqQHfVpzQ9rSHyI+vD4X4o1YhzOY=;
 b=DhJFf1O2K83ahpiGqnqXriVuJqap13ZlWPocNY2zq6UzJA/p6Mulq368/gK4p8wjtg72NmMDrKl/4bfXpbFpDfDMROIa4bNHgS9KUQsGpHdihyIxnSCTbliEO0S8uDniS2uyj77JO8Hi2Ld3rX29DGhmyJLQtbhTgJRPKA8vXIs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 13:50:56 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 13:50:56 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] samba: disable check fcntl RW_HINTS when configure
Date: Tue,  8 Jun 2021 21:50:43 +0800
Message-Id: <20210608135044.42608-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0086.apcprd04.prod.outlook.com (2603:1096:202:15::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 13:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15a0cb4d-027d-4bbe-c6f5-08d92a847091
X-MS-TrafficTypeDiagnostic: MW3PR11MB4762:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB47627FB2A38F99C706784C92F9379@MW3PR11MB4762.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J10aygIwelqPARIQwWcPZQ28SCKUBOm7ZBoILA+atp4Lo1s1XF7PVc6gpWLZ9IHyzg18/D9H1USU2UQ6nXa+rtNc1m//swXohcdABEPvdeaGr5yaLIh1qB2840/JXCem30MDe4VjYwGpJDdIZIW1SJL14NbS7HzFZ/8wJpyNxwiQYZbIPvFi/ercDPDcNR69LDWmaZDwF4TPKerQiCmbUdtrVNmG+q/BmyBUKfR5NQ4XXrO2/eU4kQFxK4ldLGgzpgq4Tj7hveapD+v0AmOLSPxF+G31fV30ei3TthqGcm9QrRQG91LnVN/MXNy8cfdNcoTl7eQT73VcM4QSg/gulMqY735xZ616JnR/CFXfYPe6PbM+UO0LlqS7YCwz9gzubnJKiWNKCINKat0MnFDkVVg0lYPA/AhqqKMEekoizzM4O6asx6EczKEDyQ2C0+NxkfP+ooFQSvae1M6pE4Y6WuEH3YhMDc/kBeJrvtEqr0eW3poSDFGZC7434Wk+k4xaLgn0pUQd59P/1S/z78H1xpNo4oTT+shJrx6eT/PQwaJTSHAqR/OjAmW8QfsA4J6r6XPLam0CNQ33MuxKvQP+dD3iuFNZdqfDPWyMdmZq/xspDn4J8z9kwNA6aN1pB/xx3u9psfGptL7fYxaHn7yAmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39840400004)(366004)(376002)(186003)(8676002)(2616005)(16526019)(26005)(956004)(44832011)(8936002)(66476007)(66556008)(316002)(2906002)(66946007)(6506007)(36756003)(52116002)(6666004)(478600001)(38100700002)(38350700002)(6916009)(5660300002)(86362001)(6486002)(83380400001)(6512007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1qyG9WPg2Ev93PjPTxOsQolM90C4snxpLeg3GBPa3CJUKH1QH/XyDRsja/k3?=
 =?us-ascii?Q?IrLEoIkBhhWUwGPKKy67idGcc86JWCv1Cf5oiw/sp4cpPJxvAQsidV/AcZSk?=
 =?us-ascii?Q?Y1nS3HEWuePo30iHP+SXkMPvnkmYXfA3n0w/47Cq80N8wBLnvvV2Sx7HbdYz?=
 =?us-ascii?Q?CSVX5BYGoFpxCm8uNmIIeKbulcXzRyRd57s+aJyg+GLrofLvZtAQTs5/69uj?=
 =?us-ascii?Q?7HkEQfNfjsMbSXvvVUwoKW864YJMm4xCRgNDfYd4YgmV+Anw4+XcJS9JEaIT?=
 =?us-ascii?Q?XV2KP+haSPCOXeOihqmhymfrP/20b3F+LfAnnQaMu7dyQmgbInX7V4DwZvaw?=
 =?us-ascii?Q?vAi5TISkd8JqwSorY/ecZ23gpgNKI+EmZxNrpD18ar6sLygoJ+LjqkiXUKIx?=
 =?us-ascii?Q?WoS+tdw01oRspnjSEBa2QiZ/69Ggd8CKtkdOmEqhLXr095UF4oKlETGdpfrP?=
 =?us-ascii?Q?YkOslN+nt1EC6HHZicxWG1z3gem3DjhUMGJiqbtLh5OPigXcY0insRsehGLc?=
 =?us-ascii?Q?Rwo7Wi8wnI/eyboJV9JyAU4eWcxPDAuADjetk1ONs2z3LhrPQ+NcVQZ3ygRD?=
 =?us-ascii?Q?MQ4z83QqfJJB8IaebzYKpT/a04UE1JxZd4z1G/PfJHDKHyCV+RBTXlgdivp0?=
 =?us-ascii?Q?hqf0ib3I25nsnZN2JzmVmRa3qRzEOqesWRZN3VkZuJwshoOp0I7ILeyswNBs?=
 =?us-ascii?Q?df7azA3fhLYXZLT4oI4COr7pa7NgFr0pdG2F90C2wmmFpymdExjwyK8DrVsg?=
 =?us-ascii?Q?w/c2eSbyAOH1Z6Ws5Z7cwfOzn8peYCb5+hbyNQ8kBOEv/dRjxyccOT6pvZ5e?=
 =?us-ascii?Q?zUhQDrxouRxV1oKsJUau+fdaBrFcgVjaV8NoSlxEcgWzy2+qh1Vnzz4yglfZ?=
 =?us-ascii?Q?XKbFN5CEJEk1du/o4/IL46S/9/orPgvtM++/AoaDmHeanVZKIkU86IlreXxZ?=
 =?us-ascii?Q?5t9CENrmtJvXlRICnV1OqpvH0FjqSvK6/LjWU+BuIx1RrTDBKW7EpzzwQv7S?=
 =?us-ascii?Q?7oEbiQ47njgrFCYYdbroVy4C7bXuq5AF120brTqghwezu1q4vuyEv1uHB3Eu?=
 =?us-ascii?Q?cCktQBAdQM1kAQh5yfb1JR1wHdgqqkCzgtX0XA7zsthiqgecRpzNR7c3SrQi?=
 =?us-ascii?Q?dOvWP/hV3AWJoB5XMTCs5eLX/ui/B+qiBWBdjsXtq8hQ3HNkL+Rv7/rlIoo2?=
 =?us-ascii?Q?G0JbIbq86/+MJmNMpQZI31qHZh9lvK8LP5v6qLvM90qeFfoNnS0yu2D5P3D4?=
 =?us-ascii?Q?ybtKSiUUYiSUy292rwjk7DFTFWLCv1CIzwTVl991XVZ2abzLlIeJmR+CpGTH?=
 =?us-ascii?Q?Vm1cAsLkeHa1e+GzMfI6tQ+B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a0cb4d-027d-4bbe-c6f5-08d92a847091
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 13:50:56.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZuM+ib4GgQmd98Hafhmmr00v9I3YMbgrKMFjNcJpvzZ/lke6wbCnVehW/9qzrTiGfvJT01Qqie+EUcI8d2PDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
X-Proofpoint-ORIG-GUID: SGDsuKFXOSjER0tUAcjj4wszycj7nFVt
X-Proofpoint-GUID: SGDsuKFXOSjER0tUAcjj4wszycj7nFVt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_09:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080090
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This fails on cross-compilation for musl and clang.

Fixes configure error:
Checking whether fcntl supports setting/geting hints: UNKNOWN

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ... => 0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch} | 0
 meta-networking/recipes-connectivity/samba/samba_4.14.4.bb      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/samba/{source3-wscript-disable-check-fcntl-RW_HINTS.patch => 0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch} (100%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/source3-wscript-disable-check-fcntl-RW_HINTS.patch b/meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba/source3-wscript-disable-check-fcntl-RW_HINTS.patch
rename to meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
index 2e0bdceab..0e6f134c2 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0006-samba-defeat-iconv-test.patch \
            file://0007-wscript_configure_system_gnutls-disable-check-gnutls.patch \
            file://0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch \
+           file://0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch \
            "
 
 SRC_URI_append_libc-musl = " \
@@ -31,7 +32,6 @@ SRC_URI_append_libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            file://cmocka-uintptr_t.patch \
            file://samba-fix-musl-lib-without-innetgr.patch \
-           file://source3-wscript-disable-check-fcntl-RW_HINTS.patch \
            "
 
 SRC_URI[md5sum] = "171629ad42b4b303107e8b0fff942a1f"
-- 
2.25.1

