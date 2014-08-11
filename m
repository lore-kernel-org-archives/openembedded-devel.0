Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 413 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Aug 2014 14:42:01 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 731A7601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 14:42:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id D36B742AC0B;
	Mon, 11 Aug 2014 16:35:07 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Aug 2014 16:33:56 +0200
Message-Id: <1407767636-32624-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH] rabbitmq-c: add recipe
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
X-List-Received-Date: Mon, 11 Aug 2014 14:42:06 -0000

rabbitmq-c is a C library providing an implementation of AMQP client for
use with v2.0+ of the RabbitMQ broker

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 .../rabbitmq-c/rabbitmq-c_0.5.0.bb                 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
new file mode 100644
index 0000000..d8e3189
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A C-language AMQP client library for use with v2.0+ of the RabbitMQ broker"
+HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
+LICENSE = "MIT"
+
+SRC_URI = "https://github.com/alanxz/rabbitmq-c/releases/download/v${PV}/rabbitmq-c-${PV}.tar.gz"
+SRC_URI[md5sum] = "b1f902c658c772cda464754678d8deb6"
+SRC_URI[sha256sum] = "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa"
+
+PR = "r0"
+
+S = "${WORKDIR}/rabbitmq-c-${PV}"
+
+EXTRA_OECONF = "--disable-examples --enable-tools"
+
+inherit autotools pkgconfig
+
+PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-tools ${PN}"
+
+DEPENDS = "popt openssl"
+
+FILES_${PN}-tools = "${bindir}"
\ No newline at end of file
-- 
1.9.0


