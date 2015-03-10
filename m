Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 620F173A39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 22:48:40 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so34311048iec.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Yx1N55M4kipv/QeKaCI6cx79Fh+lnDp6QlfDawME4Ic=;
	b=DU+xKZLUPV8GAi+Kw5aLf3f7J2TUVUCz4S8oClrgRFPxVZdJI2ET3XWNdxrOwfa3Nv
	5b3MD+JJOxJDGohqG5S0uf4qMofWbWaJOKMFMd/Hr3qW75EpordWyJs3A2ZoTmFk+s9u
	JztBAM+eZJ57XsUYVT3HS9gKNfaqRFECd3H+g8WgQgITGUS9Znro6r4U/UpzDyWkTJhF
	CA4X7mrXPsXgjhxNv8NvVQf4qdpNVSc3xbPZehGvM7obNbQWb7XcZSYrKB6lOOK2S49c
	DmctmhnLGw7BIZtfsUFVVFCF80b0Auzm7TPLU6ICBF0n4fO8vTdVm5FJiBqzu8gM8KFs
	iPWA==
X-Received: by 10.42.77.4 with SMTP id g4mr37153760ick.17.1426027721944;
	Tue, 10 Mar 2015 15:48:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ik7sm1341586igb.1.2015.03.10.15.48.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 15:48:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 15:47:51 -0700
Message-Id: <1426027671-9071-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] tinymembench: add initial recipe
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
X-List-Received-Date: Tue, 10 Mar 2015 22:48:41 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../tinymembench/tinymembench_git.bb                  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
new file mode 100644
index 0000000..ae7887d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "A simple memory benchmark program, which tries to measure the \
+peak bandwidth of sequential memory accesses and the latency of random memory \
+accesses. Bandwidth is measured by running different assembly code for the \
+aligned memory blocks and attempting different prefetch strategies"
+HOMEPAGE = "https://github.com/ssvb/tinymembench/wiki"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b345"
+
+PV = "0.3.9+git${SRCPV}"
+
+SRCREV = "95e68477588d41187b2d2e52ecf6be0e7eb06b8d"
+SRC_URI = "git://github.com/ssvb/tinymembench.git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m755 tinymembench ${D}${bindir}/
+}
-- 
1.9.1


