Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D3876606D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jun 2016 14:05:37 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l81so16163430qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jun 2016 07:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EEp35gKHuzdVReDVYGtWl4dppprCUCSpRJltQxp+fgA=;
	b=ZTP1mirogDO/sT6WZZP1893I4OqxBooDc4xzoqZ3A3zkodN4t1nE/cG/rvfQQAHGmd
	Nr7vLOADFP+XokbzjvwiRpXrsB1Qc0MvSMWZX9VtOwQDT77xhrUDiMv1TMbCxj+fCdGr
	wPSFA/uRNU8lq7F1F/5uFC8v9DaCh60t69aJUoaclD1n2DyQjW3OMv6xOb0uRx8eXXX4
	Vs5yzrnMN5rd+Fg1L9YmVWKUG2kATxLf0JRMZRmTYz5gHN9SzUNtU1MCGC/92V07l6l2
	Kld9/ZNNLz5G76IqsBzD8wkhIkrhwhy/D8WpeTxNUrBMuMzkoa0HMxzoO8+XnQmVG7fh
	6JxQ==
X-Gm-Message-State: ALyK8tJX6PKhLnzailrz3nvLqJLd3skjjWBRxqBDlj1LH4srxMLv8kcDbhSNzAj/qAcn/A==
X-Received: by 10.237.33.147 with SMTP id l19mr369729qtc.33.1466258737836;
	Sat, 18 Jun 2016 07:05:37 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 2sm6692379qtg.24.2016.06.18.07.05.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Jun 2016 07:05:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jun 2016 10:05:17 -0400
Message-Id: <1466258717-3105-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-networking][PATCH] crda: fix errors about unused variables and remove from the blacklist
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
X-List-Received-Date: Sat, 18 Jun 2016 14:05:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../crda/crda/fix-gcc-6-unused-variables.patch                | 11 +++++++++++
 meta-networking/recipes-connectivity/crda/crda_3.18.bb        |  4 +---
 2 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch

diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
new file mode 100644
index 0000000..747804d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
@@ -0,0 +1,11 @@
+--- crda-3.18/utils/key2pub.py.orig	2016-06-18 09:54:23.671326113 -0400
++++ crda-3.18/utils/key2pub.py	2016-06-18 09:54:34.387326300 -0400
+@@ -115,7 +115,7 @@
+ 	.n = _n, .len_n = sizeof(_n),	\
+ }
+ 
+-static const struct key_params keys[] = {
++static const struct key_params keys[] __attribute__((unused))= {
+ ''')
+     for n in xrange(n + 1):
+         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index be490cb..7e13d7b 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/crda/${BP}.tar.xz;name=cr
            https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2014.11.18.tar.xz;name=bin \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
            file://fix-linking-of-libraries-used-by-reglib.patch \
+           file://fix-gcc-6-unused-variables.patch \
 "
 SRC_URI[crda.md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[crda.sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
@@ -39,6 +40,3 @@ RDEPENDS_${PN} = "udev"
 FILES_${PN} += "${libdir}crda/regulatory.bin \
                 ${base_libdir}/udev/rules.d/85-regulatory.rules \
 "
-
-# http://errors.yoctoproject.org/Errors/Details/68635/
-PNBLACKLIST[crda] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1


