Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B0EC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 04:23:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.5944.1644467001575039616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Feb 2022 20:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cAr+9J28;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=904096231a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21A4IFuG025818
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 9 Feb 2022 20:23:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=yAvdDUm01T5G4FlvaxeO9XsT4DqwcCTE56intelVntU=;
 b=cAr+9J28/zzRlukD54kIi4GRn7Hs0BaH/YaCAER1i1JoqMj4GXfupE4pNcy4wvzGMGhL
 7cLrqDXQii6ROpcaK5xi27ebbh2HbanQn8Zu3vL6zVj3TKczMqa3/NqRiz6izFSOAw0+
 seuLRoB2aQTU6YxSt9qfUIMSmoVqd3QPDXXKwTnFrUrQxYLiZk0JQeRTRyfURE+bl4xH
 Yy+wmMS7iDTln1R4AcLu9YwTazi1mTUzuUIlP3BPhxMFV9mU8OCT3iox+FPZGaFIXJjl
 lf7EVwHviH5AFT2yU3I0nha3mM8JEUZr3Cx4O/dzvy2GOMMEohXGjc9dna6Vpif7oSiz SA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e4h2ugfqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Feb 2022 20:23:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INb7p5sNiXAUnkugGrakSZ096ZU1PqdVrcanb2xU3N0uaruNVLNpPcfj/KoVyGotzwgGRwpN5eBE3YRTaY0eCodc4cqi9M0Wam1TH+05jt/TWyujJzURk2u/CdNCzsRTkfhglrzaGY507DAIakx+aBUalzxQfo8Dch6CmZiB2aExtFDSwvKpnj4oFtWwHXTisuSV22fAxGIsgfQ/F43OxWz0YPh7lLOSYxY+4SH4d/jRT5GA90vLDXHXjiqX1MlINSloHq3kIbfFgbvbK64INznhhuhennNGXJ1YfJ8J4RG16rb4XtLRjxeRO34KPWhi2YSGk78myhWDtr4dHQZkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAvdDUm01T5G4FlvaxeO9XsT4DqwcCTE56intelVntU=;
 b=aflZGs4K/ojEpNwmrfy97xxXbtJygo6lrl3A9bitraejM1jhjxcQu3yJcOaptGswJIuJS7D7QOreXaEZDOxYDTovWxQEylleAY0ydSV/wc8DNLXHc7IadNQC2sLTPt5Wo7PIvtvwMdokoQBrkPJsycchghgQgxZUmvtaTn5Dygu74cjQKG+dxvGPJR5Uw0hbpeaJlfbdqLSiOlhDDeJTvhUs+WcaA1BCggnyx3DbgYjAbh0aVfDkVngdlERePxvuAuVJfV8Xvr/yJaalAOhIn9TzNZbZgNsM3HqtdVvOSy9/Vq6Jgk1n9fALNelxHuatu2s+2DL0M/6AT2BK2EyNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN2PR11MB4301.namprd11.prod.outlook.com (2603:10b6:208:188::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Thu, 10 Feb
 2022 04:23:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%8]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 04:23:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcpreplay: update HOMEPAGE
Date: Thu, 10 Feb 2022 12:23:06 +0800
Message-Id: <20220210042306.213874-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d22e16ad-5740-47ff-9dfe-08d9ec4d109c
X-MS-TrafficTypeDiagnostic: MN2PR11MB4301:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4301C29D7A170FBAD9A5A931F92F9@MN2PR11MB4301.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wSA8y7kpHJQvCnoXJuGYOwTjuTKq1TC6ugBSOKxtE8No+jN+c9ziqCHOe5PmTAVeZZ9exV5X9TPpf6pniupLbM/DXkoVaV0xa2zZDhhJgrKLrIKsphy4r5pG4VT1qKHRYu1d8BPcPw+YokK5zp9VPuBRemg+Du00aTOYPiFOgrI/qG8+Y7kQg0ZCoZrGg7CS40yTNJglS7pUx2U3GMKQgSkcN825fLQyGezMXfhwPaYbXGYGgIGgzmWD1YvztqEm1jXWhr3RJ0S6xOUSUWQojeGeA27NjHGJgoYiy1dxIM62o6ubTgfPdofXuSod9PVneyRVf5g6+KCmJ9+IoVvyh9UrL2bFnf8R/t5gZzfB84gey2JwyySPXZ7WSR9tuio2h9KKMrdrOEwzWwOpagia7Xflmh1nCU5BWtRahvqW2wT6tGfGaEm8GVf1wmc4c9VNCXWovzVRkNyTzQ7x0IPIvGi/sU9qYV/YH+44EBzKNq8pWKpdTffOumu7Sc+R/3KgXkSfjfdBDDz9dbPbHZW8luw8ZfaGilf2eUS7D/+fLp4+Tys3rSd1a7PuzPuTx3STY0tzLuoREq5DiAJEKEidN++w3NwHIkI1XARR1RdkUP2n2hJNDXfakqd3znpMoyfTXHHdoK8ZsFq1Jz6myuIJHSxYKCCPJGFwuD+bpTo8Grl1p+39RIK6esuvlP/efCdtclpcIjY/3BQHzOg0uhnVRwtv6lZobcF4eE7NECYO4HrEfGffQuy9zCLhoZ92kwGAWaDXAKHRgYzH1RuFSBCRrgT3+oTxk3zEea81PhaKeak=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(966005)(2616005)(2906002)(36756003)(44832011)(508600001)(4744005)(6486002)(52116002)(1076003)(66556008)(86362001)(8936002)(5660300002)(186003)(66476007)(38100700002)(38350700002)(26005)(8676002)(316002)(6512007)(6666004)(66946007)(83380400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qDGYUiQPi9n5/JHDzdEVF5/L6soUV63hZ/9OQWIBwM3j8t9g6k9LxSw6GglY?=
 =?us-ascii?Q?f5de+etQ/ozBX6UcCnGPqkXZFT0A35YarmV6FOKItEpOIamjVF1bkd5zn4ms?=
 =?us-ascii?Q?EOvNO73EXVctrPHMd9jAnOsLR17bQQmdDsNoSVhkzd7I9sR311Ji/856umFQ?=
 =?us-ascii?Q?6eMrQ8xeBPbBMee2ATF19erqSg9+C+y4thEd4pWQSqZu4y7Ir9FdjdT/rNej?=
 =?us-ascii?Q?4kwD9GOLbyqIjFU5wvkypAAnFr2oxr1yKT79XH+KMIGBJrjgp2RMd4A+S0Yi?=
 =?us-ascii?Q?DafCU3AA8aevINct9MzBWlvkOxHzhvbSZxybIlt2JTO6BB4lmAs6OsbRmXh9?=
 =?us-ascii?Q?LxthEkOrjXpCr8yl8GGulX5N8p82JKyitX9lailP//JgkVjg20F4oBTmLPW6?=
 =?us-ascii?Q?rtbn9YKuruEjSiXm3gzS9on914zMyMmT5L0Zyk59zDsyuHa7fmBfDukGmbZD?=
 =?us-ascii?Q?2Kp5TBfpjk7dNzjipqN2GwdDRrzatIuXAEF8l8jfs2btO0afccXSjLMPun1/?=
 =?us-ascii?Q?XGpzgmvBoeUz9tJsUEB4VmTei0iMlfohWsG2BiAWu/p2SYUoNgzXRZN+/jPF?=
 =?us-ascii?Q?3YQAfQHDEkJ7VWXan04Hrlh2XX8zwv8Pgw6tnGC+fYADVCvIHvV4dZZ+3NtP?=
 =?us-ascii?Q?zgmYfr9iPhSBiARkD2tSJjP4B5AxsUIOfJDQlf52Lm0YC1qMnkRwXVoW6N7B?=
 =?us-ascii?Q?7SJ+2JOk+o55OMGXAcjJa5ClcdlzwW3Pc3BcMhkyuUkKXUfq7poChpiQhcKo?=
 =?us-ascii?Q?BfTAik1XmYMszLBuIQ13D1xX2xX1VckSzw0Y0kctHC/qPRQLRW7UcCiaH3T4?=
 =?us-ascii?Q?pvElRlZiGALQcG3o18dmSktmFD/jvWRdJjUeobgpFGD+6O5NdF65W3nWhDdp?=
 =?us-ascii?Q?0hvzB40Ir0LV4cUN8JlW86TRuha025CifSAqDF1hywL4M2B6JKtS5ceaXdmD?=
 =?us-ascii?Q?5fF7c4wQOqfwNnPx7DG05Rln0CCP70xAIN2HjUpCwVwW7/Z8wpUrlTIAwhyt?=
 =?us-ascii?Q?crVNiK3x1ClKfsFxDnsnCpTbba7rffLmYDt5wRQpV9J0xjPoxg8o1bpls9Xw?=
 =?us-ascii?Q?46WTQ2MygVwMDDiGqC81rJ8WjV9bSA1q3PhJZuflbDmfvYgsQma15Hmz6Ovv?=
 =?us-ascii?Q?nvg/jfbJxPZDhiuEtHjQDsW/UbFxsBreiVDEP+LZM94YMsU64lj7u4IcU6Nc?=
 =?us-ascii?Q?oJE2dyf6mrHuvhp/Q9Dg0fEISUXFKJKZWPLLo8JOxwIWcM5hzkw2YHpLau6J?=
 =?us-ascii?Q?8I3N73X6EyTh7fE2JPPH4SI1A2S+0lIcjKD9UUnlJo2h07sHprShhBqF3AyP?=
 =?us-ascii?Q?S+q2yxg+eooN3FHf00K4R7PF7JT9WKl9C/3GpDnaatoXKzjCLqDot6leNBUx?=
 =?us-ascii?Q?Vh1zogYnO3RA5dFmUz5el/i7pXpAci/l3LW1Rsfc/iWTIA18nvAYJ20Z+H+n?=
 =?us-ascii?Q?Pxe3ZTaMMpVZWOv5R1AXLRtKZx1iFFakYztt2WXtHno6pmA8lDeMxDpqfbP2?=
 =?us-ascii?Q?CoAdmKndnQSbhO4pHnUmTxmeBZ+0lRtRV8FhXR3J2JTrK09k41ZjbZ4FIj/6?=
 =?us-ascii?Q?BTfHjIfJMHpzvD3vHljix32a4e2gb2lR+pryLcTRQ+vQcFxWPiLvfIjnNK73?=
 =?us-ascii?Q?XBAzUDSm+0IG2wXbzK9LNi4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d22e16ad-5740-47ff-9dfe-08d9ec4d109c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 04:23:18.7918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fx2N+57678aLIE46R9nPwnXfnAz4FX20UkJ+8AlN4pGv8u4mbKQtoqIuLCyejbvxMaea7Si5FhrqEm4U7Sjpgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4301
X-Proofpoint-ORIG-GUID: HoxWs_-zb_6l15dR8ghbLmjORvzH-DPa
X-Proofpoint-GUID: HoxWs_-zb_6l15dR8ghbLmjORvzH-DPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_01,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=695
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202100023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 04:23:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95278

The official site was moved to https://tcpreplay.appneta.com/.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
index eda51bb7f..48dfe928a 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Use previously captured traffic to test network devices"
 
-HOMEPAGE = "http://tcpreplay.synfin.net/"
+HOMEPAGE = "https://tcpreplay.appneta.com/"
 SECTION = "net"
 
 LICENSE = "GPLv3"
-- 
2.25.1


