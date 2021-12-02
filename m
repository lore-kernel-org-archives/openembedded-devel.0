Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46052C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 10:11:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6266.1638439912774794173
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SZ5/lCOT;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7970627759=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B29rq3q028238
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 2 Dec 2021 02:11:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7CUT1tDt9qkdaeQGlThzwmYDJLeYtRK+Oo0CUH5PlHQ=;
 b=SZ5/lCOT3ZH3Yi/GQB2ohkLm77kgT2gjdrdqBdLGadTw7Yx7PaeyXHq4KVlJ9hCuGBxr
 RFsddkFqlqLAcchOY/3kSZT/qrWLMP+CSIdny+yPfq6fgBu1ka8GRQuLAHAoimf86W0t
 4UmTyJZqu6RDjFr7pNJKXfL/EdbarekkZg3LqMYEUOhHmmxE47uc0bIZHVVz8nHg1xrE
 SRl3Ozzw/96fDFMbOUnG9xaQ16lVNH7G37sz6kTTXVbM1jnkxBh949CcsqOY0p9Xv4cm
 eBfHkdQkidu92vaddngAEwvBdFwei36qpXgz0EpL81XZ5knrvOM7eOy28bZliliNZwlv WA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cp5nys27x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:11:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V30l3D1mg7FgZtviNSrHBDb7qFkn0Fe4JnhvZIXeYqQfTwDAUSMM57EFxjk7veno2mouxl3vT1+gZ/cGat0T8svj9T6jJpk1+ALEsVVBZH28gfR5vDU+z19LIIqD9jdqOW26GdMLM3910s1TlRul9QyEXbthnPvNZ0JiZLhMrxx/BQnj1RxOETSeM659wI1tjnN4DcbY7/wayZuGSBXCCJ9YAmT4FFCNa8Gbz5BfqQTN8d6EOYbDU17qwggCTywx1SocgeNNykJBBbX2thiTaqhzdpuFnKlDUhChvjR82NXcGlVvBXAHnPaBaJBuIEm52xERuLz41qpH7/Cnt/v8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CUT1tDt9qkdaeQGlThzwmYDJLeYtRK+Oo0CUH5PlHQ=;
 b=SYzych3unTs5lVwiqlLYzVXFTKJH570/ZP3QBA9KWvazdpKz8cCNiMh7Prfjr19DOE4GXc972Xtk0brom939FeTulihqijR8lxJj9STBDn7+2ylQfsin/YD7CdAjmtVN8evYL9lKeYwr0hNnK4D6vFQx7pTckfZzLU1z3zGXKQwqUvrqF1IQuxgDfaIn6NzFyiZb6+ag9JkQHPo+si23TayCSXVeFB69yQgnHW5DBR8PsBJ4saklbiWqNg+qiYqt2wVsD/OM8mYA7ynPzmvb/t0HLWZqeJJlqJvoDUGRNz4lk5VgdrkObuUcq6Nb7Y61l1QVQ5PKM++BZ6mfgG6TgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1374.namprd11.prod.outlook.com (2603:10b6:300:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 10:11:47 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4734.027; Thu, 2 Dec 2021
 10:11:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openldap: fix parallel build failure
Date: Thu,  2 Dec 2021 18:11:36 +0800
Message-Id: <20211202101136.163693-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2P15301CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 2 Dec 2021 10:11:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ff0c8e3-365f-4838-ca88-08d9b57c25ef
X-MS-TrafficTypeDiagnostic: MWHPR11MB1374:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB137465B6A158E5956FA84C10F9699@MWHPR11MB1374.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w7UYz1FU5R2gixjJ8Fu/8p720bF5UIov33kOaYndpJkV3SOgaTWocEWv0lfEL/AwV+NwpTVPN99vvh+G8TQOdO6rZc+4OP3APve7JzPwt/G7THC/68leV4uwfMR4jlvQbVkQ0z5lyIhFDDvpNfdDiSCkBYH1dNvoRyKGJn3tkuvuH5XJpYW4wYYHcx9mFjcgxeidsOgcnzmBsT9eKJ47i1syvRru9IjYW3eQn5mBsYhirO0c1Pgj9lQmyPRRg6XIrs2yEQFV++pqH2laVVwJDfOePnGGdE8gvMWiJI94SROTxHR5CGEx8RbkdxNSmJtlddRX/cpvQreBywOoyRDiJ2P9nidQhfRm2sHbllnRra4Ecmbd/Y4CdFzxFgHRqyxIt3W6bS5HHyWPH4AUySON6OMYOs/rHearccBlhkmhnVBs7V/oIlmcfkvAxL0Z0vamn2YIDoM/nhFQ82K4vYFDZ+DYSWN1w8lnB3xp+3wgfeD7bBN16RFxRWXcXdGW+F/c3v2Ex82mywpqhaokM+JtKUuDiX+RJgtNfIgRmJb5Dp/auGr6w64a/cw5h9LBLvLuxwXPfWlw90KIjzF9qL8oE9bKRK7z0cbhXL++XPifLao33mTQkKHyee5s2W+1hxjf5Yv+WnRybV4Cfa7/vJ1nlFeb0Uvxj2eG0TySY93bMIcg5WfSvx5Li1tmQG+te49pL6uRn1bq56if4sW+asXh1Za85Le9eir/rYf/2TrKRojJeQCe22iYjsqGN4tRfxfuSly+IQ7uJEX61hqsmdvHBnuZUh00fcd85GWUDhfA5Hk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(508600001)(83380400001)(6916009)(186003)(38100700002)(6486002)(66946007)(44832011)(8676002)(26005)(86362001)(316002)(52116002)(6666004)(2616005)(5660300002)(2906002)(6506007)(956004)(66476007)(6512007)(36756003)(38350700002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0mvddoRO+T18b00JBncZhZSJQG5uUxuzmJ6oGjeKtPcVq/Z040O2fB69QfO5?=
 =?us-ascii?Q?AJ0mIwstNd6rbBozbtrlIzwAXsrPdifK9tuksxRowYfdp388oYTX+U8M6Ny8?=
 =?us-ascii?Q?lDCfB6e12NKkqjBhq2PLEpP+KcWvvm02Q+vEh8srlFE2hmtvicrL2MWmTSZ3?=
 =?us-ascii?Q?4SjhrTf0dDBGkffs0Ohd5oBo+TxWi/RcZR7yCKZo1mOitFe7aBx7TCJ0KzfZ?=
 =?us-ascii?Q?V5BQGLnPjqgHq/uHLf9c61XQHojN5De+hNAAYNOXoKyjvp/8ui2+yFRfeiCO?=
 =?us-ascii?Q?bEeg1KYWXGPj+V32dWkh18nnzXqzAgFBH6dlAlWzOEkncVks33xdLuj8Eshs?=
 =?us-ascii?Q?bBdmxliAZcwe6hKSe5qTrpQ5wmAQ7p7J7e39hi6lQ6PZyAu9WqefZWE6CUFu?=
 =?us-ascii?Q?QOooioa0OYuHYGAE8ks0LfSKUBHv9Q7L9lwc7ycGAsrD1JJyhVf/zt1g7a3x?=
 =?us-ascii?Q?TTfKFn+9g69a0XFFinj6ALGlYwiCX0GOJGDFVsZUNyyazgVUMVg20Mr1afV8?=
 =?us-ascii?Q?3dWFv3GSSuJOWIbaNHRcALxo/t5PsvF8ALfHiHfGD18rVKMYojXjpuT3Lvbz?=
 =?us-ascii?Q?onhkieqrcvQxX1l+c6jx0HvlzmFv/DISoxg4f5UtwAHd3E7Anc5HNOOZv9Jm?=
 =?us-ascii?Q?e88cXQxHzAUd3vtLVEfaX50Fqt/8+rHLyWBiNUlN9ZpYM8iJgIM2EodnjWqN?=
 =?us-ascii?Q?v7hto8TP9pKWW9EfI8PBrmYTSekjh41/1sGKmlU+SRZgdjaje73nBb8yAJfO?=
 =?us-ascii?Q?99iSfkbEjzOAlyxLqiebENs9htmHu487cpRYGA/EFvqJRwzsLHFUowQhqdcF?=
 =?us-ascii?Q?39wO3u+EcsNGMWQ+tKtw62DpZA1QP4RdZrr3Kw9y0VKpykM0fqenhwxeXt4x?=
 =?us-ascii?Q?MjMwjGW7K4k1QRQq4aKaTQN7UtAitiCGSPy7Ti84/2pryCq0UiQQrH++foK7?=
 =?us-ascii?Q?ku6ew3T5Ym+JR4GwNaKoS0naOpBfXMiQHxjc0IRKFW1QFTGlrD8I7EhsvznW?=
 =?us-ascii?Q?bHcdcrFhA0bM8MGt7n+1mMV8J9DOXRZmZdDtFzbYMAI+ZLQ21Ilg3mwz6nd8?=
 =?us-ascii?Q?3VAWF+dyjTzVRFADPXliLk3A765rCset2ZqWJ+IPScs/bjK57e8aazBfhbGZ?=
 =?us-ascii?Q?2XFCDVFrcoNH7LjjGSZHqw6WMLU4zQAOE9WJCdOHhGiw59h0vZAcgPEhcocE?=
 =?us-ascii?Q?iOfEe9sB1KZ483mH6TJo0TCOOHY1REg4HgG0ivCEwXHxilnnHhlyPePXV3NS?=
 =?us-ascii?Q?m1/Kk+yllcBoWmjoQBQYXrpsUcY6xmj4JqgNtMLPrjc6lXuwDotbPMcrPTAf?=
 =?us-ascii?Q?h6VtFQNjLau10Nj2iAFBYnnINu/6A0gl4tUbHaYGAjRUXv+2aSBqKdm+vDBc?=
 =?us-ascii?Q?Kcv9SKQFbAXS7uBXYoB1hiM0jtRUcOMhaBcTXPb5YmTDcdjpqB2PZ5qkMvHp?=
 =?us-ascii?Q?UBZyDNrSJyFJu66rjo7o6dHua1MbaPPP+ZM8fhCa2exBxhML4xmjhx1z0Q4I?=
 =?us-ascii?Q?cC11H6mYbSruuWBWb9Cxa+u9QzjbJtWNHoiRoLZbfFqdsHJJPjw5cT7ck8lq?=
 =?us-ascii?Q?MrPoCaBUagXH0jazIhvdv2x/R8SJHVZQLupjpoE4mlzAft+Jo0TaPtV2xxqg?=
 =?us-ascii?Q?1q1CRW8mEWWeTXFgebZFtaI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ff0c8e3-365f-4838-ca88-08d9b57c25ef
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 10:11:46.8352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 igsIgh2Lhl139pKJbjKdgUgl93BHHUSzsBxHq7Y1FApN+avjFElT282IO1MSv0vHnio5CqK8Hjf7pSr3UyVRqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1374
X-Proofpoint-ORIG-GUID: bCpEzcUyJDjk-R_Xjw936wL3gOj56XPe
X-Proofpoint-GUID: bCpEzcUyJDjk-R_Xjw936wL3gOj56XPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-12-02_05,2021-12-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 10:11:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94178

Add slapd-common.o as dependency for ldif-filter to fix the parallel
build failure:
  ld: cannot find slapd-common.o: No such file or directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...if-filter-fix-parallel-build-failure.patch | 32 +++++++++++++++++++
 .../openldap/openldap_2.5.8.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch b/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
new file mode 100644
index 000000000..b42bd9764
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
@@ -0,0 +1,32 @@
+From 9e4ccd1e78ceac8de1ab66ee62ee216f1fbd4956 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 2 Dec 2021 11:38:15 +0800
+Subject: [PATCH] ldif-filter: fix parallel build failure
+
+Add slapd-common.o as dependency for ldif-filter to fix the parallel
+build failure:
+  ld: cannot find slapd-common.o: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ tests/progs/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/progs/Makefile.in b/tests/progs/Makefile.in
+index 13f1e8be2..e4f4ccf98 100644
+--- a/tests/progs/Makefile.in
++++ b/tests/progs/Makefile.in
+@@ -56,7 +56,7 @@ slapd-modify: slapd-modify.o $(OBJS) $(XLIBS)
+ slapd-bind: slapd-bind.o $(OBJS) $(XLIBS)
+ 	$(LTLINK) -o $@ slapd-bind.o $(OBJS) $(LIBS)
+ 
+-ldif-filter: ldif-filter.o $(XLIBS)
++ldif-filter: ldif-filter.o $(OBJS) $(XLIBS)
+ 	$(LTLINK) -o $@ ldif-filter.o $(OBJS) $(LIBS)
+ 
+ slapd-mtread: slapd-mtread.o $(OBJS) $(XLIBS)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.8.bb b/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
index 07d9fe6cf..17e6f72dc 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://initscript \
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
+    file://0001-ldif-filter-fix-parallel-build-failure.patch \
 "
 
 SRC_URI[md5sum] = "86e3ffce4adfc57cbb76ac0ff48b2614"
-- 
2.25.1


