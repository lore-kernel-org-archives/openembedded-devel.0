Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.77])
 by mx.groups.io with SMTP id smtpd.web11.7707.1616728022742127530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 20:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Mm/AfqgA;
 spf=pass (domain: windriver.com, ip: 40.107.94.77, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbPbnONjS4T79W/AoIarDIMV7hLET0TAni5Ra3KeN5mr4FL8OvGdrsif6W7yJKSHQdNQhPqu+ZzRJABPNm22QGihElxu+2cAHXGw6hhvtOGZh+figHplyO4GSQirnujb2Yb3s/gEphxdjB1PWN3ArpY0BlO2TY1283m1ZWqQYuRmPgnl3TRK4sr9QBorj7XQlIXBItT+K0u7I28wthUDwkkEpK32zP30FRozRt6D0E6T4E6I50dhlIrB+sYsZ5edfbGAn95RIx/+DpDCjNQh4HlO7yMf3TPlCqTdGQMaiDHQz0W07B41BrnxH4Be/ISkFs+kAs3+w046YJYcs+Giiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60XsbdGrG8a7uGBbohGHdFCnzfYzTy+wM4JAECHGISc=;
 b=SmjIhlv7e4FfN9oUTRWMYWphIBt2x7OLXtFD2kJ69jDudECDprTqro3xnZxHqXve8Iko8WCYDbAU8n8a/xxCBBOYgHqSG5/adhdIq4WM+b0kespPIRZuaejzbQbcb+GDjhH22eRw2mqB1E+TgfMbI9T7sxTHmRK2ow7I+XTn6WZPoHVLMX5OguSZXQndzN1v360x4whJ7gwgbv3mQkvXlUmy6KfrELKor+M1eKfv63BMpiKLL7cCvSTfKah5x0AoYGaiZnx4tEkP0k3cy+Y5GzRlUOaSemliJ59Sh8xKGhDFqiiy2EChKKWuomgAi+L0oXSLC75HlVtM//IO0Zt4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60XsbdGrG8a7uGBbohGHdFCnzfYzTy+wM4JAECHGISc=;
 b=Mm/AfqgAj+80b9jsUZLJcsthAQZk8czXplytGCzey2s3o3wIl/Vr9J7h6HE1eL78KnMQdCjzRTSkVwf+Zr1ViR2WY3cVYXSYKfYJPRQbPgkqdhsbbWBtBoyDfStMED5EIJmsujWyqOA5hSefGuPs8w7ISfNqMUcOVcZO4yfCwdk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2989.namprd11.prod.outlook.com (2603:10b6:805:da::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 03:07:00 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 03:07:00 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rsyslog: fix some of the ptests
Date: Thu, 25 Mar 2021 23:06:42 -0400
Message-ID: <20210326030642.23095-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BLAPR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:208:329::35) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BLAPR03CA0090.namprd03.prod.outlook.com (2603:10b6:208:329::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 03:07:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d09ad642-bdbf-4726-8761-08d8f0043927
X-MS-TrafficTypeDiagnostic: SN6PR11MB2989:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB29895BDC7FD488A9BA90C5BA80619@SN6PR11MB2989.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DlsJ4wkJvCqqe+QQFoiGSLnzpacSEbw6skswKEChotYVuC0jWC4ASlWzbxrJbNraTW1Ety1psBIBSPMRLRY500Yce+QpLoPe4auOxFe3mxKVui1yFwfsFo1B18pewLkJ6sXI6x6CmLbVFENnXkr9Iqj85Iqv1UkgnmqoLMDGhlfxlG5Ts6jlLbvPlz/fkGnIO/qW6IUfPYcMc33l3XU6uRNsy9rhGFeE0YV1i/YAiR/DTkNIjPhOUrUYFbLJ4ZiJ/wBPbIYWHphBg3D9ZpAYK7Pi2FZKeCXerQdaFUSNyf2ibLaRP+Q94QbEECWB2E/bM98tkF9nb8+aoWtUwWPrhyV6t2/VNks5t017YeKvJFdV6HhGXiEg1PWBEW8PLZV86GiNJWrY3oZcBtebxlQdWeBRG1MyiYcDc2HBIhhzv4p/MQ7QbdyRiezNUI/bgi4pAfQK6yJUkoKYdk8nYF9+XFSgQnF18+BaBBidohyhBB3/zEiCQvKcEjcTPPvMKuuYB5B55cwX8H7Eue8Zt+3q6GLCvKifK7Hfzq9txvjhEyB+2qcTPDk95aRzkc9ngDRkSM2YJs8rT7VeqNZVICLhVG7IWcY57I9oXzRI/C3wYYZhWC78jhmaJrmDAR9gAK6CKrh65VLFNJzU/k5t1GXdQsuU1mxPAhnzzOwXRuZ9wC2yo7w7CuJBNb0SugcDzwmA5ev0Nl6ggIAjlsqhPj4dnyqaktJcZm9geXwzqnfJiS8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(66946007)(83380400001)(36756003)(52116002)(26005)(1076003)(16526019)(316002)(5660300002)(2616005)(6506007)(956004)(186003)(6486002)(478600001)(6666004)(6916009)(8676002)(2906002)(8936002)(66556008)(66476007)(38100700001)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ETFz7Zy0zBoQpDSdcA/xNeG9XUZsOMzHfp/YQuxraW3gKzvPRZyVSioDgL4r?=
 =?us-ascii?Q?QXSwutOnq3ONvFvzLxsAGzQhTbdqm8E6uKLXIKQTDYVfQpyszkbMkOWsMYvN?=
 =?us-ascii?Q?ED10a25eThC7y/OOtusUWm9IfwtwjJXysFPkgh3wFh9WJV0oArNotNLEgfFf?=
 =?us-ascii?Q?sM1RGcVt8t3rcFxrWJat5rkWTlI8rNVWb2+fKzTwkyUgEfa4wuF3cf6Uyp0i?=
 =?us-ascii?Q?okELCTeFS2EXrMnbCTtAHsYAsQoH/rX1QStIk2XHkIGxAfBTbjQTm+tIbN+t?=
 =?us-ascii?Q?n0yJqNfRwL1Lyrf/oOKwtUwWFlUWKThNsqE7AHPfa9GguH8yF1UyBkQU7sWJ?=
 =?us-ascii?Q?MqI9B3eBKpov7dwKc5EmTnUDibD8yV0fvrzUoGqMYahEaiDlubjR3jR8Rw2R?=
 =?us-ascii?Q?2T2kHvQdc4KKDnEW/J13R7ZgeHCWIMNt7WDqzJpjHBdT9mLnAgK87ZG00VqS?=
 =?us-ascii?Q?ddzQqs1qeh/nxNHp5daUkf5G20P44Q9HLdj+304C6E5MxskpYlubZRtSoHG3?=
 =?us-ascii?Q?LUHXm8qUsvjEMHG+hQsMn0pL4KuetqD6ifveSzjs/NMTlLgJ8L3FurTazKhU?=
 =?us-ascii?Q?oggARPZbaSMDS8bj7HbIEENTecNmAvx6r3zyPOh/KK3CNixNWWIvmuu3bonv?=
 =?us-ascii?Q?YRgpE04Djag5tfVnXR4nxoJO3nWQeE1BvNgQ/piCM5z/rBu0X3KiAOTm5eXL?=
 =?us-ascii?Q?soGSOtGw0gmAAIFhCvXkg48CXD0ZITHNyMIym6ZsLDsz/rfjkaH3imJln1u2?=
 =?us-ascii?Q?6YyRlnhZbPx4UBoAxlZWo84cIjUTdjlTrhw33NJR+bZmyBinbcSfiVb5+SjS?=
 =?us-ascii?Q?xcXYt17zWDKhcSLDiRziRlBYf8oTYqxjK9ZzLGHZXM8Y+EyyJOPckXpECxKL?=
 =?us-ascii?Q?DISoLc0ssV9ThZhqxrflgsS+/aXxqEXxd7sUa5TZmzNZmPMpHM4r07Y3X+57?=
 =?us-ascii?Q?8zoiPb8dDhW7REo8b5sAsX3Tvi1/Oiy2b6xUnhPvq3i1wJ1BXFv4VxAc4z09?=
 =?us-ascii?Q?ocjgQ9VN4viwwghEdzF80WvVt/VRJfa0tLeR6m2/JQEovt5hSsC0A53r9RvH?=
 =?us-ascii?Q?76Y8JAGgzRN/Svf+HcQ0UYa6KQYShHU7kZnZHldIuY0J2/XZgtfcZ6wHCZn8?=
 =?us-ascii?Q?4k6PjE774CFwaevUX1YG2sh8Ro2YmyI+BT7itwPPegjDLl3BmYNtYiV6YmWD?=
 =?us-ascii?Q?lXw65cat0ZXkMBmftNuVPpi2StHVQzptuXOXohco8gusLM9TdL+VatYB47zS?=
 =?us-ascii?Q?+Y8+YaDicjDaA0gZUwhvEBO402UZ2k2rdAoPUSvNt1vKZ/9ASSNb2Dc1Hf05?=
 =?us-ascii?Q?RPGGavvpmvWLp91tlZCiYoRP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09ad642-bdbf-4726-8761-08d8f0043927
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 03:07:00.4254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLz5NRRsv7QRdf3ZhP3DNwuzoDHwm2UNLxfozhveutf5k5xJ6yGvEivFdJvQwIti3YjAqiNer9b6Pry2abW82w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2989
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Run test as non-root 'tester'.
Add more rdepends for ptest.

Introduce a patch to skip checking for a libc header:
    sys/inotify

Python scripts no longer called with ./script.
Remove the need for to patch shebang.
Ptest results:

    8.2102.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
TOTAL: 424
PASS:  417
SKIP:  5
XFAIL: 0
FAIL:  2
XPASS: 0
ERROR: 0

Remaining failure related to relp:
* imrelp-tls-cfgcmd
* sndrcv_relp_tls-cfgcmd

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...-tests-disable-the-check-for-inotify.patch | 46 +++++++++++++++++++
 .../rsyslog/rsyslog/run-ptest                 |  6 ++-
 .../rsyslog/rsyslog_8.2102.0.bb               | 15 +++---
 3 files changed, 60 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-dis=
able-the-check-for-inotify.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-th=
e-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-t=
ests-disable-the-check-for-inotify.patch
new file mode 100644
index 000000000..221d70e63
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check=
-for-inotify.patch
@@ -0,0 +1,46 @@
+From 2d45f4b90bdc42f515764ae28bf62ab8fa23531d Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Wed, 10 Mar 2021 14:47:21 -0500
+Subject: [PATCH] tests: disable the check for inotify
+
+We don't need to check inotify.h.
+Assume it is present since it is part of the linux kernel
+since 2.6.13 [1].
+
+[1](https://kernelnewbies.org/Linux_2_6_13)
+
+(it would require installing the libc headers otherwise,
+ for the test  to detect /usr/include/sys/inotify.h.)
+
+Upstream-Status: Not Applicable [OE-specific]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ tests/diag.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/diag.sh b/tests/diag.sh
+index 0739bdb74..7a0176bd6 100755
+--- a/tests/diag.sh
++++ b/tests/diag.sh
+@@ -2679,7 +2679,7 @@ case $1 in
+ 		fi
+ 		;;
+ 	'check-inotify') # Check for inotify/fen support
+-		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
++		if true; then
+ 			echo [inotify mode]
+ 		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; th=
en
+ 			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
+@@ -2694,7 +2694,7 @@ case $1 in
+ 		fi
+ 		;;
+ 	'check-inotify-only') # Check for ONLY inotify support
+-		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
++		if true; then
+ 			echo [inotify mode]
+ 		else
+ 			echo [inotify not supported, skipping...]
+--
+2.29.2
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest b/meta-oe/r=
ecipes-extended/rsyslog/rsyslog/run-ptest
index aa698d85c..efa9ba3ed 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
@@ -5,4 +5,8 @@ set -o pipefail
=20
 SCRIPTPATH=3D"$( cd "$(dirname "$0")" ; pwd -P )"
 cd ${SCRIPTPATH}
-make -C tests -k check-TESTS
+useradd tester  || echo "user already exists"
+ln -sf /usr/sbin/logrotate /usr/bin/logrotate
+su tester -c "make -C tests -k check-TESTS"
+userdel tester
+rm -f /usr/bin/logrotate
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
index 22059d140..921124024 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://www.rsyslog.com/download/files/downlo=
ad/rsyslog/${BPN}-${PV}.t
            file://rsyslog.service \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
+           file://0001-tests-disable-the-check-for-inotify.patch \
 "
=20
 SRC_URI_append_libc-musl =3D " \
@@ -80,11 +81,6 @@ PACKAGECONFIG[mail] =3D "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] =3D ",--without-valgrind-testbench,valgrind,"
 PACKAGECONFIG[imhttp] =3D "--enable-imhttp,--disable-imhttp,civetweb,"
=20
-do_configure_prepend() {
-    sed -i -e 's|python |python3 |g' ${S}/tests/*.sh
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/*.=
py
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/te=
stsuites/*.py
-}
=20
 TESTDIR =3D "tests"
 do_compile_ptest() {
@@ -97,6 +93,10 @@ do_install_ptest() {
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
     cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
=20
+    # give permissions to all users
+    # some tests need to write to this directory as user 'daemon'
+    chmod 777 -R ${D}${PTEST_PATH}/tests
+
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makef=
ile
     # do NOT need to rebuild $(check_PROGRAMS)
@@ -195,8 +195,11 @@ VALGRIND_libc-musl_powerpc64le =3D ''
 VALGRIND_riscv64 =3D ""
 VALGRIND_riscv32 =3D ""
=20
+# util-linux: logger needs the -d option
 RDEPENDS_${PN}-ptest +=3D "\
   make diffutils gzip bash gawk coreutils procps \
-  libgcc python3-core python3-io \
+  libgcc python3-core python3-io python3-json \
+  curl util-linux shadow \
   "
+
 RRECOMMENDS_${PN}-ptest +=3D "${TCLIBC}-dbg ${VALGRIND}"
--=20
2.29.2

