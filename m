Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 252A160167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:01 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id y10so343193pdj.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m9Irtc03lhMyAsRQI0Zt0wbGDI6VL96emGJSMzl5lbQ=;
	b=yjTRkGNTIn+8Wxy14BAnmkD6vhDYTUwurAjkhRq5PMj8N7p+DL6MgDWCPaDVq0CiDL
	2mcJ0uk4KRXdvtbX6oddBet0Uy/qTznkWu+eu+b/Y1LywELSzVk4PE/W+dvi6L4ZXc1A
	WUBrHJkGbb/EhsS52mroqNTgFizfZN6sVcKq3x4WFUUnzDWWc9H6s9h4YAiB23IbnR/8
	WyqYX3LtBtI5MVGCmuWoGiOjugFCDu+8O2ElZ13cEYH16ompsKNS3QLRV0Kuxw+LBpBI
	nLTUSMy8L5Rtj6YZtnYkOaSE0hW8TVdMYi9rjA6R7f5jXrvr7iomtjbTRoo9v9D5X9E6
	+oNg==
X-Received: by 10.66.163.2 with SMTP id ye2mr13052659pab.110.1399428482603;
	Tue, 06 May 2014 19:08:02 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:01 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:18 -0700
Message-Id: <1399428565-30499-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 2/9] libcapture-tiny-perl: add 0.23
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
X-List-Received-Date: Wed, 07 May 2014 02:08:04 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
Capture::Tiny provies a simple, portable way to capture
almost anything sent to STDOUT or STDERR, regardless of whether it comes
from Perl, from XS code or from an external program. Optionally, output
can
be teed so that it is captured while being passed through to the
original
filehandles. Yes, it even works on Windows (usually). Stop guessing
which of
a dozen capturing modules to use in any particular situation and just
use
this one.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libcapture/libcapture-tiny-perl_0.23.bb        | 36 ++++++++++++++++++++++
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
1.8.3.2


