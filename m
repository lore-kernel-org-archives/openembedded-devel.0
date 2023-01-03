Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD44C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 09:02:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59788.1672736559271960740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 01:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QRTsPgKU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=036779a716=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3038wMSR005130
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Jan 2023 09:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=sCZCeVIYuYzHQobzjNnNwRxiPGwv1N140izHjD5XUYw=;
 b=QRTsPgKUmHvHJnZk/7rO0FuwcEkfqm2k8QJH1yrtt5NqoHtM3rE5iiti335xNsqnc1nK
 jz4/xW6DzGprDFZ1DsOwolHhW6Kp3YadeJokk8SFpeI1cfFv/Gj7RZELIxoJfFQXfUHI
 2Btdnc97VZivhi76mBOJYg/MjgmEC1PLu1mE6boHTuTIPBEslQdNAQzu53/UR5KUQ2Lv
 /T/jqTHojsZomA6F3CMpggt2V4TVUotuEJuzotaJz9fHaT2SpXkN6o6Y0rU5LyvKUUVY
 mG8WG5u1tpSCbsPMHPZPknfI3UmZZ42XL7Ses7THD++iFNQ69/pQpFAx8EPcVPcgi2X/ 5Q== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtaa2hjar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 09:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHOTQ6Ncw4HrUPZP3NFjVIDGDNSgIIA3heum0if1r2+eiDBM7FwSLvZihCDsD0nprMsLTa2vFoUqBOygsh+uTCXgUyaJl+RgEov8cMrjCpysvGKuiC8Xer1JtXsOMf/3QpRgD95srYA2GxSrqOda66bZP8D5ZMMncUzBS/Kuf3ddPjqF/iFd6b4EUggtltQ8F1IyfKvL5Yp4vZjcOLo++3nepZhC5fzeph/xyVF/Yvb2AIrEuEeA7SdNjWpsTIw7h8qw0FQYqmngwKAmT2nQU5W+clUKXAt+f/M+BwDEH1Fooy90VdxDTYkj0RZdJZgiVfBNieFoMZjH446mtZC5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCZCeVIYuYzHQobzjNnNwRxiPGwv1N140izHjD5XUYw=;
 b=RrL/tWnoG7dzeT6nrugmt+CDLqqgMlUQAvRhd2POHZVLksZo+1LCQ4icfCUsZeHSunjRa6Lhqh7TDOmbkyfsV0Eb8xlLTx/7gwqGE3wtKx2UahLUWgXWuk1RPFFRe/P+mDdin1FltzoU/g4ojhI8PCF10KGekAtSrUaB5qAt636OVNSrXhdqtMBJ61N9Sy3m5FRpMeq+/WtafWLik9vFfVn1gLyrAZGlek6GNWVb2LM8JAuafHXvc4iLCI+Jvv86bbFaeHb1kZFDbHchMSqEwqZaFER0439qxs/doJ2BOUe4+gXgHuuUy+leDwICNmFzAjodgc8HcufeSpYXbX/uew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 09:02:36 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 09:02:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH 1/2] grubby: update to latest git rev
Date: Tue,  3 Jan 2023 17:02:21 +0800
Message-Id: <20230103090222.3369744-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: fac29d39-14fe-44c7-f561-08daed6941b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BCFahI1kqCC2bqa3Jt65qSiWWSpuFy/myQgGvADlZjU3lZmX1VeR6jBzBr5F+q9d+e6isEMyTngLbI/GsEj+67JFDgZ0muDupF0HdQlJ9DyapUbr30jZgBdKzdV7OwVQWWe+onj/6k/Uc7UoOBjyQhWQ2MvbAkvKVgFWWVO6LEd1j+D8fAwinBph9p3DfR+DdqVyKXwwgTRj6GmaU8kRbV7u3WZBUM8ilZZCd/nGMyyny/kO07IxGzFn2aA6f8yAo+FxHMsIjURm5ydccw2fo1DmffR8c3c+lDrc77BYq1gvZ1rjM+uljmlomNyq3NJvpKLNGwujWY4zZiDN8ip2jZEN9UMP4zr0smVHm5sNjkM2Cvcoa16DnCe3CxY8iW8dlnucm2gn0wSNOM1wY+OxLpYJnHIbku/mo8l/jknsPmyru7ywG1UkC+Sopm+kvRAswB36n1sTXKji7eC4MdIIao7kbUJBF98/585DBnbaR5kluxuRZX8cH+/j3JWKT8ReRwxycSpyeAX5NRoa6VYzv1M+F0QUr3yfdqeh5F5xD51W07irPqRGm5V3Z8hB6wa3Nva0vsksjHoZGug38FDUELXpr5JQKL7Im0LChzuw03RJX0hUn7aCjopJoUhVeKFQE5A9r4ttlMDk7AQkqy6/9XWEBb1q1yBwodEfz2TQO+soWOzD7k/5VY5Y7PuBj4hafzO2jgBHF9hYywol3Na51oKbEizK3pVuezGcdRal0PI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(451199015)(5660300002)(2906002)(44832011)(8936002)(8676002)(41300700001)(15650500001)(66476007)(66946007)(66556008)(6916009)(316002)(478600001)(6486002)(52116002)(2616005)(1076003)(53546011)(26005)(186003)(6512007)(83380400001)(6666004)(6506007)(38100700002)(38350700002)(86362001)(36756003)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m9B8C6vA0ZYepW5AjgxPIbP83EopOXMZjUqfXpxivY1cOo8X1hm7lN3i2XtX?=
 =?us-ascii?Q?GfYlltWdBiPD40SyG1ePDuikMgeRvNqp09f9GRCszQKH6P9YRfPNN5PIxc81?=
 =?us-ascii?Q?VHNtXdETdZPzo9ling5nYK63Jm+r/qY72dp9Bfth3HtctWyMU2c71TLcxT1u?=
 =?us-ascii?Q?wed4c8abOhTZ33P7ayezXImV6TuvibgzXL315MTHbb4SCJs+x0h07dL0tDu2?=
 =?us-ascii?Q?zb347mtKMzafUCI4mqWWRS90IQ3yLO0ErcVWG60hBCIDLnLCme+Sh2G/ujCQ?=
 =?us-ascii?Q?bOkJtWB8H4/FwfnuF0AkTEHpOAwsGHLpzrAkm0z7tD49swmsXIskBrX+ZGtn?=
 =?us-ascii?Q?/NYCEH3JMpNWrR+p6WjmUpRZBX5lHKJZ9h1AEc9xrLnaslme9l2I9FVWs8Lx?=
 =?us-ascii?Q?VOHpU9+QbEKib7s9ZJHa3RitUgW3k5cUphhBAZmAU+pdAzP7ns8NGFTSRNZK?=
 =?us-ascii?Q?rIBc9uNkXun9gVfjF5Y4a56Wyt65kNORKTHrTNYuEdT5KJn7x3/qZNbI7wBn?=
 =?us-ascii?Q?gFUCho6eKGTBZx4w98sI9BvoH4OQdDSpEHsvKjjyCrwYez2mjPhMH1u9Zpdf?=
 =?us-ascii?Q?DltfK0XcunPajPT7P9PfRTHS1lYhHQB+PugkZ6I4LUJsVyWJm6bteYr7QFtL?=
 =?us-ascii?Q?9QSA4IC/BtiQWmyHVyFcXav1C92BJCLgQm8y6v/9sgu9O25rnckBB1TVTU/c?=
 =?us-ascii?Q?hMPV/TNN75gAK66NB6Uf2lshEkowi4xrrTNXEAQD378eaROs90l8Xm0lhxkg?=
 =?us-ascii?Q?j0s83Bf9GItuPpHuhs3ORZVBQFtiIiEJfIED7/TYqDC1+wiWBaIYF9d3ZR4Q?=
 =?us-ascii?Q?oGExoUTQxGAZDth9hH/urmhnV3HQaC9jPSDnVpP9WfGuTs8OAkHfHfnoQZbA?=
 =?us-ascii?Q?/RwtUBa1WsOhZb3FQPogzEAh3jHEpbmx5VhmZb9QJHxlFOL7iHccwYPsBtwo?=
 =?us-ascii?Q?BdJR1CxO5duzG3v0Z5jt34rmqmL71kffMy4a2MhlaGIl38lhbPTpGanmvN0x?=
 =?us-ascii?Q?ZHlG76/7m2jxa13xeeJFS7fdSeBnr/R3ZQ0PzR0FFgU9LHWl9AvkqASRIyvs?=
 =?us-ascii?Q?PY/JI7yrnK5TB5bJmfG+FoqqPRITxWk4YqeqsARn2z5jSF5RHuwGS5ibqzno?=
 =?us-ascii?Q?TqftMyiMxRlVAP5sjJjfv79z8hlULjH5K2WbY4A6myNFviTeRxtY/n5wfD0D?=
 =?us-ascii?Q?VQF6isM+B6VwmiG643XnnomjLBOqRnjhUpiM0i1ooZnaaetfwXMl8UX5eE1D?=
 =?us-ascii?Q?xGfa2B8iGxNy3tUWEhkJLs8+5qEJmkm3cD6CPACn+zBtpRFl3CkxIXgJM/kk?=
 =?us-ascii?Q?yvuLVPIHFLbNRIMUCYQV1ZLpetUOn8W//alrhOSGYishwmMd82m33g5wTHjo?=
 =?us-ascii?Q?OSdAJ+hUiyBRTCwfwkv7LSepwGMkqa1ho70pUYtn8BTEu9XeAXFI4J7LzDPc?=
 =?us-ascii?Q?GBq95Ir8v0GRCeZO5zqS/PwWLONN+nP3g4qNMSEwQaZBpykNx8JCfolKNFRO?=
 =?us-ascii?Q?VRa8nD3ZoTg6tCIGRpMTjQtsc1/1bio2Qa13QfbXCXaFsn0Fyte7SCGXR+xf?=
 =?us-ascii?Q?ic6HeYGtZxSnDUm/GTlWIYWPpjkX6VAjLNcvFHIV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac29d39-14fe-44c7-f561-08daed6941b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 09:02:35.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZ4vCRTzMcaXrw6MwbAmabnjp/F7Lb1eg/C9KFb94XS7zxFT2fJIou3o1gcOtR8ndrdjmv5vr3BY9oUlol8AMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-Proofpoint-ORIG-GUID: rpUPueaUl8sIyDD_9hVNNv8-7UUfylxS
X-Proofpoint-GUID: rpUPueaUl8sIyDD_9hVNNv8-7UUfylxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2023-01-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 09:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100358

* Refresh patches.
* Update SRC_URI. The upstrem repository has been archived.
* Depends on rpm to rpm-sort build.
* Add a patch to fix rpm-sort build error.
* Do not specify PREFIX as the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...able-LIBS-to-provides-libraries-from.patch | 24 ------------
 ...ename-grub2-editenv-to-grub-editenv.patch} | 10 +++--
 ...able-LIBS-to-provides-libraries-from.patch | 38 +++++++++++++++++++
 ...3-include-paths.h-for-_PATH_MOUNTED.patch} | 10 +++--
 ...sort-include-string.h-for-strverscmp.patch | 33 ++++++++++++++++
 .../recipes-devtools/grubby/grubby_git.bb     | 19 +++++-----
 6 files changed, 93 insertions(+), 41 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
 rename meta-initramfs/recipes-devtools/grubby/grubby/{grubby-rename-grub2-editenv-to-grub-editenv.patch => 0001-rename-grub2-editenv-to-grub-editenv.patch} (94%)
 create mode 100644 meta-initramfs/recipes-devtools/grubby/grubby/0002-Add-another-variable-LIBS-to-provides-libraries-from.patch
 rename meta-initramfs/recipes-devtools/grubby/grubby/{0002-include-paths.h-for-_PATH_MOUNTED.patch => 0003-include-paths.h-for-_PATH_MOUNTED.patch} (63%)
 create mode 100644 meta-initramfs/recipes-devtools/grubby/grubby/0004-rpm-sort-include-string.h-for-strverscmp.patch

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
deleted file mode 100644
index dfbe7ba6b..000000000
--- a/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From b7b3caa9b5c8abcd3c371d0683001cd681e104b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2017 10:19:22 -0700
-Subject: [PATCH 1/2] Add another variable LIBS to provides libraries from env
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index cc7e823..ae30a07 100644
---- a/Makefile
-+++ b/Makefile
-@@ -31,7 +31,7 @@ ifneq ($(VERBOSE_TEST),)
- 	VERBOSE_TEST="--verbose"
- endif
- 
--grubby_LIBS = -lblkid -lpopt
-+grubby_LIBS = -lblkid -lpopt ${LIBS}
- 
- all: grubby
- 
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0001-rename-grub2-editenv-to-grub-editenv.patch
similarity index 94%
rename from meta-initramfs/recipes-devtools/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
rename to meta-initramfs/recipes-devtools/grubby/grubby/0001-rename-grub2-editenv-to-grub-editenv.patch
index e693916e1..7e1615c5b 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/0001-rename-grub2-editenv-to-grub-editenv.patch
@@ -1,21 +1,20 @@
-From 15f0572f2f456c2c1b700bc790d9ce7a5c13cc74 Mon Sep 17 00:00:00 2001
+From 7a72139d2e3cc80f64090a823afe7bcea76e4792 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 4 Aug 2015 23:54:41 -0700
 Subject: [PATCH] rename grub2-editenv to grub-editenv
 
 We don't use the name grub2-editenv for grub2.
 
-Upstream-Status: Inappropriate
+Upstream-Status: Inactive-Upstream [lastcommit: 2022 lastrelease: 2016]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  grubby.c | 4 ++--
  test.sh  | 8 ++++----
  2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/grubby.c b/grubby.c
-index 396041a..3ceae69 100644
+index 98c1516..be832f6 100644
 --- a/grubby.c
 +++ b/grubby.c
 @@ -301,7 +301,7 @@ static char *grub2GetEnv(struct configFileInfo *info, char *name)
@@ -74,3 +73,6 @@ index 33d24cf..009479c 100755
          "saved_entry=title"
  
      testing="GRUB2 --default-index with default=saved_entry"
+-- 
+2.25.1
+
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/0002-Add-another-variable-LIBS-to-provides-libraries-from.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0002-Add-another-variable-LIBS-to-provides-libraries-from.patch
new file mode 100644
index 000000000..967a4c94f
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/0002-Add-another-variable-LIBS-to-provides-libraries-from.patch
@@ -0,0 +1,38 @@
+From c02d1bf46174656cdb6f7c08fa3e8fa520edcd8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 10:19:22 -0700
+Subject: [PATCH] Add another variable LIBS to provides libraries from env
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2022 lastrelease: 2016]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 968c276..75abe44 100644
+--- a/Makefile
++++ b/Makefile
+@@ -31,7 +31,8 @@ ifneq ($(VERBOSE_TEST),)
+ 	VERBOSE_TEST="--verbose"
+ endif
+ 
+-grubby_LIBS = -lblkid -lpopt
++grubby_LIBS = -lblkid -lpopt ${LIBS}
++rpm-sort_LIBS = ${LIBS}
+ 
+ all: grubby rpm-sort
+ 
+@@ -63,7 +64,7 @@ grubby:: $(OBJECTS)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(grubby_LIBS)
+ 
+ rpm-sort::rpm-sort.o
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ -lrpmio
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ -lrpmio $(rpm-sort_LIBS)
+ 
+ clean:
+ 	rm -f *.o grubby rpm-sort *~
+-- 
+2.25.1
+
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/0002-include-paths.h-for-_PATH_MOUNTED.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0003-include-paths.h-for-_PATH_MOUNTED.patch
similarity index 63%
rename from meta-initramfs/recipes-devtools/grubby/grubby/0002-include-paths.h-for-_PATH_MOUNTED.patch
rename to meta-initramfs/recipes-devtools/grubby/grubby/0003-include-paths.h-for-_PATH_MOUNTED.patch
index de8133a3a..86ae01021 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby/0002-include-paths.h-for-_PATH_MOUNTED.patch
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/0003-include-paths.h-for-_PATH_MOUNTED.patch
@@ -1,7 +1,9 @@
-From 8f844ac7f44b8dc428d06cd6958c5f32d383d01c Mon Sep 17 00:00:00 2001
+From 7e68976eb6edd766471c11382f5bf57940ba9315 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Jul 2017 10:19:50 -0700
-Subject: [PATCH 2/2] include paths.h for _PATH_MOUNTED
+Subject: [PATCH] include paths.h for _PATH_MOUNTED
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2022 lastrelease: 2016]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -9,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/grubby.c b/grubby.c
-index 47a1a15..59f74a9 100644
+index be832f6..4825797 100644
 --- a/grubby.c
 +++ b/grubby.c
 @@ -34,6 +34,7 @@
@@ -21,5 +23,5 @@ index 47a1a15..59f74a9 100644
  
  #include "log.h"
 -- 
-2.13.3
+2.25.1
 
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/0004-rpm-sort-include-string.h-for-strverscmp.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0004-rpm-sort-include-string.h-for-strverscmp.patch
new file mode 100644
index 000000000..c68b492eb
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/0004-rpm-sort-include-string.h-for-strverscmp.patch
@@ -0,0 +1,33 @@
+From 45bc228090b3adfc0a5058b9cd019d91831e110a Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 3 Jan 2023 13:59:48 +0800
+Subject: [PATCH] rpm-sort: include string.h for strverscmp
+
+Include string.h to fix build error:
+rpm-sort.c: In function 'package_version_compare':
+rpm-sort.c:156:13: error: 'strverscmp' undeclared (first use in this function)
+  156 |       cmp = strverscmp;
+      |             ^~~~~~~~~~
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2022 lastrelease: 2016]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ rpm-sort.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/rpm-sort.c b/rpm-sort.c
+index f196356..2eb91ce 100644
+--- a/rpm-sort.c
++++ b/rpm-sort.c
+@@ -8,6 +8,7 @@
+ #include <argp.h>
+ #include <rpm/rpmlib.h>
+ #include <err.h>
++#include <string.h>
+ 
+ typedef enum {
+         RPMNVRCMP,
+-- 
+2.25.1
+
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index bbfabf020..ff673e21b 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -9,25 +9,26 @@ LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
-DEPENDS = "popt util-linux"
-DEPENDS:append:libc-musl = " libexecinfo"
+DEPENDS = "popt util-linux rpm"
+DEPENDS:append:libc-musl = " libexecinfo argp-standalone"
 
 S = "${WORKDIR}/git"
-SRCREV = "a1d2ae93408c3408e672d7eba4550fdf27fb0201"
-SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;;branch=master \
-           file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
+SRCREV = "c01b0d5bb182bde35b464d14996acf354a3ada2e"
+SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;;branch=main \
+           file://0001-rename-grub2-editenv-to-grub-editenv.patch \
+           file://0002-Add-another-variable-LIBS-to-provides-libraries-from.patch \
+           file://0003-include-paths.h-for-_PATH_MOUNTED.patch \
+           file://0004-rpm-sort-include-string.h-for-strverscmp.patch \
            file://run-ptest \
-           file://0001-Add-another-variable-LIBS-to-provides-libraries-from.patch \
-           file://0002-include-paths.h-for-_PATH_MOUNTED.patch \
            "
 
 RDEPENDS:${PN} += "dracut"
 
 inherit autotools-brokensep ptest
 
-EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' LIBS='${LIBS}' 'PREFIX'=${@bb.utils.contains('DISTRO_FEATURES','usrmerge','/usr','',d)}"
+EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' 'LIBS=${LIBS}'"
 
-LIBS:libc-musl = "-lexecinfo"
+LIBS:libc-musl = "-lexecinfo -largp"
 LIBS ?= ""
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}
-- 
2.25.1


