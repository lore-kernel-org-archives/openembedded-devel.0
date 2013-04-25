Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UVGri-0007wD-7X
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 09:45:16 +0200
Received: by mail-pd0-f172.google.com with SMTP id 4so1640933pdd.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=tAqeBdN/rMuAqfczNjBp1NPLKW0mB3UEkORnCXYTmw0=;
	b=rzGcmpdxplYx04CAUq5GcmiwB3SfzE76KcYHqZscC1Zcm8uB23gec1vQSiLD4rJ7Cq
	4GyyJkkC6KJCq7YfAAN/K1kEHOwxVUyhgQbBaYfFz8OoEbqtxnfXo2bS3RtxsShlBbM2
	sPyxe89tTPNao5HUCHu2mb+OnmwGySAWqxlncS+0pjq03XNSE5HFRTbzFS5RyeMNVTDv
	WE334HafKIiibpimLAbNCuuXKiler/ChJ9SQFOagIzrI+l6hnN7BrP6iyFAOhbH3/UFo
	K+q9ClHpib0YhFfCybY0lm4s5+T2I2m57PXIShqKNTdb48z8KNY4Wf0n8tUqOJPmfm4t
	oJ+w==
X-Received: by 10.66.235.3 with SMTP id ui3mr27681188pac.200.1366874850389;
	Thu, 25 Apr 2013 00:27:30 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id g8sm7048229pae.7.2013.04.25.00.27.28
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 00:27:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2013 00:26:19 -0700
Message-Id: <1366874779-31059-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] nuttcp_7.2.1.bb: Add new recipe
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
X-List-Received-Date: Thu, 25 Apr 2013 07:45:16 -0000

nuttcp is a network perf measurement tool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
new file mode 100644
index 0000000..225ba1f
--- /dev/null
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
@@ -0,0 +1,31 @@
+# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "network performance measurement tool"
+DESCRIPTION = "nuttcp is a network performance measurement tool intended for use by network \
+and system managers. Its most basic usage is to determine the raw TCP (or UDP) \
+network layer throughput by transferring memory buffers from a source system \
+across an interconnecting network to a destination system, either transferring \
+data for a specified time interval, or alternatively transferring a specified \
+number of bytes."
+HOMEPAGE = "http://www.nuttcp.net/nuttcp/Welcome%20Page.html"
+LICENSE = "GPL-2.0"
+SECTION = "net"
+DEPENDS = ""
+PR = "r0"
+LIC_FILES_CHKSUM = "file://nuttcp-${PV}.c;beginline=4;endline=30;md5=ae7045c3c3616092e07d87f04ba0d960"
+
+SRC_URI = "http://lcp.nrl.navy.mil/nuttcp/beta/nuttcp-${PV}.c"
+SRC_URI[md5sum] = "1ebf4a08bad2a295a8155f02995e8754"
+SRC_URI[sha256sum] = "c6e33810ccce67260f8d5d627f60e429d44f532365c58ed5673d035e2a59c4db"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} ${CFLAGS} -o nuttcp nuttcp-${PV}.c
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 nuttcp ${D}${bindir}
+}
-- 
1.7.9.5



