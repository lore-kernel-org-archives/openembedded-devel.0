Return-Path: <jhofstee@victronenergy.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00112.outbound.protection.outlook.com [40.107.0.112])
	by mail.openembedded.org (Postfix) with ESMTP id 856C57F948
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IHxxAVo9XWwWAXk0+r07Rt557/7Y3ELT5Q91p3ZGqt/a8Sn+MCKqTe2OYuqSEt2oM64t5ng29STh9Ha0U2wiBlVr/XIX7HMhkPNBMvvejgb3DQH2DlpzW8rg86Iq8CEY8RCxGplB72LhPf1X+MPkQGywbBpt/evQb6q3mZP5T7e0mrPha5QHi06Og0s7O81z8l64CYHzJQ1A9KSJYH32Tgx3Qhi7sRgyRhko79jMuC0rd/oZsjLxp3Fh/ulhBNB6sNV+9a/09es1JmO/IDwhHTsDyBZ2mMgtiocsAtkP9ZyDl/d9nKmynki3pHaeNAor03zUbu3aukBvUT6rUGHS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cLIJzRJWxxfeYTDF+YdrlgtPpD4d4j0snviAiFT473o=;
	b=mppVP7HxPuU/Hk8Pk/lTzP+t/MLiyUtLK2smZG7AWw7OJG/L+6MmF4D4yqOuDdcVb0Cje0TfR9ZbY9wV425+GOK9J5SJJkmE078dyuMALz/ierwGPJe5CtaAJyL8+JiSt6dNMFIvXhGoCpt8aK1/d/qzblagckCrNbZiRVXqVUtlMY/roinTOohYZHFXvyfD1PWejkV/RQ0MzMwPmR/8EEAgtVa08upyPZPpxk8NZsmYCV9elzcdfC5BtkDyljFktgA2OQmN0qm7Jg8mevBZbB+7HlzvRL85M9pFIIueDszNhECuzJcotDxVhDY6Gr4s5p54P2dFIEw5cZ/4q3MD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=victronenergy.com; dmarc=pass action=none
	header.from=victronenergy.com; dkim=pass header.d=victronenergy.com;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cLIJzRJWxxfeYTDF+YdrlgtPpD4d4j0snviAiFT473o=;
	b=ID/y4+049btzYo3Ca4kYzyr91J+s7bmlADOFM4MRG8BEJ8v42PLmwRwpR1cpllUAtyRZ2DvWJfg7HHAtjKBIySGi2XmqNcReNVjdINhTUAuW/MZQETpu6F3l1cc+7JEgkFDA+B1bRY1RzNvyV1IMtEJ75CXAKtKK9u7xpj54ctA=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
	VI1PR0701MB2814.eurprd07.prod.outlook.com (10.173.70.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.9; Sun, 17 Nov 2019 21:44:43 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8]) by
	VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8%8]) with mapi id 15.20.2474.012;
	Sun, 17 Nov 2019 21:44:43 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt4][PATCH 2/2] qt4: updates for gcc 9.2
Thread-Index: AQHVnZA4ZSppDkTXtUKU3Iq8hL3l2A==
Date: Sun, 17 Nov 2019 21:44:43 +0000
Message-ID: <20191117214427.20073-3-jhofstee@victronenergy.com>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
In-Reply-To: <20191117214427.20073-1-jhofstee@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:1c01:3bc5:4e00:461c:a8ff:fee1:70b5]
x-clientproxiedby: AM0PR02CA0006.eurprd02.prod.outlook.com
	(2603:10a6:208:3e::19) To VI1PR0701MB2623.eurprd07.prod.outlook.com
	(2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20212d69-1348-41e8-be24-08d76ba75b4e
x-ms-traffictypediagnostic: VI1PR0701MB2814:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0701MB28140FDD742FEC8886F38567C0720@VI1PR0701MB2814.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 02243C58C6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(199004)(189003)(6916009)(6506007)(305945005)(386003)(7736002)(478600001)(99286004)(76176011)(102836004)(36756003)(50226002)(6512007)(52116002)(316002)(2351001)(14454004)(66946007)(66446008)(64756008)(66556008)(966005)(66476007)(2501003)(8676002)(81166006)(446003)(11346002)(86362001)(46003)(1076003)(81156014)(6486002)(4326008)(14444005)(107886003)(256004)(186003)(8936002)(6436002)(486006)(5640700003)(5660300002)(71200400001)(6116002)(71190400001)(6306002)(25786009)(2616005)(2906002)(476003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2814;
	H:VI1PR0701MB2623.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDSKAlI/TbLagdcksnTDXpmRz2N1Q0da3QFyCq/6BqKWngB9DWoGHcF+vP/qymRZ7M08UiXZY+iLUQeWDOU/+wKWetkjrLJmfV9TFnpEyx7Nhr2b05C9rf+fVPWqDF5FOGnoRH6hVj6LOvDKCEQuzw1/0zLPipYRvHkjrgOTrctRiSK5r683B+A4AroD7tEnaB/o1uva368QTbynwZ5WsgPXTBXoTBqOpuwo6StL415UZMe2bp2CdSjyjEYn3OsnuiVnNg79/GFcWQ/AWrpYSKcOPgPqZ/iEfigC6O+Z+jE0ckYjaLkXum/Cvc85H0Kvsv8yKIt1Mg5bRsc/DFnxNKps4Mm9cjpvSvNs8TMguuWfS+r6MShRI4yl+viqpMy88KDr65Jc2Y7yb6ay/ts7tkZ/GwRPI8+GwK6II8pwgzOIMuc+LerMIf9NVtmXuteO
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20212d69-1348-41e8-be24-08d76ba75b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2019 21:44:43.3401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvqPU2NDK5ZYw4auyI4QFuORooKRvkMkoovgCYzOmIkvG6EO3VGgoHc/aBuORg4lWySRKqUOb41v+mZ/QBwnr5oq8HjUvi+HOuNsELOHNQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2814
Subject: [meta-qt4][PATCH 2/2] qt4: updates for gcc 9.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Nov 2019 21:44:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This adds two patches, the first one is a backport from qt5 to make
Q_FOREACH work again. The patch itself contains the details.

The other one makes the build logs readable again by suppressing many
harmless warnings issued by newer compilers.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 recipes-qt4/qt4/nativesdk-qt4-tools.inc       |  2 +
 recipes-qt4/qt4/qt4-4.8.7.inc                 |  2 +
 ...event-gcc-9.2-miscompiling-Q_FOREACH.patch | 78 ++++++++++++++++
 ...ence-some-loud-but-innocent-warnings.patch | 91 +++++++++++++++++++
 recipes-qt4/qt4/qt4-native.inc                |  2 +
 5 files changed, 175 insertions(+)
 create mode 100644 recipes-qt4/qt4/qt4-4.8.7/0038-prevent-gcc-9.2-miscompi=
ling-Q_FOREACH.patch
 create mode 100644 recipes-qt4/qt4/qt4-4.8.7/0039-silence-some-loud-but-in=
nocent-warnings.patch

diff --git a/recipes-qt4/qt4/nativesdk-qt4-tools.inc b/recipes-qt4/qt4/nati=
vesdk-qt4-tools.inc
index e9c45da..f071b22 100644
--- a/recipes-qt4/qt4/nativesdk-qt4-tools.inc
+++ b/recipes-qt4/qt4/nativesdk-qt4-tools.inc
@@ -19,6 +19,8 @@ SRC_URI =3D "http://download.qt-project.org/official_rele=
ases/qt/4.8/${PV}/qt-ever
            file://0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utilit=
y.patch \
            file://0007-dbus-Remove-const-usage-that-causes-compile-failure=
-.patch \
            file://0008-qmake.pro-Allow-building-a-separate-qmake-for-the-t=
a.patch \
+           file://0038-prevent-gcc-9.2-miscompiling-Q_FOREACH.patch \
+           file://0039-silence-some-loud-but-innocent-warnings.patch \
            file://g++.conf \
            file://linux.conf"
=20
diff --git a/recipes-qt4/qt4/qt4-4.8.7.inc b/recipes-qt4/qt4/qt4-4.8.7.inc
index 7d9b9b9..1b52d6d 100644
--- a/recipes-qt4/qt4/qt4-4.8.7.inc
+++ b/recipes-qt4/qt4/qt4-4.8.7.inc
@@ -28,6 +28,8 @@ SRC_URI =3D "http://download.qt-project.org/official_rele=
ases/qt/4.8/${PV}/qt-ever
            file://0035-Add-nios2-support.patch \
            file://0036-qt-everywhere-opensource-src-4.8.7-gcc6.patch \
            file://0037-fix-configure-with-icu60.patch \
+           file://0038-prevent-gcc-9.2-miscompiling-Q_FOREACH.patch \
+           file://0039-silence-some-loud-but-innocent-warnings.patch \
            file://gcc-version.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
            file://add_check_for_aarch64_32.patch \
diff --git a/recipes-qt4/qt4/qt4-4.8.7/0038-prevent-gcc-9.2-miscompiling-Q_=
FOREACH.patch b/recipes-qt4/qt4/qt4-4.8.7/0038-prevent-gcc-9.2-miscompiling=
-Q_FOREACH.patch
new file mode 100644
index 0000000..e02c9be
--- /dev/null
+++ b/recipes-qt4/qt4/qt4-4.8.7/0038-prevent-gcc-9.2-miscompiling-Q_FOREACH=
.patch
@@ -0,0 +1,78 @@
+From f27717257dc7fcfe1d48b02b10668da1af678ad4 Mon Sep 17 00:00:00 2001
+From: Jeroen Hofstee <jhofstee@victronenergy.com>
+Date: Sat, 16 Nov 2019 16:48:58 +0100
+Subject: [PATCH 1/2] prevent gcc 9.2 miscompiling Q_FOREACH
+
+With gcc 9.2, Q_FOREACH only loops over the first element [1]. Fix
+this by backporting [2]. That commit is for other reasons, but also
+fixes this.
+
+Original commit by Thiago Macieira <thiago.macieira@intel.com>:
+
+It's possible to do without them, which probably makes the number of
+supported compilers a lot bigger: they just need to support decltype()
+or __typeof__.
+
+That includes the Intel compiler. The old code was also apparently
+working, but no one had realized the old workaround for some old version
+was still in place.
+
+The loop overhead is more or less the same. I have not done benchmarks,
+but inspection of the generated assembly shows more or less the same
+number of instructions.
+
+Change-Id: I32d499c84a6ddd19d994b49f17a469acb5c3a3f1
+Reviewed-by: Olivier Goffart <ogoffart@woboq.com>
+Reviewed-by: Marc Mutz <marc.mutz@kdab.com>
+
+[1] https://github.com/qt/qtbase/commit/c35a3f519007af44c3b364b9af86f6a336=
f6411b
+[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D90617
+---
+ src/corelib/global/qglobal.h | 21 +++++++++++++++------
+ 1 file changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/src/corelib/global/qglobal.h b/src/corelib/global/qglobal.h
+index 96fbeee0ae..a2f9ea097a 100644
+--- a/src/corelib/global/qglobal.h
++++ b/src/corelib/global/qglobal.h
+@@ -2367,22 +2367,31 @@ typedef uint Flags;
+=20
+ #endif /* Q_NO_TYPESAFE_FLAGS */
+=20
+-#if defined(Q_CC_GNU) && !defined(Q_CC_INTEL) && !defined(Q_CC_RVCT)
++#if defined(Q_CC_GNU) && !defined(Q_CC_RVCT)
+ /* make use of typeof-extension */
+ template <typename T>
+ class QForeachContainer {
+ public:
+-    inline QForeachContainer(const T& t) : c(t), brk(0), i(c.begin()), e(=
c.end()) { }
++    inline QForeachContainer(const T& t) : c(t), i(c.begin()), e(c.end())=
, control(1) { }
+     const T c;
+-    int brk;
+     typename T::const_iterator i, e;
++    int control;
+ };
+=20
++// Explanation of the control word:
++//  - it's initialized to 1
++//  - that means both the inner and outer loops start
++//  - if there were no breaks, at the end of the inner loop, it's set to =
0, which
++//    causes it to exit (the inner loop is run exactly once)
++//  - at the end of the outer loop, it's inverted, so it becomes 1 again,=
 allowing
++//    the outer loop to continue executing
++//  - if there was a break inside the inner loop, it will exit with contr=
ol still
++//    set to 1; in that case, the outer loop will invert it to 0 and will=
 exit too
+ #define Q_FOREACH(variable, container)                                \
+ for (QForeachContainer<__typeof__(container)> _container_(container); \
+-     !_container_.brk && _container_.i !=3D _container_.e;              \
+-     __extension__  ({ ++_container_.brk; ++_container_.i; }))           =
            \
+-    for (variable =3D *_container_.i;; __extension__ ({--_container_.brk;=
 break;}))
++    _container_.control && _container_.i !=3D _container_.e;            \
++    ++_container_.i, _container_.control ^=3D 1)                        \
++    for (variable =3D *_container_.i; _container_.control; _container_.co=
ntrol =3D 0)
+=20
+ #else
+=20
+--=20
+2.17.1
+
diff --git a/recipes-qt4/qt4/qt4-4.8.7/0039-silence-some-loud-but-innocent-=
warnings.patch b/recipes-qt4/qt4/qt4-4.8.7/0039-silence-some-loud-but-innoc=
ent-warnings.patch
new file mode 100644
index 0000000..0647261
--- /dev/null
+++ b/recipes-qt4/qt4/qt4-4.8.7/0039-silence-some-loud-but-innocent-warning=
s.patch
@@ -0,0 +1,91 @@
+From e03ee6b5bca6ab457a16faa8399ba20cd5cc1fbc Mon Sep 17 00:00:00 2001
+From: Jeroen Hofstee <jhofstee@victronenergy.com>
+Date: Sat, 16 Nov 2019 16:50:00 +0100
+Subject: [PATCH] silence some loud but innocent warnings
+
+These warnings are harmless for old code, so suppress them so real
+issue are visible in the logs.
+---
+ configure | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+
+diff --git a/configure b/configure
+index a9ba7c8ccb..6ebf71ab21 100755
+--- a/configure
++++ b/configure
+@@ -3435,6 +3435,72 @@ if [ -n "$CFG_SYSROOT" ]; then
+ fi
+ export SYSROOT_FLAG    # used by config.tests/unix/compile.test
+=20
++# Since qt4 is no longer officialy maintained, silence the harmless warni=
ngs
++# since nobody is going to fix them anyway...
++
++if compilerSupportsFlag $TEST_COMPILER -Wunused-but-set-variable -Werror;=
 then
++	QMakeVar add QMAKE_CFLAGS -Wno-unused-but-set-variable
++	QMakeVar add QMAKE_CXXFLAGS -Wno-unused-but-set-variable
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wunused-function -Werror; then
++	QMakeVar add QMAKE_CFLAGS -Wno-unused-function
++	QMakeVar add QMAKE_CXXFLAGS -Wno-unused-function
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wunused-variable -Werror; then
++	QMakeVar add QMAKE_CFLAGS -Wno-unused-variable
++	QMakeVar add QMAKE_CXXFLAGS -Wno-unused-variable
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wunused-local-typedefs; then
++	QMakeVar add QMAKE_CFLAGS -Wno-unused-local-typedefs
++	QMakeVar add QMAKE_CXXFLAGS -Wno-unused-local-typedefs
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wimplicit-fallthrough -Werror; th=
en
++	QMakeVar add QMAKE_CFLAGS -Wno-implicit-fallthrough
++	QMakeVar add QMAKE_CXXFLAGS -Wno-implicit-fallthrough
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wunused-parameter -Werror; then
++	QMakeVar add QMAKE_CFLAGS -Wno-unused-parameter
++	QMakeVar add QMAKE_CXXFLAGS -Wno-unused-parameter
++fi
++
++# when a compiler starts guessing it is often wrong..
++if compilerSupportsFlag $TEST_COMPILER -Wmaybe-uninitialized -Werror; the=
n
++	QMakeVar add QMAKE_CFLAGS -Wno-maybe-uninitialized
++	QMakeVar add QMAKE_CXXFLAGS -Wno-maybe-uninitialized
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wswitch -Werror; then
++	QMakeVar add QMAKE_CFLAGS -Wno-switch
++	QMakeVar add QMAKE_CXXFLAGS -Wno-switch
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wdeprecated-copy -Werror; then
++	QMakeVar add QMAKE_CXXFLAGS -Wno-deprecated-copy
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wdeprecated-declarations -Werror;=
 then
++	QMakeVar add QMAKE_CXXFLAGS -Wno-deprecated-declarations
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wparentheses -Werror; then
++	QMakeVar add QMAKE_CXXFLAGS -Wno-parentheses
++fi
++
++if compilerSupportsFlag $TEST_COMPILER -Wclass-memaccess -Werror; then
++	QMakeVar add QMAKE_CXXFLAGS -Wno-class-memaccess
++fi
++
++# note: parameter passing for argument of type 'QMap<QSettingsKey, QVaria=
nt>::iterator' changed in GCC 7.1
++# Assuming that OE is used to rebuild all sources, there is no need to wo=
rry about abi changes..
++if compilerSupportsFlag $TEST_COMPILER -Wpsabi -Werror; then
++	QMakeVar add QMAKE_CXXFLAGS -Wno-psabi
++fi
++
+ # auto-detect precompiled header support
+ if [ "$CFG_PRECOMPILE" =3D "auto" ]; then
+     if [ `echo "$CFG_MAC_ARCHS" | wc -w` -gt 1 ]; then
+--=20
+2.17.1
+
diff --git a/recipes-qt4/qt4/qt4-native.inc b/recipes-qt4/qt4/qt4-native.in=
c
index b813f9e..8a964c6 100644
--- a/recipes-qt4/qt4/qt4-native.inc
+++ b/recipes-qt4/qt4/qt4-native.inc
@@ -18,6 +18,8 @@ SRC_URI =3D "http://download.qt-project.org/official_rele=
ases/qt/4.8/${PV}/qt-ever
            file://0015-configure-add-nostrip-for-debug-packages.patch  \
            file://0021-configure-make-qt4-native-work-with-long-building-p=
a.patch \
            file://0036-qt-everywhere-opensource-src-4.8.7-gcc6.patch \
+           file://0038-prevent-gcc-9.2-miscompiling-Q_FOREACH.patch \
+           file://0039-silence-some-loud-but-innocent-warnings.patch \
            file://gcc-version.patch \
            file://g++.conf \
            file://linux.conf \
--=20
2.17.1


