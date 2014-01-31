Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id ED5AC6EADC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:24 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rq2so4508729pbb.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uLuTezVQ1Az0Eyj5oya/IYXTE4TLUwX3jU5PS88jCtc=;
	b=Csn+ydTKQAMc2oaL/IbKBwMTkzA/fcFUAzG7uOjQC3LY5kUELI3ovPhScB+3yuBqZG
	sEXzWg80mf7mx5sGd5EL9GaxxFwEqvZlSZ+L3InCWyEdDk45PXI0KMWRceeDX6XFaMTm
	4XTEnVcTZQ1J9o2OWplfT4MI3HAHySWE5mfiwQuKKAwvWUMKe5C0RZgjjmi7ESIOZFT1
	PGJJd+cn1ht0Byz/FyEf8gzFpGvQk+U3j5WAgtdL36qMCHJZF4Z3TEJvRLFf6zIoA3ED
	BKwdbJ5bSfB+x4bYLcqSGkeoIO/fIgut8cM3eBd5NC7nHi5oRclQElGew5HRwTgBkNXz
	tr+g==
X-Received: by 10.66.179.143 with SMTP id dg15mr21528187pac.52.1391181086152; 
	Fri, 31 Jan 2014 07:11:26 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:34 -0800
Message-Id: <1391181100-32525-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH 3/9] perl-module-capture-tiny: add 0.23
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:25 -0000

[Description from CPAN]
Capture::Tiny provides a simple, portable way to capture almost anything sent to STDOUT or STDERR, regardless of whether it comes from Perl, from XS code or from an external program. Optionally, output can be teed so that it is captured while being passed through to the original filehandles. Yes, it even works on Windows (usually). Stop guessing which of a dozen capturing modules to use in any particular situation and just use this one.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../capture-tiny/perl-module-capture-tiny_0.23.bb  |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-perl/recipes-perl/capture-tiny/perl-module-capture-tiny_0.23.bb

diff --git a/meta-perl/recipes-perl/capture-tiny/perl-module-capture-tiny_0.23.bb b/meta-perl/recipes-perl/capture-tiny/perl-module-capture-tiny_0.23.bb
new file mode 100644
index 0000000..0c4166d
--- /dev/null
+++ b/meta-perl/recipes-perl/capture-tiny/perl-module-capture-tiny_0.23.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Capture::Tiny - Capture STDOUT and STDERR from Perl, XS or external programs."
+DESCRIPTION = "Capture::Tiny provies a simple, portable way to capture \
+almost anything sent to STDOUT or STDERR, regardless of whether it comes \
+from Perl, from XS code or from an external program. Optionally, output can \
+be teed so that it is captured while being passed through to the original \
+filehandles. Yes, it even works on Windows (usually). Stop guessing which of \
+a dozen capturing modules to use in any particular situation and just use \
+this one."
+
+HOMEPAGE = "http://search.cpan.org/~dagolden/Capture-Tiny/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Capture-Tiny-${PV}.tar.gz"
+SRC_URI[md5sum] = "7c6f63671802d004c0df5dbcba93e5b4"
+SRC_URI[sha256sum] = "427814015824014b41f666c16afadab0ea551db946e494fdfbc59c44c9569bdf"
+
+S = "${WORKDIR}/Capture-Tiny-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-scalar-util \
+                   perl-module-io-file \
+                   perl-module-extutils-makemaker \
+                   perl-module-file-spec \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-test-more \
+                   perl-module-file-temp \
+                   perl-module-lib \
+                   perl-module-build \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


