Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1StjVp-0006Ug-Un
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 20:07:14 +0200
Received: by qaat11 with SMTP id t11so2272733qaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 10:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7Rbe6d8I4IEHwDAwWmglTjHUPYCp3U8GGVAfM4MaxqM=;
	b=ReeLKpa5ZWy2JTPJyErPPIt6qNC9SdmKjum/4NR4wtCjHH/85RlxsQ7iTLMN9NALjK
	8Oia5++QnbE4+1+8JC6WJTt6FToQ42rd+g/DehM1D3aU9JR5lO1VPd3LIvCcmKVU/okK
	1a8eca7lTvW5i/84kY3ntEItiOyzmmWX5452j06eQxpJFNtiTBgHn9JETB69uNMUMu87
	xu1vSbjFq/hZpndhxm/QQotQ6CemeSQK2O6oP7Xsb1zqibfvx6ScjYzAMT78SSmNiw/9
	lvDkQvKMHzOFJYEIzVgxJ7t138t0GuuXzBlo7AwjUpjJzMuel3SoiBk7sILDSRfkgv1c
	BeAw==
Received: by 10.60.13.201 with SMTP id j9mr28998048oec.51.1343152544908;
	Tue, 24 Jul 2012 10:55:44 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id u5sm13890668obk.2.2012.07.24.10.55.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 10:55:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:55:38 -0700
Message-Id: <1343152538-19215-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH][meta-oe] netperf: correct paths in the example scripts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 18:07:14 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
index 6a3a81c..15174ca 100644
--- a/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
+++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
@@ -13,6 +13,8 @@ SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "0e942f22864e601406a994420231075b"
 SRC_URI[sha256sum] = "28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497"
 
+PR = "r1"
+
 inherit update-rc.d autotools
 
 S = "${WORKDIR}/netperf-${PV}"
@@ -20,6 +22,14 @@ S = "${WORKDIR}/netperf-${PV}"
 # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ macros
 CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
 
+do_configure_prepend () {
+    sed -i -e 's,^ *NETHOME=.*$,NETHOME=${bindir},' \
+           -e 's,^ *NETPERF=\./netperf$,NETPERF=${bindir}/netperf,' \
+           -e 's,^ *NETPERF=/usr/bin/netperf$,NETPERF=${bindir}/netperf,' \
+           -e 's,^ *NETPERF_CMD=.*$,NETPERF_CMD=${bindir}/netperf,' \
+           doc/examples/*_script
+}
+
 do_install() {
         install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d
         install -m 4755 src/netperf ${D}${bindir}
-- 
1.7.9.5



