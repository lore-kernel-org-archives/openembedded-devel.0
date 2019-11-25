Return-Path: <mine260309@gmail.com>
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	by mail.openembedded.org (Postfix) with ESMTP id 799157FA11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2019 03:40:41 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id a14so11823798oid.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 19:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qswOrVXQHrBhVMAMVU5/6QSVV67UW/BQtBL4Isflne0=;
	b=nmGa9n1gaUQ0+gv+XlzCCWGCkgmek9GVPTyME+VztYlrOikzHV/52sZPOby3MaXR2F
	UecrNLmKGT9lmH16kuWSlex2L+L6vFW492vx40T2SGZ8GRyFzoXIV9DxXQvYeee+YQH5
	7qyBrzya1G53/6geGH7wWPHIOSIuZOm/U8qGbjXW+4nh5nHidsfXrjMQjAlgkoVPq+bh
	YHVIOI6Ax2hZgi27O5SIGWP1vMBZipSZqwjZhz1JuCCGcsvuVKooFAVAQKbNBUwqwVJO
	GNwxIM2qpdLXRKf0EQGm+s8WYsTJo4HNqHtTiP0gh2wVdI/9J+9XvEKLq1hXV+HZdfBF
	tzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qswOrVXQHrBhVMAMVU5/6QSVV67UW/BQtBL4Isflne0=;
	b=FoCjYp7lOREIf8dfqMCStNKLOe0E++bXdOecy5OQ3KFnXWF2QlORQkxi1IgskXHIvl
	ycZ5ez9YCMcluBXMwaesUFJCjnTaHRMJ0gyA1aJEI+p5RIukf5mA8u08BOEQabkzRxHh
	bNKSTQf0p0q/NMe4Uexw404YVTOwDm0KG9ZOQjV+avycM9qHI1/rDmzEPz4M4UcGyfXO
	bfMdjsjUANEcA6xNSIsWL4+6bAUWXyoxBb3DwniUHN6wzk6wJmfGpSREU22wHKn7MmvT
	jjdGzPyfCePK+2TfmerLUBWhUixyFM3UBZMxC4BwfB04jMWF8Sbc4PQYKRurfxxLs5Kc
	7QnQ==
X-Gm-Message-State: APjAAAXQtVS9n7FV3tTmpuAlvjZksVOO9f36So1WNHPiMrNroxmf83Bt
	qZ/kQZIeyfI1cmvt9iq7pF/sLh6z
X-Google-Smtp-Source: APXvYqysG6OSI9jlr11RGbmRww0rsXCdEs4S4bNf9IeEM2kY2bsHx0yHoISh4j9/WbwEAYSLrDeqJQ==
X-Received: by 2002:aca:4b93:: with SMTP id y141mr7094676oia.132.1574653242142;
	Sun, 24 Nov 2019 19:40:42 -0800 (PST)
Received: from localhost ([129.41.86.5]) by smtp.gmail.com with ESMTPSA id
	c20sm1987435otm.80.2019.11.24.19.40.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2019 19:40:41 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Nov 2019 11:40:30 +0800
Message-Id: <1574653230-111105-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] googletest: move to release 1.10.0
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
X-List-Received-Date: Mon, 25 Nov 2019 03:40:41 -0000

The googletest recipe was using 1.8.1 tag, and in the recipe it was
using the git revision instead of the tag release.

Rename it to googletest_git.bb and use the 1.10.0 release revision to
get the latest release.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 .../recipes-test/googletest/googletest_1.8.1.bb    | 21 ---------------------
 meta-oe/recipes-test/googletest/googletest_git.bb  | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 21 deletions(-)
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
index 0000000..3e27efe
--- /dev/null
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Google's framework for writing C++ tests"
+HOMEPAGE = "https://github.com/google/googletest"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
+                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
+PV = "1.10.0"
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


