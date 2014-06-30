Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0240.outbound.protection.outlook.com [207.46.163.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0D160559
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 02:25:32 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB394.namprd03.prod.outlook.com (10.141.141.13) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 02:25:31 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.22]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.22]) with mapi id
	15.00.0974.002; Mon, 30 Jun 2014 02:25:31 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] libhugetlbfs: arm 32bit support
Thread-Index: AQHPiqO6XelOop+Ls0GRvamW3pxrCZuI/8Sw
Date: Mon, 30 Jun 2014 02:25:30 +0000
Message-ID: <3731aa39aae649be80dd07a5645f3665@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1403061135-22767-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1403061135-22767-1-git-send-email-b40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:
x-forefront-prvs: 0258E7CCD4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(377454003)(199002)(189002)(13464003)(77982001)(79102001)(77096002)(76482001)(33646001)(85306003)(83322001)(99286002)(95666004)(74502001)(19580395003)(19580405001)(46102001)(83072002)(85852003)(99396002)(4396001)(21056001)(76176999)(50986999)(106116001)(76576001)(81542001)(105586002)(81342001)(74662001)(31966008)(92566001)(101416001)(86362001)(54356999)(2656002)(87936001)(20776003)(66066001)(107046002)(64706001)(80022001)(106356001)(74316001)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB394;
	H:BY2PR03MB254.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] libhugetlbfs: arm 32bit support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jun 2014 02:25:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pings.



-----Original Message-----
From: b40290@freescale.com [mailto:b40290@freescale.com]=20
Sent: Wednesday, June 18, 2014 11:12 AM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
Subject: [meta-oe][PATCH] libhugetlbfs: arm 32bit support

From: Chunrong Guo <B40290@freescale.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../libhugetlbfs/files/arm32-support.patch         | 29 ++++++++++++++++++=
++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  3 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)  create mode 100644 meta-=
oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.pat=
ch b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
new file mode 100644
index 0000000..96f162d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Submitted
+
+This patch adds support for arm32.
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/Makefileold	2014-06-17 21:55:23.131058918 -0500
++++ b/Makefile	2014-06-17 21:56:08.726098531 -0500
+@@ -59,6 +59,12 @@
+ TMPLIB32 =3D lib
+ CPPFLAGS +=3D -DPPC_NO_SEGMENTS
+ else
++ifeq ($(ARCH),arm)
++CC32 =3D $(CC)
++TMPLIB32 =3D lib
++ELF32 +=3D armelf_linux_eabi
++CUSTOM_LDSCRIPTS =3D no
++else
+ ifeq ($(ARCH),armv7l)
+ CC32 =3D $(CC)
+ TMPLIB32 =3D lib
+@@ -116,6 +122,7 @@
+ endif
+ endif
+ endif
++endif
+=20
+ ifdef CC32
+ OBJDIRS +=3D obj32
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/m=
eta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 5645add..879f2a0 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -14,11 +14,12 @@ SRC_URI =3D "git://git.code.sf.net/p/libhugetlbfs/code =
\
     file://0001-aarch64-fix-cross-compilation.patch \
     file://0001-aarch64-fix-page-size-not-properly-computed.patch \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch=
 \
+    file://arm32-support.patch \
 "
=20
 S =3D "${WORKDIR}/git"
=20
-COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
+COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
=20
 LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
 EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC}' $=
{LIBARGS} V=3D1"
--
1.9.2


