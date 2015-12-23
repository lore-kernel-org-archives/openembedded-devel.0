Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4D17E6FF77
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 21:33:45 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id 6so8201916qgy.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=GB4Py2FctlDGDbYyCuHuApvP/yK1jbLfCvKxVh0bUxU=;
	b=sLqe4RWlUQnWV0/WFUtugp/qm6v3j29AWy3RnRJ3txcg0C2ExH3yGjb4a0RgqiG+Ai
	uwoOKfH0IOt9LkduFidVu3/qqX6q6iSH5zOgq4hKmLyMQmnuihb7L8KinuKWJKThZ+v7
	AvxUtWaep1L/QB/zmuwKhV1xAz2efceX4jvuzkz2XtcAHtf1uh5YoOI68xUb5YiGGqPT
	p/NnYvPIpeRt0+V9qNrbskFpNHJgmwaoMxSHFpNZv7ur6GtwboVvcim8qizMhlW3665H
	fQUQRW7oqgRlqHmcczo563o7dE5AhsoDgF7lFKdfuDZ1OQ5VJ+7Ziy8f6G8XAlpFBjXD
	L9Uw==
X-Received: by 10.140.229.72 with SMTP id z69mr44013535qhb.104.1450906426384; 
	Wed, 23 Dec 2015 13:33:46 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59]) by smtp.gmail.com with ESMTPSA id
	d62sm18751148qga.41.2015.12.23.13.33.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 13:33:45 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Dec 2015 16:33:41 -0500
Message-Id: <1450906421-24545-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCHv2] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Wed, 23 Dec 2015 21:33:46 -0000

 * Run tested cpp bindings with GNU Radio Control Port.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
new file mode 100644
index 0000000..c8c813b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Apache Thrift"
+DESCRIPTION =  "A software framework, for scalable cross-language services development"
+HOMEPAGE = "https://thrift.apache.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf"
+
+DEPENDS = "thrift-native boost python libevent flex-native bison-native openssl"
+
+SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
+"
+SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
+S = "${WORKDIR}/git"
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
+EXTRA_OECMAKE_class-native = "-DWITH_QT4=OFF -DBUILD_TESTING=OFF \
+             -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
+EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DBUILD_TESTING=OFF \
+             -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
+
+do_install_append () {
+	ln -sf thrift ${D}/${bindir}/thrift-compiler
+}
+
-- 
2.1.0


