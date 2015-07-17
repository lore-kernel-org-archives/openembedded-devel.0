Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA8A65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 22:58:27 +0000 (UTC)
Received: from dastp.lan ([37.24.103.185]) by mail.gmx.com (mrgmx103) with
	ESMTPSA (Nemesis) id 0LwrS8-1Ys0fj0kwq-016OLy; Sat, 18 Jul 2015 00:58:27
	+0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jul 2015 00:57:47 +0200
Message-Id: <1437173867-10687-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <CAJ86T=V63jLD9gbVF6YOU-ixQgpO79y0+JxoiDmmM=prUQrHAA@mail.gmail.com>
References: <CAJ86T=V63jLD9gbVF6YOU-ixQgpO79y0+JxoiDmmM=prUQrHAA@mail.gmail.com>
MIME-Version: 1.0
X-Provags-ID: V03:K0:9ji4u3Qwm6hxWqgAZAeGZHg6iAKOESxjX3Wq4jcH3AH1xcdX4Cq
	IDcn4a52WuEKUe7GhALOZvOo3BafkKyhMT4tPZ3zMzQ0/J0NHHcV1Tdw/kCpzKmSi9JzAnr
	/1eA/n+GwLxjIcQRPdB7TqIcEO4m3rNKDtWLaXsoFncfG5F4md96HRCh7WAVkVxvU9CRh3J
	gdorAvEnbmpujuCjXO85w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2S/ikKZEX6E=:d+J6tmnF63pGt8INZCiC0X
	bmDMCXC7tt02YO8n1Kjl/i5AZYSLgREqcBv7bmTe/PioHuGfgqyp09TYkFnv8R1lR5hh3FdOn
	DshLdOIzE+2BMLh9odOzpUBJT5GOQ8Tm8gdtrao3N45dhYMOTUx14Yp3Yu26uOtfgwMG4K+ow
	zxBX+GXW6RsynozQmHfAEMDVKXRpY8cmjujKTvN3YOK8ujtUCjQeQEZ5W817QPAWLmfza8h1W
	R6hFy0hsEAKcIDMDiiZXfUtkqKW5R/XxTkfp5OjvoAocw56e0CMYHsHvV4QCO4MrWCo5jsUQj
	FexAtKZu4/Pbel/aQyLKszZ3qkcBPy0PEoRGBkt8IvFccyuFGZ69hENafOkkDnNSWiR1ht744
	Elx4Z6HtosrdckActgZN07h54DLz2tMPy9f1UGScCzLhZtdbjbEd+yHFWq3dajMywHrHqXC7J
	B6BPJdb6sf2XS94NacuY47dKvGT0Ss3JGkV3IrGKRMZWgIzfY5zdLqg+Z+URRc2O5U1ggJXAO
	gk22lUlDDStep7Ea1mDKoViYrWlsmprSvNE/saUwnFqhu0rHR1aFZ3/zBgYuj/ml7MIA2R+Ee
	FJ3ux4JvALX78q8yiYFbDie6TYTA8V34ciqpxqsZPfDsfRItJ1iI/11CM58aTTyjpOF2ZpC2h
	pC/HRzXi5CNkv4S9+KpzPrJ8+Kx6/i7sPjng0sbZ2m8lSd34DPmkgsrvyTOu2829jrLY=
Subject: [meta-oe][PATCH v2] fio: Add PACKAGECONFIG for numa, re-enable ARM build
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
X-List-Received-Date: Fri, 17 Jul 2015 22:58:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make fio's NUMA support optional via PACKAGECONFIG.
Enable this feature by default, except on ARM where libnuma/numactl
is not available.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
index 82f9cd4..dca0e64 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
@@ -10,10 +10,14 @@ SECTION = "console/tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-DEPENDS = "libaio zlib numactl"
+DEPENDS = "libaio zlib"
 
+PACKAGECONFIG_NUMA = "numa"
 # ARM does not currently support NUMA
-COMPATIBLE_HOST = "^((?!arm).*)$"
+PACKAGECONFIG_NUMA_arm = ""
+
+PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
+PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 # rev for v2.2.6
 SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
@@ -23,6 +27,10 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
 
+do_configure() {
+    ./configure ${EXTRA_OECONF}
+}
+
 do_install() {
     oe_runmake install DESTDIR=${D} prefix=${prefix} mandir=${mandir}
     install -d ${D}/${docdir}/${PN}
-- 
2.4.5


