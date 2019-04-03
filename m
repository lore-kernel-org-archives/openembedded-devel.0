Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 915E77C68F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 08:29:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t17so7069351wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XoQkJbtOrcNMepME5PByCloVCowJNiQULhVufyiqpLA=;
	b=tamVmAC7l8IgI4B7OO81WxzXAvR0R0XfUVucRrMnzuuWpqRl/0GAGswBfPtVn5pTcJ
	OrUY0LIE3K7X0Ca/JVex51iebM1qJhzrekWKA7x6zYe+CBDPt5por7dR+SRtnNBpIisD
	gZEJx05fK7pTl3bzj8BmFOHsWll+lxQDEmpgyNOZN57TGKx54oSuR8sY3aYw0Nv7QDmS
	ZA0Q6eTBXNZNrSu/cPdguUjPxCgCNxs+Hq0Ps1BuqFNPxawgrwWDr4SWsjoL6rs6n+wC
	EmvEEOIOu+E80AHB5Jf+IiaEFI37MYbZdU4WdZZ5Y9s6CPBbZ5Hb5CED3PDiny+3UbGh
	O0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XoQkJbtOrcNMepME5PByCloVCowJNiQULhVufyiqpLA=;
	b=CjMz2jss70PFgtO0pkOdSAqVFiAQVEfOJcj4HkbXV03pxmjRcUyVphNYLg292WhMlI
	K3g1XQuSooyL27Q1bSfubs4osStTtTDrftugUxieVa/7SLLSZUN7tYPCBAUgXqH9uXlC
	kyxf2UNmFrCR2cN9cJN8uLTP+zwSt+o1jKbRvpHWMvTEjQ1LHxaIU5BIPf5aRKCjLj66
	q90iacYJ/t8/pe0JvIkzpZqkxbeOBpC+uF2vAovvH8QRQ5DtzCREW24u4L6DUioD10CU
	LO2o6mSSX10p41TgX0Tbmkwum2zJx0ojXAhMyHRHhhWwHGhjocxN+8snBqKZBM12pmxB
	fVXQ==
X-Gm-Message-State: APjAAAWTahutqxDZlo1894xvk5OYhI9EqT6xi8Fgp+Fyeay8zMS92R/o
	Pj0frHheH+Ias0v3fT8gu4ck9fViJxo=
X-Google-Smtp-Source: APXvYqzrvMFBWEhkve2IBrU03HT6bzsqX2kGmaph5vs+duWnZRaab1YN4wud0PQS6NjLHWgRr5M2BQ==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr47256840wrr.275.1554280195988; 
	Wed, 03 Apr 2019 01:29:55 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	([2a04:cec0:1050:ef0b:a7a5:d60d:857c:6708])
	by smtp.gmail.com with ESMTPSA id l21sm6975587wme.4.2019.04.03.01.29.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Apr 2019 01:29:55 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2019 10:28:41 +0200
Message-Id: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/3] zeromq: bump version 4.2.5 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 08:29:55 -0000

Also, use cmake instead of autotools to build it.

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 .../recipes-connectivity/zeromq/zeromq_4.2.5.bb    | 32 ----------------------
 .../recipes-connectivity/zeromq/zeromq_4.3.1.bb    | 26 ++++++++++++++++++
 2 files changed, 26 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
 create mode 100644 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
deleted file mode 100644
index 356348b..0000000
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
-HOMEPAGE = "http://www.zeromq.org"
-LICENSE = "LGPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
-
-PACKAGECONFIG ??= "libsodium"
-PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
-
-SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
-    file://run-ptest \
-"
-SRC_URI[md5sum] = "a1c95b34384257e986842f4d006957b8"
-SRC_URI[sha256sum] = "cc9090ba35713d59bb2f7d7965f877036c49c5558ea0c290b0dcc6f2a17e489f"
-
-S = "${WORKDIR}/zeromq-${PV}"
-
-#Uncomment to choose polling system manually. valid values are kqueue, epoll, devpoll, poll or select
-#EXTRA_OECONF += "--with-poller=kqueue"
-#CFLAGS_append = " -O0"
-#CXXFLAGS_append = " -O0"
-
-inherit autotools ptest pkgconfig
-
-do_compile_ptest () {
-    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${B}/Makefile
-    oe_runmake buildtest-TESTS
-}
-
-do_install_ptest () {
-    install -d ${D}${PTEST_PATH}/tests
-    install -m 0755 ${B}/tests/.libs/test_* ${D}${PTEST_PATH}/tests
-}
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb
new file mode 100644
index 0000000..6e13376
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
+HOMEPAGE = "http://www.zeromq.org"
+LICENSE = "LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
+
+PACKAGECONFIG ??= "libsodium"
+PACKAGECONFIG[libsodium] = "-DWITH_LIBSODIUM=ON,-DWITH_LIBSODIUM=OFF, libsodium"
+
+SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
+    file://run-ptest \
+"
+SRC_URI[md5sum] = "64cbf3577afdbfda30358bc757a6ac83"
+SRC_URI[sha256sum] = "bcbabe1e2c7d0eec4ed612e10b94b112dd5f06fcefa994a0c79a45d835cd21eb"
+
+inherit cmake ptest pkgconfig
+
+EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DBUILD_TESTS=ON', '-DBUILD_TESTS=OFF', d)} \
+                 -DCMAKE_SKIP_RPATH=ON \
+"
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/bin/test_* ${D}${PTEST_PATH}/tests
+}
+
+FILES_${PN}-doc += "${datadir}/zmq/*.txt"
-- 
2.7.4


