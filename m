Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7C93C60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:07 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so369672pab.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QhHtxi3rxFKwn8QiQEWs0L6744ME1Ty77nkkf3x19FA=;
	b=BeV/zs4Ky7aiWpqEomPwPSZPbOsDnGg+QOnRE2afmUrbJOYZU1ghS8IYQHdkHuDu0E
	y+L7TLRt+AvvkpIoRlbMYDNIeoBwVgjyFBZYBWsc9MU2aVGhFvU/kn4g3pZJpxTV7HWt
	4DJig5XsQRGv8MmXfgLRnYFmTpuv0+YORgkh7RJOx9jsBgaJWD5kHJbXxWeiQ8xunjtw
	BZZ3OOty0go1hLjPhjh15LohveKVvjgE4k8fRSxKuz70RmVGUQB4XUEqaLrEKa3xvvsA
	oMD91e6SwSof/oDWsCrE1GlvIsMaiFrSrKZ1/gU+1hRMhqCoUHYRbxqgh9CnXKhJPStq
	hM8A==
X-Received: by 10.66.180.34 with SMTP id dl2mr13111632pac.124.1399428488536;
	Tue, 06 May 2014 19:08:08 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:07 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:21 -0700
Message-Id: <1399428565-30499-6-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 5/9] libextutils-helpers-perl: add 0.021
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
X-List-Received-Date: Wed, 07 May 2014 02:08:08 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
This module provides various portable helper function for
module building modules.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils/libextutils-helpers-perl_0.021.bb  | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.021.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.021.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.021.bb
new file mode 100644
index 0000000..20f3283
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.021.bb
@@ -0,0 +1,29 @@
+SUMMARY = "ExtUtils::Helpers - Various portability utilities for module builders"
+DESCRIPTION = "This module provides various portable helper function for module building modules."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Helpers/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=307057ce232899f5caa8858560c7274b"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
+SRC_URI[md5sum] = "94aa8eaf92def26d9af0cb25fcb1570f"
+SRC_URI[sha256sum] = "26b85077f4197b30e62ffec87d3f78111522619d62858d2ab45a64687351892a"
+
+S = "${WORKDIR}/ExtUtils-Helpers-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-file-copy \
+                   perl-module-extutils-makemaker \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-test-more \
+                   perl-module-text-parsewords \
+                   perl-module-module-load \
+                   perl-module-file-temp \
+                   perl-module-file-spec-functions \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


