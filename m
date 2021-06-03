Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.450.1622734266843237643
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LzThch1R;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=178868c7c5=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 153FDuC7017157
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 08:31:06 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 38xd5c0w2b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 08:31:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJkmqI4EU0KDRgmAdmKp/hZKQPee/WGY3l9Ut6fUcfCRu90HuQ2tBRQluxDRoUx/xkH41gv6gL40f8B3+gAgEDirnyDhf+5y0V4jbHZ9zFgOp7cmPKyCfA4UxPN/t0qB6Li67fTzh5v+Wc3fp92mGUBnEzH/WqalwwM64/kgDe/Y8TBwXyUl79GklCUoImX8a6p4rZTG85P4u9j0NbcfjKaomGjjaDCTgFrDEIr8vSmpg1uqAET/guB6vim9SDMGnE7/IP0StCPyLvUmYyh6VsfwFN8vgAoI9jGBF54H0weu9sJRdzcLjxXIm5ETxgvFRDmYCeq7bVnUq81mMhI0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PMA7lOR65i+N8enMPkVvh8FKAIWaYGF/T6Yxe6EGSo=;
 b=QdZUb8fNYcxFPnL3FRaIc2FrlBSO46JY4vOU7aJXLJ238tLg3RW3BRED+swSr6neIZlFadRxiol3wLSS2BE7JE7LeBeQCIhk84fycl6urq4K3tLg209crzTZLZMbSK7QLNxOJvH7sh7by5nFF3ROc2BUpXEUJlOxHmqXaRIi/bz7YQP4EjPLuDsBLa4nqU/FYpXYi0sqbhMoUeVEcJcIfwND6DjqbWatNnHk3kR8zR4+oyx6BLLxEczfTHjjoIjE0cyEdB6Rmvmjk9SAB7r28QQDpl5GTFvhz5SeFwLfjXvna1O6xooE+IVCcAuodliDjf1cvw4jOC4bl2C9az6VnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PMA7lOR65i+N8enMPkVvh8FKAIWaYGF/T6Yxe6EGSo=;
 b=LzThch1R8QSJyfAMcSzReSb5f5WOmeecDvuMZqQjYsGenQNx1RGPwKo7t5EylZ0rE3vd4CNaJQSUCs+1A5GdkGhi6tjkZkcfFf7jhEVtry1Euoc1sX3d/mR5Js4QBBAzX+RjFvkIx9VAin6noTWUYDKJvUt2ey9+80IDdAu2UdY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3479.namprd11.prod.outlook.com (2603:10b6:a03:1e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Thu, 3 Jun
 2021 15:31:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 15:31:03 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libnftnl: upgrade 1.1.9 -> 1.2.0
Date: Thu,  3 Jun 2021 11:30:54 -0400
Message-Id: <20210603153055.4118106-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR17CA0025.namprd17.prod.outlook.com (2603:10b6:a03:1b8::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 15:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee784db7-1533-4964-6598-08d926a49870
X-MS-TrafficTypeDiagnostic: BYAPR11MB3479:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3479B77A6DAC0C4A887393C19F3C9@BYAPR11MB3479.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Te2mczLJzxO6D+LWE1iodJAKL5BEnz9busnEQfoP9svP/BKB5Z8zanRcMhCi7BXs3ke0Uq0dkoxMYE1zQoIkuy5pYkBpUbIXgNjkQB7yDfJG7If3z8uvERZGn8qk97sQxmPfMeIJhTmAK+TnkNUifPhJbSfKq301GatnjtHPGnx1e4vavL3stGjkO0btaYHPtRYtESsMePVnadL4vy5pymNWyO6A0k7WWTCTKHu2JG4lu2CWp7i8eo3xtS3K5ltQbn6S72p6A6MBER7yA2T//Zndmw8BZS3K8tpUkaiAZX8eDHobHYdPYIw7dlN751OYnoRMyF2VC/H4cJS8AqY/wmEo04/+Ceqi4AjIuTyofp55RziQ+BegueEn7ewZ+irJZg6fcBd8SMh6TG/uBp1pLsDfL1T/KZzxaykkghZNqzHtuiuzHi72DLdcSjX67x4aKzW1HuM8j6pcfKN2h/6PbpB3mXXzbwsKjsV+1nwOYa3Nf2ZX3ZQdnM+DrtsgO6j7ukENc1cEvU3jWXsXB/WfNOkIqonPGuXKHBsMYubk88CE5+q6FKJWfrEQuW76bTT6hNT2DbIDOWVuvcda+4usW5cEgqax/CwMOXmvSoHn7JkTL3EnuZp4aIwd/oy6pHRBBcV1Zcb0nykCDaZPysQVXxZWc9kYB9ETcIc1I3d0u3c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(5660300002)(86362001)(38100700002)(316002)(2616005)(30864003)(44832011)(956004)(478600001)(1076003)(6486002)(26005)(36756003)(52116002)(83380400001)(66476007)(186003)(16526019)(6666004)(6512007)(8676002)(6506007)(6916009)(38350700002)(2906002)(8936002)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?NfFvxu7N8ZR/dt/bJdPZgiiW1/I9kVsD0OaOzI4clsvmTigA/LHU1vLV5+i4?=
 =?us-ascii?Q?QerPMeNQ3/bkhUxaLq80h+cKZmBIiHVL//lvyBSGvMI9wBXIazjvB4S/bUGx?=
 =?us-ascii?Q?gsX0LvpIiA97E4JDt1RzkviP0hIbM6tgP1ErF/yXmeCGz4NnZYgqqfBNd7rg?=
 =?us-ascii?Q?sDrdBHqcDo3r/23q33fEx8pYaZy1WqgPRKlnxMY6HGw3WqE/PJCP/qb62sfd?=
 =?us-ascii?Q?mBdz9LJNNGfEf8O2sChXCRtiYp/hGONe8oLCz8WS6MP8YPYf+66a70IlauQm?=
 =?us-ascii?Q?uSS3aXTLmPdkOvZt8yBQub++ZpqCC/FLr+HHO83x2fDnYIubBZ7YqVKGKlz5?=
 =?us-ascii?Q?pdQL1OLEz94qTNL2JhHAY5WnrZ67zd3CXurcNmwrQLoOtPRRdkfzaBFuVYyu?=
 =?us-ascii?Q?BDz36xToMeOBRrYGANhsoLM0hFwx3N4Kp1Z0l5+cIld4lBdTAWrSazQ8GSxC?=
 =?us-ascii?Q?OTs4PnXx+rpCq+QGCFrJSWz3g1MboA+PIkXuhROToLPCaodrzI6MrPiK2dMB?=
 =?us-ascii?Q?2Cc2avLn619XO3rGvOJJRMP4h5ZdfHZbhFXJTq2/nO3sTPZ5a7xwoiQ9ks5A?=
 =?us-ascii?Q?GjbbBqd5wI4LicRKkW6WfBOUYwFRDQ+8VgYq/5cuU/WzU4CMDlGTSWCZbBG0?=
 =?us-ascii?Q?IVhZas+e7WwFj8r+4GoXyTr0S710DLqPxJzvXVFTkiPaMOF3mUXbdqpzSIja?=
 =?us-ascii?Q?ZQrMZaBxdxDwC7v8rhvK6BetbZVBEKocDUPPQ5gsK1mR5pbTdDvxrxdwuHqH?=
 =?us-ascii?Q?QW6xtOSugFHKEPuwGL/jCE6EZ4XyXqP+aGPeNhX6rDChdOXig6cO9OnxIqS+?=
 =?us-ascii?Q?AY8qojxWOZbXZocdX2NdTNaLYoaReE77Yera4YYnM3VSFQlvady/7Q6ilBxX?=
 =?us-ascii?Q?9vy3NBKM/A+HxotpwQ8/ryhmHimC0qNrfds07cyIQCu5nrrPlu0yzMnz/cPG?=
 =?us-ascii?Q?WeBlnKjnN0U+qqr9E7/NxJBQnoX9aOWGPB5oMiNN3kaxEM204Roqe/0zmXL9?=
 =?us-ascii?Q?8Y/zU+CBanXkiyLDp6FV1SuKE2lV6MnwmZvvF7nVo4tPFf1z+t/R/aQkxHhv?=
 =?us-ascii?Q?7uAmxy/xXKuKTeU+9if6mh6s2ZBUvi9n5krRJZuV85HmqnHdPNXV35VEi1nN?=
 =?us-ascii?Q?4Kg02pp6DuoLqjhv+koXfCHGtQ+Kh9vXnku6bs60Q0uXirv4WumUKSu/Bgjd?=
 =?us-ascii?Q?uOPqAov0zUY3ost3WP/Li/fbeO3K0v89sE6IM3hJkl3XvN8iO28Nd8EA919d?=
 =?us-ascii?Q?Okr5/uC0mh4SHq/XbHj2WvUMO8TzucQI1yrMmik9K2BeFx5Lw0E5SZuS39hZ?=
 =?us-ascii?Q?xnIB3meY1ukiFuJ0PIp+hTER?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee784db7-1533-4964-6598-08d926a49870
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 15:31:02.6439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hz0pk0WA4Yw7lZ4KNpK8wwSIlOjw57JRWHLLul0PHFnyu2u8VEH19yZ+xwIA0Fk7Y1GFJvgW131mj3b3K/ve9d1FDK1zGfFfNPxwD/cS9n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3479
X-Proofpoint-ORIG-GUID: fi8zgwkNZO-WB403T1JrbU-1hOSYCRDj
X-Proofpoint-GUID: fi8zgwkNZO-WB403T1JrbU-1hOSYCRDj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-03_09:2021-06-03,2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030103
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade libnftnl in preparation for the upgrade of nftables, since the
latter requires libnftnl >= 1.2.0.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...cal-function-as-one-of-printf-family.patch | 256 +++++++++---------
 .../{libnftnl_1.1.9.bb => libnftnl_1.2.0.bb}  |   2 +-
 2 files changed, 131 insertions(+), 127 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.9.bb => libnftnl_1.2.0.bb} (88%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
index f49ef2a78..62328203d 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
@@ -1,6 +1,6 @@
-From e03b003610a176d608da9a02e433e7ded7e4b75f Mon Sep 17 00:00:00 2001
-From: Todd Cunningham <tcunningham07@gmail.com>
-Date: Wed, 11 Dec 2019 10:18:56 +1000
+From c29959e045dd09d0b5727682d4e9dbc10923ac4f Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Wed, 2 Jun 2021 11:08:51 -0400
 Subject: [PATCH] avoid naming local function as one of printf family
 
 Fixes build issues with clang
@@ -11,6 +11,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 
 Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
 Signed-off-by: Todd Cunningham <tcunningham07@gmail.com>
+
+Use wiggle to get the patch to apply for version 1.2.0.
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
  include/expr_ops.h      | 2 +-
  include/obj.h           | 2 +-
@@ -62,56 +66,56 @@ Signed-off-by: Todd Cunningham <tcunningham07@gmail.com>
  src/obj/synproxy.c      | 2 +-
  src/obj/tunnel.c        | 2 +-
  src/object.c            | 2 +-
- 49 files changed, 50 insertions(+), 50 deletions(-)
+ 50 files changed, 51 insertions(+), 51 deletions(-)
 
 diff --git a/include/expr_ops.h b/include/expr_ops.h
-index a7f1b9a..d2946de 100644
+index 7a6aa23..d3a2855 100644
 --- a/include/expr_ops.h
 +++ b/include/expr_ops.h
-@@ -17,7 +17,7 @@ struct expr_ops {
+@@ -18,7 +18,7 @@ struct expr_ops {
  	const void *(*get)(const struct nftnl_expr *e, uint16_t type, uint32_t *data_len);
  	int 	(*parse)(struct nftnl_expr *e, struct nlattr *attr);
  	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_expr *e);
--	int	(*snprintf)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_expr *e);
-+	int	(*snprintf_)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_expr *e);
+-	int	(*snprintf)(char *buf, size_t len, uint32_t flags, const struct nftnl_expr *e);
++	int	(*snprintf_)(char *buf, size_t len, uint32_t flags, const struct nftnl_expr *e);
  };
  
  struct expr_ops *nftnl_expr_ops_lookup(const char *name);
 diff --git a/include/obj.h b/include/obj.h
-index 9394d79..08610d7 100644
+index 60dc853..1c1c3c1 100644
 --- a/include/obj.h
 +++ b/include/obj.h
-@@ -99,7 +99,7 @@ struct obj_ops {
+@@ -109,7 +109,7 @@ struct obj_ops {
  	const void *(*get)(const struct nftnl_obj *e, uint16_t type, uint32_t *data_len);
  	int	(*parse)(struct nftnl_obj *e, struct nlattr *attr);
  	void	(*build)(struct nlmsghdr *nlh, const struct nftnl_obj *e);
--	int	(*snprintf)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_obj *e);
-+	int	(*snprintf_)(char *buf, size_t len, uint32_t type, uint32_t flags, const struct nftnl_obj *e);
+-	int	(*snprintf)(char *buf, size_t len, uint32_t flags, const struct nftnl_obj *e);
++	int	(*snprintf_)(char *buf, size_t len, uint32_t flags, const struct nftnl_obj *e);
  };
  
  extern struct obj_ops obj_ops_counter;
 diff --git a/src/expr.c b/src/expr.c
-index 80c4c36..b698a60 100644
+index 277bbde..2231b21 100644
 --- a/src/expr.c
 +++ b/src/expr.c
-@@ -275,10 +275,10 @@ int nftnl_expr_snprintf(char *buf, size_t size, const struct nftnl_expr *expr,
- 	if (size)
+@@ -279,10 +279,10 @@ int nftnl_expr_snprintf(char *buf, size_t remain, const struct nftnl_expr *expr,
+ 	if (remain)
  		buf[0] = '\0';
  
--	if (!expr->ops->snprintf)
-+	if (!expr->ops->snprintf_)
+-	if (!expr->ops->snprintf || type != NFTNL_OUTPUT_DEFAULT)
++	if (!expr->ops->snprintf_ || type != NFTNL_OUTPUT_DEFAULT)
  		return 0;
  
--	ret = expr->ops->snprintf(buf + offset, remain, type, flags, expr);
-+	ret = expr->ops->snprintf_(buf + offset, remain, type, flags, expr);
+-	ret = expr->ops->snprintf(buf + offset, remain, flags, expr);
++	ret = expr->ops->snprintf_(buf + offset, remain, flags, expr);
  	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  
  	return offset;
 diff --git a/src/expr/bitwise.c b/src/expr/bitwise.c
-index c9d40df..27d644b 100644
+index d0c7827..eded505 100644
 --- a/src/expr/bitwise.c
 +++ b/src/expr/bitwise.c
-@@ -219,5 +219,5 @@ struct expr_ops expr_ops_bitwise = {
+@@ -282,5 +282,5 @@ struct expr_ops expr_ops_bitwise = {
  	.get		= nftnl_expr_bitwise_get,
  	.parse		= nftnl_expr_bitwise_parse,
  	.build		= nftnl_expr_bitwise_build,
@@ -119,10 +123,10 @@ index c9d40df..27d644b 100644
 +	.snprintf_	= nftnl_expr_bitwise_snprintf,
  };
 diff --git a/src/expr/byteorder.c b/src/expr/byteorder.c
-index efdfa2b..7ae9dfb 100644
+index d299745..0068ab2 100644
 --- a/src/expr/byteorder.c
 +++ b/src/expr/byteorder.c
-@@ -234,5 +234,5 @@ struct expr_ops expr_ops_byteorder = {
+@@ -220,5 +220,5 @@ struct expr_ops expr_ops_byteorder = {
  	.get		= nftnl_expr_byteorder_get,
  	.parse		= nftnl_expr_byteorder_parse,
  	.build		= nftnl_expr_byteorder_build,
@@ -130,10 +134,10 @@ index efdfa2b..7ae9dfb 100644
 +	.snprintf_	= nftnl_expr_byteorder_snprintf,
  };
 diff --git a/src/expr/cmp.c b/src/expr/cmp.c
-index 86d7842..e3be442 100644
+index 6030693..7e548e6 100644
 --- a/src/expr/cmp.c
 +++ b/src/expr/cmp.c
-@@ -216,5 +216,5 @@ struct expr_ops expr_ops_cmp = {
+@@ -202,5 +202,5 @@ struct expr_ops expr_ops_cmp = {
  	.get		= nftnl_expr_cmp_get,
  	.parse		= nftnl_expr_cmp_parse,
  	.build		= nftnl_expr_cmp_build,
@@ -141,10 +145,10 @@ index 86d7842..e3be442 100644
 +	.snprintf_	= nftnl_expr_cmp_snprintf,
  };
 diff --git a/src/expr/connlimit.c b/src/expr/connlimit.c
-index 53af93b..6c8bc40 100644
+index 3b37587..39b7092 100644
 --- a/src/expr/connlimit.c
 +++ b/src/expr/connlimit.c
-@@ -149,5 +149,5 @@ struct expr_ops expr_ops_connlimit = {
+@@ -135,5 +135,5 @@ struct expr_ops expr_ops_connlimit = {
  	.get		= nftnl_expr_connlimit_get,
  	.parse		= nftnl_expr_connlimit_parse,
  	.build		= nftnl_expr_connlimit_build,
@@ -152,10 +156,10 @@ index 53af93b..6c8bc40 100644
 +	.snprintf_  = nftnl_expr_connlimit_snprintf,
  };
 diff --git a/src/expr/counter.c b/src/expr/counter.c
-index 89a602e..a32a69e 100644
+index 1676d70..42c96d9 100644
 --- a/src/expr/counter.c
 +++ b/src/expr/counter.c
-@@ -147,5 +147,5 @@ struct expr_ops expr_ops_counter = {
+@@ -133,5 +133,5 @@ struct expr_ops expr_ops_counter = {
  	.get		= nftnl_expr_counter_get,
  	.parse		= nftnl_expr_counter_parse,
  	.build		= nftnl_expr_counter_build,
@@ -163,10 +167,10 @@ index 89a602e..a32a69e 100644
 +	.snprintf_	= nftnl_expr_counter_snprintf,
  };
 diff --git a/src/expr/ct.c b/src/expr/ct.c
-index 124de9d..7bde179 100644
+index d5dfc81..8c15db1 100644
 --- a/src/expr/ct.c
 +++ b/src/expr/ct.c
-@@ -273,5 +273,5 @@ struct expr_ops expr_ops_ct = {
+@@ -258,5 +258,5 @@ struct expr_ops expr_ops_ct = {
  	.get		= nftnl_expr_ct_get,
  	.parse		= nftnl_expr_ct_parse,
  	.build		= nftnl_expr_ct_build,
@@ -174,10 +178,10 @@ index 124de9d..7bde179 100644
 +	.snprintf_	= nftnl_expr_ct_snprintf,
  };
 diff --git a/src/expr/dup.c b/src/expr/dup.c
-index 2bb35e5..d9bd4b1 100644
+index f041b55..6238a43 100644
 --- a/src/expr/dup.c
 +++ b/src/expr/dup.c
-@@ -154,5 +154,5 @@ struct expr_ops expr_ops_dup = {
+@@ -138,5 +138,5 @@ struct expr_ops expr_ops_dup = {
  	.get		= nftnl_expr_dup_get,
  	.parse		= nftnl_expr_dup_parse,
  	.build		= nftnl_expr_dup_build,
@@ -185,10 +189,10 @@ index 2bb35e5..d9bd4b1 100644
 +	.snprintf_	= nftnl_expr_dup_snprintf,
  };
 diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index 68115ba..6e43bb4 100644
+index 85d64bb..9afbb94 100644
 --- a/src/expr/dynset.c
 +++ b/src/expr/dynset.c
-@@ -288,5 +288,5 @@ struct expr_ops expr_ops_dynset = {
+@@ -373,5 +373,5 @@ struct expr_ops expr_ops_dynset = {
  	.get		= nftnl_expr_dynset_get,
  	.parse		= nftnl_expr_dynset_parse,
  	.build		= nftnl_expr_dynset_build,
@@ -196,10 +200,10 @@ index 68115ba..6e43bb4 100644
 +	.snprintf_	= nftnl_expr_dynset_snprintf,
  };
 diff --git a/src/expr/exthdr.c b/src/expr/exthdr.c
-index e5f714b..e68792b 100644
+index 1b813b1..25f1491 100644
 --- a/src/expr/exthdr.c
 +++ b/src/expr/exthdr.c
-@@ -276,5 +276,5 @@ struct expr_ops expr_ops_exthdr = {
+@@ -262,5 +262,5 @@ struct expr_ops expr_ops_exthdr = {
  	.get		= nftnl_expr_exthdr_get,
  	.parse		= nftnl_expr_exthdr_parse,
  	.build		= nftnl_expr_exthdr_build,
@@ -207,10 +211,10 @@ index e5f714b..e68792b 100644
 +	.snprintf_	= nftnl_expr_exthdr_snprintf,
  };
 diff --git a/src/expr/fib.c b/src/expr/fib.c
-index 9475af4..8e7090d 100644
+index aaff52a..3916e18 100644
 --- a/src/expr/fib.c
 +++ b/src/expr/fib.c
-@@ -213,5 +213,5 @@ struct expr_ops expr_ops_fib = {
+@@ -198,5 +198,5 @@ struct expr_ops expr_ops_fib = {
  	.get		= nftnl_expr_fib_get,
  	.parse		= nftnl_expr_fib_parse,
  	.build		= nftnl_expr_fib_build,
@@ -218,10 +222,10 @@ index 9475af4..8e7090d 100644
 +	.snprintf_	= nftnl_expr_fib_snprintf,
  };
 diff --git a/src/expr/flow_offload.c b/src/expr/flow_offload.c
-index 6ccec9a..c2f2478 100644
+index a826202..c1ca678 100644
 --- a/src/expr/flow_offload.c
 +++ b/src/expr/flow_offload.c
-@@ -134,5 +134,5 @@ struct expr_ops expr_ops_flow = {
+@@ -120,5 +120,5 @@ struct expr_ops expr_ops_flow = {
  	.get		= nftnl_expr_flow_get,
  	.parse		= nftnl_expr_flow_parse,
  	.build		= nftnl_expr_flow_build,
@@ -229,10 +233,10 @@ index 6ccec9a..c2f2478 100644
 +	.snprintf_	= nftnl_expr_flow_snprintf,
  };
 diff --git a/src/expr/fwd.c b/src/expr/fwd.c
-index cff8235..bcd7d3f 100644
+index 82e5a41..4e80687 100644
 --- a/src/expr/fwd.c
 +++ b/src/expr/fwd.c
-@@ -174,5 +174,5 @@ struct expr_ops expr_ops_fwd = {
+@@ -158,5 +158,5 @@ struct expr_ops expr_ops_fwd = {
  	.get		= nftnl_expr_fwd_get,
  	.parse		= nftnl_expr_fwd_parse,
  	.build		= nftnl_expr_fwd_build,
@@ -240,10 +244,10 @@ index cff8235..bcd7d3f 100644
 +	.snprintf_	= nftnl_expr_fwd_snprintf,
  };
 diff --git a/src/expr/hash.c b/src/expr/hash.c
-index 2c801d2..a9f6e7e 100644
+index 10b4a72..84ace31 100644
 --- a/src/expr/hash.c
 +++ b/src/expr/hash.c
-@@ -241,5 +241,5 @@ struct expr_ops expr_ops_hash = {
+@@ -226,5 +226,5 @@ struct expr_ops expr_ops_hash = {
  	.get		= nftnl_expr_hash_get,
  	.parse		= nftnl_expr_hash_parse,
  	.build		= nftnl_expr_hash_build,
@@ -251,10 +255,10 @@ index 2c801d2..a9f6e7e 100644
 +	.snprintf_	= nftnl_expr_hash_snprintf,
  };
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index 47106ae..ea86c88 100644
+index 94b043c..a8a3c1f 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
-@@ -235,5 +235,5 @@ struct expr_ops expr_ops_immediate = {
+@@ -229,5 +229,5 @@ struct expr_ops expr_ops_immediate = {
  	.get		= nftnl_expr_immediate_get,
  	.parse		= nftnl_expr_immediate_parse,
  	.build		= nftnl_expr_immediate_build,
@@ -262,10 +266,10 @@ index 47106ae..ea86c88 100644
 +	.snprintf_	= nftnl_expr_immediate_snprintf,
  };
 diff --git a/src/expr/limit.c b/src/expr/limit.c
-index 5872e27..0ce482f 100644
+index 3dfd54a..f652df0 100644
 --- a/src/expr/limit.c
 +++ b/src/expr/limit.c
-@@ -216,5 +216,5 @@ struct expr_ops expr_ops_limit = {
+@@ -202,5 +202,5 @@ struct expr_ops expr_ops_limit = {
  	.get		= nftnl_expr_limit_get,
  	.parse		= nftnl_expr_limit_parse,
  	.build		= nftnl_expr_limit_build,
@@ -273,10 +277,10 @@ index 5872e27..0ce482f 100644
 +	.snprintf_	= nftnl_expr_limit_snprintf,
  };
 diff --git a/src/expr/log.c b/src/expr/log.c
-index bbe43d2..5506bc2 100644
+index 86db548..d96b7ce 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
-@@ -267,5 +267,5 @@ struct expr_ops expr_ops_log = {
+@@ -253,5 +253,5 @@ struct expr_ops expr_ops_log = {
  	.get		= nftnl_expr_log_get,
  	.parse		= nftnl_expr_log_parse,
  	.build		= nftnl_expr_log_build,
@@ -284,10 +288,10 @@ index bbe43d2..5506bc2 100644
 +	.snprintf_	= nftnl_expr_log_snprintf,
  };
 diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index a495ac0..678868c 100644
+index 83adce9..1fbace4 100644
 --- a/src/expr/lookup.c
 +++ b/src/expr/lookup.c
-@@ -221,5 +221,5 @@ struct expr_ops expr_ops_lookup = {
+@@ -206,5 +206,5 @@ struct expr_ops expr_ops_lookup = {
  	.get		= nftnl_expr_lookup_get,
  	.parse		= nftnl_expr_lookup_parse,
  	.build		= nftnl_expr_lookup_build,
@@ -295,10 +299,10 @@ index a495ac0..678868c 100644
 +	.snprintf_	= nftnl_expr_lookup_snprintf,
  };
 diff --git a/src/expr/masq.c b/src/expr/masq.c
-index f6f3ceb..88292a6 100644
+index 684708c..1ce099c 100644
 --- a/src/expr/masq.c
 +++ b/src/expr/masq.c
-@@ -169,5 +169,5 @@ struct expr_ops expr_ops_masq = {
+@@ -163,5 +163,5 @@ struct expr_ops expr_ops_masq = {
  	.get		= nftnl_expr_masq_get,
  	.parse		= nftnl_expr_masq_parse,
  	.build		= nftnl_expr_masq_build,
@@ -306,10 +310,10 @@ index f6f3ceb..88292a6 100644
 +	.snprintf_	= nftnl_expr_masq_snprintf,
  };
 diff --git a/src/expr/match.c b/src/expr/match.c
-index 4fa74b2..249c6b5 100644
+index 533fdf5..8561986 100644
 --- a/src/expr/match.c
 +++ b/src/expr/match.c
-@@ -198,5 +198,5 @@ struct expr_ops expr_ops_match = {
+@@ -189,5 +189,5 @@ struct expr_ops expr_ops_match = {
  	.get		= nftnl_expr_match_get,
  	.parse		= nftnl_expr_match_parse,
  	.build		= nftnl_expr_match_build,
@@ -317,10 +321,10 @@ index 4fa74b2..249c6b5 100644
 +	.snprintf_	= nftnl_expr_match_snprintf,
  };
 diff --git a/src/expr/meta.c b/src/expr/meta.c
-index 73f6efa..35d5ec5 100644
+index 34fbb9b..1ef79a4 100644
 --- a/src/expr/meta.c
 +++ b/src/expr/meta.c
-@@ -226,5 +226,5 @@ struct expr_ops expr_ops_meta = {
+@@ -216,5 +216,5 @@ struct expr_ops expr_ops_meta = {
  	.get		= nftnl_expr_meta_get,
  	.parse		= nftnl_expr_meta_parse,
  	.build		= nftnl_expr_meta_build,
@@ -328,10 +332,10 @@ index 73f6efa..35d5ec5 100644
 +	.snprintf_	= nftnl_expr_meta_snprintf,
  };
 diff --git a/src/expr/nat.c b/src/expr/nat.c
-index 6b7d50e..be4a579 100644
+index 0a9cdd7..bc4a3fa 100644
 --- a/src/expr/nat.c
 +++ b/src/expr/nat.c
-@@ -279,5 +279,5 @@ struct expr_ops expr_ops_nat = {
+@@ -274,5 +274,5 @@ struct expr_ops expr_ops_nat = {
  	.get		= nftnl_expr_nat_get,
  	.parse		= nftnl_expr_nat_parse,
  	.build		= nftnl_expr_nat_build,
@@ -339,10 +343,10 @@ index 6b7d50e..be4a579 100644
 +	.snprintf_	= nftnl_expr_nat_snprintf,
  };
 diff --git a/src/expr/numgen.c b/src/expr/numgen.c
-index 4e0d541..5995ee3 100644
+index 159dfec..99bb442 100644
 --- a/src/expr/numgen.c
 +++ b/src/expr/numgen.c
-@@ -195,5 +195,5 @@ struct expr_ops expr_ops_ng = {
+@@ -180,5 +180,5 @@ struct expr_ops expr_ops_ng = {
  	.get		= nftnl_expr_ng_get,
  	.parse		= nftnl_expr_ng_parse,
  	.build		= nftnl_expr_ng_build,
@@ -350,10 +354,10 @@ index 4e0d541..5995ee3 100644
 +	.snprintf_	= nftnl_expr_ng_snprintf,
  };
 diff --git a/src/expr/objref.c b/src/expr/objref.c
-index 7388b18..e673ffd 100644
+index a4b6470..1b2d387 100644
 --- a/src/expr/objref.c
 +++ b/src/expr/objref.c
-@@ -210,5 +210,5 @@ struct expr_ops expr_ops_objref = {
+@@ -205,5 +205,5 @@ struct expr_ops expr_ops_objref = {
  	.get		= nftnl_expr_objref_get,
  	.parse		= nftnl_expr_objref_parse,
  	.build		= nftnl_expr_objref_build,
@@ -361,10 +365,10 @@ index 7388b18..e673ffd 100644
 +	.snprintf_	= nftnl_expr_objref_snprintf,
  };
 diff --git a/src/expr/osf.c b/src/expr/osf.c
-index 98d0df9..618b46e 100644
+index 215a681..75a6b3c 100644
 --- a/src/expr/osf.c
 +++ b/src/expr/osf.c
-@@ -161,5 +161,5 @@ struct expr_ops expr_ops_osf = {
+@@ -147,5 +147,5 @@ struct expr_ops expr_ops_osf = {
  	.get		= nftnl_expr_osf_get,
  	.parse		= nftnl_expr_osf_parse,
  	.build		= nftnl_expr_osf_build,
@@ -372,10 +376,10 @@ index 98d0df9..618b46e 100644
 +	.snprintf_	= nftnl_expr_osf_snprintf,
  };
 diff --git a/src/expr/payload.c b/src/expr/payload.c
-index 2192dad..37aacc4 100644
+index 9ccb78e..aa17025 100644
 --- a/src/expr/payload.c
 +++ b/src/expr/payload.c
-@@ -266,5 +266,5 @@ struct expr_ops expr_ops_payload = {
+@@ -258,5 +258,5 @@ struct expr_ops expr_ops_payload = {
  	.get		= nftnl_expr_payload_get,
  	.parse		= nftnl_expr_payload_parse,
  	.build		= nftnl_expr_payload_build,
@@ -383,10 +387,10 @@ index 2192dad..37aacc4 100644
 +	.snprintf_	= nftnl_expr_payload_snprintf,
  };
 diff --git a/src/expr/queue.c b/src/expr/queue.c
-index 051ef71..b06feff 100644
+index 8f70977..6bc76ef 100644
 --- a/src/expr/queue.c
 +++ b/src/expr/queue.c
-@@ -207,5 +207,5 @@ struct expr_ops expr_ops_queue = {
+@@ -193,5 +193,5 @@ struct expr_ops expr_ops_queue = {
  	.get		= nftnl_expr_queue_get,
  	.parse		= nftnl_expr_queue_parse,
  	.build		= nftnl_expr_queue_build,
@@ -394,10 +398,10 @@ index 051ef71..b06feff 100644
 +	.snprintf_	= nftnl_expr_queue_snprintf,
  };
 diff --git a/src/expr/quota.c b/src/expr/quota.c
-index 39a92e6..41797be 100644
+index 8c841d8..1a5f2fa 100644
 --- a/src/expr/quota.c
 +++ b/src/expr/quota.c
-@@ -161,5 +161,5 @@ struct expr_ops expr_ops_quota = {
+@@ -147,5 +147,5 @@ struct expr_ops expr_ops_quota = {
  	.get		= nftnl_expr_quota_get,
  	.parse		= nftnl_expr_quota_parse,
  	.build		= nftnl_expr_quota_build,
@@ -405,10 +409,10 @@ index 39a92e6..41797be 100644
 +	.snprintf_	= nftnl_expr_quota_snprintf,
  };
 diff --git a/src/expr/range.c b/src/expr/range.c
-index d1d5083..b619cdf 100644
+index f76843a..73a1930 100644
 --- a/src/expr/range.c
 +++ b/src/expr/range.c
-@@ -227,5 +227,5 @@ struct expr_ops expr_ops_range = {
+@@ -213,5 +213,5 @@ struct expr_ops expr_ops_range = {
  	.get		= nftnl_expr_range_get,
  	.parse		= nftnl_expr_range_parse,
  	.build		= nftnl_expr_range_build,
@@ -416,10 +420,10 @@ index d1d5083..b619cdf 100644
 +	.snprintf_	= nftnl_expr_range_snprintf,
  };
 diff --git a/src/expr/redir.c b/src/expr/redir.c
-index 477659a..5c4ebeb 100644
+index 4f56cb4..51ec71c 100644
 --- a/src/expr/redir.c
 +++ b/src/expr/redir.c
-@@ -181,5 +181,5 @@ struct expr_ops expr_ops_redir = {
+@@ -167,5 +167,5 @@ struct expr_ops expr_ops_redir = {
  	.get		= nftnl_expr_redir_get,
  	.parse		= nftnl_expr_redir_parse,
  	.build		= nftnl_expr_redir_build,
@@ -427,10 +431,10 @@ index 477659a..5c4ebeb 100644
 +	.snprintf_	= nftnl_expr_redir_snprintf,
  };
 diff --git a/src/expr/reject.c b/src/expr/reject.c
-index 141942e..a98990d 100644
+index 716d25c..acf32c2 100644
 --- a/src/expr/reject.c
 +++ b/src/expr/reject.c
-@@ -148,5 +148,5 @@ struct expr_ops expr_ops_reject = {
+@@ -134,5 +134,5 @@ struct expr_ops expr_ops_reject = {
  	.get		= nftnl_expr_reject_get,
  	.parse		= nftnl_expr_reject_parse,
  	.build		= nftnl_expr_reject_build,
@@ -438,10 +442,10 @@ index 141942e..a98990d 100644
 +	.snprintf_	= nftnl_expr_reject_snprintf,
  };
 diff --git a/src/expr/rt.c b/src/expr/rt.c
-index 0fce72d..32ace19 100644
+index 1ad9b2a..9f2fdf3 100644
 --- a/src/expr/rt.c
 +++ b/src/expr/rt.c
-@@ -177,5 +177,5 @@ struct expr_ops expr_ops_rt = {
+@@ -162,5 +162,5 @@ struct expr_ops expr_ops_rt = {
  	.get		= nftnl_expr_rt_get,
  	.parse		= nftnl_expr_rt_parse,
  	.build		= nftnl_expr_rt_build,
@@ -449,10 +453,10 @@ index 0fce72d..32ace19 100644
 +	.snprintf_	= nftnl_expr_rt_snprintf,
  };
 diff --git a/src/expr/socket.c b/src/expr/socket.c
-index 96550d5..2394dbf 100644
+index 02d86f8..49a126b 100644
 --- a/src/expr/socket.c
 +++ b/src/expr/socket.c
-@@ -174,5 +174,5 @@ struct expr_ops expr_ops_socket = {
+@@ -165,5 +165,5 @@ struct expr_ops expr_ops_socket = {
  	.get		= nftnl_expr_socket_get,
  	.parse		= nftnl_expr_socket_parse,
  	.build		= nftnl_expr_socket_build,
@@ -460,10 +464,10 @@ index 96550d5..2394dbf 100644
 +	.snprintf_	= nftnl_expr_socket_snprintf,
  };
 diff --git a/src/expr/synproxy.c b/src/expr/synproxy.c
-index 245f4fb..9721029 100644
+index 630f3f4..b22ad2f 100644
 --- a/src/expr/synproxy.c
 +++ b/src/expr/synproxy.c
-@@ -166,5 +166,5 @@ struct expr_ops expr_ops_synproxy = {
+@@ -152,5 +152,5 @@ struct expr_ops expr_ops_synproxy = {
  	.get		= nftnl_expr_synproxy_get,
  	.parse		= nftnl_expr_synproxy_parse,
  	.build		= nftnl_expr_synproxy_build,
@@ -471,10 +475,10 @@ index 245f4fb..9721029 100644
 +	.snprintf_	= nftnl_expr_synproxy_snprintf,
  };
 diff --git a/src/expr/target.c b/src/expr/target.c
-index 9100038..7180085 100644
+index b7c595a..31a039c 100644
 --- a/src/expr/target.c
 +++ b/src/expr/target.c
-@@ -198,5 +198,5 @@ struct expr_ops expr_ops_target = {
+@@ -189,5 +189,5 @@ struct expr_ops expr_ops_target = {
  	.get		= nftnl_expr_target_get,
  	.parse		= nftnl_expr_target_parse,
  	.build		= nftnl_expr_target_build,
@@ -482,10 +486,10 @@ index 9100038..7180085 100644
 +	.snprintf_	= nftnl_expr_target_snprintf,
  };
 diff --git a/src/expr/tproxy.c b/src/expr/tproxy.c
-index 3827b75..feabbbe 100644
+index d3ee8f8..1b01591 100644
 --- a/src/expr/tproxy.c
 +++ b/src/expr/tproxy.c
-@@ -183,5 +183,5 @@ struct expr_ops expr_ops_tproxy = {
+@@ -170,5 +170,5 @@ struct expr_ops expr_ops_tproxy = {
  	.get		= nftnl_expr_tproxy_get,
  	.parse		= nftnl_expr_tproxy_parse,
  	.build		= nftnl_expr_tproxy_build,
@@ -493,10 +497,10 @@ index 3827b75..feabbbe 100644
 +	.snprintf_	= nftnl_expr_tproxy_snprintf,
  };
 diff --git a/src/expr/tunnel.c b/src/expr/tunnel.c
-index b2b8d72..1ed46d3 100644
+index 1460fd2..6c2f653 100644
 --- a/src/expr/tunnel.c
 +++ b/src/expr/tunnel.c
-@@ -173,5 +173,5 @@ struct expr_ops expr_ops_tunnel = {
+@@ -145,5 +145,5 @@ struct expr_ops expr_ops_tunnel = {
  	.get		= nftnl_expr_tunnel_get,
  	.parse		= nftnl_expr_tunnel_parse,
  	.build		= nftnl_expr_tunnel_build,
@@ -504,10 +508,10 @@ index b2b8d72..1ed46d3 100644
 +	.snprintf_	= nftnl_expr_tunnel_snprintf,
  };
 diff --git a/src/expr/xfrm.c b/src/expr/xfrm.c
-index 8fe5438..b6b2772 100644
+index c81d14d..e648ee5 100644
 --- a/src/expr/xfrm.c
 +++ b/src/expr/xfrm.c
-@@ -239,5 +239,5 @@ struct expr_ops expr_ops_xfrm = {
+@@ -196,5 +196,5 @@ struct expr_ops expr_ops_xfrm = {
  	.get		= nftnl_expr_xfrm_get,
  	.parse		= nftnl_expr_xfrm_parse,
  	.build		= nftnl_expr_xfrm_build,
@@ -515,10 +519,10 @@ index 8fe5438..b6b2772 100644
 +	.snprintf_	= nftnl_expr_xfrm_snprintf,
  };
 diff --git a/src/obj/counter.c b/src/obj/counter.c
-index 1baba4e..3710bce 100644
+index ef0cd20..0c199f7 100644
 --- a/src/obj/counter.c
 +++ b/src/obj/counter.c
-@@ -145,5 +145,5 @@ struct obj_ops obj_ops_counter = {
+@@ -127,5 +127,5 @@ struct obj_ops obj_ops_counter = {
  	.get		= nftnl_obj_counter_get,
  	.parse		= nftnl_obj_counter_parse,
  	.build		= nftnl_obj_counter_build,
@@ -526,10 +530,10 @@ index 1baba4e..3710bce 100644
 +	.snprintf_	= nftnl_obj_counter_snprintf,
  };
 diff --git a/src/obj/ct_expect.c b/src/obj/ct_expect.c
-index c0bb5ba..953c08c 100644
+index 8136ad9..b3e1d70 100644
 --- a/src/obj/ct_expect.c
 +++ b/src/obj/ct_expect.c
-@@ -209,5 +209,5 @@ struct obj_ops obj_ops_ct_expect = {
+@@ -196,5 +196,5 @@ struct obj_ops obj_ops_ct_expect = {
  	.get		= nftnl_obj_ct_expect_get,
  	.parse		= nftnl_obj_ct_expect_parse,
  	.build		= nftnl_obj_ct_expect_build,
@@ -537,10 +541,10 @@ index c0bb5ba..953c08c 100644
 +	.snprintf_	= nftnl_obj_ct_expect_snprintf,
  };
 diff --git a/src/obj/ct_helper.c b/src/obj/ct_helper.c
-index d91f636..2037461 100644
+index c52032a..12b783c 100644
 --- a/src/obj/ct_helper.c
 +++ b/src/obj/ct_helper.c
-@@ -166,5 +166,5 @@ struct obj_ops obj_ops_ct_helper = {
+@@ -150,5 +150,5 @@ struct obj_ops obj_ops_ct_helper = {
  	.get		= nftnl_obj_ct_helper_get,
  	.parse		= nftnl_obj_ct_helper_parse,
  	.build		= nftnl_obj_ct_helper_build,
@@ -548,10 +552,10 @@ index d91f636..2037461 100644
 +	.snprintf_	= nftnl_obj_ct_helper_snprintf,
  };
 diff --git a/src/obj/ct_timeout.c b/src/obj/ct_timeout.c
-index e2e9991..a4f2dd2 100644
+index 1d4f8fb..0a12883 100644
 --- a/src/obj/ct_timeout.c
 +++ b/src/obj/ct_timeout.c
-@@ -330,5 +330,5 @@ struct obj_ops obj_ops_ct_timeout = {
+@@ -316,5 +316,5 @@ struct obj_ops obj_ops_ct_timeout = {
  	.get		= nftnl_obj_ct_timeout_get,
  	.parse		= nftnl_obj_ct_timeout_parse,
  	.build		= nftnl_obj_ct_timeout_build,
@@ -559,10 +563,10 @@ index e2e9991..a4f2dd2 100644
 +	.snprintf_	= nftnl_obj_ct_timeout_snprintf,
  };
 diff --git a/src/obj/limit.c b/src/obj/limit.c
-index 60b0159..538f37a 100644
+index 8b40f9d..2f049b8 100644
 --- a/src/obj/limit.c
 +++ b/src/obj/limit.c
-@@ -185,5 +185,5 @@ struct obj_ops obj_ops_limit = {
+@@ -168,5 +168,5 @@ struct obj_ops obj_ops_limit = {
  	.get		= nftnl_obj_limit_get,
  	.parse		= nftnl_obj_limit_parse,
  	.build		= nftnl_obj_limit_build,
@@ -570,10 +574,10 @@ index 60b0159..538f37a 100644
 +	.snprintf_	= nftnl_obj_limit_snprintf,
  };
 diff --git a/src/obj/quota.c b/src/obj/quota.c
-index 1914037..585a088 100644
+index 8ab3300..8666334 100644
 --- a/src/obj/quota.c
 +++ b/src/obj/quota.c
-@@ -161,5 +161,5 @@ struct obj_ops obj_ops_quota = {
+@@ -144,5 +144,5 @@ struct obj_ops obj_ops_quota = {
  	.get		= nftnl_obj_quota_get,
  	.parse		= nftnl_obj_quota_parse,
  	.build		= nftnl_obj_quota_build,
@@ -581,21 +585,32 @@ index 1914037..585a088 100644
 +	.snprintf_	= nftnl_obj_quota_snprintf,
  };
 diff --git a/src/obj/secmark.c b/src/obj/secmark.c
-index e27b5fa..6241bee 100644
+index 2ccc803..e96e06f 100644
 --- a/src/obj/secmark.c
 +++ b/src/obj/secmark.c
-@@ -133,5 +133,5 @@ struct obj_ops obj_ops_secmark = {
+@@ -116,5 +116,5 @@ struct obj_ops obj_ops_secmark = {
  	.get		= nftnl_obj_secmark_get,
  	.parse		= nftnl_obj_secmark_parse,
  	.build		= nftnl_obj_secmark_build,
 -	.snprintf	= nftnl_obj_secmark_snprintf,
 +	.snprintf_	= nftnl_obj_secmark_snprintf,
  };
+diff --git a/src/obj/synproxy.c b/src/obj/synproxy.c
+index d689fee..d06cb6d 100644
+--- a/src/obj/synproxy.c
++++ b/src/obj/synproxy.c
+@@ -143,5 +143,5 @@ struct obj_ops obj_ops_synproxy = {
+ 	.get		= nftnl_obj_synproxy_get,
+ 	.parse		= nftnl_obj_synproxy_parse,
+ 	.build		= nftnl_obj_synproxy_build,
+-	.snprintf	= nftnl_obj_synproxy_snprintf,
++	.snprintf_	= nftnl_obj_synproxy_snprintf,
+ };
 diff --git a/src/obj/tunnel.c b/src/obj/tunnel.c
-index 7ffade8..800eb3e 100644
+index 5ede6bd..d3743ff 100644
 --- a/src/obj/tunnel.c
 +++ b/src/obj/tunnel.c
-@@ -564,5 +564,5 @@ struct obj_ops obj_ops_tunnel = {
+@@ -547,5 +547,5 @@ struct obj_ops obj_ops_tunnel = {
  	.get		= nftnl_obj_tunnel_get,
  	.parse		= nftnl_obj_tunnel_parse,
  	.build		= nftnl_obj_tunnel_build,
@@ -603,29 +618,18 @@ index 7ffade8..800eb3e 100644
 +	.snprintf_	= nftnl_obj_tunnel_snprintf,
  };
 diff --git a/src/object.c b/src/object.c
-index d8c87ee..5307d7e 100644
+index 46e208b..d321c50 100644
 --- a/src/object.c
 +++ b/src/object.c
-@@ -370,7 +370,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t size,
+@@ -396,7 +396,7 @@ static int nftnl_obj_snprintf_dflt(char *buf, size_t remain,
  	SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  
  	if (obj->ops) {
--		ret = obj->ops->snprintf(buf + offset, offset, type, flags,
-+		ret = obj->ops->snprintf_(buf + offset, offset, type, flags,
- 					 obj);
+-		ret = obj->ops->snprintf(buf + offset, remain, flags, obj);
++		ret = obj->ops->snprintf_(buf + offset, remain, flags, obj);
  		SNPRINTF_BUFFER_SIZE(ret, remain, offset);
  	}
-diff --git a/src/obj/synproxy.c b/src/obj/synproxy.c
-index 56ebc85..6b5380f 100644
---- a/src/obj/synproxy.c
-+++ b/src/obj/synproxy.c
-@@ -157,5 +157,5 @@ struct obj_ops obj_ops_synproxy = {
- 	.get		= nftnl_obj_synproxy_get,
- 	.parse		= nftnl_obj_synproxy_parse,
- 	.build		= nftnl_obj_synproxy_build,
--	.snprintf	= nftnl_obj_synproxy_snprintf,
-+	.snprintf_	= nftnl_obj_synproxy_snprintf,
- };
+ 	ret = snprintf(buf + offset, remain, "]");
 -- 
-2.17.1
+2.31.1
 
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.9.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.0.bb
similarity index 88%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.9.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.0.bb
index 5532af8d9..2b90fdd1b 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.9.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "c3fdda6ac8675aea9b35772458544f03157be415"
+SRCREV = "d45be40eef72f0d42a1ba82efddbb0970d4c760a"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-- 
2.31.1

