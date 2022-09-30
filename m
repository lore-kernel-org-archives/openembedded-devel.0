Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C547C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 03:32:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1845.1664508715994552413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KMMRtvc/;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=727255fef3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28U3Gf09024685
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:31:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=P86AWMuC4YI+0lAgluuXsC5sxzgpqcG7LwjK8+M/S6M=;
 b=KMMRtvc/ajAu+2kFaiPihPsb5hsMcBb4eba/Zeme4PdcWa15tDyxr/aqzMbUFuTMJXl5
 ZTWcmlEDXpDPDkIbmla5v5j+YkEzlE5nbkMccxG8D7ZKpouDzinOgEvX8MNf/8mmWu7p
 Ocy8/FYuNPREoqBsRb/qGfX7Ung1sEiG1R+8roFEz7ab/tMIKQpVaf3xxOBP8TsHYtrB
 +ukaTh6dNdbq701hV6yx+qSxD0F/DVbDM91PaTMFSNr8rp73Tw0YE0FYAKrDmPNOQgGz
 ec7+s7c3zmRl9wFwWrMysjDPT3YOdRyJ5vn6ypFXXLUAa2LnEYj8fzZiNrw5qnhOZK5v JA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65n2ka-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9lqgSOPr3GvI+JbSoV4+zIlkYVO2eP4RRnbnPWadrTUvOIdLwDHRNxve/2N//1iA9ExN1mgwkFLzHyB9LAYvXjgn6j9VvOu+QYg0iLPMJ3MHDJ8H4a+kwC6h6wIciCwTy0X0tP5IFzsHGaevFXgoTuvql6vfow3hQVer2/vJF23T329G+zS5TDu7Mif1aRIR+Vaq/oCBSuKCJhpcAm1XraHqIhaQP1Fl66MZTdFGe4Uzqf5ZEQd6yJYSs2ZwY5AHUSQEAPDsK8OyS07gHzjToJkxW9Nhv50k4/Eueo3QDLaYT2mL/KrUbdVSl8Kn0VDZ+Ap6G5CJj0XoYUQtxgkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P86AWMuC4YI+0lAgluuXsC5sxzgpqcG7LwjK8+M/S6M=;
 b=fOWx8P8Bh7OvpHiafByncbiShBLmdeq6IpryYY7iTw6SqjY0v/zJwWzI1b7/SPSf2qNXbWHTVihc3q5kvYMueLPRtompO0IgkFSRYqNYmnNr9DomQyBMFHE4/vUZlq+pNWW4Sotc+VT24K6xnGXFYQa0EZ7VXuf1Iw6Oh2JbMSV5nKvEU0diFzOUSqcFjnWJDQNyCf5tFBNz/rqdTvbNEcl/AMpZuBCtwFPzAlk5BKEW3ZYxkJk2iXTOiAVp37L5hptysw+N86L3ZJPiRVcS52AiDzk5/tTZpZ3sCcQ8CQ7hakKnV5FVb/u5Yn6JA2iijL6DhvpvD/lNgFtJl2J7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 03:31:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366%3]) with mapi id 15.20.5676.019; Fri, 30 Sep 2022
 03:31:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libnftnl: upgrade 1.2.2 -> 1.2.3
Date: Fri, 30 Sep 2022 11:31:37 +0800
Message-Id: <20220930033138.1421606-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ac5215-0f2e-4c2e-7ec1-08daa29450a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yrsa15hzKrimMyoWwrHFGtq9ynOXmwkqol2yWHHP4WvtNm9DeGtNG1pAIP73bMkDb9Ld4TwB2cXtNJt2wY9FSL0K6wdbCXzUF/NBV5QSPHYzFqWYZuSoLs6NW/OBzOs8OjDrzlTwgT7kJ32yoS7AjgwVTE0KeUDsoZZCYh6Fk8dgXA8vlVL9NGX+4RiD5kaRFRTCHrbKW8xLYkWyegHQ2C9p4/CMHn+q21ZW3umey5uP+ogJxyveAqkXG5DrPRLIBKEMy6srlntpNaaeOwQpED9cYE2CoaI1vwjNmUGZX+d23+kMrsPtD0AtJJT1+dsyIkirlwEYucl7G0F1CZ8vfn+n3aqnVRU63pm6PHAbv94lDRL3ddCB3sO34PDgrk6Y69TQx9bDC83P0036uKVbk3WP/eErxqXdP4jCkcQbgSwYTh1e/ssIuY6HtVCvNEcuR/jErwuj9UXwAqmmuzwENG5Smp65LsqISfg7a9DgUrsQLTTjjzQtgHYCn4uzBvH6/IbPDz4S4C/BTZcrMoF3zJd1PxZb6fdpQ4T+WHmv/Np/KZWLNWJLWJOrcXgPVwq98sqJJO87s6Cf0SUCIfU9viWnUsQ4cyRr3+l1jDiI39//RWxkplygkyW6A13ENyh8oe1zfEZy/irHk+VOpckv8KQ596v54dh1uqehOonZsVT1CrJJRD7byZcUEzdUq4u3c+WXAEVUp7umgI/3tFTecTAwTj3CrJIzrXLXXoHBp1gXMzzw3NIpvocPZb2CMRLPVPIr94DhqLCWtBPqd91OVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(366004)(346002)(376002)(451199015)(66476007)(86362001)(6916009)(66946007)(66556008)(38350700002)(83380400001)(38100700002)(186003)(2906002)(2616005)(1076003)(26005)(52116002)(6666004)(6512007)(6506007)(6486002)(478600001)(41300700001)(316002)(36756003)(30864003)(44832011)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ECJkcBZX5GYMFZuLzC1J8kVHlfvEgQeD44i+bv35FCk60t6b6gYDTfBJAOoG?=
 =?us-ascii?Q?Vf9hgSCqK2Lg+SRtv5pl6RwPUofhv5i0eOQWvaP8LQi4eXOxbYCQ82BOZ/mZ?=
 =?us-ascii?Q?+JcHiNqx01TBijvYTUbsFTKNVdu2War2dCY/AGEHbWucvnUYRq9sCjrHPgK7?=
 =?us-ascii?Q?8Y8VWxoT7X7//ACBkER4pYYqx3WyShUrkhjDAmxpJz2cTRuMh52RZxWAMX7X?=
 =?us-ascii?Q?hzyOXh7yj1tpe+S8oZBc1zunHU3MjpnlXQuewrLZnaGr32Knp/SqFOv9J8r1?=
 =?us-ascii?Q?n5BvLG+QiS4dtt+onV0aRHEUVagd3FjufUq8Yov2Bj1ztkTeUMPBtMlRNyjU?=
 =?us-ascii?Q?szaIhwXe/F/knUECp9nBNTyZ+wbAmAUdYKp9HLs0FAvT9EYkKtNapu1wl8BR?=
 =?us-ascii?Q?x3YWHAoCtKpRAsObxwoC92hl8aAPOnVQWxwFTuu4A2ITZjfEAmC9s50vh04B?=
 =?us-ascii?Q?WR/IvYRAti8Tve5PgHlhiawb35NnLY4q/xrt+sevpjleUDHJe5M6xlRRQCNI?=
 =?us-ascii?Q?NVKhwmYQfggojrDFsKXA8BenRsl2p+qW9vchKgIao1ade+7WS0qqbB6PNbPO?=
 =?us-ascii?Q?s3dpkKMDsIGy6H30RKWr8OZSI6RspCt5YJTLv/F9R+KWktnJnKaa2ZTynbmH?=
 =?us-ascii?Q?X/yJKe+Se3a31KU6p20L8tCPRq1SPG/3KTm/hC9dTMbFdvHppPGLOsOa2R9M?=
 =?us-ascii?Q?+IGwhO/5CKQ9SXFcyMzeymdcbp8sgAuCIlpyYPmry48mHgip+ZCMPNbh+yT6?=
 =?us-ascii?Q?GZsbgDU6iqkCrmkyrzOZtTiZ02GIf4bEY9WvuDruPEALK6VJTBTTdtFDRF4U?=
 =?us-ascii?Q?nZLdCEDaw+qiqXTcBSYoiamfbEzKrX3ikMtV8hqqFuSrHBHiZ67iYGNXqJJY?=
 =?us-ascii?Q?juZfWi6Td4KcHUegBQtYSeS7en2nrhWeWHF6v1q2mgjT39i+G+g8hm2uZqVp?=
 =?us-ascii?Q?qCWwAJ8QsWFtagUfWbG1+p2AjnXCvwbZ5wW735tTa41FS1rYPYqp81gCdkQv?=
 =?us-ascii?Q?p/B7a9yb/7hh7gAzaFO4HoCyBGd1kJthmd2uK8oQBp6V/f6sgEaZ9AvlEGMP?=
 =?us-ascii?Q?yCYTTQKdAggstP2c9BEDhIZyfw26tI3LP+EQj/dnhjBiA+ULv0iDSH1XAYpt?=
 =?us-ascii?Q?ySyDtrfBhrgCrhdH6tTGZS6l7KOVkILXjJKspJhWLGBVRd3Ifi8QBEsi06H3?=
 =?us-ascii?Q?JdHIh+V7zKzRTleh9BQbHAPFCAnairNWeJCOVdqEfEfEQBjp/XPf8hWl5ZI7?=
 =?us-ascii?Q?IE6BpKeGrdI1BQga8vDbom3vo/tnHn442J69LdJN/eAQuasYgC08YJPiFbYm?=
 =?us-ascii?Q?QSS5zoLmUrN/JomPaVltxh7vXygHidzFvQxY0i5Gi49J2JSaVruLzlh7VxBs?=
 =?us-ascii?Q?pwwB/aSMGHwUl23tP+9yWtXkUhR1Q3DtRkSmvtC8Ae4HuWtP6NKwGy7UEtpi?=
 =?us-ascii?Q?SZCxhl0q+iaPGfAvPllM5TzmM2uuS/yNOfWSyMr4cxSFTsvduIbSs3C9XnLv?=
 =?us-ascii?Q?/me0OjbwBoEHSVbiocS7S8NursNLkv6YzchzkaNfuzv6ja30VyuflOrUPLSG?=
 =?us-ascii?Q?bjvHmpRjTwPLmJVNBugE96i7pJAe1gJs8++Sexow?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31ac5215-0f2e-4c2e-7ec1-08daa29450a6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 03:31:52.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tRSsTVejqHU9ldSX9zMw/a1OA7Lt2FDLZ6GFZsanJh5kI+Im26x5S52lt+hBke7w7eOlLpIHv+uAxaSyL8Be6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-Proofpoint-GUID: pg3vQhy0YU9RN43BCeI4Hg2PrWrkueJB
X-Proofpoint-ORIG-GUID: pg3vQhy0YU9RN43BCeI4Hg2PrWrkueJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_01,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209300021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 03:32:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99018

Drop 0001-avoid-naming-local-function-as-one-of-printf-family.patch as
the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...cal-function-as-one-of-printf-family.patch | 650 ------------------
 .../{libnftnl_1.2.2.bb => libnftnl_1.2.3.bb}  |  10 +-
 2 files changed, 4 insertions(+), 656 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.2.bb => libnftnl_1.2.3.bb} (89%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
deleted file mode 100644
index 68eb04a83..000000000
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
+++ /dev/null
@@ -1,650 +0,0 @@
-From e03b003610a176d608da9a02e433e7ded7e4b75f Mon Sep 17 00:00:00 2001
-From: Todd Cunningham <tcunningham07@gmail.com>
-Date: Wed, 11 Dec 2019 10:18:56 +1000
-Subject: [PATCH] avoid naming local function as one of printf family
-
-Fixes build issues with clang
-error: no member named '__builtin___snprintf_chk' in 'struct expr_ops'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
-Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-Signed-off-by: Todd Cunningham <tcunningham07@gmail.com>
-
-Use wiggle to get the patch to apply for version 1.2.0.
-
-Add the same change in src/expr/last.c to make the patch apply for
-1.2.1. Also correct the patch to show the original author and metadata.
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
----
- include/expr_ops.h      | 2 +-
- include/obj.h           | 2 +-
- src/expr.c              | 4 ++--
- src/expr/bitwise.c      | 2 +-
- src/expr/byteorder.c    | 2 +-
- src/expr/cmp.c          | 2 +-
- src/expr/connlimit.c    | 2 +-
- src/expr/counter.c      | 2 +-
- src/expr/ct.c           | 2 +-
- src/expr/dup.c          | 2 +-
- src/expr/dynset.c       | 2 +-
- src/expr/exthdr.c       | 2 +-
- src/expr/fib.c          | 2 +-
- src/expr/flow_offload.c | 2 +-
- src/expr/fwd.c          | 2 +-
- src/expr/hash.c         | 2 +-
- src/expr/immediate.c    | 2 +-
- src/expr/last.c         | 2 +-
- src/expr/limit.c        | 2 +-
- src/expr/log.c          | 2 +-
- src/expr/lookup.c       | 2 +-
- src/expr/masq.c         | 2 +-
- src/expr/match.c        | 2 +-
- src/expr/meta.c         | 2 +-
- src/expr/nat.c          | 2 +-
- src/expr/numgen.c       | 2 +-
- src/expr/objref.c       | 2 +-
- src/expr/osf.c          | 2 +-
- src/expr/payload.c      | 2 +-
- src/expr/queue.c        | 2 +-
- src/expr/quota.c        | 2 +-
- src/expr/range.c        | 2 +-
- src/expr/redir.c        | 2 +-
- src/expr/reject.c       | 2 +-
- src/expr/rt.c           | 2 +-
- src/expr/socket.c       | 2 +-
- src/expr/synproxy.c     | 2 +-
- src/expr/target.c       | 2 +-
- src/expr/tproxy.c       | 2 +-
- src/expr/tunnel.c       | 2 +-
- src/expr/xfrm.c         | 2 +-
- src/obj/counter.c       | 2 +-
- src/obj/ct_expect.c     | 2 +-
- src/obj/ct_helper.c     | 2 +-
- src/obj/ct_timeout.c    | 2 +-
- src/obj/limit.c         | 2 +-
- src/obj/quota.c         | 2 +-
- src/obj/secmark.c       | 2 +-
- src/obj/synproxy.c      | 2 +-
- src/obj/tunnel.c        | 2 +-
- src/object.c            | 2 +-
- 51 files changed, 52 insertions(+), 52 deletions(-)
-
-diff --git a/include/expr_ops.h b/include/expr_ops.h
-index 7a6aa23..d3a2855 100644
---- a/include/expr_ops.h
-+++ b/include/expr_ops.h
-@@ -18,7 +18,7 @@ struct expr_ops {
- 	const void *(*get)(const struct nftnl_expr *e, uint16_t type, uint32_t *data_len);
- 	int 	(*parse)(struct nftnl_expr *e, struct nlattr *attr);
- 	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_expr *e);
--	int	(*snprintf)(char *buf, size_t len, uint32_t flags, const struct nftnl_expr *e);
-+	int	(*snprintf_)(char *buf, size_t len, uint32_t flags, const struct nftnl_expr *e);
- };
- 
- struct expr_ops *nftnl_expr_ops_lookup(const char *name);
-diff --git a/include/obj.h b/include/obj.h
-index 60dc853..1c1c3c1 100644
---- a/include/obj.h
-+++ b/include/obj.h
-@@ -109,7 +109,7 @@ struct obj_ops {
- 	const void *(*get)(const struct nftnl_obj *e, uint16_t type, uint32_t *data_len);
- 	int	(*parse)(struct nftnl_obj *e, struct nlattr *attr);
- 	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_obj *e);
--	int	(*snprintf)(char *buf, size_t len, uint32_t flags, const struct nftnl_obj *e);
-+	int	(*snprintf_)(char *buf, size_t len, uint32_t flags, const struct nftnl_obj *e);
- };
- 
- extern struct obj_ops obj_ops_counter;
-diff --git a/src/expr.c b/src/expr.c
-index 277bbde..2231b21 100644
---- a/src/expr.c
-+++ b/src/expr.c
-@@ -279,10 +279,10 @@ int nftnl_expr_snprintf(char *buf, size_t remain, const struct nftnl_expr *expr,
- 	if (remain)
- 		buf[0] = '\0';
- 
--	if (!expr->ops->snprintf || type != NFTNL_OUTPUT_DEFAULT)
-+	if (!expr->ops->snprintf_ || type != NFTNL_OUTPUT_DEFAULT)
- 		return 0;
- 
--	ret = expr->ops->snprintf(buf + offset, remain, flags, expr);
-+	ret = expr->ops->snprintf_(buf + offset, remain, flags, expr);
- 	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
- 
- 	return offset;
-diff --git a/src/expr/bitwise.c b/src/expr/bitwise.c
-index d0c7827..eded505 100644
---- a/src/expr/bitwise.c
-+++ b/src/expr/bitwise.c
-@@ -282,5 +282,5 @@ struct expr_ops expr_ops_bitwise = {
- 	.get		= nftnl_expr_bitwise_get,
- 	.parse		= nftnl_expr_bitwise_parse,
- 	.build		= nftnl_expr_bitwise_build,
--	.snprintf	= nftnl_expr_bitwise_snprintf,
-+	.snprintf_	= nftnl_expr_bitwise_snprintf,
- };
-diff --git a/src/expr/byteorder.c b/src/expr/byteorder.c
-index d299745..0068ab2 100644
---- a/src/expr/byteorder.c
-+++ b/src/expr/byteorder.c
-@@ -220,5 +220,5 @@ struct expr_ops expr_ops_byteorder = {
- 	.get		= nftnl_expr_byteorder_get,
- 	.parse		= nftnl_expr_byteorder_parse,
- 	.build		= nftnl_expr_byteorder_build,
--	.snprintf	= nftnl_expr_byteorder_snprintf,
-+	.snprintf_	= nftnl_expr_byteorder_snprintf,
- };
-diff --git a/src/expr/cmp.c b/src/expr/cmp.c
-index 6030693..7e548e6 100644
---- a/src/expr/cmp.c
-+++ b/src/expr/cmp.c
-@@ -202,5 +202,5 @@ struct expr_ops expr_ops_cmp = {
- 	.get		= nftnl_expr_cmp_get,
- 	.parse		= nftnl_expr_cmp_parse,
- 	.build		= nftnl_expr_cmp_build,
--	.snprintf	= nftnl_expr_cmp_snprintf,
-+	.snprintf_	= nftnl_expr_cmp_snprintf,
- };
-diff --git a/src/expr/connlimit.c b/src/expr/connlimit.c
-index 3b37587..39b7092 100644
---- a/src/expr/connlimit.c
-+++ b/src/expr/connlimit.c
-@@ -135,5 +135,5 @@ struct expr_ops expr_ops_connlimit = {
- 	.get		= nftnl_expr_connlimit_get,
- 	.parse		= nftnl_expr_connlimit_parse,
- 	.build		= nftnl_expr_connlimit_build,
--	.snprintf	= nftnl_expr_connlimit_snprintf,
-+	.snprintf_  = nftnl_expr_connlimit_snprintf,
- };
-diff --git a/src/expr/counter.c b/src/expr/counter.c
-index 1676d70..42c96d9 100644
---- a/src/expr/counter.c
-+++ b/src/expr/counter.c
-@@ -133,5 +133,5 @@ struct expr_ops expr_ops_counter = {
- 	.get		= nftnl_expr_counter_get,
- 	.parse		= nftnl_expr_counter_parse,
- 	.build		= nftnl_expr_counter_build,
--	.snprintf	= nftnl_expr_counter_snprintf,
-+	.snprintf_	= nftnl_expr_counter_snprintf,
- };
-diff --git a/src/expr/ct.c b/src/expr/ct.c
-index d5dfc81..8c15db1 100644
---- a/src/expr/ct.c
-+++ b/src/expr/ct.c
-@@ -258,5 +258,5 @@ struct expr_ops expr_ops_ct = {
- 	.get		= nftnl_expr_ct_get,
- 	.parse		= nftnl_expr_ct_parse,
- 	.build		= nftnl_expr_ct_build,
--	.snprintf	= nftnl_expr_ct_snprintf,
-+	.snprintf_	= nftnl_expr_ct_snprintf,
- };
-diff --git a/src/expr/dup.c b/src/expr/dup.c
-index f041b55..6238a43 100644
---- a/src/expr/dup.c
-+++ b/src/expr/dup.c
-@@ -138,5 +138,5 @@ struct expr_ops expr_ops_dup = {
- 	.get		= nftnl_expr_dup_get,
- 	.parse		= nftnl_expr_dup_parse,
- 	.build		= nftnl_expr_dup_build,
--	.snprintf	= nftnl_expr_dup_snprintf,
-+	.snprintf_	= nftnl_expr_dup_snprintf,
- };
-diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index 85d64bb..9afbb94 100644
---- a/src/expr/dynset.c
-+++ b/src/expr/dynset.c
-@@ -373,5 +373,5 @@ struct expr_ops expr_ops_dynset = {
- 	.get		= nftnl_expr_dynset_get,
- 	.parse		= nftnl_expr_dynset_parse,
- 	.build		= nftnl_expr_dynset_build,
--	.snprintf	= nftnl_expr_dynset_snprintf,
-+	.snprintf_	= nftnl_expr_dynset_snprintf,
- };
-diff --git a/src/expr/exthdr.c b/src/expr/exthdr.c
-index 1b813b1..25f1491 100644
---- a/src/expr/exthdr.c
-+++ b/src/expr/exthdr.c
-@@ -262,5 +262,5 @@ struct expr_ops expr_ops_exthdr = {
- 	.get		= nftnl_expr_exthdr_get,
- 	.parse		= nftnl_expr_exthdr_parse,
- 	.build		= nftnl_expr_exthdr_build,
--	.snprintf	= nftnl_expr_exthdr_snprintf,
-+	.snprintf_	= nftnl_expr_exthdr_snprintf,
- };
-diff --git a/src/expr/fib.c b/src/expr/fib.c
-index aaff52a..3916e18 100644
---- a/src/expr/fib.c
-+++ b/src/expr/fib.c
-@@ -198,5 +198,5 @@ struct expr_ops expr_ops_fib = {
- 	.get		= nftnl_expr_fib_get,
- 	.parse		= nftnl_expr_fib_parse,
- 	.build		= nftnl_expr_fib_build,
--	.snprintf	= nftnl_expr_fib_snprintf,
-+	.snprintf_	= nftnl_expr_fib_snprintf,
- };
-diff --git a/src/expr/flow_offload.c b/src/expr/flow_offload.c
-index a826202..c1ca678 100644
---- a/src/expr/flow_offload.c
-+++ b/src/expr/flow_offload.c
-@@ -120,5 +120,5 @@ struct expr_ops expr_ops_flow = {
- 	.get		= nftnl_expr_flow_get,
- 	.parse		= nftnl_expr_flow_parse,
- 	.build		= nftnl_expr_flow_build,
--	.snprintf	= nftnl_expr_flow_snprintf,
-+	.snprintf_	= nftnl_expr_flow_snprintf,
- };
-diff --git a/src/expr/fwd.c b/src/expr/fwd.c
-index 82e5a41..4e80687 100644
---- a/src/expr/fwd.c
-+++ b/src/expr/fwd.c
-@@ -158,5 +158,5 @@ struct expr_ops expr_ops_fwd = {
- 	.get		= nftnl_expr_fwd_get,
- 	.parse		= nftnl_expr_fwd_parse,
- 	.build		= nftnl_expr_fwd_build,
--	.snprintf	= nftnl_expr_fwd_snprintf,
-+	.snprintf_	= nftnl_expr_fwd_snprintf,
- };
-diff --git a/src/expr/hash.c b/src/expr/hash.c
-index 10b4a72..84ace31 100644
---- a/src/expr/hash.c
-+++ b/src/expr/hash.c
-@@ -226,5 +226,5 @@ struct expr_ops expr_ops_hash = {
- 	.get		= nftnl_expr_hash_get,
- 	.parse		= nftnl_expr_hash_parse,
- 	.build		= nftnl_expr_hash_build,
--	.snprintf	= nftnl_expr_hash_snprintf,
-+	.snprintf_	= nftnl_expr_hash_snprintf,
- };
-diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index 94b043c..a8a3c1f 100644
---- a/src/expr/immediate.c
-+++ b/src/expr/immediate.c
-@@ -229,5 +229,5 @@ struct expr_ops expr_ops_immediate = {
- 	.get		= nftnl_expr_immediate_get,
- 	.parse		= nftnl_expr_immediate_parse,
- 	.build		= nftnl_expr_immediate_build,
--	.snprintf	= nftnl_expr_immediate_snprintf,
-+	.snprintf_	= nftnl_expr_immediate_snprintf,
- };
-diff --git a/src/expr/last.c b/src/expr/last.c
-index e2a60c4..2f75464 100644
---- a/src/expr/last.c
-+++ b/src/expr/last.c
-@@ -134,5 +134,5 @@ struct expr_ops expr_ops_last = {
- 	.get		= nftnl_expr_last_get,
- 	.parse		= nftnl_expr_last_parse,
- 	.build		= nftnl_expr_last_build,
--	.snprintf	= nftnl_expr_last_snprintf,
-+	.snprintf_	= nftnl_expr_last_snprintf,
- };
-diff --git a/src/expr/limit.c b/src/expr/limit.c
-index 3dfd54a..f652df0 100644
---- a/src/expr/limit.c
-+++ b/src/expr/limit.c
-@@ -202,5 +202,5 @@ struct expr_ops expr_ops_limit = {
- 	.get		= nftnl_expr_limit_get,
- 	.parse		= nftnl_expr_limit_parse,
- 	.build		= nftnl_expr_limit_build,
--	.snprintf	= nftnl_expr_limit_snprintf,
-+	.snprintf_	= nftnl_expr_limit_snprintf,
- };
-diff --git a/src/expr/log.c b/src/expr/log.c
-index 86db548..d96b7ce 100644
---- a/src/expr/log.c
-+++ b/src/expr/log.c
-@@ -253,5 +253,5 @@ struct expr_ops expr_ops_log = {
- 	.get		= nftnl_expr_log_get,
- 	.parse		= nftnl_expr_log_parse,
- 	.build		= nftnl_expr_log_build,
--	.snprintf	= nftnl_expr_log_snprintf,
-+	.snprintf_	= nftnl_expr_log_snprintf,
- };
-diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index 83adce9..1fbace4 100644
---- a/src/expr/lookup.c
-+++ b/src/expr/lookup.c
-@@ -206,5 +206,5 @@ struct expr_ops expr_ops_lookup = {
- 	.get		= nftnl_expr_lookup_get,
- 	.parse		= nftnl_expr_lookup_parse,
- 	.build		= nftnl_expr_lookup_build,
--	.snprintf	= nftnl_expr_lookup_snprintf,
-+	.snprintf_	= nftnl_expr_lookup_snprintf,
- };
-diff --git a/src/expr/masq.c b/src/expr/masq.c
-index 684708c..1ce099c 100644
---- a/src/expr/masq.c
-+++ b/src/expr/masq.c
-@@ -163,5 +163,5 @@ struct expr_ops expr_ops_masq = {
- 	.get		= nftnl_expr_masq_get,
- 	.parse		= nftnl_expr_masq_parse,
- 	.build		= nftnl_expr_masq_build,
--	.snprintf	= nftnl_expr_masq_snprintf,
-+	.snprintf_	= nftnl_expr_masq_snprintf,
- };
-diff --git a/src/expr/match.c b/src/expr/match.c
-index 533fdf5..8561986 100644
---- a/src/expr/match.c
-+++ b/src/expr/match.c
-@@ -189,5 +189,5 @@ struct expr_ops expr_ops_match = {
- 	.get		= nftnl_expr_match_get,
- 	.parse		= nftnl_expr_match_parse,
- 	.build		= nftnl_expr_match_build,
--	.snprintf	= nftnl_expr_match_snprintf,
-+	.snprintf_	= nftnl_expr_match_snprintf,
- };
-diff --git a/src/expr/meta.c b/src/expr/meta.c
-index 34fbb9b..1ef79a4 100644
---- a/src/expr/meta.c
-+++ b/src/expr/meta.c
-@@ -216,5 +216,5 @@ struct expr_ops expr_ops_meta = {
- 	.get		= nftnl_expr_meta_get,
- 	.parse		= nftnl_expr_meta_parse,
- 	.build		= nftnl_expr_meta_build,
--	.snprintf	= nftnl_expr_meta_snprintf,
-+	.snprintf_	= nftnl_expr_meta_snprintf,
- };
-diff --git a/src/expr/nat.c b/src/expr/nat.c
-index 0a9cdd7..bc4a3fa 100644
---- a/src/expr/nat.c
-+++ b/src/expr/nat.c
-@@ -274,5 +274,5 @@ struct expr_ops expr_ops_nat = {
- 	.get		= nftnl_expr_nat_get,
- 	.parse		= nftnl_expr_nat_parse,
- 	.build		= nftnl_expr_nat_build,
--	.snprintf	= nftnl_expr_nat_snprintf,
-+	.snprintf_	= nftnl_expr_nat_snprintf,
- };
-diff --git a/src/expr/numgen.c b/src/expr/numgen.c
-index 159dfec..99bb442 100644
---- a/src/expr/numgen.c
-+++ b/src/expr/numgen.c
-@@ -180,5 +180,5 @@ struct expr_ops expr_ops_ng = {
- 	.get		= nftnl_expr_ng_get,
- 	.parse		= nftnl_expr_ng_parse,
- 	.build		= nftnl_expr_ng_build,
--	.snprintf	= nftnl_expr_ng_snprintf,
-+	.snprintf_	= nftnl_expr_ng_snprintf,
- };
-diff --git a/src/expr/objref.c b/src/expr/objref.c
-index a4b6470..1b2d387 100644
---- a/src/expr/objref.c
-+++ b/src/expr/objref.c
-@@ -205,5 +205,5 @@ struct expr_ops expr_ops_objref = {
- 	.get		= nftnl_expr_objref_get,
- 	.parse		= nftnl_expr_objref_parse,
- 	.build		= nftnl_expr_objref_build,
--	.snprintf	= nftnl_expr_objref_snprintf,
-+	.snprintf_	= nftnl_expr_objref_snprintf,
- };
-diff --git a/src/expr/osf.c b/src/expr/osf.c
-index 215a681..75a6b3c 100644
---- a/src/expr/osf.c
-+++ b/src/expr/osf.c
-@@ -147,5 +147,5 @@ struct expr_ops expr_ops_osf = {
- 	.get		= nftnl_expr_osf_get,
- 	.parse		= nftnl_expr_osf_parse,
- 	.build		= nftnl_expr_osf_build,
--	.snprintf	= nftnl_expr_osf_snprintf,
-+	.snprintf_	= nftnl_expr_osf_snprintf,
- };
-diff --git a/src/expr/payload.c b/src/expr/payload.c
-index 82747ec..e9130ec 100644
---- a/src/expr/payload.c
-+++ b/src/expr/payload.c
-@@ -259,5 +259,5 @@ struct expr_ops expr_ops_payload = {
- 	.get		= nftnl_expr_payload_get,
- 	.parse		= nftnl_expr_payload_parse,
- 	.build		= nftnl_expr_payload_build,
--	.snprintf	= nftnl_expr_payload_snprintf,
-+	.snprintf_	= nftnl_expr_payload_snprintf,
- };
-diff --git a/src/expr/queue.c b/src/expr/queue.c
-index 8f70977..6bc76ef 100644
---- a/src/expr/queue.c
-+++ b/src/expr/queue.c
-@@ -193,5 +193,5 @@ struct expr_ops expr_ops_queue = {
- 	.get		= nftnl_expr_queue_get,
- 	.parse		= nftnl_expr_queue_parse,
- 	.build		= nftnl_expr_queue_build,
--	.snprintf	= nftnl_expr_queue_snprintf,
-+	.snprintf_	= nftnl_expr_queue_snprintf,
- };
-diff --git a/src/expr/quota.c b/src/expr/quota.c
-index 8c841d8..1a5f2fa 100644
---- a/src/expr/quota.c
-+++ b/src/expr/quota.c
-@@ -147,5 +147,5 @@ struct expr_ops expr_ops_quota = {
- 	.get		= nftnl_expr_quota_get,
- 	.parse		= nftnl_expr_quota_parse,
- 	.build		= nftnl_expr_quota_build,
--	.snprintf	= nftnl_expr_quota_snprintf,
-+	.snprintf_	= nftnl_expr_quota_snprintf,
- };
-diff --git a/src/expr/range.c b/src/expr/range.c
-index f76843a..73a1930 100644
---- a/src/expr/range.c
-+++ b/src/expr/range.c
-@@ -213,5 +213,5 @@ struct expr_ops expr_ops_range = {
- 	.get		= nftnl_expr_range_get,
- 	.parse		= nftnl_expr_range_parse,
- 	.build		= nftnl_expr_range_build,
--	.snprintf	= nftnl_expr_range_snprintf,
-+	.snprintf_	= nftnl_expr_range_snprintf,
- };
-diff --git a/src/expr/redir.c b/src/expr/redir.c
-index 4f56cb4..51ec71c 100644
---- a/src/expr/redir.c
-+++ b/src/expr/redir.c
-@@ -167,5 +167,5 @@ struct expr_ops expr_ops_redir = {
- 	.get		= nftnl_expr_redir_get,
- 	.parse		= nftnl_expr_redir_parse,
- 	.build		= nftnl_expr_redir_build,
--	.snprintf	= nftnl_expr_redir_snprintf,
-+	.snprintf_	= nftnl_expr_redir_snprintf,
- };
-diff --git a/src/expr/reject.c b/src/expr/reject.c
-index 716d25c..acf32c2 100644
---- a/src/expr/reject.c
-+++ b/src/expr/reject.c
-@@ -134,5 +134,5 @@ struct expr_ops expr_ops_reject = {
- 	.get		= nftnl_expr_reject_get,
- 	.parse		= nftnl_expr_reject_parse,
- 	.build		= nftnl_expr_reject_build,
--	.snprintf	= nftnl_expr_reject_snprintf,
-+	.snprintf_	= nftnl_expr_reject_snprintf,
- };
-diff --git a/src/expr/rt.c b/src/expr/rt.c
-index 1ad9b2a..9f2fdf3 100644
---- a/src/expr/rt.c
-+++ b/src/expr/rt.c
-@@ -162,5 +162,5 @@ struct expr_ops expr_ops_rt = {
- 	.get		= nftnl_expr_rt_get,
- 	.parse		= nftnl_expr_rt_parse,
- 	.build		= nftnl_expr_rt_build,
--	.snprintf	= nftnl_expr_rt_snprintf,
-+	.snprintf_	= nftnl_expr_rt_snprintf,
- };
-diff --git a/src/expr/socket.c b/src/expr/socket.c
-index 02d86f8..49a126b 100644
---- a/src/expr/socket.c
-+++ b/src/expr/socket.c
-@@ -165,5 +165,5 @@ struct expr_ops expr_ops_socket = {
- 	.get		= nftnl_expr_socket_get,
- 	.parse		= nftnl_expr_socket_parse,
- 	.build		= nftnl_expr_socket_build,
--	.snprintf	= nftnl_expr_socket_snprintf,
-+	.snprintf_	= nftnl_expr_socket_snprintf,
- };
-diff --git a/src/expr/synproxy.c b/src/expr/synproxy.c
-index 630f3f4..b22ad2f 100644
---- a/src/expr/synproxy.c
-+++ b/src/expr/synproxy.c
-@@ -152,5 +152,5 @@ struct expr_ops expr_ops_synproxy = {
- 	.get		= nftnl_expr_synproxy_get,
- 	.parse		= nftnl_expr_synproxy_parse,
- 	.build		= nftnl_expr_synproxy_build,
--	.snprintf	= nftnl_expr_synproxy_snprintf,
-+	.snprintf_	= nftnl_expr_synproxy_snprintf,
- };
-diff --git a/src/expr/target.c b/src/expr/target.c
-index b7c595a..31a039c 100644
---- a/src/expr/target.c
-+++ b/src/expr/target.c
-@@ -189,5 +189,5 @@ struct expr_ops expr_ops_target = {
- 	.get		= nftnl_expr_target_get,
- 	.parse		= nftnl_expr_target_parse,
- 	.build		= nftnl_expr_target_build,
--	.snprintf	= nftnl_expr_target_snprintf,
-+	.snprintf_	= nftnl_expr_target_snprintf,
- };
-diff --git a/src/expr/tproxy.c b/src/expr/tproxy.c
-index d3ee8f8..1b01591 100644
---- a/src/expr/tproxy.c
-+++ b/src/expr/tproxy.c
-@@ -170,5 +170,5 @@ struct expr_ops expr_ops_tproxy = {
- 	.get		= nftnl_expr_tproxy_get,
- 	.parse		= nftnl_expr_tproxy_parse,
- 	.build		= nftnl_expr_tproxy_build,
--	.snprintf	= nftnl_expr_tproxy_snprintf,
-+	.snprintf_	= nftnl_expr_tproxy_snprintf,
- };
-diff --git a/src/expr/tunnel.c b/src/expr/tunnel.c
-index 1460fd2..6c2f653 100644
---- a/src/expr/tunnel.c
-+++ b/src/expr/tunnel.c
-@@ -145,5 +145,5 @@ struct expr_ops expr_ops_tunnel = {
- 	.get		= nftnl_expr_tunnel_get,
- 	.parse		= nftnl_expr_tunnel_parse,
- 	.build		= nftnl_expr_tunnel_build,
--	.snprintf	= nftnl_expr_tunnel_snprintf,
-+	.snprintf_	= nftnl_expr_tunnel_snprintf,
- };
-diff --git a/src/expr/xfrm.c b/src/expr/xfrm.c
-index c81d14d..e648ee5 100644
---- a/src/expr/xfrm.c
-+++ b/src/expr/xfrm.c
-@@ -196,5 +196,5 @@ struct expr_ops expr_ops_xfrm = {
- 	.get		= nftnl_expr_xfrm_get,
- 	.parse		= nftnl_expr_xfrm_parse,
- 	.build		= nftnl_expr_xfrm_build,
--	.snprintf	= nftnl_expr_xfrm_snprintf,
-+	.snprintf_	= nftnl_expr_xfrm_snprintf,
- };
-diff --git a/src/obj/counter.c b/src/obj/counter.c
-index ef0cd20..0c199f7 100644
---- a/src/obj/counter.c
-+++ b/src/obj/counter.c
-@@ -127,5 +127,5 @@ struct obj_ops obj_ops_counter = {
- 	.get		= nftnl_obj_counter_get,
- 	.parse		= nftnl_obj_counter_parse,
- 	.build		= nftnl_obj_counter_build,
--	.snprintf	= nftnl_obj_counter_snprintf,
-+	.snprintf_	= nftnl_obj_counter_snprintf,
- };
-diff --git a/src/obj/ct_expect.c b/src/obj/ct_expect.c
-index 8136ad9..b3e1d70 100644
---- a/src/obj/ct_expect.c
-+++ b/src/obj/ct_expect.c
-@@ -196,5 +196,5 @@ struct obj_ops obj_ops_ct_expect = {
- 	.get		= nftnl_obj_ct_expect_get,
- 	.parse		= nftnl_obj_ct_expect_parse,
- 	.build		= nftnl_obj_ct_expect_build,
--	.snprintf	= nftnl_obj_ct_expect_snprintf,
-+	.snprintf_	= nftnl_obj_ct_expect_snprintf,
- };
-diff --git a/src/obj/ct_helper.c b/src/obj/ct_helper.c
-index c52032a..12b783c 100644
---- a/src/obj/ct_helper.c
-+++ b/src/obj/ct_helper.c
-@@ -150,5 +150,5 @@ struct obj_ops obj_ops_ct_helper = {
- 	.get		= nftnl_obj_ct_helper_get,
- 	.parse		= nftnl_obj_ct_helper_parse,
- 	.build		= nftnl_obj_ct_helper_build,
--	.snprintf	= nftnl_obj_ct_helper_snprintf,
-+	.snprintf_	= nftnl_obj_ct_helper_snprintf,
- };
-diff --git a/src/obj/ct_timeout.c b/src/obj/ct_timeout.c
-index 1d4f8fb..0a12883 100644
---- a/src/obj/ct_timeout.c
-+++ b/src/obj/ct_timeout.c
-@@ -316,5 +316,5 @@ struct obj_ops obj_ops_ct_timeout = {
- 	.get		= nftnl_obj_ct_timeout_get,
- 	.parse		= nftnl_obj_ct_timeout_parse,
- 	.build		= nftnl_obj_ct_timeout_build,
--	.snprintf	= nftnl_obj_ct_timeout_snprintf,
-+	.snprintf_	= nftnl_obj_ct_timeout_snprintf,
- };
-diff --git a/src/obj/limit.c b/src/obj/limit.c
-index 8b40f9d..2f049b8 100644
---- a/src/obj/limit.c
-+++ b/src/obj/limit.c
-@@ -168,5 +168,5 @@ struct obj_ops obj_ops_limit = {
- 	.get		= nftnl_obj_limit_get,
- 	.parse		= nftnl_obj_limit_parse,
- 	.build		= nftnl_obj_limit_build,
--	.snprintf	= nftnl_obj_limit_snprintf,
-+	.snprintf_	= nftnl_obj_limit_snprintf,
- };
-diff --git a/src/obj/quota.c b/src/obj/quota.c
-index 8ab3300..8666334 100644
---- a/src/obj/quota.c
-+++ b/src/obj/quota.c
-@@ -144,5 +144,5 @@ struct obj_ops obj_ops_quota = {
- 	.get		= nftnl_obj_quota_get,
- 	.parse		= nftnl_obj_quota_parse,
- 	.build		= nftnl_obj_quota_build,
--	.snprintf	= nftnl_obj_quota_snprintf,
-+	.snprintf_	= nftnl_obj_quota_snprintf,
- };
-diff --git a/src/obj/secmark.c b/src/obj/secmark.c
-index 2ccc803..e96e06f 100644
---- a/src/obj/secmark.c
-+++ b/src/obj/secmark.c
-@@ -116,5 +116,5 @@ struct obj_ops obj_ops_secmark = {
- 	.get		= nftnl_obj_secmark_get,
- 	.parse		= nftnl_obj_secmark_parse,
- 	.build		= nftnl_obj_secmark_build,
--	.snprintf	= nftnl_obj_secmark_snprintf,
-+	.snprintf_	= nftnl_obj_secmark_snprintf,
- };
-diff --git a/src/obj/synproxy.c b/src/obj/synproxy.c
-index d689fee..d06cb6d 100644
---- a/src/obj/synproxy.c
-+++ b/src/obj/synproxy.c
-@@ -143,5 +143,5 @@ struct obj_ops obj_ops_synproxy = {
- 	.get		= nftnl_obj_synproxy_get,
- 	.parse		= nftnl_obj_synproxy_parse,
- 	.build		= nftnl_obj_synproxy_build,
--	.snprintf	= nftnl_obj_synproxy_snprintf,
-+	.snprintf_	= nftnl_obj_synproxy_snprintf,
- };
-diff --git a/src/obj/tunnel.c b/src/obj/tunnel.c
-index 5ede6bd..d3743ff 100644
---- a/src/obj/tunnel.c
-+++ b/src/obj/tunnel.c
-@@ -547,5 +547,5 @@ struct obj_ops obj_ops_tunnel = {
- 	.get		= nftnl_obj_tunnel_get,
- 	.parse		= nftnl_obj_tunnel_parse,
- 	.build		= nftnl_obj_tunnel_build,
--	.snprintf	= nftnl_obj_tunnel_snprintf,
-+	.snprintf_	= nftnl_obj_tunnel_snprintf,
- };
-diff --git a/src/object.c b/src/object.c
-index 46e208b..d321c50 100644
---- a/src/object.c
-+++ b/src/object.c
-@@ -396,7 +396,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t remain,
- 	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
- 
- 	if (obj->ops) {
--		ret = obj->ops->snprintf(buf + offset, remain, flags, obj);
-+		ret = obj->ops->snprintf_(buf + offset, remain, flags, obj);
- 		SNPRINTF_BUFFER_SIZE(ret, remain, offset);
- 	}
- 	ret = snprintf(buf + offset, remain, "]");
--- 
-2.33.1
-
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
similarity index 89%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
index 3eca92dce..ab55767fe 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
@@ -2,28 +2,27 @@ SUMMARY = "Library for low-level interaction with nftables Netlink's API over li
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
-DEPENDS = "libmnl"
 
-SRCREV = "f6575131e60ab10f131ea3ff36f69af2b6c3f614"
 SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
-           file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
+SRCREV = "817c8b66f1ea8c223b7513d4cd7bff525d8a0a9f"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest
 
+DEPENDS = "libmnl"
 RDEPENDS:${PN}-ptest += " bash python3-core make"
- 
+
 TESTDIR = "tests"
 
 do_compile_ptest() {
     cp -rf ${S}/build-aux .
     oe_runmake buildtest-TESTS
 }
- 
+
 do_install_ptest() {
     cp -rf ${B}/build-aux ${D}${PTEST_PATH}
     install -d ${D}${PTEST_PATH}/${TESTDIR}
@@ -38,4 +37,3 @@ do_install_ptest() {
     # other nonexistent paths before running the actual tests
     sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 }
-
-- 
2.25.1


