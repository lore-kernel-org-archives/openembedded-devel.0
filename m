Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABCBC43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:58:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.940.1657900725704862047
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QHqyD5YK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4195b8c341=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26FDu58v027516
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:58:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ycM1q5yRXYVoWihByOtLlpmq6DCAUY40vXjdLS9eWZc=;
 b=QHqyD5YKG8GhRFc77z95a+AxYZv7mFkXZlH/LHW+iWzbtaTVznoBP4ecWRCx8qZ7MCHE
 HcBfaelU2firlyDxrlHEltTjhwc0TUCaKUOBLh5ZVgMlX+Ynw+9q8Y++S9mLIV6Gdd4m
 JeAmYKpyEOrguRbQIkf81Z9rfH7wbzXzaUSsNKo750+o5JEMq86TvGYJYohMTSA7G2XU
 qe1xITkuiw/egOzLwsZp1jxIlP9qaYeOIBcWkJX1aREBhl6dtbUKWvDxkKzY0TmqPD13
 ZRDbMUR0TU6JUj+nP794JOJwFZmHL06kvey0/sqgUn+YqLlklI0GvJMxBPw+6eplyFsr 6w==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h9mcftbkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvEipcD+wBTXnW5MHdpJ3gjxtzV/ADXUYPpzSVtOhd2Fo5UM4MgYMTWyY1hDVaWsWZl7BhRBU3x3qeE1E+0f2vwLjfpBKtaRco/lEwcsZvfcHgx6iwZ/ZtbTeZvbkNodQlKuzrIZodbVJV58mVyvv95yFDM4IWuaop6zE6VZRj0/1Oj4gnnzOWBxVXus+60xvOERWRZVDJ21KhowCb5BaBAUWJ59fo/2Y0A2H0gpM77IgTKu2U3B7VwwsrtLlXfAZNQc/b+XoVJbOVwx3KMOiL+nqDrnj4ZRC/15JbZRFJP5WCwJdU60m7DcgPmkBA/yW51Oz1tDFsO3Wja10HfKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycM1q5yRXYVoWihByOtLlpmq6DCAUY40vXjdLS9eWZc=;
 b=dcu7SWp8vGnAv3yKzTSrcDBAyHjX1kh7F/iAJ49+MONaBhWMXa4FeNcOiF0V5akFAYUjf7uPOiuKPQ8hgBcZulNrdTGoxafIJF65dZFXnLLehQYW7mkMlQ6vNipNCtDvI1wlrFUn5b9qksXv5K98+vYzYrdvK21XsV09coKD8qdHwFxJna/Jf++WIFMA1r5CnvC/+PygFivpAd0pprv2i54/2F44uUyxzfr1m2aKRlCSA4LrAKvoaNC+ShiA4IaiviZTZyh+oQFY0HwbvwKr5+lgBZvMT/rNVevEc7Q/MGV2/izx85kFY10bsC331+sWa24gQCYp51to7HbsafPUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 15:58:29 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%8]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 15:58:29 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] rsyslog: update 8.2202->8.2206
Date: Fri, 15 Jul 2022 11:58:13 -0400
Message-Id: <20220715155813.621904-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0177.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::20) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc6c1415-34ac-457e-eb62-08da667adc4b
X-MS-TrafficTypeDiagnostic: PH0PR11MB4837:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p8aRKvXm9FjpsIoDrTMY+oAybsPHATx9c8ES7Z0Z8V+DauM3tWWnCQhy+6C9Q7SF1QuYNYpvpLTH+XzhE04c96j9NvJ1prv9WCQfrX8mEYHIzocOemtuQrERzjFgXsvLyiQpy7zQWV1lC9TpQpnHPZ9Z456+R8qRvSZBvwVajy3fsuKpCsxRD03m7QwQiAqLVh9FhCb45taTmH3hD2b+GJvIfDi27q0vI+ZDTgF1ZvsrqeWdhkS5RtVRjcCUuGEwMK0PJTxKcG3jXr4uKmx7V3ZUy/nZRrNd2iuhjEdWiGrhwESrNgo3jQ3Fkwr6weiewIKFzMtTRW6yMzLt1ebtjcnzJYAfC65Mfx3vdH3mNKWHeQN8kEQlaeS+0cujjUOiMkRjZbocG5KdqPGJ3xU5OkZn/TOE1VNT9Mg9me8CTE3PBx0H+65BMKmI00aIePXERzA19/WXxqsfYSOJ1FtpxO9z0tNVOuO8rKfBaH7B+9kQ6uSd8NkY9L/dEAVTh2QVxe3V9fBzDQRpReYbUFtHydipVLkYzRCoTL0xFNP2P0gAneZmeB9vKiJUBB42VAJiSUFqqf+FMQAD9XCHCKMAlqMzCYxVSKxG2rWgS49ofSXiHAwWJfciA4RV47+fsdf3wHqXfm+INnunG+psFNt7Nean68bxrdlHxKHPUxRJm21V9lcjd3YNG7dg9bo4JKllB2bzVsQGql82GtfeAUC9gZ8Jb7BcxqACexPjBUaWSnNaXFFOO/CdvkfTqFx/9Ch3Vc47R1R0dd4aJXlpPe3pz4z2NWLo8io8YF/BGTXMtkA6xr27DYfVG6n8WEPU6325yjUwWP0OqbIDduFP3QfhhYgcgkc+I6XjfACGn7j5dua7tRwEQwWn5PiT5VE7dClp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(966005)(316002)(52116002)(6512007)(6506007)(5660300002)(6486002)(83380400001)(66946007)(8676002)(186003)(26005)(478600001)(36756003)(66556008)(86362001)(8936002)(2906002)(6916009)(6666004)(2616005)(15650500001)(44832011)(41300700001)(1076003)(38100700002)(38350700002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HWhC+kkymRQvrbu3l0u/R174L0LsjBuRcRy4UftQ0ElOmKU7Cwz35Pts7Ozi?=
 =?us-ascii?Q?PIoFaxMD6PfLCZAEOvN22aYuifdBN3bPnBj6g93U/q/BoxMNPUg66XF3SlnT?=
 =?us-ascii?Q?wHIP9CY4l6n6LsgggszMKyDlCFTgPAXrfmYe8dnDEaM9NGBMQ4BaGplk3PoR?=
 =?us-ascii?Q?pI9uPzjJb7QsgwVD+s0SFwa9PfTrFZsZWRqXAhx4vFHyXPvl9124IAV5AGaM?=
 =?us-ascii?Q?WUUz5jLBZj65TK6Dxmio9YKW/lB+El6sPBFQFUIwkQu2wLtuSyBCV8C3MWaH?=
 =?us-ascii?Q?2M4vjg6LbppHT6p87T2aWsI5gV7mP+DVcXXoZ4+rWOOUjdHljW7/E01dB6Bn?=
 =?us-ascii?Q?z6i6Rm0jcBHlx2cAsHbz6nBVu8m12Vm3zasau/tEWkG6L+nSRUsAOJtVeNIm?=
 =?us-ascii?Q?aFm0czYfPVNcyQ3+JSqBQJVE1hLba++K1liY9jAHjm9TDVpHlGHhZTlWFTNL?=
 =?us-ascii?Q?wA6vpuGGXjhAZQJAzpsGAxRZCEF333mxM34NeVSQHqFFaNJ0OxzgcGvBwj4w?=
 =?us-ascii?Q?8A2JllC1ASYGcctYIjILTSTKLcAm9V787FFgouMWlCW3cjUxVTvh0BRQbVPF?=
 =?us-ascii?Q?LccifbnSNJlo8AZLyWt/TJH38JHjLTxb6Scfp/OP1NlbjmrE4uFOo7ltumhv?=
 =?us-ascii?Q?UMUAVDEgbvzC9L2YIWXsnQMZIC084P72zNVrCQFC34jYdcJEwDrNbxtdBWgI?=
 =?us-ascii?Q?xVCXWF9F6v4M2zeDaXi6taYCSfsSV5CKAHmR0gwE0lFGgRb2/sNORr6cEOYI?=
 =?us-ascii?Q?yr+j9yoTdxuzttCSxF5v9F6FVp9cNp/UKRANutfelD6S3iBHbDMebfqRWEZx?=
 =?us-ascii?Q?DympFlJ+PJspQ5PycvJ9ZzdfHpLk3ydIG0THmKFX3sqJ/5e2rddAZlnfc7mT?=
 =?us-ascii?Q?6wVBvIvlyXLIeKtKXPHzynIKYy/6dfLFEZdiG8/Gvx9CevCAHKxlAxFBk6wd?=
 =?us-ascii?Q?imXRDMeDyAKVW9TID4SH/0y3Z7C2qBaRWrUHq0LmGjoE/zP/4bRhqjARbcS+?=
 =?us-ascii?Q?zsDIsw1aVcExFmk7Tq2Ot4Iq63fXUMIxnxkfcA+C63TE8g/nFdvnSVfFSvJJ?=
 =?us-ascii?Q?ne/MmJCi3s0YNc5WBP4U+3CjboCax0c2VCBcUA3WbnufGajCZDuHreAk860e?=
 =?us-ascii?Q?ZlOY+cz+UfribR4z4ZzAfeWCrNPlWWVLpT2GRLoWnrexX58rWXRhRjsuF0T/?=
 =?us-ascii?Q?SGUez+PNAi89dlXbocLK1ycSwpvP4aZDmoAZqzXXei3WNpZqXvOemsS0apXB?=
 =?us-ascii?Q?n90OtxrNvUvH24tEd2mYQMGxadexVgQh+TRv68zhPexBdM0nd/4ZYgUjV/i0?=
 =?us-ascii?Q?efzyw2qSVhpUKno4VbL+Z/0fKIKGm9Gdx0AmwroZPQfZqFIKQDNVIULkx2sJ?=
 =?us-ascii?Q?rsfgRqaLG+8QrO/bilIygi9WQPBg7XyPIQujJCQkzgJkPlS/M+BN0ZdSa4Mv?=
 =?us-ascii?Q?eBRyGPtobbGTl9Mf9OqonXILv45ZW7ztpAtTA/zJjL10CO0u4gLslT17LA+5?=
 =?us-ascii?Q?sBcASAhTLyuVAz+hhavqyN8IHwgQtYo6Nepby40J9jeqWMnpR0O9sBS3t1l0?=
 =?us-ascii?Q?hvUY9ZZruVPDVpDTkzgBiUEUf0wA+EHHCkjwYEIyGiwi/J2CveHeJDj3Hcaw?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc6c1415-34ac-457e-eb62-08da667adc4b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:58:29.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aP5czj+6hwpW3YuElPWuUCH2nwQWIY6u9ngIK4BAOyNSjViZCZCzJ2Iaq3wD/2D94w0H7CT+erLKrSUDdHCdawZ2lUkcmwbihmwwD6xO+YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
X-Proofpoint-GUID: 1QgyA5LNJhU-3ouwC49IMxQ-mSn8Qpj5
X-Proofpoint-ORIG-GUID: 1QgyA5LNJhU-3ouwC49IMxQ-mSn8Qpj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_08,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 impostorscore=0 mlxlogscore=879 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 15:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97846

Package changes mainly include performance improvements to
tcpsrv/imtcp, bug fixes and additional/updated tests:
	https://github.com/rsyslog/rsyslog/blob/master/ChangeLog

ptest results for qemux86-64 with kvm and increasing filesystem space to
4GB using IMAGE_ROOTFS_EXTRA_SPACE :

Version | Passed | Failed | Skipped
8.2202 | 456 | 0 | 5
8.2206 | 465 | 0 | 5

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
---
 .../rsyslog/{rsyslog_8.2202.0.bb => rsyslog_8.2206.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2202.0.bb => rsyslog_8.2206.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
index ebb8ecf9b..a39de3acb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2202.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[sha256sum] = "e41308a5a171939b3cbc246e9d4bd30be44e801521e04cd95d051fa3867d6738"
+SRC_URI[sha256sum] = "a1377218b26c0767a7a3f67d166d5338af7c24b455d35ec99974e18e6845ba27"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.33.0


