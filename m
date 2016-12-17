Return-Path: <danielhilst@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AF84F719A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 21:54:27 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id h201so16178316qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 13:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0+m+ZSFfAiOZOX5xQtleUOWW+/MOZlzf2sPyqATuQX0=;
	b=IYltU7AhHEwLxTbho0UGV2ZOoQxUUUzva559SFMhi4SDUwWAU2VUhZ2YZauiivvbSR
	K8l8K44YFstxvlE35K04km+m2SFfmKThekjLs5kcUxioWuexGdvqr5wFpYFWAE2JZO9f
	j27zg6zJX3f2V+28A5j+wyqo+dr05O1II7PUqSop9LPeYfwFM+oZKETSJlw8/Aaw1xaN
	ooeQeD5WWRWPZg+81Sf3DknJ1/LeAcLker/9C9pfDYndk7Xs5h6ZBiJwJs6aQU4uhBXU
	jhg4egqOLUXrP0vzMGr1MLnPFgAQvMeJ6/N/jK3KI9Fx77Ab6NVAaoBIut3ZZ+W3uh9M
	4AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0+m+ZSFfAiOZOX5xQtleUOWW+/MOZlzf2sPyqATuQX0=;
	b=WstnHZrNyGANcUGUbjhwNFWYPjKbIoyJMa4yJo8bQcDdN0koWZVmhXHesPQjAt8Y75
	zOwcWAelrV0/qdHuQd3x34csM76b81uI79PiIvOBro8s5tGGVxxU27tYkvgitcP2ccL8
	ylzdedA18JGb2B+DYtWCjY8VKCHz8u6F2VFQgqDVllfMYldAlor8Bl/KqhFo4EE7rD/X
	FcPlLt5K8HmH+NC2k7u5HbbzVQAlRh4VO5oZW+OiwMsp5v32dWCvfU5Z0VEH4NDdBlRR
	C3omQVMnTb+P56pY9Qgwhm4wGiVBn2VJhMPLNCdj1gDI76sD+oDC4l+KOMipDDhe5/ed
	1K+A==
X-Gm-Message-State: AIkVDXLMManSxOIVLUxQfelcJxjgAYfZi4VIr9GlVlNBDXVQPk7OaG4nC+bNPE1LLESDcg==
X-Received: by 10.55.25.234 with SMTP id 103mr1047826qkz.171.1482011668730;
	Sat, 17 Dec 2016 13:54:28 -0800 (PST)
Received: from localhost.localdomain ([189.29.217.33])
	by smtp.googlemail.com with ESMTPSA id
	f2sm6905781qtg.22.2016.12.17.13.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Dec 2016 13:54:28 -0800 (PST)
From: Daniel Hilst SellI <danielhilst@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 19:53:23 -0200
Message-Id: <20161217215323.21906-1-danielhilst@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] Add CxxTest framework to recipe-devtools.
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
X-List-Received-Date: Sat, 17 Dec 2016 21:54:27 -0000

From cxxtest.org/guide.html:
CxxTest is a unit testing framework for C++ that is similar in spirit to JUnit,
CppUnit, and xUnit. CxxTest is easy to use because it does not require
precompiling a CxxTest testing library, it employs no advanced features of C++
(e.g. RTTI) and it supports a very flexible form of test discovery.

Signed-off-by: Daniel Hilst SellI <danielhilst@gmail.com>
---
 meta-oe/recipes-devtools/cxxtest/cxxtest_4.3.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cxxtest/cxxtest_4.3.bb

diff --git a/meta-oe/recipes-devtools/cxxtest/cxxtest_4.3.bb b/meta-oe/recipes-devtools/cxxtest/cxxtest_4.3.bb
new file mode 100644
index 0000000..2915011
--- /dev/null
+++ b/meta-oe/recipes-devtools/cxxtest/cxxtest_4.3.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "CxxTest is a unit testing framework for C++ that is similar in spirit to JUnit, CppUnit, and xUnit."
+HOMEPAGE = "http://cxxtest.com/"
+LICENSE = "LGPL-2.0"
+SECTION = "devel"
+
+SRC_URI = "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${PV}/cxxtest-${PV}.tar.gz"
+SRC_URI[md5sum] = "b3a24b3e1aad9acf6adac37f4c3f83ec"
+SRC_URI[sha256sum] = "356d0f4810e8eb5c344147a0cca50fc0d84122c286e7644b61cb365c2ee22083"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/cxxtest-${PV}/COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+S = "${WORKDIR}/cxxtest-${PV}/python"
+
+inherit distutils
+
+do_install_append() {
+    install -d ${D}${includedir}
+    cp -a ../cxxtest ${D}${includedir}
+    sed '1c\
+#!/usr/bin/env python' -i ${D}${bindir}/cxxtestgen
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2


