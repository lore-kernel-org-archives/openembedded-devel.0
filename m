Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 206817318B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 19:43:04 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id o11so62242729qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=5yR5vqdjatbU6Tb7Ze5IHYeYPQlPnTh66SEKqyMQySI=;
	b=nJaefJmyKn9CINpUMHuR6FX+ZKX2OP7NUDaC33Ww4cYybCdb7hhP2kbP49X0FCIMmz
	C8fvtX3UaQIpA8vsHqT5+yAimpCApAZhKGyR3lMzBtgga1rUKq5pj3Txn1hPz0CUnbAX
	wWH10ZWp3OstCDTPY5Z90V1KROKUIltGKk9jSa0ZSeiZcmKJJs88Qqj1hDfyWvyGaaFR
	hfTXfD2vWkMdAFceCXSO1AybLc70fd70ETvNAa5VgK9RUnAOOEe2EUCKEb7wRsU7rS2H
	hiIoVlKzHhzU3Lqd6E6OEVo9ywf5hkRh7Z89i8k8+GfjLlIGd/0nstKygEHt1gNNxxHv
	O2Ow==
X-Received: by 10.140.151.145 with SMTP id 139mr36988965qhx.95.1450813385058; 
	Tue, 22 Dec 2015 11:43:05 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59]) by smtp.gmail.com with ESMTPSA id
	g63sm16650005qgd.5.2015.12.22.11.43.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Dec 2015 11:43:04 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:43:00 -0500
Message-Id: <1450813380-3570-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Tue, 22 Dec 2015 19:43:05 -0000

 * Run tested cpp bindings with GNU Radio Control Port.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
new file mode 100644
index 0000000..43b93cd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -0,0 +1,30 @@
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf"
+
+SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
+"
+SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
+S = "${WORKDIR}/git"
+
+DEPENDS = "thrift-native boost python libevent flex-native bison-native openssl"
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit pkgconfig cmake pythonnative
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS
+export HOST_SYS
+
+EXTRA_OECMAKE = "-DWITH_QT4=OFF"
+EXTRA_OECMAKE_append_class-native = "-DWITH_QT4=OFF -DBUILD_TESTING=OFF \
+             -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
+EXTRA_OECMAKE_append_class-nativesdk = "-DBUILD_TESTING=OFF \
+             -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
+
+do_install_append () {
+	cd ${D}/${bindir}
+	ln -sf thrift thrift-compiler
+}
+
-- 
2.1.0


