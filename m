Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.61])
 by mx.groups.io with SMTP id smtpd.web11.1607.1609294311119443912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Dec 2020 18:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IHAo3zhL;
 spf=pass (domain: windriver.com, ip: 40.107.244.61, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U87DiKsjFLLYy60hn2HD5THr0Ab7sk+d2WLSEvUBXbS/xJ4/J/xlDmAZJj/WvwpUHYhCANVjRQdfPArnZgrQ2RVWR8ahVl/9XjIa2HlX+V1CZnQjgsLeMPSwlGr6kPSnV2SVgIzBHers472d/4a0SUmSZ/9o4khLChoPe2/mSnT6r3ku3b+v1R+Dtjxah0VmW2L4q9Yv5MGRI7csw4vWIeAs+hj0M+Ok1opgJCvT+WQCQbv4dmhOzzv8lB4wzgqsfIoqm16vwKncPONibc6QcbRoJJs/x4dn+wyZRn7Gc+ZXjZfENalr+TYyKIPi+A/l64T8UlA+ymMraJWQbZG5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWlZrK+I8aWI7Kvs4NcKq7O8d35eg6oWR1r0dw6es8g=;
 b=RdtjKxDJg079dLVP7Vs/Wx9tmUABCHuuGIl3ODCrRibh40Am8RKIOlunHst07v7nFqglrlyEkN8IrRdzooQd860QNATefqXZZqMmLCYyPK8ANkX1YVh5ggPbON3+5IYH23x21HU7wyEeffsPvOjbkrfokaIKK20i+zNDylrwXGXMOHNTO7TT62KkHcWPxGqg23xe5PIw9HNWvUUcxngjuO4Ut0tZiiCdu/pmiEsXDIx46GAJVC1nupD+JunmLxvvbgNEHo6P1D/YpmIB519mTX9WlBgZK+JzHVR20Rg/DnrAapXrC4AypAnC5bIM/3+xj/LiWVK4AwXcqcdFUclDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWlZrK+I8aWI7Kvs4NcKq7O8d35eg6oWR1r0dw6es8g=;
 b=IHAo3zhLLQV45Yt/ugmeco5f1getGFIsQg9Vs2AreHsQW0E4Jp6d0fqQHukZ3tAsX2owwo5o5sVko1/WrPrb+wTbFd09khaECiRdU0ZxmorIUAI5toRySViQsiKOi1fLt81tl7mb0sATjHIvqmdMZK5jqBxZAdEGlYQXBli3bNc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Wed, 30 Dec
 2020 02:11:49 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3721.019; Wed, 30 Dec 2020
 02:11:49 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: upgrade to 10.5.8
Date: Wed, 30 Dec 2020 10:11:28 +0800
Message-ID: <20201230021128.17080-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 30 Dec 2020 02:11:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae6ff572-f59f-404e-022a-08d8ac68440d
X-MS-TrafficTypeDiagnostic: CO1PR11MB5074:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5074F458128930B85297B2D2F1D70@CO1PR11MB5074.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YQnVRsIjtR+J1CRaHJMzStsPt4yNePIfP9Mi3uCcu+fplpdutSINxVn6W+YVyb4QjFmhwar1pK8YwCXz0Apwo5YjzOTNMfr5YUnleJsHZx5L4YBMkuAkwRAgoi1M4TdVfRYBwvSSjL+faVM1NI96IVSj5QqDOqLQcU12IPCGI9Mr3S0V7pM5Zyg5EySe6zqK7VIFIdbhDDjXWdYqFwXVo1r3Uthq0EP7mUpw5N6sKzbvNwpD38Wf9HactSXe8cRfDVvcj2vRUf6FEtBv1QHkS/bAECdYIgEp4MMgEt+b3cvTbb9od+6wQMwIF3/6XQXtlWI5Nzj0UoD5QL5c9if3OAY1ZgcxATxRdJ/BmM88E6wKIt1oJ2S3NtO+kyZuUjR5Hh20lema4JSiC/CMXj1w5eJxqLiTzD0lWbIkecvnahx906G+1eePVKXOaCnEAwlu08rdz3cmTg8KQq5nMaa9jQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(396003)(346002)(366004)(376002)(26005)(2616005)(8936002)(8676002)(86362001)(956004)(6916009)(36756003)(5660300002)(16526019)(1076003)(83380400001)(52116002)(66946007)(6666004)(2906002)(478600001)(66476007)(66556008)(6486002)(186003)(6512007)(6506007)(9686003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?sqkcVbDlSwPn7814pJ0r9S/tZb5zyolZB4aEUVB3I+1C2PnXelfikA8hxeVU?=
 =?us-ascii?Q?EATHI88vmqubQQDLx5srJnLg2j0JETgKWt8dh4hsHumQ0+MTNqPDfFwPzdHB?=
 =?us-ascii?Q?MjGu3xufcWpxyU0yYS/t5iBPnLVzfVR4tUZaTOURSRGENkzGmf4wM5nou1d3?=
 =?us-ascii?Q?W60qCrqcAEcncTO7ZXcMdsIJVkbo8a0MTtNljYU8oBoKiIATAMJs+jzxX4kx?=
 =?us-ascii?Q?V7IgXzeyrcmR2CdK0K96tXOZ+Jtim7qcgjI58LXeFaMdZWYAL2T7FfDA1FjF?=
 =?us-ascii?Q?MAo4jDCqIx+UdOQtdRjaUSXr4p5ZvrAHNnHeCLvLsBnGnbIbH8urTA3UjQJD?=
 =?us-ascii?Q?FXrxHvsiLQuBuD4Wrj40v7lF9qCMmdTT59STnqWPkpSJD7jaIxTHXAztLoQA?=
 =?us-ascii?Q?a0hFn4bmPoGvLNhv/LtgfSNNfyyISfvdDOqBFJYQCXufD51pLXPJ0LWdGh4z?=
 =?us-ascii?Q?f/K9dw1x7FhkdRepm/7QA7EYmZuUzVNquxHWCVel6JijYi4iM1z21Sauv8V8?=
 =?us-ascii?Q?XJ5qetxh+ysntkiUuRkPM5zgC23XOfx6+J3lSNtehvQh6STiur7+rHbu5kD7?=
 =?us-ascii?Q?zVtAT8mOnpSmGWp4N5Z4MZKfOS5egAfaeZjd27ITBgeUiT8IX7k71HTBSHO/?=
 =?us-ascii?Q?U9V+RFRStCvjlMooJWD6V8b8pLrjPZl4uRbipTZYCu+n1qbgoz2zEbvMVxBl?=
 =?us-ascii?Q?XVA6eNPjcjwQTqNAExwfuQnrlTfj+sE/osWoJiCVjY4r8i9hGQl7UhwVk6DJ?=
 =?us-ascii?Q?5K9SuD/ZctnkNO0T9zVJQUEI3OpHili9WNjJXlQBSGSZh5vTK6rlgS3JAAgE?=
 =?us-ascii?Q?OFP65hMxze9KN0TezsdwfjtAx2TpFR49kacUA7kgbSjKGCx1DLgJGoJDJPIf?=
 =?us-ascii?Q?WhzIWOSpH4tTZJomX+r4JmniRIYzuspi9O2STzp09TFGsKSl8BN/oLZuZ9HF?=
 =?us-ascii?Q?I6yFTek0ux/wCjABwf0I+/yy6EqdgLVtw/LCTx31eR3nKIwUu4Zq7ObIxeC1?=
 =?us-ascii?Q?Qxgs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 02:11:48.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6ff572-f59f-404e-022a-08d8ac68440d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGQfp7eRTrPkSmwETRljnqYcIw551dvHPIjpZejeZXZYDpQbQEG23ilEEb3IVebbbAs4AHQSULPR8swlZcddng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
CVE-2020-14812
CVE-2020-14765
CVE-2020-14776
CVE-2020-14789
CVE-2020-28912 (MDEV-24040)

Rebase c11_atomics.patch to avoid fuzz warnings

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...b-native_10.5.6.bb =3D> mariadb-native_10.5.8.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  2 +-
 .../recipes-dbs/mysql/mariadb/c11_atomics.patch    | 14 +++++++-------
 .../mysql/{mariadb_10.5.6.bb =3D> mariadb_10.5.8.bb} |  0
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb =3D> mariadb-na=
tive_10.5.8.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb =3D> mariadb_10.5.8.bb=
} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb b/meta-oe/r=
ecipes-dbs/mysql/mariadb-native_10.5.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc
index e3ce29761..5631f041b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -21,7 +21,7 @@ SRC_URI =3D "https://downloads.mariadb.org/interstitial/$=
{BP}/source/${BP}.tar.gz
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.pat=
ch \
           "
-SRC_URI[sha256sum] =3D "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74=
edfaf6013c45c4"
+SRC_URI[sha256sum] =3D "eb4824f6f2c532cd3fc6a6bce7bf78ea7c6b949f8bdd07656b=
2c84344e757be8"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/=
recipes-dbs/mysql/mariadb/c11_atomics.patch
index 36217f9aa..32c9818ab 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
@@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 27 insertions(+), 1 deletion(-)
=20
 diff --git a/configure.cmake b/configure.cmake
-index a355214..6ee595f 100644
+index bb3ad43..2ff4f19 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -865,7 +865,25 @@ int main()
+@@ -861,7 +861,25 @@ int main()
    long long int *ptr=3D &var;
    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
  }"
@@ -48,11 +48,11 @@ index a355214..6ee595f 100644
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
 diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
-index 3d8a20e..42f1441 100644
+index 6a3a1ef..e306ae7 100644
 --- a/mysys/CMakeLists.txt
 +++ b/mysys/CMakeLists.txt
-@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRA=
RY}
-  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
+@@ -140,6 +140,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRA=
RY}
+  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
  DTRACE_INSTRUMENT(mysys)
 =20
 +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
@@ -63,10 +63,10 @@ index 3d8a20e..42f1441 100644
    TARGET_LINK_LIBRARIES(mysys bfd) =20
  ENDIF(HAVE_BFD_H)
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 616017b..53575f6 100644
+index 4978d01..883a930 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -219,6 +219,10 @@ ELSE()
+@@ -220,6 +220,10 @@ ELSE()
    SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
  ENDIF()
 =20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb b/meta-oe/recipes-=
dbs/mysql/mariadb_10.5.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
--=20
2.26.2

