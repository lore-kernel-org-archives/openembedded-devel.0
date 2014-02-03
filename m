Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2736E937
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:36 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj1so6727926pad.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+UUbUMtT456hgzhslKBqyrSSB1I8EzZ5F3AiDJmAV6o=;
	b=gRziBlG6+gidE7qiIaR5kUSuuUPsGo4mgowU8u1riegcBm3NdXGkwlS6THwd/LRkaY
	B4agiNJIiVlmid6cyWcv0m6RjTTrhSWp5O7zHwm8ncl5izt3bf4RZt++SCsnx17gadlv
	VmaBDPKK77x44D+qHgpcGYvhLJaDcyoyvfnUr3Hzi4LoE0qqnCA067ynDmfl8YAxuB6+
	09u9v99NBfejLELNbzOzU8BRFwYJ5xk6apPX09Ozv+W15Yj/DDQlKDiXsJf0ptX1qGpi
	Vre0r1zP0Ydp/+1IxnOJSdrNu17J61JD7XdceqbTNtskVFyu0GoxB/mF02s18T2xGpBX
	MtGA==
X-Received: by 10.66.65.134 with SMTP id x6mr35022705pas.12.1391410237381;
	Sun, 02 Feb 2014 22:50:37 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:36 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:08 -0800
Message-Id: <1391410275-31251-4-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 03/10] libcapture-tiny-perl: add 0.23
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:36 -0000

[Description from CPAN]
Capture::Tiny provies a simple, portable way to capture
almost anything sent to STDOUT or STDERR, regardless of whether it comes
from Perl, from XS code or from an external program. Optionally, output can
be teed so that it is captured while being passed through to the original
filehandles. Yes, it even works on Windows (usually). Stop guessing which of
a dozen capturing modules to use in any particular situation and just use
this one.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libcapture/libcapture-tiny-perl_0.23.bb        |   36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.23.bb

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.23.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.23.bb
new file mode 100644
index 0000000..b2f1ff9
--- /dev/null
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.23.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Capture::Tiny - Capture STDOUT and STDERR from Perl, XS or external programs."
+DESCRIPTION = "Capture::Tiny provies a simple, portable way to capture \
+almost anything sent to STDOUT or STDERR, regardless of whether it comes \
+from Perl, from XS code or from an external program. Optionally, output can \
+be teed so that it is captured while being passed through to the original \
+filehandles. Yes, it even works on Windows (usually). Stop guessing which of \
+a dozen capturing modules to use in any particular situation and just use \
+this one."
+SECTION = "libs"
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


