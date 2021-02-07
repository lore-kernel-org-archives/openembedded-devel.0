Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.41])
 by mx.groups.io with SMTP id smtpd.web12.17907.1612685729407376513
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 00:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Imh1vocz;
 spf=pass (domain: windriver.com, ip: 40.107.93.41, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1UwD7uE3ZocB0ahZFZ8UBqA1q+c5lP27HuN6yeJL4cRVKFw31zNiiAb6L75IljMaCcqR8KTpAfZUKXGcHq0qjQlDzFy1qE6thyfRhcwxS8Rhop0A3zRN/qBbZa9GoM8QtgoGD4RyP+QLcIkG2Axxcrju+ETqU39Y5b7vcYkAcbl+NDtVgFyP3ekYFv4qmfHWsMMBs8O75ivRey5plno75gTBNmC4U43Y6oosllpwZS57mVEn8Oieq9dC5wBH1F3F/SLSeFN8UNbcX5+H1znQu8e6aCneq6AesfG/xkJfSBxLOGkQFqOB3Yhi1lzAD8C9KjCB97TzbVLsCSFNjzIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcoDzdH3topereyjRwH0xdmwFR59uk606hF7kEy2Yqw=;
 b=TaY1kRK7fP4BsnekrHiMggUDNep4rLnN9QlZLMvyvtQgyfbr0fMFxQ9MltE8yodrxThoNzC16C9lgAz1vSAEht+GYvAtJ5pR5IzpjPFsr5jsaUIIV+JGriXBdwArlGiC+v+Waoh4AEzQ1FCWCNjWLGthK9G2ZRibOAGRvwjmRuXIIeTBZZ8p4UuZPxue1s7gnKXY5uPNmHKG84ezgdoJ5fOBTlIrM9DZdfjYXOqM8ltbZd9gnktgeVC+AvclImOt2sVe2kw132Jd++sIfbVL9EMLb0rH+PT2W4AhFSjCdPEvoAXEPzpt2sLx0LIJ5pVya2OyR/femez46o1TKO/VHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcoDzdH3topereyjRwH0xdmwFR59uk606hF7kEy2Yqw=;
 b=Imh1vocznMWeUHea9PFv91V/T4oO1LXiFg6+5p5FQVMeVX7CKnhGSfVP4CZ9lI2Ovfkz4baycX9bx3LCFob/ohr81QlHZGRpDnwG9ClqtsfyBG81BOyv3NKlyFEVTn3OTSYPMnuSGl5klJPn/jMwoIprjHIu66XAVsylgSGk59k=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB1771.namprd11.prod.outlook.com (2603:10b6:3:113::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29; Sun, 7 Feb
 2021 08:15:28 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.020; Sun, 7 Feb 2021
 08:15:28 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
CC: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] freeradius: fix build failure with autoconf 2.71
Date: Sun,  7 Feb 2021 16:15:11 +0800
Message-ID: <20210207081511.19888-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <166169060B501337.30502@lists.openembedded.org>
References: <166169060B501337.30502@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Sun, 7 Feb 2021 08:15:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ed96f1-194a-49a0-5571-08d8cb408538
X-MS-TrafficTypeDiagnostic: DM5PR11MB1771:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1771CC85C3050B407332CAC394B09@DM5PR11MB1771.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nzJohKTesYo9ALhqoqa08ZKsDG6nLKeUk+DhAIdet+SX+360gjvK8q1lx6zJCKZLWVDhlxRU8cfEtUfTjNFyyZDVQHZyiw5m8rkK+KYm0pC3Nop0TF5HrhLwwBXP5YD4afsmvJSGjAXFTtgH0IgzPHn163ya7X4J4JWnreMpZ6bKyUq45ZdQxalasH8ZJiWv26mpfRT1itTwaEqVwk4zQScdnzEsYR/4CZkxrYrP/RvL5up6m1CUrmp7OPe+rt4VVvUYOxSAGBZtE6n2a9kab+8BbWuougAymowle18ti9j87Zo7zv2fyh99jfco67lx7SrVZu/YYOM7fuys5Ce/DazcNHc+b3SHqCHU1kMWlV+8pYNUilN2f+bUeBto+FG6o0BR+U0/H+CiL8kTsVZPuQmUj5dkL994BOeE3tQXpXwj5TEK+qI64FZ8+LFXc6/sKss7hlysMs5u0IzMg+U7DeMXxx6TTnBzT3E++EDaC4nEUfQyAeyKSdHBNX0sbUTnn7HpXZcBMQEa1PMQGXqkXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39840400004)(396003)(346002)(136003)(4326008)(83380400001)(66556008)(5660300002)(6486002)(2616005)(956004)(66946007)(66476007)(44832011)(6666004)(8676002)(316002)(6512007)(6916009)(86362001)(52116002)(2906002)(1076003)(478600001)(6506007)(8936002)(26005)(186003)(16526019)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DG22aevT/CYBVyPYWshEKRrfw55/DNu4mNYqbx/ddwHYY4q9VEnxS85i1vq2?=
 =?us-ascii?Q?b0bJ8rGmC0DNEma0RBwKk9axiLhACbVsvmZiHj7zgIzVuiEghrmzL+BEJNPd?=
 =?us-ascii?Q?4YQy5QvxSn4+zquk2dS79I4lJ9rLHYApxozxv4IfGVSi8z6nMs5znVMbDXxV?=
 =?us-ascii?Q?or2UzAZ85l+Z2lAaHXrogMtsqXkbuzwr+7Sis/LGX7G9Lgdhhf5T17tn4qMx?=
 =?us-ascii?Q?QiKXKOT8ugrATmN5yLUKhP8G7jjInSlaOC2jTixh2HfxNCeLuUfZgthKaZax?=
 =?us-ascii?Q?v2ebNoOdWvXo3qDQ9bVuzw0+/yUnUXysBAXqUnAjghlh80TM0iqoNe4fHR1V?=
 =?us-ascii?Q?iBbhA6GZKTMj6BqVwTZ7XXvjOqUfahjCwQjU/HeSC/BtMWFXQvbArPUu6IVW?=
 =?us-ascii?Q?Bqwp7PQ7MRlQyiU+f7iwEXrOFLc2ydJhxgqJsZyXHvKHFt+U799lTPvNMg21?=
 =?us-ascii?Q?dmwC2gLCzgx5KYTPX3OjdROVoyCji/rqizotK2h1GvE3BBsVPyKBvufhV3pn?=
 =?us-ascii?Q?/mlTh7VVADJzuVeo8HAYKaR6xl+Ggh63vINVyMK91fDRplOSt2U7bEUzpT6O?=
 =?us-ascii?Q?iFvnrAH6W91HonP8R8+ekaHcLRs2fMssQbX/5KVEcUFmP+adODE4kBm4bh06?=
 =?us-ascii?Q?juz/F5zBFVF25609vziYIPatC4VQj1gcvxW9G0dOIeUlQZY5eUdSOfgO+0U9?=
 =?us-ascii?Q?wvQQoz0F8SDi2caSWURmcPhm2cMd2q4+uV68KiPPFF365K0zfUb7OuOXpkm/?=
 =?us-ascii?Q?EN+SY6F6CRMzVb5sMD6P2q664FIWeownGbAoi4RgWvZSSAilpSRerhZaQC3I?=
 =?us-ascii?Q?aff+C93vO9LyMyuuI04Gxv6eh9efx6inZhUTNSiO9f1+sb17OQOcwCxttoV7?=
 =?us-ascii?Q?icksvIItT9jyuBL/QW4Fc+0jOzdiiaY2nByKVFCd3MwKr0gF78j2cUUwdTtr?=
 =?us-ascii?Q?20A4OdZRGyGZf5TMp0EQ1EMihfKs4oVe01gwaWn/I9YZQtp7Ltfd70B96CEI?=
 =?us-ascii?Q?9yr77sDsSageRqVeI4zqtSkS68HK06AFKqbH6AQaHNcoDBo4rKNax45bzrPQ?=
 =?us-ascii?Q?SXu31Uh0WB3BR0AVKi2YX2b3GjtkTxcsD/n279kkodQmnDbcdTNNn1aPHrjm?=
 =?us-ascii?Q?CCR82Std+UwGkQw+xZVs9flbE7YYhorJ75g8F3HeIGMhzm7CDY2ScCR494KW?=
 =?us-ascii?Q?lGeXsRLWpjpiuriosX7qKO81yztwLMyuVJ8Oev0jepdJ7DtP0Mod6/gi5Tlp?=
 =?us-ascii?Q?EZHKugyzy3cnBg+pS4OIe30O8lF1tDlBG1bwSanXbU5m2pz1CLQR5RdU4g1o?=
 =?us-ascii?Q?7uaiBdSTXrMxVUXrI/CGAjxl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ed96f1-194a-49a0-5571-08d8cb408538
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2021 08:15:28.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9DlO9l0FKxekQc0xzWEq7wsOwajGY280pQvxn+H/0SpdiB3R0YMtnl/+BHTYqlJyr2gDYFAOc9i0JqdG6ouUhGkCobMYvjjUiHoDR1XEIY=
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

