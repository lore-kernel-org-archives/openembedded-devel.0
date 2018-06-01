Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9D46274F89
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 15:10:15 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id f189-v6so12658385pfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=8FD/P0jtR9rQ15XaY8c0wf1g9+eZPNu6FUtbavqA1I8=;
	b=cqMD9CD32O88k3gryXkoigP1tF37xs2FpS4CzgFrohQNcIusFF7BESeHfUN4k4d3nl
	U10V4Q0GAA0Hvy5D4Akc/l3gMlU9aIVFOvajGNQx19HoDcfj0dTapmvoE/uSsfqJ67Qc
	bNnlJ1QrV01ACsC2Cq7+JzkerFoel5L+q1K/jzf3gnszG3zV8D7X4JwuzE8V86RvC1hM
	0a9dXO13Sie7/3Rj4jwl4NU6tAlniTRKcJV8rNr2IZVlbx45bOKaEErrJuCzrvQeA7uB
	qR0sLAgylv76l84kR2uqYx8RbAenDPPbA0dy3QbMZmD1NjCFhxOUXa6xa5VBwDm4/yI1
	nqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8FD/P0jtR9rQ15XaY8c0wf1g9+eZPNu6FUtbavqA1I8=;
	b=ZVV39fmxGeT2qK4KugmwmL5TD+FV1+XX3z+rymL7L5MuOp2acNLPE4djvZ37xgydjQ
	5YCyk9PBw7YoReYPP5f/qfDAHVveb9IPnQxwjSwSi5W7vkvIodljbwJ5xdAD/+x6uy92
	A3DgAnl9UfXqqdTK6xirxxrtPVOEHgnL4ZDoLPMtqxHYL0c2IY8aomHmobQtnTxtyo5W
	/FvzWInLASzAyeSVCFcMnFg0TPXfaGHI6gmyXdacPqR2mjm9p1KGvkpMDyPpyasLJxDb
	Ut8CYacmg8LM1HyVqw6OfuTg4tI3euX3LgeSht+6cQUuQlGbZNp4OsdwlUkU0gBnuuvC
	NOJw==
X-Gm-Message-State: ALKqPwdUbkMBVPy5ZrNEhkhyjMJfdcbhSsVT/FgoTMmTzxk2ZYHUINXF
	uEjj8gnahShSD01w3W2m0qw=
X-Google-Smtp-Source: ADUXVKINNCu2cNcebq/sZK9pJDLstW8X0DNY7lL4ODbsJLIR91Pe+VpkITbm0whDfVYY9A9Mfi9pMg==
X-Received: by 2002:a62:4f4f:: with SMTP id
	d76-v6mr11119576pfb.188.1527865816620; 
	Fri, 01 Jun 2018 08:10:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:cd69:7d4:a4bc:31b4])
	by smtp.gmail.com with ESMTPSA id
	u8-v6sm64924608pgq.7.2018.06.01.08.10.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jun 2018 08:10:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2018 08:10:13 -0700
Message-Id: <1527865814-9027-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] libseccomp: move lib from meta-security to meta-oe
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
X-List-Received-Date: Fri, 01 Jun 2018 15:10:15 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-security/libseccomp/files/run-ptest    |  4 +++
 .../libseccomp/libseccomp_2.3.3.bb                 | 42 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-security/libseccomp/files/run-ptest
 create mode 100644 meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb

diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest b/meta-oe/recipes-security/libseccomp/files/run-ptest
new file mode 100644
index 0000000..54b4a63
--- /dev/null
+++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+cd tests
+./regression -a
diff --git a/meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb b/meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb
new file mode 100644
index 0000000..8d58163
--- /dev/null
+++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb
@@ -0,0 +1,42 @@
+SUMMARY = "interface to seccomp filtering mechanism"
+DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
+SECTION = "security"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
+
+SRCREV = "74b190e1aa05f07da0c61fb9a30dbc9c18ce2c9d"
+
+SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.3 \
+           file://run-ptest \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig ptest
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = "--enable-python, --disable-python, python"
+
+do_compile_ptest() {
+    oe_runmake -C tests check-build
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/tools
+    for file in $(find tests/* -executable -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    for file in $(find tests/*.tests -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    for file in $(find tools/* -executable -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
+    done
+}
+
+FILES_${PN} = "${bindir} ${libdir}/${PN}.so*"
+FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
+
+RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN}-ptest = "bash"
-- 
2.7.4


