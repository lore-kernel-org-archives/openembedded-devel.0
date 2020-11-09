Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.83])
 by mx.groups.io with SMTP id smtpd.web09.7099.1604896187299487369
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2020 20:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T8pF39UX;
 spf=pass (domain: windriver.com, ip: 40.107.93.83, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVP0kV/vcgIoKgVBazXOIESXM4z2lNOaW5+1hrLt4cM1q16cL+7Mh/7HzjrNaiDS7XK/28vrpKUqfuTg2qMy/marvdf8ak+oBGWDOSfA/MSUCrgElPbCGN8NeXs/F1Iz38rhSckoOMx+5ssL7SMe3v8huFEP+Whq18ik5v61yFxZ2p23PJxctO5l6ViFGXS5B8nlyXgyZb2Rd+/zyTE4e6TotAck1nReBt0TiJG4HrvsypwMH94XS/B/NKIzsdypas57ME76AmWvjm0+1CR/nglKDQUNRRMg6EXFfrJ9EVyuU2+P0pCqYuxmauauAutXHTFO6XpPKR0aPj5npNq2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2bgMC+m9o3vqtMwZv5HkMY00hOMZ282HxDkKRi9RJ8=;
 b=EWS6ZAIH/9zYGIejFBIy/TlA6CwUf+aa+oCSjt1o4wDqjIrJkcGJJZSNLQ5yN2bjzlI1oPVV85lWVGUuYOmSPWmM5JRtRlnUoSSyJSTJIF/WXznREhohG0n/NvLUzwsiaUoxi4D2N4NPu8fMfajD59SlgpTqlnsLAcqTHTxbmrjyBkDecNqvXPUEn6N4NeuKGt9UqP/ThlwEaadljxJxRzxQjJyb9ymQUPeSOb8K7sxKJFYQBFnG1IikHLW9BHNY5jnpsN3HKJ39kOVvxpBZX5H/dyHwlQ/H85GQ/CBEPR4GgntBqChuYvhG96h3lTr06DerTNM9WKWbDEuaB3aRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2bgMC+m9o3vqtMwZv5HkMY00hOMZ282HxDkKRi9RJ8=;
 b=T8pF39UXSLkAnIbZ+RJmoF3816F9rNOtzJi0CJg5srt370eHTRNj+nRRaX8n79VV8N6EdnRT40hHDqbrezTFYifX4L11oWbpwUP6TISBioIHJncHw7Ex6RzHsNqJMenUuUhLedgo0LUcKBFQSIwmjU3IpZQSCygSQqe++ov5Vs0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Mon, 9 Nov
 2020 04:29:46 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 04:29:46 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2 3/4] ntopng: add new recipe
Date: Mon,  9 Nov 2020 12:29:30 +0800
Message-Id: <20201109042930.40205-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1srN3p5HPwq1n0qg51g8yU7sS0Di9iX_hb89Unjsfs6WLg@mail.gmail.com>
References: <CAMKF1srN3p5HPwq1n0qg51g8yU7sS0Di9iX_hb89Unjsfs6WLg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:c9::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR03CA0024.apcprd03.prod.outlook.com (2603:1096:203:c9::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend Transport; Mon, 9 Nov 2020 04:29:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a5db46e-d68a-457a-93cc-08d88468163e
X-MS-TrafficTypeDiagnostic: CO1PR11MB4771:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4771F5BF8EC995D5AF539A6EF1EA0@CO1PR11MB4771.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ATW1ju9L7hKQXRIe/31GlYMUuAPfzJ/RNeOEFQSMO8g1EB5riZDPlLISznRFMn7fA7tigPXSOtRpnPqR5EBWJYUYNr997StlOoMVGxTVMT8icIO1MGh603hK91IkvjvbiHpDHwy46RTrWzezrYpIJ/fINT6vDSaFcgGzEuHRuiGzdEWca7c0R6CSbAkyr5zw2CpQP5VBUWkkl6+UWMpucWZOg8mmPyqLAD+t4TqykK4XoBEuywVuyJ0CU8R9YUS+Jefme14wf3lf9fOq7aObouIY+ULk3dJDDolD0l6niSdwLpF9NNl5jsnWwvTGdwBjqqo4v1Rs9T/jryEYeArN0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39840400004)(396003)(366004)(36756003)(83380400001)(6486002)(1076003)(6666004)(30864003)(6506007)(52116002)(2906002)(6512007)(478600001)(186003)(66476007)(66556008)(66946007)(316002)(16526019)(2616005)(8936002)(5660300002)(956004)(8676002)(86362001)(26005)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4tGhw/54UZypHivTlcM5BGbonwTfc1/km3HHR2mmjmtf9dt1pOFfLzTIl5qsc7vqleNXgQtRoPMQGRgfVCUQVBnvCwpTaEY9685SIGiDVnVHtW15+7vNUK5qcL664IFEnJICtokwNWwQMaqgLcnFPKabenGOoqw+VZlER9OMRf3jdcEfTWk+FjK3sqQX0+NPpEKbhY7I6sqpSdHonW3CN3dqA9D8u/U+Ii7JRU5RGCTp+ODZggEhKRo5eVDkrXZkFTISnJD+JkgyLi0B+BHu6rVvWeAJ+bYJebAXIQKZdzsLpCA4VogwSCkix5PVa7dzdSnfoilI+E9bldBLjF12tV6nqwibC1H2yyHIxNgF45tgS6PM0Zw+9WIQAiTV0swxXMzEQrhYR05Ez5Yd8ftll3HbMStRalZW65/RCpwxUARYXt4uXcn3Avz4Kdjq4f9V276i982ltJy7vyS+9pZs6ELCeYmfuHJIVzNTV90IXPQL6G3zgcNVI/7WOYdmCcrnPiLyXmTRwzsL/iSBcQiMh743pWkkYMaL/sR9HhaYEfzXeYxZ+y3Y0l8jQb/MXC69mMNxB57WImTYJpwJ5VLM7r50UA0S7RDHQ4B5g11yHzH3W35v19R0n0fKI4IidWf06T9ZlXBkQqg9otxv21DfWA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5db46e-d68a-457a-93cc-08d88468163e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 04:29:45.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60FrpdS5RB41v3n5NecC5mUJHvNjFGHmapSANK8d4HKulVDEnW/abZ6FoxrxOkUiHeVckchjVaMngt9HdyXz8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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
 ...nfigure.seed-not-check-clang-on-host.patch | 47 +++++++++++
 .../ntopng/files/ntopng.service               | 13 +++
 .../recipes-support/ntopng/ntopng_4.2.bb      | 48 +++++++++++
 7 files changed, 307 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/ntopng.service
 create mode 100644 meta-networking/recipes-support/ntopng/ntopng_4.2.bb

diff --git a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
new file mode 100644
index 000000000..46724558c
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
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
+ 
+ LUA_HOME=${PWD}/third-party/lua-5.3.5
+ LUA_INC=-I$(LUA_HOME)/src
+-LUA_LIB=$(LUA_HOME)/src/liblua.a
+ 
+ ######
+ LIBRRDTOOL_HOME=${PWD}/third-party/rrdtool-1.4.8
+@@ -118,7 +117,6 @@ RPM_PKG = $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(PLATFORM).rpm
+ RPM_DATA_PKG = $(TARGET)-data-$(NTOPNG_VERSION)-@REVISION@.noarch.rpm
+ ######
+ 
+-LIB_TARGETS = $(LUA_LIB)
+ 
+ ifneq ($(HAS_ZEROMQ), 0)
+ LIB_TARGETS += $(ZEROMQ_LIB)
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
new file mode 100644
index 000000000..8d62147b9
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
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
+ | checking whether we are cross compiling... configure: error: in `/path/tmp/work/core2-64-poky-linux/ndpi/3.4-r0/git':
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
+ 
+ rm -f config.h config.h.in *~ #*
+-
+-echo "Wait please..."
+-autoreconf -if
+-echo ""
+-echo "Now run ./configure"
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
new file mode 100644
index 000000000..dffab24ca
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-configure-error.patch
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
+@@ -642,18 +642,7 @@ if test x$radcli = xtrue; then
+   fi
+ fi
+ 
+-AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_supported], [
+-  AC_TRY_RUN([
+-  #include <pthread.h>
+-
+-  int main() {
+-    pthread_rwlock_t t;
+-    return 0;
+-  }
+-]
+-, [my_cv_rw_locks_supported=yes], [my_cv_rw_locks_supported=no])
+-]
+-)
++AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_supported])
+ 
+ if test "$my_cv_rw_locks_supported" = yes; then
+   AC_DEFINE_UNQUOTED(HAVE_RW_LOCK, 1, [pthread rwlocks supported])
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
new file mode 100644
index 000000000..a5ac59fb3
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
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
+ REVISION=`git log --pretty=oneline | wc -l`
+ 
+-if test -d "/usr/local/include"; then
+-  CFLAGS="${CFLAGS} -I/usr/local/include"
+-  CPPFLAGS="${CPPFLAGS} -I/usr/local/include"
+-fi
+-
+-if test -d "/usr/local/lib"; then
+-  LDFLAGS="${LDFLAGS} -L/usr/local/lib"
+-fi
+-
+-if test -d /opt/local/include; then :
+-  CFLAGS="${CFLAGS} -I/opt/local/include"
+-  CPPFLAGS="${CPPFLAGS} -I/opt/local/include"
+-fi
+-
+-if test -d /opt/local/lib; then :
+-  LDFLAGS="${LDFLAGS} -L/opt/local/lib"
+-fi
+-
+-if [ test -f /usr/bin/lsb_release ]; then
+-  CODENAME=`/usr/bin/lsb_release -c|cut -f 2`
+-  if [[ $CODENAME == "wheezy" ]]; then :
+-    CPPFLAGS="${CPPFLAGS} -DOLD_NETFILTER_INTERFACE=1"
+-  fi
+-fi
+-
+ SHORT_MACHINE=`uname -m | cut -b1-3`
+ 
+ GIT_RELEASE="@GIT_RELEASE@"
+@@ -214,23 +189,11 @@ dnl> fi
+ pkg-config --exists libssl
+ if test "$?" -ne 1; then
+   AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
+-  SSL_INC="`pkg-config --cflags libssl` -I/usr/include/openssl"
++  SSL_INC="`pkg-config --cflags libssl`"
+   SSL_LIB="`pkg-config --libs libssl` -lssl -lcrypto"
+ else
+-  dnl Workaround for MacOS Brew
+-  if test -d "/usr/local/opt/openssl/lib"; then
+-    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
+-    SSL_INC="-I/usr/local/opt/openssl/include"
+-    SSL_LIB="-L/usr/local/opt/openssl/lib -lssl"
+-  dnl Workaround for FreeBSD
+-  elif test -f "/usr/lib/libssl.so"; then
+-    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
+-    SSL_INC="-I/usr/include"
+-    SSL_LIB="-L/usr/lib -lssl -lcrypto"
+-  else
+-    echo "Please install openssl-dev(el) package prerequisite"
+-    exit -1
+-  fi
++  echo "Please install openssl-dev(el) package prerequisite"
++  exit -1
+ fi
+ 
+ AC_CHECK_LIB([gcrypt], [gcry_cipher_checktag], [LDFLAGS="${LDFLAGS} -lgcrypt"])
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
new file mode 100644
index 000000000..95d1f9948
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
@@ -0,0 +1,47 @@
+From eead0c589b71d4256bf9f16492164786b0ee07e4 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 9 Nov 2020 04:05:25 +0000
+Subject: [PATCH] configure.seed: not check clang on host
+
+Don't check clang on host to avoid host contamination.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.seed | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/configure.seed b/configure.seed
+index d0335b599..cb97adca2 100644
+--- a/configure.seed
++++ b/configure.seed
+@@ -509,25 +509,6 @@ if test $SYSTEM = "Darwin"; then
+             CFLAGS="-fno-color-diagnostics $CFLAGS"
+       fi
+    fi
+-else
+-  if test $SYSTEM = "Linux"; then
+-    if [ test -f /usr/bin/clang++ ]; then
+-      CC=clang
+-      CXX=clang++
+-      AC_MSG_RESULT(Using clang++ compiler)
+-    fi
+-    
+-    if [ test -f /etc/redhat-release ]; then
+-       if [ test -f /usr/bin/lsb_release ]; then
+-       	  dnl> CentOS 7
+-	  CENTOS_N2N_DEP=", n2n"
+-       fi
+-    else
+-        if [ test -f /usr/bin/lsb_release ]; then
+-         OS=`/usr/bin/lsb_release -d|cut -d ':' -f 2`
+-        fi
+-    fi
+-  fi
+ fi
+ 
+ dnl> Remove spaces
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-support/ntopng/files/ntopng.service b/meta-networking/recipes-support/ntopng/files/ntopng.service
new file mode 100644
index 000000000..66912fbef
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/ntopng.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=ntopng - High-Speed Web-based Traffic Analysis and Flow Collection Tool
+After=network.target
+
+[Service]
+Type=forking
+StandardOutput=syslog
+StandardError=inherit
+ExecStart=/usr/bin/ntopng -e -w 3000
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
new file mode 100644
index 000000000..bd2b99fab
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Web-based Traffic and Security Network Traffic Monitoring"
+DESCRIPTION = "ntopng is a web-based network traffic monitoring application \
+released under GPLv3. It is the new incarnation of the original \
+ntop written in 1998, and now revamped in terms of performance, \
+usability, and features."
+
+SECTION = "console/network"
+
+DEPENDS = "curl libmaxminddb libpcap lua mariadb ndpi json-c rrdtool zeromq"
+RDEPENDS_${PN} = "bash redis"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRCREV = "5e649a2d1130b4a3ab0c5bb673d615172cc0bdbb"
+SRC_URI = "git://github.com/ntop/ntopng.git;protocol=git;branch=4.2-stable \
+           file://0001-configure.seed-fix-configure-error.patch \
+           file://0001-configure.seed-fix-host-contamination.patch \
+           file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
+           file://0001-autogen.sh-generate-configure.ac-only.patch \
+           file://0001-configure.seed-not-check-clang-on-host.patch \
+           file://ntopng.service \
+"
+
+S = "${WORKDIR}/git"
+
+# don't use the lua under thirdparty as it supports cross compiling badly
+export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
+
+LDFLAGS_append_mipsarch = " -latomic"
+LDFLAGS_append_powerpc = " -latomic"
+inherit autotools-brokensep gettext systemd
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/ntopng.service ${D}${systemd_unitdir}/system
+}
+
+FILES_${PN} += "\
+    ${systemd_unitdir}/system/ntopng.service"
+
+FILES_${PN}-doc += "\
+    /usr/man/man8/ntopng.8"
+
+do_configure_prepend() {
+    ${S}/autogen.sh
+}
+
+SYSTEMD_SERVICE_${PN} = "ntopng.service"
-- 
2.17.1

