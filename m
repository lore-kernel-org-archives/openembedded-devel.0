Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 973DE7C749
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 13:59:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w10so3961465wrm.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2019 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XoQkJbtOrcNMepME5PByCloVCowJNiQULhVufyiqpLA=;
	b=os1G/CtZXwUo+XwuRllocq4VfoC5JhR0zgOgewzmWsKNqvlst5YQQTKuYSlqgcD6N4
	T6Mv6VHkhlfuB1fcBVCPulmchPRLBO0KFsrvDCiNiltSWpyfqnrhQqDimSIOBeh4S4P/
	lz34CEajAiY4+Pdgh+Q3s4Kz8c46/dszC6S4hUIgLjRpLNwlUau9DnR0cO5JCMuzIQBY
	B8EkWvlD/xE7h/6n/T1c22o46+SOkIpLCw69PfPMplT/i/2d7FtpqjX71nQo0KSrUDOp
	Bs3CikCNH6ppHs0/uYYdN+wioN4Sbw6eEUNgKSe4J28TS2Bi65Z55bmHq4h2+bXv3vd0
	dFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XoQkJbtOrcNMepME5PByCloVCowJNiQULhVufyiqpLA=;
	b=HgL9jf+MF9dRzL1VI0IoDbEaPR6Y/qGcbmqYyItjuW2S77pm5SyFtnNoTX5gttCNsI
	EcDruqHkSJnVnZ2e1r0xwPSolORlzSeZHusAHv4ATqcIQjKysZJphCKeTVJ71t7vXSBs
	4U1f0JPc4laAGI0C2djF6RLTImscDFzHu+YRi92bweVeKbneVmJfqKPUXhhIQ4Abs3oi
	HYz4hewkrn1p2vaRJGanaodJ8TgbBu6DS7OoFuz+NM2MS1y9Llm7hHXN/6W118U4OtWx
	UDUteehuGw/ldjeyCHGHhMzTxAJratOC4HwKHOzs0PrMZDUL3xpVVg8/dYFY6542aFkd
	difg==
X-Gm-Message-State: APjAAAUKBw+8edZlF7tIQa9Mdk+quCRudHz6r66TEsROacCi6j7ixCUq
	RCfBnIKQiLtsm9IEVdtDvatFvZ43UeA=
X-Google-Smtp-Source: APXvYqwE1nIdx69bW7DQ1YCF5wbFrcGvF+IBazHAKYkysN0RsIRgOe8BWTPwoCbSb0cqgoJIL7cI6A==
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr4428761wrs.86.1554386360838;
	Thu, 04 Apr 2019 06:59:20 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.214.126.255])
	by smtp.gmail.com with ESMTPSA id
	q4sm26056547wrx.25.2019.04.04.06.59.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Apr 2019 06:59:20 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com, raj.khem@gmail.com
Date: Thu,  4 Apr 2019 15:58:57 +0200
Message-Id: <1554386339-20076-2-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554386339-20076-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554386339-20076-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe] [PATCH v3 1/3] zeromq: bump version 4.2.5 => 4.3.1
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
X-List-Received-Date: Thu, 04 Apr 2019 13:59:20 -0000

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


