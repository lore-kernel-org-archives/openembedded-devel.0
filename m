Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3335.1627335634790890916
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jul 2021 14:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LUPws9xm;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=284163c761=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16QLXxtl025476
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 21:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=M73UkZn1Tzu7vc1s2g0Y6fmOVHg8rIs6S1G/uXYHPR0=;
 b=LUPws9xmZ0KzcTLPHX7oW4YqyY1yn8rzas0iNLLCxO7afD77mbcqtE1jtgJ1+Q0or4Az
 PNC7XaTirAVCFc8NSftbV4Ax/3kvMFKABe+5yFySwPabXXpSvlPrZK+4G0tVEFyUtzMO
 d5iEy9tj+WIxlB4K+eZiRGCn7GZvMxOoONAMJJ8uH0CmZd34XcrtftRJ0xeEgEA1oqIO
 /bWAqImR4DW3SzXMoWbYGbDNxZcm5uK9rOjbpp/Db/kUB8t+VtFpxaa8hhhZzv237XnR
 EYl6pWN0FptkCN26UAK8r0YBeJKUtKZNe2LKDxWYN+Gh5VXNv0Y+F/sNaTCcCDJSmFcS 3Q== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a234x02dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 21:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzdkRV+cHbm6Bm68vwU2znBO9UUkEn/ZIVNeGxGejd+ZhUk3azxdIf2X6BVPdMXQxCpHCGFOmWjVrcKtFhEwfLIK9RI9HNxiDSXMsXMEwbzdDBnLObc4TsK7JZFaszAAmGeRSOb6KOdVU+YmIxSz+asypjHJIWmMXud5Id9PH2l4yOtAqm3H0i25d0kVWCaDNw6xIoCstwEkZ4M/LDWI3/RL/zYyJe74olBcWMEqejMSrvBEZ6Smsu8LgXE4t2aqmEBRN+NJbCDfs1u/mf5Fq073VdTx0BoRqYHEY8QYVq1KWLGMOM60W+VYGAc4mRiaXDAFIJnx5lI5h2FSjJQOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M73UkZn1Tzu7vc1s2g0Y6fmOVHg8rIs6S1G/uXYHPR0=;
 b=I399UqpiW+9gVe5ftPKHHvQpTugD3nwLrvJRt2eGPDF+brF0/kK4NXiY8MjjcIH1n0wcfJedFVU/cDaMRT3klyeh+35XXbjy0PErVag0et/aktWUGZBqQzOs2zBRpk7Ar6E5BUhpSdIq8/Pvy6v/LQRXyL3bflbYelYxj4eHVjgnvrqxjUVlaRhraH4IAOsKc7XtOwAy0FRaO1dJf6x0hfhZT6PgmvDKrDq2iPH4si3BOZyWVpng4Tjg6C6/H7JxWkyLR9hGPxjz/rQEPt5/cMA3tf4XqJrOLyeaMQU32dZUUfhWXPLfgO++0LcUCTjcrQZscqM3zIbSyGhkxJcCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4040.namprd11.prod.outlook.com (2603:10b6:a03:186::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 21:40:31 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 21:40:30 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-oe][PATCH 1/1] php: move to version 7.4.21
Date: Mon, 26 Jul 2021 14:40:16 -0700
Message-Id: <20210726214016.14446-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 21:40:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7af7d40-4499-4e9f-e600-08d9507dfd90
X-MS-TrafficTypeDiagnostic: BY5PR11MB4040:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4040A1CC066051128A2C6E1688E89@BY5PR11MB4040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+BF8kegwDbiG+/ax4vCeVXfrctviJqLGW/QOd27ArT2qMHD8/dPI+fQmHyd8iYM0b51nxQss3I4aGOFjnh0ddNgVHjFIzpulKjeYh00rUB/n1D4qqGbA4vbeKsGuCtov2tMb1qljGKpAJgDSgzqwtRjaZNrgnEn9nFBO8RgYXCIip1siuBKxEmMZOas9aBcnyJJ1qQQjQbra0sGsKemunWMrDcadaoy8eZA04SoW3Rb2LVH1Whj4w+rg4uVlSl0PcBOa0l38F9YrJerTFy2YBfSf7iroUhkBPb+0K12lGMXV0bFfNovjRa0BkUARiwp6tqFkEL5rWBT7Vz1/Y3zhadgrxgZ4Z+g7a1Lb0njXBbs1kMTp38siwrhVdDzWnLHSNN1mUbanqEE0bvQiTlHU7W9Rh8b2vcMRgGHAnLLCKue5RIGNyrukBvAhab4BP4Jvc05Pm0IIV2olCl5W4cki22VwhiLr8uUTp4xB/ieSW98DsSxL/Pwp9ajA/sH+irkOSIZtaNsj7l3R6RFEG90JLTfUN9NxVCOGSrPZdxJ3lkg5P+wMcrV/ZzP8emDMvI3lSeCx+7WvYVi4rnTJeZ2d8R3GkMJ9YumPsBNJuZ7pG0qqYMPeRApYh1aYAkUXF1Q1Q/1cq1K7bDBJ0I2lBVP+z5uOqTUAN5c9bXo8cB5KI/15DBCrnOBVxHd7yV5f4CkuINbNMZ/XkoP0mrSL0Llrkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(4744005)(6916009)(6512007)(4326008)(38100700002)(36756003)(1076003)(6506007)(66556008)(66476007)(38350700002)(2616005)(8676002)(8936002)(26005)(66946007)(107886003)(478600001)(6666004)(6486002)(5660300002)(52116002)(956004)(316002)(186003)(86362001)(2906002)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b0blZMaoChZqOqBPHXq0k22pYvrsthpwUBMoWmNRzE+0rIHxDZ//pb9WPZG8?=
 =?us-ascii?Q?tfggQb3gTzLqksLgK6MI+agbH0ZFzxjULqOdbGvsdPPf7wUenH34nQxUUvIn?=
 =?us-ascii?Q?D75w+qVyzjCXBiFP+1ZEz4i9hLIimXGr7814KTgHsa31sCUc9YE+WKGXE157?=
 =?us-ascii?Q?2I45XhQZ7Plwlr9Mx+U+3T9q6fMP8zmtIiVMy4LfCceOMx4sUZzfMhtd0g2q?=
 =?us-ascii?Q?/t9TobfqJOt//YlsDWcQExwNln62Ctomm4u0GSP5WTGWljTTBb+g4+BUS4km?=
 =?us-ascii?Q?cm9lbE97WoQQmnhE1LKXCQ+G3edfjGtr0H19vwZqhN9ZpVk1zo8IG4PV4IDy?=
 =?us-ascii?Q?OXxdgxgsIU6y8pPAJirdhWa5JT+0hFPJvAodkjk+oWnHuP4aeCHIms9NU5Bh?=
 =?us-ascii?Q?foRgBakl0/92SwUE86/aTAEqzq4+ZfghfNDEDYWgERWQ/DbNj95j5dyJuDvX?=
 =?us-ascii?Q?EBmgE5DA5Gl59Wf3BvQY755AHDqjgbQ2eTkwFUGVY+wpls8nOUxCmMqLzgEQ?=
 =?us-ascii?Q?jJ3XyE873v9cVowG+dLP489CueTyPAa6S8GDc1qo9VNYSvA/H2v1Os+thfKD?=
 =?us-ascii?Q?8pETG0IcsLwc1N1/PLTUc+nyUxZ3S9s3CRFUR5JLDhDMnDpUXVWV42beLcno?=
 =?us-ascii?Q?+qXzoAcjjN6eUQb2Ky6J/JXGKdGZ71P6aTFnS142Hicg6Ie/3WzU8zQOTX05?=
 =?us-ascii?Q?HdIAUjcwMx2ASJvrR/jtbBDTb3ge+EX3ck0WODrB1lMjTxuRfq23kX+bS4UK?=
 =?us-ascii?Q?OfBU/48uRB2mXjTcEHd6hgWjc6xgZKZwotpzDAdBVrSkvvH2OUVK3UGoiQVm?=
 =?us-ascii?Q?37LsBAlGq+0MSagT/ueSBhD+1SyM8gLl+rZvu7TVaxnAkZtukcP/eqdMZdMO?=
 =?us-ascii?Q?B/B6fv8DptNoos0ent5tU9Xs2n2PVSg6SxS8uoZdduFnJrb2ovLEyLDNNUsY?=
 =?us-ascii?Q?UTEo+04aceG2Xo8aXZG4FosueiPvGJrLUw0i6EIUfZycPyscW/Gj9W6laNjq?=
 =?us-ascii?Q?XSH9rdb49ExNfZJhbnqvnzRHVJxWokV6AWmYqI/ER8/DxXjx7RjLyCNzbKyu?=
 =?us-ascii?Q?dax7MEH9tRAtoLaU7zRQlVqo6ALMv5fUgXSJyU0R4Jh9vIrtH/2B3TyCLtPR?=
 =?us-ascii?Q?NwBU7V4Pw29ijlsr34C+zQ7mzc2pXeOjV+cUxnqDi/nH/gKvBKRQ+jMvP5sz?=
 =?us-ascii?Q?l+L7u082KscEcStJjs+0QD+n3Wq73314D60+OYFuydVtIJ+LUtBSIc5aQbbT?=
 =?us-ascii?Q?X/EVJBRh4HfmdBW2yzvyKVHcuX0VKRyvw3Ym3VLyAjHgLQ01+8em/rIafLIG?=
 =?us-ascii?Q?LqoQ+Y7ves+6FUVFQW/9mGCm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7af7d40-4499-4e9f-e600-08d9507dfd90
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 21:40:30.7220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkI6A/Drh2OZQTI64HS20yovnNaPDm4X38KZHfkiljCNVx8j58qLK0RAhYCI88FUAFVfXWvGR/4QZl++hC/L83ThgWoUgpm7SHmL2bpKHzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4040
X-Proofpoint-ORIG-GUID: 5Zw9N4sheOdJV7meuyRVY06wQK-4bc5I
X-Proofpoint-GUID: 5Zw9N4sheOdJV7meuyRVY06wQK-4bc5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-26_14,2021-07-26_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=690 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107260127
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lots of bug fixes.

CVE: CVE-2021-21704 CVE-2021-21705

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.16.bb b/meta-oe/recipes-devtools/php/php_7.4.21.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_7.4.16.bb
rename to meta-oe/recipes-devtools/php/php_7.4.21.bb
index 821d9cd04..4d427252f 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.16.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.21.bb
@@ -33,7 +33,8 @@ SRC_URI_append_class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
+SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
+
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1

