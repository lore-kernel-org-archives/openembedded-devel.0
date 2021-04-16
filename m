Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.63])
 by mx.groups.io with SMTP id smtpd.web11.826.1618616233313772368
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 16:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YWS7Qsux;
 spf=pass (domain: windriver.com, ip: 40.107.69.63, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx129PG79wCRnvyXXykkVcMqr2ujAmnZze0jcl2JNQDSj7E4i7JziV5iMA9yrcpteRP9Nfk0ihn18PTd7rYA8Kw6aJ2hpMJMvRh7dQ726DSwbL8LfY86PAgXgiQsq2ZoyINzPYCTErZVDWIHM3WJ8ppPs9zdJjI3MFMnTnK81Qnpeu5JebnPA18K5fBxLNteMPgsg/7VNiDhBPwVVCqyNVLAjaYg6CggvHjush+Wg6dHrTrySqeefgyQhclJWicj90xnXpdFYVnJ/JJu0t/hDBs1gYGWleXCJvh+hJebjJt5uxebpdmWLTWRwXIGgcX5dEskSfPgp42+2D0Sil0PVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8WQpxfCI9RJsDKYY1L2SJW/yS9u0ch6sOUVIGQpRHI=;
 b=KPRXVEZxP6Dgdn1Ue0JW0GAu8GD7ZNpf0W26ZXegDuNeRBC9WWTm8gDOqnm9M/KBlJQgsmYi96FG8QWu465RfkDUuitSqQWAIYPiQaCwM00LqwGxY07/dlCVI1dwI79+zKj3RSaL9EYsynW1R7adgkksHeqyOKOA4ktguv7CAZlHarEf3WT48q+WlAusqfFVebOnUePuFL8lUjxSlNCwFaINLIbKz+E7wffGcT8ga2ZpoL1Psw6adSCG6tThXZ56d8parX387XZvm2bxgy6hw9CGj/tskqz+miC9DrHJUCe2TW6oKo6VoPr4xrAD45rS0MG0yxgybkPjx5NSZTohbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8WQpxfCI9RJsDKYY1L2SJW/yS9u0ch6sOUVIGQpRHI=;
 b=YWS7QsuxzxhU/SrRG11TBlHig8aPvRu2XkVSR3EUqr8gPXWolNEsQSUY618V29oQ+1L3qoDre6soMuDPjo/WWJSZ87PdQEhdFrpmKjGIRlc4jTZ+i1s1fIMMcFd3UQ7hY1FRHE6F4yIQNIcMQfraTfO61CxtsWXH+hr9cKD+OkI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2718.namprd11.prod.outlook.com (2603:10b6:805:63::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 23:37:11 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 23:37:10 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] syslog-ng: Drop an obsolete patch to add --enable-libnet
Date: Fri, 16 Apr 2021 19:36:54 -0400
Message-ID: <20210416233654.13300-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <16766BDD45432255.24242@lists.openembedded.org>
References: <16766BDD45432255.24242@lists.openembedded.org>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTOPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::41) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTOPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend Transport; Fri, 16 Apr 2021 23:37:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906b870d-282d-4ad7-ed42-08d901308e19
X-MS-TrafficTypeDiagnostic: SN6PR11MB2718:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2718045948FF6A2ED913E36E804C9@SN6PR11MB2718.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eClob97JOzj7cDUzIzDQhmVtEgXrLBKnFOIoo4zI/nRbODDQxvbPzrghLivVCMxEZPGiu0oB1aOuZt8eTDw6XM+S7S9Wv7ASl/vgazO5IFbhpP7B86m7F1NsExBfJeLK15bG5UM8bmxeF9797vlSvOdybx0BQmzRVzh38XRyM0lMGskN5qL2+/jJPtgOstxhbpVhsw25XSC7D6BdwtFHQPLTrvYxm1HLnCG77lpOZr2jzC4hwD4m6YiKb8Qk5rDXzY3ycKxBGJdJDtKOEGkIxcyAZZyO2X+Lj4KQHcqwfWkQ8ZBi6+gcrym77H81K8DJoQwzMemA5Qd7BYSmtSLJWaU75vpvChDsryzvYPeuuXBgsVuN3iq41QeE8Yp0bs6BiZgYaB/HWXPvopRXOrGYZ9txJ4/FiDXjJtAaivAZ7xXaKl9vmDF2dQfYondq6Ca59XQqmx9jxRXq6CDDZ2kH3/rK8zPxQEjk+I209h8VgGSQ/tDq3vauFyMC5LL6CsAUgCCsiDERU+mBNWB1XovHlnsifMrMET8ILzz5NyCxuhMfbbBbPaB95za+xSpoMAfFJp6VJ4N/+TcvOuWivvCbsQF5cAL0SxJPo3NACJKjpwdtn6f+jeLJfQLvig45vL2bvolHqDKJJIrkHYve7BC5Mb0vhzVRpvIuJvQO7Keop7O4izdk+HBNNV7ANDaNIqLVty9mrb/ybR56liBq96U/S9eet/rwEgwijDYMX6SRTEU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(6512007)(5660300002)(2906002)(6666004)(478600001)(186003)(83380400001)(38100700002)(6506007)(8676002)(2616005)(16526019)(956004)(66946007)(66476007)(66556008)(36756003)(6916009)(1076003)(86362001)(8936002)(316002)(52116002)(26005)(38350700002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?xTTU4DLLhy8hxuhDJlBli2RycriKKoFYMueYICue5AhSm7aP49/5EZCzBKuu?=
 =?us-ascii?Q?L5quqsKK+lBopJ60uJYrb4nOdY2oQYVgp4Zz5kIYtF1yS57qFtO2EQSrAyHd?=
 =?us-ascii?Q?G1901J241qd2Nz8p1OVRa8Ne40B0dtYRUdPWx+Q7xtyiZFvu0+mQ5lhKT4eO?=
 =?us-ascii?Q?IZzMcq1cwRdlsaeskzgTu9o+o62gqzmBxnAYN1CSGi8nLPysp65zOUoVWAk2?=
 =?us-ascii?Q?ETgd772HeUi+jJBtJAaKcK+wVBXMxRHwtBkse5RK+hBm/58/I8sXlJ6EsI33?=
 =?us-ascii?Q?5aDxeNhiubgO+Vr03a8Gzjx6qCAk8q+GKryE1rkNYE+pzUwGMzXGAl+tNvS2?=
 =?us-ascii?Q?zDw/JOrSEp4o/b2zjIwtYONGTLp6JdAqtjanwxFnqlfLHAOcDaSgUVyA3f3t?=
 =?us-ascii?Q?d+1KgW1t/O6BWqg5Asj2+vb2Y8uoCcWcWJRJzus8jz9+bckwiL6Hxx/kZoYc?=
 =?us-ascii?Q?AngO/jOBX82dvKkxJHH89WR2i4fHRJrKLu9M2xUxTa/+jc76wzJn2rBsFbUc?=
 =?us-ascii?Q?BMvwuJ4EBXilJQtu750KVZV5ndkekUGgz9sjddCPpw8Ef4oF+lvSFqQ/0E2N?=
 =?us-ascii?Q?qDbJziFvjyr85/v0Fz82Gy4ufAsW0o/S42jPFPWeeqgF0/h1V1z1En9NZ6bq?=
 =?us-ascii?Q?Gvt8q2CwGyYQWtNrqlGH9NOPLHogjYI58PDv7CSPX2/wulM6SGUdD7XSN+pa?=
 =?us-ascii?Q?lxnskkJRo5SVmub94JiHkz8AJ00KBX7Ajff2bwbZfyvv62e0fLo1B9rgEcT6?=
 =?us-ascii?Q?ipDKdZlFhMPLh1fxKEaeQ/71LfjNL5F3MTCqHQYbPKvKZFEXLPcXehGAmvMS?=
 =?us-ascii?Q?olijtXdwGj203zghdte3NI/csYqyw/Drlzntcz6hr/JmKcNMhCr0pYnw1YY8?=
 =?us-ascii?Q?w93z49he/tYJoN57Lmryzpo39Veg2xwPiMNfP7RVkRwR0D/xD5DjhtANpdEu?=
 =?us-ascii?Q?tBbYw1umS6eHmG+ymrbroYfxtlaO7c3w+xXxlY7OOqR4PfVfIVMB003Hb3KC?=
 =?us-ascii?Q?w5zExkT7yrNuZJhenBR6v4/1n5pbsAuwb3hyrMxV9jGc3zy1uRUuVhqqvybV?=
 =?us-ascii?Q?8CRbWY+2ns8yUh+ima5LPA/EQEJHxp8c39PlvjUe/vWIuYWiCXH6a/6mH6uC?=
 =?us-ascii?Q?k5gabK2cv74JvJ9oSUhi4hQsoXyg7I3pPXU0tkOEYZnaBuUERBT00nSpsY2r?=
 =?us-ascii?Q?QSNOMftCbvKYhxRy65UVxjLu0P2Z4sI99y24/9njuzx+g0o8g+VBldD92895?=
 =?us-ascii?Q?g00SMX8L/rAMNJbtktkyFbSUP4D7czSN29e/LjbozQGQN+Ued0GsYsa7d7Io?=
 =?us-ascii?Q?qyDR4R2gnxLY1YbqMuBnTcu9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906b870d-282d-4ad7-ed42-08d901308e19
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 23:37:10.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlnC1MRv3Z5ZiAiQh7Ntt7hlWypH6AwMJvJAClCks3cOvQT9fmrcWbA5ALf8j21ZHrvwv/7QXhU/qjRAWvMFOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2718
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

libnet is a dependency to --enable-spoof-source.

The correct flag to enable/disable in ./configure
is --enable-spoof-source.

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
index e48e5d5e2..80c509973 100644
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
+PACKAGECONFIG[spoof-source] =3D "--enable-spoof-source --with-libnet=3D${S=
TAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
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

