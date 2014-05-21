Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f48.google.com (unknown [209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0E815660F6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:41:50 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so1157262pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 00:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g2VXv1M//M+1wkgHj3CVf7AWkfkNRNhDeTSFxp/qGts=;
	b=G7YiM05DeSqfUGUHmNwsUbS7tRZ2vlkUNiBdm24zEOJwMOWAJ70roYGU9KqOF8VZpj
	tkfFkZiHEjTCcs2A3w7kC6pTMRCHSMVzZr20PfAzuaELnvwFa+WyvQtmTo1BJlOveAiH
	zU4zmjqmIGeWe7tc//0YlpZoy/tcrTFuez/9D3NaRP247fLHjzH6n0k1HQCWz/H1FnuM
	aNZi8j5/NzqSEqq4yTPWSgolb6gRjrALb88Al5WwDOj9aaXu2iDHcAvrsdGyxXX8zIGk
	erC6M1o0agkorvwIs7UKRKuI6sCoKA0yCsR6lsMSRCsYMFoQv9BM1gqN4YUTNrAxkrcy
	rpcg==
X-Received: by 10.68.194.229 with SMTP id hz5mr56065969pbc.91.1400658112083;
	Wed, 21 May 2014 00:41:52 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id it4sm6669337pbc.39.2014.05.21.00.41.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 00:41:50 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 00:43:38 -0700
Message-Id: <1400658223-15804-6-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v4 05/10] libextutils-helper-perl: add 0.022
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
X-List-Received-Date: Wed, 21 May 2014 07:41:51 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
This module provides various portable helper function for
module building modules.

* Add ${CPAN_MIRROR} option

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libextutils/libextutils-helpers-perl_0.022.bb  | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
new file mode 100644
index 0000000..055f571
--- /dev/null
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.022.bb
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
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
+SRC_URI[md5sum] = "cf4fd6f8caa6daac33b1111c9e93162b"
+SRC_URI[sha256sum] = "d3f8cf700fb3414ca1260089755cbf64041455e4b744110677b1ba5bb9a3aa95"
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


