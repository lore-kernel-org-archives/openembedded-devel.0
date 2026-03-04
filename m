Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C378FEDEBFE
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 01:09:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8540.1772586581977883935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 17:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rmft24V7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752309427a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623NoEwa1612062
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Mar 2026 17:09:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gdEchGyH0LnD4pZpuSzY
	DT/DLTb/26ZZ+Dz8mfwGSdI=; b=Rmft24V729P6O44iYY+guivlqJzY8HTmrQIH
	pijoRDOnzEx19p4IPzZ6WyHyt5pmQQyyATKr/URwWa9UOk1A4alDTamDppFbCfvB
	pzGkwqb8+kjVcMzEK+cxHAf6+4wV5GZ4M0/l68gEnP4j6KtxNCLA9sMnFY79rBs/
	4dqPOmdW42AQtrlg+v8lpdH5tqRchHr6FW/8kAber5K/aJJQvg2Ra0GPzmMnFSqD
	7dpfQSRQYXuwHuMRdjJUo5u6/uMKmV7/DAc742BRZKzLsCRtXCZwlFb+9aNcA9cF
	BmJ59jv3ol1APLRS5kNNZBTIjZNPWmZZD1xTnf1hfpKCygEz/A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh444j9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 17:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6/NytTnVIgfhKD66DplH2YxR/4UUc6we5efL7F91OZzaJHw+ufkOOvKeG+Tj19phZG4io+iAslHFSiqFK5sQWVaVZ7J+wCTZRzK5fyrPwFEZ82HiphSJIm6/rXztSVm32z9a9HhXTmP524o4Y3Ig6QfxIaZciZavFsL1Wb5OTgNnVLtArAoYE3FC4zOJj3foEwhnIOpF4arj6xrxGdlJyfN6ivlKiAzUyXrVljcX5edUfU16vNsy3r+U7RVAjkRAg2AZJVqShY1o41oQXsM7JiBqSkcpk0zGj6Lc3zwI2qPlMPcqx8ZGg8GUg8NF4u1tC/GBt4HcsuKsIylHXA8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdEchGyH0LnD4pZpuSzYDT/DLTb/26ZZ+Dz8mfwGSdI=;
 b=Y8zpgqN6p0eu4NDzZjshKKVeHagugI8cZHq67LDjyPIr6c1k5rX67P6wanFftawOu+yJ4jr03LjSpq+ggT4kZAHBYMDF7191LDBrnYWeM1DDzqUW/tOBrUVRKxN8Koqe2h6BWNDSKBU6KOpl+q+RQcOgUr1YjlwLpqimA0Uv/6axiHF2iZZeCLL9k4JmoirQyptZdjWTwYJqzZxqkoZ2ELMd55gWjuqHsSbVNVCXG4gc7qQyfT9EdA+IhlBQHtjAe70Ee5rydc53ATj1V8DNjAyIFE8BFSO5f2ADo0G+Mo0yQaEi4cy9nb2u0JzUcsdlESjnpEChAbOTdBG0oN7TcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6500.namprd11.prod.outlook.com (2603:10b6:510:213::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Wed, 4 Mar 2026 01:09:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:09:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 4.1.2 -> 4.1.3
Date: Wed,  4 Mar 2026 09:09:22 +0800
Message-Id: <20260304010922.881900-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bb2e27-67ab-4d82-d7c2-08de798ab44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	wFkIpKCTPWasWlHHjkTTUZ57NF9vnyegxp/iZttSBA7LyBSJ6EZcW4MFRsNzdvCePLY3EnJDqAmryITc2gvLj2j4WjpcQLL4ZopFIxaoU2lyLgBlryJ0nYQEtgD8UhH7qq84o/aJsAv2pfqZjwzsnelKRfer35zx49xF0cn8eHBFTYF2YcpJ8V63LabtnCi2iPEkRUJAHlLbnGUSrr+DiWjljzxjudxkB+iUoF2sJMJjY84YYNMilfDDoHpeK3UqnbEhsNsu78WWIX7ZoaLiPSWRokXXTOLWG+rwk7dnWPASKa5f466OvN6ipA0FLmu2jFr08j69EZQsxj55L48RZ3saC81V5H0LH/GXwZLTpBF38H4rpNHzUVg0VAFiWolkU4DG6MXv5UqKH+2eRS89+thR4OhYfceY8nxH1Vt+kVutC/615vaDIAAjCO32Aj35VjBVj7yLAFYALhJ7DqQwbYSe43/oY0voKQh0pmAd9e0oTSBUE+yM3ml/FjgaEIKVfxLrRGrse0sn6FlVWlxrb3X6fLQIM3/RWVnDg1ufBO7ugaDeyBfeGLDSe1DnDP1lWe1XOr06ghJKQEOxJ1pe8SRIwH+ma5FPE0YkmnaY2PGhYC+SOhb7c+ptodWwFnt29773/hcUjlIwvfNUCSuqavpXgUj6dQNB6vQiqOGSdNfDnk9c2d80VFNSIwWP5kLzsmhpxohGaFl7FTPEayWW6Ts15GkBi8ZZ5Uf3oyc70DJEI/C1+OcYglquPPZSjFC5OfXuuUVGdJD0yh0kQHrAvIdzDUQRQMMDHk9VTWdxvYFul+RlCCoT44/4QJfvL2WX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G9riCMeNnoY4zP+71eOfkwDa6ttwBIeNUgtMZ5BixIrmjgHC7CiOxRsfNALc?=
 =?us-ascii?Q?cbsFL1Q1dky2BbUhWKFZmur0a+lBSLYxP8kWO+BW7vfEa6SiIFgb+jTNtiTc?=
 =?us-ascii?Q?toHXIJNZ6fJzQ0v8wbUa/yvZuyclo0r+HV8LH9jV75evkk80XwcLrEWYOplB?=
 =?us-ascii?Q?7pD82l4yJrhI26VahXo0t44X9X1c5GV7Q17AGjb8jXE7o44q6dFTVy6j+Z2f?=
 =?us-ascii?Q?Iko1dCTTVS/TkFwLVLgigXGhtbUsG5Gmna72ZYOZxqtd4EUg6n/oR75Anu45?=
 =?us-ascii?Q?0qri4VPwmN6XUAUrgacCo84bDcOjbiTA4EcKZEqATSEh33bKK6EM7+wAZq4A?=
 =?us-ascii?Q?kBymjpkdubMSdxt8sMrpnh1QVltnTEpCcXurbC5c6DNvdFOLxNEKCdeQFgd8?=
 =?us-ascii?Q?195cYtjv6q0+o5lKqx6ydYaZDxUFdnauz8hU0KKTLbpOFVw+KAP5v6LEf+nC?=
 =?us-ascii?Q?/73+QpL35Wcce21g/ZPHTkK7osLh6esfPsIXrKKmbwfQld3lp/+FopebQbmH?=
 =?us-ascii?Q?4Gf7o1rH/rAWg9Y/UONkcYst79+kY+PrPJznFLpA5BQHd15WNDbwpUpsZBTA?=
 =?us-ascii?Q?J8itmohj7+TQYEYGg6NL0knLZiTdtUHtz14WGHjAB3lcE+45FUfXZFe4zPa1?=
 =?us-ascii?Q?QSIfGICejWBTWdgEkBB/trnhGOpQyRVKsC4Z2rTL8/p2kPmjIouaL6UNqyd/?=
 =?us-ascii?Q?4xzEYh9tSSEhBdS54llWOtr+wHbJjp6egJcmuDZO/sfszv+SH5CwYCJ0VSav?=
 =?us-ascii?Q?gyNLQZMC4UfpjPAF9Zyg1rFvmP4vVAfoPmI6EY3KrcUEAZZYInUJvPZUGnuA?=
 =?us-ascii?Q?Q2eDV5nWuFo2qfhRQfJm5aSmdjIaIOXr6PtUeaWXUNoDlJC8+tqUX1pScoZb?=
 =?us-ascii?Q?ouKgtlMDMhPjztyozAwnU6fHqxgAXKIn8FttYZkq3EJORcuIh2Z82TL7/Hlb?=
 =?us-ascii?Q?Ce8Q2ELQJpHv9KZEqMG8G32OATzPHeS88a8/Ho45Qpwm0lr4CUCEqlmbLAO4?=
 =?us-ascii?Q?Ddxr4TN+8+/ZSfnfO6vnV1Vb63I5QipTrw/mWXGRtqxDJt6Jeyy3YS66+wOn?=
 =?us-ascii?Q?qdYcEUVCHIobJegSeWuHP1qQPyuTA+i9yPiiFMEy83XU2a4Ll0exbsbx5s3c?=
 =?us-ascii?Q?dVHMdYY8Zr9Vf9+dwv5mL5a13prZFdlyGTqzII1THNH3bKU+vnMTenxZKdWR?=
 =?us-ascii?Q?BGFm/EWDfGEhZNOO1eoWkimZUr9n+Tcf27CE1F+c9qeCy1MmCgJUqiUBOlUn?=
 =?us-ascii?Q?h9xjpAgIeE4FD+El0EHKQyGseG2n97PJ/Ros02r9QL0CS/pO3egHu/W0SO2j?=
 =?us-ascii?Q?AgYdYcxJ0Om2bTULbnBqWNee8e1AzapHyEWe+pi/L/dQXDHk5ezHoWsN63n/?=
 =?us-ascii?Q?ZFzjG26tx1Ri91LuJo2o60YSBodgyYPslRlBWKJDXIGWTHnUR79o+/kn9mvC?=
 =?us-ascii?Q?HY72TCV5LTy4nyYxwHDz6ATC9hJ31vSEg8/8Yqt58e5DW6OqFy/PHp56m/zK?=
 =?us-ascii?Q?FOB1JAE6v6wcm+Gk71EnWONvKRJ50EIx9dTMX7UUsi/lU+M8W8DO2pbhiqgm?=
 =?us-ascii?Q?italnMIt+CriXIw6kYJZsL7mQceBsQATYymybC50BmLShu6PPrEim3Key+SG?=
 =?us-ascii?Q?BZPW5UYv84rndeuhaZ/OEjXiurxJ8kOPj1Fllap4TeVhaNRL5n2kdghacBL3?=
 =?us-ascii?Q?yzkXZL1Q6GrVgxalh7ArSveXoEirNwZlGu5salD01sdRPBqVeS9aLfxrrSlw?=
 =?us-ascii?Q?nYPtQ7Czjg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bb2e27-67ab-4d82-d7c2-08de798ab44b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:09:37.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNATnBxVY4r1OdBB94vA+7tZNkZV0p/goFXBQKutvFrXRjPk7LfAINjkYf14HjGMH9xRDUvck8uFQxozPIq/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6500
X-Proofpoint-ORIG-GUID: FSe3g8IKv6MDUiIoZ9hsYaoonmByjqSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAwNiBTYWx0ZWRfX6n37DzF1xiMX
 LdDzB3bW9YCVwTzoKXqiDbrWchqB1RslwpPmIgLuUFpWb+0KM4ykANsio/lb8GQxY2kuxOUiOMk
 h+0XPd2VRNV28V7QVpqcg9wSqgzTgjAwwnUAH/ZbjyYcK1ALPBn41qLxF3/84DQQtZp75BMcNYr
 EsW0D0V3jwKSf/1i64GCV49zE52ZhR69hD8/IJk5Hq54XRZkjVaxX1v9qGoZb3+/21UUoLnf1Gq
 5LYhpnyJazkMEpVBEPgszhT/srF+m3x+w6iI2TbALseZHnh1+znTcPsOGptDhTcsOMmGS1b/t/K
 1KigWvvx50UOKQF/K3DPaj4wllmZFP8H26MjBThQKqZABmtqB8HO5ctvP9x3dQHZCmzUnPvicBj
 dbfReTUUkbI/gwFaC0FD9uNCSPmA+ILLevS9E8y3oOAwcyyIUSFPY+nahlJffDCa+bjH6XYfCkf
 i3d1NEwbWzsmxpvJzkw==
X-Proofpoint-GUID: FSe3g8IKv6MDUiIoZ9hsYaoonmByjqSP
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a78655 cx=c_pps
 a=sh1HRyDNv5RGx04/W1QObA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=0a-KwUMjAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=t7DMGYkHzcfGRvj4T3kA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 01:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124836

ChangeLog:
https://github.com/linux-audit/audit-userspace/releases/tag/v4.1.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...auparse-test-disable-some-test-cases.patch | 38 -------------------
 .../audit/{audit_4.1.2.bb => audit_4.1.3.bb}  |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch
 rename meta-oe/recipes-security/audit/{audit_4.1.2.bb => audit_4.1.3.bb} (96%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch b/meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch
deleted file mode 100644
index fb9a901f3c..0000000000
--- a/meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 003983a6e04a5e8d9373a96cb0a1c13caae9b193 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Sat, 6 Sep 2025 14:04:40 +0800
-Subject: [PATCH] auparse/test: disable some test cases
-
-Disable test cases databuf_test lru_cache_test and uid_name_wrap_test as
-they can not be built with --disable-static configuration. See [1].
-
-[1]: https://github.com/linux-audit/audit-userspace/issues/494
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- auparse/test/Makefile.am | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/auparse/test/Makefile.am b/auparse/test/Makefile.am
-index 06928438..dad75e76 100644
---- a/auparse/test/Makefile.am
-+++ b/auparse/test/Makefile.am
-@@ -21,10 +21,10 @@
- #
- 
- CONFIG_CLEAN_FILES = *.loT *.rej *.orig *.cur
--noinst_PROGRAMS = auparse_test auparselol_test lookup_test databuf_test \
--	auparse_extra_test lru_cache_test uid_name_wrap_test
-+noinst_PROGRAMS = auparse_test auparselol_test lookup_test \
-+	auparse_extra_test
- TESTS = run_auparse_tests.sh run_auparselol_test.sh lookup_test \
--	databuf_test auparse_extra_test lru_cache_test uid_name_wrap_test
-+	auparse_extra_test
- dist_check_SCRIPTS = run_auparse_tests.sh run_auparselol_test.sh
- EXTRA_DIST = auparse_test.ref auparse_test.ref.py test.log test2.log test3.log test4.log auditd_raw.sed run_auparse_tests.sh auparse_test.py run_auparselol_test.sh
- CLEANFILES = run_auparse_tests.sh run_auparselol_test.sh
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-security/audit/audit_4.1.2.bb b/meta-oe/recipes-security/audit/audit_4.1.3.bb
similarity index 96%
rename from meta-oe/recipes-security/audit/audit_4.1.2.bb
rename to meta-oe/recipes-security/audit/audit_4.1.3.bb
index ae06b6023e..12636045d4 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.3.bb
@@ -9,11 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
            file://0001-Fixed-swig-host-contamination-issue.patch \
-           file://0001-auparse-test-disable-some-test-cases.patch \
            file://auditd \
           "
 
-SRCREV = "4db9c700b0c8b24a8113bc00d98101228e7d0212"
+SRCREV = "dfda9708910e4e72412e68d638087b29522df386"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.34.1


