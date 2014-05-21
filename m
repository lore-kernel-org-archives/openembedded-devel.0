Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2C36610F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:41:58 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so1148394pab.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CyMpg2VpTTCEgrEojDysN25vSuGmjEpkBRBPyema7oQ=;
	b=bmL8uCXNrxbLn1zGyzUjnwtL1rQ9DHhtA8OrqttRtuvK0c5ryvoDTgEbRv28iChCS1
	uJ86RXEpBn5EGnxjOI478Gr7xjVeqCd1WWuFjuS3NwcPKQle8aEq2oQ7iqy4/Z0R7gqQ
	UX3iBGHsI27AZ7FyC65/Gp8BmcUKImg+PUBVO97oaDXowYat9lZpszGTuO8dzysWqt4D
	LbxEfb4bAFFEWiQKGwgFBAkifkHfejfV1hD/XJ5yaFC6LOMZ8ManoOcDKG9Xc1togRA0
	4IhzDUXGASVVUokJFgEZkzF2eBvVrkuNGXcxO/zsxcoyA/Hf2OEYTOtXsQQoJP1Wt/tC
	sJyQ==
X-Received: by 10.66.122.208 with SMTP id lu16mr55891551pab.129.1400658120103; 
	Wed, 21 May 2014 00:42:00 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:58 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:41 -0700
Message-Id: <1400658223-15804-9-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 08/10] libextutils-cppguess-perl: add 0.07
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
X-List-Received-Date: Wed, 21 May 2014 07:42:00 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
ExtUtils::CppGuess attempts to guess the system's C++
compiler that is compatible with the C compiler that your perl was built
with.

* Add ${CPAN_MIRROR} option

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils/libextutils-cppguess-perl_0.07.bb  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.07.bb
new file mode 100644
index 0000000..47e0904
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
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/ExtUtils-CppGuess-${PV}.tar.gz"
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
1.8.3.2


