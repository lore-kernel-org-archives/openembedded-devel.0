Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA9CC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 03:31:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1902.1664508715409380524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QuZzygVm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=727255fef3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28U3Gf08024685
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:31:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+USzqjNsfF3NsFjTR4jboJQ3eZcyOex2NUDVVW8pADg=;
 b=QuZzygVmA5iKxQoGGRtAthOSLVg57uZ8o/Ffr0MTO0E306oINHKDLp0NTjY8qrpudALT
 27+cKLJHe/Eh+glCwIWl0OzEv7z5mwNq9luytyfGCIXMuBzTL39NpN1O9hxOQyYc+Oaf
 518QVLkR2dVYfHHx5VqtR8KnRKEBGTHM8H4VURVd88UejMhT8Wdw3KCPcvMiFfFml5eS
 cqx6iMmSzmVUJcJ1IRunSK6OX+gqpSVcBN5qRK6jyfER/0uRywNcJWCGR4UvJBhvdP8j
 y7uFHkv3YyX/8BVFyf7q3oEn2ZSDTuqE0FdO+D+w1VgMbWvBOh+Zvu41+PUIewvGwTXr NA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65n2ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjO/WAcDhZlP45gJac69Jl+GQb6icRs5rc+n6gCU05IC6NZxHKjPzx4reTgJPn5WD/mPLlQ5gPL+X5wLKcTB4e0qv0GigSWSsFSQwcOheQDFvl0zd4Y5wn/EXsK/u9atBCLq5GYaS/2gUg7LTG3vrdllefcxL87xPXE4UdHxUJctSZ4A7jKnP4dNX1u8AVcMzWSAsBHS2vEqqH2LgBynCIm269+IOasxg2qqDkt6BzmO05781EMyVaZ+DubfQfUuMBbBZH1/amXMaQg1zZ+g4I9kCbtV64wjKjvykAhlzV/PiTC+GUpxNMB/GZTSWW6sJTC6l80i4hLpMoLaU4QsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+USzqjNsfF3NsFjTR4jboJQ3eZcyOex2NUDVVW8pADg=;
 b=kMvuhTVtESp3w7+Zczt0PyIvUc64u1Xoc9U8LAP4BgkDq9PHpfZUAm8VlFs9cixq7atfNd713RdbawgeACd7RG0HPrm/fA4JIgCj04zVIp/DKTSW5VvcuR7LFT2IGxf0kmscb7W1+3PCsR6n5i8Fr1Gce+lKJwhS8bmOi1vh+/kYel9yAFX1cN3U5n71Z6XCQGppmHL76AJkBFuBRXsfh3YlsXtKGB10W2Y5IUgDelCgv//cDe7P5nQd4qC7BSgSPGx156UBU7a7V9xd4i1hKllmior7FGZSmGetJYVBxhOnXQfqxAmgs9hL8rBO32GPvcQdpHE1C++XKu8LSWWo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 03:31:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366%3]) with mapi id 15.20.5676.019; Fri, 30 Sep 2022
 03:31:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] nftables: upgrade 1.0.4 -> 1.0.5
Date: Fri, 30 Sep 2022 11:31:38 +0800
Message-Id: <20220930033138.1421606-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930033138.1421606-1-yi.zhao@windriver.com>
References: <20220930033138.1421606-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a712243-1347-47d1-bbf6-08daa2945173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9DssK8PJblsCDUhsWGpTgxYn9m+9j4EgIrqNaGnWiDMtQR2cEVluX2oCGpeKman0w9Zj6Ofwp4VuiTXzFStntQPbRHRLfhdo8TUmDSo9kV7z2CM1MpkYKsU5OeRNHYUmsVK5Lb8TXjM/FHpkum0Q8PZ2AGJwymqurwEIfN4nEgzB8WuK1NJbE7b5QaGwnz5esLH0aeY3VubQ84UVl3aXvHR9M1Rc97csaB3XoqRAE3dcSeEHnLEjnCcpy63XqcJYfDiIi5m9Buyj4bfCOWe/dnq/JdX1+6jZjkvvpvsC8CF+6Q2YFB4VSQcg+oZQeXlAiIdHbri3Hm0SeGMo2swLg8XvpLtO/nCopGIwRaW3ATb8GUeait/4QVed2fSO9F3X/CbZ1Q9el1Zl6eVGzzOTO/B8aUGBeEFIOxjlxHmKgzzKd7G6x7okDnKWKFNbd9JUPN/fw4FMqLCnlBaiOvn38zsQ1Rnz1Nkz8MXBpf4D2qm6aINDtnfsKUwIwRbfjaDCB+EOh9FojlLesn5I9EN1QGlqLSCN6VL8HIOmxAoFARKnpVC86/hxAYUt/1nmIcJNFG6HHYlIaXlP5Re7NU7ILHu6Wgbky4ooJW5n9Hg0oXuQfU1ZuVOcs9IbFn3dCokf25LVl50j8bfr6Tx/zRjW3RWMj+PC4/cDaggreV5pTdlMggOWvalbqGwD+/PD4jPy49T4F7JqJ51tXL1lp0LPgHwu9KqxCrtPeD+ydEMuLKHQOGKSArXg3qBKv3cFMvaHe2bbALxfx0y8CDLrSWAv8OhpwWzz5bde/V2MgndRotU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(366004)(346002)(376002)(451199015)(66476007)(86362001)(6916009)(66946007)(66556008)(38350700002)(83380400001)(38100700002)(186003)(2906002)(2616005)(1076003)(26005)(52116002)(6666004)(6512007)(6506007)(6486002)(478600001)(41300700001)(316002)(36756003)(44832011)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4y0KzncTxiqrMKqAyxCP0waQIks6a7hUZdRPLG+BRSwWSAu3Lf4dZ+A71PtP?=
 =?us-ascii?Q?n57Ft8TnCeJifP/JLWbwzLuvqOmY4B3pJWL8AlrasXHGFsXo7dsxPRWnVOt1?=
 =?us-ascii?Q?V1cuxyiThzvG4ZxsQ/otrDtDQb/aCDNj1Ri3j3kU2irPdBI2bMLyYo3Eqz5M?=
 =?us-ascii?Q?PBz5+bRy5fkmYZX4HQc8TO23AVPkZbx1A7sIIa13WOtNWeK2YpEvUq9Y6fD7?=
 =?us-ascii?Q?+VVgW+9A7nRN3vHdFHhLxgwkAOqceljuWONrZ2b41BYnH8phDvq4FLxykppH?=
 =?us-ascii?Q?qmlfQB0MPnnn6D+WAozPYScD6375iqN6EKgMUKtfbbEsUzU0o1Y/DcDFRSK/?=
 =?us-ascii?Q?mLpLlXHTwdDuZuSPkl2S+5gDugBfnYGrXf9ou//w9s5A5s3dD0xbshYswkGY?=
 =?us-ascii?Q?8iGyzfjyRdYe+YA/0btM2EvDE5yxN08xDoqJl5HOcvPAMoOtkCjfwwa5vMb/?=
 =?us-ascii?Q?qPmPeih9x9HIV3CsowhgeVVFE724WULlht+oSnTGaqA44ZQfQL24r7A5+Do+?=
 =?us-ascii?Q?C/b2X7OHJoZq/jYYBHKe6nJqwfQicpG3WtClMbk1FbFuIslxxDeUSXr25gVn?=
 =?us-ascii?Q?QDMOykrTEls8dZqbqKqYpqHypDqAWKzbuc5/EJaeLck+Ph950a4NGSSlNJGm?=
 =?us-ascii?Q?MyZjOBYxRj+RmRwB5xUwwLysnAoPzCBJzIIo79yAhK7n4R7HTEKrcGLnfETw?=
 =?us-ascii?Q?lJYfAnCZ4wSiIGYJmTtv5No93x21TSvscHZ7b+SF7E+Xh4MKNMEkSFl3m8bl?=
 =?us-ascii?Q?pgTimdtSzpFox//u2Ti7dS8FlcmbGXDpvlMyQ2Y5CD5q0+z9Ro3UnphXszNh?=
 =?us-ascii?Q?2xV+MY9Y7WTtNhfSEAHxBjopvpTXszbyLETWgCeyFjSRy/HlP/N5cV9++d5i?=
 =?us-ascii?Q?wgFAkxBY6rUSSQ3h5SK+d+ebmZgUXx2Vk3XecS2gC6HNpKJzHImgISs+TKjh?=
 =?us-ascii?Q?SFhQLSBXJRbiHDNY28l+t7vXX0c4MJB7FrQnxeKqPr3WRZZKHsfUNq7RFNUf?=
 =?us-ascii?Q?BkNxmEm3j4rvlOQ/Vrt5cZaeAi4JRPcC2U+sCoqAeSnmEohPhZM8/od4n3fw?=
 =?us-ascii?Q?ZBHtkYDHck5JhpQyB1DCV4j9d8aeidwclOcHRvgF5B6najb5LXh0wnyN8CDB?=
 =?us-ascii?Q?zTqQzwbiUXCS19BZXLg3fICPfQEwd/GBrvT3lXLYQNZaZHDurIJnReAhQQJf?=
 =?us-ascii?Q?JmSj5OgD5NhW8HAG3tC1Oynw8EGlMfIL28IqG5eaNfsuvmtJJ2hnK/3H/EFa?=
 =?us-ascii?Q?PI8GnCYsdjZhc0akwCrXItIf0xYqc1bteUAob5nyOHykJ0YLSIQvT5dArXm+?=
 =?us-ascii?Q?BRKECs3eGGsvs8qycUtdo0x+rQZ2Djm4c8glkSdA31hwVh3EqvKoofSKgx2d?=
 =?us-ascii?Q?nGky7brJ4t5QPWtvekIOykecCQ08Ld1X7sx9awIA7n68uGU971XpeIUTPWkI?=
 =?us-ascii?Q?p+Ao7pA3oqxPLRN3qDXB7nGqhLyZaYprt7JkiTMikSwIeTYBDSsYPwBTqfxs?=
 =?us-ascii?Q?rnkaQDVI/PQ6QHI1f1XrJpSnoFnw+Ju1bTuJNCvQgyMGZxzra8ultMn63Cp2?=
 =?us-ascii?Q?SSowY6FDg2LaNjXTXNCJY52X0W9AjY22WQcM0KPI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a712243-1347-47d1-bbf6-08daa2945173
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 03:31:53.4869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t0n/bem/sqrjngkahXhudqtY1/I52c2BKqX8xQ60/Jw5i3oxLQQwOUKjd61vMUSW2PJldrr0vqbcASSQdwT3mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-Proofpoint-GUID: RxUkbdTYqVHvb02E_m4wKql_NmFrTU2q
X-Proofpoint-ORIG-GUID: RxUkbdTYqVHvb02E_m4wKql_NmFrTU2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_01,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=794
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209300021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 03:31:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99017

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../nftables/{nftables_1.0.4.bb => nftables_1.0.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.4.bb => nftables_1.0.5.bb} (96%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
similarity index 96%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
index 3466e16a6..1708786f4 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
            file://run-ptest \
           "
 
-SRC_URI[sha256sum] = "927fb1fea1f685a328c10cf791eb655d7e1ed49d310eea5cb3101dfd8d6cba35"
+SRC_URI[sha256sum] = "8d1b4b18393af43698d10baa25d2b9b6397969beecac7816c35dd0714e4de50a"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.25.1


