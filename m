Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BA5DD77BC5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 12:29:44 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g1so11737948wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 04:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bHK9yI1+H8a0cteC9IOsYSUbKOQHaeUHbMFk/A1BTjE=;
	b=cGawzysZCH/ORSWIjC/1Wn/0q01/ZTUKAQY+NnPufAX2BuoUdlr6cO5a5IFM6ARVnX
	5uu9gi7spg/Xx389gjSC+tUWJGqTTdBbB0pX/ehU00DLbsM4KyQb4+G3I5TnSVZ8+e/e
	xe/M3ZT2BZ3af72czucRGBFibWY8KPJTxkZbwcR/fsQth0uS44o1kU/JxxPghrWrCY4s
	Hp71n+9yKkRKLebinpJhNQAFauvmOK5j/4JZGUwWt7YaVdCmtbbudxBYuJQzhCkuKa6z
	VR3uRji5dYMOFBzdsD4zsYErP8pHkOAj66eoU6OmmT2qK8p5Rqikvwqr+Up62dw0TNVt
	7Scg==
X-Gm-Message-State: AKGB3mK51gRnAuJRpPM57iJMkyMyeJIB9q1lgOkY/Fc/3OuC+f9DD7QI
	H+tSagQ13c7g9sIlIOM3FakDfQeP
X-Google-Smtp-Source: ACJfBov6soy0UUSqwsnmYGiYQbbu2akLDOvAaw5RQt3nw8W5ZzVismbFgMQNOqeyc81S4CfDdsasYQ==
X-Received: by 10.80.214.136 with SMTP id r8mr35192198edi.288.1515760185262;
	Fri, 12 Jan 2018 04:29:45 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s14sm12631318eds.78.2018.01.12.04.29.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 04:29:44 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jan 2018 12:29:42 +0000
Message-Id: <20180112122942.22396-2-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180112122942.22396-1-git@andred.net>
References: <20180112122942.22396-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] uthash: add ptest support
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
X-List-Received-Date: Fri, 12 Jan 2018 12:29:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-oe/recipes-support/uthash/uthash/run-ptest | 10 ++++++++++
 meta-oe/recipes-support/uthash/uthash_2.0.2.bb  | 18 +++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/recipes-support/uthash/uthash/run-ptest

diff --git a/meta-oe/recipes-support/uthash/uthash/run-ptest b/meta-oe/recipes-support/uthash/uthash/run-ptest
new file mode 100755
index 000000000..14071a649
--- /dev/null
+++ b/meta-oe/recipes-support/uthash/uthash/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests
+for i in test*[0-9] ; do
+    if ./${i} | cmp -s "${i}.ans" - ; then
+        echo "PASS: ${i}"
+    else
+        echo "FAIL: ${i}"
+    fi
+done
diff --git a/meta-oe/recipes-support/uthash/uthash_2.0.2.bb b/meta-oe/recipes-support/uthash/uthash_2.0.2.bb
index 8a6887ef0..ccdd13b32 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.0.2.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.0.2.bb
@@ -10,19 +10,35 @@ SECTION = "base"
 LICENSE = "BSD-1-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc1f1e4c71f19f580458586756c02b4"
 
-SRC_URI = "https://github.com/troydhanson/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
+SRC_URI = "\
+    https://github.com/troydhanson/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+    file://run-ptest \
+"
 UPSTREAM_CHECK_URI = "https://github.com/troydhanson/${BPN}/releases"
 
 SRC_URI[md5sum] = "d08632a58674274c9cd87e2930f5696a"
 SRC_URI[sha256sum] = "34a31d51dd7a839819cecd6f46049b4ffe031d7f3147d9a042f5504fdb1348d1"
 
+inherit ptest
+
 do_compile[noexec] = "1"
 
+do_compile_ptest() {
+    oe_runmake -C tests tests_only TEST_TARGET=
+}
+
 do_install () {
     install -dm755 ${D}${includedir}
     install -m0644 src/*.h ${D}${includedir}
 }
 
+do_install_ptest() {
+    install -dm755 ${D}${PTEST_PATH}/tests
+    install -m0755 tests/test*[0-9] ${D}${PTEST_PATH}/tests
+    install -m0644 tests/test*[0-9].ans ${D}${PTEST_PATH}/tests
+    install -m0644 tests/test*[0-9].dat ${D}${PTEST_PATH}/tests
+}
+
 # The main package is empty and non-existent, so -dev
 # should not depend on it...
 RDEPENDS_${PN}-dev = ""
-- 
2.15.1


