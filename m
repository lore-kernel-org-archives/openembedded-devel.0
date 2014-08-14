Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id AAD0465F2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:54:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 4B01E2B0111D;
	Thu, 14 Aug 2014 09:54:36 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Aug 2014 09:54:05 +0200
Message-Id: <1408002845-30625-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH v2] rabbitmq-c: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 07:54:38 -0000

rabbitmq-c is a C library providing an implementation of AMQP client for
use with v2.0+ of the RabbitMQ broker

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 .../recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
new file mode 100644
index 0000000..5a02c99
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A C-language AMQP client library for use with v2.0+ of the RabbitMQ broker"
+HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
+LICENSE = "MIT"
+
+SRC_URI = "https://github.com/alanxz/rabbitmq-c/releases/download/v${PV}/rabbitmq-c-${PV}.tar.gz"
+SRC_URI[md5sum] = "b1f902c658c772cda464754678d8deb6"
+SRC_URI[sha256sum] = "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa"
+
+DEPENDS = "popt openssl"
+
+EXTRA_OECONF = "--disable-examples --enable-tools --disable-docs"
+
+inherit autotools pkgconfig
+
+PACKAGE_BEFORE_PN += "${PN}-tools"
+FILES_${PN}-tools = "${bindir}"
-- 
1.9.0


