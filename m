Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF34C38142
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 01:43:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8761.1674956590132043638
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Jan 2023 17:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ec9t1ZOU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13936a3a4e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30T1gnk6027439
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 01:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=XJztQesf/wy0FE9xskUtbG2CeqDGHWImAyowHnPoXV4=;
 b=ec9t1ZOUhxhzc6geq729+OYDhlZ1OBcjxXPjzKqepw3urd/Gt8fODuduWSIH1N9UPO92
 Jx8gNEiypP1c1sQF+1mxrVrmgTjny82ejSnEHqRm4aJmmjQvNPlGFZp1RCNN6s/ghxy2
 IH/SfVq7Y4jiNfv75vbAkzgcKF8206NI/jQ/9FwZ8II0BXQH1lFv9ROF6QgOnMlQ84V9
 LOhScH/xtqJxuoIS2jx/QIM5SbwoYh4uuXAUqOi0yNs3Tc9qL0on3ssXqO+3ggxZpXIn
 sDJgH6OJlLtiKbupXhGCFd9bGj3eDGw/2h21NPUElvvlBeG8qWqyX8XFyK+gVd81c+ER 0A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctparxpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 01:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnMgGj5mDrrsDTP9Y58oh9Td2KZztgggX1I8/s36ZhVHmqmgedTqK2Kxa255xTkgpsNtpT8YLtfpbAGyU/9m51z5OHOMQtqqwJlfCE/kxBxSxsFOOjknKC7f1PHQ6A4yuf7PWH6xOwStua1o8oKVYN0jxHCNw/KBHhP/iaKVX8MxbBTDKfdj1ipWcRMhz8brKLAO99eChWymvcdZ3xTnyyIz+Dqbj1Aet9b3BIrN+CeZgl3EfPSA244M/OtXabI9NKs92Wj1bzbLJk/89WA+CSLIXJtS5F59+TfH1eqPdwYM9Pn3nrQRBsMVTn/jQ37sPC91Z3kRETUQ09f0aeO00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJztQesf/wy0FE9xskUtbG2CeqDGHWImAyowHnPoXV4=;
 b=g2h5Vs9XRI5ewdqYhchwmAVF3HWPJNDmAbwT6UAuYaYCbg9z778xCCvd3CUJm5IYzKNNKtB113MC1Wn19Gmjf0BG+BbDJeuA8zEWJ7qr/zLbUps43QckgtXOhAtxHAoQkvDCotOk5Pnlrfc0KUzjvB0ApaLUpBXM1VHx25ZHLwUVeaa2mn9eTVqKrNX+BtKE3WRSDXIeOLN2KO+Ipdq3nkoc1fBZCh5ZSeinB50TCFJXDcoisisK8eW73Ax+4Blgztfbs7TfUM7WWp1kblvuEwHjMBKxQYv0aaSjCT6cIBk3NyQ+j5lYe/iIs2OKO+8U0Ti7mDxFP7H8Ml/VU94qoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Sun, 29 Jan
 2023 01:43:07 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%8]) with mapi id 15.20.6043.030; Sun, 29 Jan 2023
 01:43:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.17.4 -> 4.17.5
Date: Sun, 29 Jan 2023 09:42:57 +0800
Message-Id: <20230129014257.1705368-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: d44d203b-007c-4f30-79d6-08db019a2b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cEIRZ7uitoNpufKyCTYUiH7fajlpu4AGlBRzQ6neCxQlz41ZSLzdOEq9rks/sDk07QhQUrKPs+I9wJ4EXmqV907XhT+7Pr87z59snisFbNN9vtNyLAf98OVSZWB9zet5Sd9FniEdsTOrimv94LNWYsHZFvDDhQCZxF56hqVt8t1X6z5vZmVfr8PGbQ8+MK8ATAKtnPoYeH1neQOtbjV1+b64od99hh6x9acsB2XPG3EodPrlwc2QEBftVIrSHBmWNZwRWmmL67STryuOroHPmrf0OzL3PqR7T8vnI+Ym+tkJ6taG8wNud47vSS3rxkfmRynLrvFPHf8sYLF1BmGkxcDmSi0/n0y+0Xr6KaslAbrqIzgSrXdj6YsslAUrdSMroxShd0BgtvpwOveP2kCbQfL5bUZz0AmnUT9iORTLq5LwYZbqDSGiSBe7WbVjXJ/o96U0YhBjEHJo+aCTCJf+Ctz9NWPyvDSJqiOaU2jCn/l+fyALY2fin0wepA80qns48POo1v96b6WvZTbIi7WqvDiJOpFYoJKKIzY+126ZRTfTeDeclccloVVllSYLNZtftQ3W6XCO1QSHPkC6IvsM7Eh3ptvPV60azYg/eAYi79t+HXGJBjN5lfScmrzWJOf4qurR9YxKs9JyJSb2dgtbx8JZYWyixfvOk7PDnFHaWX3EUc8g5dyVKV4zVdBavWA8qLoVPA870hMtgQrxE+AzaYISxR83FyLL4X5NMaTNeBU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(366004)(39840400004)(451199018)(38350700002)(38100700002)(83380400001)(66476007)(6916009)(66946007)(66556008)(41300700001)(2616005)(8936002)(8676002)(6512007)(26005)(478600001)(316002)(966005)(6506007)(186003)(5660300002)(6666004)(6486002)(52116002)(2906002)(86362001)(36756003)(1076003)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KTPN/GNgapNGxsbAFqMR73wdjyMKK61hrFOtZD1anYDIZwkvc7DUNlEF226q?=
 =?us-ascii?Q?bLtl1buYrHlPHPnTbeRw746eMBMMCKpbvISZzlU7YagFnXjH/UWdRS0Ip2yT?=
 =?us-ascii?Q?xp8lY8G2Frbgez3s0ThBl19B/cihLQeNvW2BhmQi3rVjFLVx4FRHN+2c+wSr?=
 =?us-ascii?Q?ywo4Z/z/zjkxF93B63cQLodToKPH36bhPMel6juKThP1B3ymBEBZP5krOq3f?=
 =?us-ascii?Q?0jvDzEtYYA8COyCbW/P7JkORDIXROJE2QufiXnRX5lcnPF/bz7LzpYkAK9B9?=
 =?us-ascii?Q?VCn8oewRpwNLigLlORRDtLRT8s8z9qoLmVb12I+ZuvYdguNH0NTexIFWZ8Aw?=
 =?us-ascii?Q?1ytbFTaKVOP+d0mpayH1Bbw++Mq+qyvOrL3R4PD5sz7ONjSb1sTrcFXinjF2?=
 =?us-ascii?Q?ww+7Wa4kjoU/wDlSRy4IhOGiu6YeBfyyOULcFU9WsI+REgxeSIHD2M5LbDx4?=
 =?us-ascii?Q?WDixQo5R9rOtgb3qxXV1xU29AZNxCnMGYBaFVcZGq/XbvVESRMtN0nMpyzv9?=
 =?us-ascii?Q?sdsWDxZypeIWvfooPhrD3JoiLEwA1spSWvcY1UtYjlbir7RRhx2YrOPUFUko?=
 =?us-ascii?Q?Gh0dsbOcbneqyIndv6cIKc1T3187H6UqzDqYJJ81sSBzlJ6pyNbT3iVht/ZS?=
 =?us-ascii?Q?/mmO143e4Xt3ckg+MmEijU4KEYcrVUaHIN3durxIf5zcLlzynULRXrg5OzHk?=
 =?us-ascii?Q?q0TeWFC1n99KJm99AC9p6qqwLgIk5XH6+/5f+2MXvGAvD0bKfCJ/NIVfc4AD?=
 =?us-ascii?Q?sokLRpUKYuO1zEyAhSfFnamWzwA6Ze6faLi3rH/ZYv/0ZDM1XqOElagzA3aY?=
 =?us-ascii?Q?kKDT42bI9KUdegLO/xP2E0+0Ghm/28Ar8mU71EcAz+KnH64P5w/SsIeCjoWU?=
 =?us-ascii?Q?ePLP1ZAFUoAcvxtYiCSysQwcGtWFrqivGwuE2yhjqA0fhWOVxt5AAAK3wbh8?=
 =?us-ascii?Q?CQ4H1g/lgs2QiSS9AhdYF7uKiO0gM5R4So1CuO+Q3x9v67CIVuRlEQsTIKu7?=
 =?us-ascii?Q?4Ub+eyuiXOix99WTFQX2y6/wpE5Hy0CP/XTqCT/Q6k1o4Q3QFNluOWmBj6nt?=
 =?us-ascii?Q?PiWXApfiAl8oSDbpJ4gr6IvPPTFM1uQ1kK5ZX3Yi5rTBmx66Z5PZPkKunbVe?=
 =?us-ascii?Q?yAa6efF+MRdvUMuowUbVt7c2soE/HnZCQjKeWANXuyvcgJvdjuWJK19GlFQa?=
 =?us-ascii?Q?PpJnv+BO8idsSP5Ldo26o1CT01Fq8/TWOyHiitnC6SGHxe2VK2P5/8WDl9xJ?=
 =?us-ascii?Q?XZyeWY6IexR+HFNxgPCNLJ4iHIf5B3QZYpfutbsCe7rZCd+pldNP3/X5j11W?=
 =?us-ascii?Q?01PPqe8tv7eEzH+gqmsUmfq1NVLNGiDK8heUk7o2Wk2ZrBBOFpwkwThjL2DF?=
 =?us-ascii?Q?vMlybENUuzppYVtxkEEC1HSoXkiup+T6PE8Z8ekjfRH/K0ofUpDufxGzM5PX?=
 =?us-ascii?Q?HKxzdsfhECDaGpxPkv3EY6ETz4PpKlofuMKidOsZ9nw+w85GJEtUWWSUPNTL?=
 =?us-ascii?Q?VSlFbGqH+6ybHjSZiyWICKlJ2VLcuuUU/mt4fSQoLl/xSmNVZ9ZfY7e17NEE?=
 =?us-ascii?Q?JnT1edhPEW7oU1/Lc7C+O9l7tRBIK+ZZBCb3zJf+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44d203b-007c-4f30-79d6-08db019a2b9c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 01:43:07.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oil2wybwTbuwH8MDtBsIdh+L/BGSCF1PcNX2TuPGn2zdsKRka2jazIxlycuvExeQhX4SImLjhMVkg603S5w9RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
X-Proofpoint-GUID: WVjD1YGLTOd7wJ0TpwE3IOa3EXfQRTtF
X-Proofpoint-ORIG-GUID: WVjD1YGLTOd7wJ0TpwE3IOa3EXfQRTtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-29_01,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1011 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301290015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 01:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100829

Release Notes:
https://www.samba.org/samba/history/samba-4.17.5.html

Drop 0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch
as the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...of-python-to-fix-the-install-confli.patch} |  0
 ...ith-Werror-implicit-function-declara.patch | 32 -------------------
 .../{samba_4.17.4.bb => samba_4.17.5.bb}      |  5 ++-
 3 files changed, 2 insertions(+), 35 deletions(-)
 rename meta-networking/recipes-connectivity/samba/samba/{0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch => 0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch} (100%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.17.4.bb => samba_4.17.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch b/meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba/0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch
rename to meta-networking/recipes-connectivity/samba/samba/0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba/0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch b/meta-networking/recipes-connectivity/samba/samba/0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch
deleted file mode 100644
index 91eb22967..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 95946ce8b6317f68c51338d19d237ce6da61d1c3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Aug 2022 13:05:26 -0700
-Subject: [PATCH] waf: Fix errors with Werror=implicit-function-declaration
- turned on
-
-Clang-15 turns this option into errors by default, and it results in
-rpath check failures
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- buildtools/wafsamba/samba_waf18.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/buildtools/wafsamba/samba_waf18.py b/buildtools/wafsamba/samba_waf18.py
-index e2a078b..e145c77 100644
---- a/buildtools/wafsamba/samba_waf18.py
-+++ b/buildtools/wafsamba/samba_waf18.py
-@@ -209,7 +209,7 @@ def CHECK_LIBRARY_SUPPORT(conf, rpath=False, version_script=False, msg=None):
-         lib_node.parent.mkdir()
-         lib_node.write('int lib_func(void) { return 42; }\n', 'w')
-         main_node = bld.srcnode.make_node('main.c')
--        main_node.write('int main(void) {return !(lib_func() == 42);}', 'w')
-+        main_node.write('int lib_func(void); int main(void) {return !(lib_func() == 42);}', 'w')
-         linkflags = []
-         if version_script:
-             script = bld.srcnode.make_node('ldscript')
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.17.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.17.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.17.4.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.17.5.bb
index 966eaf9bf..1548ffadc 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.17.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.17.5.bb
@@ -23,8 +23,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
-           file://0007-waf-Fix-errors-with-Werror-implicit-function-declara.patch \
-           file://0008-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
+           file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
            "
 
 SRC_URI:append:libc-musl = " \
@@ -33,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "c0512079db4cac707ccea4c18aebbd6b2eb3acf6e90735e7f645a326be1f4537"
+SRC_URI[sha256sum] = "ebb7880d474ffc09d73b5fc77bcbd657f6235910337331a9c24d7f69ca11442b"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.17(\.\d+)+).tar.gz"
 
-- 
2.25.1


