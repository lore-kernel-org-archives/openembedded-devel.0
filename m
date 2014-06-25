Return-Path: <philip.balister@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5C336605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 18:50:03 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rp16so2053184pbb.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=iI2C+eq2+HRANisIrYmlDMQoQpmMyEjmSa2hvEpHXIA=;
	b=ZpvjPnZP1O9lIb5Qqc+dzKUwxD4psq8cOitnPxynYk4FGyflY2A7OlOFdiltUiofqS
	cZzh176YWwl47WE2RAeUCkxBP4mf3Z4GwDzqKotmZ1ZieTXoN3JCD281EKWSh62iCw5f
	q/gQT5mpXaAvIQcCpbi8rpDZ64vfETSb1/ZwFULt7o4973ze7FQlKTFZIpZpS03q8jWe
	OZvybNElR6ZYkOWCixkvx+NC/W2hypyF7eGaGy1UqG8zFOI/tRL0p5nowv+jHNICCFeS
	trKE7ti5X7Kc/MO8GD06rgAICVNljnYuumhGjo0fRK8LfT/tqog5yDzXT/VVQVbSV8OR
	2HTA==
X-Received: by 10.66.119.136 with SMTP id ku8mr14131678pab.121.1403722205076; 
	Wed, 25 Jun 2014 11:50:05 -0700 (PDT)
Received: from mattsbaby.amer.corp.natinst.com
	(64-186-172-226.static-ip.telepacific.net. [64.186.172.226])
	by mx.google.com with ESMTPSA id tg9sm6395712pbc.29.2014.06.25.11.50.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 11:50:04 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jun 2014 11:49:50 -0700
Message-Id: <1403722191-2291-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.9.0
Cc: Martin Townsend <martin.townsend@xsilon.com>
Subject: [meta-oe][PATCH 1/2] zero-mq : Add recipe.
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
X-List-Received-Date: Wed, 25 Jun 2014 18:50:05 -0000

Builds on ARM and tests ran on Zynq.

Signed-off-by: Philip Balister <philip@balister.org>
Signed-off-by: Martin Townsend <martin.townsend@xsilon.com>
---
 .../recipes-connectivity/zeromq/zeromq_4.0.4.bb    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
new file mode 100644
index 0000000..014114f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
+HOMEPAGE = "http://www.zeromq.org"
+LICENSE = "LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
+
+SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
+SRC_URI[md5sum] = "f3c3defbb5ef6cc000ca65e529fdab3b"
+SRC_URI[sha256sum] = "1ef71d46e94f33e27dd5a1661ed626cd39be4d2d6967792a275040e34457d399"
+
+S = "${WORKDIR}/zeromq-${PV}"
+
+#Uncomment to choose polling system manually. valid values are kqueue, epoll, devpoll, poll or select
+#EXTRA_OECONF += "--with-poller=kqueue"
+#CFLAGS_append += "-O0"
+#CXXFLAGS_append += "-O0"
+
+inherit autotools
+
+do_install_append () {
+        install -d ${D}${bindir}/tests/zeromq-${PV}
+        install -m 0755 ${B}/tests/.libs/* ${D}${bindir}/tests/zeromq-${PV}
+}
+
+PACKAGES = "${PN}-dbg ${PN}-test ${PN} ${PN}-staticdev ${PN}-doc ${PN}-dev ${PN}-locale"
+
+FILES_${PN}-dbg =+ "${bindir}/tests/zeromq-${PV}/.debug"
+FILES_${PN}-test = "${bindir}/tests"
-- 
1.9.0


