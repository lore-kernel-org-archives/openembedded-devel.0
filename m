Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.74])
 by mx.groups.io with SMTP id smtpd.web08.5209.1604568643735845384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RW22prBE;
 spf=pass (domain: windriver.com, ip: 40.107.223.74, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNmIRg2jmjCVLouWni6bXAYOJRcc0cxJ7OOpE8B459VAxdXiudr1FctlqMuTnJyk00naoDcsRfDLEELMKVr/eY2Lrzxf7D5FwQkg/KA58HqSkiPc3p3Pkwp4zGqFLmbCSEVylMA4/XjPrEILa/MphKAFGLcR7tL39LFI8zxhn9hTSsTyijBKWdpj7h2WRgFjQsTyGF9bKuGZsH8VrB32sERqUQnsp8xtFfqkuKwg4iEOIPuQxJe67Zc2c6wHMY1/GYaczc5eiAX/CiECxmNPkSs0NPsY+RPvvriNfJK2eHRS+r2Wj92GPvAm9ZuvQaLrvYX8xFeRmPXKV7EnW1kcBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTZgE++0xfFnDp+6s8cyOMeSsGPjRgrNyl369ZC7M50=;
 b=dfQYRMJJCvuq3mpmGj7y6sbMv8Ez1z30BatL1134DIAqy8a+DoZmtJCUAoLdQrP21TU/8mcHBL2BX3S2zGO9uA3TWlOQy0Tt5qqN2txcbB/qsUHqkrLRa74qT14yOtztClaSmFZrGAvtDT6vELnJEyGX3eFBJBL7JE8jJNucoC0FADOPN+TxSd9jdEL3mN3qJjLTcN0bvZG0VxZ3KXRsGWRdxeBWC3LlzC/lPSy856Ww2twbegRTzwNonf8D21mzpjnYR6rps1/g7o5bsQQpF4QxRidrhyyz1z9gML0+g8XHG9DuOA4ozsr7SUvCJsIujD71G1vUtnpLH8SXQ+DlbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTZgE++0xfFnDp+6s8cyOMeSsGPjRgrNyl369ZC7M50=;
 b=RW22prBExE1y9ZQkHic9StnfZv+KBkoS7ZY4LmtVD7YLculICpHcTIyUInt3Y5TmUnVVtJQvxHc2YpGfGa0ZsrwcWWIkQaEf4OHggIm8wtn1BjcS+slDnMhNZ+aXTyRpKabQpcyB4EtgZrQdtjBqPmU0Mg5xkD5VDz7nk/LdvbM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 5 Nov
 2020 09:30:42 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:30:42 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/4] ntopng: add new recipe
Date: Thu,  5 Nov 2020 17:30:14 +0800
Message-ID: <20201105093015.36886-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201105093015.36886-1-mingli.yu@windriver.com>
References: <20201105093015.36886-1-mingli.yu@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 09:30:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7d70a55-3091-4c06-5125-08d8816d772c
X-MS-TrafficTypeDiagnostic: CO1PR11MB4817:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4817ADB36A74BAAA70AEF079F1EE0@CO1PR11MB4817.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9LzFcetY0Pt7cAtQ9qj0VofamHUUt0AgdWr7FLp73Bs4/uRgdQi2DvEYXKK7g/cpi7zP8To62IejwQlqqy8HuUFqVnFY5a+0DoF6nLvYzWVF4qgI5Q0Js2EPXCZyV1rGqVdBoR2rw9wgK2zwcEL5e33XRBWPVdoobZDDn8iFtABeXUcjZPdCgiwF1a7UWXjf541KA2Xk6N7gxxAcm7r3p8n342JTDpgEsGV/UwTf6r9cxvWfEmsQBh1XjnClSilMlwylD7jMG3/kmOPK16ZYIOqbR5Vgtxy+t2bDXIayzEAxY/b8VT35wJxt8yi+FOdwyj9RmbhCRDGKHxQNGfiimw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(66556008)(5660300002)(66946007)(66476007)(6666004)(186003)(6916009)(52116002)(83380400001)(6506007)(6486002)(86362001)(16526019)(316002)(8936002)(26005)(1076003)(478600001)(8676002)(6512007)(9686003)(956004)(36756003)(2906002)(2616005)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IjumzVyYZreyGVrvIPkyhdUtaI92hdBvKIYtQL1pN0lNQQv1sm+HxM9IOMXAFY/9OtzTUlPYvEQdOASBaT5rG0h+bOp787Xyc8PQYIMpbIOe4OHcf1DkbLsE5zkXm8taduZBLGT4+VyimeB4d9Gp48Y91XG8Z+wvWe5JgV7csG6lkZ1Ma/Zs8bsTyywKXbLg7w/e1wfj8NhmcjH40RvYabHt6rVfKDJbcCJRIi0xzzIXzFEFlhokfbgeb1gbTHG2kbpjVyrr1B2lWYdsEWiyFKO72QUvasfBKdWWNy5CMBrgp7Y0a2yMeRTaWEHRDvADQIUgFkn2IUpaBwvPqOdIahtGUABv6Sx/V+xTwj8XFJGn1J9Lr12Aqn2m1xCP2c6/5NHKZNj7BNVYh/Rr1dloM9eT0HhGo1yXx+KD0feT2ttxd9a0tks4Gy8S35k5/PbsnhjJPhD3THbNohEACyRqIsUilBolWXDA/6XgRL41XYqXcEH69F7k+zQDvNeguVFpsW1N8u7nfxEC1I3fbkQzj/E2DP+oBtuWTRjBsCHsrpuMIxeix1obWQSuGKYpCYfPb3WTQC5brxf81HiHvVUKF+Vsebx4hXSYY6+FNdixxKSsHl8cQMUOGDTlv1hVI3hLxmCZxOrFFmjsnsENy0mH4A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d70a55-3091-4c06-5125-08d8816d772c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:30:42.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcbPU2/wo56apYGzv4JXbLvJGHOAMjn2JF1bRYEhMayz5fQqVNiaJH6dzFoBn0uGleLElxRMYt1gSBTrdKy90Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

ntopng is a web-based network traffic monitoring application
released under GPLv3. It is the new incarnation of the original
ntop written in 1998, and now revamped in terms of performance,
usability, and features.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...kefile.in-don-t-use-the-internal-lua.patch | 39 +++++++++
 ...utogen.sh-generate-configure.ac-only.patch | 36 ++++++++
 ...1-configure.seed-fix-configure-error.patch | 42 ++++++++++
 ...onfigure.seed-fix-host-contamination.patch | 82 +++++++++++++++++++
 .../ntopng/files/ntopng.service               | 13 +++
 .../recipes-support/ntopng/ntopng_4.2.bb      | 47 +++++++++++
 6 files changed, 259 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-Makef=
ile.in-don-t-use-the-internal-lua.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-autog=
en.sh-generate-configure.ac-only.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-confi=
gure.seed-fix-configure-error.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-confi=
gure.seed-fix-host-contamination.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/ntopng.ser=
vice
 create mode 100644 meta-networking/recipes-support/ntopng/ntopng_4.2.bb

diff --git a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-=
don-t-use-the-internal-lua.patch b/meta-networking/recipes-support/ntopng/f=
iles/0001-Makefile.in-don-t-use-the-internal-lua.patch
new file mode 100644
index 000000000..46724558c
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-u=
se-the-internal-lua.patch
@@ -0,0 +1,39 @@
+From 65c15247d268566b79e4595b8e734b7e40679d75 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 4 Nov 2020 08:55:10 +0000
+Subject: [PATCH] Makefile.in: don't use the internal lua
+
+ntopng depends on lua and it will compile the lua under
+third-party sub dir of source tree, but this one supports
+cross-compiling badly, so use the one under RECIPE_SYSROOT.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 143535746..fc06a5341 100755
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -40,7 +40,6 @@ endif
+=20
+ LUA_HOME=3D${PWD}/third-party/lua-5.3.5
+ LUA_INC=3D-I$(LUA_HOME)/src
+-LUA_LIB=3D$(LUA_HOME)/src/liblua.a
+=20
+ ######
+ LIBRRDTOOL_HOME=3D${PWD}/third-party/rrdtool-1.4.8
+@@ -118,7 +117,6 @@ RPM_PKG =3D $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(P=
LATFORM).rpm
+ RPM_DATA_PKG =3D $(TARGET)-data-$(NTOPNG_VERSION)-@REVISION@.noarch.rpm
+ ######
+=20
+-LIB_TARGETS =3D $(LUA_LIB)
+=20
+ ifneq ($(HAS_ZEROMQ), 0)
+ LIB_TARGETS +=3D $(ZEROMQ_LIB)
+--=20
+2.26.2
+
diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-g=
enerate-configure.ac-only.patch b/meta-networking/recipes-support/ntopng/fi=
les/0001-autogen.sh-generate-configure.ac-only.patch
new file mode 100644
index 000000000..8d62147b9
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate=
-configure.ac-only.patch
@@ -0,0 +1,36 @@
+From 22f0bec462763f1b0b92daa33133e274d3b45f4f Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 5 Nov 2020 00:05:21 -0800
+Subject: [PATCH] autogen.sh: generate configure.ac only
+
+The autogen.sh should only generate configure.ac and the
+logic used to generate configure script should follow the
+autotools.bbclass in oe. Otherwise there may comes below
+do_configure error:
+ | checking whether we are cross compiling... configure: error: in `/path/=
tmp/work/core2-64-poky-linux/ndpi/3.4-r0/git':
+ | configure: error: cannot run C compiled programs.
+ | If you meant to cross compile, use `--host'.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ autogen.sh | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 73f8d0ebe..15ff0aa84 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -73,8 +73,3 @@ cat configure.seed | sed \
+     > configure.ac
+=20
+ rm -f config.h config.h.in *~ #*
+-
+-echo "Wait please..."
+-autoreconf -if
+-echo ""
+-echo "Now run ./configure"
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.se=
ed-fix-configure-error.patch b/meta-networking/recipes-support/ntopng/files=
/0001-configure.seed-fix-configure-error.patch
new file mode 100644
index 000000000..dffab24ca
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-=
configure-error.patch
@@ -0,0 +1,42 @@
+From 29797dd037009d38e4976249ed21b2076240751e Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 4 Nov 2020 04:36:46 +0000
+Subject: [PATCH] configure.seed: fix configure error
+
+fix the below error:
+configure: error: cannot run test program while cross compiling
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.seed | 13 +------------
+ 1 file changed, 1 insertion(+), 12 deletions(-)
+
+diff --git a/configure.seed b/configure.seed
+index a321f9bbf..03f9a31b0 100644
+--- a/configure.seed
++++ b/configure.seed
+@@ -642,18 +642,7 @@ if test x$radcli =3D xtrue; then
+   fi
+ fi
+=20
+-AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_suppor=
ted], [
+-  AC_TRY_RUN([
+-  #include <pthread.h>
+-
+-  int main() {
+-    pthread_rwlock_t t;
+-    return 0;
+-  }
+-]
+-, [my_cv_rw_locks_supported=3Dyes], [my_cv_rw_locks_supported=3Dno])
+-]
+-)
++AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_suppor=
ted])
+=20
+ if test "$my_cv_rw_locks_supported" =3D yes; then
+   AC_DEFINE_UNQUOTED(HAVE_RW_LOCK, 1, [pthread rwlocks supported])
+--=20
+2.26.2
+
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.se=
ed-fix-host-contamination.patch b/meta-networking/recipes-support/ntopng/fi=
les/0001-configure.seed-fix-host-contamination.patch
new file mode 100644
index 000000000..a5ac59fb3
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-=
host-contamination.patch
@@ -0,0 +1,82 @@
+From 81e3512718f80965c26ccb1f9d694c91b121fea0 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 4 Nov 2020 06:28:28 +0000
+Subject: [PATCH] configure.seed: fix host contamination
+
+Fix below error:
+This autoconf log indicates errors, it looked at host include and/or
+library paths while determining system capabilities.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.seed | 47 +++++------------------------------------------
+ 1 file changed, 5 insertions(+), 42 deletions(-)
+
+diff --git a/configure.seed b/configure.seed
+index 03f9a31b0..58aebb5b8 100644
+--- a/configure.seed
++++ b/configure.seed
+@@ -79,31 +79,6 @@ fi
+ #
+ REVISION=3D`git log --pretty=3Doneline | wc -l`
+=20
+-if test -d "/usr/local/include"; then
+-  CFLAGS=3D"${CFLAGS} -I/usr/local/include"
+-  CPPFLAGS=3D"${CPPFLAGS} -I/usr/local/include"
+-fi
+-
+-if test -d "/usr/local/lib"; then
+-  LDFLAGS=3D"${LDFLAGS} -L/usr/local/lib"
+-fi
+-
+-if test -d /opt/local/include; then :
+-  CFLAGS=3D"${CFLAGS} -I/opt/local/include"
+-  CPPFLAGS=3D"${CPPFLAGS} -I/opt/local/include"
+-fi
+-
+-if test -d /opt/local/lib; then :
+-  LDFLAGS=3D"${LDFLAGS} -L/opt/local/lib"
+-fi
+-
+-if [ test -f /usr/bin/lsb_release ]; then
+-  CODENAME=3D`/usr/bin/lsb_release -c|cut -f 2`
+-  if [[ $CODENAME =3D=3D "wheezy" ]]; then :
+-    CPPFLAGS=3D"${CPPFLAGS} -DOLD_NETFILTER_INTERFACE=3D1"
+-  fi
+-fi
+-
+ SHORT_MACHINE=3D`uname -m | cut -b1-3`
+=20
+ GIT_RELEASE=3D"@GIT_RELEASE@"
+@@ -214,23 +189,11 @@ dnl> fi
+ pkg-config --exists libssl
+ if test "$?" -ne 1; then
+   AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
+-  SSL_INC=3D"`pkg-config --cflags libssl` -I/usr/include/openssl"
++  SSL_INC=3D"`pkg-config --cflags libssl`"
+   SSL_LIB=3D"`pkg-config --libs libssl` -lssl -lcrypto"
+ else
+-  dnl Workaround for MacOS Brew
+-  if test -d "/usr/local/opt/openssl/lib"; then
+-    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
+-    SSL_INC=3D"-I/usr/local/opt/openssl/include"
+-    SSL_LIB=3D"-L/usr/local/opt/openssl/lib -lssl"
+-  dnl Workaround for FreeBSD
+-  elif test -f "/usr/lib/libssl.so"; then
+-    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
+-    SSL_INC=3D"-I/usr/include"
+-    SSL_LIB=3D"-L/usr/lib -lssl -lcrypto"
+-  else
+-    echo "Please install openssl-dev(el) package prerequisite"
+-    exit -1
+-  fi
++  echo "Please install openssl-dev(el) package prerequisite"
++  exit -1
+ fi
+=20
+ AC_CHECK_LIB([gcrypt], [gcry_cipher_checktag], [LDFLAGS=3D"${LDFLAGS} -lg=
crypt"])
+--=20
+2.26.2
+
diff --git a/meta-networking/recipes-support/ntopng/files/ntopng.service b/=
meta-networking/recipes-support/ntopng/files/ntopng.service
new file mode 100644
index 000000000..66912fbef
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/ntopng.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=3Dntopng - High-Speed Web-based Traffic Analysis and Flow Coll=
ection Tool
+After=3Dnetwork.target
+
+[Service]
+Type=3Dforking
+StandardOutput=3Dsyslog
+StandardError=3Dinherit
+ExecStart=3D/usr/bin/ntopng -e -w 3000
+Restart=3Don-abort
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb b/meta-ne=
tworking/recipes-support/ntopng/ntopng_4.2.bb
new file mode 100644
index 000000000..250fe8fbe
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
@@ -0,0 +1,47 @@
+SUMMARY =3D "Web-based Traffic and Security Network Traffic Monitoring"
+DESCRIPTION =3D "ntopng is a web-based network traffic monitoring applicat=
ion \
+released under GPLv3. It is the new incarnation of the original \
+ntop written in 1998, and now revamped in terms of performance, \
+usability, and features."
+
+SECTION =3D "console/network"
+
+DEPENDS =3D "curl libmaxminddb libpcap lua mariadb ndpi json-c rrdtool zer=
omq"
+RDEPENDS_${PN} =3D "bash redis"
+LICENSE =3D "GPLv3"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
+
+SRCREV =3D "5e649a2d1130b4a3ab0c5bb673d615172cc0bdbb"
+SRC_URI =3D "git://github.com/ntop/ntopng.git;protocol=3Dgit;branch=3D4.2-=
stable \
+           file://0001-configure.seed-fix-configure-error.patch \
+           file://0001-configure.seed-fix-host-contamination.patch \
+           file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
+           file://0001-autogen.sh-generate-configure.ac-only.patch \
+           file://ntopng.service \
+"
+
+S =3D "${WORKDIR}/git"
+
+# don't use the lua under thirdparty as it supports cross compiling badly
+export LUA_LIB =3D "${STAGING_LIBDIR}/liblua.a"
+
+LDFLAGS_append_mipsarch =3D " -latomic"
+LDFLAGS_append_powerpc =3D " -latomic"
+inherit autotools-brokensep gettext systemd
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/ntopng.service ${D}${systemd_unitdir}/syste=
m
+}
+
+FILES_${PN} +=3D "\
+    ${systemd_unitdir}/system/ntopng.service"
+
+FILES_${PN}-doc +=3D "\
+    /usr/man/man8/ntopng.8"
+
+do_configure_prepend() {
+    ${S}/autogen.sh
+}
+
+SYSTEMD_SERVICE_${PN} =3D "ntopng.service"
--=20
2.26.2

