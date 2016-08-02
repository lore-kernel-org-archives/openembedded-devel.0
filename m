Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 63E676010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 18:21:36 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u25so9885365qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2016 11:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dp//DMpmSKQOQOrHhtTLu9UG+9K1EjPjp8fEFkaj8U8=;
	b=WdseCn/HF05fnnVU2CH+3BrduSpE14APZGUDlq58qC6Z4F22lSJMp7/y+waKctmebP
	1dr2R7BJNFHH3Xo+RQqHJEzCrsEN6UdeQUESxp3Q9Bany0HkrL8lSs6GRt97bCd2Khr9
	Eb6Mq4yZb1/Da5Biu+JqdDPzrDB9XJSLsK7bBctjEVxvtCS7B2pCwqAqDFiXZcjY62dh
	jBcQSMSzS04lgh+R2hISjEypWIm7L5/S2Q8VshOlq9BhzQmzK3zU7a80rG1HAu6wTMbS
	BHQ4YgcRydxrPv8Z9MQoQMZiFHTn9rxKbgZf/nGNpOY0xs0wFtasIoEpMTUQ/7551Lxc
	twkA==
X-Gm-Message-State: AEkoouv1DGIguOiPUSHQnmxCYegFDuyMkZsNOb70NU2vCG+hhhP5Rxlj/gnbD+udFsAKvA==
X-Received: by 10.200.56.155 with SMTP id f27mr100732138qtc.26.1470162097431; 
	Tue, 02 Aug 2016 11:21:37 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id z1sm1946293qkc.40.2016.08.02.11.21.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Aug 2016 11:21:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2016 14:21:27 -0400
Message-Id: <1470162087-5919-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libgit2: add a recipe for libgit2 version 0.24.1
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
X-List-Received-Date: Tue, 02 Aug 2016 18:21:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
new file mode 100644
index 0000000..e580308
--- /dev/null
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "the Git linkable library"
+HOMEPAGE = "http://libgit2.github.com/"
+LICENSE = "GPL-2.0-with-GCC-exception"
+LIC_FILES_CHKSUM = "file://COPYING;md5=34197a479f637beb9e09e56893f48bc2"
+
+DEPENDS = "openssl zlib"
+
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.24"
+SRCREV = "211e117a0590583a720c53172406f34186c543bd"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "\
+	-DTHREADSAFE=ON \
+	-DBUILD_CLAR=OFF \
+	-DSHA1_TYPE="builtin" \
+	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DBUILD_EXAMPLES=OFF \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


