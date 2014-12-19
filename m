Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C315F728E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 10:17:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45508975"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Dec 2014 18:14:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBJAH5l2017514
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 18:17:05 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 19 Dec 2014 18:17:31 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Dec 2014 18:16:43 +0800
Message-ID: <1418984204-9524-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] dstat: add new recipe
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
X-List-Received-Date: Fri, 19 Dec 2014 10:17:34 -0000
Content-Type: text/plain

Dstat is a versatile replacement for vmstat, iostat, netstat and ifstat.
Dstat overcomes some of their limitations and adds some extra features,
more counters and flexibility.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/dstat/dstat_0.7.2.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/dstat/dstat_0.7.2.bb

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb b/meta-oe/recipes-support/dstat/dstat_0.7.2.bb
new file mode 100644
index 0000000..190f940
--- /dev/null
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "versatile resource statics tool" 
+DESCRIPTION = "Dstat is a versatile replacement for vmstat, iostat, netstat and ifstat. \
+Dstat overcomes some of their limitations and adds some extra features, more counters \
+and flexibility. Dstat is handy for monitoring systems during performance tuning tests, \
+benchmarks or troubleshooting."
+HOMEPAGE = "http://dag.wiee.rs/home-made/dstat" 
+LICENSE = "GPLv2" 
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" 
+SRC_URI = "git://github.com/dagwieers/dstat.git" 
+SRC_URI[md5sum] = "798e050e2e024f08a272dd4b0e1eba41" 
+SRC_URI[sha256sum] = "96d1e6ea2434e477fa97322d92778f68458d7e57bc55bc4f72e29467a52cffd1" 
+
+SRCREV = "5251397eb8d3b284a90bfdfaec0c8e1210146e3f" 
+
+S = "${WORKDIR}/git" 
+
+do_compile_prepend() {
+    #undo the step "make docs"
+    sed -i -e 's/$(MAKE) -C docs docs/# $(MAKE) -C docs docs/;' ${S}/Makefile
+}
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
-- 
1.8.4.2


