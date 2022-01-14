Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F94C43217
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:40:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1722.1642124399632159579
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jF1l68zz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80133a60ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E1YZdC007942
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=qUdcHoEarE4mGTrAu5evQglPay0apmfkAcjjuVUsnX4=;
 b=jF1l68zzHyiDLlyLfxQtbtcgPRe6cBJBtOVYre4QMglpJ0VpU0THZwUyPscxJim0bejA
 oWyzN3Kud2PCmfTT7+KKB2QJMdCmGavfXaooPvZhD2CkJG7+Rz9yUQDDXQMGis/68yoR
 RSSWawCIOJgDxzP5M0cLdiQgevjyzyFqb4QBLw8uzR6X9OwIgXi6yUaEveGGwAMK6WMB
 pML9O8GLFKJuLTHE8cdYCwqgf9h7xxQQ9na7cJ7nifkrOXN4FXifGc/1IL2/S/2a50GJ
 4oVUuO+a0kZXo1XpZqVelRX4UWBmm6oXyh17cfcaF17WWOLxfF5O9a+fINLeJgGIOgwv lA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhyvth919-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us5BGKejZzCZMd3HAk8lRgbjktM+xyuf9NK5JagbJOvoM6PQTMj5xr2+/YVOycicUHghGPWjgxeisv15sAdbE1l7DjPoGxVq6CUQnJWm95ruafg8ILZjGorBDkLLBCXSUSuiVLtW5XLl8oYFpmS/eHfZ46U9iSpcvgqKjk2kqRKH/nHdBd/9rrmX/YbvRhLmpddUoRX1oCfFY5qdsi4rzIpipwbKRgGjib4vNMaImSP1pGgCi4HwJ3xFfuFsx1IBBcpOri/nQCslCLs1mSmYlUqDYQVoXOBJFlCOkijRXe1twGykkO5lUdsgE0J/UdJQJF+M0o4gtmb1m+gM8k80Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUdcHoEarE4mGTrAu5evQglPay0apmfkAcjjuVUsnX4=;
 b=VJzxAY0eNNMXN9303w92om8LVZ1MLQHMV3B6hkGtKKlN6i/dddA1/a+iOCH8hLseifHAqmhRL37yXabMeDpxK3UztmeH9+3pRkmlW+rgq5WnZ0TpMeHUnb8UAVEGancZLoBubbQzxPBsRoZEZHHYnQTpTnxBHMgo6BlTq0m2d8mGvfuS8fZhCVT0quysu0hgNjIrSx36g2ANyMHUHgzs0SdVu+sKpfNlc7ib2ffCgXUwNq4yRvvC2l6AHk/6zQD4s5qVGjq5re8eOe7ouHTe7S7H5gRj5uQUoFFDqxxmPU8bLUAt5dDGSP94bGyzbbokBBzrkZylqyGU20zHFLtmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 01:39:55 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459%5]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 01:39:55 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/6] bridge-utils: upgrade 1.7 -> 1.7.1
Date: Fri, 14 Jan 2022 09:39:39 +0800
Message-Id: <20220114013941.229837-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114013941.229837-1-yi.zhao@windriver.com>
References: <20220114013941.229837-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a445f68-bdd6-4fc4-0716-08d9d6fec480
X-MS-TrafficTypeDiagnostic: MW3PR11MB4746:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB47467B1AB328287430B56180F9549@MW3PR11MB4746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wnpPGnELTP7x6rlGqGZOpm08ngBYWSSSB8PM/4P94mpt/cgheAo8I1OJ3N+YBby1xgJxlDt/fVcFKB51yAdiigm/ZMPVdh5Qlzvt6niLaevYbO76SRiiV6beTf4yUfi/g7ugV3r5ZTQ6LLjLMKKRNxT+QHFvkNEfx5SJHLrNLEDSVvkpJkRSR+oLz03X57uh4RGEI5P7rLZdAGgNGAjzpV1HS5/D73QNMZuAbdnXRWgcYswtPYsXqyROvGo3fYJW0tyjwcSersW7HXwjlsTw9ywN1PfmkzGN3rfHKKp7mKnKCVfsleq7Ewyx8RyyzmjAaoMUm6TeW86ICORYFESDWRph2S1viESmxAjtzdhQNCZNev7PES2OYDn7pF7RTHiR8r+vTPVqS9I1b+ztqXtA9br670xJgnWXtvAgi2MB/OctwgqO1F+TZk9JBfXiizD/iXjPSuT3/wxyq5Ykhd4+F0c2W+PyTp0X2riDXVcRC8Lq2avCUZpOgETktPgbaTjqFxvw0qdPNcodWBqmyr1wIBpM25g9ky3cn8q+Ih6ryCXlSnCmja7R93fRkw2anBnb3bRXbBwhbaJWmnzYY/hKvStDYiNXXfdhgFat8UT54Qu746eiGR/RmuY5FqcHIH4fK2x0i43gHeQaNceicvUPD8C6DB/uTE9AJm3ZqSadnwR/s7o35QaS9SA7VrRYjRAxuroGWtqNw9jdg9gW5LaYAiaHiN5CLJJ0BWYyxhZdbp75gMuEXp85Hk5gcutcq562iFTT9OvtX8gfwZsaLIpQR0cwdDVXgCXGl9K5+VoMFP0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6916009)(53546011)(6506007)(186003)(5660300002)(26005)(86362001)(316002)(8676002)(52116002)(1076003)(36756003)(45080400002)(6512007)(38350700002)(6666004)(966005)(44832011)(2616005)(66556008)(30864003)(2906002)(508600001)(8936002)(6486002)(66476007)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XIy3FkJghaNDCr8rzZTZlM5kuHycx9cgZC7iahqsgcDdZ+eEmbGn2gVScQ5S?=
 =?us-ascii?Q?lVrAnQ8xYU0DvPqueUzmA2pF1hBlJrJhdM9L/S4LkCQBI5kWTzTM/0o3nImr?=
 =?us-ascii?Q?x/wFAyMVpv9WfB5FFDldKGwJLzZPeco6je1SgXK3ZUfGwBULrVfBRMt6y96l?=
 =?us-ascii?Q?u3vHZlTMqIBoNH/hzffTwHUyZ9woD78TmzN5GQ+UVeAYsJ5ieSTAD13+Z6SM?=
 =?us-ascii?Q?vKy8a9QFZmsWkxm6706SQMa/8zes8T5bxgwMnDB7SJPbeg5qIIiawmGYCB5G?=
 =?us-ascii?Q?rv4ypqbvxS2wxqvwLRyNgW/L4iuVDB8ymOycqNCOCANsP39vW8us49uxtRb6?=
 =?us-ascii?Q?hdhIxUWimd7zjMGqMTuK11/pCwjQabrLX+cn+HTgrKMBWUwNnQgTJZzcWEvQ?=
 =?us-ascii?Q?BrxAoKjp1XGKmRokNCAAY2IWFYtjUR+EBqfIyfikeweByJJgGiz8xh8y5lOT?=
 =?us-ascii?Q?iVwsOVh/4lsutENq2wU3cHfXvrLmWDRwDuQvksI5DywFFYS5EAPWi+5/jcdD?=
 =?us-ascii?Q?rWVvM97SA8QrkOjeIcMdIBoH/SFcmanvZ9JPVYKUekpFeJHgonFSX63AC5oF?=
 =?us-ascii?Q?+wCJyD65XKeVFhg2FaP4X1p/9rCNEgYy8l7FSVamAh8crx/gaYJbzq9OGL/L?=
 =?us-ascii?Q?16T7Y9ASG/Gu5h51akaf7qBBJqJPv4C39q06g/BJHuCq3a78blyNY71ZTha/?=
 =?us-ascii?Q?LidRbweIIcYaUcsaR3Gk8QMyOmcYI+D5T0PkqwwTcuFKLpZM4eaQo/Wwpz5w?=
 =?us-ascii?Q?xxFBvj9x44RFhbK9Fenqn2z5KWr1gGR1b9+tY3ucHtJlOE4JhlwoB7/ispJb?=
 =?us-ascii?Q?2tJC8pGWM06rQcaCoGIS7iGmh/UUm2mKCyO8kE2YB/JEz6PHQhfzCZ+/Dn/8?=
 =?us-ascii?Q?tLeMsdcwx5Lbvr87ST/Jtd9bPyesn+FcOeIoy00X5vuTAPUXVqKVoyTJAX2Q?=
 =?us-ascii?Q?EBv2zzsz6UOD/aiAJkt9MoAsYpJ8JMY4rhB/EUOhp97OH80CcZ3r4bm0lLdm?=
 =?us-ascii?Q?Tnmy0qizgZtC0H0nlkjbu1f+B86/KqzjTkfhHHMpCaqY3UDFvbS4omVHoUc0?=
 =?us-ascii?Q?FAlc9IUqp0zlihzLyJ1oqp5vftZwQ8k1Dr4AIztiLCfi1i+Mo41FqmI+Z36r?=
 =?us-ascii?Q?OfdghwfMx5U3bK4UoSeeSSjQyJNloc6MIxFcd/CbJ0zvWpmGXhS87quegbsX?=
 =?us-ascii?Q?0ob6/+5PqbXpy+iChDlx878itldXvNYmDPOtXLFDlTVXtCBNrmhTJIZxGKBN?=
 =?us-ascii?Q?0PRJiLYX5qo0uUlRil5y+NaeRPTS5tBqtcE1Ee5tDEdAPYEa+EYiBXys5nDA?=
 =?us-ascii?Q?9zyQaiCPLG4DA5dQZ6eIUDoSwQFuac1neMTc2RIR2NZ3RHFjbcChw9JuKyzH?=
 =?us-ascii?Q?YJGw4sFF/xLFXChaYc9QrOymLNNEqJbG3TVE2tXUoN+SqJmxUjGO+C8gl3Hu?=
 =?us-ascii?Q?jlBTf0jQ9IbEplt66k+yLFwf/PyXO1/j9d+9QsLhCYDKflf2Ve05RNu0pFcs?=
 =?us-ascii?Q?gN2x8PJb6d2nSryWjXfkfyznqCV47N7V9QQ34+niLagjdLZS/v/bITbttaWl?=
 =?us-ascii?Q?2OkcvfrAdS3gIfTpznqukQdur55/ZCfGCMIQVtdDoJiVGrzisSb+NwFCUIAt?=
 =?us-ascii?Q?QbApRUBIHlp0nafNjf20p9g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a445f68-bdd6-4fc4-0716-08d9d6fec480
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 01:39:55.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jX8bCfjcD3bCK+4iY0ZVGWalHkFUImpawZN3bP3A96LBffFs8XPA9R93a/jR553Xk28eDqoY2+urincUMfZpdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
X-Proofpoint-ORIG-GUID: MUddn84Y6pSV9dlsn9d1S0tlBv9eeUZD
X-Proofpoint-GUID: MUddn84Y6pSV9dlsn9d1S0tlBv9eeUZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201140007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 01:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94819

* Update SRC_URI to official git repo per [1]
* Refresh patches
* Backport a patch to fix build error with musl

[1] https://wiki.linuxfoundation.org/networking/bridge

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ... 0001-include-missing-kernel-header.patch} |   6 +-
 ...on-t-ignore-CFLAGS-from-environment.patch} |   4 +-
 ...Modifying-the-AR-to-cross-toolchain.patch} |  10 +-
 .../bridge-utils/0004-cleanup-includes.patch  | 149 ++++++++++++++++++
 ...dge-utils_1.7.bb => bridge-utils_1.7.1.bb} |  11 +-
 5 files changed, 165 insertions(+), 15 deletions(-)
 rename meta-networking/recipes-support/bridge-utils/bridge-utils/{kernel-headers.patch => 0001-include-missing-kernel-header.patch} (88%)
 rename meta-networking/recipes-support/bridge-utils/bridge-utils/{0005-build-don-t-ignore-CFLAGS-from-environment.patch => 0002-build-don-t-ignore-CFLAGS-from-environment.patch} (94%)
 rename meta-networking/recipes-support/bridge-utils/bridge-utils/{0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch => 0003-libbridge-Modifying-the-AR-to-cross-toolchain.patch} (85%)
 create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch
 rename meta-networking/recipes-support/bridge-utils/{bridge-utils_1.7.bb => bridge-utils_1.7.1.bb} (67%)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-include-missing-kernel-header.patch
similarity index 88%
rename from meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch
rename to meta-networking/recipes-support/bridge-utils/bridge-utils/0001-include-missing-kernel-header.patch
index 8a23a3070..dbd6b18c4 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-include-missing-kernel-header.patch
@@ -1,4 +1,4 @@
-From 824f838cc9c7b8a44174358446993d61be7bbb3f Mon Sep 17 00:00:00 2001
+From 203801ae47399569868aa468988e711ba3ddfa92 Mon Sep 17 00:00:00 2001
 From: Joe MacDonald <joe_macdonald@mentor.com>
 Date: Mon, 30 Oct 2017 13:18:20 -0400
 Subject: [PATCH] include missing kernel header
@@ -17,7 +17,7 @@ Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/libbridge/libbridge.h b/libbridge/libbridge.h
-index c038b92..fd09306 100644
+index 962f316..422ec33 100644
 --- a/libbridge/libbridge.h
 +++ b/libbridge/libbridge.h
 @@ -24,6 +24,7 @@
@@ -29,5 +29,5 @@ index c038b92..fd09306 100644
  #include <linux/if_bridge.h>
  
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-build-don-t-ignore-CFLAGS-from-environment.patch
similarity index 94%
rename from meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch
rename to meta-networking/recipes-support/bridge-utils/bridge-utils/0002-build-don-t-ignore-CFLAGS-from-environment.patch
index 0a72c6b2c..5ec563b6b 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0005-build-don-t-ignore-CFLAGS-from-environment.patch
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0002-build-don-t-ignore-CFLAGS-from-environment.patch
@@ -1,4 +1,4 @@
-From 9d63838d12c772dfe33371e2bb8b8191625539f2 Mon Sep 17 00:00:00 2001
+From 0c1a66fc62cc321d307c94f962031283142eea69 Mon Sep 17 00:00:00 2001
 From: Joe MacDonald <joe_macdonald@mentor.com>
 Date: Mon, 30 Oct 2017 13:37:48 -0400
 Subject: [PATCH] build: don't ignore CFLAGS from environment
@@ -36,5 +36,5 @@ index e1956d6..eff260c 100644
  %.o: %.c brctl.h
  	$(CC) $(CFLAGS) $(INCLUDE) -c $< 
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-libbridge-Modifying-the-AR-to-cross-toolchain.patch
similarity index 85%
rename from meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch
rename to meta-networking/recipes-support/bridge-utils/bridge-utils/0003-libbridge-Modifying-the-AR-to-cross-toolchain.patch
index 3f65761f5..586ebfec6 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils/0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0003-libbridge-Modifying-the-AR-to-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From c924f66743c054d7ebafef90ca1bbebc96732357 Mon Sep 17 00:00:00 2001
+From 99264c688ff98d8f0f237cba6c7098eb4d5a12a7 Mon Sep 17 00:00:00 2001
 From: Joe MacDonald <joe_macdonald@mentor.com>
 Date: Mon, 30 Oct 2017 13:48:33 -0400
 Subject: [PATCH] libbridge: Modifying the AR to cross toolchain
@@ -14,12 +14,12 @@ Upstream-Status: Pending
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
 ---
- configure.ac          | 1 +
+ configure.ac          | 4 ++++
  libbridge/Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ 2 files changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8b2e2ea..8426b7c 100644
+index 66817bb..bcc6946 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -12,6 +12,10 @@ dnl Checks for programs.
@@ -47,5 +47,5 @@ index 7932bfe..bd55e9b 100644
  
  CC=@CC@
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch
new file mode 100644
index 000000000..eb5c53d9e
--- /dev/null
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0004-cleanup-includes.patch
@@ -0,0 +1,149 @@
+From 1763c5b7f8f72d651d62337029c3bdfb269491e4 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <sthemmin@microsoft.com>
+Date: Fri, 7 Jan 2022 08:44:19 -0800
+Subject: [PATCH] cleanup includes
+
+Use IWYU to only include necessary headers.
+Should resolve build issues for distros that need limits.h
+to find PATH_MAX.
+
+Upstream-Status: Backport
+[https://git.kernel.org/pub/scm/network/bridge/bridge-utils.git/commit/?h=main&id=1763c5b7f8f72d651d62337029c3bdfb269491e4]
+
+Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ brctl/brctl.c               | 1 -
+ brctl/brctl_cmd.c           | 3 ++-
+ brctl/brctl_disp.c          | 1 -
+ libbridge/libbridge_devif.c | 5 ++++-
+ libbridge/libbridge_if.c    | 5 +----
+ libbridge/libbridge_init.c  | 4 +++-
+ libbridge/libbridge_misc.c  | 5 +----
+ 7 files changed, 11 insertions(+), 13 deletions(-)
+
+diff --git a/brctl/brctl.c b/brctl/brctl.c
+index 8855234..d2fa005 100644
+--- a/brctl/brctl.c
++++ b/brctl/brctl.c
+@@ -17,7 +17,6 @@
+  */
+ 
+ #include <stdio.h>
+-#include <stdlib.h>
+ #include <string.h>
+ #include <errno.h>
+ #include <getopt.h>
+diff --git a/brctl/brctl_cmd.c b/brctl/brctl_cmd.c
+index 81f7dfa..4167503 100644
+--- a/brctl/brctl_cmd.c
++++ b/brctl/brctl_cmd.c
+@@ -18,10 +18,11 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <string.h>
+ #include <sys/time.h>
+ #include <errno.h>
+-#include <asm/param.h>
++
+ #include "libbridge.h"
+ #include "brctl.h"
+ 
+diff --git a/brctl/brctl_disp.c b/brctl/brctl_disp.c
+index 3e81241..f6bf2af 100644
+--- a/brctl/brctl_disp.c
++++ b/brctl/brctl_disp.c
+@@ -17,7 +17,6 @@
+  */
+ 
+ #include <stdio.h>
+-#include <stdlib.h>
+ #include <string.h>
+ #include <sys/time.h>
+ 
+diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
+index 8b7d954..3aac0f9 100644
+--- a/libbridge/libbridge_devif.c
++++ b/libbridge/libbridge_devif.c
+@@ -18,12 +18,15 @@
+ 
+ 
+ #include <stdio.h>
+-#include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
+ #include <string.h>
+ #include <dirent.h>
+ #include <fcntl.h>
++#include <limits.h>
++
++#include <sys/ioctl.h>
++#include <linux/sockios.h>
+ 
+ #include "libbridge.h"
+ #include "libbridge_private.h"
+diff --git a/libbridge/libbridge_if.c b/libbridge/libbridge_if.c
+index 5f3aed1..96dda30 100644
+--- a/libbridge/libbridge_if.c
++++ b/libbridge/libbridge_if.c
+@@ -16,12 +16,9 @@
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ 
+-#include <stdio.h>
+-#include <stdlib.h>
+ #include <errno.h>
+-#include <string.h>
+-#include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <linux/sockios.h>
+ 
+ #include "libbridge.h"
+ #include "libbridge_private.h"
+diff --git a/libbridge/libbridge_init.c b/libbridge/libbridge_init.c
+index c914971..d572895 100644
+--- a/libbridge/libbridge_init.c
++++ b/libbridge/libbridge_init.c
+@@ -16,14 +16,16 @@
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ 
++#include <limits.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
+ #include <string.h>
+ #include <dirent.h>
+-#include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/ioctl.h>
++#include <linux/sockios.h>
+ 
+ #include "libbridge.h"
+ #include "libbridge_private.h"
+diff --git a/libbridge/libbridge_misc.c b/libbridge/libbridge_misc.c
+index 9379e93..5b146fd 100644
+--- a/libbridge/libbridge_misc.c
++++ b/libbridge/libbridge_misc.c
+@@ -16,14 +16,11 @@
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ 
+-#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/time.h>
+ #include <asm/param.h>
+-#include "libbridge.h"
+-#include "libbridge_private.h"
+ 
++#include "libbridge.h"
+ 
+ static const char *state_names[5] = {
+ 	[BR_STATE_DISABLED] = "disabled", 
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
similarity index 67%
rename from meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
rename to meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
index b8975dec0..85a7e59d5 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -5,13 +5,14 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
 
-SRCREV = "ab8a2cc330253321be7bc69dea88bfaa3d48415e"
+SRCREV = "75d949b9fae9718201422f0bd3d1103e67dd597c"
 
 SRC_URI = "\
-    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git;branch=main \
-    file://kernel-headers.patch \
-    file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
-    file://0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
+    git://git.kernel.org/pub/scm/network/bridge/bridge-utils.git;branch=main \
+    file://0001-include-missing-kernel-header.patch \
+    file://0002-build-don-t-ignore-CFLAGS-from-environment.patch \
+    file://0003-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
+    file://0004-cleanup-includes.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


