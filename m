Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.53])
 by mx.groups.io with SMTP id smtpd.web12.17894.1612685614394933668
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 00:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ahpjucJo;
 spf=pass (domain: windriver.com, ip: 40.107.70.53, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6GNb2qYcOtKtFwivbQmxrY2z8B7TWgXAeXUGx5Se2jTMUpZSnk7hGVLgCpgShnnFpT0dJcI5DKDbniNnd7RjI10dnPOZoY8uscwjEwLR8FShXezGvycAH9AvGO+SykhCp+fLUofBiIsPtFhPaYjFlDm3PPocYHKMK2q5R3aLL025/30fMZMYbuNii+W5J8uLFg6M+2qJH94IzfgjxgypbK8qvE0iR2WNj7Bkr/GkZIx8rY0iSq+jW65kKpbH60q6Egq4/Xu228Q+huhjCrDN7h77w5jqzPWmV/gxh+wUTL8tEOVcsDDkRozSEbBRYHIAGUGbMC+hAAVlCF5Rboq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcoDzdH3topereyjRwH0xdmwFR59uk606hF7kEy2Yqw=;
 b=bOhR4iRUdMtxr+PlVwv6sTznsg0prW3NJ0nqAul0iq23waOWHmB/5PY3eRyrxEH1/odzGFpJUQms5Gen+RqPstq8u1+EMqle4fPbFo+SY0d3FLlGzzml3yDh32g9FCTuaZgyOkPdiZDLACA1i8lq22+GGZfsFAvBOvbOpxl/V0Y2uz1swSA1ksQHT2hJ8fadqeoOXXvHfbmDjvLf7ST5u2yzP/j6KAL/drp6CC194F+5HsdQnQ5+YYAkcG7NS5l+WD+72K8xryF1m/ZuD5MtiHNsZdXnmBC5LZZmzTKLZGO0b9xWRjHuk+GPu/bP9b7893hkho+wk0vfC4FaR90f9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcoDzdH3topereyjRwH0xdmwFR59uk606hF7kEy2Yqw=;
 b=ahpjucJoL7ZiAvhFnZosCVs52X5eqj8JubAa+XZErgIddUOaKG5G17w2GhyOnXPscfE503ideA6ji0s15nHC7xzMSH/B4tMIaEYjnziJd9HGNOqno2cezFhgcMuvw1HnlcM20U09aU81iqLZDMQSijbmFIsIiQhhEXoh7UFTrj4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB1771.namprd11.prod.outlook.com (2603:10b6:3:113::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29; Sun, 7 Feb
 2021 08:13:32 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.020; Sun, 7 Feb 2021
 08:13:32 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
CC: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] freeradius: fix build failure with with autoconf 2.71
Date: Sun,  7 Feb 2021 16:13:18 +0800
Message-ID: <20210207081318.12352-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0018.apcprd03.prod.outlook.com
 (2603:1096:202::28) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR0302CA0018.apcprd03.prod.outlook.com (2603:1096:202::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Sun, 7 Feb 2021 08:13:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90c2b703-cdab-4fc0-d619-08d8cb404210
X-MS-TrafficTypeDiagnostic: DM5PR11MB1771:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1771C6B43940CE55A8AE23BC94B09@DM5PR11MB1771.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+Ds+cn09+dKT5cIhvmYSwxyDfmV2IRwqqheVKGr+VDWMHlgSb09M8c9dlj+6BfJ2x5y/Nj0zrImpzzf/F6Q4B9TRE039FysNOsJ+t93MCBfmwf0AXkPcwE2OEtZqCGaFVKmZNb9SV2B/oBGMbXwAqLxj7sNK9Gpq6UqSg0CCHphyg3AOBo/ZmBOZaAw+YeNfNX3/N2FJCiNRZUaOpm+NBgN9qjWeJP+isNgv6gZfiXwyPANd4sVylUpFxf4iMUSIcK42VOgl7YSjLm6bJCxHQHgpmJLvfz7ul/m87ytcUVJ2Ra2dhRHF5/WNha/+eI5uccTCR04IRjqexC+S/cH6Izj9gcId2U2SEcHKCHm99pi7YgpV/8++y2MoLUI8CHM8+phHGpGGbkAgPrkKOr7ZH86wQ0BtVKJaHgJRs1DDWKa22yu5xCVyzCRZV7S8qliPL3KY86MQOvvpGG67F5FBpuhToH+TufHck74A7LItDW+QZUEweEKuBw2l6FaICt3WPCe5X92YsbMdKKBciWKXPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39840400004)(396003)(346002)(136003)(4326008)(83380400001)(66556008)(5660300002)(6486002)(2616005)(956004)(66946007)(66476007)(44832011)(6666004)(8676002)(316002)(6512007)(6916009)(86362001)(52116002)(2906002)(1076003)(478600001)(6506007)(8936002)(26005)(186003)(16526019)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XoYoaK+PHprhjsvZPB9XFLx5Q7MIC7ChRz3AcEeRlz8E6eR1GTtld0YqhAMN?=
 =?us-ascii?Q?vK/C8bE/NUKJarfCC0AAswR+MmbCULQqa72RsDDdT/0pVVpC+L8PXF/DpP37?=
 =?us-ascii?Q?sCeOYYy6MJZG4xylHt7Z//6Tufdci2liZGxYkSM2M6W9qv5SuLvOaljLJxMx?=
 =?us-ascii?Q?x8Gir2NNHYVw1hEtSh40T/F++SMPw+649Dl8VWQzn3y6HZuqT01q0hGUMboJ?=
 =?us-ascii?Q?7NfR3v/zwLo8snHA6aOG/NGz3EcfGJEwTrGx5m8JQO3YDBk+zbKox8bAheun?=
 =?us-ascii?Q?DSIgYCy1mnji/9pK1nMqygTveqYMRu37UVYZPPqo61Shd6hkyEVKgWxf5Ezg?=
 =?us-ascii?Q?kp8aQAhcXJ3iWSsYB4RgoWMd5yGPo3rSXw+Rk4yio0zJ+YoG6htQDHZ/ABG/?=
 =?us-ascii?Q?oWLGcgavbxR24+wLMbM5c5oGeG7HsA+hm7h+04cKhj7JH5YjUs+eL053eB/u?=
 =?us-ascii?Q?sFO1ZASvd1+RNFfjers3nIBzvaNbOkPpBCdk0hi6rxLucCm/5ulwCNcYSn6b?=
 =?us-ascii?Q?h7BXEJk/JA0pcOkL/4RSpXlzYWD56s74bueiYeXoZM70zNMANt2+hiTzRcXg?=
 =?us-ascii?Q?Cbhs+hdADxA+SI56Zsf7pLcNvBKlUScv6vA30SmO3uOb9vheBgUo296m24/p?=
 =?us-ascii?Q?jU6ReWpaYYaaw/KsQWDo+BS/yPr02UIA0YJKIKYbY/Ni1LKzSdd+WozjNrXA?=
 =?us-ascii?Q?1ccDhl/ZxYRKHTmg3lYHCBobexmkVFMEwkL8GzEZWNENCQq9URWtX26BFhHJ?=
 =?us-ascii?Q?fQOP6sUVOUZBysK20kOUvKT8CfENnFqHG534G2/Mt4gJE819IYKE81lnBeNx?=
 =?us-ascii?Q?0mhu8DddxOimzls9wQMh/oMsn8pGmy+FGGmqiZcJHJXIV2hhFkQxAniHsTNx?=
 =?us-ascii?Q?9wM7mquKEXxp/gCd1kf99FjBjVgaGCHb0v5D6e60CJLjqQuV72HxWbuDV1kC?=
 =?us-ascii?Q?AT97iD3Net+mG36WjC1DIZDNrjhp1y/BrM67pFSubNmPQ1/yfZZITbIPJ+qc?=
 =?us-ascii?Q?OWbu/WTuHuBozu8B+1xdcUzKvDm3Ogdabc+NH9N6+FYfVfhUGRNfI0L055eK?=
 =?us-ascii?Q?rCfKglaHGWcPSHy2WEi6i6Q+ykU4fBCWpv7MmwMEtixYtD7qzd0h7Kqsnuhd?=
 =?us-ascii?Q?w+RVW/ju/J55NqZdwgY2sll3xhyikHVGytolpa2GOS9Qm4sLj/YJ+QZf0RYw?=
 =?us-ascii?Q?7UKm10vDfeypHv35fFHD+FwSJP4X28lZVPAS8nJFNG2n4CVtLkPwlPwnp0GC?=
 =?us-ascii?Q?51+9LzHvEf14RY4oZCgTQUmt/W7vZAUQP/Ihfvt3dfrTtAtqO2xQrcPqyRcv?=
 =?us-ascii?Q?/zGrBcu2B/4COO68nEDiWF9/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c2b703-cdab-4fc0-d619-08d8cb404210
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2021 08:13:32.3528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lzadPcnw5LV9QtliTKklBauOZ0i7Q76SmxddS1suRABIT/gTYNBNLjx+kROIfC6wYXuRaUDW5A3ZcguCn8zfbKPD278YoRnxyqgJ87lLWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1771
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

While using autoconf 2.71, the AM_MISSING_PROG caused unexpected error:
...
configure.ac: error: required file 'missing' not found
...

Since these tools were explicitly added by autotools bbclass,
remove the testing to workaround the error with autoconf 2.7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-workaround-error-with-autoconf-2.7.patch | 42 +++++++++++++++++++
 .../freeradius/freeradius_3.0.20.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0=
001-workaround-error-with-autoconf-2.7.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-wor=
karound-error-with-autoconf-2.7.patch b/meta-networking/recipes-connectivit=
y/freeradius/files/0001-workaround-error-with-autoconf-2.7.patch
new file mode 100644
index 000000000..80c571df9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-workaround=
-error-with-autoconf-2.7.patch
@@ -0,0 +1,42 @@
+From 3b4ba29c7c5800df87eecd65214244619e01162b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 7 Feb 2021 16:02:36 +0800
+Subject: [PATCH] workaround error with autoconf 2.7
+
+While using autoconf 2.7, the AM_MISSING_PROG caused unexpected error:
+...
+configure.ac: error: required file 'missing' not found
+...
+
+Since these tools were explicitly added by autotools bbclass,
+remove the testing to workaround the error with autoconf 2.7
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 609efb104b..2d761cf62c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -693,14 +693,6 @@ fi
+=20
+ AC_PATH_PROG(RUSERS, rusers, /usr/bin/rusers)
+=20
+-dnl #
+-dnl #  FIXME This is truly gross.
+-dnl #
+-missing_dir=3D`cd $ac_aux_dir && pwd`
+-AM_MISSING_PROG(ACLOCAL, aclocal, $missing_dir)
+-AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
+-AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
+-
+ AC_PATH_PROG(LOCATE,locate)
+ AC_PATH_PROG(DIRNAME,dirname)
+ AC_PATH_PROG(GREP,grep)
+--=20
+2.27.0
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0=
.20.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.=
bb
index 2c39c4c44..608d66b1b 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "git://github.com/FreeRADIUS/freeradius-serve=
r.git;branch=3Dv3.0.x;lfs=3D0
     file://0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch \
     file://0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch=
 \
     file://0001-raddb-certs-Makefile-fix-the-occasional-verification.patch=
 \
+    file://0001-workaround-error-with-autoconf-2.7.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
--=20
2.27.0

