Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49C9877D04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 08:51:44 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id q132so3392592lfe.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lFtGCw8qr1KNbEYdagkI8XNmCQtVq8DDdELm+ee0mI8=;
	b=EcSIf2Qz3v2af8tD8LWU2x6lOYu1mVsyeCNU61e1FNw7AwspB7jitV0CzywnGJ9Ibi
	qOYkt1ASq1Sxt3GzNmZLjVxSwVIkjp7JbVx8oa1A4Gwintx+1eaOLhb41s7L8gXX/OUT
	Z4yA421i+/NzOsIRHgnmRaHhNN6SCq6wkBFBAWFe5ImJTts3qSOi7TNZnrTGesrevniQ
	+xSYKHXD0pmy2kK8EdZC7rjRBYXb353KhKW4PKn0xla0Is1Jv67UmGiB6z6Jb+LGwWFx
	cAu18UZg2mgyWgpQtZTelY9vtF3PrHx48NkN6w3EXNsorNp0KjhxEQKu25G5Vcw5pZzY
	L1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lFtGCw8qr1KNbEYdagkI8XNmCQtVq8DDdELm+ee0mI8=;
	b=j9EG2c3zX4V3YcTLe41mv8MEl18O0Sj5w8vEH2go4wAbaZgJNnxciF0jYIsW2HAcaH
	k1Jsuzfj50ymLI1ZVbJwc3c7yBAdfkJLjFKuCvrIKSEgpIW/nS4znbsXVA2xCUWkpU0y
	h2Q58KjWz36zzB2FIfNlZVQP0Md6xaG3XHNYmuvqAP6IkZPIfqi4kDYnNa3xNXb+JP6A
	4PnnSSNMdESahmJcP45IScrgo+0G3X4Kp2ZdhdEcLNR8qk0otioEwpRjAjWcTBq7IEI5
	6aSgeO74qd4ymV4+1XcDWXc/uPfVfOzMpCop3wBOGKHIlT/sPS8A52um8kJINrr1hK2s
	rGzA==
X-Gm-Message-State: AHPjjUiUPGA6ANHdkzyfrXjh1/jcDuQrUGiC0GUh1obV7MkGb7KaoSJl
	n9GUcAep1hiAtDRK7F0=
X-Google-Smtp-Source: AOwi7QBMPhzTMXTVmXouI/R0QPeCg7trP6sdfkC/9fuAkO9cld9MdEwDj7Fs0mfPod5Q9kBF0kzagQ==
X-Received: by 10.25.143.199 with SMTP id s68mr630156lfk.143.1504774305554;
	Thu, 07 Sep 2017 01:51:45 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id n13sm332735lja.7.2017.09.07.01.51.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 01:51:44 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 10:51:35 +0200
Message-Id: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-java][PATCH 1/2] icedtea-native: Fix segmentation build during build
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
X-List-Received-Date: Thu, 07 Sep 2017 08:51:45 -0000

Without this patch, icedtea-native do_compile() results in a SIGSEGV
when compiled with GCC7

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc           |  2 +
 .../openjdk-7-03b147/vframeArray_Fix_sigsegv.patch | 60 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix_sigsegv.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 55cb7e7a5024..7d625eb536ed 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -43,6 +43,7 @@ SRC_URI = " \
   file://jaxws_fix_NullPointerException.patch;apply=no \
   file://timezoneszip.patch \
   file://sigsegv.patch;apply=no \
+  file://vframeArray_Fix_sigsegv.patch;apply=no \
   "
 
 S = "${WORKDIR}/${ICEDTEA}"
@@ -154,6 +155,7 @@ do_configure_append() {
 
 	patch -p1 < ${WORKDIR}/jaxws_fix_NullPointerException.patch
 	patch -p1 < ${WORKDIR}/sigsegv.patch
+	patch -p1 < ${WORKDIR}/vframeArray_Fix_sigsegv.patch
 }
 
 EXTRA_OEMAKE = ' \
diff --git a/recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix_sigsegv.patch b/recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix_sigsegv.patch
new file mode 100644
index 000000000000..62fe8b207011
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix_sigsegv.patch
@@ -0,0 +1,60 @@
+Disable Optimization on vframeArray::unpack_to_stack
+
+GCC7 triggers a sigsegv while building:
+
+
+| JAVA_HOME=/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0 ANT_OPTS=-Djava.io.tmpdir='/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/build/ant-tmp' /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/recipe-sysroot-native/usr/bin/ant -Djdk.version=1.7.0_03 -Dfull.version='1.7.0_03-icedtea-b21'  -Drelease=1.7.0_03 -Dbuild.number=b21 -Djavac.debug=true -Ddebug.classfiles=true -Djavac.target=7 -Djavac.source=7 -Dboot.java.home=/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0 -Dimport.jdk=/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/jdk  ....
+| Buildfile: /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langtools/make/build.xml
+| #
+| # A fatal error has been detected by the Java Runtime Environment:
+| #
+| #  SIGSEGV (0xb) at pc=0x00007fad7906e868, pid=9747, tid=140383055484672
+| #
+| # JRE version: 7.0_03-b21
+| # Java VM: OpenJDK 64-Bit Server VM (22.0-b10 mixed mode linux-amd64 compressed oops)
+| # Derivative: IcedTea7 2.1.3
+| # Distribution: Custom build (Thu Sep  7 09:36:21 CEST 2017)
+| # Problematic frame:
+| # V  [libjvm.so+0x78b868]  vframeArray::unpack_to_stack(frame&, int, int)+0x88
+| #
+| # Failed to write core dump. Core dumps have been disabled. To enable core dumping, try "ulimit -c unlimited" before starting Java again
+| #
+| # An error report file with more information is saved as:
+| # /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langtools/make/hs_err_pid9747.log
+| #
+| # If you would like to submit a bug report, please include
+| # instructions on how to reproduce the bug and visit:
+| #   http://icedtea.classpath.org/bugzilla
+| #
+| Aborted
+
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+diff --git a/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp b/build/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp
+index 52b080999224..81b6a09ea91a 100644
+--- a/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp
++++ b/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp
+@@ -500,7 +500,7 @@ void vframeArray::fill_in(JavaThread* thread,
+   }
+ }
+ 
+-void vframeArray::unpack_to_stack(frame &unpack_frame, int exec_mode, int caller_actual_parameters) {
++void __attribute__((optimize("O0"))) vframeArray::unpack_to_stack(frame &unpack_frame, int exec_mode, int caller_actual_parameters) {
+   // stack picture
+   //   unpack_frame
+   //   [new interpreter frames ] (frames are skeletal but walkable)
+diff --git a/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp b/build/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp
+index 52b080999224..81b6a09ea91a 100644
+--- a/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp
++++ b/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp
+@@ -500,7 +500,7 @@ void vframeArray::fill_in(JavaThread* thread,
+   }
+ }
+ 
+-void vframeArray::unpack_to_stack(frame &unpack_frame, int exec_mode, int caller_actual_parameters) {
++void __attribute__((optimize("O0"))) vframeArray::unpack_to_stack(frame &unpack_frame, int exec_mode, int caller_actual_parameters) {
+   // stack picture
+   //   unpack_frame
+   //   [new interpreter frames ] (frames are skeletal but walkable)
-- 
2.14.1


