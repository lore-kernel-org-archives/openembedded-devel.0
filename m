Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 981EA7F2B5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:43:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x848gYe4017442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Sep 2019 01:43:05 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 4 Sep 2019 01:43:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Sep 2019 04:42:29 -0400
Message-ID: <20190904084229.17739-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190904084229.17739-1-kai.kang@windriver.com>
References: <20190904084229.17739-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][Patch 2/2] lmbench: update script lmbench-run
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
X-List-Received-Date: Wed, 04 Sep 2019 08:43:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove BINDIR in script lmbench-run which is useless and causes multilib
file confliction:

| Error: Transaction check error:
|   file /usr/bin/lmbench-run conflicts between attempted installs of
    lmbench-3.0+a9-r2.core2_64 and lib32-lmbench-3.0+a9-r2.core2_32

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run | 1 -
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb   | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run b/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run
index e904c75e4..2716bf935 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run
@@ -4,7 +4,6 @@
 # Javier Fernandez-Sanguino.
 # Distributed under the GPL
 SHAREDIR=/usr/share/lmbench/
-BINDIR=/usr/lib/lmbench/
 SCRIPTSDIR=$SHAREDIR/scripts
 RESULTSDIR=$SHAREDIR/results
 CONFIG=/var/lib/lmbench/config/`$SCRIPTSDIR/config`
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 8e6e803a8..7e20b7da6 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -54,7 +54,7 @@ do_compile () {
 
 do_install () {
     install -d ${D}${sysconfdir}/default/volatiles \
-           ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \
+           ${D}${bindir} ${D}${mandir} \
            ${D}${datadir}/lmbench/scripts
 
     echo "d root root 0755 ${localstatedir}/run/${BPN} none" \
@@ -71,7 +71,6 @@ do_install () {
     mv ${D}${bindir}/line ${D}${bindir}/lm_line
     install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
     sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${BPN},;' \
-           -e 's,^BINDIR=.*$,BINDIR=${libdir}/${BPN},;' \
            -e 's,^CONFIG=.*$,CONFIG=`$SCRIPTSDIR/config`,;' \
            ${D}${bindir}/lmbench-run
     install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
@@ -89,4 +88,4 @@ pkg_postinst_${PN} () {
 }
 
 RDEPENDS_${PN} = "perl"
-FILES_${PN} += "${datadir}/lmbench ${libdir}/lmbench"
+FILES_${PN} += "${datadir}/lmbench"
-- 
2.20.0


