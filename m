Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 02DB96E987
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:36 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kp14so4501960pab.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xJNmBeLYI1XV6EX/yn59/gvz6OcVq1ZzPALS9k5ueAc=;
	b=rN63UbwXCOLF6vL4s+OMhYUSYzXeXVwT8OKPxsG0DDqjHj0jiMVpktDYwUdwR5CUx0
	4qBGn9UmDMd+PF79niRqyYwlg84pPSOFP+zqdgd7PZthQvfR9g1doRHR7kLhJTIbRIeN
	dAcLw9iYuM1Wo/Guk2N8djGOY2By/CQksaGuHUnhGBDZ1g10hjxPmoQfFBXbMcYj4j8M
	/WJlXu9XYRUtWWEqFJAy4C/baJYXao3ou1gB8s0povs0w9Yugn7X6JVUNAZJ8gMhssAY
	6LKhQbLrVXtnnenMhHeiy+fEJ17x9Kc+2xYz4ND5hUwTB6HwEmi6u37NjkRdlPoet7et
	G2JA==
X-Received: by 10.66.124.230 with SMTP id ml6mr16928487pab.29.1391181098307;
	Fri, 31 Jan 2014 07:11:38 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:40 -0800
Message-Id: <1391181100-32525-9-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH 9/9] perl-module-extutils-cppguess: add 0.07
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:37 -0000

[Description from CPAN]
ExtUtils::CppGuess attempts to guess the system's C++ compiler that is compatible with the C compiler that your perl was built with.

It can generate the necessary options to the Module::Build constructor or to ExtUtils::MakeMaker's WriteMakefile function.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../extutils/perl-module-extutils-cppguess_0.07.bb |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-perl/recipes-perl/extutils/perl-module-extutils-cppguess_0.07.bb

diff --git a/meta-perl/recipes-perl/extutils/perl-module-extutils-cppguess_0.07.bb b/meta-perl/recipes-perl/extutils/perl-module-extutils-cppguess_0.07.bb
new file mode 100644
index 0000000..b75c451
--- /dev/null
+++ b/meta-perl/recipes-perl/extutils/perl-module-extutils-cppguess_0.07.bb
@@ -0,0 +1,37 @@
+SUMMARY = "ExtUtils::CppGuess - guess C++ compiler and flags"
+DESCRIPTION = "ExtUtils::CppGuess attempts to guess the system's C++ \
+compiler that is compatible with the C compiler that your perl was built \
+with. \
+It can generate the necessary options to the Module::Build constructor or \
+to ExtUtils::MakeMaker's WriteMakefile function."
+
+HOMEPAGE = "http://search.cpan.org/~smueller/ExtUtils-CppGuess/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/ExtUtils-CppGuess-${PV}.tar.gz"
+SRC_URI[md5sum] = "350dd7c661189ea770d6c9354ebbc6c2"
+SRC_URI[sha256sum] = "1cd83ee8452351219b987c79ddb25cc25ee8c396318ba36c5211a92b5c87e7a8"
+
+S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
+
+inherit cpan_build
+
+do_install () {
+        cpan_build_do_install
+}
+
+RDEPENDS_${PN} = " perl-module-capture-tiny \
+                   perl-module-scalar-util \
+                   perl-module-io-file \
+                   perl-module-extutils-makemaker \
+                   perl-module-file-spec \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-file-temp \
+                   perl-module-lib \
+                   perl-module-build \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


