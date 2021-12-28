Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D05C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36238.1640677117836330400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RLDF73JJ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7X8fE006773
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=lJlmZsQFGWv/leIO7MNWBLXNFbNOOSwH3GSIwmxZ/YA=;
 b=RLDF73JJTnxXuVEzhcE6HaeYjlpNeXx44tS2evZmh03ShhBYbCWgPKKcbvof4yb/YDfr
 PKdCAeUvkQ1/6USiU7Ds3hovbgwSo9xECyGuKiMShhSlgIFQv6/yJ0uLHJsOp6iOaAy7
 xLmadekBDYuXyCLQyu8vgf3hNxY4XWbUMlA5Zz6+BhaS1sJC8+ohop8Jf8l5upb9IR8U
 g/XtkhguIGf6p5V7GZWRzl1vW4aQWiCaZUII2wGUKdG8UTX8B/b5lo3MAGp0PXL+Rxxt
 tGZGY2AOi5u1NiPVUIcUU+7CIDm12/x8irL77ckCIfv2nQ9pvBBM1baTTiVQj/Y/sEWy rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:37 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cbKg015393
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:37 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nChwp0cLwSJ9TkZx2fcT0NzZg+/kH3fpKD9OmcKpzusL6W6XlwSYV1X34IxBvEed64RxQ088BNp1Au6VBOPnOOPvjBLB+v4en41wpGRUbCWVNmIetu1iLhuP+1g5siwmK7y+QH3bTepNnblAHTkx08cQseLUfIz0W5Cjit61XqC4jDPlWQWwuVWb5b9m3uHZfIjDP36KF1ZfyMzHmR54Z5uKaFzGyG8cnZIRhDU5RJgTEnPkuCoctBUmqLGpNbb5pztZqit13asBNidSmxilsTzWnVoj1rcJk+qSZRtTd4h3pBmBlqr1UD2zllk3MPkppudppJAfA6VESAOugWlHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJlmZsQFGWv/leIO7MNWBLXNFbNOOSwH3GSIwmxZ/YA=;
 b=dAgkUVh+15RCd+RA3WxlH+Cs3p2Xkiwhiqvbp4HpbKvIVR4LSjAVgkt8AF5Dc7Mj9TW6rrgPC9SQrMzttJ6sEUOiHDbZ1D7sLFQ3a3/ZdyS1KWX7mBuyEFGqwBY9O+yMRr/P7syUyT0Wut3fvF2Z7d9RHDpN9Q45gXw7ocuxOtvgE51xnDPSFrXI/HKct3m/zltTFbd7K9ejCOIqXyNN2MZlRyZG26LlRSgCNrBWDn6eKXpAS/o/1UkkjJFmK7jJwlFPHflbJxW1sscw8FNSz/XzRDFxX+enFtsXHBL38uNqCYYHyX6II8R1hi4D1c7bgjQr/vt/QTLxR+eYPibN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:36 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 13/19] samba: Inherit pkgconfig
Date: Tue, 28 Dec 2021 15:38:00 +0800
Message-Id: <20211228073806.868759-14-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: a593ca05-4bad-4157-fcd2-08d9c9d50e77
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1584D8933E04A93898D2C885F9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tWX2x/PRtAiyqyQhFz8dDk0cEOT3I+Q3H/65KI/J+Qz0NgAIaiIrqcEbPdmXidWwJTcfDTNQRyHyuUxlyRNFc+jxFU57OAftsgHXKQGDcG2Hh183QAh51Wr5Auc+WhUOpUvL19xwd1gFn7zcNJO0P3jpV111ZiMiTNP1m3QpWR/eXVCnk9Qr8mM37MVYWtb3qqAmfb59YFFnxB0FvJFjZaDCvI/GpCzv2e1xJPdD9GhG9GKKQjRXKk/CVRo3BDHO9+xNbN25u04eTgkcmOs6IesCy/fB4/9Us3YgKRemyK5v8BUO8JUsISosp3Q9uioEMan1TTs//NPywy1Xpa4qs0V48M96e7gRrGvhp9eahHfcsHQTOCYhKdLLCSORXh5l5CFWfRS+JoWNJlnnpmJnbqXNzhjrGPQ6AihMkdfN/O8V4yZzIeKnmh7VPzYYiTf+ZsPkGEAv5wzLozsFzd7wxq1nHh3yhXfYTNBUGIaNV0R6gwNxYCSS0oVroRm95YowNVplV1XO5frUSwOHM5yPoO/UcKWKhjCjMhIMdk8dyihjDfAPeR/lolyJPqIWsK3aJaU8DXvzQ8B3/avx2nEBa5S5khUA54NzSAaqZ/km204f+EBA84sR2cC1nuOsBQbs6ZTuQuWO77v/yo0ok2vOSL/aGO3HNDDEd/0bOYXP8AAd7G4Rgag0oJcKeTBe0Dqs3WI7RRwxbg2u/HIHWn9P/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NQdJtWAG4cWg47h1qtu4Eiosp8E/MPXWN9xXeeBtQh2VJo8p60s25qoJmtvH?=
 =?us-ascii?Q?dI2rRqLe769+x1SzeVzakLBrJAl7cRE8LTVxPN5Jrr2CQLSOFZYkUaUA5Tin?=
 =?us-ascii?Q?dIi3SVzNn/iNOajsdzwY1FKZQn3mKNcoGdVNWnZN5u0DVqThyTrN/1JZNQhJ?=
 =?us-ascii?Q?wkaYZhsozBqTY/p5YXOKTrWf3RZtDCu5lSelsat0e/n1aPwNfoV28TNFpE4n?=
 =?us-ascii?Q?edNd3xofpcMgZVk+QQnzhGvDWXLb1uEjF+3dJS2SaDGl9JCTGtBonVYMYwaW?=
 =?us-ascii?Q?WlZnr92PHc6V3ghyOf681BncSK43WD0edJXEtVKAY7qPdCJ6598ux27Dy3Wd?=
 =?us-ascii?Q?TBC7sA0th86dGsv9Y5M6oJubcpPaPX//L3RLJaNNNY/f1BdCIwhu6LOi5M73?=
 =?us-ascii?Q?zl3R03rXzXTDxAGqu8DxoigjpZ7FyLJPtzo8h1qRmJXowDanwyJ4P97Z4OaO?=
 =?us-ascii?Q?EpGcTeka7ATlqysWcG/hW78lVhXEUVQZOq6YyDWlGs+zTUzjdWQGVisSaL3f?=
 =?us-ascii?Q?LZe0Kfl2SdY96d6qTvSam4pSGuSA+Vfz1CKmUMOfG6pwIdxIvJFbYd6og4Ou?=
 =?us-ascii?Q?ye1+mRB4JvtBsTdh+OPiWwMz9nCrL4qvvKi3NV5UqCOq8ujqz7FC+EhCkp1K?=
 =?us-ascii?Q?pTIUUil/1nnORw3YrL7cnjwXSf4RjjQKdDmFFFkgT7igOBehlqoAbDDeyO2W?=
 =?us-ascii?Q?tB8fSjvynlEzRCSKbDODOWloprJAwk+uG8Fg8e1kkG8gvSgY5uliOI897oCc?=
 =?us-ascii?Q?hRtN7FaADSkiE+lO1OSXgfNqsj5azo/IUpuD2y2OSZpgKCx6mYsjPco2szUk?=
 =?us-ascii?Q?AtA5yTG4xsu2XFerQYGfJ6u6DLAW/h6PV3EvVVnDVAdbvL8oG6YiYAbqj5Nf?=
 =?us-ascii?Q?L0dQ6ymno95qmNE5eE2/yoYmidv1ZyviXNI0KaCeqQXD9cKuzoTy2wyUKHG3?=
 =?us-ascii?Q?R8NdO8IBxd5k3zvx6zjVpCNrT/zetNDmLzFE0eYWwT2IA/qB1udQZJ+lRY5j?=
 =?us-ascii?Q?G6DnA133onO17bIaXa4sVUU65Swng3aoL6ZF38DMVFMYYabcf/ixpxzTkNa+?=
 =?us-ascii?Q?lOgoBeWsQ6j81Jb9A67Bzfti5GF9ppxROma4FwNCvIqt3dRGO55h7IS7Qoji?=
 =?us-ascii?Q?mW43fauqcoPl8s6jhW90TBR5O/alpKlxw0mlyt7unL8MqEaijNFKZVFAhas1?=
 =?us-ascii?Q?dSU4/frTKFFlqLiQKFDy2Y6Cv+1L2wd0hTnnouZf+S0AhdTEDEYQzvzlqDu0?=
 =?us-ascii?Q?ZuEq84CksgPbWVsmuMePj+GBTeliGQFrCf8Pu7erB5bqZuRFlNQ1POFgZoCJ?=
 =?us-ascii?Q?DD33p23wD1Tzb78268VFHUqUnF3vBkUSglBWWaBgemde88DrlKFf/uLoi81t?=
 =?us-ascii?Q?mles+7Fh/m7dSXcsUuZDvvfeAtmiWdC6/e0eKKqIcErLKnUrybV9IfEGQHds?=
 =?us-ascii?Q?3+3E8isJ3IdoVaFrQ2g3yQEQyDqI6jx1RRHjsH3BbWayE3FZUwL/4XOalvUs?=
 =?us-ascii?Q?Fg+sAfqtTfIC/fqP0KpAS/3d3Zguot3WhoNUl5RbI80E51sgHnAhdJFplW06?=
 =?us-ascii?Q?pMFE1Lilemp3jXIXErNkJdbhNAkeyFXToq0FJjbXcFXOMi9cEtg2cMalbMxr?=
 =?us-ascii?Q?RKLs6yIUxyMzcU+t3/hqAqc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a593ca05-4bad-4157-fcd2-08d9c9d50e77
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:36.0763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fLftMzbj1L7x7qH77VD6WF6Kk3ZhSs/RTYCZqXyxbjKGw3/wN8a2Y6A8h9YV3wY3foa0LFGCYJEbuhiHy5ivJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-GUID: lEt6ZJ16SBYvLeO4OJH4GHViv6cWXava
X-Proofpoint-ORIG-GUID: Doz-rL-H0St25al84SSDD3PqfTPytHgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94540

From: Khem Raj <raj.khem@gmail.com>

Fixes
Checking for program 'pkg-config'                                                 : not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
index bf57cd637..0580bf292 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
@@ -39,7 +39,7 @@ SRC_URI[sha256sum] = "6f50353f9602aa20245eb18ceb00e7e5ec793df0974aebd5254c38f16d
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version
+inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
 CVE_CHECK_WHITELIST += "CVE-2011-2411" 
-- 
2.25.1


