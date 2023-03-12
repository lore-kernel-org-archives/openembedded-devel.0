Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72858C6FD19
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 06:57:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.62206.1678604228695845098
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Mar 2023 22:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kbeHf9OH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24351d2345=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32C6lorF007001
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 22:57:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=mFX9y3z0kcN2kTcTs1Xyo0yPQeIuB6jgiltj/e4VOO0=;
 b=kbeHf9OHjWzecEu9qFOV0pauZQl9YJ93X5ZyLANn1cA0+JBLLpNT1fkQNJHNmWaOscPk
 YHcH3MdSnvZ1oLolboZw0E2WiPieVYZDkqMahENTioJI9EFf1jYfsVE2yFHZgEWe0cSN
 E0hlAutSf6TsHEYOmggShRlF1GgAFxF1M71jOKFOZPPxiK5Xa7ID5kDftLbpLPFKrtQC
 4bY7+dvZeABmmvoiE5rG1JnBjLu8qBt8ZqQK6J7DOcW3B1rahgL1yeke1J3b5eVnWWBF
 qWm+WnZABcy1vHN97mLvR4m/2gQreioeca7Xk9iTWxU+EoBOjXVJiKrogROcmoUT3VS2 nQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8t1r0h2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 22:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqVzvayYWbCDC42P3Pzz7Mzo8FqfqAqGj2q6OtytvyUTWg33wbvA54yTUp1s2kXC+stMMOsGYenQ4cY4m4vFFyHB0QIgmqSmT0GtJbwArRzsdogZzEDlVDCDENIg9iXywXh3QerwxnyH0jxUpAc1x6FXSz2MJg1wphH3W4uSZyUun3pty+mg252Hb6DnelLrikJle4WjEPYRwaF8seysofiqPEHleY049jn/tK/YWfwxdLT4oMHLZbszEpsc3RV7UhDMBxgJMnvtWOpH1w6WQwCHQ69iSLnCTn7fhh4m25Smn4Qx7OrEVTcovQvAhpCfreLH3K2NWPOxylhRoyeMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFX9y3z0kcN2kTcTs1Xyo0yPQeIuB6jgiltj/e4VOO0=;
 b=XwcGS7k67aUmvv74GzFMkcBfmi2C+ulNeB+jqeJrgDIQ+JmzxHHSIMmreGdx/4riZS0tSmIP2MbwbLeo4oBZtnntrOhCw/xAhshL0LJ8IpFknPcdo6npTrPyBOK2n8YJqeBaVTLdQ8c30ifYpdAYVCLXiN+Pto0mwuPzdf2Y2CuCQlW+AIua18R+V8zVM/xbKbnRRhc4M9pDut52pCrJ5sKXC75VBt40zIOFqW6+90pJF1COOOo60U/DQAipgCLuMYTlq1uo55Pikngrd34jYSEKkZ33vd/wR/aiT3tZaukgvA5dOb5MpSPYMCWzbMq2C3OWzG9elMA+5a5+0tBcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 06:57:06 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.023; Sun, 12 Mar 2023
 06:57:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libnftnl: upgrade 1.2.4 -> 1.2.5
Date: Sun, 12 Mar 2023 14:56:55 +0800
Message-Id: <20230312065655.2519607-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS7PR11MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: e633b324-afe9-4bd4-cba1-08db22c6fdda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DFCIhq/GG309yD1jl1bp2pzZr+EN1tqqv7ErJxmGyiBAvrYSfa7cypQ3W+L1mQmnK6DYLUKWHpvReBI7pem4vtrbBOSOD83xhki03eJlTyOn7gYUSXRKY6gLQzfQu3Ffq6GN2vaDxC+foq7KGMi3yIPeaFu8uLy06P7G7PcQsk0Lmyxm3bW7ivPsfTrwV2rN64kIt/r3USL+p+uzg6Vk32ZOl44siLS+rHIqt+IuKegoF5k7/lqSx9zHzxyfiUzjlXINM1p/PElQuPPnt02ewKpPQxM75ON+mQeKRssJ5zSFz28WD21SlPHdOgq6HtKcS1AQ/24fmsHmt5JJ5OdvpBLshcJL5XTNc8k8UxapZBw9+poeMcZ/M5rfILSGHMvSLxba8Bm+zc9CvAs/sjgGEPXA8sFBst9DJzNsYuy1OFYKIMms1w+N6ZYBb+HZpZfojoO0/S0KgzmkVT2LmKyua25c/HlGTBKRwnPHdWqoOIwpO5GgcgU4hbW+zmtUCkdux/qlHcvYqysAcPN6uoay7I/RoKi8Nk1Pu0PRhHqVMormyAFLxcC4fMaT8zrO45SAezVvaBrzDAxUydZ8gZ2WA8Mh3AfOlMoYJWl3mzwtIS/ItkpAbbDII0z6t4oLwDToqCX33Y7aMBHlt7qS8z4lAvIpxst6JZXRC8S7YxJlF6awT0GDLFO/5414523KauVdcJT5NQI1iStZdtj8OH9dRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39840400004)(136003)(366004)(396003)(376002)(346002)(451199018)(36756003)(86362001)(38350700002)(38100700002)(6916009)(66946007)(66556008)(66476007)(8676002)(8936002)(41300700001)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6486002)(52116002)(186003)(26005)(53546011)(6666004)(6512007)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tGDzFHFt7d/jGlNI+JpFhTxW5qSjUal0kj2v8YeKFQPVlTqXa6Hp0r83ErG+?=
 =?us-ascii?Q?4Tfka27a4g65xzvOiIGY3x4v0vW0tWw/xhhGw3NXgMMIC3TDJ24Nw6iWrsO6?=
 =?us-ascii?Q?Rz4cHl0L6bJZChBusL62ipvZ/NiSK14+zl1QWVgSNRgic/qoUf6sA+6n9oTb?=
 =?us-ascii?Q?jSC2qnGcLV2jMS46Otv3bQMF4o9v/pC58+Wp7foY8aUutLHvzECmPxUYFo2o?=
 =?us-ascii?Q?sHl4S2HKr2bRhhSkQ8ZW5183/STER7Pl2zvHUq45IBk6cj8Gc/Bb9neQjD5k?=
 =?us-ascii?Q?icsbraMB+yoVOqdTrALbomNVXYDdXrSii9/PcAUxQ9v1d2ajrFBNvUC9gJA3?=
 =?us-ascii?Q?KDGnV9RNOPOjGNs5CzBDx+GmQLqMiX36wO/Ujj6MhxaoT76sKRKi6IVr1brn?=
 =?us-ascii?Q?6CgzEyPIJfPttMBCEmkWLOEeyeJRZl/iaTksmSHVHBN7q8m7P5V/BK6qo5nK?=
 =?us-ascii?Q?YO2F068vbwTkYk7uxuhH8o+YOLG+cfpcQui3bja0hYzGTnF00EiqgDce6Pf5?=
 =?us-ascii?Q?ECPxFO1zpR11MgAa8esTGCUzkgZjYw5Iuoek1o1Jg+PX371MiqLAFR9sB2Os?=
 =?us-ascii?Q?mHDfg0Zs6NuCNTRADD0LNyj/Aikb1z8i6n1wxGO67xp77Kbmu9FYIFMGqso7?=
 =?us-ascii?Q?jYd4c586hBuRNnKckl5Z9dACozJUJ1tARR741SptpJTl4gJWM8T79cT9S1WE?=
 =?us-ascii?Q?ZtJSCYCeFjQgBwkor/LoTe8WLnpO4FD7eMt+IRkHOJfEWNBnF6GjrEq5Rrln?=
 =?us-ascii?Q?0EYAa0yJXWnVyOh26c5cgBRuir8JHb2UdHiVzhG0vInU23qKJN5UNggFGQoY?=
 =?us-ascii?Q?wM1RLyWk9v1N+4Xrl8ZhQ0VQ1XRx7+u9R+GCY+p8aWQ448UAgzk9oWD2AzdE?=
 =?us-ascii?Q?OfmQ2DZce71lzeAevI7HvUg7DAJmjF3QMb6QjuAuW/qmd3xhmBtyRxjgIpNE?=
 =?us-ascii?Q?s5FZfw5gNp1BiZIVgJCcCHE2ivjG0Bd8nVVf5fVDSAbzZTX/JDO73LY7rcBx?=
 =?us-ascii?Q?9NMxiIFAjid8Igel9xt35VbkFoficLD4gvDnWWj3PjTDMTn8OJgj1AudhxDk?=
 =?us-ascii?Q?s+e0iUCbaGij7v1Ye9Fic9dw7dP5u9eVYG5WhyyPJP06fIfheQkF3g3hv8oT?=
 =?us-ascii?Q?AohDTmtMaiisRp6AZ7r0OEB+Fiu//QVh4qioTmchQpwmTw0oI3rkOX5RMALm?=
 =?us-ascii?Q?ycloaOr2NuLBSzApKJGtyzJyrtZW7vIZPJz/MAmbfnNuT6XicMaSNfRevdnB?=
 =?us-ascii?Q?DZ+zAIxnd8HmWrtCRs7YRE3O78Oa1j2iooJQ6OZNKvHNSgOAk1iGTmtcx5JE?=
 =?us-ascii?Q?i53FmF9f+x1TBeyfUiNqJifAJ7FhACOV2JrVAS7IbhIDf/xIvcyt1355W6zs?=
 =?us-ascii?Q?Ol9eHGJkvstucCluH7P8KD9vXlLjzA3aQwhOGXoEjYkVTqOUBUsYPe6GZByh?=
 =?us-ascii?Q?70AKoDu0xoHpdYVTuHNSegjZc3qXpW518iB5FtHPKNN6mFh6AZ5B3RqwlMqm?=
 =?us-ascii?Q?mF/trxZ8A7euabi4m6BRlVA08yy939cJkk9uodpRAhAcDSWqxdxdi8rnu56/?=
 =?us-ascii?Q?rcaenBYG866MtZDlISIU5G93WIns4ExYEYzBCgyyTxwOPu6UrdsmOQQ/QJjX?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e633b324-afe9-4bd4-cba1-08db22c6fdda
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 06:57:06.3087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDUSqVKBKrAaS1JviPZoF1zsvT4WbjB8onripNvMjzPoNrb9P6JKorVbwsRidhhlfm8wK14LGpjawuOhybDV5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
X-Proofpoint-ORIG-GUID: YeMQYcmkvwu7__A0KW2-G8mM4azp08yi
X-Proofpoint-GUID: YeMQYcmkvwu7__A0KW2-G8mM4azp08yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-11_04,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303120055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Mar 2023 06:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101505

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libnftnl/0001-configure.ac-Add-serial-tests.patch     | 8 ++++----
 .../libnftnl/{libnftnl_1.2.4.bb => libnftnl_1.2.5.bb}     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.4.bb => libnftnl_1.2.5.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
index 049ad2d39..abeca6579 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
@@ -1,4 +1,4 @@
-From 1cb59c1fed33607e4fb2bee9144ce45276e9cc96 Mon Sep 17 00:00:00 2001
+From 801a4dd42449fb5f09fb9cb99714ed137278ca24 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 14 Dec 2021 12:31:12 -0500
 Subject: [PATCH] configure.ac: Add serial-tests
@@ -14,13 +14,13 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8e68035..2704214 100644
+index d5c6bd0..d90048e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -8,7 +8,9 @@ AC_CONFIG_HEADERS([config.h])
  m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
  
- AM_INIT_AUTOMAKE([-Wall foreign tar-pax no-dist-gzip dist-bzip2
+ AM_INIT_AUTOMAKE([-Wall foreign tar-pax no-dist-gzip dist-xz
 -	1.6 subdir-objects])
 +	1.6 subdir-objects serial-tests])
 +
@@ -29,5 +29,5 @@ index 8e68035..2704214 100644
  dnl kernel style compile messages
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
 -- 
-2.33.1
+2.25.1
 
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
index ede35e762..380a33064 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "141cc997755dd91e94dd64c5497f2a23bd9a894c"
+SRCREV = "c62bef65fef638452b4ed1893c2451fc253ca7ca"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


