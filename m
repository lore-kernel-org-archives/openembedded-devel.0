Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C705EC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 19:01:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.874.1648234870981276528
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 12:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DfsgiPam;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00833d520a=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22PIHj6b021585
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 19:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=2vAKT1WWSrszi4+H4MUXDZv2sS2BzCZOkgheinXfZw8=;
 b=DfsgiPam1ZlMd5zvIBU3ew63Axvr8gp0iV4HyJ4X3TthxGQWLenCbLVcM75KzyVnYiF0
 ammBAzwFNZcNifDbaJIWxxHwfIaZ50C6Du5qzNaB9MaQwMVSGLQFLk7cxhrJxPEB4+jp
 bFveldY84RhfJpGoEY19ErYYb5eDrdkrxQ+6CifFK3JotbGPOLnomN6JeCT4FiRw6wZe
 KPx9wvtyK5vzV+nhOSOip3nK+4YhSUYiT0CSDuAhSJ3eMkmo2POBt8Irq+eQ3K4DLmzC
 sYiX4FSvsLClaHmdc9o7SeDQLngEwoEuy6x1DPV8elBV+wSThvR1DPxDnyH11LqvTZEZ Vg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657dqr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 19:01:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+E6E689/MXV/7sZsvGYE+NTm2SjYj4r8C7QRC7zS4g8cLR/gSmj/G2u0dBTuDU/jozDcFhmRXtSy/FpkXAkUf1RK1332F91NbsTecbCXcljQbAQ/KOimzG+a10y/A8QeJ0yx0WpNsXY/D6Z8ykXMPI580hJKBf0tPFl/ttZl9bwkXNvJsw+OtBWfkmcGmNPGnaDQBnbjQUN7mvG6zBiqvAAk+4V4v1lMzN4MxCB+3Eqz5yVpzctLjwD05uzO3jgj+s1dG/xh9Q6yrvYDrq3LOsH3NHX7W3uFp17k3P+h+4hB/oeEMB6D06pACn1kd3d3tAvqRgRRy0p/FusVSdipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vAKT1WWSrszi4+H4MUXDZv2sS2BzCZOkgheinXfZw8=;
 b=dMoX3wD/husgNWQ47bZ8mAmxrp67XVFEn3fRLyNdJfIHDgTexlVyRU4ds8Rnd85d9WPFMkrsiVoQokpt63CUhzS6JDdD+ggpruAqOGbvTM7PFpPc4iiqez+QSdikZwgeVZ+YmTuphzVtJauHAr+GP8wFXU2B9eC/M25h33jiMleP5cPh7ORly7DhbNCvfk2AEmv/BC02RVBL7DfqXeeN5eEug57g0rsJir9wYcfbcpQCHPMd8eeLkg2zcemgDXL9YrPJnpZqfAqpCNbH6U+ICQ6H2t7ovGDHw80gErupdxdBUfJWmiWDPt5yiPoJXIpydF3oZLxNY7S1Ky3yXXBxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 19:01:05 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:01:05 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/2] depmodwrapper: Use native staging dir
Date: Fri, 25 Mar 2022 12:00:48 -0700
Message-Id: <20220325190048.192697-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220325190048.192697-1-saul.wold@windriver.com>
References: <20220325190048.192697-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26bf8e75-4424-45e9-190b-08da0e91cfe9
X-MS-TrafficTypeDiagnostic: BN9PR11MB5321:EE_
X-Microsoft-Antispam-PRVS: 
	<BN9PR11MB53216642953C08F2F7D14AB3EE1A9@BN9PR11MB5321.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i70/s+4DH5c9vknXpklSzj+x/e6XdCn0dl5Lb48d2YFenPN8dzNxEUuyJYVIvxK2UQG4IaN8ZIekpgAHx/OXzjwDeuuMk7p12G7CguD3qn3rYOR/BQu06SN/ZLrC6YX6tVqEiEO0KZwxjARi1uWcQMDu8bFe3g8VdjEd01x9/NB7gdcsgMRYRF0/zZvn6cNmB03kEOFQ13FNiyESesu7YCbZOsVWDL0KaenCcTMabBdIaqM5CzfU29oSx1GW2Fpvln7EB2YM6PEYH35f9H+ER/SUzATt9mv5aCHZ/hFTUYep9kiWoWiqGFjuNRP40hh7CVhSxLrmKaJbL+2QS5OQQl7XF2KBjfd9FKD/vlCwelT2da8GQxHJ5nFEbWvzRP5ZrDzFW9pF43HDZSSAUhgFp/uhaL83nfLX5aq6IVC1QdTAQDPvA+a/C5zLhSOOm/0Gl65YoF1VfbG8DWfGaLXn7V6VxbVlG8PF05ORlfhR6FOfKKHfIcPXKyfkmtIEiZ/esNw1gyZ5dCteJsFUPd/KxtrECsaAYkkk6koMhOS4t8+c0Pdp3CGhfHcDMsqb9Tlgc9P2NOSX3gYpn9o4DyhvNb5LpbUsgHjfRlIMY942N1I56uMys4f0mWGzRD5yO/9XkiDmcoeoSMyH00Trg1grZvsB9lxmwd1pkKxljpDeg2hLRxTNMRT9zXds8vrlnDdbOCV99XAuK3CTjqDXLGZsIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2906002)(83380400001)(4326008)(44832011)(66556008)(6666004)(5660300002)(66476007)(66946007)(186003)(26005)(6512007)(8936002)(107886003)(1076003)(6916009)(316002)(8676002)(86362001)(6486002)(52116002)(38350700002)(508600001)(6506007)(38100700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1wDh6/VRMnrT1H7rSGxlObVsqQIlqhcBdOBn719dvSVVc63jnUhZ5fAx1uFE?=
 =?us-ascii?Q?WGoGke5j1oMZ9G2JkV3qc1/xoVGHXFfJblAGEqRsu4MyOJ1lcWLFP1Z9CU7V?=
 =?us-ascii?Q?9Xg3YQYRM8UwIrFwEJnpMasayj+iUtTnNVEHpxXnNZO+2ty3+M53vrK++tC+?=
 =?us-ascii?Q?QweKg5bER2iik61qtYO06JwZbLjNw0C8u0Zb9x9ZNVHBmeWv+lUpGTk9Y46i?=
 =?us-ascii?Q?RiR9MlNV4c84tQ+oFdtpOFdr0dDL7Lo+dovB7Xtx5p/6a0UbI7okqNNHRUNC?=
 =?us-ascii?Q?hTI9YgtIvk+dsCmpvm9OW98qTdpC88Xlx5U0hxLUVJfR7swDp5nFZSz4MjcO?=
 =?us-ascii?Q?NZLR6T9FjsWzmGqiCseVPwnP1CxwIOy+wuraFOFWh2hEnLZufgCarQoPXfj2?=
 =?us-ascii?Q?pszIFMcvuANovJPoIWVpuFaxch9YzlLJ19I4aPDTXjVqZUxMUvvKVR9heTB2?=
 =?us-ascii?Q?qO6mwI2BoI8tFqfSl9saM5txlxFr7uNX7DvNK48rvptlyyoI+Ve2ZLe7KweF?=
 =?us-ascii?Q?b4pLutrnH0NJTBzQK24o/KUcoBEFiAnlMT8mO9+s9wySZP8fGE7+qDYMdU5U?=
 =?us-ascii?Q?fZ0M4TXLYbxVcAA+2pQYKti2UF78rNdyDEJuvGxORs/VyJpzVAE5G6IFvJXK?=
 =?us-ascii?Q?g0RC7GjrQR8NVROet3RL4w0h6zShOvdNaPlCtm07dGsQS9T25UViSkXvtkJ8?=
 =?us-ascii?Q?/0FLbtoice8bOp4APTrXu38gvPlbVmnu7spPFNWzFq2X6Ex9sWKt4A0g1WNY?=
 =?us-ascii?Q?P1+Il0sN8PS46wWvf2Cc4bS8RPe/RLVc0SXV+RiKxU+3Ih/vnM1OTsAPCZKr?=
 =?us-ascii?Q?C3nZLJ4F8ICNBBT6+tD52gZQ+d8rxO77EMEB/lpbxz2lTe7X2rxxBVFE+2jO?=
 =?us-ascii?Q?6ijumrGmAUq3qgbirqqLMGBcgwPtCOm9i9F4YiQW2pyxb6AVp659mTW/aW4d?=
 =?us-ascii?Q?xZv27SPi5kL/BcpCNb8diuoj0OMwz8GmgpjE3RTm1DY8JIDI9xEhruhK4+/l?=
 =?us-ascii?Q?8mNbcBWDFx31kvDisbbgJySnD+wCtvLizYFQ9ImUrDpeFdi/rcbJ/c5N33iN?=
 =?us-ascii?Q?S5QIFF1q0qx0PPTvCQ9t38KznzW2W+Ayd4h1vOyniUbb1zdxQykPNsTLY4sh?=
 =?us-ascii?Q?DnyOCgVc4uHal7/geHpqcKKvaQeqmx1lMTKtp4GxL4aIgUdbue3tHvESYpe8?=
 =?us-ascii?Q?SlHWwRZVqclwVNr1LlTufSD9D+GOfObVw87L3gD9TYmcsmgW7tu+ZhdALLaH?=
 =?us-ascii?Q?vPaGjuH4a0USlEytL1fVhyrpVAE+QCSu7pPh/wHwDLKp5pqZy5fPLQm7yrZK?=
 =?us-ascii?Q?8c3gEZJLMC0Jh1FAOtxVRo9ix14mOHL4J3r8XH50qDM3q4le3F82dl5t2h5F?=
 =?us-ascii?Q?8V/zt5vs9EJppUHByau2ViDTyJpD/pkcT7AgTh+iGBEXd2pU0L52w1EgJA09?=
 =?us-ascii?Q?dPvNeyWaSy/U8M7iIQe1NCudh6Ko+y7KydW5mM2aAsiHHzff4McmB4DbofZz?=
 =?us-ascii?Q?4GcJ8BfHgXtCHQ/1vFBPsxI7AsQqfKIpe6Tg0L7RVf8b6FZLqK54DxIc7W8p?=
 =?us-ascii?Q?JVsRNNUFMsluWG3SMi0Fvj7FF1TH455NRdPj8KwSrazbH1BQJqibjgMHoxhx?=
 =?us-ascii?Q?EKqdPHnA8l+703Q9KBMkl6xxgxvT2C/DAk7rERpbJO+QsdQz++oioubJ5GL1?=
 =?us-ascii?Q?OSNXh1oFmZK2IYp27s5G6VP/7Cv05/bujpivs1QKV41hR++ObqHtGt5mt3NH?=
 =?us-ascii?Q?mknu16oAupUI15agWP+Nd/EKxdGv3J0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26bf8e75-4424-45e9-190b-08da0e91cfe9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:01:05.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 271UHHirgUqEfuWwiZpG9OS2us2om35ck7lSDOgsJdvH2kuMORFZNjk2OqP5dlJY1aKaTQk+wgumFDRY4wvVag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
X-Proofpoint-GUID: TthQvC5bVA5MCu5xKKCPdbCTBjFMDje2
X-Proofpoint-ORIG-GUID: TthQvC5bVA5MCu5xKKCPdbCTBjFMDje2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_06,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=881
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Mar 2022 19:01:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96211

Use the native staging dir so that we can get the correct depmod.d configuration
files. When depmod runs we want to ensure that the newly supported exclude.conf
is read so that .debug/<module>.ko files are excluded.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index aa23ba41276..9921b7e8ad7 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -35,9 +35,9 @@ fi
 
 if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
     echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
-    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
+    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
-- 
2.31.1


