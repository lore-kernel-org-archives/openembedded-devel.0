Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2026E92E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:48 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id kl14so6772649pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j+Atekg/tdyszET3AbDLMidpcGUiQcDJ2Dzt8wp3BJc=;
	b=hRQj6iPyXnwaypopS8hWOMcm0Z7cMA3cSGuXDdiuhOW9QvjQg5UBXGSLMfw4WPl5xw
	UG8F8r2MNevPxczaxS9DrRnbqbkifJ/Yi7yOniDB/LbQ8oDAgUwXjbWD1HR9xBDM6//I
	Ux+KQ3lZtdPD5l75RlbL7QlUkNbBguGA97zh0M0eigdjtgqTICuo+oxdChOhrjtBOHwh
	4ChDLzBC3uZKJ7jDoax1QXZWz2NgyqWAixiFu/hTPoKsJgPYtzBVLnBs67VJAadCdA4I
	TeJAOBQssPIpLwky9Qpkf/TtH1GQd4H0zJvcZpeFsPtRPLzgECQqSMTDg6zI4NkXHG0f
	NR7A==
X-Received: by 10.68.197.234 with SMTP id ix10mr35262363pbc.80.1391410249464; 
	Sun, 02 Feb 2014 22:50:49 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:48 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:14 -0800
Message-Id: <1391410275-31251-10-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 09/10] libextutils-cppguess-perl: add 0.07
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:48 -0000

[Description from CPAN]
ExtUtils::CppGuess attempts to guess the system's C++
compiler that is compatible with the C compiler that your perl was built
with.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libextutils/libextutils-cppguess-perl_0.07.bb  |   38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
new file mode 100644
index 0000000..0e5e304
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
@@ -0,0 +1,38 @@
+SUMMARY = "ExtUtils::CppGuess - guess C++ compiler and flags"
+DESCRIPTION = "ExtUtils::CppGuess attempts to guess the system's C++ \
+compiler that is compatible with the C compiler that your perl was built \
+with. \
+It can generate the necessary options to the Module::Build constructor or \
+to ExtUtils::MakeMaker's WriteMakefile function."
+SECTION = "libs"
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
+RDEPENDS_${PN} = " libcapture-tiny-perl \
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


