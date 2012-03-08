Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S5jTY-0005ju-OU
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 20:58:12 +0100
Received: by obqv19 with SMTP id v19so1154458obq.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 11:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=GLFBobF3+tV+hlGW46l5XdkC3BaazWsVosVsUnhU62M=;
	b=U9AHsjsLRxPFfAIxdyjBuuzgGT6n8deaeBo0J1tU18D6N8XusTlQBafcsY+sq7BAhq
	UNbF4E5yiVUXQO+Q/lUNLOFKjiPMHh/ccWNJ59Mv2ThlYurqtlK0L3fBRfa10wWAZRDL
	7ox+aKd4lPDC57d+zqUS26syHjIQL5ccbMcE1W6Vc94uKS5AvFhXUaAX8Mt4WusQ5wcP
	FpZuvsc25B9DxJ6gf9R6TWhqiK57vbldLFY6CfFkuKo4XMLmEZqB6mfZPUFE6ZQ93l9X
	GdyXb9QvWd3pgDkwvDjrFzAuOjS+4iEGyugtN8R5LzoQZ8MFVHxAVTMxAVE5KBZO2Hmw
	67ZQ==
Received: by 10.182.169.4 with SMTP id aa4mr2834812obc.62.1331236173640;
	Thu, 08 Mar 2012 11:49:33 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id n7sm1418176oeh.4.2012.03.08.11.49.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 11:49:32 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 12:49:29 -0700
Message-Id: <1331236169-21550-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH] fio: Add initial recipe for version 2.0.5
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
X-List-Received-Date: Thu, 08 Mar 2012 19:58:13 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta-oe/recipes-benchmark/fio/fio_2.0.5.bb |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio_2.0.5.bb

diff --git a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb b/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
new file mode 100644
index 0000000..4c086c8
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Filesystem and hardware benchmark and stress tool"
+DESCRIPTION = "fio is an I/O tool meant to be used both for benchmark and \
+stress/hardware verification. It has support for a number of I/O engines, \
+I/O priorities (for newer Linux kernels), rate I/O, forked or threaded jobs, \
+and much more. It can work on block devices as well as files. fio accepts \
+job descriptions in a simple-to-understand text format. Several example job \
+files are included. fio displays all sorts of I/O performance information."
+HOMEPAGE = "http://freecode.com/projects/fio"
+SECTION = "console/tests"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+
+DEPENDS = "libaio"
+
+# rev for v2.0.5
+SRCREV = "02efadeb8b05144bcf2fc7796e1da2e7db211d00"
+SRC_URI = "git://git.kernel.dk/fio.git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+
+do_install() {
+	oe_runmake install DESTDIR=${D} bindir=${bindir} mandir=${mandir}
+	install -d ${D}/${docdir}/${PN}
+	cp -a ${S}/examples ${D}/${docdir}/${PN}/
+}
-- 
1.7.0.4



