Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9FFD27D2E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:28:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r4so21345950wrq.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XoQkJbtOrcNMepME5PByCloVCowJNiQULhVufyiqpLA=;
	b=CfZYqKw28GtqVUMSr6ERkAnau7Y1jSuZL61/YVYfXpe3l3A4tEjrFyL5j/8y6ifBI1
	OTmzEwqodF68VeuJOiACozevE96wnXJH106L5+x0iK+hR8QUcvZyu8T8hJoRWWatlFbf
	VnqTFnwhMw83/aVC8XlVaFm/a1wBvZxp/SCYb7DfforJLCjwWKuhQ6Qr2j3jdbiyuLSm
	CBPwIvfA388PJi50KgG7Jf8kocUp9xKxEj2cDnYFZMuhBH1ZFTY7OjonwukbcTbOXc4L
	DZXw1KiWXQ5g7o3GrlDg00bi+7LCyllps524MdpTmEYZTvyev+UlKwatyXVwVfbneUl7
	lnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XoQkJbtOrcNMepME5PByCloVCowJNiQULhVufyiqpLA=;
	b=ZdkWFc5JtfkyKmJ4HHcQaAp8LSfj6wl+cV9unD5HnZ+aG8Zky9WvWcQ9Upn3M3HGDw
	QoNwk0yezKoLTZrVRYyLrjQlLpyf0J5MoCyx/K0OuXbLPX28eej9SoAZr9m9f6SJneSx
	1ABYl2gP/wgnfvkmZhZ5caPO0Z+BCUvqXBN3Rv1FooYIVmvn8VNjcBVidKVO+pZWdNvc
	q69hDdcS7gyXMb7eekGa+0Sz9VfDvqlIEQDuGkZ75SK6GQor7yayx2B3qaJnYZuXbkCN
	2VZXedjZ4mfO/KAKP92v2O69U4+UpXu3BWV5201x7Wh4jSMH+6KuBbp+hETakpY8toA4
	L9TQ==
X-Gm-Message-State: APjAAAVCYinIf65wu4OtgtKmrjWBn5q/5DdlpUpPTFLpJicMy49A8gBt
	fbmc53PGYnCH8oChvDyI5dQLj+zhJObgKA==
X-Google-Smtp-Source: APXvYqxIDo2IvxEi+oQ9+Jz8aiVomHy0qGj4ubVah/+4c47vYCGoHWGe6T6RRPOABBLraTk57Gwa9g==
X-Received: by 2002:adf:b68d:: with SMTP id j13mr48015022wre.50.1554298111061; 
	Wed, 03 Apr 2019 06:28:31 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.155.216])
	by smtp.gmail.com with ESMTPSA id
	g13sm13221490wmh.11.2019.04.03.06.28.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Apr 2019 06:28:30 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com
Date: Wed,  3 Apr 2019 15:28:13 +0200
Message-Id: <1554298095-26709-2-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554298095-26709-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554298095-26709-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe][PATCH v2 1/3] zeromq: bump version 4.2.5 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 13:28:30 -0000

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


