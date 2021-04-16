Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.60])
 by mx.groups.io with SMTP id smtpd.web12.1274.1618599713333476932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 12:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bHTugJef;
 spf=pass (domain: windriver.com, ip: 40.107.93.60, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZGX9vDc/23Rh1khbt7FQ0dcF8kbHxBlTozWYqVIWpTMcRlg3oDnc7NCtxg1nSBH5y3uFaZJKIl+aR6FfIibrlRkHxVEYuncZMCCcM/Cqd9erZhsIDi7C0FYoa56fZqjE7e9VP2mACeHHnnyqCqjWhWaVQNtwMuJxcfkVNaBsjKepEQxyeJ72XEVMRCo29FU533ErJrrLLNh049uux1TRRGtWc8ame50s6COjNRm5w1HsWEjzEWkjxPv+WpMHCQMwAHUIoLLYRV3qO6wn+KbgKgRKlNQbwoNyaFuiqwiurlXDi5qLxdHV8xUeVacDANrX4pX86YSyCrSohX0nSJE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0+qCOH5HOV3VZv6GFqp14Tf0lhQSTAtoxf35NqbGdE=;
 b=GEGLgnFLGADNmvOs4oaQy8X3UIzHWixha0F25oy+7GsmOSsCg8Wein38HGrX2STTqdLZYHm7GQZUbidxketDlp6aMTFxKt9+LQH5s/BR3nqk9CTVcVVgDTuvV3vV3ASuXo1DrEpXklCumHkqrE19qynOHzhdSApg796MiQAl39GwZD0HbrDT+tGL9mwzqWIqi2k9HrJ7Rkb1FaleUyX6t09pPSPT2Z9gzKeWq1ZImw0VfYP1mAzLJrt7aINaPJfWVHHSBib43GQwgqG0NpATFi3UazUhH/WHvzabLxMTPlm6ZHNT7qReV9eqSAOl7LE7KTr4Zre16ImKR2vk10B3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0+qCOH5HOV3VZv6GFqp14Tf0lhQSTAtoxf35NqbGdE=;
 b=bHTugJefoJu3vyumOD+mF4rqBv4KUCDywibuitQCj8E0pngsWNGdNPb8tQmSviq/fPd07qkxbsGABtXyNMzOEArAwkASRGGOMwIy6MVpCI/lCDW5O8xBjuw4KGGXlogWIXrPKiYDpM0uTnyGXIYcwJhUgIYrzkLLeRsjr/UXFaU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 19:01:51 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 19:01:51 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] syslog-ng: Drop an obsolete patch to add --enable-libnet
Date: Fri, 16 Apr 2021 15:01:36 -0400
Message-ID: <20210416190136.15774-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::28) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend Transport; Fri, 16 Apr 2021 19:01:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fa0a7b8-8596-45c8-06e6-08d9010a1796
X-MS-TrafficTypeDiagnostic: SA2PR11MB5114:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB51145D0651F215A4168AA5DC804C9@SA2PR11MB5114.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0W1tAAPxhRjl4DAZVohGegYxT2vYbEkACoW/bE4EPyY5f1XFcZsIvpm1rvv7D0QhgnhNg2tUPPeioVQACtENnWwBSgF561PQxHdGBhQmOvRuZAocWJKs1MiOLRAVTJfWchGKymytRE8VPDhqr2l3A2aq7oReTfi45LHe/mfw4Yab0bPSa5DAP3+qltrfeQUjqYnVxvHt/n8b7wO7SvIFRzcReZNlDYypJZ+mjhNxAgeqBvId6nZ/gKbfM5uwAUUoUyIY42+L65URTM/wkUs6UUnGZAwL3DLGK0HCHLGEid63uyeqS2CMzLsbrHkJE2FqFOebRy3qcLWxxWZlcMHPGI9bnhnQWaEbvDTQveTu5a7Hk/mhUJ3JpUdZIqbYm9Maosg1ZtU0RV1DAq1T6Si01n4viT5yXq2SitnzJlsTi69fLMQ2OcwAeI9bltrE2VT1OGwgcyLOBR1HvxC3MjDkhUb80yHjzNbrMgaY3EnGJ67xSntrSQlEEt2DCaiw0ZSiRhpbum3MjjvP+CUPxSGjjI9d8s/ToajE0vUuqtqXQFGwAeFgl+Pfj1BeQMoHtZ+U+X/NazS9qyJHRrHA1FrV1vOeZVV+azYdnieGJZCbfg4FmAqZOKvRzXkVsuopNmjjIGHnO0zHKPgu/yXrPIAQAYv23QyjU7IMKECY1L4ZtTN87JFpW6NFZveTLD2/VmHbeqbaOHR2h4ymGylsdX3oV3HP3iVYIDDuZdBm4sN14WI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(186003)(478600001)(6666004)(16526019)(6486002)(38100700002)(38350700002)(6506007)(52116002)(6512007)(5660300002)(36756003)(2616005)(956004)(26005)(66946007)(2906002)(8936002)(66476007)(66556008)(86362001)(6916009)(83380400001)(1076003)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?FsyB5rfwBCTtNkBamhgR9K8L8Mms3+IF0STsxvciFTqD9DtmcV8T67ebfSrK?=
 =?us-ascii?Q?kx+gPVqmJ6Wc1AInuEaYNmSoZAgmLYyZHv3bhGLu1lNB+w9zBYLibZAy6l9d?=
 =?us-ascii?Q?6vlic73LPMuauQWwqXmwsUJ7vFywSkjmuzgWyUcs686JmTcd/hDKiUEIiuKX?=
 =?us-ascii?Q?9J1m2SmxR6YiUcS3ss25EHVoMkP5YCGRzl10ce+bzY4ZI62reBIgGXE+arHd?=
 =?us-ascii?Q?PY0lsEN19qMwfCuQWROqV8h0hEVydx4vwuAnzt8UdusmAbm3nXYcVggub8lt?=
 =?us-ascii?Q?4ipj9aiMo7lO/RPwqlClz4m2uZHFlzOsDLJdhbyfFBUdDaVPyB+LhceyJ9oV?=
 =?us-ascii?Q?i8PuWmz9X44zkzUsIYxQ3I3BPt1v/4H9tOxSmQ/I9Jmwth8jkxd+mXpmq6DO?=
 =?us-ascii?Q?0t8fL5saetdkh5XKX+XZB8XtdG7gVqvTFiCi5m2lc+0cvu7K6yTb4chq4c7+?=
 =?us-ascii?Q?uBlXiSx73m2J+cIzQIzF2khllcMUNEPf1DajhvzHrRzkjL6GM2tLdU+oWM8l?=
 =?us-ascii?Q?oRDRHUfw2Sd3RGWDu84UsyITwaH6pAnlZAJIh2MwhMMVYlk26kKBvlWyxfPV?=
 =?us-ascii?Q?akbKZjizXTGFjjhi9NGhT4ngb2hrfScvZxTq1KOuVGcLGEk3bEFVHBS+lXEb?=
 =?us-ascii?Q?+925LO6tDGMtsVMa9o4c/H/d121f+O5KAy0mQ0lAoYljHi2thEdfbS8n0/Bd?=
 =?us-ascii?Q?Uh5KrrtGfi6eY+uxsuMX2CA5CoLyu6Jtc6LeJJKZiRv7plFXKudhdbwC8N83?=
 =?us-ascii?Q?wySnA34u7eiZTAJfaPp2VO2Q72xHeBV5D4sfo3/ObDBWPLBAwGt7Blwmen63?=
 =?us-ascii?Q?Rangr6Mi/4i1yvz7lXx/rgRnbd/mE1+v9a7iklwAQilbi1idbdS1MRTbC+aX?=
 =?us-ascii?Q?w3zgKqZUwMTkhj62t/rdb0wwnMHMjaCbqVkl9Zm6a3bV3QnFQRqK63XOXJty?=
 =?us-ascii?Q?t7g6+g235VRq0xxiotBBRGwZ+L3FKDfzzyyBD1zJ86lnMn5TgEjoOYahSOd4?=
 =?us-ascii?Q?h6qEB/NujaJk0PF6i4akpEwlT0e192hMlnR/N+BQDmg3zxYvXzQIwRuuuK7y?=
 =?us-ascii?Q?LWh9GsjxjVfUsAXbqkzEmlSSWrSYLfeS8MSYVJ/v3M+E5rIlsuxn6Js9Mv1n?=
 =?us-ascii?Q?e21x82Ppu6PawcxeU/AuKA3egWo0breY7pxFTCqoJ/x5jdnoE8amZK5zz/1e?=
 =?us-ascii?Q?QppGRHZx6BPd12Vmb4loKok7WFCIrNBtSN6e3PVqmfkjesVOL08UtHpMbFWp?=
 =?us-ascii?Q?G0Q2lDGyQmiJjmmNilEEfCFVz7z2vnF2h2KeThZlIrYla9hZDE1fo/3UT1OL?=
 =?us-ascii?Q?9752nYEBeezgLPWrZD+g9JJs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa0a7b8-8596-45c8-06e6-08d9010a1796
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 19:01:51.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMv6nt9n2cM2DNR61Q64CkzWTKEKG0V2+XaM5EOyWAG+w5Mgo8Kw2m1atZeEe1QFjENH23Aet+Ostf0HE1Farg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Configure will work correctly even if this patch was removed.

Adjust PACKAGECONFIG accordingly.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...onfigure.ac-add-libnet-enable-option.patch | 77 -------------------
 .../recipes-support/syslog-ng/syslog-ng.inc   |  2 +-
 .../syslog-ng/syslog-ng_3.31.2.bb             |  1 -
 3 files changed, 1 insertion(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0004-configure.=
ac-add-libnet-enable-option.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-=
libnet-enable-option.patch b/meta-oe/recipes-support/syslog-ng/files/0004-c=
onfigure.ac-add-libnet-enable-option.patch
deleted file mode 100644
index c9eec65e8..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-=
enable-option.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 57b509adfb7c62bbf55ea1709aac3383cab660fa Mon Sep 17 00:00:00 2001
-From: Ming Liu <ming.liu@windriver.com>
-Date: Thu, 17 Jul 2014 05:37:08 -0400
-Subject: [PATCH] configure.ac: add libnet enable option
-
-This would avoid a implicit auto-detecting result
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
-Update for 3.24.1.
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
-
-Set it to default yes
-
-Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/36=
50]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- configure.ac | 35 ++++++++++++++++++++---------------
- 1 file changed, 20 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7aad75f..d575cba 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -144,6 +144,9 @@ AC_CONFIG_HEADERS(config.h)
- dnl *********************************************************************=
******
- dnl Arguments
-=20
-+AC_ARG_ENABLE(libnet,
-+              [  --enable-libnet      Enable libnet support (default: yes=
)],, enable_libnet=3D"yes")
-+
- AC_ARG_WITH(libnet,
-    [  --with-libnet=3Dpath      use path to libnet-config script],
-    ,
-@@ -1073,23 +1076,25 @@ dnl **********************************************=
*****************************
- dnl libnet headers/libraries
- dnl *********************************************************************=
******
- AC_MSG_CHECKING(for LIBNET)
--if test "x$with_libnet" =3D "x"; then
--        LIBNET_CONFIG=3D"`which libnet-config`"
--else
--        LIBNET_CONFIG=3D"$with_libnet/libnet-config"
--fi
-+if test "x$enable_libnet" =3D xyes; then
-+    if test "x$with_libnet" =3D "x"; then
-+            LIBNET_CONFIG=3D"`which libnet-config`"
-+    else
-+            LIBNET_CONFIG=3D"$with_libnet/libnet-config"
-+    fi
-=20
--if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
--        LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
--        LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
--        AC_MSG_RESULT(yes)
--dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can c=
ause warning during build
--dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fi=
x till
--        LIBNET_CFLAGS=3D"$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
-+    if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
-+            LIBNET_CFLAGS=3D"`$LIBNET_CONFIG --defines`"
-+            LIBNET_LIBS=3D"`$LIBNET_CONFIG --libs`"
-+            AC_MSG_RESULT(yes)
-+    dnl libnet-config does not provide the _DEFAULT_SOURCE define, that c=
an cause warning during build
-+    dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just =
a fix till
-+            LIBNET_CFLAGS=3D"$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
-=20
--else
--        LIBNET_LIBS=3D
--        AC_MSG_RESULT(no)
-+    else
-+            LIBNET_LIBS=3D
-+            AC_MSG_RESULT(no)
-+    fi
- fi
-=20
-=20
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/reci=
pes-support/syslog-ng/syslog-ng.inc
index e48e5d5e2..2ad262841 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -50,7 +50,7 @@ PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,,"
 PACKAGECONFIG[systemd] =3D "--enable-systemd --with-systemdsystemunitdir=
=3D${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunit=
dir,systemd,"
 PACKAGECONFIG[linux-caps] =3D "--enable-linux-caps,--disable-linux-caps,li=
bcap,"
 PACKAGECONFIG[dbi] =3D "--enable-sql,--disable-sql,libdbi,"
-PACKAGECONFIG[libnet] =3D "--enable-libnet --with-libnet=3D${STAGING_BINDI=
R_CROSS},--disable-libnet,libnet,"
+PACKAGECONFIG[libnet] =3D "--with-libnet=3D${STAGING_BINDIR_CROSS},,libnet=
,"
 PACKAGECONFIG[http] =3D "--enable-http,--disable-http,curl,"
 PACKAGECONFIG[smtp] =3D "--enable-smtp --with-libesmtp=3D${STAGING_LIBDIR}=
,--disable-smtp,libesmtp,"
 PACKAGECONFIG[json] =3D "--enable-json,--disable-json,json-c,"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
index cbd218c95..5d2b7f77e 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
@@ -10,7 +10,6 @@ SRC_URI +=3D "https://github.com/balabit/syslog-ng/releas=
es/download/${BP}/${BP}.t
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0002-scl-fix-wrong-ownership-during-installation.patch \
-           file://0004-configure.ac-add-libnet-enable-option.patch \
            file://0005-.py-s-python-python3-exclude-tests.patch \
            "
 SRC_URI[md5sum] =3D "69ef4dc5628d5e603e9e4a1b937592f8"
--=20
2.29.2

