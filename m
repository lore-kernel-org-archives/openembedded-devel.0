Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f51.google.com (unknown [209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id B976165D1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:49:07 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id ma3so1158282pbc.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RZ3MsplcRG19h7JLg6efx1oKTlvw6NfCLOmjsov1jUs=;
	b=UVxAWRU5eWKDug4GPhLUQCehhPq5LBGuiOVaKsXA6mknzcsf0TgL9IT4hgDETic56G
	kKTTeBFfnNf0fZKmCzZy1eYDu5gEmBoYsNZJmPSO3lF8/lE3EqGVcgHbop5ypjnHTPYw
	17hOzDadN2kybnjYDVWIAX+xqt3g1RQHtB/STNR/tMI0K7qu1SOpKh6/LNresKhHS4bX
	3myLoBhi9kRogSGMFKGccJJfvGp/hlWm49NtPFfw14Mg3IDWc1EKZmLG/aj6sfSX3Ay4
	EQ7ALy4/jdwrhgyVXoAq30zECrLM3lxbq0u35WeYHtVBC9x2mm+VFKRJ3LDTmT919d75
	6gSw==
X-Received: by 10.68.139.137 with SMTP id qy9mr56233883pbb.11.1400658105603;
	Wed, 21 May 2014 00:41:45 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:44 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:35 -0700
Message-Id: <1400658223-15804-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 02/10] libcapture-tiny-perl: add 0.24
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
X-List-Received-Date: Wed, 21 May 2014 07:49:07 -0000

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

* Add ${CPAN_MIRROR} option

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libcapture/libcapture-tiny-perl_0.24.bb        | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb
new file mode 100644
index 0000000..0237485
--- /dev/null
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.24.bb
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
+SRC_URI[md5sum] = "718e9d62c4a27a3207cf8506cb99d846"
+SRC_URI[sha256sum] = "9bcf6f8472f8ea50401536cb070ac0c7770837d155c4d6abe212759863aae065"
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


