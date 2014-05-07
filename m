Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id AE7D160DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:13 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so351755pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lmCgHtkDjTUAe6LCWTkyGXpRNxIRz4z/hwJa72h4wJs=;
	b=Gewg7z5Q3hvAkE5d1LB2bVQUPIzA6NAoPu7Bsu2RxR4DFm6PIRulUsgDZ6YhHmogIS
	G1GgbrrcqwRNRLQfROL6Yflh0LKk85L3DRaDKtAvaaZysdO8IL6o87AVXFzR81iUKd37
	Yf3mufHT1fQPLz6l+L499mODEvq0ctEtcpoyRaAGSmcrOVFQ/P2eQmP0/TmGmsZSpLsu
	LbSThh7kznw/QELdqKdY7ta5FRaCRJlv4u63JxJgFJpB77MtOku3hqLAD156jfzQgv7F
	JC3HrGkO9yeguY8spm2fc7hrgM1CkKtPJlhudLbqrFpwqP2odwF8zNm3towuaUiglFWz
	Td0Q==
X-Received: by 10.66.231.105 with SMTP id tf9mr13132075pac.84.1399428494718;
	Tue, 06 May 2014 19:08:14 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:13 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:24 -0700
Message-Id: <1399428565-30499-9-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 8/9] libextutils-cppguess-perl: add 0.07
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
X-List-Received-Date: Wed, 07 May 2014 02:08:13 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
ExtUtils::CppGuess attempts to guess the system's C++
compiler that is compatible with the C compiler that your perl was built
with.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils/libextutils-cppguess-perl_0.07.bb  | 38 ++++++++++++++++++++++
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
1.8.3.2


