Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.5147.1604568138772883595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Zd8wnyoh;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DphpHZBow6+1yrQ/VaO8EHBDEPe7qLZOu23BERtwbuqmDmWNk1nQroaybCtfB8z7A1bLUXf/8KOvsTSQYkcb/kSd318lqIdoXjedcz9OQX+ej3T1aL3wwJOlDc8OvlxlmCCPnrQgzaN9Bl8cYeYL3SOEZToNLJUZQBAFlvuL1M3v+tDNMAJLA8XVnVZZL3hOuQSuUqbgWV0peQEJyuH6PqEAC+3AkiJkeeIKXE5sKRWYYCq1h5ceRqLCpH2+WS5C+c033Gzf36BZUg1WvWYxpELCd43T0+whTiMLvgKQ6DGk6k9RuJPXBi5LzcybxpWi24wkEV1Ydj4ioN7txYrbXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTZgE++0xfFnDp+6s8cyOMeSsGPjRgrNyl369ZC7M50=;
 b=aOOIit5jWqqAK3H0ZFYZhJ4zsEavc8M3ybHiRDQx2mZDhAP4qTL9LlYU8IoTYCqIEdjV7C+bCishychMCqIz9m5VpbtGeCbdIs5IY62mtzkPbN9hPq9z4GqwYpcplj+1s7WZn8Kc9bMDdG6awnwT9Mc3SUTWMYmdQPLBNC885XSwWW9opXSRRcR95JYZHYWO8WGrKQ/ayxzKkG/wvefpXoluJPbGqRxdunDn5j8ZzP7EEexHeOs9xU6qLahwTKLMryMtK0XLzh0cH80BvQNiGNpMSoIO8F0WX6sC7zkkV78MFy/l73jogL9ctFjiXufwj4kG+UvuGQlK639im8Y2vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTZgE++0xfFnDp+6s8cyOMeSsGPjRgrNyl369ZC7M50=;
 b=Zd8wnyoh/yzFQVhL9ZxN5x2SaG0E5e5zQRDqwcVmI6HnUtrx1UIq/GrLFPBq/nf+0UCI4Wmoh1LDf8yJAkonh2duNYPxfa6lLet8iACgYG+iTz5lbZqMU96fO0Xj9WMHz4mRu/2zbhVHCnA7oxoQADb+U68cepLAU2lqHPkuG3A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 5 Nov
 2020 09:22:17 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:22:17 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] ntopng: add new recipe
Date: Thu,  5 Nov 2020 17:18:24 +0800
Message-ID: <20201105091825.36257-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201105091825.36257-1-mingli.yu@windriver.com>
References: <20201105091825.36257-1-mingli.yu@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0302CA0001.apcprd03.prod.outlook.com (2603:1096:202::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend Transport; Thu, 5 Nov 2020 09:22:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 641dcdff-004e-41a4-afad-08d8816c4a46
X-MS-TrafficTypeDiagnostic: CO1PR11MB4898:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4898DE82CD916D7700772A2EF1EE0@CO1PR11MB4898.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L4XfqHUsPwjL0Anz27EPVhZSh/Zzo+8kdWOOekfBbp00cqUTTIGnY832F7O/aHSrK1eLekh4/PK5iITW1iJXcvbl7PDKhYgap5oYd/Tda6zkwXvCbSjDGiUkTKJMbDKDUojp0/T5pLdYuh+TyosLC/6aFuBh5s2BHfQOmZimq7g6jlHW8RwRfxlXK+Z5EbOcNTy37cRTw5qKQkpfFaJisSAEGRuh/4CQcIv+4czpWhjxPsuv3ryZHp8gI6CBvY1OCK16BSCG2kKTw0q1vLWEped21GwYRR03jjab/xmMUlAXNmiavjYjCx9k7WQkWSxQdj0Lxc2AA+7MUR2YRxvtFg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(9686003)(6512007)(6506007)(30864003)(1076003)(186003)(16526019)(478600001)(6666004)(52116002)(26005)(86362001)(2616005)(956004)(6916009)(6486002)(2906002)(5660300002)(36756003)(8936002)(316002)(8676002)(66946007)(66476007)(83380400001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	d3Fo9PIXaqxwVQJQypQtb5hVqbkv88DpNs5y0A/slvd4uOmvs01VzSjsoRRRDJ+7GLQSqOl+k1lVNUX+HxZSL07pQGXtC8uFChlvSTzAEsuN0V5EBd4W76mp1ajOF//vmQS8wujJXPyW+SWV7lpNc+DycogvNfssawe2c/34z76YxmoOVorQ9FXmpLNtpvfEGQED/eFdVyFvkoisg0+/ZO3v7LdA0rOpHL+4xJ/rtZ5L3mnnxHiHjIKO0RibIoaa3CM/QTT/1n5IH9GyX8Be8wwbl7Oadz6FBdkyCx36Vp5udaXor8VXtsAB4wYY8pbindyaSmaN7518iGHDWV+EzXFaVuVnClTeth7X5p/qp3qWqKEFGjg+JaKPqBSkQuu0amYjRg15DroaMpIkUi0TqYA7+VUUS6fpl+GHS5xE7VVF+AMsljybbEJ760hVhudXg951Z2ewy4oBl+SNXpeddVXR/ggTidcTlRZ9A2VZZJl2khDLtfD9Go4AW9PKSL+L4qaCXx5t0Xs6S6WXGFiK4cCXBYiJPSYdZdff0U4DG/qp2OaKEmlG9Z9wPX5E99414JjOhZCd7hYmBnpTRV29nN10HJoMBUY+zRy+fq4z8N4UoXT0J/TKyXZ5i4wNKp48g46DcgWx4tUEiH3+WtXwQQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641dcdff-004e-41a4-afad-08d8816c4a46
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:22:17.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HljOki2C/vXjC9WfP0+AxE0XRPxn6dSiGdSrKklyjSa3TJaPy5ynh4rp3nIU2XMl5vqxua2lqT2guYn97k+agw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

