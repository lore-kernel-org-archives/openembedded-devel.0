Received: from mail-pd0-f175.google.com ([209.85.192.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UVOeO-00034I-2w
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 18:04:01 +0200
Received: by mail-pd0-f175.google.com with SMTP id g12so50080pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=JQDx8VUEkvAVxMB5iejNHArE/8BDIi0Ih6WQ+8B7Kcs=;
	b=e5MJEf8jPSZtFR4AFrHjVVrOG4p8gKuqNLDJSIKSDFGU0VujN7U48wjI8h5kntA65/
	CNuIVkdCgtJyhJewJ0OkaM5slwj3kcxsRJSujr1BZZe75a2kUWll9NLu9sRsCHlMN+tP
	c0qoKRh17AMtjy3pnDhJJRXUg0OMs5FgK1lKDpdZX4rCxhopSaJbFXbqopPxZBFDIdmq
	S7vwy3NCSBtlSd3CiPrxvoLEjA6oK4pJGuwlOEJScKbU2BFF2TlxcgtOwou5atHHXL3+
	fOFSMtwORC0t4wDYz5f3bm5xf0gTzr6+eFMGytlXq7Ry6LFRfThCKA29+n7NS81yAGZo
	tExg==
X-Received: by 10.66.220.104 with SMTP id pv8mr25536262pac.72.1366904775828;
	Thu, 25 Apr 2013 08:46:15 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id do4sm7834990pbc.8.2013.04.25.08.46.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 08:46:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2013 08:45:06 -0700
Message-Id: <1366904706-32419-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH V2] nuttcp_7.2.1.bb: Add new recipe
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
X-List-Received-Date: Thu, 25 Apr 2013 16:04:02 -0000

nuttcp is a network perf measurement tool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
new file mode 100644
index 0000000..b931d04
--- /dev/null
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
@@ -0,0 +1,29 @@
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



