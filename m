Return-Path: <mine260309@gmail.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id F25D47F82D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:45:50 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id d5so1893898otp.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 21:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IT3Z5dGDQr68VJezdfFHRDaat1y3PJAf8Tp0R93FZQU=;
	b=aqK318ZN8mSYXKoGlv5DFpYTt6/g5lKLnA+yGqX+F11eBykXDUm8eOZixcOYUvTXnB
	PlX5A8hUG/j/Ze6CKPpt5U2KJF9URXqxfdjB6QObhq2xhYu+48HMaD7obh8VlgrHATN6
	DWA11zwYCaVBTKT7Cn0hOZ/PvxycNMtpEDmOoBZRDJEj1+IBI6tD9Fr+BcFaMVFs9a2L
	RDXs4cKjcRMY69Aoa8jz/RggapdRBP74nQownQWomZ8/fdBZ2R5pBmp4y65JSZGn/roO
	iwsbTf72g2HVkOPJuSalAzxCHFzkSkpUBuT3gMEcpR/ioUUWni2xbYSDgj45YLODKnbn
	kZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IT3Z5dGDQr68VJezdfFHRDaat1y3PJAf8Tp0R93FZQU=;
	b=JZMYDifoNq2Bt6+rvHzJNy92Nd8aM5V46m7vLhJ/pk+PBNqmxQ8epJXbeIo6KCLIH7
	EZ4gb26TNbZh8OrdLKB0OP7iaPzbTIxwoXAjdAr/8Pw+0Ycjh4W9wnIQeLf0MHmhx0/c
	A9iUV74v8cajYh+IVPaBAqS6zVgGBeiBtNKewLtxb/+za7mOnudux76x3vpogQTI4n7L
	i7ah4ptBnIYoHgC6WaREnPVzYEFU8b0gCIsdkwAxZ8EOf1Z4PQDwK7TNsb4G+ri7wPcW
	+HYhkm5boPectDpcIblzCyQNZYePMr93ABbi5Wp2TvW1dUw7UdzbZEcV3LbnxgYag2d9
	MV7A==
X-Gm-Message-State: APjAAAVpz8GTw/162anINVrBFz4ouuESFOElkM6xDx2KcuXRenEn2ZhW
	w3Ybm3MDlitpjx/Dt6mTOFMDDYJ0+Qg=
X-Google-Smtp-Source: APXvYqzBr6YOqcS9lSwtkGNnGCQqFWWZqVuTZdYsZwG4CEk7YneIi53+abK1XwnvGnLvjGPf/dEVRQ==
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr4777105otq.221.1574315151514; 
	Wed, 20 Nov 2019 21:45:51 -0800 (PST)
Received: from localhost ([129.41.86.5])
	by smtp.gmail.com with ESMTPSA id x11sm611108oie.25.2019.11.20.21.45.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2019 21:45:50 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 13:45:33 +0800
Message-Id: <1574315133-73046-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] googletest: move to release 1.10.0
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
X-List-Received-Date: Thu, 21 Nov 2019 05:45:51 -0000

The googletest recipe was using 1.8.1 tag, and in the recipe it was
using the git revision instead of the tag release.

Rename it to googletest_git.bb and use the 1.10.0 release revision to
get the latest release.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 meta-oe/recipes-test/googletest/googletest_1.8.1.bb | 21 ---------------------
 meta-oe/recipes-test/googletest/googletest_git.bb   | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-test/googletest/googletest_1.8.1.bb
 create mode 100644 meta-oe/recipes-test/googletest/googletest_git.bb

diff --git a/meta-oe/recipes-test/googletest/googletest_1.8.1.bb b/meta-oe/recipes-test/googletest/googletest_1.8.1.bb
deleted file mode 100644
index 362d69f..0000000
--- a/meta-oe/recipes-test/googletest/googletest_1.8.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Google's framework for writing C++ tests"
-HOMEPAGE = "https://github.com/google/googletest"
-SECTION = "libs"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
-                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
-
-PROVIDES += "gmock gtest"
-
-S = "${WORKDIR}/git"
-SRCREV = "2fe3bd994b3189899d93f1d5a881e725e046fdc2"
-SRC_URI = "git://github.com/google/googletest.git"
-
-inherit cmake
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-dbg = "1"
-
-RDEPENDS_${PN}-dev += "${PN}-staticdev"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
new file mode 100644
index 0000000..e1df9b6
--- /dev/null
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Google's framework for writing C++ tests"
+HOMEPAGE = "https://github.com/google/googletest"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
+                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
+
+PROVIDES += "gmock gtest"
+
+S = "${WORKDIR}/git"
+SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
+SRC_URI = "git://github.com/google/googletest.git"
+
+inherit cmake
+
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dbg = "1"
+
+RDEPENDS_${PN}-dev += "${PN}-staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


