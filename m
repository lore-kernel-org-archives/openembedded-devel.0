Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BE1C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 13:14:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.64024.1640870050154791226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 05:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n/8PWrfs;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8998eaba3b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BUDE93m004674
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Bh3N3LpPeWxR3tHFJzpchmn14FI7woRGOFhkLV/OlaM=;
 b=n/8PWrfsSKsj7jLdSRJTzS/6WbMawTg4VlgtHf4XRoYbtX3nGNHSR08xaq05rOGPZD50
 aaJadgIuUesxn5Rs0715W6VVQnL4nMebatyOOtRQS+rUveScElbAIgKf0PgW6/U2er3m
 2f3Innl7dQK7cZ5QqjSZlaOHUZeUH0DzYQDgcgJpFQLFc2HEVUxfYmL7f2k5U8plirds
 K2KLB9475/O4+gajVbPm2PMKFEAC3a6Il6BKCebuj/vow29onwyhijjcoxdNh1tjljEE
 Acy9oo9S32XiT0tFQj6mcgcnyjsvoE78ZXLYi4sMMmll20enTVbJ83kSJJzZSva/7k0z cw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8yayraw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:14:09 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BUDE8bS004620
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:14:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8yayraw1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Dec 2021 13:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvmqqFSBtFiyeOK66F9hmFGQqxxozribuEe8AyKZjo5JNhxhjfeGcZZsmk0aE15I1IhvTiYBDJqBE878bMG7C99o06054VAhYdm5qzaDWwTD6CXB0AAAcbw7rDJVLO4KztlD7eoLwLr1YvNPjmLWze3SgzfvJQXZOGw1yyV2WhbHT7Kb0h2Ns4tyEBVCCffz5WG/IMTAP52t95sdOvBWbGpuAR31qRWjMwDmrYxGer6eBAmTiG5H9ulJ4yPyrt9wG3dHYJzL0Tb/wrFBUwxKf+4jMW/flOtSNYaZzfYwG7R4cEqBR2GMABnGvGUEZMG3sdzg44m5BH9PLDuqvqgn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh3N3LpPeWxR3tHFJzpchmn14FI7woRGOFhkLV/OlaM=;
 b=OLcsElzUU7NfI5saBLI2/Vfd1rZSmNCOh8vsHnK9plzjtotBYEqW++diPkqLh+/5owpuQ3ZT8qwZaydb164zg5qVjh+mHS5Qp3eERaejh6vGHInbTF4hCsgaj9FYBq2mAm+9/RJgqxpaFSHfCjcHQvqdSiewwnJdkOq9t6IzSErRmwsAwoTMS6oAZLk51bszIDEP6m/yO96r2TIFKLd2CrBQTA0jQoekZHjJAwMrWctvEplL21Aoc69FwWnSYi1n4a6k6t9gQWfgaSCqsdq9wG0D9G57RyfsyG5yYhOTcLJZjWllSVJatUpQMWiIDJf4/gf2+1ZUcWtm1yL8h0nBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 30 Dec
 2021 13:14:05 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 13:14:05 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][dunfell][hardknott][PATCH 2/2] postfix: upgrade
 3.4.12 -> 3.4.23
Date: Thu, 30 Dec 2021 21:13:51 +0800
Message-Id: <20211230131351.1097560-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230131351.1097560-1-yi.zhao@windriver.com>
References: <20211230131351.1097560-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f8e43f-c97e-44e2-c1f4-08d9cb9641a0
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50090887EDA8126C9BCD598DF9459@CO1PR11MB5009.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G18MDomWiaAaL6NUH34IbyUGmsP9B50tUmuAIBF2nsxu1FqrDwU9OGcJAwMRN9qbjSNVz7OJNr8Z4j2jJlKmUAUtxnGZfMImkngMTES4RCqXdkrH109z1fweFow2i+IZKm/zXlRmnvZ3OiFMiu53vnoJYWfMy7WXtNPcR31MKkRZA3ovhcJhlH9oqfnSbjzWHGwwGvMY1/gG9O68s3cCNQTcJOTdmrWnbk/FmOo+hRW96TV5PEVtwFHz+sKzLAw3RYyEksDhKWHXNN5iqGWhXWfp1CPkCsWtrSyy/8572bMz0EjTb6SpwnMnSFV+yG8sOvPNmh/fGrU9OaBXLf0nS9YFrKS0oNcHy7B1Dm+L9nI9W7cvSaX0UtTMjRGcoZzx7SElg1BkTWXN/BVyBHmMQiakcEUZQZiWNtFsAIDe1Tm3Lap9GRCry39XyY/Mou/cd03KOx/kF0W7zFA7l38XeEfUhcVtpvXzkoBEQKQUc7irQJusGDc6SqiCeq5Bt5LlK1Pk/GeuUC37Cg4amNJPgKNj5mJ35iYNCShUu0POcBeb8Le8oufhYs5slVPJHa1VffEpXq41gg0G0Hq4O1z6x5cH+MX95BK+2T5ab5aHmyMpEf9TDDtl8ta/2dXO8OipMh48NlpaO77F54ZUvciva9aMabU1HmoI7XnIv/T/UqE6OT1H2TG+1CaSkrI1WiXzK7/gxOzMlc9g07zxK+mFCuXhvSdvV4fhJA7tQTqGUkIi2YVnsShDSgC5nongxBqRDLa/RYtVZt9gOfg1wMqpuCTiuMFbvPS0vyf95DyDmJQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(1076003)(8676002)(38350700002)(966005)(6486002)(6512007)(36756003)(44832011)(186003)(8936002)(52116002)(6506007)(6666004)(2906002)(66556008)(83380400001)(66476007)(508600001)(2616005)(5660300002)(26005)(316002)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J88Szc1YAWHc9sbWutTzGgjcJYIYEaECglHVOkZQfSFIV6s8WO80Ef+qhg44?=
 =?us-ascii?Q?HkLsWp6nmrOcJUFit1tsihRIG500qAA8SqcDj1Z1adIH0vqAXqRVoV/QTk/k?=
 =?us-ascii?Q?cmY3Z6yqvHsVyX4qySCNqMxwPHyHQJvMGPHF5ybSs1plTHrSxntOJiMQAW/T?=
 =?us-ascii?Q?ZCGQMPQcuQkiuMa1hv5flmhH4g8ezKmMc+9WCCrydQEPi6RSEXQ1e/Vsm/pM?=
 =?us-ascii?Q?Q8TxmanLSw55I8spMYexXDa5T1CsmhOezerlsNN9INTfvmtLnxwpQV/PCh55?=
 =?us-ascii?Q?uORFjYVAG9Evpu1x6uWKnT3sowPI+x7Vshuf7oq7hVa0W09DGe0/rOxqTpRO?=
 =?us-ascii?Q?iFbeJVnGitfqeTSdYj1EW3aF3INKeC3c3aA6WzbU02WDceyfKjRy+yo2Ve63?=
 =?us-ascii?Q?cHjjv6AM+iKLIFXwDmzW+HpcigKsLl+ChDHmM0xLUYkTd2H/Z15tRtIZi4eU?=
 =?us-ascii?Q?OSGOUqSWqd2fGu6koTP+SVARIiJY4aXPfvGZlYgVftFv+tQU6dWMVpYSIPHb?=
 =?us-ascii?Q?QFFVksGmduT5CU4gbB7xOl4+a8SfSoPK1b633wnFDf9YATkdYCdjsWIwoFb/?=
 =?us-ascii?Q?0pDhaZlaH3fzxB+pD4RPVSxDNUy6+z4uKHzwTBRcNzM+4skN4KEH5TEotZd+?=
 =?us-ascii?Q?vg2w6bmKbq5/xWWm7bamEcKnUPIA8h4kFpdKbNOWzg5MohrhSVl8tDQrfdI/?=
 =?us-ascii?Q?p5l9G4O6kHYsDQxTc8WTI7odH5QhT4/BfBcYCQ4nC6rsUZ9raT+uPPx414nl?=
 =?us-ascii?Q?7N+8ZopkCxkZUVQENEV/AOYSBrTeHtR4LkHBpWnDhKy6XUDUPOzq/1jkJezS?=
 =?us-ascii?Q?ekqgrzOaGlj1Om4a4h58DziwnEE/mYtbGqyonH98TfEunx3b6r5SgPklmO+O?=
 =?us-ascii?Q?qjGVMtKb53zu892kj3UT9m/R7LWlXniYoy9xGAoXMEQclv0zRgX6SKnpANlA?=
 =?us-ascii?Q?QuipzHO37TPLWx/RJ0ZrXkJtM3ug2RHL8XCssMC58Xh8jZHiSrZuU7DsjYzo?=
 =?us-ascii?Q?SXEqaUA/nGhzQGGHvzysLgwQ5oum+WlgLo/xjcsCwWarmIRkAYWdIiagDi/v?=
 =?us-ascii?Q?Spzu378kvxY+YP4kkRmNYITx6T6hlO7cwpKOGZl1FleyH36uxE22keXa05kQ?=
 =?us-ascii?Q?132ZGwFwitu+HLh9HsWKwIUQ9S+s+a4PgzGDuSv9v3RUvD+Bz3mx76MbyC7m?=
 =?us-ascii?Q?KBj6BSIPOqoHznV7LIwa9dxVqsvNWZWAXDgCU/5IjakSZyVGT0IjhHDiQzTd?=
 =?us-ascii?Q?lMHq0/bx56uewckCmC1oI/mFtaTuJqlVXiICC21ydkBDzOJw1zOC5Fm13a4V?=
 =?us-ascii?Q?ubOXgg6LJQRSSKqG1svQaiu1NqKl037i7juAFPe0cVURLMoPIEAk+QLEIFlp?=
 =?us-ascii?Q?43sjRf0EYXClchT4Ux/w44OmcLStEAU3NVt9P2L9L8dvKvX0EeazALE+KvSf?=
 =?us-ascii?Q?Ej9eARAhrLhBAopFgnKuL87Q3G3Qpq/LuUbg10XULp2MOCVY1F4dtSD03Vkl?=
 =?us-ascii?Q?2t90kHQAQt1FCEFaGW4hIqkiJjX3Qwokv9WsSXUquWM96cIkuKu1klME5LtP?=
 =?us-ascii?Q?88thVe47OQjdkMoooAGVlK/Au8gcwGCyPUddAffahoiXBiC/qlOnWYcO5wLK?=
 =?us-ascii?Q?2rNRNzgXZpTKehqCQX1hbUo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9f8e43f-c97e-44e2-c1f4-08d9cb9641a0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 13:14:05.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fKG0yjSaHTP3UFx23YZC9ABKX29q8BguWNuWqmjhQkEzqeONHoUGoj6WU6E+oj6G9zudjg0UasKlt9JZ/qfTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
X-Proofpoint-ORIG-GUID: ozKHqFRQOeCdb3QMK0RACIWXbCJrRG7Q
X-Proofpoint-GUID: V0tIfp0HOs9XfwPxRpBgo9IAMBcVbcnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-30_03,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=917
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112300076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 13:14:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94567

Changelog:
http://cdn.postfix.johnriley.me/mirrors/postfix-release/official/postfix-3.3.20.HISTORY

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/{postfix_3.4.12.bb => postfix_3.4.23.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.12.bb => postfix_3.4.23.bb} (82%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
similarity index 82%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
index e7bb3e9d3..bb6634580 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
@@ -15,5 +15,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-fix-build-with-glibc-2.34.patch \
            "
-SRC_URI[sha256sum] = "18555183ae8b52a9e76067799279c86f9f2770cdef3836deb8462ee0a0855dec"
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
+SRC_URI[sha256sum] = "1759e953bf7baccb533899845c17753bf57a99ebac9c21717626262966a122f9"
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.4(\.\d+)+).tar.gz"
-- 
2.25.1


