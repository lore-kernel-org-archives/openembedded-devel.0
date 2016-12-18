Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 320 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 18 Dec 2016 17:54:59 UTC
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id A85126093D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Dec 2016 17:54:59 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 3CE5EA002F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Dec 2016 18:50:31 +0100 (CET)
Received: from lws-mklieser.phytec.de ([172.16.26.57])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016121818493977-222771 ;
	Sun, 18 Dec 2016 18:49:39 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Dec 2016 18:49:28 +0100
Message-Id: <1482083368-9718-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 18.12.2016 18:49:39,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 18.12.2016 18:49:39
X-TNEFEvaluated: 1
Subject: [meta-oe][PATCH] pmbw: add recipe for ram benchmarks
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
X-List-Received-Date: Sun, 18 Dec 2016 17:54:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This adds the Parallel Memory Bandwidth Benchmark tool to the layer. It
consists of a collection of assembly routines for testing cache and
memory access performance. It also contains a converter to generate
gnuplot scripts for the results.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta-oe/recipes-benchmark/pmbw/pmbw=5Fgit.bb | 28 ++++++++++++++++++++++++=
++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/pmbw/pmbw=5Fgit.bb

diff --git a/meta-oe/recipes-benchmark/pmbw/pmbw=5Fgit.bb b/meta-oe/recipes=
-benchmark/pmbw/pmbw=5Fgit.bb
new file mode 100644
index 0000000..7a69395
--- /dev/null
+++ b/meta-oe/recipes-benchmark/pmbw/pmbw=5Fgit.bb
@@ -0,0 +1,28 @@
+SUMMERY =3D "Parallel Memory Bandwidth Measurement / Benchmark"
+DESCRIPTION =3D "\
+The tool pmbw is a set of assembler routines to measure the parallel memor=
y \
+(cache and RAM) bandwidth of modern multi-core machines."
+HOMEPAGE =3D "http://panthema.net/2013/pmbw/"
+SECTION =3D "benchmark/tests"
+AUTHOR =3D "Timo Bingmann"
+LICENSE =3D "GPLv3"
+LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
+
+SRC=5FURI =3D "git://github.com/bingmann/pmbw;protocol=3Dhttps"
+
+PV =3D "0.6.2+git${SRCPV}"
+SRCREV =3D "4a3b37728060a8aba06fc83f157a1965088d79d6"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools
+
+# the hand coded asm uses r11, which therefore cannot be used for storing
+# the frame pointer when debugging on arm
+SELECTED=5FOPTIMIZATION=5Fremove=5Farm =3D "-fno-omit-frame-pointer"
+
+PACKAGES =3D+ "${PN}-stats2gnuplot"
+
+FILES=5F${PN}-stats2gnuplot =3D "${bindir}/stats2gnuplot"
+
+RRECOMMENDS=5F${PN} =3D "${PN}-stats2gnuplot"
--=20
1.9.1


