Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id E90B76E987
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:42 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so6694221pab.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nvWIpUD9+DYDUnLiMiLcaiKqzhvy8RFfVS9xHqLxOWI=;
	b=auOkyAnEz4OrToPmeJbQ1fsy1Hu82XIzmCpeeMCvaItW0hWyCMjUFDJdDaeYB9Ac8M
	CoMERbJPHhLcvqM5WICCK+XYseP4PBqIaVKofVic2esGG7mXSs+0ElYIxJbpQiJJ+b39
	vqJB56HNsnObYavNxnDoxZvxsiUZUrucdYOjvQOl/SaOytwMnBxIvdMCFkuN1EEO2QAx
	wpgMEROJmTVzFTXF59ljW6AiyJFekjO3WS+zrp+y10ngIUGlRdJJdzGTpA+f6PUNNrSk
	XLxO3zuHTVSBX+TS0nwuCPIthgm/dqJ2TdqLZCdCY3F8FVIaVPjym8hvJRpcyRlzXmN7
	EQNg==
X-Received: by 10.68.108.194 with SMTP id hm2mr35918287pbb.22.1391410243563;
	Sun, 02 Feb 2014 22:50:43 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:11 -0800
Message-Id: <1391410275-31251-7-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 06/10] libextutils-helpers-perl: add 0.021
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:43 -0000

[Description from CPAN]
This module provides various portable helper function for
module building modules.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libextutils/libextutils-helpers-perl_0.021.bb  |   29 ++++++++++++++++++++
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
1.7.9.5


