Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC1D74BE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:13 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id q72-v6so3657432itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=V5WUWutEf14cxB5QKvB7bV/XRrO6K0vCiVh75thJJ00=;
	b=NpETijgBUBHs8Ll2RMSSfMQKUcnWpsaUErNAcUNpjJ8DYNwr5mAyEA8avgPNtSR+Qn
	JkSlVb+nyhal05K28tklGOrNkKZHDUAOwYpP8mnG3Nj6D9/h6YSkK1U9aeIsA4lIJr+G
	xH20Z3VxW8GIq2Tm51HOfTDgdIvyR81Pf2Cj+LuGMG2WPv1nxNAOPV0Z2/P+aPblHIKO
	IXIIIsGUQUfzVLNHvow/2NHrk2tYCHGXI/fCCBHnWWxnVHGxU7s5uEfT0tyd3/HIWG7S
	YEelXEH8aM74KB5APnzfnoHh3KmTJJd36LVmfKWjHXvrjpLJ8F28yw1c69IcNj0dFOLd
	Zp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=V5WUWutEf14cxB5QKvB7bV/XRrO6K0vCiVh75thJJ00=;
	b=JU/mpHQ/WktawALYC2894BCB6gOihFRKvYol/JolCzeL4OUu5xHjIF9YRwPcbBU1GB
	irpKyGsknlTK9ixzvu3gQY1zwnFKYaOR/5MQgIWCz2vj4ebkw3J4zzZ5NtWdNfJhamH7
	jp/GK9maFaCjhnxLAYwerYiUTkPLvwC3cRMeVtXLHhGsX7il8bqm2SV3u3QR2A74sN6D
	xVJ9VNQt9QGESLQCw/8LrXQoxox1wU5JsvqtZiY5iS4+6ynMic1Y1UL5Iv/x4PC9Po6v
	WjlNyRJTQoBjcwNWyOCjKWiqjar2g2wJUn+Kw/Ic4R0avbligfAObk+Fvpuj5z4Do3lZ
	4UCQ==
X-Gm-Message-State: ALKqPwcOJsX767G0c/YYN0KUjh83YYCW3C7rjZOJOkMuoGPK/Bar8sNW
	jzIIrusGu77f2MG6NA1/rOXz+AXC
X-Google-Smtp-Source: AB8JxZqSwfrpIDp8JPXL3veBQEx/3tsyAq3y44xW976ZEYi/1yH0pYcoPsJWQGZ9ORXPDq0rPESDGw==
X-Received: by 2002:a24:f44d:: with SMTP id
	u13-v6mr10741071iti.115.1527186434150; 
	Thu, 24 May 2018 11:27:14 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:13 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:49 -0400
Message-Id: <20180524182659.19986-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 01/11] poco: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:13 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.9.0.bb | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.9.0.bb b/meta-oe/recipes-support/poco/poco_1.9.0.bb
index 1016caef7c..a4f8a05188 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.0.bb
@@ -1,34 +1,22 @@
 SUMMARY = "Modern, powerful open source cross-platform C++ class libraries"
 DESCRIPTION = "Modern, powerful open source C++ class libraries and frameworks for building network- and internet-based applications that run on desktop, server, mobile and embedded systems."
-SECTION = "libs"
 HOMEPAGE = "http://pocoproject.org/"
+SECTION = "libs"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 
 # These dependencies are required by Foundation
 DEPENDS = "libpcre zlib"
 
-inherit cmake ptest
-
-BBCLASSEXTEND = "native"
-
-SRCREV = "94966785a8f9ad0191dffd075ebd67826e6e4b6d"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git \
     file://run-ptest \
    "
+SRCREV = "94966785a8f9ad0191dffd075ebd67826e6e4b6d"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
-                  -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
-                 ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
-
-# For the native build we want to use the bundled version
-EXTRA_OECMAKE_append_class-native = " -DPOCO_UNBUNDLED=OFF"
-
-# do not use rpath
-EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
+inherit cmake ptest
 
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
@@ -60,6 +48,16 @@ PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OF
 PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
 PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
 
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
+                  -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
+                 ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
+
+# For the native build we want to use the bundled version
+EXTRA_OECMAKE_append_class-native = " -DPOCO_UNBUNDLED=OFF"
+
+# do not use rpath
+EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
+
 python populate_packages_prepend () {
     poco_libdir = d.expand('${libdir}')
     pn = d.getVar("PN")
@@ -77,6 +75,14 @@ python populate_packages_prepend () {
     d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
 }
 
+do_install_ptest () {
+       cp -rf ${B}/bin/ ${D}${PTEST_PATH}
+       cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
+       cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
+       find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
+       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
+}
+
 PACKAGES_DYNAMIC = "poco-.*"
 
 # "poco" is a metapackage which pulls in all Poco components
@@ -89,10 +95,4 @@ ALLOW_EMPTY_${PN}-cppunit = "1"
 
 RDEPENDS_${PN}-ptest += "${PN}-cppunit"
 
-do_install_ptest () {
-       cp -rf ${B}/bin/ ${D}${PTEST_PATH}
-       cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
-       cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
-       find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
-       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
-}
+BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


